from fastapi import FastAPI, Request, Form
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates
import mysql.connector
from starlette.middleware.sessions import SessionMiddleware
from fastapi.staticfiles import StaticFiles
from datetime import datetime
from typing import List
from mysql.connector import Error
import pytz
from fastapi import Depends
from fastapi import APIRouter, HTTPException
from fastapi.responses import RedirectResponse
from fastapi import Request
from datetime import date
from fastapi import FastAPI, Request
from fastapi.responses import RedirectResponse
import mysql.connector
from datetime import date
from fastapi.responses import FileResponse
from fastapi import UploadFile, Form
import pandas as pd
from fastapi import FastAPI, Query, Request
import shutil
from fastapi.responses import HTMLResponse
from fastapi import FastAPI, Request, Path
from passlib.context import CryptContext
from typing import Optional
from fastapi import FastAPI, Request, Form, HTTPException
from fastapi.responses import JSONResponse
import os, uuid
from pydantic import BaseModel
from typing import Optional
from datetime import datetime
import pytz
from fastapi import FastAPI, Request, Form, UploadFile, File, Depends, HTTPException
from fastapi import FastAPI, UploadFile, File, Form, Request
import os
from fastapi.responses import RedirectResponse
from fastapi.staticfiles import StaticFiles

import os
UPLOAD_DIR = "static/uploads"

app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")
tz = pytz.timezone("Europe/Istanbul")
now = datetime.now(tz)  # Türkiye saatinde datetime
app.add_middleware(SessionMiddleware, secret_key="YOUR_SECRET_KEY")


# MySQL bağlantısı
# Şifreleme için
pwd_context = CryptContext(schemes=["argon2"], deprecated="auto")
def get_db_connection():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="admin",
        password="Mcka199090@@",
        database="jobtracking"
    )
    
# Pydantic model
class CustomerUpdate(BaseModel):
    id: int
    full_name: Optional[str] = None
    company: Optional[str] = None
    email: Optional[str] = None
    phone: Optional[str] = None
    code: Optional[str] = None
    website: Optional[str] = None
    odasicil: Optional[str] = None
    sgksicil: Optional[str] = None
    efaturaportal: Optional[str] = None
    earsivportal: Optional[str] = None
    isyeriadres: Optional[str] = None
    evadres: Optional[str] = None
    vergidairesi: Optional[str] = None
    tc: Optional[str] = None
    edevletsifre: Optional[str] = None
    gib: Optional[str] = None
    isebaslamatarihi: Optional[str] = None
    sgkmudurulugu: Optional[str] = None
    sgksifre: Optional[str] = None
    istelefon: Optional[str] = None
    tabela :Optional[str] = None
    malimuhur :Optional[str] = None


################### AUTH CONTROLLER #########################

@app.get("/login")
def login_page(request: Request):
    return templates.TemplateResponse("login.html", {"request": request, "error": None})

@app.post("/login")
def login(request: Request, username: str = Form(...), password: str = Form(...)):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE username=%s", (username,))
    user = cursor.fetchone()
    cursor.close()
    db.close()

    if user and pwd_context.verify(password, user['password']):
        # şifre doğru
        request.session['user'] = {
            "id": user['id'],
            "username": user['username'],
            "type": user['type']
        }
        return RedirectResponse(url="/", status_code=303)
    else:
        # kullanıcı yok veya şifre yanlış
        return templates.TemplateResponse(
            "login.html",
            {"request": request, "error": "Kullanıcı adı veya şifre hatalı!"}
        )

@app.get("/logout")
def logout(request: Request):
    request.session.clear()
    return RedirectResponse(url="/login", status_code=303)


################### HOME CONTROLLER #########################

@app.get("/")
def home(request: Request):
    # Kullanıcı login değilse login sayfasına yönlendir
    if "user" not in request.session:
        return RedirectResponse(url="/login")
    
    user_id = request.session['user']['id']
    today = date.today().strftime('%Y-%m-%d')

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Status 1 olan iş sayısı
    cursor.execute("SELECT COUNT(*) AS count FROM jobs WHERE status = 1")
    status_1_count = cursor.fetchone()['count']

    # Status 0 olan iş sayısı
    cursor.execute("SELECT COUNT(*) AS count FROM jobs WHERE status = 0")
    status_0_count = cursor.fetchone()['count']

    # Bugünün işleri
    cursor.execute("""
        SELECT 
            j.*,
            GROUP_CONCAT(u.name SEPARATOR ',') AS assigned_user_names,
            c.code AS customer_code
        FROM jobs j
        LEFT JOIN job_users ju ON j.id = ju.job_id
        LEFT JOIN users u ON u.id = ju.user_id
        LEFT JOIN customers c ON j.customer_id = c.id
        WHERE j.target_date = %s
        GROUP BY j.id
        ORDER BY j.target_date ASC
    """, (today,))
    today_jobs = cursor.fetchall()

    # GÜNÜ GEÇMİŞ işler
    tz = pytz.timezone("Europe/Istanbul")
    today = datetime.now(tz).date()  # Türkiye saatine göre bugünün tarihi

    cursor.execute("""
        SELECT 
            j.*,
            GROUP_CONCAT(u.name SEPARATOR ',') AS assigned_user_names,
            c.code AS customer_code
        FROM jobs j
        LEFT JOIN job_users ju ON j.id = ju.job_id
        LEFT JOIN users u ON u.id = ju.user_id
        LEFT JOIN customers c ON j.customer_id = c.id
        WHERE j.status = 1 AND j.target_date < %s
        GROUP BY j.id
        ORDER BY j.target_date ASC
    """, (today,))
    past_jobs = cursor.fetchall()

    # Üzerime atanmış işler
    cursor.execute("""
        SELECT j.*, u.name AS assigned_user_name, c.code AS customer_code
        FROM jobs j
        JOIN job_users ju ON j.id = ju.job_id
        JOIN users u ON u.id = ju.user_id
        LEFT JOIN customers c ON j.customer_id = c.id
        WHERE ju.user_id = %s
        AND j.status = 1
    """, (user_id,))

    assigned_jobs = cursor.fetchall()


    # Üzerime atanmış iş sayısı
    cursor.execute("""
        SELECT COUNT(*) AS count
        FROM jobs j
        JOIN job_users ju ON j.id = ju.job_id
        WHERE ju.user_id = %s
    """, (user_id,))
    user_jobs_count = cursor.fetchone()['count']

    # Kullanıcının reminders kayıtları
    cursor.execute("""
        SELECT *
        FROM reminders
        WHERE user_id = %s
        ORDER BY due_date ASC
    """, (user_id,))
    reminders = cursor.fetchall()

    current_date = date.today().strftime("%d.%m.%Y")

    cursor.close()
    conn.close()
    
    return templates.TemplateResponse(
        "index.html",
        {
            "request": request,
            "user": request.session['user'],
            "current_date": current_date,
            "status_1_count": status_1_count,
            "status_0_count": status_0_count,
            "today_jobs": today_jobs,
            "overdue_jobs": past_jobs,    # <<< EKLENDİ
            "assigned_jobs": assigned_jobs,
            "user_jobs_count": user_jobs_count,
            "reminders": reminders,
        }
    )



################### USER CONTROLLER #########################

# Users sayfası (GET)
@app.get("/users", name="users")
async def users(request: Request):
    # Session kontrolü
    user = request.session.get("user")
    if not user or user.get("type") != 1:
        return RedirectResponse("/")  # Yetkisiz veya session yoksa anasayfaya yönlendir

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users ORDER BY username ASC")  # Alfabetik sıra
    users_list = cursor.fetchall()
    cursor.close()
    conn.close()

    return templates.TemplateResponse("users.html", {"request": request, "users": users_list})

@app.post("/users/add", name="users_add")
async def users_add(
    request: Request,
    username: str = Form(...),
    name: str = Form(...),
    password: str = Form(...)
):
    # Session kontrolü
    user = request.session.get("user")
    if not user or user.get("type") != 1:
        return RedirectResponse("/")  # Yetkisiz veya session yoksa anasayfaya yönlendir

    # Şifreyi hashle
    hashed_password = pwd_context.hash(password)

    # Veritabanına ekle
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO users (username, name, password) VALUES (%s, %s, %s)",
        (username, name, hashed_password)
    )
    conn.commit()
    cursor.close()
    conn.close()

    # POST işleminden sonra sayfayı yenile
    return RedirectResponse(url="/users", status_code=303)

@app.post("/users/update")
async def update_user(
    id: int = Form(...),
    username: str = Form(...),
    name: str = Form(...),
    password: str = Form("")
):
    conn = get_db_connection()
    cursor = conn.cursor()

    if password:
        # bcrypt sınırını aşmamak için şifreyi 72 karakter ile sınırla
        safe_password = password[:72]
        hashed_password = pwd_context.hash(password)
        cursor.execute("""
            UPDATE users
            SET username=%s, name=%s, password=%s
            WHERE id=%s
        """, (username, name, hashed_password, id))
    else:
        cursor.execute("""
            UPDATE users
            SET username=%s, name=%s
            WHERE id=%s
        """, (username, name, id))

    conn.commit()
    cursor.close()
    conn.close()

    # Başarılı güncelleme sonrası query param ile yönlendir
    return RedirectResponse(url="/users?update=success", status_code=303)


################### CUSTOMERS CONTROLLER #########################

@app.post("/api/customers/update")
async def update_customer(data: CustomerUpdate):
    conn = get_db_connection()
    if conn is None:
        raise HTTPException(status_code=500, detail="Veritabanına bağlanılamadı")

    try:
        cursor = conn.cursor()

        # Dinamik alan güncelleme
        fields = []
        values = []

        for key, value in data.dict().items():
            if key != "id" and value is not None:
                fields.append(f"{key}=%s")
                values.append(value)

        if not fields:
            raise HTTPException(status_code=400, detail="Güncellenecek veri yok")

        values.append(data.id)
        sql = f"UPDATE customers SET {', '.join(fields)} WHERE id=%s"

        cursor.execute(sql, values)
        conn.commit()

        if cursor.rowcount == 0:
            raise HTTPException(status_code=404, detail="Müşteri bulunamadı")

        return {"message": "Müşteri bilgileri başarıyla güncellendi"}

    except Exception as e:  # <-- Burayı değiştir
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@app.get("/customers", name="customers")
async def customers(request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM customers ORDER BY code ASC")  # name sütununa göre alfabetik
    customers_list = cursor.fetchall()
    cursor.close()
    conn.close()
    
    return templates.TemplateResponse("customers.html", {
        "request": request,
        "customers": customers_list
    })


@app.get("/customers/add")
async def customer_add_get(request: Request):
    return templates.TemplateResponse("customers_add.html", {"request": request})

@app.post("/customers/add")
async def customer_add_post(
    request: Request,
    full_name: str = Form(...),
    company: str = Form(...),
    email: str = Form(""),
    phone: str = Form(""),
    status: int = Form(...),
    code: str = Form(...)
):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO customers (full_name, company, email, phone, status,code) VALUES (%s, %s, %s, %s, %s ,%s)",
        (full_name, company, email, phone, status,code)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return RedirectResponse(url="/customers", status_code=303)

@app.get("/customer/{customer_id}/jobs", response_class=HTMLResponse)
def customer_jobs(request: Request, customer_id: int = Path(..., description="Müşteri ID")):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    try:
        # 1️⃣ Jobs + atanan kullanıcılar
        sql_jobs = """
            SELECT 
                j.*,
                COALESCE(
                    (SELECT GROUP_CONCAT(u.name SEPARATOR ',')
                     FROM job_users ju
                     JOIN users u ON u.id = ju.user_id
                     WHERE ju.job_id = j.id
                    ), 'Atanmamış') AS assigned_user_names
            FROM jobs j
            WHERE j.customer_id = %s
            ORDER BY j.target_date ASC
        """
        cursor.execute(sql_jobs, (customer_id,))
        jobs = cursor.fetchall()

        # 2️⃣ Faaliyet raporları + personel adı
        sql_reports = """
            SELECT 
                f.*,
                COALESCE(
                    (SELECT u.username 
                     FROM users u
                     WHERE u.id = f.user_id
                    ), 'Atanmamış') AS user_name,
                c.company
            FROM faaliyet_raporu f
            LEFT JOIN customers c ON c.id = f.customer_id
            WHERE f.customer_id = %s
            ORDER BY f.tarih DESC, f.saat DESC
        """
        cursor.execute(sql_reports, (customer_id,))
        reports = cursor.fetchall()

        # 3️⃣ Müşteri bilgisi
        cursor.execute("SELECT * FROM customers WHERE id = %s", (customer_id,))
        customer = cursor.fetchone()

    finally:
        cursor.close()
        conn.close()

    return templates.TemplateResponse(
        "customer_jobs.html",
        {
            "request": request,
            "jobs": jobs,
            "reports": reports,
            "customer": customer
        }
    )





################### JOBS CONTROLLER #########################



@app.get("/job_list")
async def job_list(request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Açık işler (status = 1)
    cursor.execute("""
        SELECT
            j.id AS job_id,
            j.title,
            j.target_date,
            j.created_at AS job_created_at,
            j.status,
            c.code AS customer_code,
            c.company AS customer_company,
            GROUP_CONCAT(u.name SEPARATOR ', ') AS assigned_users,
            EXISTS (SELECT 1 FROM job_details jd WHERE jd.job_id = j.id) AS has_details
        FROM jobs j
        LEFT JOIN customers c ON j.customer_id = c.id
        LEFT JOIN job_users ju ON j.id = ju.job_id
        LEFT JOIN users u ON ju.user_id = u.id
        WHERE j.status = 1
        GROUP BY j.id, j.title, j.target_date, j.created_at, j.status, c.code, c.company
        ORDER BY j.created_at DESC;
    """)
    open_jobs = cursor.fetchall()

    # Tamamlanan işler (status = 0)
    cursor.execute("""
        SELECT
            j.id AS job_id,
            j.title,
            j.target_date,
            j.created_at AS job_created_at,
            j.status,
            c.code AS customer_code,
            c.company AS customer_company,
            GROUP_CONCAT(u.name SEPARATOR ', ') AS assigned_users,
            EXISTS (SELECT 1 FROM job_details jd WHERE jd.job_id = j.id) AS has_details
        FROM jobs j
        LEFT JOIN customers c ON j.customer_id = c.id
        LEFT JOIN job_users ju ON j.id = ju.job_id
        LEFT JOIN users u ON ju.user_id = u.id
        WHERE j.status = 0
        GROUP BY j.id, j.title, j.target_date, j.created_at, j.status, c.code, c.company
        ORDER BY j.created_at DESC;
    """)
    closed_jobs = cursor.fetchall()

    cursor.close()
    conn.close()

    return templates.TemplateResponse("job_list.html", {
        "request": request,
        "open_jobs": open_jobs,
        "closed_jobs": closed_jobs
    })


@app.get("/jobs")
async def jobs_page(request: Request, status: str = None, personnel: str = None, customer: str = None, search: str = None):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Temel SQL
    query = "SELECT j.id AS job_id, j.title, j.target_date, j.created_at AS job_created_at, j.status, " \
            "c.company AS customer_company, c.code AS customer_code, GROUP_CONCAT(u.name SEPARATOR ', ') AS assigned_users " \
            "FROM jobs j " \
            "LEFT JOIN customers c ON j.customer_id = c.id " \
            "LEFT JOIN job_users ju ON j.id = ju.job_id " \
            "LEFT JOIN users u ON ju.user_id = u.id " \
            "WHERE 1=1 "

    params = []

    # Filtreler
    if status:
        query += " AND j.status = %s"
        params.append(status)
    if personnel:
        query += " AND FIND_IN_SET(%s, (SELECT GROUP_CONCAT(u2.name) FROM job_users ju2 LEFT JOIN users u2 ON ju2.user_id = u2.id WHERE ju2.job_id=j.id))"
        params.append(personnel)
    if customer:
        query += " AND c.company LIKE %s"
        params.append(f"%{customer}%")
    if search:
        query += " AND (j.title LIKE %s OR c.company LIKE %s)"
        params.extend([f"%{search}%", f"%{search}%"])

    query += " GROUP BY j.id ORDER BY j.created_at DESC"

    cursor.execute(query, params)
    jobs = cursor.fetchall()

    cursor.close()
    conn.close()

    return templates.TemplateResponse("jobs.html", {
        "request": request,
        "jobs": jobs
    })

@app.get("/job/{job_id}", name="job_detail")
async def job_detail(job_id: int, request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # İş ve detayları
    cursor.execute("""
        SELECT 
            j.id AS job_id,
            j.title,
            j.target_date,
            j.created_at AS job_created_at,
            j.status,
            c.code AS customer_code,
            c.company AS customer_company,
            jd.id AS detail_id,
            jd.message AS detail_message,
            jd.created_at AS detail_created,
            jd.updated_at AS detail_updated,
            u_detail.name AS user_name,
            GROUP_CONCAT(u_assign.name SEPARATOR ', ') AS assigned_users
        FROM jobs j
        LEFT JOIN customers c ON j.customer_id = c.id
        LEFT JOIN job_details jd ON j.id = jd.job_id
        LEFT JOIN users u_detail ON jd.user_id = u_detail.id
        LEFT JOIN job_users ju ON j.id = ju.job_id
        LEFT JOIN users u_assign ON ju.user_id = u_assign.id
        WHERE j.id = %s
        GROUP BY j.id, j.title, j.target_date, j.created_at, j.status,
                 c.code, c.company, jd.id, jd.message, jd.created_at, jd.updated_at, u_detail.name
        ORDER BY jd.created_at DESC;
    """, (job_id,))
    job = cursor.fetchall()

    # Tüm kullanıcıları çek
    cursor.execute("SELECT id, name FROM users ORDER BY name;")
    users = cursor.fetchall()

    cursor.close()
    conn.close()

    return templates.TemplateResponse(
        "job_detail.html",
        {
            "request": request,
            "job": job,
            "users": users  # kullanıcı listesi template'e gönderildi
        }
    )

@app.post("/job/{job_id}/update_users", name="update_job_users")
async def update_job_users(job_id: int, assigned_users: List[str] = Form(...)):
    """
    Job için atanmış kullanıcıları güncelle.
    assigned_users: list of user_id (checkbox)
    """
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Önce mevcut atamaları temizle
        cursor.execute("DELETE FROM job_users WHERE job_id = %s", (job_id,))

        # Yeni atamaları ekle
        if assigned_users:
            values = [(job_id, int(user_id)) for user_id in assigned_users]
            cursor.executemany("INSERT INTO job_users (job_id, user_id) VALUES (%s, %s)", values)

        conn.commit()
    except Exception as e:
        conn.rollback()
        print("Hata:", e)
    finally:
        cursor.close()
        conn.close()

    # İş detay sayfasına yönlendir
    return RedirectResponse(f"/job/{job_id}", status_code=303)

@app.get("/job_create", name="job_create")
async def job_create(request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Users tablosundan kullanıcılar
    cursor.execute("""
        SELECT id, name
        FROM users
        WHERE id <> 8
        ORDER BY name
    """)
    users = cursor.fetchall()

    # Customers tablosundan müşteriler
    cursor.execute("SELECT id, company FROM customers ORDER BY company")
    customers = cursor.fetchall()

    cursor.close()
    conn.close()

    return templates.TemplateResponse(
        "job_create.html",
        {
            "request": request,
            "users": users,
            "customers": customers
        }
    )

@app.post("/job/add")
async def job_add(request: Request):
    form = await request.form()

    title = form.get("title")
    customer_id = form.get("customer_id")
    final_date = form.get("final_date")
    description = form.get("description")
    user_ids = form.getlist("user_ids")  # birden fazla kullanıcı seçimi

    # Türkiye saat dilimi
    istanbul_tz = pytz.timezone("Europe/Istanbul")
    created_at = datetime.now(istanbul_tz)

    conn = get_db_connection()
    cursor = conn.cursor()

    # 1️⃣ Job kaydını oluştur
    cursor.execute("""
        INSERT INTO jobs (title, customer_id, target_date, created_at)
        VALUES (%s, %s, %s, %s)
    """, (title, customer_id, final_date, created_at))
    conn.commit()

    job_id = cursor.lastrowid  # yeni job ID

    # 2️⃣ Seçilen her user_id için job_users tablosuna ekle
    for uid in user_ids:
        cursor.execute("""
            INSERT INTO job_users (job_id, user_id) VALUES (%s, %s)
        """, (job_id, uid))

    # 3️⃣ Açıklamayı job_details tablosuna ekle
    if description:
        cursor.execute("""
            INSERT INTO job_details (job_id, message,user_id, created_at)
            VALUES (%s, %s, %s, %s)
        """, (job_id, description, uid,created_at))

    conn.commit()
    cursor.close()
    conn.close()

    return RedirectResponse(url="/job_list", status_code=303)

@app.post("/job/{job_id}/add_detail")
async def add_job_detail(job_id: int, request: Request):
    form = await request.form()
    message = form.get("message")

    # session'dan giriş yapmış kullanıcı
    current_user = request.session.get("user")
    if not current_user:
        return RedirectResponse(url="/login", status_code=303)

    user_id = current_user["id"]

    if not message:
        return {"error": "Mesaj boş olamaz."}

    # Türkiye saati
    istanbul_tz = pytz.timezone("Europe/Istanbul")
    created_at = datetime.now(istanbul_tz)

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO job_details (job_id, user_id, message, created_at)
        VALUES (%s, %s, %s, %s)
    """, (job_id, user_id, message, created_at))

    conn.commit()
    cursor.close()
    conn.close()

    return RedirectResponse(url=f"/job/{job_id}", status_code=303)

@app.post("/job/details/update")
async def update_job_detail(request: Request):
    form = await request.form()
    detail_id = form.get("detail_id")
    message = form.get("message")

    # Kullanıcı session kontrolü
    current_user = request.session.get("user")
    if not current_user:
        return RedirectResponse(url="/login", status_code=303)

    # Türkiye saati
    istanbul_tz = pytz.timezone("Europe/Istanbul")
    updated_at = datetime.now(istanbul_tz)

    # Sadece kendi mesajını güncelle
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        UPDATE job_details
        SET message=%s, updated_at=%s
        WHERE id=%s AND user_id=%s
    """, (message, updated_at, detail_id, current_user["id"]))
    conn.commit()
    cursor.close()
    conn.close()

    # Geri yönlendirme
    return RedirectResponse(url=request.headers.get("referer", "/job_list"), status_code=303)


@app.post("/job/{job_id}/status")
async def update_job_status(job_id: int, request: Request, status: int = Form(...)):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        UPDATE jobs
        SET status=%s
        WHERE id=%s
    """, (status, job_id))
    conn.commit()
    cursor.close()
    conn.close()

    return RedirectResponse(url=f"/job/{job_id}", status_code=303)

# Termin tarihini güncelleyen endpoint
@app.post("/update_target_date/{job_id}")
async def update_target_date(job_id: int, target_date: str = Form(...)):
    # Veritabanı bağlantısını açalım
    conn = get_db_connection()
    cursor = conn.cursor()

    # Tarih formatını doğru şekilde almak için dönüştürme
    try:
        # Tarihi '%Y-%m-%d' formatında alıyoruz
        cursor.execute("""
            UPDATE jobs
            SET target_date = %s
            WHERE id = %s
        """, (target_date, job_id))

        conn.commit()  # Değişiklikleri kaydediyoruz

    except mysql.connector.Error as err:
        # Veritabanı hatası durumu
        conn.rollback()
        raise HTTPException(status_code=500, detail="Veritabanı hatası: " + str(err))

    finally:
        # Bağlantıyı kapatıyoruz
        cursor.close()
        conn.close()

    # Başarılı bir şekilde güncellendikten sonra, ilgili job sayfasına yönlendirme
    return RedirectResponse(url=f"/job/{job_id}", status_code=303)

@app.post("/job/{job_id}/update_title")
async def update_job_title(job_id: int, request: Request):
    data = await request.json()
    new_title = data.get("title")
    
    if not new_title:
        return JSONResponse({"error": "Başlık boş olamaz"}, status_code=400)
    
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("UPDATE jobs SET title=%s WHERE id=%s", (new_title, job_id))
        conn.commit()
    finally:
        cursor.close()
        conn.close()
    
    return JSONResponse({"success": True})

@app.get("/job/{job_id}/edit")
def edit_job(request: Request, job_id: int):
    cnx = get_db_connection()
    cursor = cnx.cursor(dictionary=True)

    cursor.execute("SELECT * FROM jobs WHERE job_id = %s", (job_id,))
    job = cursor.fetchall()

    cursor.execute("SELECT * FROM customers")
    customers = cursor.fetchall()

    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()

    cursor.close()
    cnx.close()

    if not job:
        return RedirectResponse("/job_list")

    return templates.TemplateResponse("edit-job.html", {
        "request": request,
        "job": job,
        "customers": customers,
        "users": users
    })


@app.post("/job/{job_id}/update")
def update_job(
    request: Request,
    job_id: int,
    title: str = Form(...),
    customer_id: int = Form(...),
    final_date: str = Form(...),
    description: str = Form(None),
    user_ids: List[int] = Form([]),
    author_id: int = Form(...)
):
    target_date = datetime.strptime(final_date, "%Y-%m-%d") if final_date else None

    cnx = get_db_connection()
    cursor = cnx.cursor()

    # 1️⃣ Jobs tablosunu güncelle
    cursor.execute("""
        UPDATE jobs
        SET title=%s, customer_id=%s, target_date=%s, description=%s
        WHERE job_id=%s
    """, (title, customer_id, target_date, description, job_id))

    # 2️⃣ Mevcut iş-personel atamalarını sil
    cursor.execute("DELETE FROM job_users WHERE job_id=%s", (job_id,))

    # 3️⃣ Yeni kullanıcıları ekle
    for uid in user_ids:
        cursor.execute("INSERT INTO job_users (job_id, user_id, is_read) VALUES (%s, %s, %s)", (job_id, uid, 0))

    cnx.commit()
    cursor.close()
    cnx.close()

    return RedirectResponse(f"/job/{job_id}/edit", status_code=303)



################### ACTIVITY CONTROLLER #########################

@app.get("/faaliyetraporu")
def faaliyet_raporu(request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Kullanıcı session kontrolü
    current_user = request.session.get("user")
    if not current_user:
        return RedirectResponse(url="/login", status_code=303)
    
    # Müşterileri çek
    cursor.execute("SELECT id, company FROM customers ORDER BY company")
    customers = cursor.fetchall()

    # Faaliyet raporları (ID'ye göre sıralanmış)
    cursor.execute("""
        SELECT fr.id, fr.tarih, fr.saat, fr.konu, fr.muhatap, fr.phone, 
               c.company, c.code, u.username AS user_name
        FROM faaliyet_raporu fr
        JOIN customers c ON fr.customer_id = c.id
        LEFT JOIN users u ON fr.user_id = u.id
        ORDER BY fr.tarih DESC
    """)
    reports = cursor.fetchall()

    # Kullanıcıları çek (dropdown)
    cursor.execute("SELECT id, username FROM users ORDER BY username")
    users = cursor.fetchall()

    cursor.close()
    conn.close()

    return templates.TemplateResponse(
        "faaliyet_rap.html",
        {
            "request": request,
            "customers": customers,
            "reports": reports,
            "users": users,
            "current_user": current_user,  # <-- Burada kullanıcı bilgisi mevcut
            "error": None
        }
    )



    
@app.post("/api/faaliyetraporu/add")
async def add_faaliyet(request: Request, 
                        tarih: str = Form(...), 
                        saat: str = Form(...),
                        customer_id: int = Form(...),
                        konu: str = Form(...),
                        muhatap: str = Form(...),
                        user_id: int = Form(...),
                        phone: str = Form(None)):  # Telefon numarası isteğe bağlı
    try:
        # Debug: Gelen veriyi loglama
        data = await request.form()
        print("Gelen Form Verisi: ", data)

        # Veritabanı bağlantısı
        conn = get_db_connection()
        cursor = conn.cursor()

        # Türkiye saat dilimini almak için
        tz = pytz.timezone("Europe/Istanbul")
        created_at = datetime.now(tz).strftime("%Y-%m-%d %H:%M:%S")

        # Gelen form verilerini ekrana yazdırma (debugging)
        print(f"Gelen veriler: {tarih}, {saat}, {customer_id}, {konu}, {muhatap}, {user_id}, {phone}")

        # SQL sorgusu (third_party_* alanları kaldırıldı)
        query = """
        INSERT INTO faaliyet_raporu 
        (tarih, saat, customer_id, muhatap, konu, phone, user_id, created_at)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """

        # Verileri veritabanına ekleme
        cursor.execute(query, (
            tarih, 
            saat, 
            customer_id, 
            muhatap, 
            konu, 
            phone, 
            user_id,
            created_at
        ))

        conn.commit()

        # Bağlantıları kapatma
        cursor.close()
        conn.close()

        # Başarı mesajı ve gelen veriyi yanıt olarak döndür
        return JSONResponse({
            "success": True,
            "message": "Kayıt başarıyla eklendi.",
            "data": {
                "tarih": tarih,
                "saat": saat,
                "customer_id": customer_id,
                "konu": konu,
                "muhatap": muhatap,
                "user_id": user_id,
                "phone": phone,
                "created_at": created_at
            }
        })

    except mysql.connector.Error as e:
        # Veritabanı hatası durumunda yanıt
        return JSONResponse({"success": False, "message": f"Veritabanı hatası: {str(e)}"})
    except Exception as e:
        # Genel hata durumunda yanıt
        return JSONResponse({"success": False, "message": f"Hata: {str(e)}"})


# 🟡 Kayıt güncelleme
@app.put("/api/faaliyetraporu/update/{id}")
async def update_faaliyet(
    id: int,
    tarih: str = Form(...),
    saat: str = Form(...),
    customer_id: int = Form(...),
    konu: str = Form(...),
    muhatap: str = Form(...),
    user_id: int = Form(...),
    phone: str = Form(None)
):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        query = """
        UPDATE faaliyet_raporu
        SET tarih=%s, saat=%s, customer_id=%s, muhatap=%s, konu=%s, phone=%s, user_id=%s
        WHERE id=%s
        """
        cursor.execute(query, (tarih, saat, customer_id, muhatap, konu, phone, user_id, id))
        conn.commit()

        if cursor.rowcount == 0:
            return JSONResponse({"success": False, "message": "Kayıt bulunamadı."})

        return JSONResponse({"success": True, "message": "Kayıt başarıyla güncellendi."})

    except mysql.connector.Error as e:
        return JSONResponse({"success": False, "message": f"Veritabanı hatası: {str(e)}"})
    finally:
        cursor.close()
        conn.close()

# 🔴 Kayıt silme
@app.delete("/api/faaliyetraporu/delete/{id}")
async def delete_faaliyet(id: int):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("DELETE FROM faaliyet_raporu WHERE id = %s", (id,))
        conn.commit()

        if cursor.rowcount == 0:
            return JSONResponse({"success": False, "message": "Kayıt bulunamadı."})

        return JSONResponse({"success": True, "message": "Kayıt başarıyla silindi."})

    except mysql.connector.Error as e:
        return JSONResponse({"success": False, "message": f"Veritabanı hatası: {str(e)}"})
    finally:
        cursor.close()
        conn.close()


################### REMINDER CONTROLLER #########################

@app.get("/reminders", response_class=HTMLResponse)
def reminders(request: Request):
    # Session'dan kullanıcı bilgisi al
    user = request.session.get("user")
    if not user:
        # Oturum yoksa login sayfasına yönlendir
        return RedirectResponse(url="/login", status_code=303)

    user_id = user['id']

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute("""
            SELECT *
            FROM reminders
            WHERE user_id = %s
            ORDER BY due_date ASC
        """, (user_id,))
        reminders = cursor.fetchall()
    finally:
        cursor.close()
        conn.close()

    return templates.TemplateResponse(
        "reminders.html",
        {"request": request, "reminders": reminders}
    )

@app.post("/reminders/add")
async def add_reminder(
    request: Request,
    title: str = Form(...),
    description: Optional[str] = Form(None),
    due_date: Optional[str] = Form(None)  # format: 'YYYY-MM-DDTHH:MM' (HTML datetime-local)
):
    # session'dan user_id al
    user = request.session.get("user")
    if not user:
        raise HTTPException(status_code=401, detail="Oturum açılmamış")

    user_id = user['id']

    if not title:
        raise HTTPException(status_code=400, detail="Başlık zorunludur.")

    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        if due_date:
            try:
                # "YYYY-MM-DDTHH:MM" -> datetime objesi
                due_datetime = datetime.strptime(due_date, "%Y-%m-%dT%H:%M")
            except ValueError:
                raise HTTPException(status_code=400, detail="Tarih formatı geçersiz. YYYY-MM-DDTHH:MM")
            
            sql = "INSERT INTO reminders (title, description, due_date, user_id) VALUES (%s, %s, %s, %s)"
            cursor.execute(sql, (title, description, due_datetime, user_id))
        else:
            sql = "INSERT INTO reminders (title, description, user_id) VALUES (%s, %s, %s)"
            cursor.execute(sql, (title, description, user_id))

        conn.commit()
        return JSONResponse({"success": True, "message": "Hatırlatıcı başarıyla eklendi."})
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@app.post("/reminders/{reminder_id}/status")
async def update_reminder_status(reminder_id: int, status: int = Form(...)):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        sql = "UPDATE reminders SET status = %s WHERE id = %s"
        cursor.execute(sql, (status, reminder_id))
        conn.commit()
        return JSONResponse({"success": True, "message": "Durum güncellendi."})
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()
        
@app.post("/reminders/{reminder_id}/update")
async def update_reminder(
    reminder_id: int,
    title: str = Form(...),
    description: str = Form(...),
    due_date: str = Form(None)  # frontend datetime-local gönderiyor
):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # datetime-local formatını MySQL timestamp formatına çevir
        due_date_value = None
        if due_date:
            # frontend'den gelen "YYYY-MM-DDTHH:MM" formatı
            due_date_value = datetime.strptime(due_date, "%Y-%m-%dT%H:%M")

        sql = """
            UPDATE reminders
            SET title=%s, description=%s, due_date=%s
            WHERE id=%s
        """
        cursor.execute(sql, (title, description, due_date_value, reminder_id))
        conn.commit()
        cursor.close()
        conn.close()

        return JSONResponse({"success": True, "message": "Hatırlatıcı başarıyla güncellendi."})
    except Exception as e:
        return JSONResponse({"success": False, "detail": str(e)})
    
@app.delete("/reminders/{reminder_id}/delete")
async def delete_reminder(reminder_id: int):
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute("DELETE FROM reminders WHERE id = %s", (reminder_id,))
        conn.commit()
    except Exception as e:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=500, detail=str(e))

    cursor.close()
    conn.close()
    return {"success": True, "message": "Hatırlatıcı silindi"}

# Konu listeleme
@app.get("/bilgi_bankasi")
async def bilgi_bankasi(request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT t.id, t.title, t.description, t.user_id, t.created_at, u.username "
                   "FROM topics t LEFT JOIN users u ON t.user_id = u.id ORDER BY t.created_at DESC")
    topics = cursor.fetchall()
    cursor.close()
    conn.close()
    return templates.TemplateResponse("bilgi_bankasi.html", {"request": request, "topics": topics})

# Konu ekleme
@app.post("/bilgi_bankasi/create")
async def create_topic(
    request: Request,
    title: str = Form(...),
    description: str = Form(...),
    user_id: int = Form(...),
):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO topics (title, description, user_id) VALUES (%s, %s, %s)",
            (title, description, user_id)
        )
        conn.commit()
    except Exception as e:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=500, detail=str(e))

    cursor.close()
    conn.close()

    # POST sonrası GET ile sayfayı yeniden yükle
    return RedirectResponse(url="/bilgi_bankasi", status_code=303)

# Konu güncelleme
@app.post("/bilgi_bankasi/{topic_id}/update")
async def update_topic(
    topic_id: int,
    title: str = Form(...),
    description: str = Form(...),
    user_id: int = Form(...)  # session’dan veya hidden input’tan geliyor
):
    conn = get_db_connection()
    cursor = conn.cursor()

    # Konuyu al ve kullanıcı kontrolü yap
    cursor.execute("SELECT user_id FROM topics WHERE id=%s", (topic_id,))
    topic = cursor.fetchone()
    if not topic:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=404, detail="Konu bulunamadı")
    
    if topic[0] != user_id:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=403, detail="Bu konuyu düzenleme yetkiniz yok")

    # Güncelleme
    try:
        cursor.execute(
            "UPDATE topics SET title=%s, description=%s WHERE id=%s",
            (title, description, topic_id)
        )
        conn.commit()
    except Exception as e:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=500, detail=str(e))

    cursor.close()
    conn.close()

    # Güncelleme sonrası listeye yönlendir
    return RedirectResponse(url="/bilgi_bankasi", status_code=303)
# Mesaj ekleme
@app.get("/bilgi_bankasi")
async def bilgi_bankasi_list(request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Konuları al, kullanıcı adıyla birlikte
    cursor.execute("""
        SELECT t.*, u.username AS created_by
        FROM topics t
        JOIN users u ON t.user_id = u.id
        ORDER BY t.created_at DESC
    """)
    topics = cursor.fetchall()

    cursor.close()
    conn.close()

    return templates.TemplateResponse(
        "bilgi_bankasi.html",
        {"request": request, "topics": topics}
    )


@app.get("/bilgi_bankasi/{topic_id}")
async def bilgi_bankasi_detail(topic_id: int, request: Request):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # 🔹 Konuyu al
    cursor.execute("""
        SELECT t.*, u.username 
        FROM topics t 
        JOIN users u ON t.user_id = u.id 
        WHERE t.id = %s
    """, (topic_id,))
    topic = cursor.fetchone()
    if not topic:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=404, detail="Konu bulunamadı")

    # 🔹 Mesajları al (en son mesaj en üstte)
    cursor.execute("""
        SELECT m.*, u.username 
        FROM messages m 
        JOIN users u ON m.user_id = u.id 
        WHERE m.topic_id = %s 
        ORDER BY id DESC
    """, (topic_id,))
    messages = cursor.fetchall()

    cursor.close()
    conn.close()

    return templates.TemplateResponse(
        "bilgi_bankasi_detay.html",
        {"request": request, "topic": topic, "messages": messages}
    )

@app.post("/bilgi_bankasi/{topic_id}/delete")
async def delete_topic(topic_id: int, request: Request):
    user_id = request.session.get("user", {}).get("id")
    if not user_id:
        return RedirectResponse("/login")

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Konuyu silmeden önce kullanıcının yetkisini kontrol et
    cursor.execute("SELECT user_id FROM topics WHERE id=%s", (topic_id,))
    topic = cursor.fetchone()
    if not topic or topic["user_id"] != user_id:
        cursor.close()
        conn.close()
        return RedirectResponse("/bilgi_bankasi")

    # Silme işlemi
    cursor.execute("DELETE FROM topics WHERE id=%s", (topic_id,))
    conn.commit()
    cursor.close()
    conn.close()

    return RedirectResponse("/bilgi_bankasi", status_code=303)


@app.post("/bilgi_bankasi/{topic_id}/message/{message_id}/edit")
async def edit_message(
    topic_id: int,
    message_id: int,
    request: Request,
    content: str = Form(...)
):
    user_id = request.session['user']['id']

    conn = get_db_connection()
    cursor = conn.cursor()
    # Sadece mesaj sahibi düzenleyebilir
    cursor.execute(
        "UPDATE messages SET content=%s WHERE id=%s AND user_id=%s",
        (content, message_id, user_id)
    )
    conn.commit()
    cursor.close()
    conn.close()

    return RedirectResponse(f"/bilgi_bankasi/{topic_id}", status_code=303)



@app.post("/bilgi_bankasi/{topic_id}/message/{message_id}/delete")
async def delete_message(topic_id: int, message_id: int, request: Request):
    user_id = request.session['user']['id']
    conn = get_db_connection()
    cursor = conn.cursor()

    # Sadece kendi mesajını silebilir
    cursor.execute("DELETE FROM messages WHERE id=%s AND user_id=%s", (message_id, user_id))
    conn.commit()
    cursor.close()
    conn.close()
    return RedirectResponse(f"/bilgi_bankasi/{topic_id}", status_code=303)

@app.post("/bilgi_bankasi/{topic_id}/messages")
async def add_message(
    topic_id: int,
    request: Request,
    content: str = Form(...),
    image: UploadFile | None = File(None)
):
    # Session'dan user_id al
    user = request.session.get("user")
    if not user:
        return RedirectResponse(url="/login", status_code=303)
    user_id = user["id"]

    # Upload klasörü
    UPLOAD_DIR = "static/uploads"
    os.makedirs(UPLOAD_DIR, exist_ok=True)

    file_path = None
    if image and image.filename:  # resim var mı kontrolü
        ext = os.path.splitext(image.filename)[1]
        unique_name = f"{uuid.uuid4().hex}{ext}"
        file_path = os.path.join(UPLOAD_DIR, unique_name)
        with open(file_path, "wb") as f:
            f.write(await image.read())

    # Mesajı veritabanına ekle
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO messages (topic_id, user_id, content, image, created_at) VALUES (%s, %s, %s, %s, NOW())",
        (topic_id, user_id, content, file_path if file_path else None)  # null gönder
    )
    conn.commit()
    cursor.close()
    conn.close()

    # Mesaj sonrası topic sayfasına yönlendir
    return RedirectResponse(url=f"/bilgi_bankasi/{topic_id}", status_code=303)



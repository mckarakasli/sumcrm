-- phpMyAdmin SQL Dump
-- version 5.2.2deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2025 at 09:48 AM
-- Server version: 8.4.7-0ubuntu0.25.04.1
-- PHP Version: 8.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobtracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_reports`
--

CREATE TABLE `activity_reports` (
  `id` int NOT NULL,
  `report_date` date NOT NULL,
  `report_time` time NOT NULL,
  `customer_id` int NOT NULL,
  `topic` varchar(255) COLLATE utf8mb3_turkish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `company` varchar(250) COLLATE utf8mb3_turkish_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb3_turkish_ci NOT NULL,
  `tabela` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `phone` varchar(250) COLLATE utf8mb3_turkish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `code` varchar(250) COLLATE utf8mb3_turkish_ci NOT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `odasicil` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `sgksicil` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `efaturaportal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `earsivportal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `isyeriadres` text CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci,
  `evadres` text COLLATE utf8mb3_turkish_ci,
  `vergidairesi` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `tc` text COLLATE utf8mb3_turkish_ci,
  `edevletsifre` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `gib` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `isebaslamatarihi` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `sgkmudurulugu` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `sgksifre` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `istelefon` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `malimuhur` text COLLATE utf8mb3_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `company`, `email`, `tabela`, `phone`, `status`, `code`, `website`, `odasicil`, `sgksicil`, `efaturaportal`, `earsivportal`, `isyeriadres`, `evadres`, `vergidairesi`, `tc`, `edevletsifre`, `gib`, `isebaslamatarihi`, `sgkmudurulugu`, `sgksifre`, `istelefon`, `malimuhur`) VALUES
(7, 'Ayberk Erdoğan/görevli', 'BAHÇELİEVLER 2001 SİTESİ', 'cengelkoy2001@gmail.com', '', '05306620033  05551857994', 1, 'BASI', '2420308193', '', '2 6832 07 07 1100304 034 13 95', '', '', 'Küçüksu Mahallesi Öztürk Sokak 2001 Sitesi No:1/U Üsküdar-İSTANBUL', '', 'ÜSKÜDAR', '', '683202 - BİR ÜCRET VEYA SÖZLEŞMEYE DAYALI OLARAK YAPILAN DİĞER GAYRİMENKUL YÖNETİMİ FAALİYETLERİ (APARTMAN YÖNETİCİLİĞİ HARİÇ)', '24206656/maliye/656602', '2002-12-18', 'KADIKÖY', '52981148806-3/81EagR64/11BpnO55', ' 02163325142', 'None'),
(8, 'Gürkan Taşkın/ortak', 'GÜRKAN TAŞKIN LTD ŞTİ', 'gurkan.taskin@windowslive.com', '', '05376862663', 1, 'GULT', '4450308647', '', '2 4100 07 07 1614156 034 10 41 000', '', '', 'Hasanpaşa Mahallesi Şehit Bülent Altınsoy Sokak E No:1/9 Kadıköy/İstanbul ', 'Cumhuriyet Mahallesi Ferman Caddesi No:67/9', 'KADIKÖY', '', '410001 - İKAMET AMAÇLI BİNALARIN İNŞAATI (AHŞAP BİNALARIN İNŞAATI HARİÇ)', '44503899/maliye/810003', '2024-02-06', '', '59074386282-2/66ZjzA16/81QajT13', '', '135246-mm-krm/15,08,2027'),
(9, 'Adem Büdün/mükellef ', 'ADEM BÜDÜN', 'ademxxbudun@gmail.com', 'EMR MOTO 34', '05367654564', 1, 'ADBU', '1910404795', 'yok', 'yok', 'yok', 'gib', 'Güzeltepe Mahallesi Minber Sokak No:20/C Üsküdar/İstanbul', 'KAYIŞDAĞI MAH. GÜLER SK. FETIH APT Kapı No:57 Daire No:1 ATAŞEHİR/İSTANBUL', 'ÜSKÜDAR', '23633568006', '478302 - MOTOSİKLETLER VE MOTORLU BİSİKLETLERİN PARÇA VE AKSESUARLARININ PERAKENDE TİCARETİ -953102 - MOTORLU KARA TAŞITLARININ LASTİK ONARIMI FAALİYETLER-953200 - MOTOSİKLETLERİN ONARIM VE BAKIM', '19114824/maliye/135246', '2025-10-01', 'yok', 'yok', 'yok', 'None'),
(10, 'Abdulkadir Bülent Karakaşlı/mükellef', 'ABDULKADİR BÜLENT KARAKAŞLI ', 'abkarakasli@hotmail.com', 'SELİMİYE AYDIN MUHASEBE', '05364404333', 1, 'ABKA', '5130058691', 'İSMMMO-10977', '2 6920 0707 1016792 034 13 03 000', '', '', 'selimiye mah. cami sok. no :2/A üsküdar/İST. ', 'armağanevler mh. şehit emre büyükyıldırım sk. no:23/30 ümraniye/İST ', 'ÜSKÜDAR ', '39736561134', '692001 - MALİ MÜŞAVİRLİK HİZMETLERİ', '51300074/qwerty/611961', '1994-09-01', 'KADIKÖY ', '39736561134-2/135246/135246', '02163433147', ''),
(12, 'Muhammed Salih Karakaşlı/mükellef ', 'MUHAMMED SALİH KARAKAŞLI', 'mskarakasli@gmsil.com', '', '05422140123', 1, 'MUHSAL', '5130553951', '', '2 6201 07 07 1559901 034 24 09 000', '', '', 'Armağanevler Mahallesi Başak Sokak No:23/30 Ümraniye-İstanbul', '', 'ALEMDAĞ', '39721561644', '621000 - BİLGİSAYAR PROGRAMLAMA FAALİYETLERİ', '51311869/maliye/135246', '2022-10-03', '', '39721561644-2/58IeyW90/25KdiD75', '', ' ei-syh-54844/15,05,2028'),
(13, 'tüm personel', '01.OFİS İÇİ İŞLER ', '', '', '', 1, 'OFİS İÇİ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL),
(14, 'Ali Atik/mükellef ', 'ALİ ATİK', 'aliatik.66@hotmail.com', 'BAYAN KUAFÖRÜ', '05389457064', 1, 'ALAT', '1020490892', '', '2 9621 07 07 1580318 034 10 56 000', '', '', 'Acıbadem Mahallesi Tekin Sokak Besen Sitesi A Blok No:7/AA Kadıköy-İSTANBUL', 'ACIBADEM MH.ULUSULUK SK.NO:37/10 KADIKÖY/İSTANBUL', 'KADIKÖY', '17855848152', '962101 - KADINLAR İÇİN KUAFÖR İŞLETMELERİNİN FAALİYETLERİ', '10211631/maliye/111111', '2023-03-14', 'KADIKÖY', '17855848152-2/23SwsL74/82NnbD37', '', 'None'),
(15, 'Zöhre Döndü/mükellef', 'ZÖHRE DÖNDÜ', 'ilhan_dondu@hotmail.com', 'NALBUR', '05363560890', 1, 'ZODO', '3110026476', '', '', '', '', 'Selimiye Mahallesi Avni Anıl Sokak No:1/A Üsküdar-İSTANBUL', 'Kozyatağı Mahallesi Sarıkanarya Sokak Pınar Apartmanı No:39/2-1 Kadıköy-İSTANBUL', 'ÜSKÜDAR', '52237256934', '475202 - HIRDAVAT (NALBURİYE) VE EL ALETLERİ PERAKENDE TİCARETİ ', '31100112/maliye/211001', '1995-02-01', '', '', '02165538206', 'None'),
(16, 'Ali Dikici/mükellef', 'ALİ DİKİCİ', 'alidikici.65@gmail.com', '', '05322873984', 1, 'ALDI', '2960002194', '34-281171', '2 4939 08 08 1179100 034 30 30', '', '', 'Altıntepe Mahallesi Pınarlı Sokak No:26/6 Maltepe-İSTANBUL', 'Altıntepe Mahallesi Pınarlı SokakNO:26/6 Maltepe-İSTANBUL', 'KÜÇÜKYALI', '48598358202', '493109 - ŞEHİR İÇİ, BANLİYÖ VE KIRSAL ALANLARDA KARA YOLU İLE PERSONEL, ÖĞRENCİ, VB. GRUP TAŞIMACILIĞI (ŞEHİR İÇİ PERSONEL VE OKUL SERVİSLERİ, VB.)', '29600121/maliye/135246', '2013-06-26', 'MALTEPE', '48598358202-2/135246/135246', '', 'None'),
(17, 'Alper Ali Fidan/mükellef', 'ALPER ALİ FİDAN', 'alperalif@gmail.com', '', '05324561833', 1, 'ALFI', '3870463792', '475251', '2 4773 06 06 1261225 034 25 93', '', '', 'Yıldırım Mahallesi Emel Sokak No:18/B Bayrampaşa-İstanbul', '2 4773 06 06 1261225 034 25 93 ', 'TUNA', '45778760688', '477301 - ECZACILIK ÜRÜNLERİNİN PERAKENDE TİCARETİ', '38710167/maliye/760688', '2021-03-08', 'GAZİOSMANPAŞA ', '45778760688-2/09EtfZ93/97ScdE19', '', '135246-mm-krm/28,11,2027'),
(18, 'Ali Şahin/mükellef', 'ALİ ŞAHİN', 'sahinogullaritoptan@gmail.com', '', '05333341309', 1, 'ALSA', '7900688862', '432212-5', '2 4644 07 07 1544274 034 13 96 000', '', '', 'Selimiye Mahallesi Selimiye İskele Caddesi No:40-42/1A', '2 4644 07 07 1544274 034 13 96 000', 'ÜSKÜDAR', '30932341926', '461701 - GIDA MADDELERİNİN TOPTAN SATIŞI İLE İLGİLİ ARACILARIN FAALİYETLERİ (ARACI ÜRETİCİ BİRLİKLERİ DAHİL, İÇECEKLER İLE YAŞ SEBZE VE MEYVE HARİÇ) - 463903 - UZMANLAŞMAMIŞ GIDA, İÇECEK VE TÜTÜN TOPTAN TİCARETİ', '79010287/maliye/135246', '2021-12-01', 'KADIKÖY', '30932341926-2/72DinV10/18YmyI93', '', '135246-mm-krm/07,06,2026'),
(19, 'Arife Yüksel/mükellef', 'ARİFE YÜKSEL', 'arife3419@gmail.com', 'ÇAY OCAĞI KIRATHANE', '02163426173', 1, 'ARYU', '9930010093', '34-285580', '', '', '', 'Valide-i Atik Mahallesi Allame Caddesi No:108/A Üsküdar-İSTANBUL', 'Valide-i Atik Mahallesi Valide Kahyası Sokak Özdemir Apartmanı No:8/6 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '37918127772', '563002 - ÇAY OCAKLARI, KIRAATHANELER, KAHVEHANELER, KAFELER (İÇECEK AĞIRLIKLI HİZMET VEREN), MEYVE SUYU SALONLARI VE ÇAY BAHÇELERİNDE İÇECEK SUNUM FAALİYETİ', '99300606/maliye/606003', '1993-03-01', '', '', '', 'None'),
(20, 'Ahmet Salih Çinkaya/mükellef', 'AHMET SALİH ÇİNKAYA', 'ahmedsalihh@gmail.com', '', '05066380441', 1, 'ASCI', '2570942143', '', '', '', '', 'Acıbadem Mah. Asafbey Sok. İmer Apt.No:7/A Kadıköy/İstanbul', '', 'KADIKÖY', '36802171266', '621000 - BİLGİSAYAR PROGRAMLAMA FAALİYETLERİ', '25716729/maliye/135246', '2024-06-03', '', '', '', 'None'),
(21, 'Aydemir Bektaş/mükellef', 'AYDEMİR BEKTAŞ', 'aydemirbektas@msn.com', 'DALGIÇLIK', '05325868285', 1, 'AYBE', '1620159944', '', '0 4291 07 07 1369745 034 13 70 000', '', '', 'Küplüce Mahallesi Saray Caddesi No:72/9 Üsküdar-İSTANBUL', 'Küplüce Mahallesi Saray Caddesi Dalgıç Blok No:72A/9 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '26120412738', '429101 - KIYI VE LİMAN İNŞAATLARI VE İLGİLİ HİDROMEKANİK YAPILARIN İNŞAATI (SU YOLLARI, KANAL VB. DAHİL)', '16201276/maliye/135246', '2010-04-12', 'KADIKÖY', '26120412738-3/37045417/37965458', '', '135246-mm-krm/09,06,2026'),
(22, 'Bekir Dağdeviren/mükellef', 'BEKİR DAĞDEVİREN', 'bekirdagdeviren.50@gmail.com', 'CAM VE ÇERÇEVE', '02165537813', 1, 'BEDA', '2660024928', '34-358711', '2 4334 07 07 1173710 034 13 72 ', '', '', 'Salacak Mahallesi Harem İskele Caddesi No:38/A Üsküdar-İSTANBUL', 'Bulgurlu Mahallesi Şen Sokak No:5/2 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '37381515946', '475204 - DÜZ CAM PERAKENDE TİCARETİ', '26600568/maliye/266005', '1997-01-01', 'KADIKÖY', '37381515946-2/135246/135246', '', 'None'),
(23, 'Buse Koruç/mükellef', 'BUSE KORUÇ', 'sukulentsehri@gmail.com', 'ÇİÇEK BİTKİ TOPTAN SATIŞI', '05352098443', 1, 'BUKO', '5800472570', '', '', '', '', 'Selimiye Mah. Şair Nesimi Sk. Altay Apt. No:9F/F ÜSKÜDAR/İSTANBUL', 'Selimiye Mah. Çeşme-i Kebir Sk. No:11 /7  ', 'ÜSKÜDAR', '15344404162', '462201 - ÇİÇEKLERİN VE BİTKİLERİN TOPTAN TİCARETİ - 464912 - HEDİYELİK EŞYA TOPTAN TİCARETİ (PİPO, TESPİH, BAKIR SÜS EŞYALARI, İMİTASYON TAKILAR DAHİL) - 479114 - RADYO, TV, POSTA YOLUYLA VEYA İNTERNET ÜZERİNDEN YAPILAN PERAKENDE TİCARET', '58007251/maliye/135246', '2024-02-14', '', '', '', 'None'),
(24, 'Büşra Yazıcı/mükellef', 'BÜŞRA YAZICI', 'busraodabas@hotmail.com', '', '05334170713', 1, 'BUYA', '6330292891', '', '2 8623 07 07 1335007 034 24 58', '', '', 'Tantavi Mahallesi Alemdağ Caddesi No:5/4 Ümraniye-istanbul', '', 'ÜMRANİYE', '16576511710', '862303 - ÖZEL MUAYENEHANELERDE SAĞLANAN DİŞ HEKİMLİĞİ UYGULAMA FAALİYETLERİ (YATILI HASTANE FAALİYETLERİ İLE DİŞ HİJYENİSTLERİ GİBİ PARAMEDİKAL DİŞ SAĞLIĞI PERSONELİNİN FAALİYETLERİ HARİÇ)', '63304526/maliye/216310', '2014-04-16', '', '16576511710-3/17214765/17228738', '', 'None'),
(25, 'Cahit Çetinsu/mükellef', 'CAHİT ÇETİNSU', 'cetinsucahit@gmail.com', '', '05326120030', 1, 'CACE', '2470114409', '', '2 5630 07 07 1545334 034 13 89 000', '', '', 'Salacak Mahallesi Dr.Sıtkı Özferendeci Sokak Yasemin Apartmanı No:67/A Üsküdar-İstanbul', '', 'ÜSKÜDAR', '43444357330', '410001 - İKAMET AMAÇLI BİNALARIN İNŞAATI (AHŞAP BİNALARIN İNŞAATI HARİÇ) - 559004 - EVLERDE VE MOBİLYALI VEYA MOBİLYASIZ DAİRELERDE VEYA APARTMANLARDA BİR YILDAN DAHA KISA BİR SÜRE İÇİN KONAKLAMA HİZMETİ SAĞLANMASI FAALİYETLERİ ', '24704570/maliye/120030', '2020-02-01', '', '43444357330-4/53QsrY92/09IecA65', '', ' ei-syh-68172/27,01,2028'),
(26, 'Cengiz Kenar/mükellef', 'CENGİZ KENAR', 'kasapefendi54@gmail.com', '', '05495545654', 1, 'CEKE', '5440372079', '', '2 5611 07 07 1634270 034 24 76 000', '', '', 'Kazım Karabekir Mahallesi Sarıtaş Sokak No:1/A Ümraniye/İstanbul', 'Küplüce Mahallesi Saray Caddesi No:24/1 Üsküdar/İstanbul', 'ÜMRANİYE ', '62596085168', '462302 - CANLI KÜMES HAYVANLARI TOPTAN TİCARETİ - 463202 - ET TOPTAN TİCARETİ (AV HAYVANLARI VE KÜMES HAYVANLARI ETLERİ HARİÇ) - 472205 - ET PERAKENDE TİCARETİ', '54400832/maliye/403854', '2022-08-24', 'KADIKÖY', '62596085168-4/135246/135246', '', ' ei-syh-9174/01,01,2027'),
(27, 'Cemal Özaslan/mükellef', 'CEMAL ÖZASLAN', 'ozaslan_kuyumcu@hotmail.com', 'KUYUMCU', '05303532525', 1, 'CEOZ', '6640007165', '11077', '2 4777 07 07 1283929 034 13 02 000', '', '', 'Mimar Sinan Mahallesi Atlas Çıkmazı Sokak No:13/1 Dükkan:168 Üsküdar-İSTANBUL', 'Sultantepe Mahallesi Selvilik Caddesi No:16/5 Üsküdar/istanbul', 'ÜSKÜDAR', '28735626852', '477701 - ALTIN VE DİĞER DEĞERLİ METALLERDEN TAKI, EŞYA VE MÜCEVHERAT PERAKENDE TİCARETİ (KUYUMCULUK ÜRÜNLERİ PERAKENDE TİCARETİ DAHİL, GÜMÜŞTEN OLANLAR HARİÇ)', '66400052/maliye/250005', '1990-01-08', 'KADIKÖY', '28735626852-2/135246/135246', '02163108658 ', '135246-mm-krm/27,11,2027'),
(28, 'Cihan Şahin/mükellef', 'CİHAN ŞAHİN', 'mimcihansahin@gmail.com', '', '05379565818', 1, 'CISA', '7910105985', '', '2 7111 07 07 1515697 034 24 37', '', '', 'Yamanevler Mah. Akgül Sk. No:1/18 Ümraniye/İSTANBUL', 'İstiklal Mahallesi Mihraç Sokak Palmiye 1 Apt.No:59-61/11 Ümraniye/İSTANBUL', 'ALEMDAĞ', '18755284538', '711101 - MİMARLIK FAALİYETLERİ VE MİMARİ DANIŞMANLIK FAALİYETLERİ (KÜLTÜREL MİRAS VARLIKLARININ KORUNMASINI VE RESTORASYONUNU DESTEKLEYEN MİMARİ FAALİYETLER İLE İÇ MİMARLIK FAALİYETLERİ DAHİL', '79107843/maliye/329284', '2020-01-07', 'ÜMRANİYE', '18755284538-2/10RuvF99/72HxpU64', '', 'None'),
(29, 'Deniz Yanar/mükellef', 'DENİZ YANAR', 'yanardeniz@gmail.com', 'KURUYEMİŞ VE TEKEL ', '05455008883', 1, 'DEYA', '9360992949', '', '', '', '', 'Salacak Mahallesi Harem İskele Caddesi Murat Apt. A Blok No:28 B Üsküdar/İstanbul', 'Mustafa Kemal Mah. 3007 Cad. No:27/10 Ataşehir/İstanbul', 'ÜSKÜDAR', '70180036892', '471199 - BAŞKA YERDE SINIFLANDIRILMAMIŞ GIDA, İÇECEK VEYA TÜTÜN AĞIRLIKLI PERAKENDE TİCARET (TANZİM SATIŞ VE GIDA TÜKETİM KOOPERATİFLERİ DAHİL) - 472105 - KURU YEMİŞ PERAKENDE TİCARETİ', '93615030/maliye/030516', '2023-10-27', '', '', '', ' ei-syh-42249/06,05,2028'),
(30, 'Duygu Koldere/mükellef', 'DUYGU KOLDERE', 'duygukoldere@gmail.com', '', '05535604406', 1, 'DUKO', '5750428564', '', '', '', '', 'Sırapınar Mahallesi Beykoz Caddesi No:33/1P/6 Çekmeköy/İstanbul', 'Sırapınar Mah. Beykoz Cad. No:33/1 P Blok Daire:6 ', 'SARIGAZİ ', '57490398230', '181302 - BASIM ÖNCESİ BİLGİSAYAR DESTEKLİ HİZMETLER (BİLGİSAYAR DESTEKLİ SAYFA TASARIMI İLE SAYDAM, ASETAT, REPROGRAFİK SUNUM ARAÇLARI VE DİĞER SAYISAL SUNUM ORTAMLARI, TASLAKLAR, PLANLAR VB. BASKI ÜRÜNLERİNİN TASARLANMASI) (MASA ÜSTÜ YAYIMCILIK DAHİL) ', '57505395/maliye/625613', '2023-10-17', '', '', '', 'None'),
(31, 'E. Korkut Erenkul/mükellef', 'E. KORKUT ERENKUL', 'sony@burcuelektronik.com.tr', 'ELEKTRONİK EŞYA TAMİRİ', '', 1, 'EKER', '3540006298', '', '2 9521 07 07 1034425 034 13 79', '', '', 'Ahmediye Mahallesi Tunusbağı Caddesi No:53/A Üsküdar-İSTANBUL', 'Barbaros Mahallesi Başkan Sokak Bilgen Konutları E Blok/18 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '13064479026', '952101 - TÜKETİCİ ELEKTRONİĞİ ÜRÜNLERİNİN ONARIM VE BAKIMI', '35400066/maliye/660004', '1996-05-14', 'KADIKÖY', '13064479026-2/135246/135246', '02165536929', 'None'),
(32, 'Erdal Cengeri/mükellef', 'ERDAL CENGERİ', 'solmazelif@gmail.com', 'KURUYEMİŞ', '05334620867', 1, 'ERCE', '2060021984', '34-92145', '2 4711 07 07 1139717 034 13 29 000', '', '', 'Murat Reis Mahallesi Nuhkuyusu Caddesi  No:241/A Üsküdar-İSTANBUL', 'Murat Reis Mahallesi Acemoğlu Sokak No:12/3 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '23560587286', '471199 - BAŞKA YERDE SINIFLANDIRILMAMIŞ GIDA, İÇECEK VEYA TÜTÜN AĞIRLIKLI PERAKENDE TİCARET (TANZİM SATIŞ VE GIDA TÜKETİM KOOPERATİFLERİ DAHİL) - 472105 - KURU YEMİŞ PERAKENDE TİCARETİ', '20600030/maliye/030006', '1991-05-01', 'KADIKÖY', '23560587286-2/135246/135246', '02163101874', ' ei-syh-5840/14,06,2027'),
(33, 'Ercan Deveci/mükellef', 'ERCAN DEVECİ', 'ercan.deveci@gmail.com', '', '05327928005', 1, 'ERDE', '2940093469', '', '', '', '', 'Selimiye Mahallesi Selmiye Cami Sokak No:20/1 Üsküdar-İstanbul', '', 'ÜSKÜDAR', '19553263824', '', '29407845/maliye/135246', '2022-10-03', '', '', '', NULL),
(34, 'Erkan Savaş/mükellef', 'ERKAN SAVAŞ', 'sesyapimalzemeler@gmail.com', '', '05330934969', 1, 'ERSA', '7530348109', '', '2 4752 07 07 1573780 034 13 17 000', '', '', 'Ünalan Mahallesi İsmetpaşa Caddesi No:24/A Üsküdar/İstanbul', '', 'ÜMRANİYE', '26822478964', '464402 - TEMİZLİK MALZEMESİ TOPTAN TİCARETİ (KİŞİSEL TEMİZLİK SABUNLARI HARİÇ) - 475202 - HIRDAVAT (NALBURİYE) VE EL ALETLERİ PERAKENDE TİCARETİ - 476201 - KIRTASİYE ÜRÜNLERİNİN PERAKENDE TİCARETİ', '75308940/maliye/111111', '2023-03-01', '', '26822478964-2/53MykC96/09BvgQ40', '', ' ei-syh-70982/19,05,2028'),
(35, 'Eyüp Çakır/mükellef', 'EYÜP ÇAKIR', 'cakircaotomotiv@gmail.com', 'BÜFE', '05376217813', 1, 'EYCA', '2210695599', '34-562520', '0 4711 07 07 1206096 034 13 60 ', '', '', 'Selimiye Mahallesi Harem Sahil Yolu No:34/1-2 Üsküdar-İSTANBUL', 'Zeynep Kamil Mahallesi Nalçacıhasan Sokak No:8/4 Üsküdar-İSTANBUL ', 'ÜSKÜDAR', '32875137512', '471199 - BAŞKA YERDE SINIFLANDIRILMAMIŞ GIDA, İÇECEK VEYA TÜTÜN AĞIRLIKLI PERAKENDE TİCARET (TANZİM SATIŞ VE GIDA TÜKETİM KOOPERATİFLERİ DAHİL) ', '22100657/maliye/215731', '2009-11-16', 'KADIKÖY', '32875137512-2/135246/135246', '02164950335', '135246-mm-krm/12,06,2028'),
(36, 'Gürbüz Yıldız/mükellef', 'GÜRBÜZ YILDIZ', 'ahmtyldz1976@gmail.com', '', '05368846074', 1, 'GRYI', '9620344025', '', '2 5611 07 07 1443171 034 13 67 000', '', '', 'Selimiye Mahallesi Harem Sahil Yolu Caddesi No:34/3 Üsküdar/İSTANBUL', 'Mimar Sinan Mah. Bakkaloğlu Cad. No:86/3 Sultanbeyli/İSTANBUL', 'ÜSKÜDAR', '11811115470', '561101 - GENEL LOKANTA VE RESTORANLARIN (İÇKİLİ VE İÇKİSİZ) FAALİYETLERİ', '96205012/maliye/135246', '2019-01-03', 'KADIKÖY', '11811115470-2/20LupH14/30RrfL80', '', 'None'),
(37, 'Gül Firuz/mükellef', 'GÜL FİRUZ', 'gfiruz@hotmail.com', 'ECZANE', '05355298549', 1, 'GUFI', '3880028493', '896545', '2 4773 07 07 1149700 034 13 21 ', '', '', 'Zeynep Kamil Mahallesi Balcılar Yokuşu Sokak B Blok  No:51/A Üsküdar-İSTANBUL', 'Zeynep Kamil Mahallesi Balcılar Yokuşu Sokak Eğin Apartmanı 55/17 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '18346927448', '477301 - ECZACILIK ÜRÜNLERİNİN PERAKENDE TİCARETİ', '38800782/maliye/287008', '1993-02-08', 'KADIKÖY', '18346927448-2/135246/135246', '02163912706', ' ei-syh-6717/21,04,2028'),
(38, 'Güngör Maraklı/mükellef', 'GÜNGÖR MARAKLI', 'gungormarakli51@gmail.com', '', '05324244843', 1, 'GUMA', '6160000251', '', '2 4722 07 07 1592841 034 10 00 000', '', '', 'Acıbadem Mah. Acıbadem Cad. No:1-5E Kadıköy/İSTANBUL', '', 'KADIKÖY', '11224210014', '463903 - UZMANLAŞMAMIŞ GIDA, İÇECEK VE TÜTÜN TOPTAN TİCARETİ - 472202 - ET ÜRÜNLERİ PERAKENDE TİCARETİ (SOSİS, SALAM, SUCUK, PASTIRMA VB.) ', '61603899/maliye/636899', '1988-12-01', 'KADIKÖY', '11224210014-3/76JzvJ07/87CwxS68', '02163251485', ' ei-syh-7535/12,06,2027'),
(39, 'Gülçin Yıldırım/mükellef', 'GÜLÇİN YILDIRIM', 'gulcinyildirim1960@hotmail.com', 'BAYAN KUAFÖRÜ ', '05422418354', 1, 'GUYI', '9550053821', '12925', '', '', '', 'Selimiye Mahallesi Harem İskele Caddesi No:9/A Üsküdar-İSTANBUL', 'Salacak Mahallesi  Muratağa Sokak No:12/7 Üsküdar-İSTANBUL ', 'ÜSKÜDAR', '37303658072', '962101 - KADINLAR İÇİN KUAFÖR İŞLETMELERİNİN FAALİYETLERİ', '95500040/maliye/040005', '1999-01-01', '', '', '02163431587', 'None'),
(40, 'Hamit Canpolat/mükellef', 'HAMİT CANPOLAT', 'hamitcanpolat.59@gmail.com', 'SAAT TAMİRİ', '05382482154', 1, 'HACA', '2020003726', '34-8192', '', '', '', 'Selimiye Mahallesi Harem İskele Caddesi No:27/B Üsküdar-İSTANBUL', 'Balat Molla Aşkın Mahallesi Yatağan Sokak No:22 Eyüp-İSTANBUL ', 'ÜSKÜDAR', '44779625026', '477703 - SAAT (KOL, MASA, DUVAR VB. SAATLER İLE KRONOMETRELER) PERAKENDE TİCARETİ - 952501 - SAATLERİN ONARIMI (KRONOMETRELER DAHİL, DEVAM KAYIT CİHAZLARI HARİÇ)', '20200062/maliye/260002', '1983-08-01', '', '', '02163434554', 'None'),
(41, 'Hande Hiraoğlu/mükellef', 'HANDE HİRAOĞLU', 'handehiraoglu@gmail.com', '', '05327687201', 1, 'HAHI', '4620129853', '', '', '', '', 'Salacak Mahallesi Çiçekçi Sokak No:9/8 Üsküdar-İSTANBUL', '', 'ÜSKÜDAR', '35488477624', '494102 - KARA YOLU İLE ŞEHİRLER ARASI YÜK TAŞIMACILIĞI (GIDA, SIVI, KURU YÜK, VB.) (GAZ VE PETROL ÜRÜNLERİ HARİÇ)', '46200205/maliye/790813', '2022-08-17', '', '', '', 'None'),
(42, 'Hatice Orhan/mükellef', 'HATİCE ORHAN', 'dt.hatice.orhan@gmail.com', '', '5052981684', 1, 'HAOR', '7110240427', '', '2 8623 07 07 1416657 034 13 34 000', '', '', 'Mimar Sinan Mahallesi Büyük Hamam Sokak No:5/6 Üsküdar/İSTANBUL', '', 'ÜSKÜDAR', '12734890048', '862303 - ÖZEL MUAYENEHANELERDE SAĞLANAN DİŞ HEKİMLİĞİ UYGULAMA FAALİYETLERİ (YATILI HASTANE FAALİYETLERİ İLE DİŞ HİJYENİSTLERİ GİBİ PARAMEDİKAL DİŞ SAĞLIĞI PERSONELİNİN FAALİYETLERİ HARİÇ)', '71102634/maliye/134679', '2018-01-02', 'KADIKÖY', '12734890048-2/34XbvA07/19ZfxC02', '02165321010', 'None'),
(43, 'Hasan Yavuz/mükellef', 'HASAN YAVUZ', 'hasanbababyavuz@gmail.com', 'MARKET', '05326967640', 1, 'HAYA', '9410105518', '', '2 4711 07 07 1168233 034 13 27 000 ', '', '', 'Selimiye Mahallesi Harem Sahil Yolu No:32/36 Üsküdar-İstanbul', 'Zeynep Kamil Mahallesi Nasrettin Hoca Sokak No:20/6 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '25570381236', '471199 - BAŞKA YERDE SINIFLANDIRILMAMIŞ GIDA, İÇECEK VEYA TÜTÜN AĞIRLIKLI PERAKENDE TİCARET (TANZİM SATIŞ VE GIDA TÜKETİM KOOPERATİFLERİ DAHİL)', '94100739/maliye/255703', '2007-09-12', 'KADIKÖY', '25570381236-5/135246/135246', '', ' ei-syh-4960/27,06,2027'),
(44, 'Hatice Deniz Turhan/mükellef', 'HATİCE DENİZ TURHAN', 'deniz0803@hotmail.com', '', '05335209049', 1, 'HDTU', '8710361729', '', '2 4771 07 07 1363776 034 10 18 ', '', '', 'Osmanağa Mahallesi General Asım Gündüz Caddesi Opera Onur Çarşısı No:17/108 Kadıköy-İSTANBUL', 'TEPEÜSTÜ MAH. ESKİ KADIKÖY YOLU CD. NO:3/1 ÜMRANİYE/İSTANBUL', 'KADIKÖY', '29764791498', '477104 - DİĞER DIŞ GİYİM PERAKENDE SATIŞI (PALTO, KABAN, ANORAK, TAKIM ELBİSE, CEKET, PANTOLON, ŞORT (TEKSTİL KUMAŞINDAN VEYA ÖRGÜ VE TIĞ İŞİ))', '87103128/maliye/821301', '2015-10-01', 'KADIKÖY', '29764791498-2/88688611/29748699', '', 'None'),
(45, 'Halil Akgün/mükellef', 'HALİL AKGÜN', 'halilakgun17@gmail.com', '', '05455139746', 1, 'HLAK', '0240539115', '', '', '', '', 'Acıbadem Mahallesi Asafbey Sokak Imer Apt.No:7/A Kadıköy/İstanbul', 'Eğitim Mah. Pembe Köşk Sk. KentPlus Kadıköy Rezidans A Bok No:24/179 Kadıköy/İstanbul', 'KADIKÖY', '31615277372', '621000 - BİLGİSAYAR PROGRAMLAMA FAALİYETLERİ', '02414722/maliye/111111', '2022-04-26', '', '', '', 'None'),
(46, 'Hüseyin Eş/mükellef', 'HÜSEYİN EŞ', 'pimapenmoda@gmail.com', '', '05372836409', 1, 'HUES', '3800343474', '', '2 4752 07 07 1357162 034 10 97 000', '', '', 'Caferağa Mahallesi Şair Latifi Sokak No:4/A Kadıköy-İstanbul', 'Küplüce Mahallesi Mehmetağa Caddesi No:50/2 Üsküdar-İSTANBUL', 'KADIKÖY', '41026002050', '475209 - PLASTİK KAPI, PENCERE VE BUNLARIN KASALARI İLE KAPI EŞİKLERİ, PANJURLAR, JALUZİLER, STORLAR VE BENZERİ EŞYALARIN PERAKENDE TİCARETİ (PVC OLANLAR DAHİL)', '38003404/maliye/404300', '2013-10-01', 'KADIKÖY ', '41026002050-2/31507727/94384919', '02164493879', 'None'),
(47, 'İsmail Hakan İşeri/mükellef', 'İSMAİL HAKAN İŞERİ', 'hakaniseri@gmail.com', 'ECZANE', '05393228426', 1, 'IHIS', '4820011149Q', '211619', '2 4773 07 07 0397250 034 13 97 ', '', '', 'Salacak Mahallesi Harem İskele Caddesi No:6/B Üsküdar-İSTANBUL', 'Selimiye Mahallesi Selimiye Hamam Sokak No:17/5 Üsküdar-İSTANBUL ', 'ÜSKÜDAR', '26863982420', '477301 - ECZACILIK ÜRÜNLERİNİN PERAKENDE TİCARETİ', '48200483/maliye/384002', '1984-01-01', 'KADIKÖY', '26863982420-2/135246/135246', '02163433429', '135246-mm-krm/26,09,2026'),
(48, 'İrem Kurt Baskın/mükellef', 'İREM KURT BASKIN', 'iremkurt1994@gmail.com', '', '05382781194', 1, 'IRKU', '5951373187', '', '2 4773 07 07 1497432 034 10 08 000', '', '', 'Dumlupınar Mahallesi Hızırbey Caddesi Güneş Apt. No:201/A Kadıköy/İstanbul', 'İdealtepe Mah. Park Sok. No:2-4/12 Maltepe/İstanbul', 'GÖZTEPE', '10994972078', '477301 - ECZACILIK ÜRÜNLERİNİN PERAKENDE TİCARETİ', '59508673/maliye/376805', '2020-11-18', 'KADIKÖY', '10994972078-3/05OfmC91/61QrzC78', '', '948560-mm-krm/08,11,2026'),
(49, 'İsa Çilenk/mükellef', 'İSA ÇİLENK', 'isacilenk135@icloud.com', '', '05529473295', 1, 'ISCI', '2560104913', '', '2 5630 07 07 1487155 034 13 13 000', '', '', 'Mehmet Akif Mahallesi Bosna Bulvarı No:65/B Üsküdar-İSTANBUL', 'YAVUZTÜRK MH.GONCAGÜL SK.NO:45/6 ÜSKÜDAR-İSTANBUL', 'ÜSKÜDAR', '33709559258', '561111 - OTURACAK YERİ OLAN FAST-FOOD (HAMBURGER, SANDVİÇ, TOST VB.) SATIŞ YERLERİ (BÜFELER DAHİL) TARAFINDAN SAĞLANAN YEMEK HAZIRLAMA VE SUNUM FAALİYETLERİ', '25602814/maliye/418418', '2016-07-12', 'KADIKÖY ', '33709559258-2/09ZszQ87/50FvkD34', '', 'None'),
(50, 'İsmail Gürbüz/mükellef', 'İSMAİL GÜRBÜZ', 'ismlgrbz37@gmail.com', '', '05435814748', 1, 'ISGU', '4400226316', '', '2 9602 07 07 1559038 034 13 19 000', '', '', 'Selimiye Mah.Bestekar Avni Anıl Sok.No:13 C Üsküdar/istanbul', '', 'ÜSKÜDAR ', '19511578984', '962102 - ERKEKLER İÇİN KUAFÖR VE BERBER İŞLETMELERİNİN FAALİYETLERİ', '44003470/maliye/074300', '2019-09-23', '', '19511578984-2/18BacY32/03XywR20', '', 'None'),
(51, 'İsa Özkan/mükellef', 'İSA ÖZKAN', 'isaozkan123456@gmail.com', 'BAYAN KUAFÖRÜ ', '05309233927', 1, 'ISOZ', '6960226219', '', '2 9621 07 07 1298768 034 10 97 000', '', '', 'Acıbadem Mahallesi Umut Sokak No:1/D Kadıköy-İSTANBUL', 'Namık Kemal Mahallesi Seker Maslak Sokak No:20/1 Ümraniye/İSTANBUL', 'KADIKÖY', '28708420180', '962101 - KADINLAR İÇİN KUAFÖR İŞLETMELERİNİN FAALİYETLERİ', '69600316/maliye/613006', '2013-08-14', 'KADIKÖY ', '28708420180-3/135246/135246', '02164288574', 'None'),
(52, 'Kadir Akan/mükellef', 'KADİR AKAN', 'kadirakan3465@gmail.com', '', '05412146690', 1, 'KAAK', '0120275817', '', '2 4322 07 07 1669736 034 13 40 000', '', '', 'Selimiye Mahallesi Harem İskele Caddesi Yazıcı Apt.No:33/A Üsküdar/İstanbul', '', 'ÜSKÜDAR', '48061591600', '432203 - BİNA VE DİĞER İNŞAAT PROJELERİNDE SU VE KANALİZASYON TESİSATI VE ONARIMI - 433201 - HAZIR MUTFAKLAR, MUTFAK TEZGAHLARI, GÖMME DOLAPLAR, İÇ MERDİVENLER İLE İNCE TAHTA, LAMBRİ VE BENZERLERİNİN MONTAJI İŞLERİ', '01205632/maliye/236502', '2025-06-23', '', '48061591600-3/99YrrD93/46SjaW18', '', 'None'),
(53, 'Kadir Altuntel/mükellef', 'KADİR ALTUNTEL', 'kadiraltuntel46@gmail.com', '', '05052287690', 1, 'KAAL', '0680516075', '', '2 5611 07 07 1543448 034 13 46 000', '', '', 'Küplüce Mah. Eylül Sokak No:56/B Üsküdar/İstanbul', 'Küplüce Mah. Rızabey Sok. No:2/4 Üsküdar/İstanbul', 'ÜSKÜDAR', '44227274158', '561103 - DÖNER, CİĞER, KOKOREÇ, KÖFTE VE KEBAPÇILARIN FAALİYETİ (GARSON SERVİSİ SUNANLAR İLE SELF SERVİS SUNANLAR DAHİL; İMALATÇILARIN VE AL GÖTÜR TESİSLERİN FAALİYETLERİ İLE SEYYAR OLANLAR HARİÇ)', '06803346/maliye/111111', '2022-05-09', 'KADIKÖY ', '44227274158-3/29MylM63/94LouH78', '', ' ei-syh-135246/28,12,2026'),
(54, 'Kadir Kesgin/mükellef', 'KADİR KESGİN', 'kesginler@hotmail.com', '', '05325472674', 1, 'KAKE', '5450171404', '', '2 4335 07 07 1228414 034 13 68  ', '', '', 'SALACAK MAH.HAREM İSKELE CD.NO:14 ÜSKÜDAR-İSTANBUL', '', 'ÜSKÜDAR', '39148888188', '410001 - İKAMET AMAÇLI BİNALARIN İNŞAATI (AHŞAP BİNALARIN İNŞAATI HARİÇ) - 410002 - İKAMET AMAÇLI OLMAYAN BİNALARIN İNŞAATI - 432203 - BİNA VE DİĞER İNŞAAT PROJELERİNDE SU VE KANALİZASYON TESİSATI VE ONARIMI', '54501023/maliye/334288', '1999-08-01', 'KADIKÖY ', '39148888188-2/68627991/123456', '', 'None'),
(55, 'Kartal Can Şahin/mükellef', 'KARTAL CAN ŞAHİN', 'kartalc.sahin@gmail.com', '', '05323782005', 1, 'KCSA', '7930469061', '', '2 8693 07 07 1521250 034 10 61 ', '', '', 'Erenköy Mahallesi Ethemefendi Caddesi No:74/1 Kadıköy/İSTANBUL', 'ERENKÖY MAHALLESİ TAŞMEKTEP SOKAK NO:55/12 KADIKÖY', 'ERENKÖY', '50518436990', '869300 - PSİKOLOG VE PSİKOTERAPİSTLERİN FAALİYETLERİ (TIP DOKTORLARI HARİÇ)', '79305388/maliye/919616', '2021-05-20', 'KADIKÖY ', '50518436990-2/80BviA25/05OkrQ69', '', 'None'),
(56, 'Mehmet Kolçak/mükellef', 'MEHMET KOLÇAK', 'met.tiesto@hotmail.com', '', '05055217866', 1, 'MEKO', '5750179625', '', '2 6831 07 07 1496345 034 24 85 ', '', '', 'Tatlısu Mahallesi Şanlı Caddesi Dream Towers Sitesi No:50 C Blok D:3 Ümraniye-İSTANBUL', '', 'ALEMDAĞ', '22181158974', '479114 - RADYO, TV, POSTA YOLUYLA VEYA İNTERNET ÜZERİNDEN YAPILAN PERAKENDE TİCARET - 683101 - GAYRİMENKUL FAALİYETLERİ İÇİN ARACILIK HİZMETİ FAALİYETLERİ', '57502885/maliye/588205', '2016-03-17', 'ÜMRANİYE ', '22181158974-2/75TorT89/75EjoY07', '', 'None'),
(57, 'Mehmet Yurdakul/mükellef', 'MEHMET YURDAKUL', 'mehmetyurdakul1944@gmail.com', 'ET PAREKENDE TİCARETİ', '05323742535', 1, 'MEYU', '9850008854', '34-9244', '2 4722 07 07 1145027 034 13 04', '', '', 'Selimiye Mahallesi Cami Sokak No:5/A Üsküdar-İSTANBUL', 'Selimiye Mahallesi Harem İskele Caddesi No:19/6 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '25951673424', '472205 - ET PERAKENDE TİCARETİ', '98500052/maliye/250005', '1996-01-20', 'KADIKÖY ', '25951673424-2/135246/135246', '02165531723', 'None'),
(58, 'Mine Zeynep Leventoğlu/mükellef', 'MİNE ZEYNEP LEVENTOĞLU', 'mine_zeynep@hotmail.com', 'DİŞ HEKİMİ', '05052665708', 1, 'MZLE', '7130193743', '', '2 8623 07 07 1203264 034 13 41 000', '', '', 'Selimiye Mahallesi  Şair Nesimi Sokak No:2/6', 'SELİMİYE MAH.ŞAİR NESİMİ SOK.NO:12/5 ÜSKÜDAR/İSTANBUL', 'ÜSKÜDAR', '46066811518', '862303 - ÖZEL MUAYENEHANELERDE SAĞLANAN DİŞ HEKİMLİĞİ UYGULAMA FAALİYETLERİ (YATILI HASTANE FAALİYETLERİ İLE DİŞ HİJYENİSTLERİ GİBİ PARAMEDİKAL DİŞ SAĞLIĞI PERSONELİNİN FAALİYETLERİ HARİÇ)', '71300488/maliye/884003', '2008-12-04', 'KADIKÖY', '46066811518-2/135246/135246', '02163420119', 'None'),
(59, 'Necdet Uğur/mükellef', 'NECDET UĞUR', 'necdetugur10@gmail.com', 'AVUKAT', '05322157873', 1, 'NEUG', '8860362115', '', '2 6910 01 01 1475273 034 28 62 000', '', '', 'Hasanpaşa Mah. Kurbağalıdere Cad. Atışkan Apt. No:37/8 Kadıköy/İstanbul', 'Zafer Mah. Aydınlık Sok. No:11-13 Daire:5 Bahçelievler/İstanbul', 'GÖZTEPE', '32909275906', '691003 - HUKUK DANIŞMANLIĞI VE TEMSİL FAALİYETLERİ (AVUKATLIK FAALİYETLERİ)', '88603833/maliye/338306', '2016-07-21', 'BAĞCILAR', '32909275906-2/86MsbP42/87DhtW58', '', 'None'),
(60, 'Niyazi Çakır/mükellef', 'NİYAZİ ÇAKIR', 'niyazi_cakir@msn.com', '', '05326810279', 1, 'NICA', '2220038928', '', '', '', '', 'Mehmet Akif Ersoy Mahallesi Bosna Bulvarı No:71/1/1 Üsküdar/İstanbul', 'Mehmet Akif Ersoy Mahallesi Bosna Bulvarı No:71/1/1', 'ÜSKÜDAR', '18812288424', '', '22217166/maliye/135246', '2023-12-29', '', '', '', NULL),
(61, 'Nurettin Yağmur Bozkurt/mükellef', 'NURETTİN YAĞMUR BOZKURT', 'bozkurt.yagmur@gmail.com', '', '05327044334', 1, 'NYBO', '1850327949', '', '', '', '', 'Barbaros Mahallesi Halk Caddesi A Blok No:85/7 Ataşehir/İstanbul', '', 'KOZYATAĞI ', '34120031262', '479114 - RADYO, TV, POSTA YOLUYLA VEYA İNTERNET ÜZERİNDEN YAPILAN PERAKENDE TİCARET', '18501658/maliye/654987', '2023-07-06', '', '', '', 'None'),
(62, 'Ömer Faruk Önal/mükellef', 'ÖMER FARUK ÖNAL', 'omerfarukonal@gmail.com', '', '05338115356', 1, 'OFON', '6550060139', '', '2 5630 07 07 1659008 034 24 79 000', '', '', 'Tatlısu Mahallesi Şehit Burak Kurtuluş Caddesi Yunus Emre Sitesi D Blok No:71/B Ümraniye/İstanbul', '', 'ALEMDAĞ', '26950999560', '563002 - ÇAY OCAKLARI, KIRAATHANELER, KAHVEHANELER, KAFELER (İÇECEK AĞIRLIKLI HİZMET VEREN), MEYVE SUYU SALONLARI VE ÇAY BAHÇELERİNDE İÇECEK SUNUM FAALİYETİ', '65511588/maliye/135246', '2025-02-10', '', '26950999560-2/79KzcT88/25OzcK79', '', 'None'),
(63, 'Pelin Yılmaz/mükellef', 'PELİN YILMAZ', 'pelin@yilmazyilmaz.av.tr', '', '05336951212', 1, 'PEYI', '8410410648', '', '2 6910 07 07 1475424 034 13 19 000', '', '', 'Altunizade Mahallesi Mahir İz Caddesi No:28/3 Üsküdar-İSTANBUL', 'Güzeltepe Mah. Tuğlu Sk. NO:9/6 Üsküdar/İSTANBUL', 'ÜSKÜDAR', '20678213380', '691003 - HUKUK DANIŞMANLIĞI VE TEMSİL FAALİYETLERİ (AVUKATLIK FAALİYETLERİ)', '84105943/maliye/349501', '2020-01-03', '', '20678213380-2/24LyeU88/92DgdE74', '', 'None'),
(64, 'Ramazan Cengeri/mükellef', 'RAMAZAN CENGERİ', 'ramazancengeri@hotmail.com', 'KURUYEMİŞ', '05427750197', 1, 'RACE', '2050090399', '', '2 4721 07 07 1513159 034 13 21 000', '', '', 'Valide-i Atik Mahallesi Nuhkuyusu Caddesi No:229/C Üsküdar-İSTANBUL', 'Merdivenköy Mahallesi Doktor Erkin Caddesi Zaman Sokak No:37/5 Kadıköy-İSTANBUL ', 'ÜSKÜDAR', '23485589778', '471199 - BAŞKA YERDE SINIFLANDIRILMAMIŞ GIDA, İÇECEK VEYA TÜTÜN AĞIRLIKLI PERAKENDE TİCARET (TANZİM SATIŞ VE GIDA TÜKETİM KOOPERATİFLERİ DAHİL) - 472105 - KURU YEMİŞ PERAKENDE TİCARETİ', '20500788/maliye/887005', '2021-07-01', '', '23485589778-2/21AmxA25/70RkuK46', '02163106603', '135246-mm-krm/13,06,2028'),
(65, 'Recep Büdün/mükellef', 'RECEP BÜDÜN', 'recep.budun@hotmail.com', '', '05368753642', 1, 'REBU', '1910404802', '10521', '2 9532 07 07 1474013 034 13  63', '', '', 'Ferah Mahallesi Yayla Sokak No:6/A Üsküdar-İstanbul', '', 'ÜMRANİYE', '23624568398', '478302 - MOTOSİKLETLER VE MOTORLU BİSİKLETLERİN PARÇA VE AKSESUARLARININ PERAKENDE TİCARETİ - 771102 - MOTOSİKLET VE MOTOKARAVANLARIN SÜRÜCÜSÜZ OLARAK KİRALANMASI VEYA OPERASYONEL LEASİNGİ (AĞIRLIĞI 3.5 TONDAN DAHA AZ OLANLAR)', '19109097/maliye/790790', '2019-08-06', 'KADIKÖY', '23624568398-2/12MaeG30/52KsjM36', '', ' ei-syh-47524/29,05,2028'),
(66, 'Recep Topal/mükellef', 'RECEP TOPAL', 'topal.18@hotmail.com', 'KURUYEMİŞ', '05347964418', 1, 'RETO', '8510051638', '34-310153', '2 4711 07 07 1148809 034 13 03', '', '', 'Salacak Mahallesi Harem İskele Caddesi No:6/A Üsküdar-İSTANBUL', 'Zümrütevler Mahallesi 2.Karaca Sokak Darbaz Apartmanı No:15/2 Maltepe-İSTANBUL ', 'ÜSKÜDAR', '19348727630', '471199 - BAŞKA YERDE SINIFLANDIRILMAMIŞ GIDA, İÇECEK VEYA TÜTÜN AĞIRLIKLI PERAKENDE TİCARET (TANZİM SATIŞ VE GIDA TÜKETİM KOOPERATİFLERİ DAHİL) - 472105 - KURU YEMİŞ PERAKENDE TİCARETİ', '85100461/maliye/164001', '1995-06-01', '', '19348727630-2/135246/135246', '02163918506', ' ei-syh-92895/07,07,2028'),
(67, 'Sercan Ayhan Sungur/mükellef', 'SERCAN AYHAN SUNGUR', 'sercanayhansungur@gmail.com', '', '05352753810', 1, 'SASU', '7830191810', '', '', '', '', 'Kozyatağı Mahallesi Şakacı Sokak No:16D/1 Kadıköy/İstanbul', 'KOZYATAĞI MAH. ŞAKACI SOK. NO:16D/1 KADIKÖY/İSTANBUL', 'ERENKÖY ', '37174088558', '463601 - ÇİKOLATA VE ŞEKERLEME TOPTAN TİCARETİ (HELVA, LOKUM, AKİDE ŞEKERİ, BONBON ŞEKERİ VB. DAHİL) - 464402 - TEMİZLİK MALZEMESİ TOPTAN TİCARETİ (KİŞİSEL TEMİZLİK SABUNLARI HARİÇ) - 464502 - SABUN TOPTAN TİCARETİ (KİŞİSEL TEMİZLİK İÇİN)', '78303594/maliye/053527', '2022-02-10', '', '', '', 'None'),
(68, 'Selma Dikici/mükellef', 'SELMA DİKİCİ', 'nuridikici@gmail.com', 'PERSONEL VE ÖĞRENCİ TAŞIMACILIĞI', '05372041268', 1, 'SEDI', '2960285909', '', '2 4931 07 07 1466557 034 41 76 000', '', '', 'Yeni Çamlıca Mah.Eren Sokak No:21/1 Ataşehir-İSTANBUL', 'Yeni Çamlıca Mahallesi Dursun Bey Caddesi Eren Sokak No:21/2 Ataşehir-İSTANBUL', 'KOZYATAĞI', '48421364158', '493109 - ŞEHİR İÇİ, BANLİYÖ VE KIRSAL ALANLARDA KARA YOLU İLE PERSONEL, ÖĞRENCİ, VB. GRUP TAŞIMACILIĞI (ŞEHİR İÇİ PERSONEL VE OKUL SERVİSLERİ, VB.)', '29600853/maliye/358006', '2009-08-26', 'KADIKÖY', '48421364158-3/86OkwD30/57ZvfT02', '', 'None'),
(69, 'Sevgi Eladağ Koçdor/mükellef', 'SEVGİ ELADAĞ KOÇDOR', 'skocdor@gmail.com', 'DİŞ HEKİMİ', '05054001728', 1, 'SEEK', '3300245015', '', '', '', '', 'Merkez Mahallesi Oğuzeli Caddesi 7B Blok No:27N/1 Çekmeköy/İSTANBUL', '', 'SARIGAZİ ', '51169265274', '862301 - ÖZEL SAĞLIK KURUMLARI TARAFINDAN SAĞLANAN DİŞ HEKİMLİĞİ UYGULAMA FAALİYETLERİ (YATILI HASTANE FAALİYETLERİ İLE DİŞ HİJYENİSTLERİ GİBİ PARAMEDİKAL DİŞ SAĞLIĞI PERSONELİNİN FAALİYETLERİ HARİÇ)', '33001035/maliye/135246', '2025-03-01', '', '', '', ' ei-syh-85894/17,03,2028'),
(70, 'Sena Gürlen/mükellef', 'SENA GÜRLEN', 'senagurlen@gmail.com', 'EMLAK KOMİSYONCULUĞU', '05324510938', 1, 'SEGU', '3700052170', '34-424629', '', '', '', 'Selimiye Mahallesi Harem İskele Caddesi No:43/A-B Üsküdar-İSTANBUL', 'Selimiye Mahallesi Harem İskele Caddesi İpek Apartmanı No:56/11 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '35887635960', '683101 - GAYRİMENKUL FAALİYETLERİ İÇİN ARACILIK HİZMETİ FAALİYETLERİ', '37000111/maliye/111000', '1999-01-01', '', '', '02163427358', 'None'),
(71, 'Serdar Özen/mükellef', 'SERDAR ÖZEN', 'serdar@serdarozen.com', '', '05322279519', 1, 'SEOZ', '6870105557', '', '2 8230 07 07 1550183 034 41 88 000 ', '', '', 'Atatürk Mahallesi Ertuğrul Gazi Sokak Metropol İstanbul C1 Blok No:2 B İç Kapı:376 Ataşehir/istanbul', '', 'KOZYATAĞI', '65854054524', '479114 - RADYO, TV, POSTA YOLUYLA VEYA İNTERNET ÜZERİNDEN YAPILAN PERAKENDE TİCARET - 932912 - SANATSAL OLMAYAN ETKİNLİKLERİN ORGANİZASYONUYLA İLGİLİ GÖRSEL-İŞİTSEL EKİPMANLARIN VE ÖZEL EFEKTLERİN TEKNİK PLANLANMASI, TEMİNİ, KURULUMU VE İŞLETİLMESİ', '68701994/maliye/127964', '2021-08-13', '', '65854054524-3/49FsqI64/62OzjU98', '', ' ei-syh-6611/03,05,2027'),
(72, 'Serdar Özen/mükellef', 'SERDAR ÖZEN', 'serdar@serdarozen.com', '', '05322279519', 1, 'SEOZ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ' ei-syh-6611/03,05,2027'),
(73, 'Şirin Sönmez/mükellef', 'ŞİRİN SÖNMEZ', 'dr.shirin@hotmail.com', '', '05323611829', 1, 'SISO', '7790237778', '', '', '', '', 'Selimiye Mahallesi Selimiye İskele Caddesi No:40-42/2 D:4 Üsküdar/istanbul', 'Selimiye Mahallesi Selimiye İskele Caddesi No:40-42/2 D:4 Üsküdar/istanbul', 'ÜSKÜDAR', '35503714772', '862205 - ÖZEL SAĞLIK KURUMLARI TARAFINDAN POLİKLİNİK VE YATILI OLMAYAN TIP MERKEZLERİNDE SAĞLANAN UZMAN HEKİMLİK İLE İLGİLİ UYGULAMA FAALİYETLERİ (YATILI HASTANE FAALİYETLERİ İLE EBE, HEMŞİRE VE FİZYOTERAPİSTLERİN PARAMEDİKAL FAALİYETLERİ HARİÇ)', '77906871/maliye/587436', '2025-02-03', '', '', '', 'None'),
(74, 'Sibel Vural/mükellef', 'SİBEL VURAL', 'vural.sibel@hotmail.com', '', '05323611829', 1, 'SIVU', '9260050502', '', '2 4773 08 08 1049297 034 40 13 000', '', '', 'Veysel Karani Mah. AsilTürk Cad. No:17 Sancaktepe/İSTANBUL', '', 'SULTANBEYLİ ', '48577296570', '477301 - ECZACILIK ÜRÜNLERİNİN PERAKENDE TİCARETİ', '77906871/maliye/587436', '1996-06-01', 'PENDIK', '48577296570-2/5260/7852', '02164197470', '135246-mm-krm/21,11,2025'),
(75, 'Soner Ersöz/mükellef', 'SONER ERSÖZ', 'sonerabana@gmail.com', '', '05445034547', 1, 'SNER', '3700205398', '', '2 4690 07 07 1402539 034 10 78', '', '', 'Koşuyolu Mahallesi Koşuyolu Caddesi No:104/A Kadıköy/İSTANBUL', '', 'KADIKÖY', '10193640150', '432101 ', '37006537/maliye/558145', '2014-06-01', '', '10193640150-2/135246/135246', '', 'None'),
(76, 'Sacit Taşkın Bingöl/mükellef', 'SACİT TAŞKIN BİNGÖL', 'taskinbingol@hotmail.com', 'ÜLKEYE YAPILAN TOPTAN TİCARET', '05326119436', 1, 'STBI', '1760078166', '', '2 4690 07 07 1535763 034 41 24 000', '', '', 'Atatürk Mah.Ataşehir  49 Ada Kamelya No:1/13 /3 Ataşehir-İSTANBUL', 'Ataşehir Atatürk Mahallesi Ataşehir Bulvarı  Kamelya1  No: 9M D:3 Ataşehir-İSTANBUL', 'KOZYATAĞI', '18227290326', '469004 - BAŞKA ÜLKEYLE YAPILAN UZMANLAŞMAMIŞ TOPTAN TİCARET', '17600182/maliye/281006', '2000-04-05', 'KADIKÖY', '18227290326-3/31NmuK12/34RdeH35', '02164551451', ' ei-syh-5091/01,07,2027'),
(77, 'Şule Kurşuncu/mükellef', 'ŞULE KURŞUNCU', 'sule@kolektt.com', '', '05345635785', 1, 'SUKU', '5941162977', '', '', '', '', 'Vişnezade Mahallesi Maçka Meydanı Sokak No:36/10 Beşiktaş/İstanbul', 'Vişnezade Mahallesi Maçka Meydanı Sokak No:36/10 Beşiktaş/İstanbul', 'MECİDİYEKÖY', '34570850710', '479114 - RADYO, TV, POSTA YOLUYLA VEYA İNTERNET ÜZERİNDEN YAPILAN PERAKENDE TİCARET', '59416504/maliye/611257', '2022-08-01', '', '', '', 'None'),
(78, 'Sühan Vural/mükellef', 'SÜHAN VURAL', 'suhanbjk@hotmail.com', '', '05367835151', 1, 'SUVU', '9260725929', '', '2 4773 07 07 1416728 034 24 08 000', '', '', 'Esenevler Mah.Yunus Emre Caddesi No:41/B Ümraniye/İstanbul', 'Barbaros Mah. Ihlamur Bulvarı Uphill Court Sitesi Apt.No:12I D:39', 'ÜMRANİYE ', '48574296634', '477301 - ECZACILIK ÜRÜNLERİNİN PERAKENDE TİCARETİ', '92603509/maliye/905306', '2017-11-29', 'ÜMRANİYE', '48574296634-2/90AtkM99/52NygA06', '02164197470', '135246-mm-krm/21,11,2026'),
(79, 'Tarık Kuruoğlu/mükellef', 'TARIK KURUOĞLU', 'tarik.3737@icloud.com', '', '05423352022', 1, 'TAKU', '5980602344', '', '2 4711 07 07 1601653 034 13 51 000', '', '', 'Salacak Mahallesi Çiçekçi Sokak No:8/A Üsküdar/İstanbul', 'Mimar Sinan Mahallesi Gündoğdu Sokak No:10/1 Çekmeköy/İstanbul', 'ÜSKÜDAR ', '24719167434', '107203 - TATLANDIRILMAMIŞ DAYANIKLI HAMUR TATLILARI İMALATI (PİŞİRİLMİŞ OLSUN OLMASIN TATLANDIRILMAMIŞ KADAYIF, BAKLAVA VB.) (YUFKA İMALATI DAHİL) ', '59816994/maliye/111111', '2023-12-01', 'KADIKÖY ', '24719167434-2/41WicZ49/88CyiL61', '', ' ei-syh-7531/21,12,2026'),
(80, 'Uğur İmamoğlu/mükellef', 'UĞUR İMAMOĞLU', 'uurimamoglu@gmail.com', '', '05378468404', 1, 'UGIM', '4740225790', '', '2 7410 07 07 1580317 034 10 55 000', '', '', 'Dumlupınar Mahallesi Çeşme Sokak No:24C/107 Kadıköy/İstanbul', 'Dumlupınar Mahallesi Çeşme Sokak No:24C/107 ', 'GÖZTEPE', '11954609140', '479114 - RADYO, TV, POSTA YOLUYLA VEYA İNTERNET ÜZERİNDEN YAPILAN PERAKENDE TİCARET - ', '47409014/maliye/111111', '2021-08-11', '', '11954609140-2/99RjfZ85/84LmaD16', '', ' ei-syh-81893/28,01,2028'),
(81, 'Yasin Büdün/mükellef', 'YASİN BÜDÜN', 'yasinbdn34@gmail.com', '', '05530865744', 1, 'YABU', '1910505463', '', '2 4752 07 07 1423743 034 41 39 000', '', '', 'İçerenköy Mh. Karslı Ahmet Cd. No:41/1B Ataşehir-İstanbul', 'Kayışdağı Mh.Hilal Sk.No:61/5 Ataşehir-İstanbul', 'KOZYATAĞI', '23558570566', '432101', '19106763/maliye/368601', '2018-03-15', 'KADIKÖY ', '23558570566-2/71DumW46/77MvzC81', '02165734651', ' ei-syh-7577/27,06,2027'),
(82, 'Zeynep Alpan Bozkurt/mükellef', 'ZEYNEP ALPAN BOZKURT', 'bozkurt.yagmur@gmail.com', '', '05327044334', 1, 'ZABO', '0560153759', '', '2 4773 07 07 1375176 034 13 69', '', '', 'Valide-İ Atik Mahallesi Dr.Fahri Atabey Caddesi No:97/A Üsküdar/İstanbul', '', 'ÜSKÜDAR ', '35425717004', '477301 - ECZACILIK ÜRÜNLERİNİN PERAKENDE TİCARETİ', '05601448/maliye/703301', '2016-03-10', '', '35425717004-2/79UslI26/97QzbQ93', '02163377271', '343457-mm-krm/21,11,2027'),
(83, 'Zafer Savaş/mükellef', 'ZAFER SAVAŞ', 'sesyapimalzemeleri@gmail.com', 'ses yapı malzemeleri', '05378275511', 1, 'ZASA', '7531004232', '', '2 4752 07 07 1577947 034 13 13 000', '', '', 'Selimiye Mahallesi Kışla Caddesi No:19/A Üsküdar-İSTANBUL', '', 'ÜSKÜDAR', '64246231772', '468301 - ÇİMENTO, ALÇI, HARÇ, KİREÇ, MOZAİK VB. İNŞAAT MALZEMELERİ TOPTAN TİCARETİ ', '75312509/maliye/111111', '2023-03-30', '', '64246231772-2/53CepW75/77IwcS16', '02163345201', 'ei-syh-8666/13,06,2027'),
(84, 'Nalan Zeynep Demir/ortak', 'ALARGA MADENİ YAĞ VE ENDÜSTRİYEL KİMYA SANAYİ TİC LTD ŞTİ', 'zeynepd77@gmail.com info@alargaglobal.com.tr', '', '05330941740', 1, 'ALLT', '0481426946', '', '2 4681 07 07 1652825 034 24 07 000', '', '', 'Esenkent Mahallesi Numan Tekcan Sokak Emiroğulları Apartmanı No:10/A Ümraniye-İSTANBUL', 'Zühtüpaşa Mh. Kördere Sk. No:26-1/5 Kadıköy-İstanbul', 'SARIGAZİ', '', '468101 - SIVI YAKITLAR VE BUNLARLA İLGİLİ ÜRÜNLERİN TOPTAN TİCARETİ', '04808908/maliye/809808', '2020-10-20', '', '29999419518-3/84OyzD81/92YzeL01', '', 'None'),
(85, 'Kadir Kılıç/ortak', 'AVOK TASARIM İNŞAAT LTD ŞTİ', 'info@avokdesign.com kadir@kadirkilic.com.tr ', '', '05324600088', 1, 'AVLT', '1061318199', '241434-5', '', '', '', 'Tepe Üstü Mahallesi Doğanevler Caddesi No:28/3 Ümraniye/İSTANBUL', 'TEPEÜSTÜ MAH. DOĞANEVLER CAD. NO:28/4 ÜMRANİYE/İSTANBUL', 'ALEMDAĞ', '', '711101 - MİMARLIK FAALİYETLERİ VE MİMARİ DANIŞMANLIK FAALİYETLERİ (KÜLTÜREL MİRAS VARLIKLARININ KORUNMASINI VE RESTORASYONUNU DESTEKLEYEN MİMARİ FAALİYETLER İLE İÇ MİMARLIK FAALİYETLERİ DAHİL) - 741300 - İÇ TASARIM FAALİYETLERİ', '', '2020-03-16', '10609020/maliye/020906', '', '', 'None'),
(86, 'Serdar Özcan/ortak', 'BEİTSTAD PARTNERS DANIŞMANLIK VE TİC LTD ŞTİ', 'serdarozcan@gmail.com', '', '05324573629', 1, 'BELT', '1601777488', '', '2 6210 07 07 1573369 034 13 91 000', '', '', 'Valide-İ Atik Mahallesi Nuhkuyusu Caddesi No:73/A Üsküdar/İstanbul', '', 'ÜSKÜDAR', '', '621000 - BİLGİSAYAR PROGRAMLAMA FAALİYETLERİ ', '16019026/maliye/111111', '2023-02-02', '', '14996662722-2/41ZnoI43/90AftN45', '', '135246-mm-krm/23,02,2027'),
(87, 'Gülşen Küpçüler/ortak', 'BUTİK KAMİL TEKSTİL SANAYİ VE TİC LTD ŞTİ', 'gulsenkupculer@gmail.com', '', '05366717792  ', 1, 'BULT', '1910121697', '404544', '2 4771 08 08 1039495 034 30 08 ', '', '', 'Zümrütevler Mah. Ertuğrul Gazi Cad. Fuaye Çarşısı B1 Blok No:10/34 Maltepe/İSTANBUL', 'Selimiye Mh.Harem İskele Cd.No:25/4 Üsküdar-İstanbul', 'KÜÇÜKYALI', '', '477104 - DİĞER DIŞ GİYİM PERAKENDE SATIŞI (PALTO, KABAN, ANORAK, TAKIM ELBİSE, CEKET, PANTOLON, ŞORT (TEKSTİL KUMAŞINDAN VEYA ÖRGÜ VE TIĞ İŞİ)) ', '19100187/maliye/781001', '1998-01-01', '', '14741374764-2/123456/123456', '02164179029', '135246-mm-krm/09,06,2028'),
(88, 'Ömer Çelikel/ortak', 'CELİKEL YAPI TİC LTD ŞTİ', 'omer7tepe@hotmail.com', '', '05305124286  ', 1, 'CELT', '2360806603', '888913', '2 4511 07 07 1483033 034 13 62 000', '', '', 'KISIKLI MAH.BAHA SOKAK ÇAMLICA EVLERİ D BLOK NO:35/17 ÜSKÜDAR/İSTANBUL', 'Kısıklı Mahallesi Baha Sokak Çamlıca Evleri No:35/17 Üsküdar-İSTANBUL', 'ÜMRANİYE ', '', '410001 - İKAMET AMAÇLI BİNALARIN İNŞAATI (AHŞAP BİNALARIN İNŞAATI HARİÇ) - 478114 - OTOMOBİLLERİN VE HAFİF MOTORLU KARA TAŞITLARININ PERAKENDE TİCARETİ (ELEKTRİKLİ OLANLAR İLE AMBULANS VE MİNİBÜS BENZERİ MOTORLU YOLCU TAŞITLARI DAHİL ', '23602306/maliye/603206', '2013-11-06', 'KADIKÖY', '12238811006-8/49FiaP16/08YleI79', '02163165839', '135246-mm-krm/28,05,2027'),
(89, 'Hanife Çaylı/ortak', 'DAYHAL ENDÜSTRİ MÜHENDİSLİK VE DANIŞMANLIK LTD ŞTİ', 'hanife.d@gmx.de  /  info@dayhal.com', '', '05375087104', 1, 'DALT', '2712041356', '', '2 7112 03 03 1129337 034 05 28 000', '', '', 'Keçeci Piri Mahallesi Hasköy Köprülü Sokak Ülkü Apt.No:9/10 Beyoğlu/İSTANBUL', 'Keçeci Piri Mah. Hasköy Köprülü Sok.Ülkü Apt.No:9/5 Beyoğlu/İst.', 'KASIMPAŞA', '', '711101 - MİMARLIK FAALİYETLERİ VE MİMARİ DANIŞMANLIK FAALİYETLERİ (KÜLTÜREL MİRAS VARLIKLARININ KORUNMASINI VE RESTORASYONUNU DESTEKLEYEN MİMARİ FAALİYETLER İLE İÇ MİMARLIK FAALİYETLERİ DAHİL)', '27121020/maliye/135246', '2024-11-01', '', '56524178008-2/88PsgM80/94IujJ30', '', '135246-mm-krm/29,11,2027'),
(90, 'Avni Demiral/ortak', 'DİPSAN SUALTI HİZMETLERİ SANAYİ VE TİC LTD ŞTİ', 'deepsan@hotmail.com info@dipsan.net', '', '05322009755   ', 1, 'DILT', '3010392535', '', '2 4291 07 07 1111017 034 13 41', '', '', 'Selimiye Mahallesi Selimiye İskele Caddesi No:53/1-A Üsküdar-İSTANBUL', 'FETİH MAHALLESİ SARIKAMIŞ SOK. NO:30/4 ATAŞEHİR/İSTANBUL', 'ÜSKÜDAR', '', '331500 - SİVİL GEMİLERİN VE TEKNELERİN ONARIM VE BAKIMI (YÜZEN YAPILAR, SANDAL, KAYIK, VB. BAKIM VE ONARIMI İLE BUNLARIN KALAFATLANMASI DAHİL) - 429101 - KIYI VE LİMAN İNŞAATLARI VE İLGİLİ HİDROMEKANİK YAPILARIN İNŞAATI (SU YOLLARI, KANAL VB. DAHİL)', '30100078/maliye/870001', '2003-06-23', 'KADIKÖY', '16123477056-2/135246/135246', '02163105324', '135246-mm-krm/24,11,2025'),
(91, 'Esme Narat/yetkili', 'DREAM TOWERS SİTESİ', 'towersdream@gmail.com', '', '05309497020', 1, 'DRSI', '3130599642', '', '2 6832 07 07 1347543 034 24 81 000', '', '', 'Tatlısu Mahallesi Şanlı Caddesi Dream Towers Sitesi No:50 A Blok D:1 Ümraniye/İSTANBUL', '', 'ALEMDAĞ', '', '683204 - BİR ÜCRET VEYA SÖZLEŞMEYE DAYALI OLARAK YAPILAN APARTMAN YÖNETİCİLİĞİ', '31308217/maliye/712803', '2017-06-01', 'ÜMRANİYE ', '22181158974-3/63TbjP91/78FsgA95', '02169398938', 'None'),
(92, 'Ömür Erol/ortak', 'ERKAR MEKANİK İTHALAT İHRACAT LTD ŞTİ', 'cnrerol00666@gmail.com', '', '05306070666', 1, 'EKLT', '3610606032', '', '2 4322 01 01 1562120 034 02 94 000', '', '', 'Yeşilköy Mahallesi Atatürk Caddesi Egs Business Park No:12/1 Bakırköy/İstanbul', '', 'BAKIRKÖY', '', '432203 - BİNA VE DİĞER İNŞAAT PROJELERİNDE SU VE KANALİZASYON TESİSATI VE ONARIMI ', '36107914/maliye/135246', '2025-04-03', 'BAKIRKÖY', '45442934780-2/89HikF97/76NthA32', '', '135246-mm-krm/12,05,2028'),
(93, 'Melek Konya/ortak', 'EVEREST YAŞAM AKADEMİSİ SPOR HİZMETLERİ LTD ŞTİ', 'melekkonya@gmail.com everestyasamakademisi@gmail.com', '', '05425180105', 1, 'EVLT', '3820410995', '', '2 9499 07 07 1471550 034 13 25  ', '', '', 'Küçük Çamlıca Mahallesi Bulgurlu Caddesi No:64/1 Üsküdar/İSTANBUL', '', 'ÜMRANİYE', '', '949916 - ENGELLİLERE, ETNİK GRUPLARA VE AZINLIKLARA YÖNELİK ÜYELİK GEREKTİREN BİRLİK VE KURULUŞLARIN FAALİYETLERİ', '38203714/maliye/554011', '2020-01-23', 'KADIKÖY', '35326268544-3/246135/246135', '', '135246-mm-krm/01,06,2028'),
(94, 'Bayram Uysal/yetkili', 'GALAVİA 4 SİTE YÖNETİMİ', 'bayram.uysal@anel.com.tr', '', '05058184654', 1, 'GASI', '3880784955', '', '2 6832 07 07 1391772 034 24 78', '', '', 'Armağanevler Mah.Başak Sok.No:23/2 Ümraniye/İstanbul', '', 'ÜMRANİYE', '', '', '', '2017-02-01', 'ÜMRANİYE', '49483741628-2/14LocR02/40MxnX09', '', 'None'),
(95, 'Ersin Yılmaz/ortak', 'HAFSA MEKANİK İTHALAT İHRACAT', 'hafsa.mknk@gmail.com', '', '05071542366', 1, 'HFLT', '4542109791', '', '2 4100 01 01 1527882 034 02 97 000', '', '', 'Yeşilköy Mahallesi Atatürk Caddesi Egs Business Park No:12/1 Bakırköy/İstanbul', '', 'BAKIRKÖY', '', '410002 - İKAMET AMAÇLI OLMAYAN BİNALARIN İNŞAATI', '45419329/maliye/223400', '2023-07-21', '', '35441267798-2/91WakB25/44HxyE89', '', '135246-mm-krm/07,06,2027'),
(96, 'Enes Kocaman/ortak', 'HALDAY ENDÜSTRİ MÜHENDİSLİK VE DANIŞMANLIK LTD ŞTİ', 'info@halday-industry.com', '', '05375087104', 1, 'HLLT', '4551024192', '', '2 7022 03 03 1119833 034 05 30', '', '', 'Barbaros Mahallesi Mor Sümbül Sokak Nidakule No:7/3F/12 Ataşehir/İSTANBUL', 'Keçeci Piri Mahallesi Hasköy Köprülü Sokak Ülkü Apt. No:9/10', 'KOZYATAĞI', '', '702002 - İNSAN KAYNAKLARI YÖNETİM DANIŞMANLIĞI FAALİYETLERİ - 711101 - MİMARLIK FAALİYETLERİ VE MİMARİ DANIŞMANLIK FAALİYETLERİ (KÜLTÜREL MİRAS VARLIKLARININ KORUNMASINI VE RESTORASYONUNU DESTEKLEYEN MİMARİ FAALİYETLER İLE İÇ MİMARLIK FAALİYETLERİ DAHİL)', '45509416/maliye/427521', '2022-02-03', 'BEYOĞLU', '11420956020-3/02YjnT31/42LxkV87', '', '135246-mm-krm/30,09,2027'),
(97, 'İdris Koru/ortak', 'İGK ENDÜSTRİ VE DIŞ TİCARET LTD ŞTİ', 'idriskoru@ig-k.com  idriskoru22@hotmail.com ', '', '05422329722  05425847192', 1, 'IGLT', '4700623805', '', '2 4791 07 07 1491513 034 24 06', '', '', 'Fatih Sultan Mehmet Mahallesi Poligon Caddesi Buyaka 2 Sitesi 3 Blok No:8C/1 Ümraniye/İSTANBUL', 'SALACAK MAH. NEYZENBAŞI HALİLCAN SOK.NO:35/7 ÜSKÜDAR/İSTANBUL', 'ALEMDAĞ', '', '461203 - BİRİNCİL FORMDAKİ METALLER VE METAL CEVHERLERİNİN TOPTAN SATIŞI İLE İLGİLİ ARACILARIN FAALİYETLERİ - 466405 - TEKSTİL ENDÜSTRİSİ MAKİNELERİ İLE DİKİŞ VE ÖRGÜ MAKİNELERİ VE PARÇALARININ TOPTAN TİCARETİ (EV TİPİ OLANLAR HARİÇ)', '47005274/maliye/472500', '2015-05-11', 'ÜMRANİYE', '49807522490-5/82EybH41/89CugO10', '02165042600  ', '135246-mm-krm/01,07,2027'),
(98, '/ortak', 'İSTEC SİBER GÜVENLİK BİLİŞİM VE DANIŞMANLIK LTD ŞTİ', 'info@istec.com.tr', '', '05556252400', 1, 'ISLT', '4811352216', '447299-5', '', '', '', 'Üniversite Mahallesi Sarıgül Sokak No:37/1/3 Avcılar/İstanbul', 'Çamlık Mah. Semerkant Bulvarı No:36 A6 Blk. Daire:11', 'AVCILAR', '', '621000 - BİLGİSAYAR PROGRAMLAMA FAALİYETLERİ', '48120075/maliye/258258', '2023-03-03', '', '', '', '135246-mm-krm/19,12,2027'),
(99, 'Kenan Taşyüz/ortak', 'JUBATUS BİLİŞİM VE EĞİTİM HİZMETLERİ TİC LTD ŞTİ', 'kenantasyuz@elif.com  kenan.tasyuz@outlook.com', '', '05336915390  ', 1, 'JULT', '4840838373', '', '2 6210 07 07 1591603 034 13 89 000', '', '', 'Barbaros Mahallesi Veysipaşa Sokak Nazif Bey Sitesi B Blok No:6/2 D:12 Üsküdar/İstanbul', 'Kısıklı MahallesiI Hakkı Sokak  No:15/10 Üsküdar-İSTANBUL', 'ÜSKÜDAR', '', '621000 - BİLGİSAYAR PROGRAMLAMA FAALİYETLERİ', '48404056/maliye/650404', '2013-03-19', 'KADIKÖY', '16288683934-5/59AryR50/05LuuU64', '02163356329', '135246-mm-krm/06,06,2027'),
(100, 'Kamil Kandemir/ortak', 'KAMİL MAĞAZALARI TEKSTİL SANAYİ VE TİC LTD ŞTİ', 'kamilkandemir_62@hotmail.com  kamilkandemir62ocak@gmail.com', '', '05323772024', 1, 'KALT', '4940036657', '', '2 4771 07 07 1020224 034 13 40', '', '', 'Salacak Mahallesi Harem İskele Caddesi No:30/A Üsküdar-İSTANBUL', '', 'ÜSKÜDAR', '', '477104 - DİĞER DIŞ GİYİM PERAKENDE SATIŞI (PALTO, KABAN, ANORAK, TAKIM ELBİSE, CEKET, PANTOLON, ŞORT (TEKSTİL KUMAŞINDAN VEYA ÖRGÜ VE TIĞ İŞİ))', '49400020/maliye/135246', '1995-01-03', 'KADIKÖY', '42181508920-3/135246/135246', '02163421288', '135246-mm-krm/13,05,2028');
INSERT INTO `customers` (`id`, `full_name`, `company`, `email`, `tabela`, `phone`, `status`, `code`, `website`, `odasicil`, `sgksicil`, `efaturaportal`, `earsivportal`, `isyeriadres`, `evadres`, `vergidairesi`, `tc`, `edevletsifre`, `gib`, `isebaslamatarihi`, `sgkmudurulugu`, `sgksifre`, `istelefon`, `malimuhur`) VALUES
(101, 'Levent Leventoğlu/ortak', 'LEVENTOĞLU GIDA TUR. SANAYİ VE TİC LTD ŞTİ', 'lleventoglu@hotmail.com', '', '05322429588', 1, 'LELT', '6080313419', '', '2 5611 02 02 1080168 034 03 38 000', '', '', 'KÜLTÜR MAH. SEKBANLAR CAD. KONUT 55 /1C BEŞİKTAŞ/İSTANBUL', 'KÜLTÜR MAH. IETT BLOKLARI YOLU SK. HAREKET SITESI I.E.T.T. BLOKLARI 22. BLOK No:17/4 BESIKTAS-ISTANBUL ', 'BEŞİKTAŞ', '', '561101 - GENEL LOKANTA VE RESTORANLARIN (İÇKİLİ VE İÇKİSİZ) FAALİYETLERİ', '60801709/maliye/135246', '2003-08-28', 'İSTANBUL', '48745664880-2/51NycW77/54AzbH82', '', '135246-mm-krm/11,06,2028'),
(102, 'Abbas Koyi/ortak', 'LİVA HİLL DIŞ TİCARET LTD ŞTİ', 'abbas.koyi@livahill.com  abbas.koyi70@gmail.com', '', '05302394199', 1, 'LVLT', '6090533925', '', '2 4771 07 07 1497433 034 13 09 000', '', '', 'Kısıklı Mah. Bahar Arkası Sok. No:15/4 Üsküdar-İstanbul', 'KISIKLI MH.BAHAR ARKASI SK. NO:15/4 ÜSKÜDAR-İSTANBUL', 'ÜMRANİYE', '', '469001 - UZMANLAŞMAMIŞ TOPTAN TİCARET (BİR BAŞKA ÜLKEYLE YAPILAN TOPTAN TİCARET HARİÇ) - 469004 - BAŞKA ÜLKEYLE YAPILAN UZMANLAŞMAMIŞ TOPTAN TİCARET ', '60904857/maliye/760607', '2015-06-17', 'KADIKÖY ', '99280309774-3/89IupD90/64RgsH90', '', '135246-mm-krm/01,07,2027'),
(103, 'Ali Burhan Bölükbaş/ortak', 'MEDYAMAT REKLAM ANONİM ŞTİ', 'burhanbolukbas@gmail.com  burhan@medya360.com.tr  ali@medyamat.com.tr  ', '', '05326734943', 1, 'MDAS', '6330496632', '', '2 7311 02 02 1220052 034  12 48 000', '', '', 'Merkez Mahallesi Hasat Sokak No:52/2 Şişli-İSTANBUL', 'Altıntepe Mahallesi Zakkum Sokak No:12/12 Maltepe-İSTANBUL', 'ŞİŞLİ', '', '731101 - REKLAM AJANSLARININ FAALİYETLERİ (KULLANILACAK MEDYANIN SEÇİMİ, REKLAMIN TASARIMI, SÖZLERİN YAZILMASI, REKLAM FİLMLERİ İÇİN SENARYONUN YAZIMI, SATIŞ NOKTALARINDA REKLAM ÜRÜNLERİNİN GÖSTERİMİ VE SUNUMU VB.)', '63301998/maliye/899103', '2013-05-10', 'ŞİŞLİ', '32492169590-2/135246/135246', '02129631384  ', '135246-mm-krm/05,01,2027'),
(104, 'Ali Burhan Bölükbaş/ortak', 'MEDYA360 REKLAM VE YAYINCILIK DIŞ TİCARET LTD ŞTİ', 'burhan@medya360.com.tr', '', '05326734943  ', 1, 'MELT', '6130756404', '', '2 7312 07 07 1311919 034 13 56 000', '', '', 'Murat Reis Mahallesi Selamet Sokak No:9 Üsküdar-İSTANBUL', 'Altıntepe Mahallesi Değirmenyolu Caddesi No:18/20-12 Maltepe-İstanbul', 'ÜSKÜDAR', '', '731202 - ÇEŞİTLİ MEDYA REKLAMLARI İÇİN ALAN VE ZAMANIN BİR ÜCRET VEYA SÖZLEŞMEYE DAYALI OLARAK SATIŞI', '61306217/maliye/712603', '2013-03-04', 'KADIKÖY', '39718561718-2/135246/135246', '02163423838', '441460-mm-krm/02,06,2026'),
(105, 'Ümit İşeri/ortak', 'MOJ MÜCEVHERAT LTD ŞTİ', 'umitiseri@pandantif.com', '', '05322610597', 1, 'MJLT', '6222110670', '', '2 4777 01 01 1041912 050 01 52 000', '', '', 'Tekelli Mahallesi Tekelli Oteller Caddesi No:1 Uchisar Beldesi/Merkez/Nevşehir', 'Bahçelievler Mh. 7083 Sk. No:8/3 Bodrum-Muğla', 'NEVŞEHİR', '', '477701 - ALTIN VE DİĞER DEĞERLİ METALLERDEN TAKI, EŞYA VE MÜCEVHERAT PERAKENDE TİCARETİ (KUYUMCULUK ÜRÜNLERİ PERAKENDE TİCARETİ DAHİL, GÜMÜŞTEN OLANLAR HARİÇ)', '62220905/maliye/895534', '2021-11-12', '', '', '', 'None'),
(106, 'Hasan Emrah Adanur/ortak', 'MEK KİMYA ENDÜSTRİYEL KİMYASAL SANAYİ VE TİC LTD ŞTİ', 'emrah_adanur10@hotmail.com', '', '05533007161', 1, 'MKLT', '6141584251', '', '2 4681 07 07 1673158 034 24 67 32', '', '', 'Esenkent Mahallesi Numan Tekcan Sokak No:10/A Ümraniye/İstanbul', 'BARBAROS MAHALLESİ BAŞKAN SOKAK NO:43/17 ÜSKÜDAR/İSTANBUL', 'SARIGAZİ', '', '468101 - SIVI YAKITLAR VE BUNLARLA İLGİLİ ÜRÜNLERİN TOPTAN TİCARETİ', '61420361/maliye/111111', '2022-06-28', '', '31049370984-2/04QreW76/42HnqR04', '', '181210-mm-krm/28,08,2028'),
(107, '/ortak', 'PEKKİM ENDÜSTRİYEL KİMYA SANAYİ TİC LTD ŞTİ', 'zeynepd77@gmail.com   muhasebe@pekkim.com.tr', '', '05330941740', 1, 'PELT', '7270502723', '', '2 2041 07 07 1542090 034 24 46 000 ', '', '', 'Esenkent Mahallesi Yerdemir Sokak No:18-1/1 Ümraniye/İstanbul', 'SEMERCİLER MAH.LÜLECİ SK.NO:9/6', 'SARIGAZİ', '', '204104 - SABUN, YIKAMA VE TEMİZLEME MÜSTAHZARLARI (DETERJANLAR) İLE SABUN OLARAK KULLANILAN MÜSTAHZARLAR İMALATI (KİŞİSEL BAKIM İÇİN OLANLAR İLE OVALAMA TOZ VE KREMLERİ HARİÇ)', '72704687/maliye/513322', '2022-01-03', '', '29999419518-2/78LpzE66/56HagC38', '', '135246-mm-krm/29,11,2026'),
(108, 'Osman Bey/ortak', 'SEÇKİN İNŞAAT TAAH. VE İNŞ. MALZ. SAN. VE TİC. LTD. ŞTİ', 'muhasebe@avrasyagida.com.tr  info@seckininsaat.com.tr', '', '05413535100', 1, 'SECLTD', '7580102643', '', '2 7020  07 07 1143598 034 24 30 000 ', '', '', 'Şerifali Mah.Kule Sok.Twınpark Konutları B Blok No:4B/1 Ümraniye/istanbul', 'SAHRAYICEDIT MAH. ŞEHİT İLHANLAR SK. NO:3/15 KADIKÖY-ISTANBUL', 'SARIGAZİ', '', '682002 - KENDİNE AİT VEYA KİRALANAN GAYRİMENKULÜN KİRALANMASI VE İŞLETİLMESİ', '75801170/maliye/758251', '2000-10-12', 'ÜMRANİYE', '23863889872-4/1669/2841', '02163877067  02164662618', '74230601-mm-krm/05,06,2026'),
(109, 'Ali Yurdakul/ortak', 'TEK DÜRÜMCÜ MEMO RESTORAN LTD ŞTİ', 'aliyurdakul1969@gmail.com  sinasikuytak@hotmail.com ', '', '05323742535  05435380092', 1, 'TELT', '8330919946', '193556-5', '2 5611 07 07 1452986 034 13 85 000', '', '', 'Murat Reis Mahallesi Nuhkuyusu Caddesi No:261 Üsküdar-İstanbul', '', 'ÜSKÜDAR', '', '561101 - GENEL LOKANTA VE RESTORANLARIN (İÇKİLİ VE İÇKİSİZ) FAALİYETLERİ', '83308306/maliye/603803', '2019-05-21', 'KADIKÖY ', '25924674380-6/79BmoF69/48SgoR83', ' 02163436065  02163437073', '135246-mm-krm/11,06,2028'),
(110, 'Cemil Çakıroğlu/ortak', 'TROF GLOBAL AHŞAP YAPI SANAYİ VE İNŞAAT İTHALAT İHRACAT ANONİM ŞTİ', 'cakiroğlu.2014@gmail.com', '', '05332250442  ', 1, 'TRAS', '8591474854', '', '', '', '', 'Mimar Sinan Mahallesi Atlas Çıkmazı Sokak Üsküdar Kapalı Çarşı No:13/1/8 Üsküdar/İstanbul', '', 'ÜSKÜDAR', '', '410004 - İKAMET AMAÇLI AHŞAP BİNALARIN İNŞAATI', '85922603/maliye/135246', '2024-09-03', '', '', '02164959656', 'None'),
(111, 'Aram Hameed Tahaer/ortak', 'WHİTEJET EXPRESS LOJİSTİK LTD ŞTİ', 'aram@whitejet.net', '', '05313994343  05522920120  ', 1, 'WHLT', '4691112998', '', '2 7022 05 05 1156851 034 06 91', '', '', 'Haseki Sultan Mahallesi Turgut Özal Millet Caddesi İnan İşhanı Blok No:11/514 Fatih-İstanbul', 'Mehmet Akif Mahallesi Okay Caddesi B Blok N:14B/14 Ümraniye-İstanbul', 'BEYAZIT ', '', '469004 - BAŞKA ÜLKEYLE YAPILAN UZMANLAŞMAMIŞ TOPTAN TİCARET - 494103 - KARA YOLU İLE ULUSLARARASI YÜK TAŞIMACILIĞI (GIDA, SIVI, KURU YÜK, VB.) (GAZ VE PETROL ÜRÜNLERİ HARİÇ) - 702001 - İŞLETME VE DİĞER İDARİ DANIŞMANLIK FAALİYETLERİ', '46907516/maliye/615709', '2019-07-31', 'FATİH ', '99612013720-3/98FgeF87/67WlcF21', '', '135246-mm-krm/27,11,2027'),
(112, 'Ali Yurdakul/ortak', '24 AYAR YENİ NESİL ORGANİK GIDA SANAYİ TİC LTD ŞTİ', 'aliyurkakul1696@gmail.com', '', '05323742535', 1, 'YILT', '0012726940', '', '2 1013 07 07 1644662 034 40 89 000 ', '', '', 'Kemal Türkler Mahallesi Atatürk Caddesi No:152B/1 Sancaktepe/İSTANBUL', 'Selimiye Mahallesi Harem İskele Caddesi Kudret Palas No:19/5', 'SULTANBEYLİ', '', '463201 - KÜMES HAYVANLARI VE AV HAYVANLARI ETLERİNİN TOPTAN TİCARETİ', '00135269/maliye/135246', '2025-01-09', '', '25924674380-7/38TahR44/46UsbT28', '', '135246-mm-krm/28,08,2028'),
(113, 'Murat Gider/ortak', 'DENİZ KEBAP MURAT GİDER ORTAKLIĞI', 'gidermurat37@gmail.com', '', '05327621687', 1, 'ZDOR', '3010542807', '', '2 5611 07 07 1208251 034 13 81 000', '', '', 'SALACAK MAH. HAREM İSKELESİ CAD. DENİZ APT. NO:22/00', 'Cumhuriyet Mahallesi Molla Cami Sokak No:9-11/5 Üsküdar-İstanbul', 'ÜSKÜDAR', '', '561103 - DÖNER, CİĞER, KOKOREÇ, KÖFTE VE KEBAPÇILARIN FAALİYETİ (GARSON SERVİSİ SUNANLAR İLE SELF SERVİS SUNANLAR DAHİL; İMALATÇILARIN VE AL GÖTÜR TESİSLERİN FAALİYETLERİ İLE SEYYAR OLANLAR HARİÇ)', '30116589/maliye/552510', '2009-12-23', 'KADIKÖY ', '14783502842-2/93OoiO31/93ItrS15', '02163100932', '135246-mm-krm/14,12,2026'),
(114, 'DİĞER MÜŞTERİLER', 'DİĞER MÜŞTERİLER', '', NULL, '', 1, 'ZZZZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'SEMİH KÜRKÇÜOĞLU', 'S.S. ÇENGELKÖY BAHÇELİEVLER', 'yonetim@cengelkoop.com', 'None', '02163329904', 1, 'CEKO', '2420020121', 'None', '2 8210 07 07 1044890 034 13 68 000', 'None', 'None', 'Küçüksu Mahallesi Öztürk Sokak 2001 Sitesi No:1/U Üsküdar-İSTANBUL', 'Salacak Mahallesi Halk Dersanesi Caddesi Kuruntu Sokak No:27/3 Üsküdar-İSTANBUL', 'ÜSKÜDAR', 'None', '681202 - KONUT YAPI KOOPERATİFLERİNİN FAALİYETLERİ', '24202420/maliye/024202', '1950-03-01', 'None', '41347224872-9/50EcyE77/21ChkO31', '02163329904', 'None'),
(116, 'bedriye canan gebeloğlu/mükellef', 'BEDRİYE CANAN GEBELOĞLU', '', 'None', '', 1, 'BCGE', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', '', 'None', 'None', 'None', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faaliyet_raporu`
--

CREATE TABLE `faaliyet_raporu` (
  `id` int NOT NULL,
  `muhatap` varchar(255) COLLATE utf8mb3_turkish_ci NOT NULL,
  `user_id` int NOT NULL,
  `phone` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `tarih` date NOT NULL,
  `saat` time NOT NULL,
  `customer_id` int NOT NULL,
  `konu` text CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `faaliyet_raporu`
--

INSERT INTO `faaliyet_raporu` (`id`, `muhatap`, `user_id`, `phone`, `tarih`, `saat`, `customer_id`, `konu`, `created_at`) VALUES
(57, 'komple personel', 5, '', '2025-10-29', '14:20:00', 13, 'stajyer hariç tam kadro Cumhuriyet bayramında çalışıldı', '2025-10-29 14:21:47'),
(58, 'ofis içi', 10, '', '2025-10-23', '09:54:00', 112, '6. ve 7. ayda maliyede gözükmediği için girilmeyen faturalar ekstreden tespit edildi ve kayıtlara eklendi. kdv beyannamesine düzeltme verildi', '2025-11-03 09:56:01'),
(59, 'eylem hanım', 11, '', '2025-10-23', '09:56:00', 93, '23.10.2025 tarihli vd gelen  tebligata istinaden EMMAS REKLAM KAĞIT BİLİŞİM DANIŞMANLIK firmasına ait  2023/12  dönemlerine ait  kdv düzeltme beyannamesi yapılmıştır.ödeme bilgisi liste şeklinde eylem hanımın whatsappına gönderilmiştir. ', '2025-11-03 09:57:05'),
(60, 'vergi dairesi', 9, '', '2025-10-07', '09:57:00', 23, 'Airbnb geliri için memur Fatih bey arayıp kdv nin %10 dan verildiğini, %20 istediklerini söyledi. Konaklama olarak değil ticari iş olarak değerlendiriyorlarmış. Düzeltme yapılıp bilgi verildi tamam dosyayı kapatıyorum dedi. Tel: 0216 613 20 15', '2025-11-03 09:58:35'),
(61, 'vergi dairesi', 10, '', '2025-10-15', '09:58:00', 113, '2 firma için gelen düzeltme yazısına istinaden 2024/1-2-3 dönemlerine ait kdv beyannameleri düzeltildi. ilgili evraklar vergi dairesine mail ve posta ile gönderildi. bizde kalan evraklar mavi klasöre kaldırıldı.', '2025-11-03 10:00:15'),
(62, 'ali bey', 9, '', '2024-12-03', '10:03:00', 16, 'telefonla arayıp geçen ayın aynısı fatura kesermisin dedi, kesilip firmaya mail ve Ali abiye wp tan gönderildi.', '2025-11-03 10:04:03'),
(63, 'taşkın bey', 9, '', '2024-12-04', '10:04:00', 76, '\"Taşkın bey sauter firması iflas etti kayyum atadılar. Ödemeler yatacak mı belli değil ama ödeme alabilmek için fautra kesmem lazım dedi. 2900 euro kesilecekmiş. Ödemezlerse vergisini ödemek zorundamıyım nasıl olur dedi.\r\nNormal şartlarda fatura kesilir ödemezlerse faturaya istinaden icra yollanır dedik. O yola gidemeyeceği için napabiliriz dedi. Yurt dışı firması olduğu için faturayı keselim kdv dönemine kadar gelmezse itiraz edip iptal edelim dedik. Sonrasında faturayı kesip gönderin, faturayı iptal edelim. para gelirse yeniden bi fatura keseriz gelmezse hiç kayıtlara almayız dedik. Bunun geçerli bi yöntem olmadığını ama ortayua çıkma ihtimalinin düşük olduğunu söyledik. tamam bu şekilde yapalım dedi.\r\n\r\n\"', '2025-11-03 10:05:23'),
(64, 'SPLT-ümit han', 9, '', '2024-12-06', '10:10:00', 114, 'Ümit aradı, benim şirketin karar defterini haberim olmadan başkalarına vermişsiniz sıkıntı çekiyorum şuan diye konuya girdi. Biz habersiz bişey vermeyiz Yaşar zaten senin ortağında habersiz veilecek bi durum yok, hisse devrinden 3 ay sonra gelipte devri yaptık devamını yapmadık gibi şeyler oldu. Bende evrakın vs yok dedik. Noter sözleşmesi var mıdır diye sordu vardı onu wp tan gönderdik.', '2025-11-03 10:11:39'),
(65, 'ali bey/şinasi bey', 11, '', '2024-12-09', '10:11:00', 109, 'Tuncay bankaları girerken arabulucu Dilek Yüksel adına ödeme yapıldığını farkettik. Ali abi sorduk Şinasi bey takip ediyordu ona sorun dedi sorulduğunda e-serbest meslek makbuzunu gönderdi tarihi 31.10.2024 olduğu için Ekim ayına Düzeltme Beyannamesi yapıldı.tahakkuk fişi alındı.', '2025-11-03 10:13:14'),
(66, 'vergi dairesi', 9, '', '2024-12-10', '11:41:00', 77, 'Ökc almama cezası için vergi dairesiyle görüşüldü, içmimarlık ve tasarım faaliyetleriden dolayı geldiği söylendi, 3100 de bu faaliyetler yok dediler. İsterseniz itiraz dilekçesi yazın dediler. Dilekçe yazıldı.', '2025-11-03 11:43:24'),
(67, 'sercan', 9, '', '2024-12-17', '12:07:00', 67, 'Benzin istasyonuna uğradık, ito için 1 adet fotoğraf aldık. ito evraklarını ayarladık. ', '2025-11-03 12:18:08'),
(68, 'levent', 9, '', '2024-12-17', '12:18:00', 101, '2024/11 faturaları alındı. Ekim bordroları alındı. Kasım bordroları bırakıldı.', '2025-11-03 12:19:04'),
(69, 'alper', 9, '', '2024-12-17', '12:19:00', 17, '2024/11 faturaları alındı.', '2025-11-03 12:19:56'),
(70, 'enes bey', 9, '-', '2024-12-17', '12:19:00', 96, '2024/11 faturaları alındı.', '2025-11-03 12:21:30'),
(71, 'şule hanım', 9, '', '2024-12-17', '12:21:00', 77, '2024/11 faturaları alındı.', '2025-11-03 12:22:31'),
(72, 'melek hanım', 9, '', '2024-12-17', '12:22:00', 93, '2024/11 faturaları alındı.', '2025-11-03 12:23:29'),
(73, 'recep bey', 9, '', '2024-12-17', '12:23:00', 65, '2024/11 faturaları alındı.', '2025-11-03 12:24:19'),
(74, 'isa bey', 9, '', '2024-12-17', '12:24:00', 49, '2024/11 faturaları alındı.', '2025-11-03 12:25:50'),
(75, 'büşra hanım', 9, '', '2024-12-17', '12:25:00', 24, '2024/11 faturaları alındı.', '2025-11-03 12:26:46'),
(76, 'kenan bey', 9, '', '2024-12-17', '12:26:00', 99, '2024/11 faturaları alındı.', '2025-11-03 12:27:41'),
(77, 'ofis içi', 10, '', '2024-12-17', '12:27:00', 59, 'e-irsaliyeye geçme konusunda tereddüt olduğu için 189 alo maliye arandı. Telefonda e-faturaya zorunlu olarak geçildiği için kullanılmasa bile e-irsaliyeye de geçilmesi gerektiği söylendi.																		', '2025-11-03 12:28:53'),
(78, 'Umut bey', 9, '-', '2024-12-24', '12:28:00', 59, 'Umut e-imzayı getirdi edm kaydını yapıp geri verdik. O sırada burada bekledi.', '2025-11-03 12:30:03'),
(79, 'bekir bey', 9, '', '2024-12-26', '12:30:00', 22, 'Utts yi yaptıralım dedik. Bekir amca bi kaç yere tanıdığa sordum faturaları kullanmazsak sorun olmaz dediler yaptırmayalım dedi. Mehmet abi telefonda bana söyledi.', '2025-11-03 12:31:50'),
(80, 'eylem hanım', 11, '', '2025-01-02', '12:31:00', 93, 'SRK MEDYA LTD.ŞTİ. firmasına ait 2023 yılına ait 207.000 TL lik faturalar çıkarılıp 2023/05-06-07  dönemlerine ait KDV düzeltmeleri verildi.																		', '2025-11-03 12:33:18'),
(81, 'recep bey', 9, '', '2025-01-06', '12:33:00', 66, 'Belbim e fatura kesilecekmiş, Kdv dahil 1214,84 TL No:4442161 Yarın keseriz dedik.																		', '2025-11-03 12:35:03'),
(82, 'adnan bey', 9, '', '2025-01-06', '12:35:00', 88, 'Afyondaki 2560 m2 olan arsa nın güncel fiyatını sordu, yarın söyleyelim dedik.																		', '2025-11-03 12:36:36'),
(83, 'buse hanım', 9, '', '2025-01-07', '12:36:00', 23, ' kirası 3000 tl görünüyordu, eski kiracı olduğu için kira artış tarihi farklı olabilir diye güncel kirasını sorduk, ekimde 4500 tl yatırdım dedi. Stopaj bildirilmediği için ekim kasım kiralarını sistemden düzelttim.																		', '2025-11-03 12:37:33'),
(84, 'türkay bey', 11, '', '2025-01-10', '12:43:00', 7, '2025 kasa defteri ve noter makbuzlarının asılları verildi.	', '2025-11-03 12:45:53'),
(85, 'türkay bey', 11, '', '2025-01-10', '12:45:00', 7, '2025 kasa defteri ve noter makbuzlarının asılları verildi.																		', '2025-11-03 12:46:52'),
(86, 'kenan bey', 10, '', '2025-01-22', '12:46:00', 99, '2024/10 dönemine ait girilmesi unutulan More faturasının kayıtlara eklenmesiyle 2024/10-11-12 dönemlerine kdv düzeltmesi yapıldı.																	', '2025-11-03 13:00:16'),
(87, 'ali bey', 10, '', '2025-01-24', '13:00:00', 109, 'imza sirküsünün aslı kendisine verildi																		', '2025-11-03 13:01:42'),
(88, 'vergi dairesi', 9, '', '2025-01-22', '13:01:00', 55, 'İnfoteks marka yazarkasası alış yaptığından beri kullanımı yasak olduğu için boşta duruyordu. Seyyar pos alma hakkı bulunmamaktır uyarısı verince kasayı hurdaya ayırdık. Vergi dairesinede 10.01.2025 de  hurdaya ayırılacaktır diye bi yazı göndermiştik. 																																', '2025-11-03 13:03:32'),
(89, 'ofis içi', 5, '', '2025-01-27', '13:03:00', 10, '2024/12 damga vergisi boş beyan olarak verildi.																		', '2025-11-03 13:04:33'),
(90, 'diğer', 9, '', '2025-01-29', '13:04:00', 63, 'Memur ile görüştük müdür yardımcısı istediği için gönderin bakalım bi dedi. 2023 gelir ve gideri dbs den defter dökümü alıp gönderildi.																		', '2025-11-03 13:45:42'),
(91, 'vergi dairesi', 9, '', '2025-01-31', '13:45:00', 42, 'Vergi dairesi aranıp adres değişkliği tamamlattırıldı. Yeni levha alınıp Hatice hanıma gönderildi.																		', '2025-11-03 13:46:45'),
(92, 'deniz', 9, '', '2025-02-07', '13:46:00', 105, 'Moj\'un karar defteri tasfiyeye hazır halde IHIS eczanede Deniz\'e teslim edildi.																																																			', '2025-11-03 13:48:25'),
(93, 'hatice hanım', 9, '', '2025-02-10', '13:48:00', 42, 'Ruhsat için işlemi yapacak kişi nakil başvuru formunu istemiş. Sistemden alıp yolladık ama eski iş yeri olarak ev adresi kalmış. Bu yazının şart olmadığını belirttik, genel amaçlı dilekçe ile vergi dairesinden yazı talep ettik.																		', '2025-11-03 13:49:44'),
(94, 'levent bey', 10, '', '2025-02-11', '13:49:00', 101, 'şahsi e-imzası kendisine verildi.																', '2025-11-03 13:50:41'),
(95, 'recep bey', 9, '', '2025-02-11', '13:50:00', 66, ' 15 numaralı arşiv dosyası Recep ile süleyman a teslim edildi. 14 ün yanına koyun denildi.																		', '2025-11-03 13:51:51'),
(96, 'buse hanım', 9, '', '2025-02-12', '13:51:00', 23, 'saat 17:38 Vodafone 43bin tl lik fatura kesmiş, telefon sanıp faturasını istedik haberi olmadığını söyledi vodafone yi arayıp sordu sistemsel hata dikkate almayın demişler. Ödeme sayfasına girince normal borcu çıkıyormuş.																		', '2025-11-03 13:53:08'),
(97, 'serdar bey', 9, '', '2025-02-13', '13:53:00', 86, 'Kep adresi açıldı kendisine bilgi verildi, avukatla görüşmüş icra 7 şubattan önceyse ekstra ödeme yapmayacakmış 7 şubattan sonraysa mahkeme harçlarını ödemek zorunda kalacakmış.																		', '2025-11-03 14:00:38'),
(98, 'ali bey', 10, '', '2025-02-13', '14:00:00', 109, 'imza sirküsünün aslını geri getirdi.																		', '2025-11-03 14:01:38'),
(99, 'eylem hanım', 9, '', '2025-02-17', '14:01:00', 93, ' 2025/01 faturaları alındı.																		', '2025-11-03 14:02:27'),
(100, 'sühan bey', 9, '', '2025-02-17', '14:02:00', 74, ' 2025/01 faturaları alındı.																		', '2025-11-03 14:03:32'),
(101, 'sühan bey', 9, '', '2025-02-17', '14:03:00', 78, '2025/01 faturaları ve 6500 tl alındı.																		', '2025-11-03 14:04:25'),
(102, 'recep bey', 9, '', '2025-02-17', '14:04:00', 65, '2025/01 faturaları alındı.																		', '2025-11-03 14:05:02'),
(103, 'isa bey', 9, '', '2025-02-17', '14:05:00', 49, '2025/01 faturaları alındı.																		', '2025-11-03 14:05:40'),
(104, 'ali bey', 9, '', '2025-02-17', '14:05:00', 14, ' 2025/01 faturaları alındı.																		', '2025-11-03 14:06:32'),
(105, 'isa bey', 9, '', '2025-02-17', '14:06:00', 51, ' 2025/01 faturaları ve 2500 tl alındı.																		', '2025-11-03 14:07:24'),
(106, 'soner bey', 9, '', '2025-02-17', '14:07:00', 75, ' 2025/01 faturaları alındı.																		', '2025-11-03 14:08:06'),
(107, 'peri hanım', 9, '', '2025-02-17', '14:08:00', 95, ' 2025/01 faturaları alındı.																		', '2025-11-03 14:09:15'),
(108, 'erkan bey', 9, '', '2025-03-03', '14:09:00', 34, 'temizlik perakende ticareti 01.03.2025 tarihi itibarlye eklenme dilekçesi yazıldı.																		', '2025-11-03 14:10:38'),
(109, 'cahit bey', 9, '', '2025-03-03', '14:10:00', 25, ' İnşaat nace kodu 28.02.2025 tarihi itibariyle kapatılması istendi.																		', '2025-11-03 14:11:36'),
(110, 'cahit bey', 9, '', '2025-03-03', '14:10:00', 25, ' İnşaat nace kodu 28.02.2025 tarihi itibariyle kapatılması istendi.																		', '2025-11-03 14:11:36'),
(111, 'gülşen hanım', 9, '', '2025-03-03', '14:11:00', 87, '\"Eğitimi destekleyici faaliyetler 28.02.2025 tarihi itibariyle kapatılması istendi.\r\nBilgi formu gönderilip bilgi verildi.\"																		', '2025-11-03 14:13:37'),
(112, 'deniz bey', 9, '', '2025-03-03', '14:13:00', 29, ' Gıda içecek ve tütün ağırlıklı perakende satış kodu 01.03.2025 için başvuru yapıldı. Bilgi formu gönderilip bilgi verildi.\"																									', '2025-11-03 14:15:20'),
(113, 'hasan bey', 9, '', '2025-03-03', '14:15:00', 43, 'Hasan\'a 561109 nace kodunu ekleyelim mi diye sorduk.																		', '2025-11-03 14:16:34'),
(114, 'ersin bey', 9, '', '2025-03-03', '14:16:00', 95, ' Hafsa nın grubuna inşaat yapımı görünüyor tesisat a çevirelim mi diye sorduk biz hepsini yapıyoru dediler.																		', '2025-11-03 14:18:21'),
(115, 'peri', 9, '', '2025-03-03', '14:18:00', 75, ' Periye ekleyip çıkartılacak bişey var mı diye soruldu.																		', '2025-11-03 14:20:17'),
(116, 'diğer', 9, '', '2025-03-03', '14:20:00', 97, ' Nace kodları gönderildi eklenip çıkartılacak bişey var mı diye soruldu.																		', '2025-11-03 14:21:35'),
(117, 'zafer bey', 9, '', '2025-03-03', '14:21:00', 83, '\"İnternet satış kodu 01.03.2025 itibariyle talep edildi. Bilgi formu gönderildi.\"', '2025-11-03 14:22:42'),
(118, 'güngör bey', 5, '', '2025-03-06', '14:23:00', 38, ' 28.02.2025 tarihinde vd toplu denetiminde işyerinde eşini sigortasız işçi diye yazmışlar.güngör beye sorduk vd bir tanıdığım var ona bir sorayım dedi bir kaç gün sonra sorduğumuzda memur evrağa baktığını bundan bir şirşey çıkmaz herhangi bir şey yapmanıza gerek yok demiş.güngör beyin tablebi üzerine sgk ile ilgili hiç işlem yapılmadı.																		', '2025-11-03 14:25:26'),
(119, 'alper bey', 9, '', '2025-03-06', '14:25:00', 17, '2024/01-07 aylarına ait toplam 7 adet fatura paketi eczaneye bırakıldı.																		', '2025-11-03 14:26:36'),
(120, 'hasan bey', 9, '', '2025-03-07', '14:26:00', 43, ' \"561109 Yiyecek ağırlıklı hizmet veren kafe ve kafeteryaların faaliyetleri nace kodu 01.03.2025 tarihi itbairyle başvuru yapıldı.\r\nBilgi formu yapılıp gönderildi.\"																		', '2025-11-03 14:27:41'),
(121, 'emrah bey', 10, '', '2025-03-14', '14:27:00', 106, 'Karar defteri Zeynep hanıma verilmek üzere emrah beye teslim edildi.																		', '2025-11-03 14:30:22'),
(122, 'caner bey', 9, '', '2025-03-19', '14:30:00', 12, ' Diğer indirimler için gelen yazıya istinaden gönderen memur Caner bey ile görüşüldü, indirimin kaynağını göremedğimiz için istiyoruz göndermişsiniz sıkıntı yok dedi.																		', '2025-11-03 14:32:30'),
(123, 'avni bey', 9, '', '2025-03-27', '14:32:00', 90, 'Avni abi e imza yı getirdi. Diğer imzaların yanına asıldı.																		', '2025-11-03 14:33:27'),
(124, 'yasemin hanım', 10, '', '2025-04-04', '14:33:00', 54, ' e-imza yasemin hanıma verildi.																		 																', '2025-11-03 14:34:31'),
(125, 'YHOZ yurdun hanım', 11, '', '2025-03-18', '14:34:00', 114, '2022-2023-2024 GMSİ dosyalarını Yurdun hanıma büroda verdim.', '2025-11-03 14:36:07'),
(126, 'ZZZZ', 9, '', '2024-12-11', '14:36:00', 114, ' Orhan Harman (Salihin arkadaşı) ankaradan aynı işi yapıyormuş. Muhasebeci değiştirmek istiyor. kartal1835@gmail.com adresine defter tasdik ve muhasebe ücreti bilgilerini teklif olarak atıcaz. 																		', '2025-11-03 14:38:13'),
(127, 'AYLU merve hanım', 9, '', '2024-12-11', '14:38:00', 114, ' Gelen ceza nın neden kalmayacağı ile ilgili memuru arandı. Merve hanım ile görüşüldü. 2.cezanın neden kalkmadığı soruldu, bişey diyemedi tamam ben ilgilenicem bununla dedi. Kaldırılmayacağını size hangi memur söyledi dedi bilmediğimizi söyledik.																		', '2025-11-03 14:39:53'),
(128, 'AYLU  ', 9, '', '2024-12-13', '14:39:00', 114, ' 2.ceza kalkmış. 1.ceza için yapacak birşey yok demişlerdi.														', '2025-11-03 14:40:52'),
(129, 'SEPI', 5, '', '2024-12-17', '14:41:00', 114, '31.12.2024 itibari ile İADE 																		', '2025-11-03 14:42:21'),
(130, 'ZAHU', 9, '', '2024-12-17', '14:42:00', 114, '2024/11 faturaları alındı. Kasım ayı bordroları imzalatıldı.																		', '2025-11-03 14:43:39'),
(131, 'kader hanım', 11, '', '2025-01-10', '14:47:00', 115, ' 2025 kasa defteri ve noter makbuzlarının asılları verildi.																		', '2025-11-03 14:48:59'),
(132, 'kader hanım', 11, '', '2025-01-10', '14:48:00', 115, ' 2025 kasa defteri ve noter makbuzlarının asılları verildi.																		', '2025-11-03 14:50:27'),
(133, 'ERLT', 5, '', '2025-01-16', '14:50:00', 114, 'e-defter gönderimi için muvafakatname dilekçesi verildi																		', '2025-11-03 14:51:30'),
(134, 'HALT ', 5, '', '2025-01-16', '14:51:00', 114, 'e-defter gönderimi için muvafakatname dilekçesi verildi																		', '2025-11-03 14:52:08'),
(135, 'ERLT', 5, '', '2025-01-16', '14:52:00', 114, 'e-defter gönderimi için muvafakatname dilekçesi verildi																		', '2025-11-03 14:52:42'),
(136, 'HALT ', 5, '', '2025-01-16', '14:52:00', 114, 'e-defter gönderimi için muvafakatname dilekçesi verildi																		', '2025-11-03 14:53:41'),
(137, 'YUTU', 9, '', '2025-01-29', '14:53:00', 114, '2023 Kasım ayında Boteks tekstil den aldığı faturalar naylon diye çıkartılması istenmişti. 2023/11 Kdv sine düzeltme verildi. 2023/12-2024/04 arası kdv lerde önceki dönemden devir eden kdv değiştiği için düzeltme verildi. Yusuf a bilgi verilip 28.02.2025 tarihine kadar ödeme yapmasını cezalarda indirim olduğunu söyledik.																		', '2025-11-03 14:54:36'),
(138, 'EBIS', 10, '', '2025-02-11', '14:54:00', 114, 'Elif Büşra İşçioğlu nun 1 numaralı arşiv dosyası Kamil Mağazaları kamil beye verildi.																		', '2025-11-03 14:55:13'),
(139, 'SGHU cenk-harika', 11, '', '2025-03-25', '14:55:00', 114, '2022-2023-2024 GMSİ dosyalarını Cenk ve Harika hanıma büroda verdim.																		', '2025-11-03 14:55:58'),
(140, 'ZAHU mustafa bey', 9, '', '2025-04-07', '14:55:00', 114, 'yeni muhasebecisin elemanı mustafa ya 2024 tüm faturaları, özlük dosyaları, matbaa bilgi formu, 2021 yevmiye kebir ve envanter defteri, 2022-2023-2024 ve 2025 envanter defteri ve mali mühürü teslim edildi. Skoda marka bi arabayla geldiler. mali mühür özlük dosyasındaki poşetteydi kaybolmasın diye çıkarılıp ellerine verildi.																		', '2025-11-03 15:02:49'),
(141, 'alper bey', 11, '', '2025-04-15', '15:02:00', 17, '31.12.2024 tarihli ECZ2024000000031 nolu fatura selçuk eczaya ait faturayı 16.01.2025 tarihinde geri dönük kesmiş.ve muhasebeye haber vermemiş.biz aralık faturalarını 14 ocak 2025 de işlemişiz.bu faturayı mart 2025 faturalarını işledikten sonra cari hesap tutmayınca farkettik.Alper beyi aradık bu faturayı neden böyle geriye dönük kestiğini sorduk selçuk ecza istedi dedi.geri dönük fatura kesmenin cezası olduğunuda biliyor.bu faturayı 2024 aralık ayına işleyince kdv devrinden dolayı 3 kdv 1 gelir vergisi ve e-defterde düzeltme yapılması gerektiği cezasınında yaşlaşık 30.000 tl çıkabileceği söylendi.bunun riskine girerek 31,12,2024 deki  ECZ2024000000031 nolu fatura 01.03.2025 tarihli olarak mart 2025 de işlendi.																		', '2025-11-03 15:03:59'),
(142, 'ali bey', 9, '', '2025-04-29', '15:04:00', 109, 'mal sahiblerinden Nuri bey 2021 de vefat etmiş.2025 de mal sahipleri düzgün beyan edilmiş.2024 /01-12 dönemlerine düzeltme verildi.																		', '2025-11-03 15:06:22'),
(143, 'HICA hikmet bey', 9, '', '2025-04-16', '15:06:00', 114, 'Arşiv kolisi ofiste kendisine teslim edildi.																		', '2025-11-03 15:07:27'),
(145, 'eylem+ender', 9, '', '2025-05-08', '15:08:00', 93, '4-5-6-7 nolu fatura kolileri eylem ve ender beye büroya gelip kendilerine verildi.																		', '2025-11-03 15:09:19'),
(146, 'hüseyin bey', 9, '', '2025-05-16', '15:09:00', 46, 'Mal sahibi 2022 aralık ayında vefat etmiş. Bize bilgi gelmediği için ölen mal sahibi adına stopaj yatmış. Mirascısı oğlu arayıp bilgi alınca ortaya çıktı. 2024 yılı için yazı geldi bildirimi yapıcam dediği için 2024 yılı 12 ay ve 2025 yılı 3 ayı verilen 15 beyanname düzeltildi. 																		', '2025-11-03 15:11:33'),
(147, 'burhan bey', 10, '', '2025-05-23', '15:11:00', 104, 'medya360 15.04.2025 tarih ve ME620250000026 nolu faturaya karşı tarafın kep üzerinden itirazı nedeniyle kayıtlardan çıkarmak zorunda kaldık.  kdv beyannamesi resmileştiği için ve fatura tevkifatlı oldğu için mecburen kdv beyannamesini düzelttik. iadeye düşen 630 tl için herhangi bir iade talebinde bulunmamam kararı aldık.																		', '2025-11-03 15:12:43'),
(148, 'serdar bey', 9, '', '2025-05-28', '15:12:00', 71, 'ozge.baydar@vdk.gov.tr	\"12.05.2025 tarihinde gelen etebligatta Demet Akalın a yapılan ödemenin içeriği sorulmuştu. Mailden cevap verildi. Memur ilk acıklamayı yetersiz buldu 2.mail atıldı.\"																		', '2025-11-03 15:14:00'),
(149, 'ali bey', 9, '', '2025-05-29', '15:14:00', 112, 'Ali abi yazarkasanın ruhsatını bırakmıştı, aşağı klasörüne kaldırıldı.																		', '2025-11-03 15:15:14'),
(150, 'yasemin hanım', 10, '', '2025-06-03', '15:15:00', 54, 'Kadir Kesgine ait e-imza  Yasemin hanıma verildi.																		', '2025-11-03 15:16:29'),
(151, 'avni bey', 10, '', '2025-06-13', '15:16:00', 90, 'e-imza kendisine bırakıldı																		', '2025-11-03 15:17:41'),
(152, 'adilberk', 5, '', '2025-06-23', '15:17:00', 101, 'adilberk karımov mesleki yeterlilik belgesini getirdi																		', '2025-11-03 15:18:51'),
(153, 'yangıbay', 5, '', '2025-06-23', '15:18:00', 101, 'yeni yabancı sgk  kaydı için evrak bıraktı adı Yangıbay Sapayev 																		', '2025-11-03 15:20:07'),
(154, 'yasemin hanım', 9, '', '2025-06-25', '15:20:00', 54, ' e-imza alındı, e-fatura için iptal talebi yollandı.																		', '2025-11-03 15:21:17'),
(155, 'TALT buse turhan', 10, '', '2025-06-30', '15:21:00', 114, 'Tamet ltd nin 2024 yılı defteri Beyaz muhasebe çalışanı Buse turhan a ofiste teslim edildi. 05465133746 nihat beyin telefonu																		', '2025-11-03 15:23:25'),
(156, 'ZZZZ', 5, '', '2025-07-03', '15:23:00', 114, '2024 onaylı vergi levhaları mail ve whatsappdan gönderildi.																		', '2025-11-03 15:24:41'),
(157, 'burhan bey', 10, '', '2025-07-03', '15:24:00', 104, '5. aya ait unutulan tevkifatlı \"sefa sürücü\" isimli firmaya ait fatura banka kayıtlarından tespit edildi. kdv-2 için mayıs ayına pişmanlıkla beyanname verildi ve fatura 6. aya girildi. 																		', '2025-11-03 15:25:35'),
(158, 'eylem hanım', 11, '', '2025-07-04', '15:25:00', 93, '2025	07	04		EVLT	serpil	eylem	sigortalı gülşah öztürk normalde istifa etmiş ama işsizlik maaşı alabilmek için everestten rica etmiş işten çıkarma olarak  gösterirmisiniz diye everest yardım etmek amacıyla kabul etmiş.04,07,2025 tarihinde istifa olarak çıkışı yapılacak 05,07,2025 tarihine tekrar giriş yapılıp 07,07,2025 tarihinde işten çıkarma işlemleri yapılacak.bu işlemlerin aynı işverene ait olduğu için hülle girebileceği işkur tarafından kabul edilemeyeceği eylem hanıma söylendi.eylem hanım gülşah hanıma olayı anlatmış olmazsa sorun değil demiş.																		', '2025-11-03 15:26:10'),
(159, 'ali bey', 9, '', '2025-07-08', '15:26:00', 18, ' 2025/04 döneminde iade faturası 153 ve 391 alacak yerine borç sütununa işlenmiş. Nisan ve Mayıs kdv lerine düzeltme verildi. 																		', '2025-11-03 15:26:54'),
(160, 'hasan bey', 5, '', '2025-07-30', '15:26:00', 43, ' zirve e-defter güncellemesi ödendi.																		', '2025-11-03 15:27:46'),
(161, 'ali bey', 9, '', '2025-08-11', '15:27:00', 109, '7200 tl ödeme yaptı																		', '2025-11-03 15:28:18'),
(162, 'cemil bey', 9, '', '2025-08-11', '15:28:00', 110, 'cemil ve aziz bey gelip hisse devir evraklarına imza attı, 12bin tl ödeme istendi ibandan atarım yarın dedi.																		', '2025-11-03 15:28:49'),
(163, 'diğer', 9, '', '2025-08-11', '15:28:00', 101, ' adilberk in girişi 11.08.25 olarak yapıldı.																		', '2025-11-03 15:30:00'),
(164, 'diğer', 9, '', '2025-08-11', '15:30:00', 90, '3 işçi girişi gönderdi.																		', '2025-11-03 15:30:40'),
(165, 'diğer', 9, '', '2025-08-12', '15:30:00', 87, ' faturaları ve 10bin tl para verdi.																		', '2025-11-03 15:31:30'),
(166, 'eylem hanım', 9, '', '2025-08-22', '15:31:00', 93, 'Eylem  hanım whatsapptan bir tebligat geldiğini içeriğinin ne olduğunu bakabilirmisiniz dedi.bakıldığında naylon fatura için düzeltme vermemizi istediklerini ona bakarken mayıs ayındada bir tane geldiğini fakat kimsenin haberi olmadığı anlaşıldı ve eylem hanıma bilgi verildi.Eylem hanım şu an tatildeyim pazartesi günü düzeltmeleri verelim dedi.																		', '2025-11-03 15:32:21'),
(167, 'vergi dairesi', 10, '', '2025-08-25', '15:32:00', 93, ' 22.05.2025 tarihli vd gelen  SATÜRN REKLAM ORG.İN.METAL firmasına ait  2023/6+7+9+10+11 dönemlerine ait  kdv düzeltme beyannameleri yapılmıştır.ödeme bilgisi liste şeklinde eylem hanımın whatsappına gönderilmiştir. 																		', '2025-11-03 15:33:27'),
(168, 'vergi dairesi', 10, '', '2025-08-25', '15:33:00', 93, ' 21.08.2025 tarihli vd gelen  ESSMEN MATBACILIK firmasına ait  2023/12 ve 2024/01 dönemlerine ait  kdv düzeltme beyannameleri yapılmıştır.ödeme bilgisi liste şeklinde eylem hanımın whatsappına gönderilmiştir. 																		', '2025-11-03 15:33:57'),
(169, 'yasemin hanım', 10, '', '2025-08-25', '15:33:00', 54, 'e-imza yasemin hanıma verildi.																		', '2025-11-03 15:34:56'),
(170, 'yasemin hanım', 12, '', '2025-08-27', '15:34:00', 54, ' e-imza geri alındı. 7.500 tl ağustos muhasebe ücreti alındı.																		', '2025-11-03 15:35:58'),
(171, 'vergi dairesi', 11, '', '2025-08-27', '15:35:00', 113, '2025/08 ortaklık gerçek faydalanıcıya ilişkin bildirim formu düzenlendi.																		', '2025-11-03 15:36:55'),
(172, 'ZZZZ', 12, '', '2025-08-27', '15:36:00', 114, '9 adet mükellefe ait evrak bırakıldı. telefon numarası verildi, geri dönüş yapılacak. 																		', '2025-11-03 15:37:39'),
(173, 'deniz', 12, '', '2025-08-28', '15:37:00', 105, ' tasfiyeye giriş evrakları çanta içersinde hakan eczanesindeki Denize teslim edildi.																		', '2025-11-03 15:38:40'),
(174, 'diğer', 10, '', '2025-09-01', '15:38:00', 109, 'Üç adet vergi ve ceza ihbarnamesi için indirim talebi sisteme girildi.																		', '2025-11-03 15:39:51'),
(175, 'cemil bey', 5, '', '2025-09-09', '15:39:00', 110, 'Cemil bey ile görüştüm traf için hisse devri yapmıyoruz şirketin tasfiyesi içinde yılbaşına kadar bekliyoruz bu arada aldığım 12 bin liranın 3.000 lirasını kullandığımızı 9.000 lirasının bizde olduğunu söyledim parayı iade mi edeyim mahsuplaşırız mıyız diye sordum sizde kalsın mahsuplaşırız dedi .																																			', '2025-11-03 15:41:05'),
(176, 'eylem hanım', 10, '', '2025-09-10', '15:41:00', 93, '10.09.2025 vd gelen tebligata göre MKR REKLAM ORGANİZASYON  firmasına ait 2023 yılına ait kdv düzeltmeleri yapılması istenmektedir.Düzeltmeleler Eylem hanımın bilgisi dahilinde yapıldı ödeme vadeleri ve tahakkuk fişleri Eylem hanıma atıldı bilgi verildi.																		', '2025-11-03 15:42:03'),
(177, 'mehmet bey', 10, '', '2025-09-11', '15:42:00', 53, '2 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:43:06'),
(178, 'mehmet bey', 10, '', '2025-09-11', '15:43:00', 26, '1 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:44:24'),
(179, 'mehmet bey', 10, '', '2025-09-11', '15:44:00', 114, ' 4 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:45:30'),
(180, 'mehmet bey', 10, '', '2025-09-11', '15:45:00', 109, ' 10 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:46:11'),
(181, 'aydemir bey', 9, '', '2025-09-11', '15:46:00', 21, '5 numaralı arşiv kolisi teslim edildi. (arabanın bagajına konuldu)																		', '2025-11-03 15:46:51'),
(182, 'deniz bey', 9, '', '2025-09-11', '15:46:00', 47, '55-56-57-58 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:47:50'),
(183, 'tuncay bey', 10, '', '2025-09-11', '15:47:00', 90, '9 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:48:31'),
(184, 'deniz bey', 10, '', '2025-09-11', '15:48:00', 35, '7 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:49:21'),
(185, 'hasan bey', 10, '', '2025-09-11', '15:49:00', 43, '8 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:50:09'),
(186, 'ramazan bey', 10, '', '2025-09-11', '15:50:00', 64, '12 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:50:51'),
(187, 'gül hanım', 10, '', '2025-09-11', '15:50:00', 37, ' 12 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:51:39'),
(188, 'sibel hanım', 10, '', '2025-09-11', '15:51:00', 31, '7 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:52:56'),
(189, 'ümit bey', 10, '', '2025-09-11', '15:52:00', 32, '10 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:53:40'),
(190, 'fatih bey', 10, '', '2025-09-11', '15:53:00', 66, '16 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:54:31'),
(191, 'KULT tarık bey', 5, '', '2025-09-11', '15:54:00', 114, '5 ve irsaliye fatura psflerin olduğu arşiv kolisi teslim edildi.																		', '2025-11-03 15:56:34'),
(192, 'ilhan bey', 10, '', '2025-09-11', '15:56:00', 15, '4 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:57:17'),
(193, 'aziz bey', 10, '', '2025-09-11', '15:57:00', 25, '1 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:57:56'),
(194, 'deniz bey', 9, '', '2025-09-11', '15:57:00', 29, '1 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:58:54'),
(195, 'durmuş bey', 10, '', '2025-09-11', '15:58:00', 113, '14 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 15:59:43'),
(196, 'irem hanım', 9, '', '2025-09-11', '15:59:00', 48, '11-12-13-14-15 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 16:00:32'),
(197, 'FACA bakkal', 9, '', '2025-09-11', '16:00:00', 114, '1 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 16:01:14'),
(198, 'adem+recep bey', 9, '', '2025-09-11', '16:01:00', 65, '2 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 16:02:00'),
(199, 'emrah bey', 10, '', '2025-09-12', '16:02:00', 106, '1 nolu arşiv kolisi büroda Emrah beye teslim edildi.																		', '2025-11-03 16:02:57'),
(200, 'emrah bey ', 10, '', '2025-09-12', '16:02:00', 107, '2 nolu arşiv kolisi büroda Emrah beye teslim edildi.																		', '2025-11-03 16:03:34'),
(201, 'levent bey', 9, '', '2025-09-19', '16:03:00', 101, '12-13-14 numaralı arşiv kolileri Levent beyin arabasına konuldu.																		', '2025-11-03 16:04:04'),
(202, 'BRSA birol', 9, '', '2025-09-25', '16:04:00', 114, '2 numaralı arşiv kolisi teslim edildi.																		', '2025-11-03 16:04:43'),
(203, 'şehnaz hanım', 11, '', '2025-09-26', '16:04:00', 114, '5 ve 6 numaralı arşiv kolileri Şehnaz hanımın arabasının bagajına konuldu.																		', '2025-11-03 16:05:43'),
(204, 'serdar bey', 10, '', '2025-10-15', '16:05:00', 86, 'vergi dairesinden gelen yazıya istinaden konu Serdar beye soruldu. Kendisi ilgili faturaları aldığını ve bunu ispatlayabileceğini söyledi.  ilgili evraklar vergi dairesine mail ve posta ile gönderildi. bizde kalan evraklar mavi klasöre kaldırıldı.																		', '2025-11-03 16:06:22'),
(205, 'uğur bey', 10, '', '2025-10-15', '16:06:00', 95, 'vergi dairesinden gelen yazıya istinaden konu Uğur beye soruldu. Kendisi ilgili faturaları aldığını ve bunu ispatlayabileceğini söyledi.  Hatta iş yaptıkları firma ile mahkemelik olduklarını bildirdi. ilgili evraklar vergi dairesine mail ve posta ile gönderildi. bizde kalan evraklar mavi klasöre kaldırıldı.																		', '2025-11-03 16:07:04'),
(206, 'whatsapp', 5, '-', '2025-11-07', '00:00:00', 18, 'Önemli bir konuda uyarıda bulunacağım; Bankalardaki TİCARİ hesaplarınıza rakam gözetmeksizin giren ve çıkan her TL hareketin mutlaka bir belgesi olması lazımdır. (örnek; banka kartı veya kredi kartı veya havale ve eft ile herhangi bir işletmeden alışveriş yapıldıysa faturasının alınması alınan faturada vergi numarasının yazdırılması gerekli olduğu, veya xyz kişisinden bir para geldiğinde veya para yollandığında mutlaka bir sebebi ve karşılığı olması lazım gibi) Ticari banka hesaplarınızı şahsi iş ve işlemlerinizde KULLANAMASSINIZ kullanmak zorunda kalırsanız parayı önce ticari hesabınızdan kendi şahsi hesabınıza aktardıktan sonra şahsi hesabınızdan kullanabilirsiniz. Bu konular son zamanlarda maliyenin radarında olduğundan dolayı özellikle dikkat edilmesi ve belge düzenine uyulması gerekmekte olduğunu hatırlatırız. SELİMİYE AYDIN MUHASEBE', '2025-11-07 09:27:08'),
(207, 'whatsapp', 5, '-', '2025-11-07', '00:00:00', 34, 'Önemli bir konuda uyarıda bulunacağım; Bankalardaki TİCARİ hesaplarınıza rakam gözetmeksizin giren ve çıkan her TL hareketin mutlaka bir belgesi olması lazımdır. (örnek; banka kartı veya kredi kartı veya havale ve eft ile herhangi bir işletmeden alışveriş yapıldıysa faturasının alınması alınan faturada vergi numarasının yazdırılması gerekli olduğu, veya xyz kişisinden bir para geldiğinde veya para yollandığında mutlaka bir sebebi ve karşılığı olması lazım gibi) Ticari banka hesaplarınızı şahsi iş ve işlemlerinizde KULLANAMASSINIZ kullanmak zorunda kalırsanız parayı önce ticari hesabınızdan kendi şahsi hesabınıza aktardıktan sonra şahsi hesabınızdan kullanabilirsiniz. Bu konular son zamanlarda maliyenin radarında olduğundan dolayı özellikle dikkat edilmesi ve belge düzenine uyulması gerekmekte olduğunu hatırlatırız. SELİMİYE AYDIN MUHASEBE', '2025-11-07 09:27:29'),
(208, 'vergi dairesi', 11, '', '2025-11-07', '16:35:00', 93, 'Eylem hanımla görüştükten sonra E-42818777-622.02[3820410995]-1450503 SAYILI 7201116551 VERGİ KİMLİK NUMARALI YAKACIK VERGİ DAİRESİ PAMİR PASLANMAZ METAL İNŞAAT MAKİNA KİMYA FİRMASINA AİT FATURANIN ÇIKARTILMASI SEBEBİYLE DÜZENLENMİŞTİR.', '2025-11-07 16:36:17'),
(209, 'GÜNGÖR', 9, '', '2025-11-12', '13:06:00', 38, '2 koçan Sevk irsaliyesi verildi. \r\nNasıl kullanılacağı anlatıldı. Muhahkak tüm sayfaları kaşele dedik.\r\n1500 tl ödeme verdi.', '2025-11-12 13:07:43'),
(210, 'güngör', 9, '', '2025-11-12', '13:07:00', 38, '10.10.2025 tarihli kira kontratı verdi.\r\nAcıbadem Mah. İsmail hakkı bey sok. No:5/1 adresi\r\n', '2025-11-12 13:08:44'),
(211, 'deniz işeri', 9, '', '2025-11-12', '17:39:00', 105, 'Karar defteri ve tasfiyeyle ilgili evraklar mor eczane paketinde eczanede deniz e teslim edildi. Ümit beye haber verildi.', '2025-11-12 17:40:10'),
(212, 'Üsküdar vd', 10, '', '2025-11-19', '09:23:00', 90, '(Dıpsan için gelen fatura düzeltmesine aşağıdaki şekilde GİB üzerinden itiraz edildi) Tarafımıza gönderilen 17.11.2025 tarih ve E-35937125-250.993010392535 - 1498920 sayılı yazıya istinaden -Küçükyalı VD 4830997208 numaralı mükellefi İtibar Demir Çelik- fimasından 2021 yılında almış olduğum 2 adet faturanın muhteviyatı itibariyle yanıltıcı belge olduğu ve ilgili faturaların kdvleri için düzeltme yapmamız istenmiştir. \r\n\r\nİlgili firmadan almış olduğumuz ürünlere ait faturalar ekte olup, almış olduğumuz ürünler envanterimizda kayıtlı gemimizde kullanmak amacıyla satın alınmıştır. Bu ürünler hala gemimizde mevcut olup ilk yapıldığı dönemdeki resimleri ile şimdiki resimleri ektedir. Yine ilgili firmaya yapmış olduğumuz ödeme dekontları da ektedir. Ürünlerin alındığı dönem yapılan yazışmalar dahi hala telefonumuzda bulunmaktadır. \r\n\r\n2021 yılında şirket olarak yaklaşık 2.000.000 tl kar beyan etmişken 20.000 TLlik yanıltıcı belge almamız zaten mantığa aykırı bir durumdur.  \r\n\r\nEkte gönderdiğim belgelerin de incelenerek tarafımıza gönderilen yazının iptalini arz ederiz.', '2025-11-19 09:27:20'),
(213, 'LEVENT', 10, '', '2025-11-19', '16:37:00', 101, 'Personellerden Halimjanın biten çalışma izni dolayısıyla P1 belgesi gerekti. Yabancı personele ait motorlara P1 belgesi çıkaramadığımız için şirkete ait motora P1 belgesi çıkardık. ', '2025-11-19 16:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `title` varchar(250) COLLATE utf8mb3_turkish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `target_date` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `customer_id`, `title`, `created_at`, `target_date`, `status`) VALUES
(24, 7, 'BASI_konsiyon mizan', '2025-10-19 16:42:13', '2025-11-14 00:00:00', 1),
(25, 8, 'GULT_şantiye', '2025-10-19 16:50:24', '2025-11-30 00:00:00', 1),
(26, 9, 'ADBU_belediye ruhsatı ', '2025-10-19 16:59:12', '2025-11-30 00:00:00', 1),
(27, 10, 'ABKA_banka ekstreleri girilecek', '2025-10-19 17:20:29', '2025-10-21 00:00:00', 0),
(29, 12, 'MSKA_enpara ', '2025-10-19 21:53:59', '2025-11-30 00:00:00', 1),
(31, 13, 'fiyat farkı faturası', '2025-10-20 09:47:14', '2025-12-31 00:00:00', 1),
(35, 10, 'AŞ kuruluş aşamaları ve maliyet', '2025-10-23 22:51:39', '2025-11-30 00:00:00', 1),
(36, 107, 'PELT_nalan hanımın emeklilik', '2025-10-24 14:14:15', '2025-10-31 00:00:00', 0),
(39, 107, 'PELT ortaklıktan ayrılma ya da ortağı çıkartma', '2025-10-27 12:30:08', '2025-11-30 00:00:00', 1),
(40, 21, 'AYBE sgk nace kodu', '2025-10-28 14:23:08', '2025-10-31 00:00:00', 0),
(41, 116, 'BCGE aracılık sözleşmesi girilecek ', '2025-11-07 10:24:29', '2025-11-07 00:00:00', 0),
(42, 13, 'SAM-CRM de işler', '2025-11-08 22:43:12', '2025-11-17 00:00:00', 1),
(43, 38, 'GUMA irsaliye işi', '2025-11-11 09:30:28', '2025-11-30 00:00:00', 0),
(44, 38, 'GUMA İrsaliye ', '2025-11-11 11:55:13', '2025-11-11 00:00:00', 0),
(45, 13, 'KARAR DEFTERLERİ', '2025-11-12 09:20:24', '2025-11-30 00:00:00', 1),
(46, 10, 'ABKA e-smm makbuz', '2025-11-12 12:13:45', '2025-11-30 00:00:00', 1),
(47, 67, 'Nace Kodu Güncellemesi', '2025-11-20 08:50:56', '2026-01-31 00:00:00', 1),
(48, 77, 'Özelge sonucu', '2025-11-20 08:53:43', '2026-01-31 00:00:00', 1),
(49, 71, 'SEOZ/LTD Nevi değişikliği', '2025-11-20 09:00:47', '2025-12-31 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_details`
--

CREATE TABLE `job_details` (
  `job_id` int NOT NULL,
  `id` int NOT NULL,
  `message` text COLLATE utf8mb3_turkish_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `user_id` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `job_details`
--

INSERT INTO `job_details` (`job_id`, `id`, `message`, `created_at`, `user_id`, `updated_at`) VALUES
(24, 19, '2001 sitesinin son mizana konsiyondan Alperen bey\'e yollanacak', '2025-10-19 16:42:13', NULL, NULL),
(24, 20, '30.04.2025 tarhli mizan', '2025-10-19 16:43:23', 5, NULL),
(25, 21, 'GULT_inşaatın vergi dairesine bildirimi yapılacak', '2025-10-19 16:50:24', NULL, NULL),
(26, 22, 'ADBU belediye ruhsatı için yönlendirme yapılacak', '2025-10-19 16:59:12', NULL, NULL),
(27, 23, 'ABKA_kendi banka hesaplarımın dökümanları hesap tut programına işlenecek', '2025-10-19 17:20:29', NULL, NULL),
(29, 25, 'MSKA en para şifreleri ', '2025-10-19 21:53:59', NULL, NULL),
(31, 27, 'fiyat farkı faturasının muhasebeleştirilmesi 602 hesapmı 153 hesapmı olmalı biz daha önce 153 işlerken sonrasında 602 işlemişiz doğrumu yapıyoruz yanlımı 2026 dan itibaren netleştirelim', '2025-10-20 09:47:14', NULL, NULL),
(24, 28, 'alperen beye yeni mizan yollandı üzerinde çalışacağını söyledi beklemedeyiz', '2025-10-20 10:23:00', 5, '2025-10-20 10:23:18'),
(29, 29, 'bankasıyla görüşüp dönüş yapacak', '2025-10-20 19:43:17', 5, NULL),
(24, 30, 'mesai saati sonuna kadar dönüş sağlanmadı', '2025-10-20 19:45:48', 5, NULL),
(24, 34, 'belli bir aşamadan sonra Ayberk bey\'e düzenlemeleri yapması için talimat verildi', '2025-10-23 17:30:47', 5, NULL),
(35, 35, 'Ali Rıza Bey\'in tavsiyesi üzerine adi ortaklık yapısındaki huzur evinin aş olarak dönüşümü hakkında mükellefe bilgi verilecek', '2025-10-23 22:51:39', NULL, NULL),
(36, 36, 'nalan Zeynep Demir demir emeklilik hesabı yapılacak', '2025-10-24 14:14:15', 5, '2025-10-26 17:52:41'),
(35, 37, 'maliyet hesaplandı gereken bilgiler sametten bekleniyor', '2025-10-24 16:20:42', 5, NULL),
(39, 40, 'Nalan hanım\'la görüştüm pekkim\'den ortağı nasıl çıkartabiliriz en azından adres nakli ortak imzası olmadan yapabilir miyiz diye sorar', '2025-10-27 12:30:08', 11, NULL),
(35, 41, 'Perşembe veya cuma günü huzurevi sahibi Ali Rıza bey ile ofisi ziyaret edecekler ortakları gerçek kişi olan adi ortaklığın anonim şirketi dönüştürülmesi için izlenecek yol haritası getirisi götürüsü üzerinde bir görüşme yapılacak', '2025-10-28 12:31:20', 5, NULL),
(40, 42, 'AYBE sgk nace kodu internet üzerinden yapılacak', '2025-10-28 14:23:08', 11, NULL),
(40, 43, 'gereken değişiklik çin başvuru yapıldı beklemede', '2025-10-28 14:23:47', 5, NULL),
(39, 44, 'avukat Burak etkat dan ticaret hukuku şirketler mevzuatına hakim bir avukat önermesini rica ettim bir bakıp dönüş yapacağını bildirdi', '2025-10-29 14:16:11', 5, NULL),
(35, 45, 'Samet bu konuda ticaret odasındaki  vatandaşta telefonda bir görüşme yapalım bize süreçte yardımcı olurmu  bedeli neyse katlanırız bu süreçte işimizi takip edermi', '2025-10-29 14:17:08', 5, '2025-10-30 08:51:24'),
(24, 46, 'Ayberk bey\'den hala cevap çıkmadı düzeltileri en son yaptığını söylüyor idi', '2025-10-29 14:19:59', 5, NULL),
(36, 47, 'hesaplanıp kendisine bildirildi', '2025-11-06 13:44:09', 5, NULL),
(29, 48, 'banka dönüş yapmış fakat farklı bir evrak istemiş hazırlanıp salih bey tarafından bankaya yollanacak', '2025-11-06 13:45:44', 5, NULL),
(39, 49, '(selam: ben konusunda uzman güvenilir bir avukat bulamadım, adres nakli olarak konuyu ele alacak muhasebe ile birlikte hareket edecek bir avukata ihtiyacımız var. önce adres nakli sonrasında ortaklıktan çıkarma veya tasfiyeye giriş işlemlerini başlatmamız için.sizin avukat bir arkadaş vardı onunla ilerleyelim isterseniz. bülent karakaşlı) zeynep hnımla böyle bir mesaj atıldı', '2025-11-06 14:01:30', 5, NULL),
(40, 50, 'kendisi sgk ya yollanarak konu halledildi', '2025-11-07 08:56:45', 5, NULL),
(41, 51, 'BCGE geçici vergi için aracılık sözleşmesi girilecek', '2025-11-07 10:24:29', 5, NULL),
(41, 52, 'mevcut sözleşmesini çıkartalım', '2025-11-07 10:25:45', 5, NULL),
(41, 53, 'aracılık sözleşmesi girildi', '2025-11-07 11:59:17', 5, NULL),
(42, 54, 'SAM-CRM de SGK işyeri sicil no SGK müdürlüğü ve SGK şifreleri girilecek', '2025-11-08 22:43:12', 12, NULL),
(43, 55, 'güngör maraklı faturalarında irsaliye numarası belirtmiyor sebebini araştıralım', '2025-11-11 09:30:28', 11, NULL),
(43, 56, 'Güngör abiye irsaliye kullanıp kullanmadığı soruldu kullanmadığını söyledi.kendisinin irsaliye düzenlemesi gerektiği söylendi.kestiği faturaların açıklama kısmına irsaliye yerine geçer ibaresi yazması gerektiği arabada faturasınında bulunması gerektiği söylendi.\r\n', '2025-11-11 11:51:56', 11, NULL),
(44, 57, '2 cilt irsaliye notere tasdik ettirilecek.', '2025-11-11 11:55:13', 11, NULL),
(44, 58, 'selimiye üsküdar 43. noterliğinde 2 cilt sevr irsaliyesi tasdik ettirildi.', '2025-11-11 17:18:19', 11, NULL),
(45, 59, 'karar defterlerinin ilk sayfadan son sayfaya kadar (XXLT-KARAR_sayfa-1,2,3,4...) isimlendirilerek ayrı ayrı sayfalar taranacak ve (Dosyalar\\MUKELLEF\\FAAL\\E_LTD.ŞTİ\\XXLT\\XXLT_TASDİK) klasöründe saklanacak', '2025-11-12 09:20:24', 11, NULL),
(46, 60, 'Samet bizim serbest meslek makbuzları 48 tane kalmış sanırım ne şekilde nereden alalım promosyon var mı yok mu mikro gruptan alırsak farklı zirveden alırsak farklı gibi bir şeyler dediler tam anlamadım sen bir araştırır mısın', '2025-11-12 12:13:45', 9, NULL),
(24, 61, 'Alperen bey ile bugün bir çalışma yapıldı uzaktan 30 Nisan 2025 tarihli eski programın kapanış  fişi konsiyon programına aktardı', '2025-11-18 16:32:37', 5, NULL),
(47, 62, 'Nacekodlarını güncelle', '2025-11-20 08:50:56', 9, NULL),
(48, 63, 'Yazarkasa almamadan dolayı gelen cezadan dolayı nace kodları kaldırılmıştı ama özelge talebi vardı. cevabı henüz çıkmadı. Kapatmayı düşünüyor oyüzden vergi dairesi aranmadı.', '2025-11-20 08:53:43', 9, '2025-11-20 08:54:06'),
(49, 64, 'Yılbaşında nevi değişikliği ile Limited şirkete gececek, sonrasında eşini ortak olarak alacak.\r\n', '2025-11-20 09:00:47', 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_users`
--

CREATE TABLE `job_users` (
  `id` int NOT NULL,
  `job_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_read` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `job_users`
--

INSERT INTO `job_users` (`id`, `job_id`, `user_id`, `is_read`) VALUES
(45, 29, 5, 0),
(49, 31, 5, 0),
(50, 31, 10, 0),
(51, 31, 9, 0),
(52, 31, 11, 0),
(53, 24, 5, 0),
(54, 24, 10, 0),
(55, 24, 9, 0),
(56, 24, 11, 0),
(59, 25, 5, 0),
(60, 25, 10, 0),
(61, 25, 9, 0),
(62, 26, 5, 0),
(63, 26, 9, 0),
(67, 36, 10, 0),
(68, 36, 9, 0),
(76, 40, 5, 0),
(77, 40, 10, 0),
(78, 40, 12, 0),
(79, 40, 9, 0),
(80, 40, 11, 0),
(81, 41, 5, 0),
(83, 43, 5, 0),
(84, 43, 9, 0),
(85, 43, 11, 0),
(86, 27, 5, 0),
(87, 44, 5, 0),
(88, 44, 10, 0),
(89, 44, 12, 0),
(90, 44, 9, 0),
(91, 44, 11, 0),
(92, 45, 5, 0),
(93, 45, 10, 0),
(94, 45, 12, 0),
(95, 45, 9, 0),
(96, 45, 11, 0),
(97, 46, 5, 0),
(98, 46, 9, 0),
(99, 42, 5, 0),
(100, 42, 12, 0),
(101, 39, 5, 0),
(102, 39, 10, 0),
(103, 39, 12, 0),
(104, 39, 11, 0),
(105, 35, 5, 0),
(106, 35, 9, 0),
(107, 35, 11, 0),
(108, 47, 9, 0),
(109, 48, 9, 0),
(110, 49, 5, 0),
(111, 49, 10, 0),
(112, 49, 8, 0),
(113, 49, 12, 0),
(114, 49, 9, 0),
(115, 49, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `content` text COLLATE utf8mb3_turkish_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `topic_id`, `user_id`, `content`, `image`, `created_at`) VALUES
(23, 10, 5, 'anonim şirket kuruluş maliyet çalışması', 'static/uploads/b975abc700984f678329259d72cfce63.docx', '2025-10-30 07:54:01'),
(24, 10, 5, 'anonim şirket kuruluş sözleşme çalışması', 'static/uploads/282fa255c35844c1a3036154e20a3dda.pdf', '2025-10-30 07:54:41'),
(25, 10, 12, 'İTODAKİ ELEMAN Şahıslar ayrı ayrı olduğu için firmayi  teke düşürüp öyle nevi degiisilikligi yapabilir diyor\r\nBende böyle tahmin etmiştim. \r\nAdi ortakta şahıslar İTO ya ayrı ayrı kayıtlı olduğu için aş ye ikisi direk geçemez.', NULL, '2025-10-30 09:26:44'),
(26, 10, 5, 'kurulacak anonim şirketteki ortaklarla adi Ortaklar aynı kişi olması sonucu değiştirmiyor o zaman', NULL, '2025-10-30 09:27:48'),
(27, 10, 5, 'evet ben de öyle biliyorum ama sana bir yazı paylaşacağım', NULL, '2025-10-30 09:30:04'),
(28, 13, 10, 'Özeliik arz eden (avukatlık, muhasebecilik) gibi işlerde çalışacak yabancı işçiler eğer Türk soyundan geldiğini belgelerlerse çalışma izni almadan Türkiyede çalışabileceklerdir.  ', NULL, '2025-11-12 13:12:34'),
(30, 14, 5, 'Anonim şirketlerde hisse devri kolaydır ve geniş sermaye yapısına hitap eder. Limited şirketlerde ise ortakların sorumlulukları daha belirgindir ve hisse devri daha sınırlıdır. Anonim şirketler, büyüme ve halka arz planı olan girişimler için cazipken, limited şirketler daha çok orta ölçekli işletmelere yöneliktir.', NULL, '2025-11-16 10:57:49'),
(31, 14, 5, 'Limited Şirket Mi Şahıs Şirketi Mi?\r\n\r\nBir limited şirket ve şahıs şirketi çok farklı iki mekanizmaya sahiptir.\r\nİşletmeniz için en iyi iş modelini belirlerken öncelikle fırsatları ve hedeflerinizi değerlendirmelisiniz. Uzun vadede bir limited şirket şahıs şirketinden daha karlı olabilir; ancak kısa vadeli hedeflerinize hızla ulaşmak için sizi yorucu bir sürece götürebilir. Limited şirketlerin şahıs şirketinden en önemli farkı daha sağlam bir yapıya sahip olmasıdır.\r\nLimited şirketlerde ortakların veya yöneticileri rolleri her zaman net olmasa da belirlidir. Şahıs mülkiyetinde tüm dış sorumluluk bir kişiye aittir ve yapı, şirket içindekiler tarafından kurulan sözlü veya yazılı bir ortaklığın kurallarına uyacaktır.\r\n\r\nBu noktada bir ikilemle karşılaşabiliriz: Hemen faaliyete geçmeyi ve fikirlerini gerçekleştirmeyi ve iş kapasiteleri arttığında tüzel kişilik aşamasına geçmeyi tercih edenler için şahıs şirketi, ticari faaliyete sermaye ile girerek belirli bir iktisadi amaç doğrultusunda daha sağlam bir yapı ile şirketini ilerletmek isteyenler için ise limited şirketi önerebiliriz.\r\n\r\nNe Kadar Vergi Ödemeniz Gerekir?\r\n\r\nUygulamada şahıs şirketi ve limited şirketin vergi ödemesi miktarları çok farklı değildir. Her iki şirket türünde de %1 ile %20 oranlarında KDV vergilendirmesi uygulanır. Burada önemli olan, şirketin türü değil ürünün türüdür.\r\nŞahıs şirketlerinin vermesi gereken gelir vergisi oranları her yıl %15 ile %40 arasındadır.\r\nLimited şirketler ise 2023 itibariyle %20 oranında kurumlar vergisinden mesuldür.\r\nLimited şirketler dağıttıkları kar payları üzerinden de vergi ödemek zorundadır. Limited şirketler, dağıttıkları kar payı üzerinden %15 oranında Gelir Vergisi stopajı yapar. Ancak limited şirketlerin sahiplerinin kâr dağıtımı yapma zorunluluğu yoktur. Bunun yerine şirketten huzur hakkı ya da düzenli maaş alabilirler.\r\nLimited Şirkette Prestij ve Markalaşma Aşaması\r\n\r\nLimited şirketler, şahıs şirketleri ile karşılaştırıldığında resmi kurumlar nezdinde daha prestijli bir konuma sahiptir. Markanızı büyütebilmek ve kurumsallaşma engellerine takılmamak için limited şirketi seçmek sizin için daha avantajlı olabilir.', NULL, '2025-11-16 10:58:00'),
(32, 15, 5, 'Başvuru Yapılması: Ulaştırma ve Altyapı Bakanlığı\'na şahsen veya e-Devlet üzerinden başvuru yapılabilir. Denetim Süreci: Başvuruyu yapan firmanın belgeleri incelenir ve uygunluk kontrolü yapılır. Belgenin Onaylanması: Gerekli incelemelerin tamamlanmasının ardından P1 belgesi firmaya teslim edilir.', NULL, '2025-11-17 11:29:40'),
(33, 15, 5, '1. P1 Belgesi Nedir? P1 belgesi, taşımacılık sektöründe faaliyet gösteren şirketlerin, il içi kurye dağıtım işini yapabilmelerini sağlayan bir belgedir. Türkiye’de, kurye dağıtım yapan tüm firmaların P1 belgesi alması zorunludur. Bu belge, şirketlerin yasal gereklilikleri yerine getirmesini sağlar ve taşımacılık alanındaki denetimlerin yapılmasına olanak tanır.\r\n\r\n2. P1 Belgesi Başvuru Şartları\r\n\r\nŞirket Türü: P1 belgesi alacak şirketin, Türkiye Cumhuriyeti kanunlarına göre kurulmuş olması gerekir.\r\nLisanslı Sürücü: Şirketin, taşıma faaliyetinde bulunan sürücülerinin, gerekli sürücü belgesi ve eğitimleri almış olması gerekmektedir.\r\nMali Durum: P1 belgesi alabilmek için şirketin mali açıdan güvenilir ve sağlıklı bir durumda olması gerekmektedir. Mali verilerin düzenli olması, başvurunun onaylanmasında önemli bir faktördür.\r\nİşyeri ve Ekipmanlar: Şirketin işyerinin, araçlarının ve taşımacılık ekipmanlarının uygun standartlara sahip olması gereklidir.\r\n3. P1 Belgesi İçin Gerekli Belgeler\r\n\r\nŞirketin Ticaret Sicil Gazetesi: Şirketin yasal olarak kurulduğunu gösteren belgeler.\r\nVergi Levhası: Vergi kaydının yapıldığını gösteren belge.\r\nSürücü Belgeleri: Taşıma yapacak olan sürücülerin geçerli sürücü belgeleri ve psikoteknik raporları.\r\nAraçların Ruhsatı ve Sigorta Belgeleri: Taşıma araçlarının yasal belgeleri ve sigorta poliçeleri.\r\nİşyerinin İzin Belgesi: Şirketin faaliyet göstereceği işyerinin gerekli izin belgeleri.\r\n4. P1 Belgesi Başvuru Süreci P1 belgesi başvurusu, Ulaştırma Bakanlığı veya yetkilendirilmiş taşımacılık denetim kurumlarına yapılır. Başvuru sürecinde, başvuru dosyasına tüm gerekli belgeler eklenmelidir. Başvurunun ardından, belgeler incelenir ve uygun görülen başvurular onaylanır. Başvuru sürecinde yaşanabilecek olası aksaklıklar, başvurunun reddedilmesine yol açabilir.', NULL, '2025-11-17 11:31:57'),
(34, 15, 10, 'Firmada adına kayıtlı her motor için dışarıdan muvafaktname ile 2 motor girişi daha yapabiliyoruz. Dışarıdan alınacak motorların sahibinin Türk olması gerekiyor. Muvafakatname ise motor kimin üzerine ise o kişinin e-devleti üzerinden veriliyor. \r\n\r\n3 motora kadar 5.000 TL harç ve motor başına 3.000 TL ücret ile çıkarılabiliyor. Daha fazla motor varsa 100.000 TL harç ve motor başına 3.000 Tl ücret ile çıkarılabiliyor.  ', NULL, '2025-11-19 10:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_turkish_ci NOT NULL,
  `description` text COLLATE utf8mb3_turkish_ci,
  `due_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `title`, `description`, `due_date`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(5, 'yıl sonu', 'yıl sonu iş ve işlemleri', '2025-12-31 12:00:00', 0, '2025-10-20 07:15:28', '2025-10-20 07:16:42', 9),
(8, 'envanter bildirimleri', 'aralık ayının son haftasına girildiğinde mükelleflerden 31,12,2025 tarihli envanter istenecek', '2025-12-15 12:12:00', 1, '2025-10-20 13:41:29', '2025-10-28 11:25:44', 5),
(16, 'NYBO+ZABO banka extreleri', 'yağmur bey banka ekstreleri için aranacak', '2025-10-30 09:30:00', 1, '2025-10-29 14:09:15', '2025-10-29 14:09:15', 5),
(17, 'YABU ömer büdün emeklilik', 'YABU yanında çalışan amcasının 15,11,2025 te emeklilikten çıkışı verilecek yasin büdün devir işi engel teşkil edecekse alternatif ayarlamamız gerekli', '2025-11-15 15:59:00', 1, '2025-10-30 12:59:29', '2025-10-30 12:59:29', 5),
(18, 'Z-ENTEGRE', '\nZ entegre güncellenecek', '2025-12-01 09:26:00', 1, '2025-11-04 06:26:15', '2025-11-04 06:26:15', 5),
(19, 'HUZUR EVİ', '17,10,2025 huzurevi ortaklarından ali bey ile bir görüşme gerçekleştirilecel', '2025-11-17 09:44:00', 1, '2025-11-11 06:44:35', '2025-11-11 06:44:35', 5),
(20, 'iade', 'sonoff DHL ye iade verildi', '2025-11-13 15:40:00', 1, '2025-11-13 12:41:06', '2025-11-13 12:41:06', 5),
(21, 'DİLT/Şişli Sgk ', '0212 224 09 40\nDahili 16 534\nDalihi 16 538', NULL, 1, '2025-11-20 05:55:28', '2025-11-20 05:55:28', 9),
(22, 'UGİM/Alıcılar', 'Poster 120.ETSY\nTasarım 120.UPWORK', NULL, 1, '2025-11-20 05:56:04', '2025-11-20 05:56:04', 9),
(23, 'Mihsap/Ödeal Kurulum', '0312 400 03 40 ', NULL, 1, '2025-11-20 05:58:05', '2025-11-20 05:58:16', 9),
(24, 'Yeni bir hatırlatıcı', 'test hatırlatıcı', '2025-10-10 15:15:00', 0, '2025-11-23 09:05:58', '2025-11-23 09:06:11', 8);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_turkish_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `description` text COLLATE utf8mb3_turkish_ci,
  `user_id` int NOT NULL,
  `status` varchar(50) COLLATE utf8mb3_turkish_ci DEFAULT 'Açık',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `title`, `category`, `description`, `user_id`, `status`, `created_at`) VALUES
(10, 'adi ortaklığın AŞ\' ye dönüşümü', NULL, 'ortakları gerçek kişi olan adi ortaklığın anonim şirkete dönüşmesinde vergi ve KDV yönünden avantaj ve dezavantajları nelerdir', 5, 'Açık', '2025-10-28 10:42:35'),
(11, 'BANKA FAİZLERİNİN MUHASEBELEŞTİRİLMESİ ', NULL, 'VUK Tebliği 163\r\n\r\n27 Ocak 1985 Tarihli Resmi Gazete\r\n\r\nSayı: 18648\r\n\r\nMaliye Bakanlığından:\r\n\r\nBakanlığımıza yapılan çeşitli müracaatlardan, yatırımların finansmanında kullanılan kredilere ilişkin faiz giderleri ile yurt dışından döviz kredisiyle sabit kıymet ithal edilmesi nedeniyle ortaya çıkan kur farklarının, sabit kıymetin maliyet bedeline mi intikal ettirileceği yoksa doğrudan ilgili yılın giderleri arasında mı gösterileceği hususlarında tereddütler bulunduğu anlaşılmış ve bu konularda aşağıdaki açıklamaların yapılması uygun görülmüştür.\r\n\r\nYatırımların finansmanında kullanılan kredilerle ilgili faizlerden kuruluş dönemine ait olanların sabit kıymetle birlikte amortisman yoluyla itfa edilmek üzere yatırım maliyetine eklenmesi gerekmekte; işletme dönemine ait olanların ise, ilgili bulundukları yıllarda doğrudan gider yazılması ya da maliyete intikal ettirilmek suretiyle amortismana tabi tutulması,\r\nDöviz kredisi kullanılarak yurt dışından sabit kıymet ithal edilmesi sırasında veya sonradan bu kıymetlere ilişkin borç taksitlerinin değerlemesi dolayısıyla ortaya çıkan kur farklarından, sabit kıymetin iktisap edildiği dönem sonuna kadar olanların, kıymetin maliyetine eklenmesi zorunlu bulunmakta; aynı kıymetlerle ilgili söz konusu dönemden sonra ortaya çıkan kur farklarının ise, ait oldukları yıllarda doğrudan gider yazılması ya da maliyete intikal ettirilerek amortisman konusu yapılması,\r\nmümkün bulunmaktadır.\r\n\r\nBu tebliğle, 104 ve 121 sıra numaralı Vergi Usul Kanunu Genel Tebliğleri uygulamadan kaldırılmıştır.\r\n\r\nTebliğ olunur.', 5, 'Açık', '2025-11-01 09:40:22'),
(12, 'KURGAN / VEDAS', NULL, 'Sayın Mükellefimiz;\r\n01 Ekim 2025 tarihi itibarı ile Vergi Sistemi yeni bir uygulama şekli ile karşımıza çıkmakta. \r\n1- KURGAN\r\nBu sistem yaklaşık 140 kurum ve kuruluştan veri almaktadır. \r\nYani Vergi Mükelleflerinin ticaretinin usulüne uygun olarak yapılıp yapılmadığı hususunda “YAPAY ZEKA” sistemiyle sürekli denetlemektedir. \r\n- Düzenlenen Fatura bedellerinin Banka yada Finans kuruluşları üzerinden yapılaması, \r\n- Belge zinciri adı verilen sistemlerin uygulanması. (Fatura, Sevk İrsaliyesi, Taşıma İrsaliyesi, Banka Dekontu, çek, Senet Vb) \r\n- Banka kayıtlarının Muhasebe Sisteminize süresinde kaydedilmesi. \r\n- Kamu alacaklarının garanti altına alınması, ödemelerin belgelendirilmesi sistemi ile garanti altına alınması. Yani tedarikçinizin Vergi borcunu siz ödeyebilirsiniz. \r\n-VEDAS\r\nBu sistem sürekli \r\nGözetim /Denetim altında olduğunuz anlamına geliyor. \r\n- mükellefler arası fatura alışverişi anında sisteme düşüyor. \r\n- Ay sonunda düzenlenen faturalar ve takip eden ayın başında düzenlenen iade faturaları anında sisteme düşüyor. \r\n- Gayrimenkul, Oto, vs tescilli satışlarda Ödeme sistemi anında karşılaştırılıyor, bankadan aynı gün, aynı saatte çekilen, iade edilen, yakınların hesabına yatan paralar vs. \r\n- Ticari hesaplar, defterler      E-defter/fatura sistemleri yoluyla kayıtlarınız anında sistemde görünmektedir. \r\n- Artık defterlerini getirin inceleme yapacağız devri bitiyor, ön inceleme idare tarafından “YAPAY ZEKA” yoluyla yapılıp, söyleyecek bir şeyin, bir belgen var mı diye aranacaksınız. \r\nYani Ön muhasebe sistemine çok önem vermeniz gerekiyor. \r\nBizde bir deyiş var,\r\n “Hesapsız kasap, Ne Bıçak bırakır ne Masat”\r\nEzcümle, Mali Müşavirinizle ilişkinizi iyi tesis ediniz, Belgelerinizi önce süzgecinizden geçirip, Mali Müşavirinize öyle gönderiniz. \r\n\r\nHaaaa ayrıca SGK’da hazırlığını bitirmek üzere. \r\nO kurumda “YAPAY ZEKA” ile sisteme girmek üzere!\r\n\r\nMali Müşaviriniz aradığında, aksattığınız “muhasebe Ücretini istiyor sanırsam” diyerek telefonunuzu açmamazlık yapmayınız.\r\n\r\nÜlkemizde en büyük banknottan bir kaç tene ile bizim hazırladığımız Beyannamelere pul bile yapıştırılamazken lütfen bizden uzak durmayınız. \r\nBize yakın olmanız \r\n“ALÎ MENFAATİNİZ” için faydalıdır. \r\n\r\n!!Biz gerçekten sizler için buradayız!!\r\nSELAM VE SEVGİLER.', 5, 'Açık', '2025-11-09 04:24:47'),
(13, 'YABANCI İŞÇİ', NULL, 'Yabancı işçi çalıştırma şartları 5 Türk kalktı mı?\r\nTürkiye\'de 5 yıl içinde öğrenci ikamet izni hariç en az 3 yıl süreyle Türkiye\'de yasal olarak ikamet izni, çalışma izni ve uluslararası koruma kimliği bulunan yabancılar için yapılan yurt içi çalışma izni başvurularında 5 Türk işçi çalıştırma zorunluluğu kalktı.', 5, 'Açık', '2025-11-12 13:07:42'),
(14, 'AŞ mi LTD mi', NULL, 'Anonim ve Limited Şirket Farkları\r\nLimited şirket ve Anonim şirket arasındaki farklar ortak sayısı, ortakların sorumlulukları ve hisse devri açısından ortaya çıkar.\r\nAnonim şirketlerde ortak sayısında bir kısıtlama yokken, Limited şirketlerde ortak sayısı en fazla 50 kişi olabilmektedir.\r\nA.Ş.’lerde şirket ortakları sermaye borçlarını ödedikten sonra kamu borçlarından sorumlu olmazken, LTD.’lerde şirket ortakları SGK primi ve vergi borcu gibi kamu borçlarından taahhüt ettikleri sermaye oranıyla sorumludur.\r\nHisse devri ise LTD.’lerde A.Ş.’lere göre daha zor bir süreçte gerçekleşir. Limited şirketlerde hisse devri noter huzurunda yapılırken, Anonim şirketlerde bir hisse devri sözleşmesi işlemin gerçekleşmesi için yeterlidir. \r\nHangi Şirket Türü Avantajlı?\r\nTürkiye’de ticari işletmeler ilk olarak tüzel kişiliğinin olup olmamasına bağlı olarak değişiklik gösterir. Şahıs, Anonim ve Limited şirketlerin tüzel kişiliği olmasının yanında bu şirket türlerinin aralarında önemli farklar da vardır. Bu farklardan ilki; şahıs şirketi ortakları şirketin borçlarından tüm mal varlıkları ile sorumlu iken Limited ve Anonim şirketlerde şirketin kendisi kendi mal varlığı ve borçlarından sorumludur. Şahıs şirketleri; kolay kurulup, kolay kapatılabilen ve kuruluş masrafları diğerlerine göre az olan şirketlerdir.\r\n\r\nŞirket sahibi olmak isteyen kişi ve yatırımcılar açısından, ticari risk ve iş hacmine bağlı olmakla birlikte en avantajlı şirket türü limited veya anonim şirket denilebilir; ancak başlangıç aşamasında olup fikrinizi küçük çaplı da olsa harekete geçirmeyi ve vergi avantajlarından yararlanmayı hedefliyorsanız şahıs şirketi doğru bir başlangıç olacaktır.', 5, 'Açık', '2025-11-16 10:54:54'),
(15, 'P1 moto kurye ', NULL, 'P1 yetki belgesi, yalnızca il sınırları içerisinde dağıtım taşımacılığı yapmak isteyen firmalara verilir. Şehir içi teslimat yapan moto kurye şirketleri için alınması gereken belgedir. Ancak bu belge sadece işletmelere verilir; bireysel kuryeler için geçerli değildir.', 5, 'Açık', '2025-11-17 11:28:46'),
(16, 'YEMEK KARTLARININ BORDRODA GÖSTERİLMESİ', NULL, '2025 sonuna kadar bordo orada herhangi bir yemek kartı gösterilmedi yılbaşından itibaren olması gereken neyse o yapılacak', 5, 'Açık', '2025-11-17 14:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_turkish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_turkish_ci NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `username` varchar(250) COLLATE utf8mb3_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `type`, `username`) VALUES
(5, 'A.Bülent Karakaşlı', '$argon2id$v=19$m=65536,t=3,p=4$9743ZqyVEiKkVAqhtLb2Pg$P53DQglvGk9sEMyFehlCze0s0yyrsE51Z8Ec/6lJRx8', 1, '00_ABKA'),
(8, 'Developer User', '$argon2id$v=19$m=65536,t=3,p=4$Zcw551zL+T8HAACgFCJkbA$QLNi2dIE8QC+nm2kNyXZdiu3yh9+NkNp24x2QAQLARs', 1, 'admin'),
(9, 'M. Samet Karakaşlı', '$argon2id$v=19$m=65536,t=3,p=4$XMv5f++dM6Y0ZoxRCgFgzA$kVc26jBliUIXyY20pBMaceIjfRPtGyU6PPEuKTb7Gjg', 0, '05_MSKA'),
(10, 'A.Tuncay Ertürk', '$argon2id$v=19$m=65536,t=3,p=4$vVeKkbL2npPS2jun9F4LQQ$QvSH7KvkQX2SSI0M1l1Vl6zkH1OzGVwHPV5Kbq8QzR8', 0, '04_ATER'),
(11, 'Serpil Gezer', '$argon2id$v=19$m=65536,t=3,p=4$JmQspVSKkfK+l1LK+Z9zLg$sjUhwTP7rgDbFIhmqgf1T2ARmboj/7IxaKQX8fqPq8o', 0, '03_SEGE'),
(12, 'M. Ayşe Çelik', '$argon2id$v=19$m=65536,t=3,p=4$O2fMGSOEcI5xDkHI+Z/z/g$UR4yNds+dRytgVdfU82iHCUJS865HTr4TP8x5R17Oi8', 0, '02_MACE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_reports`
--
ALTER TABLE `activity_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faaliyet_raporu`
--
ALTER TABLE `faaliyet_raporu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_details`
--
ALTER TABLE `job_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_users`
--
ALTER TABLE `job_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_reports`
--
ALTER TABLE `activity_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `faaliyet_raporu`
--
ALTER TABLE `faaliyet_raporu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `job_details`
--
ALTER TABLE `job_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `job_users`
--
ALTER TABLE `job_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_reports`
--
ALTER TABLE `activity_reports`
  ADD CONSTRAINT `activity_reports_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `faaliyet_raporu`
--
ALTER TABLE `faaliyet_raporu`
  ADD CONSTRAINT `faaliyet_raporu_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `job_users`
--
ALTER TABLE `job_users`
  ADD CONSTRAINT `job_users_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `job_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

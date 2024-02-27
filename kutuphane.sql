-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.21-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- k10a için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `k10a` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `k10a`;

-- tablo yapısı dökülüyor k10a.kitap
CREATE TABLE IF NOT EXISTS `kitap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) DEFAULT NULL,
  `yazar_id` int(11) DEFAULT NULL,
  `tur_id` int(11) DEFAULT NULL,
  `sayfaSayisi` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kitap_yazarr` (`yazar_id`),
  KEY `FK_kitap_tur` (`tur_id`),
  CONSTRAINT `FK_kitap_tur` FOREIGN KEY (`tur_id`) REFERENCES `tur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_kitap_yazarr` FOREIGN KEY (`yazar_id`) REFERENCES `yazarr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- k10a.kitap: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `kitap` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitap` ENABLE KEYS */;

-- tablo yapısı dökülüyor k10a.odunc
CREATE TABLE IF NOT EXISTS `odunc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ogrenci_sira` int(11) DEFAULT NULL,
  `kitap_sira` int(11) DEFAULT NULL,
  `v_tarih` date DEFAULT NULL,
  `a_tarih` date DEFAULT NULL,
  `hasar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_odunc_ogrenci` (`ogrenci_sira`),
  KEY `FK_odunc_kitap` (`kitap_sira`),
  CONSTRAINT `FK_odunc_kitap` FOREIGN KEY (`kitap_sira`) REFERENCES `kitap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_odunc_ogrenci` FOREIGN KEY (`ogrenci_sira`) REFERENCES `ogrenci` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- k10a.odunc: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `odunc` DISABLE KEYS */;
/*!40000 ALTER TABLE `odunc` ENABLE KEYS */;

-- tablo yapısı dökülüyor k10a.ogrenci
CREATE TABLE IF NOT EXISTS `ogrenci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(30) DEFAULT NULL,
  `soyad` varchar(30) DEFAULT NULL,
  `sinif_id` int(11) DEFAULT NULL,
  `okulno` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ogrenci_sinif` (`sinif_id`),
  CONSTRAINT `FK_ogrenci_sinif` FOREIGN KEY (`sinif_id`) REFERENCES `sinif` (`sira`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- k10a.ogrenci: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `ogrenci` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogrenci` ENABLE KEYS */;

-- tablo yapısı dökülüyor k10a.sinif
CREATE TABLE IF NOT EXISTS `sinif` (
  `sira` int(11) NOT NULL AUTO_INCREMENT,
  `ad` char(5) DEFAULT NULL,
  PRIMARY KEY (`sira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- k10a.sinif: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `sinif` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinif` ENABLE KEYS */;

-- tablo yapısı dökülüyor k10a.tur
CREATE TABLE IF NOT EXISTS `tur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- k10a.tur: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `tur` DISABLE KEYS */;
/*!40000 ALTER TABLE `tur` ENABLE KEYS */;

-- tablo yapısı dökülüyor k10a.yazarr
CREATE TABLE IF NOT EXISTS `yazarr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(30) DEFAULT NULL,
  `soyad` varchar(30) DEFAULT NULL,
  `ozgecmis` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- k10a.yazarr: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `yazarr` DISABLE KEYS */;
/*!40000 ALTER TABLE `yazarr` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

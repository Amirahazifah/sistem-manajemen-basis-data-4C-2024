/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.27-MariaDB : Database - perpus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `perpus`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `id_anggota` int(50) NOT NULL AUTO_INCREMENT,
  `nama_anggota` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`id_anggota`,`nama_anggota`,`alamat`,`tanggal_lahir`) values 
(1,'Wulan','Bojonegoro','2005-03-15'),
(2,'Dinda','Gresik','2003-12-27'),
(3,'Juwita','Medan','2004-02-20'),
(4,'Rosalia','Bangkalan','2004-03-05'),
(5,'Fira','Surabaya','2004-06-11'),
(6,'Silvi','Lamongan','2004-02-01'),
(7,'Rara','Bojonegoro','2004-03-02'),
(8,'Dina','Surabaya','2003-01-01'),
(9,'Putri','Mojokerto','2004-03-03'),
(10,'Dewi','Sidoarjo','2003-04-04'),
(11,'Rani','Gresik','2003-07-09'),
(12,'Bunga','Sumenep','2003-05-06'),
(13,'Rangga','Surabaya','2003-05-05'),
(14,'Dani','Lamongan','2003-06-06'),
(15,'Rizki','Lamongan','2003-09-12'),
(16,'Arya','Surabaya','2004-03-06'),
(17,'Rifki','Tuban','2004-07-01'),
(18,'Maulana','Solo','2004-02-01'),
(19,'Akbar','Sumenep','2003-08-08'),
(20,'Fadil','Bojoongoro','0000-00-00');

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `id_buku` int(50) NOT NULL AUTO_INCREMENT,
  `judul` varchar(50) NOT NULL,
  `tahun_terbit` int(50) NOT NULL,
  `id_kategori` int(50) NOT NULL,
  PRIMARY KEY (`id_buku`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buku` */

insert  into `buku`(`id_buku`,`judul`,`tahun_terbit`,`id_kategori`) values 
(1,'Planet Luna',1869,1),
(2,'Sejarah Islam',1897,6),
(3,'Manajemen Olahraga',1937,18),
(4,'Soekarno',1977,2),
(5,'Dilan',1998,3),
(6,'Student Traveler',1998,20),
(7,'Kesehatan Mental',1999,15),
(8,'Seni Lukis',1997,4),
(9,'Agama Islam',1999,16),
(10,'Terimakasih Ibu',1996,5),
(11,'Naruto',1997,14),
(12,'Teknologi Informasi',1998,7),
(13,'Teori Musik Umum',1989,19),
(14,'Habis Gelap Terbitlah Terang',1998,8),
(15,'Pendidika IPA',1998,10),
(16,'Teori Hukum',1999,12),
(17,'Sains Material',1998,9),
(18,'Makanan Nusantara',1999,17),
(19,'Referensi Karya Ilmiah',1998,11),
(20,'Manajemen Bisnis',1996,13),
(24,'bunga malam',1999,5);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(50) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nama_kategori`) values 
(1,'Fiksi'),
(2,'Non Fiksi'),
(3,'Romance'),
(4,'Seni'),
(5,'Puisi'),
(6,'Sejarah'),
(7,'Teknologi'),
(8,'Biografi'),
(9,'Sains'),
(10,'Pendidikan'),
(11,'Referensi'),
(12,'Hukum'),
(13,'Bisnis'),
(14,'Komik'),
(15,'Kesehatan'),
(16,'Agama'),
(17,'Kuliner'),
(18,'Olahraga'),
(19,'Musik'),
(20,'Travel');

/*Table structure for table `peminjaman` */

DROP TABLE IF EXISTS `peminjaman`;

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(50) NOT NULL AUTO_INCREMENT,
  `id_anggota` int(50) NOT NULL,
  `id_buku` int(50) NOT NULL,
  `id_penulis` int(50) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status_pengembalian` varchar(50) NOT NULL,
  PRIMARY KEY (`id_peminjaman`),
  KEY `id_anggota` (`id_anggota`,`id_buku`),
  KEY `id_penulis` (`id_penulis`),
  KEY `id_buku` (`id_buku`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_penulis`) REFERENCES `penulis` (`id_penulis`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjaman` */

insert  into `peminjaman`(`id_peminjaman`,`id_anggota`,`id_buku`,`id_penulis`,`tanggal_pinjam`,`tanggal_kembali`,`status_pengembalian`) values 
(1,1,1,1,'2024-03-22','2024-03-27','belum dikembalikan'),
(2,2,2,2,'2024-03-12','2024-03-14','kembali'),
(3,3,3,3,'2024-03-18','2024-03-20','kembali'),
(4,4,4,4,'2024-03-13','2024-03-15','kembali'),
(5,7,5,6,'2024-03-05','2024-03-08','kembali'),
(6,6,7,5,'2024-03-26','2024-03-28','belum kembali'),
(7,5,6,7,'2024-03-27','2024-03-29','belum kembali'),
(8,9,8,10,'2024-03-25','2024-03-29','belum kembali'),
(9,8,10,9,'2024-03-18','2024-03-20','kembali'),
(10,10,9,8,'2024-03-20','2024-03-22','kembali'),
(11,13,11,12,'2024-03-22','2024-03-25','kembali'),
(12,11,12,13,'2024-03-17','2024-03-19','kembali'),
(13,12,13,11,'2024-03-26','2024-03-27','belum kembali'),
(14,15,16,14,'2024-03-27','2024-03-29','belum kembali'),
(15,16,14,15,'2024-03-26','2024-03-29','belum kembali'),
(16,14,15,16,'2024-03-28','2024-03-29','belum kembali'),
(17,20,18,17,'2024-03-26','2024-03-27','kembali'),
(18,19,20,18,'2024-03-25','2024-03-27','kembali'),
(19,18,17,20,'2024-03-27','2024-03-28','belum kembali'),
(20,17,19,19,'2024-03-22','2024-03-26','kembali');

/*Table structure for table `penulis` */

DROP TABLE IF EXISTS `penulis`;

CREATE TABLE `penulis` (
  `id_penulis` int(50) NOT NULL AUTO_INCREMENT,
  `nama_penulis` varchar(50) NOT NULL,
  `tahun_lahir` int(50) NOT NULL,
  `negara_asal` varchar(50) NOT NULL,
  PRIMARY KEY (`id_penulis`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `penulis` */

insert  into `penulis`(`id_penulis`,`nama_penulis`,`tahun_lahir`,`negara_asal`) values 
(1,'Ray Antariksa Yasmine',1828,'Russia'),
(2,'Jane Austen',1775,'UK'),
(3,'Raditya Dika',1964,'USA'),
(4,'Im Yang Tjoe',1926,'USA'),
(5,'Pidi Baiq',1927,'Colombia'),
(6,'Annisa Potter',1927,'USA'),
(7,'Kartini',1967,'USA'),
(8,'Pandji Anoraga',1968,'UK'),
(9,'Eka Kurniawan',1966,'Colombia'),
(10,'Leila S. Chudori',1977,'USA'),
(11,'Pramoedya Ananta Toer',1967,'UK'),
(12,'Ayu Utami',1965,'Indonesia'),
(13,'Ahmad Tohari',1887,'Indonesia'),
(14,'Okky Madasari',1867,'Indonesia'),
(15,'Andrea Hirata',1864,'Indonesia'),
(16,'Lala Noberg',1896,'Russia'),
(17,'Tere Liye',1897,'UK'),
(18,'George Orwell',1898,'Russia'),
(19,'Keigo Higashino',1893,'Colombia'),
(20,'Elalicia',1877,'UK'),
(21,'',0,'');

/*Table structure for table `viewanggota` */

DROP TABLE IF EXISTS `viewanggota`;

/*!50001 DROP VIEW IF EXISTS `viewanggota` */;
/*!50001 DROP TABLE IF EXISTS `viewanggota` */;

/*!50001 CREATE TABLE  `viewanggota`(
 `nama_anggota` varchar(50) ,
 `alamat` varchar(50) 
)*/;

/*View structure for view viewanggota */

/*!50001 DROP TABLE IF EXISTS `viewanggota` */;
/*!50001 DROP VIEW IF EXISTS `viewanggota` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `viewanggota` AS select `anggota`.`nama_anggota` AS `nama_anggota`,`anggota`.`alamat` AS `alamat` from `anggota` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

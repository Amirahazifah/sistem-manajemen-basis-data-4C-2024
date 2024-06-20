/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.14-MariaDB : Database - manage_gudang
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manage_gudang` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `manage_gudang`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `ID_Barang` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Barang` varchar(255) NOT NULL,
  `ID_Kategori` int(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Barang`),
  KEY `kategori_barang` (`ID_Kategori`),
  CONSTRAINT `kategori_barang` FOREIGN KEY (`ID_Kategori`) REFERENCES `kategoribarang` (`ID_Kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Data for the table `barang` */

insert  into `barang`(`ID_Barang`,`Nama_Barang`,`ID_Kategori`) values 
(1,'Beras',1),
(2,'Gula',1),
(3,'Minyak Goreng',1),
(4,'Sabun Mandi',2),
(5,'Pasta Gigi',2),
(6,'Sikat Gigi',2),
(7,'Shampoo',2),
(8,'Pembersih Lantai',2),
(9,'Pembersih Kaca',2),
(10,'Sapu',2),
(11,'Sarung Tangan',2),
(12,'Penghapus',3),
(13,'Pensil',3),
(14,'Buku Catatan',3),
(15,'Baterai AA',4),
(16,'Baterai AAA',4),
(17,'Kabel USB',4),
(18,'Mouse',4),
(19,'Keyboard',4),
(20,'Speaker',4),
(21,'Lampu LED',4),
(22,'Charger HP',4),
(23,'Powerbank',4),
(24,'Sikat Toilet',2),
(25,'Lap Pembersih',NULL);

/*Table structure for table `gudang` */

DROP TABLE IF EXISTS `gudang`;

CREATE TABLE `gudang` (
  `ID_Gudang` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Gudang` varchar(255) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Gudang`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

/*Data for the table `gudang` */

insert  into `gudang`(`ID_Gudang`,`Nama_Gudang`,`Alamat`) values 
(1,'Gudang A','Surabaya'),
(2,'Gudang B','Surabaya'),
(3,'Gudang C','Surabaya'),
(4,'Gudang B','Surabaya'),
(5,'Gudang E','Surabaya'),
(6,'Gudang F','Sidoarjo'),
(7,'Gudang G','Sidoarjo'),
(8,'Gudang H','Sidoarjo'),
(9,'Gudang I','Sidoarjo'),
(10,'Gudang J','Sidoarjo'),
(11,'Gudang K','Surabaya'),
(12,'Gudang L','Surabaya'),
(13,'Gudang M','Surabaya'),
(14,'Gudang N','Surabaya'),
(15,'Gudang O','Surabaya'),
(16,'Gudang P','Sidoarjo'),
(17,'Gudang Q','Sidoarjo'),
(18,'Gudang R','Sidoarjo'),
(19,'Gudang S','Sidoarjo'),
(20,'Gudang T','Sidoarjo'),
(21,'Gudang U','Sidoarjo');

/*Table structure for table `jabpegawai` */

DROP TABLE IF EXISTS `jabpegawai`;

CREATE TABLE `jabpegawai` (
  `ID_Jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Jabatan` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `jabpegawai` */

insert  into `jabpegawai`(`ID_Jabatan`,`Nama_Jabatan`) values 
(1,'Manager Gudang'),
(2,'Staff Gudang'),
(3,'Pengemas Barang'),
(4,'Buruh Umum');

/*Table structure for table `kategoribarang` */

DROP TABLE IF EXISTS `kategoribarang`;

CREATE TABLE `kategoribarang` (
  `ID_Kategori` int(11) NOT NULL AUTO_INCREMENT,
  `Kategori_Barang` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kategoribarang` */

insert  into `kategoribarang`(`ID_Kategori`,`Kategori_Barang`) values 
(1,'Sembako'),
(2,'Alat kebersihan'),
(3,'Alat tulis'),
(4,'Elektronik');

/*Table structure for table `kota` */

DROP TABLE IF EXISTS `kota`;

CREATE TABLE `kota` (
  `ID_Kota` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Kota` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Kota`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kota` */

insert  into `kota`(`ID_Kota`,`Nama_Kota`) values 
(1,'Gresik'),
(2,'Lamongan'),
(3,'Pasuruan');

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `ID_Pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Pegawai` varchar(255) NOT NULL,
  `Nomor_Telepon` varchar(15) NOT NULL,
  `ID_Gudang` int(11) NOT NULL,
  `ID_Jabatan` int(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Pegawai`),
  KEY `FK_Pegawai_Gudang` (`ID_Gudang`),
  KEY `jabpegawai_pegawai` (`ID_Jabatan`),
  CONSTRAINT `FK_Pegawai_Gudang` FOREIGN KEY (`ID_Gudang`) REFERENCES `gudang` (`ID_Gudang`),
  CONSTRAINT `jabpegawai_pegawai` FOREIGN KEY (`ID_Jabatan`) REFERENCES `jabpegawai` (`ID_Jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pegawai` */

insert  into `pegawai`(`ID_Pegawai`,`Nama_Pegawai`,`Nomor_Telepon`,`ID_Gudang`,`ID_Jabatan`) values 
(1,'Dewi','081234567890',1,1),
(2,'Susi','081285766617',2,1),
(3,'Rudi','0827363334080',1,2),
(4,'Budi','081233422890',2,2),
(5,'Indra','085234555808',3,2),
(6,'Lina','085135567111',4,2),
(7,'Tono','081234567818',1,3),
(8,'Putri','085716335222',2,3),
(9,'Fahmi','081534334221',3,3),
(10,'Hadi','085545888202',4,3),
(11,'Andi','081245344400',1,3),
(12,'Gita','082544432306',2,3),
(13,'Nina','081463788892',1,4),
(14,'Kiki','082007540390',2,4),
(15,'Umar','081976555112',3,4),
(16,'Mila','081999736488',4,4),
(17,'Joko','081873633455',1,4),
(18,'Eka','0827665490837',2,4),
(19,'Oscar','082345546784',3,4),
(20,'Susi','081777524336',4,4);

/*Table structure for table `penerimaan` */

DROP TABLE IF EXISTS `penerimaan`;

CREATE TABLE `penerimaan` (
  `ID_Penerimaan` int(11) NOT NULL AUTO_INCREMENT,
  `Tanggal_Penerimaan` date NOT NULL,
  `ID_Supplier` int(11) NOT NULL,
  `ID_Barang` int(11) NOT NULL,
  `Jumlah_Terima` int(11) NOT NULL,
  `ID_Gudang` int(11) NOT NULL,
  `ID_Pegawai` int(11) NOT NULL,
  PRIMARY KEY (`ID_Penerimaan`),
  KEY `FK_Transaksi_Penerimaan_Pegawai` (`ID_Pegawai`),
  KEY `FK_Penerimaan_Gudang` (`ID_Gudang`),
  KEY `FK_Penerimaan_Barang` (`ID_Barang`),
  KEY `FK_Penerimaan_Supplier` (`ID_Supplier`),
  CONSTRAINT `FK_Penerimaan_Barang` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`),
  CONSTRAINT `FK_Penerimaan_Gudang` FOREIGN KEY (`ID_Gudang`) REFERENCES `gudang` (`ID_Gudang`),
  CONSTRAINT `FK_Penerimaan_Supplier` FOREIGN KEY (`ID_Supplier`) REFERENCES `supplier` (`ID_Supplier`),
  CONSTRAINT `FK_Transaksi_Penerimaan_Pegawai` FOREIGN KEY (`ID_Pegawai`) REFERENCES `pegawai` (`ID_Pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

/*Data for the table `penerimaan` */

insert  into `penerimaan`(`ID_Penerimaan`,`Tanggal_Penerimaan`,`ID_Supplier`,`ID_Barang`,`Jumlah_Terima`,`ID_Gudang`,`ID_Pegawai`) values 
(2,'2024-03-01',1,1,100,4,6),
(3,'2025-03-02',2,2,150,2,4),
(4,'2024-03-03',2,3,200,4,6),
(5,'2025-03-04',4,4,50,4,6),
(6,'2024-03-05',5,5,120,5,6),
(7,'2025-03-06',7,6,80,1,3),
(8,'2025-03-07',7,7,100,2,4),
(9,'2025-03-08',8,8,150,3,5),
(10,'2025-03-09',9,9,200,1,3),
(11,'2025-03-10',10,10,70,5,6),
(12,'2025-03-11',1,11,90,1,3),
(13,'2025-03-12',3,12,110,2,4),
(14,'2025-03-13',3,13,80,3,5),
(15,'2025-03-14',4,14,130,3,5),
(16,'2025-03-15',5,15,180,5,6),
(17,'2025-03-16',6,16,60,3,5),
(18,'2025-03-17',6,17,90,2,4),
(19,'2025-03-18',8,18,120,1,3),
(20,'2025-03-19',9,19,100,4,6),
(21,'2025-03-20',3,20,150,5,6);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `ID_Supplier` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Supplier` varchar(255) NOT NULL,
  `Nomor_Telepon` varchar(15) NOT NULL,
  `ID_Kota` int(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Supplier`),
  KEY `kota_supplier` (`ID_Kota`),
  CONSTRAINT `kota_supplier` FOREIGN KEY (`ID_Kota`) REFERENCES `kota` (`ID_Kota`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `supplier` */

insert  into `supplier`(`ID_Supplier`,`Nama_Supplier`,`Nomor_Telepon`,`ID_Kota`) values 
(1,'Supplier A','082333959449',1),
(2,'Supplier B','083765444675',1),
(3,'Supplier C','0817515666456',3),
(4,'Supplier D','085736334991',3),
(5,'Supplier E','085893239445',3),
(6,'Supplier F','081657888946',2),
(7,'Supplier G','085768999867',2),
(8,'Supplier H','081222131424',2),
(9,'Supplier I','082334543422',3),
(10,'Supplier J','081998760090',3),
(11,'Supplier K','082334637828',1),
(12,'Supplier L','081657488001',1),
(13,'Supplier M','082344563772',3),
(14,'Supplier N','081564666803',3),
(15,'Supplier O','085663474899',2),
(16,'Supplier P','081657483743',2),
(17,'Supplier Q','082323445896',1),
(18,'Supplier R','081444535677',1),
(19,'Supplier S','081766899908',1),
(20,'Supplier T','085456654209',3);

/*Table structure for table `pegawaipenerimaan` */

DROP TABLE IF EXISTS `pegawaipenerimaan`;

/*!50001 DROP VIEW IF EXISTS `pegawaipenerimaan` */;
/*!50001 DROP TABLE IF EXISTS `pegawaipenerimaan` */;

/*!50001 CREATE TABLE  `pegawaipenerimaan`(
 `Nama_Pegawai` varchar(255) ,
 `Tanggal_Penerimaan` date 
)*/;

/*Table structure for table `pgudang` */

DROP TABLE IF EXISTS `pgudang`;

/*!50001 DROP VIEW IF EXISTS `pgudang` */;
/*!50001 DROP TABLE IF EXISTS `pgudang` */;

/*!50001 CREATE TABLE  `pgudang`(
 `Nama_Gudang` varchar(255) ,
 `Nama_Pegawai` varchar(255) 
)*/;

/*Table structure for table `supplieralamat` */

DROP TABLE IF EXISTS `supplieralamat`;

/*!50001 DROP VIEW IF EXISTS `supplieralamat` */;
/*!50001 DROP TABLE IF EXISTS `supplieralamat` */;

/*!50001 CREATE TABLE  `supplieralamat`(
 `Nama_Supplier` varchar(255) ,
 `Nomor_Telepon` varchar(15) 
)*/;

/*View structure for view pegawaipenerimaan */

/*!50001 DROP TABLE IF EXISTS `pegawaipenerimaan` */;
/*!50001 DROP VIEW IF EXISTS `pegawaipenerimaan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pegawaipenerimaan` AS select `pegawai`.`Nama_Pegawai` AS `Nama_Pegawai`,`penerimaan`.`Tanggal_Penerimaan` AS `Tanggal_Penerimaan` from (`pegawai` join `penerimaan` on(`pegawai`.`ID_Pegawai` = `penerimaan`.`ID_Pegawai`)) */;

/*View structure for view pgudang */

/*!50001 DROP TABLE IF EXISTS `pgudang` */;
/*!50001 DROP VIEW IF EXISTS `pgudang` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pgudang` AS select `gudang`.`Nama_Gudang` AS `Nama_Gudang`,`pegawai`.`Nama_Pegawai` AS `Nama_Pegawai` from (`gudang` join `pegawai` on(`gudang`.`ID_Gudang` = `pegawai`.`ID_Gudang`)) */;

/*View structure for view supplieralamat */

/*!50001 DROP TABLE IF EXISTS `supplieralamat` */;
/*!50001 DROP VIEW IF EXISTS `supplieralamat` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supplieralamat` AS select `supplier`.`Nama_Supplier` AS `Nama_Supplier`,`supplier`.`Nomor_Telepon` AS `Nomor_Telepon` from `supplier` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

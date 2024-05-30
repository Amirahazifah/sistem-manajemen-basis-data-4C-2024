CREATE DATABASE dbsekolah;
USE dbsekolah;


CREATE TABLE `absensi` (
  `idAbsensi` INT(11) NOT NULL,
  `idSiswa` INT(11) DEFAULT NULL,
  `tanggal` DATE DEFAULT NULL,
  `keterangan` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`idAbsensi`),
  KEY `siswa_absensi` (`idSiswa`),
  CONSTRAINT `siswa_absensi` FOREIGN KEY (`idSiswa`) REFERENCES `siswa` (`idSiswa`)
)
INSERT  INTO `absensi`(`idAbsensi`,`idSiswa`,`tanggal`,`keterangan`) VALUES 
(1,1,'2024-04-01','Hadir'),
(2,2,'2024-04-01','Hadir'),
(3,3,'2024-04-01','Hadir'),
(4,4,'2024-04-01','Tidak Hadir'),
(5,5,'2024-04-01','Hadir'),
(6,6,'2024-04-01','Hadir'),
(7,7,'2024-04-01','Hadir'),
(8,8,'2024-04-01','Tidak Hadir'),
(9,9,'2024-04-01','Hadir'),
(10,10,'2024-04-01','Hadir'),
(11,11,'2024-04-01','Hadir'),
(12,12,'2024-04-01','Tidak Hadir'),
(13,13,'2024-04-01','Hadir'),
(14,14,'2024-04-01','Hadir'),
(15,15,'2024-04-01','Hadir'),
(16,16,'2024-04-01','Tidak Hadir'),
(17,17,'2024-04-01','Hadir'),
(18,18,'2024-04-01','Hadir'),
(19,19,'2024-04-01','Hadir'),
(20,20,'2024-04-01','Tidak Hadir');


CREATE TABLE `guru` (
  `idGuru` INT(11) NOT NULL,
  `namaGuru` VARCHAR(45) DEFAULT NULL,
  `alamat` VARCHAR(45) DEFAULT NULL,
  `jenisKelamin` ENUM('Laki-laki','Perempuan') DEFAULT NULL,
  PRIMARY KEY (`idGuru`)
) 
INSERT  INTO `guru`(`idGuru`,`namaGuru`,`alamat`,`jenisKelamin`) VALUES 
(1,'Pak Agus','Jl. Merdeka No. 1','Laki-laki'),
(2,'Bu Budi','Jl. Pahlawan No. 5','Perempuan'),
(3,'Pak Candra','Jl. Jenderal Sudirman No. 20','Laki-laki'),
(4,'Bu Desi','Jl. Diponegoro No. 8','Perempuan'),
(5,'Pak Eko','Jl. Gajah Mada No. 12','Laki-laki'),
(6,'Bu Fitri','Jl. A. Yani No. 25','Perempuan'),
(7,'Pak Galih','Jl. S. Parman No. 30','Laki-laki'),
(8,'Bu Hana','Jl. Diponegoro No. 15','Perempuan'),
(9,'Pak Iwan','Jl. Merdeka No. 10','Laki-laki'),
(10,'Bu Junita','Jl. Gajah Mada No. 5','Perempuan'),
(11,'Pak Kurnia','Jl. Pahlawan No. 30','Laki-laki'),
(12,'Bu Lani','Jl. Jenderal Sudirman No. 15','Perempuan'),
(13,'Pak Maman','Jl. A. Yani No. 8','Laki-laki'),
(14,'Bu Nia','Jl. S. Parman No. 25','Perempuan'),
(15,'Pak Oscar','Jl. Diponegoro No. 30','Laki-laki'),
(16,'Bu Putri','Jl. Merdeka No. 5','Perempuan'),
(17,'Pak Qori','Jl. Gajah Mada No. 10','Laki-laki'),
(18,'Bu Rina','Jl. Pahlawan No. 25','Perempuan'),
(19,'Pak Samsul','Jl. Jenderal Sudirman No. 8','Laki-laki'),
(20,'Bu Tuti','Jl. A. Yani No. 1','Perempuan');

CREATE TABLE `jadwalpelajaran` (
  `idJadwalPelajaran` INT(11) NOT NULL,
  `idKelas` INT(11) DEFAULT NULL,
  `idMatapelajaran` INT(11) DEFAULT NULL,
  `hari` ENUM('Senin','Selasa','Rabu','Kamis','Jumat') DEFAULT NULL,
  `jam` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`idJadwalPelajaran`),
  KEY `jadwal_matapelajaran` (`idMatapelajaran`),
  KEY `jadwal_kelas` (`idKelas`),
  CONSTRAINT `jadwal_kelas` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`),
  CONSTRAINT `jadwal_matapelajaran` FOREIGN KEY (`idMatapelajaran`) REFERENCES `matapelajaran` (`idMatapelajaran`)
) 
INSERT  INTO `jadwalpelajaran`(`idJadwalPelajaran`,`idKelas`,`idMatapelajaran`,`hari`,`jam`) VALUES 
(1,1011,1,'Senin','07:00-08:30'),
(2,1011,2,'Senin','08:45-10:15'),
(3,1011,3,'Senin','10:30-12:00'),
(4,1011,4,'Senin','13:00-14:30'),
(5,1011,5,'Senin','14:45-16:15'),
(6,1011,6,'Selasa','07:00-08:30'),
(7,1011,7,'Selasa','08:45-10:15'),
(8,1011,8,'Selasa','10:30-12:00'),
(9,1011,9,'Selasa','13:00-14:30'),
(10,1011,10,'Selasa','14:45-16:15'),
(11,1011,11,'Rabu','07:00-08:30'),
(12,1011,12,'Rabu','08:45-10:15'),
(13,1011,13,'Rabu','10:30-12:00'),
(14,1011,14,'Rabu','13:00-14:30'),
(15,1011,15,'Rabu','14:45-16:15'),
(16,1011,16,'Kamis','07:00-08:30'),
(17,1011,17,'Kamis','08:45-10:15'),
(18,1011,18,'Kamis','10:30-12:00'),
(19,1011,19,'Kamis','13:00-14:30'),
(20,1011,20,'Kamis','14:45-16:15');


CREATE TABLE `kelas` (
  `idKelas` INT(11) NOT NULL,
  `namaKelas` VARCHAR(45) DEFAULT NULL,
  `tingkatKelas` ENUM('1','2','3') DEFAULT NULL,
  `idGuru` INT(11) DEFAULT NULL,
  PRIMARY KEY (`idKelas`),
  KEY `kelas_guru` (`idGuru`),
  CONSTRAINT `kelas_guru` FOREIGN KEY (`idGuru`) REFERENCES `guru` (`idGuru`)
)
INSERT  INTO `kelas`(`idKelas`,`namaKelas`,`tingkatKelas`,`idGuru`) VALUES 
(1011,'10 IPA 1','1',1),
(1012,'10 IPA 2','1',2),
(1013,'10 IPA 3','1',3),
(1014,'10 IPA 4','1',4),
(1021,'10 IPS 1','1',5),
(1022,'10 IPS 2','1',6),
(1023,'10 IPS 3','1',7),
(2011,'11 IPA 1','2',8),
(2012,'11 IPA 2','2',9),
(2013,'11 IPA 3','2',10),
(2014,'11 IPA 4','2',11),
(2021,'11 IPS 1','2',12),
(2022,'11 IPS 2','2',13),
(2023,'11 IPS 3','2',14),
(3011,'12 IPA 1','3',15),
(3012,'12 IPA 2','3',16),
(3013,'12 IPA 3','3',17),
(3014,'12 IPA 4','3',18),
(3021,'12 IPS 1','3',19),
(3022,'12 IPS 2','3',NULL),
(3023,'12 IPS 3','3',20);


CREATE TABLE `matapelajaran` (
  `idMatapelajaran` INT(11) NOT NULL,
  `namaMatapelajaran` VARCHAR(45) DEFAULT NULL,
  `idGuru` INT(11) DEFAULT NULL,
  PRIMARY KEY (`idMatapelajaran`),
  KEY `matapelajaran_guru` (`idGuru`),
  CONSTRAINT `matapelajaran_guru` FOREIGN KEY (`idGuru`) REFERENCES `guru` (`idGuru`)
) 
INSERT  INTO `matapelajaran`(`idMatapelajaran`,`namaMatapelajaran`,`idGuru`) VALUES 
(1,'Matematika',1),
(2,'Bahasa Indonesia',2),
(3,'Bahasa Inggris',3),
(4,'IPA',4),
(5,'IPS',5),
(6,'Seni Budaya',6),
(7,'Pendidikan Agama',7),
(8,'Pendidikan Jasmani',8),
(9,'Sejarah',9),
(10,'Geografi',10),
(11,'Sosiologi',11),
(12,'Ekonomi',12),
(13,'Fisika',13),
(14,'Kimia',14),
(15,'Biologi',15),
(16,'Tata Boga',16),
(17,'Tata Busana',17),
(18,'Desain Grafis',18),
(19,'Olahraga',19),
(20,'Pramuka',20);


CREATE TABLE `nilai` (
  `idNilai` INT(11) NOT NULL,
  `idSiswa` INT(11) DEFAULT NULL,
  `idMatapelajaran` INT(11) DEFAULT NULL,
  `Nilai` INT(11) DEFAULT NULL,
  `keterangan` ENUM('Lulus','Tidak Lulus') DEFAULT NULL,
  PRIMARY KEY (`idNilai`),
  KEY `nilai_siswa` (`idSiswa`),
  KEY `nilai_matapelajaran` (`idMatapelajaran`),
  CONSTRAINT `nilai_matapelajaran` FOREIGN KEY (`idMatapelajaran`) REFERENCES `matapelajaran` (`idMatapelajaran`),
  CONSTRAINT `nilai_siswa` FOREIGN KEY (`idSiswa`) REFERENCES `siswa` (`idSiswa`)
) 
INSERT  INTO `nilai`(`idNilai`,`idSiswa`,`idMatapelajaran`,`Nilai`,`keterangan`) VALUES 
(1,4,1,80,'Lulus'),
(2,7,2,75,'Lulus'),
(3,3,1,90,'Lulus'),
(4,5,2,60,'Tidak Lulus'),
(5,14,1,85,'Lulus'),
(6,19,2,70,'Lulus'),
(7,17,1,95,'Lulus'),
(8,2,1,55,'Tidak Lulus'),
(9,17,2,88,'Lulus'),
(10,15,1,72,'Lulus'),
(11,13,1,92,'Lulus'),
(12,5,2,65,'Tidak Lulus'),
(13,14,1,82,'Lulus'),
(14,4,1,78,'Lulus'),
(15,14,1,93,'Lulus'),
(16,15,1,58,'Tidak Lulus'),
(17,6,1,87,'Lulus'),
(18,8,2,74,'Lulus'),
(19,9,1,94,'Lulus'),
(20,11,1,68,'Tidak Lulus');


CREATE TABLE `siswa` (
  `idSiswa` INT(11) NOT NULL,
  `namaSiswa` VARCHAR(45) DEFAULT NULL,
  `alamat` VARCHAR(45) DEFAULT NULL,
  `tglLahir` DATE DEFAULT NULL,
  `jenisKelamin` ENUM('Laki-laki','Perempuan') DEFAULT NULL,
  `idKelas` INT(11) DEFAULT NULL,
  PRIMARY KEY (`idSiswa`),
  KEY `siswa_kelas` (`idKelas`),
  CONSTRAINT `siswa_kelas` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`)
)

INSERT  INTO `siswa`(`idSiswa`,`namaSiswa`,`alamat`,`tglLahir`,`jenisKelamin`,`idKelas`) VALUES 
(1,'Andi','Jl. Sudirman 10','2001-02-02','Laki-laki',1011),
(2,'Budi','Jl. Pahlawan No. 5','2004-05-15','Laki-laki',1011),
(3,'Citra','Jl. Jenderal Sudirman No. 20','2005-09-20','Perempuan',1012),
(4,'Dewi','Jl. Diponegoro No. 8','2004-12-25','Perempuan',1014),
(5,'Eko','Jl. Gajah Mada No. 12','2005-03-30','Laki-laki',1013),
(6,'Fani','Jl. A. Yani No. 25','2004-07-05','Perempuan',1012),
(7,'Gita','Jl. S. Parman No. 30','2005-10-10','Perempuan',1021),
(8,'Hadi','Jl. Diponegoro No. 15','2004-01-20','Laki-laki',1023),
(9,'Indra','Jl. Merdeka No. 10','2005-06-15','Laki-laki',1014),
(10,'Joko','Jl. Gajah Mada No. 5','2004-09-25','Laki-laki',1014),
(11,'Kartika','Jl. Pahlawan No. 30','2005-04-05','Perempuan',1011),
(12,'Lina','Jl. Jenderal Sudirman No. 15','2004-07-10','Perempuan',1023),
(13,'Maman','Jl. A. Yani No. 8','2005-10-15','Laki-laki',1013),
(14,'Nia','Jl. S. Parman No. 25','2004-02-20','Perempuan',1013),
(15,'Oscar','Jl. Diponegoro No. 30','2005-05-30','Laki-laki',1012),
(16,'Putri','Jl. Merdeka No. 5','2004-10-05','Perempuan',1021),
(17,'Qori','Jl. Gajah Mada No. 10','2005-01-10','Laki-laki',1014),
(18,'Rina','Jl. Pahlawan No. 25','2004-04-15','Perempuan',1013),
(19,'Sari','Jl. Jenderal Sudirman No. 8','2005-07-20','Perempuan',1012),
(20,'Tono','Jl. A. Yani No. 1','2004-12-25','Laki-laki',1023);
CREATE DATABASE db_organisasi;
USE db_organisasi;

CREATE TABLE departemen (
	id_departemen INT(15) PRIMARY KEY NOT NULL, 
	nama_departemen VARCHAR(100) NOT NULL, 
	deskripsi TEXT
	);
	
CREATE TABLE anggota (
	nim VARCHAR(15) PRIMARY KEY NOT NULL,
	nama VARCHAR(45) NOT NULL,
	ttl DATE NOT NULL,
	jabatan VARCHAR(45) NOT NULL,
	id_departemen INT,
	FOREIGN KEY (id_departemen) REFERENCES departemen(id_departemen) 
	);

CREATE TABLE tim (
	id_departemen INT,
	FOREIGN KEY (id_departemen) REFERENCES departemen(id_departemen),
	ketua VARCHAR(15),
	FOREIGN KEY (ketua) REFERENCES anggota(nim)
	);
	
CREATE TABLE proker (
	id_proker INT(15) NOT NULL,
	nama_proker VARCHAR(100) NOT NULL,
	pj_proker VARCHAR(15),
	FOREIGN KEY (pj_proker) REFERENCES anggota(nim),
	id_departemen INT,
	FOREIGN KEY (id_departemen) REFERENCES departemen(id_departemen)
	);

CREATE TABLE agenda (
	id_agenda INT(15) NOT NULL,
	nama_agenda VARCHAR(100) NOT NULL,
	pj_agenda VARCHAR(15),
	FOREIGN KEY (pj_agenda) REFERENCES anggota(nim),
	id_departemen INT,
	FOREIGN KEY (id_departemen) REFERENCES departemen(id_departemen)
	);

SHOW TABLES;

INSERT INTO departemen (id_departemen, nama_departemen, deskripsi) VALUES 
	(101, 'BPH', 'Badan Pengurus Harian'),
	(102, 'Departemen Akprosi', 'Akademik, Profesi, dan Prestasi Sistem Informasi'),
	(103, 'Departemen PSDM', 'Pengembangan Sumber Daya Mahasiswa'),
	(104, 'Departemen Kominfo', 'Komunikasi dan Informasi'),
	(105, 'Departemen Mikat', 'Minat dan Bakat'),
	(106, 'Departemen Humas', 'Hubungan Masyarakat'),
	(107, 'Departemen TI', 'Teknologi Informasi'),
	(108, 'Departemen KWU', 'Kewirausahaan');
INSERT INTO departemen (id_departemen, nama_departemen, deskripsi) VALUES 
	(109, 'Departemen Pemasaran', 'Pemasaran Barang'),
	(110, 'Departemen Produksi', 'Produksi Barang'),
	(111, 'Departemen Media', 'Sarana Media dan Informasi'),
	(112, 'Departemen Dokumentasi', 'Dokumentasi Kegiatan'),
	(113, 'Departemen Publikasi', 'Publikasi Informasi'),
	(114, 'Departemen Perlengkapan', 'Perlengkapan Kantor'),
	(115, 'Departemen Keagamaan', 'Agama'),
	(116, 'Departemen Pendidikan', 'Tenaga Kependidikan'),
	(117, 'Departemen Kesejahteraan', 'Kesejahteraan Anggota'),
	(118, 'Departemen Keilmuan', 'Keilmuan dan Pendidikan'),
	(119, 'Departemen Teknologi', 'Teknologi Informasi'),
	(120, 'Departemen Tata Usaha', 'Tata Usaha Organisasi');
SELECT * FROM departemen;

INSERT INTO anggota (nim, nama, ttl, jabatan, id_departemen) VALUES
	(236473790141, 'Candra Adiwiyata', '2003-10-11', 'Ketua Umum', 101),
	(230441100142, 'Dian Anggraini', '2002-02-10', 'Wakil Ketua Umum', 101),
	(236521888143, 'Citra Ambarwati', '2004-09-18', 'Sekretaris 1', 101),
	(230449065144, 'Dimas Aditya Pangarep', '2005-10-16', 'Sekretaris 2', 101),
	(230454321145, 'Nisaur Rohmah', '2003-10-17', 'Bendahara 1', 101),
	(230448900146, 'Eka Ayu Safitri', '2002-01-12', 'Bendahara 2', 101),
	(230446578147, 'Firliana Berlian', '2003-09-17', 'Manajer Departemen', 101),
	(230440961148, 'Artyasa Firnas', '2003-10-11', 'Kepala Departemen', 102),
	(230448732149, 'Annisa Putri Cantika', '2003-08-11', 'Staff', 102),
	(230440986150, 'Bagus Sajiwo', '2003-10-10', 'Kepala Departemen', 103),
	(230490870151, 'Cristine Orelaniesa', '2003-04-19', 'Staff', 103),
	(230441189152, 'Filla Davincha', '2003-05-10', 'Kepala Departemen', 104),
	(230445789153, 'Cindy Permata', '2003-08-12', 'Staff', 104),
	(230441112154, 'Ivan Adiputra', '2003-05-17', 'Kepala Departemen', 105),
	(230441905155, 'Ferlin Ririaana', '2003-04-19', 'Staff', 105),
	(230441171156, 'Ryando Sepitro', '2003-05-14', 'Kepala Departemen', 106),
	(230061890157, 'Putra Hasibuan', '2003-03-10', 'Staff', 106),
	(230447678158, 'Nana Niana', '2003-05-14', 'Kepala Departemen', 107),
	(230760982159, 'Ranadilla Nuratsila', '2003-05-10', 'Staff', 107),
	(235679002160, 'Retno Iva Mariatna', '2002-05-10', 'Kepala Departemen', 108),
	(230000000161, 'Dinda Setya', '2003-12-12', 'Staff', 108);
INSERT INTO anggota (nim, nama, ttl, jabatan, id_departemen) VALUES
	(2312345678, 'Andini Putri', '2002-01-01', 'Kepala Departemen', 109),
	(2398765432, 'Rian Saputra', '2003-03-03', 'Staff', 109),
	(2354321888, 'Dian Lestari', '2002-02-02', 'Staff', 110),
	(2332109806, 'Bima Sakti', '2003-04-04', 'Kepala Departemen', 110),
	(2376543210, 'Rina Amelia', '2002-05-05', 'Kepala Departemen', 111),
	(2321389784, 'Donny Pratama', '2003-06-06', 'Staff', 111),
	(2347777776, 'Clara Suci', '2002-07-07', 'Staff', 112),
	(2386543210, 'Eko Wahyudi', '2003-08-08', 'Kepala Departemen', 112),
	(2320980004, 'Fina Anisa', '2002-09-09', 'Kepala Departemen', 113),
	(2367321098, 'Gilang Ramadhan', '2003-10-10', 'Staff', 113),
	(2312345078, 'Nina Agustina', '2002-11-11', 'Staff', 114),
	(2398700002, 'Tommy Kurniawan', '2003-12-12', 'Kepala Departemen', 114),
	(2354321678, 'Ana Maria', '2002-01-13', 'Kepala Departemen', 115),
	(2322222276, 'Bayu Aditya', '2003-02-14', 'Staff', 115),
	(2388886210, 'Cindy Febriana', '2002-03-15', 'Staff', 116),
	(2310000654, 'Doni Hardianto', '2003-04-16', 'Kepala Departemen', 116),
	(2342109876, 'Eka Putri', '2002-05-17', 'Kepala Departemen', 117),
	(2276738810, 'Fajar Nugraha', '2003-06-18', 'Staff', 117),
	(2320987654, 'Gina Lestari', '2002-07-19', 'Staff', 118),
	(2364321098, 'Hendra Gunawan', '2003-08-20', 'Kepala Departemen', 118),
	(2312345900, 'Ira Maya', '2002-09-21', 'Kepala Departemen', 119),
	(2308765492, 'Joko Widodo', '2003-10-22', 'Staff', 119),
	(2311111111, 'Anisa Icha', '2002-09-21', 'Kepala Departemen', 120),
	(2397100992, 'Imam Anshori', '2003-10-22', 'Staff', 120);

SELECT * FROM anggota;

INSERT INTO tim (id_departemen, ketua) VALUES 
	(101, 236473790141),
	(102, 230440961148),
	(103, 230440986150),
	(104, 230441189152),
	(105, 230441112154),
	(106, 230441171156),
	(107, 230447678158),
	(108, 235679002160);
INSERT INTO tim (id_departemen, ketua) VALUES 
	(109, 2312345678),
	(110, 2332109806),
	(111, 2376543210), 
	(112, 2386543210),
	(113, 2320980004),
	(114, 2398700002),
	(115, 2354321678),
	(116, 2310000654),
	(117, 2342109876),
	(118, 2364321098),
	(119, 2312345900),
	(120, 2311111111);
SELECT * FROM tim;

INSERT INTO proker (id_proker, nama_proker, pj_proker, id_departemen) VALUES
	(501, 'Musyawarah Mahasiswa', 230441100142, 101),
	(502, 'Lomba UI/UX', 230448732149, 102),
	(503, 'Pengenalan Prodi', 230490870151, 103),
	(504, 'Kontes Kreasi dan Edukasi', 230445789153, 104),
	(505, 'Event Family', 230441905155, 105),
	(506, 'Sponsorship', 230061890157, 106),
	(507, 'Lomba Coding', 230760982159, 107),
	(508, 'Seminar Kewirausahaan', 230000000161, 108);
INSERT INTO proker (id_proker, nama_proker, pj_proker, id_departemen) VALUES
	(509, 'Bakti Sosial', 2398765432, 109),
	(510, 'Workshop Desain Grafis', 2354321888, 110),
	(511, 'Pentas Seni', 2321389784, 111),
	(512, 'Olimpiade Matematika', 2347777776, 112),
	(513, 'Seminar Kewirausahaan', 2367321098, 113),
	(514, 'Pelatihan Public Speaking', 2312345078, 114),
	(515, 'Debat Bahasa Inggris', 2322222276, 115),
	(516, 'Lomba Programming', 2388886210, 116),
	(517, 'Pentas Seni Budaya', 2342109876, 117),
	(518, 'Workshop Menulis Kreatif', 2320987654, 118),
	(519, 'Donor Darah', 2308765492, 119),
	(520, 'Pembukaan Hima', 2397100992, 120);
	
SELECT * FROM proker;

INSERT INTO agenda (id_agenda, nama_agenda, pj_agenda, id_departemen) VALUES
	(901, 'Belajar Bareng', 230441100142, 101),
	(902, 'Info Beasiswa', 230448732149, 102),
	(903, 'Family Time', 230490870151, 103),
	(904, 'Foto & Video Profile', 230445789153, 104),
	(905, 'Latihan Bersama', 230441905155, 105),
	(906, 'PDH Day', 230061890157, 106),
	(907, 'Codingers', 230760982159, 107),
	(908, 'Sayembara Desain', 230000000161, 108);
INSERT INTO agenda (id_agenda, nama_agenda, pj_agenda, id_departemen) VALUES
	(909, 'Rapat Persiapan Proker', 2398765432, 109),
	(910, 'Evaluasi Kegiatan', 2354321888, 110),
	(911, 'Diskusi Ilmiah', 2321389784, 111),
	(912, 'Nobar Film', 2347777776, 112),
	(913, 'Workshop Public Speaking', 2367321098, 113),
	(914, 'Pembentukan Tim Proker', 2312345078, 114),
	(915, 'Lomba Debat Bahasa Inggris', 2322222276, 115),
	(916, 'Tutorial Programming', 2388886210, 116),
	(917, 'Pentas Seni Budaya', 2342109876, 117),
	(918, 'Workshop Menulis Kreatif', 2320987654, 118),
	(919, 'Bakti Sosial', 2308765492, 119),
	(920, 'Rapat Anggota', 2397100992, 120);

SELECT * FROM agenda;
	
CREATE VIEW update_view1 AS
	SELECT anggota.nim, anggota.nama, anggota.ttl, anggota.jabatan, anggota.id_departemen, departemen.nama_departemen
	FROM anggota
	JOIN departemen ON anggota.id_departemen = departemen.id_departemen;
SELECT * FROM update_view1;

CREATE VIEW update_view2 AS
	SELECT anggota.nim, anggota.nama, anggota.ttl, anggota.jabatan, tim.id_departemen, tim.ketua
	FROM anggota
	JOIN tim ON anggota.nim = tim.ketua;
SELECT * FROM update_view2;



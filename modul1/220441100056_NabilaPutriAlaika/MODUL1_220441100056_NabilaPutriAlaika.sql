CREATE TABLE Anggota (
    anggota_id INT PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255),
    tanggal_daftar DATE
);

CREATE TABLE Buku (
    buku_id INT PRIMARY KEY,
    judul VARCHAR(255),
    pengarang VARCHAR(100),
    tahun_terbit INT,
    jumlah_halaman INT
);

CREATE TABLE Peminjaman (
    peminjaman_id INT PRIMARY KEY,
    anggota_id INT,
    buku_id INT,
    tanggal_peminjaman DATE,
    tanggal_pengembalian DATE,
    status_pengembalian VARCHAR(50),
    FOREIGN KEY (anggota_id) REFERENCES Anggota(anggota_id),
    FOREIGN KEY (buku_id) REFERENCES Buku(buku_id)
);

CREATE TABLE Kategori (
    kategori_id INT PRIMARY KEY,
    nama_kategori VARCHAR(100)
);

CREATE TABLE Ketersediaan_Buku (
    ketersediaan_id INT PRIMARY KEY,
    buku_id INT,
    kategori_id INT,
    jumlah_tersedia INT,
    FOREIGN KEY (buku_id) REFERENCES Buku(buku_id),
    FOREIGN KEY (kategori_id) REFERENCES Kategori(kategori_id)
);


INSERT INTO Anggota (anggota_id, nama, alamat, tanggal_daftar) VALUES
(1, 'Nabila Putri Alaika', 'Jl. Khayangan No. 12', '2023-05-10'),
(2, 'Sehun', 'Jl. Seoul No. 94', '2023-06-15'),
(3, 'Chanyeol', 'Jl. Busan No. 61', '2023-01-10'),
(4, 'Elzio', 'Jl. Stadion No. 09', '2023-02-15'),
(5, 'Kai', 'Jl. Kembang No. 7', '2023-07-01'),
(6, 'Kyungso', 'Jl. Merdeka No. 10', '2023-07-05'),
(7, 'Chen', 'Jl. Raya No. 15', '2023-07-10'),
(8, 'Xiumin', 'Jl. Jati No. 20', '2023-07-15'),
(9, 'Suho', 'Jl. Mawar No. 25', '2023-07-20'),
(10, 'Baekhyun', 'Jl. Kenanga No. 30', '2023-07-25'),
(11, 'Dina Kamalia', 'Jl. Anggrek No. 35', '2023-07-30'),
(12, 'Nur Indah Hidayati', 'Jl. Melati No. 40', '2023-08-01'),
(13, 'Tifani Safira', 'Jl. Teratai No. 45', '2023-08-05'),
(14, 'Husnul Khotima', 'Jl. Dahlia No. 50', '2023-08-10'),
(15, 'Hadi Kurniawan', 'Jl. Sakura No. 55', '2023-08-15'),
(16, 'Nina Indah', 'Jl. Rambutan No. 60', '2023-08-20'),
(17, 'Arif Budiman', 'Jl. Jambu No. 65', '2023-08-25'),
(18, 'Sari Ningsih', 'Jl. Nangka No. 70', '2023-09-01'),
(19, 'Rudi Hidayat', 'Jl. Pisang No. 75', '2023-09-05'),
(20, 'Dewi Susanti', 'Jl. Durian No. 80', '2023-09-10');

INSERT INTO Buku (buku_id, judul, pengarang, tahun_terbit, jumlah_halaman) VALUES
(1, 'Matahari', 'Tere Liye', 2018, 368),
(2, 'Laskar Pelangi', 'Andrea Hirata', 2005, 278),
(3, 'Ayat-ayat Cinta', 'Habiburrahman El-Shirazy', 2004, 356),
(4, 'Dilan: Dia Adalah Dilanku Tahun 1990', 'Pidi Baiq', 2014, 332),
(5, 'Perahu Kertas', 'Dee Lestari', 2009, 368),
(6, '5 cm', 'Donny Dhirgantoro', 2005, 364),
(7, 'Rindu', 'Tere Liye', 2019, 408),
(8, 'Negeri 5 Menara', 'Ahmad Fuadi', 2009, 396),
(9, 'Bumi Manusia', 'Pramoedya Ananta Toer', 1980, 536),
(10, 'Pulang', 'Tere Liye', 2016, 500), 
(11, 'Pendidikan Karakter Anak Usia Dini', 'Bambang Surya', 2015, 200),
(12, 'Ilmu Pengetahuan Alam Kelas 6', 'Dian Setiyani', 2019, 180),
(13, 'Teknik Pengelolaan Arsip Digital', 'Ahmad Basuki', 2018, 250),
(14, 'Panduan Investasi Saham untuk Pemula', 'Dewi Sartika', 2020, 220),
(15, 'Belajar Menjahit untuk Pemula', 'Rina Anggraeni', 2017, 150),
(16, 'Buku Pintar Matematika SD Kelas 4', 'Dwi Puspita', 2016, 190),
(17, 'Budidaya Tanaman Sayuran di Halaman Rumah', 'Asep Suhendar', 2019, 170),
(18, 'Buku Ajar Pemrograman Python', 'Faisal Rahman', 2021, 300),
(19, 'Pengenalan Kriptografi untuk Pemula', 'Indra Kurniawan', 2018, 240),
(20, 'Jurnalisme Online: Teori dan Praktik', 'Yudi Setiawan', 2017, 260);

INSERT INTO Peminjaman (peminjaman_id, anggota_id, buku_id, tanggal_peminjaman, tanggal_pengembalian, status_pengembalian) VALUES
(1, 1, 3, '2023-05-12', '2023-06-12', 'Kembali'),
(2, 3, 4, '2023-06-20', '2023-07-20', 'Belum Kembali'),
(3, 4, 10, '2023-04-12', '2023-05-12', 'Kembali'),
(4, 2, 1, '2023-07-12', '2023-08-12', 'Kembali'),
(5, 8, 5, '2023-07-20', '2023-08-20', 'Belum Kembali'),
(6, 5, 8, '2023-07-25', '2023-08-25', 'Kembali'),
(7, 2, 2, '2023-08-01', '2023-09-01', 'Belum Kembali'),
(8, 6, 5, '2023-08-05', '2023-09-05', 'Kembali'),
(9, 4, 4, '2023-08-10', '2023-09-10', 'Belum Kembali'),
(10, 9, 10, '2023-08-15', '2023-09-15', 'Kembali'),
(11, 10, 4, '2023-08-20', '2023-09-20', 'Belum Kembali'),
(12, 15, 14, '2023-08-25', '2023-09-25', 'Kembali'),
(13, 17, 16, '2023-09-01', '2023-10-01', 'Belum Kembali'),
(14, 13, 12, '2023-09-05', '2023-10-05', 'Kembali'),
(15, 18, 10, '2023-09-10', '2023-10-10', 'Belum Kembali'),
(16, 11, 3, '2023-09-15', '2023-10-15', 'Kembali'),
(17, 15, 17, '2023-09-20', '2023-10-20', 'Belum Kembali'),
(18, 6, 12, '2023-09-25', '2023-10-25', 'Kembali'),
(19, 12, 7, '2023-10-01', '2023-11-01', 'Belum Kembali'),
(20, 1, 1, '2023-10-05', '2023-11-05', 'Kembali');

INSERT INTO Kategori (kategori_id, nama_kategori) VALUES
(1, 'Fiksi'),
(2, 'Non-fiksi');

INSERT INTO Ketersediaan_Buku (ketersediaan_id, buku_id, kategori_id, jumlah_tersedia) VALUES
(1, 1, 1, 50),
(2, 2, 1, 30),
(3, 3, 1, 40),
(4, 4, 1, 20),
(5, 5, 1, 35),
(6, 6, 1, 25),
(7, 7, 1, 45),
(8, 8, 1, 15),
(9, 9, 1, 60),
(10, 10, 1, 10),
(11, 11, 2, 15),
(12, 12, 2, 35),
(13, 13, 2, 20),
(14, 14, 2, 40),
(15, 15, 2, 25),
(16, 16, 2, 40),
(17, 17, 2, 50),
(18, 18, 2, 45),
(19, 19, 2, 10),
(20, 20, 2, 10);
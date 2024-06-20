# Jika ada database sewa_mobil, kita drop dulu, karena kita akan buat databasenya lagi dan edit data tabelnya agar menyesuaikan dengan soal tugas
DROP DATABASE sewa_mobil;

CREATE DATABASE sewa_mobil;
USE sewa_mobil;

# blok 3 UNTUK MEMBUAT TABEL
CREATE TABLE mobil (
    id_mobil INT(11) AUTO_INCREMENT PRIMARY KEY,
    merk VARCHAR(100),
    model VARCHAR(100),
    tahun INT(11),
    warna VARCHAR(50),
    harga_sewa BIGINT(20)
);

CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255),
    nomor_hp VARCHAR(20)
);

CREATE TABLE transaksi_sewa (
    id_transaksi INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_mobil INT(11),
    id_pelanggan INT(11),
    tanggal_sewa DATE,
    tanggal_kembali DATE,
    total_biaya BIGINT(20),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

CREATE TABLE detail_transaksi (
    id_detail INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT(11),
    id_mobil INT(11),
    harga_sewa BIGINT(20),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi_sewa(id_transaksi),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil)
);

CREATE TABLE pembayaran (
    id_pembayaran INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT(11),
    metode_pembayaran VARCHAR(50),
    jumlah_pembayaran BIGINT(20),
    tanggal_pembayaran DATE,
    FOREIGN KEY (id_transaksi) REFERENCES transaksi_sewa(id_transaksi)
);

# blok 4 MENAMBAHKAN DATA PADA MASING MASING TABEL

INSERT INTO mobil (merk, model, tahun, warna, harga_sewa) VALUES
('Toyota', 'Avanza', 2019, 'Hitam', 250000),
('Audi', 'A6', 2018, 'Putih', 300000),
('Suzuki', 'Ertiga', 2020, 'Abu-abu', 270000),
('Mitsubishi', 'Xpander', 2019, 'Merah', 280000),
('Daihatsu', 'Terios', 2017, 'Biru', 260000),
('Toyota', 'Innova', 2019, 'Hitam', 350000),
('Hyundai', 'Stargazer', 2018, 'Putih', 320000),
('Mercedes Benz', 'C200', 2020, 'Abu-abu', 280000),
('Mitsubishi', 'Pajero', 2019, 'Merah', 400000),
('Daihatsu', 'Ayla', 2017, 'Biru', 230000),
('Toyota', 'Fortuner', 2019, 'Hitam', 450000),
('Honda', 'Civic', 2018, 'Putih', 380000),
('Audi', 'A2', 2020, 'Abu-abu', 290000),
('Mitsubishi', 'Triton', 2019, 'Merah', 420000),
('Daihatsu', 'Sigra', 2017, 'Biru', 240000),
('Lamborgini', 'Gallardo', 2019, 'Hitam', 310000),
('Honda', 'BR-V', 2018, 'Putih', 340000),
('Hyundai', 'Creta', 2020, 'Abu-abu', 300000),
('Mercedes Benz', 'CLA', 2019, 'Merah', 380000),
('Daihatsu', 'Gran Max', 2017, 'Biru', 270000);

INSERT INTO pelanggan (nama, alamat, nomor_hp) VALUES
('Budi', 'Jakarta', '08123456789'),
('Ani', 'Surabaya', '08234567890'),
('Citra', 'Bandung', '08345678901'),
('Darma', 'Semarang', '08456789012'),
('Eka', 'Yogyakarta', '08567890123'),
('Fajar', 'Jakarta', '08678901234'),
('Gita', 'Yogyakarta', '08789012345'),
('Hendra', 'Surabaya', '08890123456'),
('Indra', 'Jakarta', '08901234567'),
('Joko', 'Malang', '09012345678'),
('Kurnia', 'Yogyakarta', '09123456789'),
('Lia', 'Jakarta', '09234567890'),
('Mila', 'Jakarta', '09345678901'),
('Nina', 'Surabaya', '09456789012'),
('Oscar', 'Malang', '09567890123'),
('Putri', 'Surabaya', '09678901234'),
('Rudi', 'Yogyakarta', '09789012345'),
('Santi', 'Semarang', '09890123456'),
('Tono', 'Bandung', '09901234567'),
('Umar', 'Bandung', '01012345678');

INSERT INTO transaksi_sewa (id_mobil, id_pelanggan, tanggal_sewa, tanggal_kembali, total_biaya) VALUES
(1, 8, '2024-02-01', '2024-02-05', 1250000),
(10, 15, '2024-02-02', '2024-02-08', 1500000),
(2, 3, '2024-02-03', '2024-02-10', 1300000),
(4, 12, '2024-02-04', '2024-02-09', 1200000),
(3, 19, '2024-02-05', '2024-02-12', 1350000),
(6, 5, '2024-02-06', '2024-02-15', 1800000),
(7, 10, '2024-02-07', '2024-02-14', 1700000),
(11, 18, '2024-02-08', '2024-02-17', 1600000),
(9, 12, '2024-02-09', '2024-02-18', 1400000),
(1, 16, '2024-02-10', '2024-02-20', 1900000),
(20, 20, '2024-02-11', '2024-02-22', 2000000),
(3, 8, '2024-02-12', '2024-02-21', 1700000),
(8, 2, '2024-02-13', '2024-02-24', 1800000),
(4, 12, '2024-02-14', '2024-02-25', 2200000),
(2, 1, '2024-02-15', '2024-02-26', 2500000),
(19, 14, '2024-02-16', '2024-02-28', 2300000),
(7, 12, '2024-02-17', '2024-03-01', 2600000),
(11, 9, '2024-02-18', '2024-03-03', 2800000),
(6, 11, '2024-02-19', '2024-03-05', 2700000),
(20, 17, '2024-02-20', '2024-03-07', 2900000),
(2, 8, '2024-02-20', '2024-03-07', 2900000),
(14, 7, '2024-02-20', '2024-03-07', 2900000),
(11, 8, '2024-02-20', '2024-03-07', 2900000),
(4, 12, '2024-02-20', '2024-03-07', 3100000),
(3, 13, '2024-02-20', '2024-03-07', 2700000),
(1, 6, '2024-02-20', '2024-03-07', 2900000),
(8, 4, '2024-02-20', '2024-03-07', 3200000),
(7, 12, '2024-02-20', '2024-03-07', 2700000);


INSERT INTO detail_transaksi (id_transaksi, id_mobil, harga_sewa) VALUES
(1, 1, 250000),
(2, 10, 300000),
(3, 2, 270000),
(4, 4, 280000),
(5, 3, 260000),
(6, 6, 350000),
(7, 7, 320000),
(8, 11, 300000),
(9, 9, 400000),
(10, 1, 230000),
(11, 20, 450000),
(12, 3, 290000),
(13, 8, 150000),
(14, 4, 420000),
(15, 2, 240000),
(16, 19, 310000),
(17, 7, 340000),
(18, 11, 300000),
(19, 6, 380000),
(20, 20, 270000),
(21, 2, 350000),
(22, 14, 20000),
(23, 11, 300000),
(24, 4, 300000),
(25, 3, 300000),
(26, 1, 300000),
(27, 8, 300000),
(28, 7, 300000);

INSERT INTO pembayaran (id_transaksi, metode_pembayaran, jumlah_pembayaran, tanggal_pembayaran) VALUES 
(1, 'Tunai', 1000000, '2024-02-01'),
(2, 'Transfer Bank', 1500000, '2024-02-02'),
(3, 'Tunai', 1200000, '2024-02-06'),
(4, 'Tunai', 1100000, '2024-02-10'),
(5, 'Transfer Bank', 1300000, '2024-02-11'),
(6, 'Tunai', 1800000, '2024-02-13'),
(7, 'Transfer Bank', 1700000, '2024-02-15'),
(8, 'Tunai', 1600000, '2024-02-17'),
(9, 'Transfer Bank', 1400000, '2024-02-22'),
(10, 'Tunai', 1900000, '2024-02-21'),
(11, 'Tunai', 2000000, '2024-02-21'),
(12, 'Tunai', 1700000, '2024-02-24'),
(13, 'Transfer Bank', 1800000, '2024-03-02'),
(14, 'Tunai', 2200000, '2024-03-03'),
(15, 'Tunai', 2500000, '2024-03-03'),
(16, 'Tunai', 2300000, '2024-03-08'),
(17, 'Tunai', 2600000, '2024-03-12'),
(18, 'Tunai', 2800000, '2024-03-16'),
(19, 'Transfer Bank', 2700000, '2024-03-16'),
(20, 'Tunai', 2900000, '2024-03-20'),
(21, 'Tunai', 2900000, '2024-03-22'),
(22, 'Transfer Bank', 2900000, '2024-03-22'),
(23, 'Tunai', 2900000, '2024-03-30'),
(24, 'Transfer Bank', 3100000, '2024-03-22'),
(25, 'Transfer Bank', 2700000, '2024-03-22'),
(26, 'Tunai', 2900000, '2024-03-22'),
(27, 'Tunai', 3200000, '2024-03-22'),
(28, 'Tunai', 2700000, '2024-03-22');


# NOMOR 1
# blok 1 - ASC - dari kecil ke besar
SELECT * FROM mobil ORDER BY harga_sewa ASC

# blok 1 - DESC - dari besar ke kecil
SELECT * FROM mobil ORDER BY harga_sewa DESC

# NOMOR 2
SELECT mobil.merk, mobil.model, SUM(transaksi_sewa.total_biaya) AS total_biaya_pesanan
FROM transaksi_sewa
INNER JOIN mobil
ON transaksi_sewa.id_mobil = mobil.id_mobil
GROUP BY transaksi_sewa.id_mobil
HAVING total_biaya_pesanan > 1500000
ORDER BY total_biaya_pesanan ASC

# NOMOR 3
SELECT * FROM pembayaran WHERE tanggal_pembayaran BETWEEN '2024-02-09' AND '2024-02-25'

# NOMOR 4
SELECT merk, COUNT(merk) AS total_mobil 
FROM mobil 
GROUP BY merk 
ORDER BY total_mobil DESC
LIMIT 1

# NOMOR 5
SELECT merk, COUNT(merk) AS total_mobil 
FROM mobil 
GROUP BY merk 
ORDER BY total_mobil ASC
LIMIT 1

# NOMOR 6
SELECT merk, model
FROM mobil 
WHERE merk LIKE 'a%'

# NOMOR 7
SELECT transaksi_sewa.id_pelanggan, pelanggan.nama, COUNT(transaksi_sewa.id_pelanggan) AS banyak_sewa
FROM pelanggan
INNER JOIN transaksi_sewa
ON pelanggan.id_pelanggan = transaksi_sewa.id_pelanggan
GROUP BY pelanggan.nama
ORDER BY banyak_sewa DESC
LIMIT 1

# NOMOR 8
SELECT transaksi_sewa.id_pelanggan, pelanggan.nama, COUNT(transaksi_sewa.id_pelanggan) AS banyak_sewa
FROM pelanggan
INNER JOIN transaksi_sewa
ON pelanggan.id_pelanggan = transaksi_sewa.id_pelanggan
GROUP BY pelanggan.nama
HAVING banyak_sewa > 3
ORDER BY banyak_sewa DESC

# NOMOR 9
SELECT pelanggan.id_pelanggan, pelanggan.nama, pelanggan.alamat, pelanggan.nomor_hp, mobil.merk, mobil.model, transaksi_sewa.tanggal_sewa, transaksi_sewa.tanggal_kembali, transaksi_sewa.total_biaya
FROM pelanggan
JOIN transaksi_sewa ON pelanggan.id_pelanggan = transaksi_sewa.id_pelanggan
INNER JOIN mobil ON transaksi_sewa.id_mobil = mobil.id_mobil
ORDER BY pelanggan.id_pelanggan ASC

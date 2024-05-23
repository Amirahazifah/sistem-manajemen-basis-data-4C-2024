CREATE DATABASE db_penjualan;
USE db_penjualan;

-- Membuat tabel pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telepon VARCHAR(15),
    alamat TEXT
);

-- Membuat tabel produk
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(50) NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL
);

-- Membuat tabel pesanan
CREATE TABLE pesanan (
    id_pesanan INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    tanggal_pesanan DATETIME NOT NULL,
    jumlah_total DECIMAL(10,2),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Membuat tabel detail_pesanan
CREATE TABLE detail_pesanan (
    id_detail_pesanan INT AUTO_INCREMENT PRIMARY KEY,
    id_pesanan INT,
    id_produk INT,
    kuantitas INT NOT NULL,
    sub_total DECIMAL(10,2),
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Mengisi tabel pelanggan
INSERT INTO pelanggan (nama, email, telepon, alamat) VALUES
('John Doe', 'john@example.com', '081234567890', 'Jl. Utama No. 123'),
('Jane Smith', 'jane@example.com', '089876543210', 'Jl. Mawar No. 456'),
('Ali Rahman', 'ali@example.com', '082345678901', 'Jl. Melati No. 789'),
('Budi Santoso', 'budi@example.com', '083456789012', 'Jl. Kenanga No. 101'),
('Citra Dewi', 'citra@example.com', '084567890123', 'Jl. Cempaka No. 202'),
('Dewi Lestari', 'dewi@example.com', '085678901234', 'Jl. Kamboja No. 303'),
('Eko Putra', 'eko@example.com', '086789012345', 'Jl. Flamboyan No. 404'),
('Fitri Ayu', 'fitri@example.com', '087890123456', 'Jl. Anggrek No. 505'),
('Gilang Mahesa', 'gilang@example.com', '088901234567', 'Jl. Bougenville No. 606'),
('Hana Sari', 'hana@example.com', '089012345678', 'Jl. Dahlia No. 707');

-- Mengisi tabel produk
INSERT INTO produk (nama_produk, harga, stok) VALUES
('Laptop', 750.00, 10),
('Mouse', 25.00, 100),
('Keyboard', 45.00, 50),
('Monitor', 150.00, 30),
('Printer', 200.00, 20),
('Headset', 35.00, 75),
('Webcam', 80.00, 40),
('Flash Drive', 15.00, 200),
('External Hard Drive', 100.00, 25),
('Router', 60.00, 50);

-- Mengisi tabel pesanan
INSERT INTO pesanan (id_pelanggan, tanggal_pesanan, jumlah_total) VALUES
(1, '2024-05-15 10:00:00', 775.00),
(2, '2024-05-15 11:00:00', 50.00),
(3, '2024-05-16 09:30:00', 195.00),
(4, '2024-05-16 14:15:00', 900.00),
(5, '2024-05-17 16:45:00', 35.00),
(6, '2024-05-18 10:20:00', 160.00),
(7, '2024-05-18 11:30:00', 100.00),
(8, '2024-05-19 12:00:00', 345.00),
(9, '2024-05-19 13:50:00', 215.00),
(10, '2024-05-20 15:25:00', 650.00);

-- Mengisi tabel detail_pesanan
INSERT INTO detail_pesanan (id_pesanan, id_produk, kuantitas, sub_total) VALUES
(1, 1, 1, 750.00),
(1, 2, 1, 25.00),
(2, 2, 2, 50.00),
(3, 3, 2, 90.00),
(3, 4, 1, 105.00),
(4, 1, 1, 750.00),
(4, 5, 1, 150.00),
(5, 6, 1, 35.00),
(6, 7, 2, 160.00),
(7, 8, 5, 75.00),
(7, 9, 1, 25.00),
(8, 10, 2, 120.00),
(8, 3, 5, 225.00),
(9, 4, 1, 150.00),
(9, 5, 1, 65.00),
(10, 6, 2, 70.00),
(10, 7, 1, 80.00),
(10, 9, 2, 200.00),
(10, 8, 20, 300.00);
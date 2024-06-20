CREATE TABLE Penjualan (
    ID_Penjualan INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Penjualan DATE,
    ID_Pelanggan INT,
    Total_Harga DECIMAL(10, 2),
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan)
);
CREATE TABLE Pengembalian_Barang (
    ID_Retur INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Retur DATE,
    ID_Penjualan INT,
    Alasan_Retur VARCHAR(255),
    Total_Harga_Retur DECIMAL(10, 2),
    FOREIGN KEY (ID_Penjualan) REFERENCES Penjualan(ID_Penjualan)
);
CREATE TABLE Pembelian_Supplier (
    ID_Pembelian INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Pembelian DATE,
    ID_Supplier INT,
    Total_Harga_Pembelian DECIMAL(10, 2),
    FOREIGN KEY (ID_Supplier) REFERENCES Supplier(ID_Supplier)
);
CREATE TABLE Koreksi_Stok (
    ID_Koreksi INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Koreksi DATE,
    ID_Barang INT,
    Keterangan_Koreksi VARCHAR(255),
    Jumlah_Koreksi INT
);
CREATE TABLE Pelanggan (
    ID_Pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Pelanggan VARCHAR(100),
    Alamat_Pelanggan VARCHAR(255),
    No_Telepon VARCHAR(20)
);
CREATE TABLE Supplier (
    ID_Supplier INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Supplier VARCHAR(100),
    Alamat_Supplier VARCHAR(255),
    No_Telepon VARCHAR(20)
)
CREATE TABLE Akun_Penjualan (
    ID_Akun_Penjualan INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Transaksi DATE,
    ID_Penjualan INT,
    Total_Penjualan DECIMAL(10, 2),
    FOREIGN KEY (ID_Penjualan) REFERENCES Penjualan(ID_Penjualan)
);
CREATE TABLE Akun_Hutang (
    ID_Akun_Hutang INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Transaksi DATE,
    ID_Pembelian INT,
    Total_Hutang DECIMAL(10, 2),
    FOREIGN KEY (ID_Pembelian) REFERENCES Pembelian_Supplier(ID_Pembelian)
);
CREATE TABLE Laporan_Penjualan (
    ID_Laporan_Penjualan INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    Total_Penjualan_Hari DECIMAL(10, 2),
    Total_Penjualan_Bulan DECIMAL(10, 2),
    Total_Penjualan_Tahun DECIMAL(10, 2)
);
CREATE TABLE Laporan_Stok (
    ID_Laporan_Stok INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    ID_Barang INT,
    Stok_Awal INT,
    Stok_Akhir INT,
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang)
);
CREATE TABLE Barang (
    ID_Barang INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Barang VARCHAR(255),
    Harga DECIMAL(10, 2),
    Stok INT
);
SELECT * FROM Pelanggan;
SELECT * FROM Barang;
SELECT * FROM Supplier;
SELECT * FROM Penjualan;
SELECT * FROM Pengembalian_Barang;
SELECT * FROM Pembelian_Supplier;
SELECT * FROM Koreksi_Stok;
SELECT * FROM Akun_Penjualan;
SELECT * FROM Akun_Hutang;
SELECT * FROM Laporan_Penjualan;
SELECT * FROM Laporan_Stok;

ALTER TABLE Pelanggan RENAME TO Customer;

DROP DATABASE nama_database;
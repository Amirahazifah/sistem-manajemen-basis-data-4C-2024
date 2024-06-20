CREATE TABLE Barang (
    ID_Barang INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Barang VARCHAR(255) NOT NULL,
);

CREATE TABLE Gudang (
    ID_Gudang INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Gudang VARCHAR(255) NOT NULL,
    Alamat VARCHAR(255) NOT NULL
);

CREATE TABLE Supplier (
    ID_Supplier INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Supplier VARCHAR(255) NOT NULL,
    Nomor_Telepon VARCHAR(15) NOT NULL
);

CREATE TABLE Pegawai (
    ID_Pegawai INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Pegawai VARCHAR(255) NOT NULL,
    Nomor_Telepon VARCHAR(15) NOT NULL,
    ID_Gudang INT NOT NULL
);

CREATE TABLE Penerimaan (
    ID_Penerimaan INT PRIMARY KEY AUTO_INCREMENT,
    Tanggal_Penerimaan DATE NOT NULL,
    ID_Supplier INT NOT NULL,
    ID_Barang INT NOT NULL,
    Jumlah_Terima INT NOT NULL,
    ID_Gudang INT NOT NULL,
    ID_Pegawai INT NOT NULL
);

AFTER TABLE Kategoribarang (
ID_Kategori INT PRIMARY KEY AUTO_INCREMENT,
Kategori VARCHAR(255) NOT NULL
);

AFTER TABLE kota (
ID_Kota INT PRIMARY KEY AUTO_INCREMENT
Nama_Kota VARCHAR(255) NOT NULL
);

AFTER TABLE Jabatanpegawai (
ID_Jabatan INT PRIMARY AUTO_INCREMENT,
Jabatan VARCHAR(255) NOT NULL
);

ALTER TABLE Pegawai
ADD CONSTRAINT FK_Pegawai_Gudang
FOREIGN KEY (ID_Gudang)
REFERENCES Gudang(ID_Gudang);

ALTER TABLE Penerimaan
ADD CONSTRAINT FK_Penerimaan_Supplier
FOREIGN KEY (ID_Supplier)
REFERENCES Supplier(ID_Supplier);

ALTER TABLE Penerimaan
ADD CONSTRAINT FK_Penerimaan_Barang
FOREIGN KEY (ID_Barang)
REFERENCES Barang(ID_Barang);

ALTER TABLE Penerimaan
ADD CONSTRAINT FK_Penerimaan_Gudang
FOREIGN KEY (ID_Gudang)
REFERENCES Gudang(ID_Gudang);

ALTER TABLE Penerimaan
ADD CONSTRAINT FK_Transaksi_Penerimaan_Pegawai
FOREIGN KEY (ID_Pegawai)
REFERENCES Pegawai(ID_Pegawai);

INSERT INTO Barang (Nama_Barang, ID_Kategori) VALUES
('Beras', '1'),
('Gula', '1'),
('Minyak Goreng', '1'),
('Sabun Mandi', '2'),
('Pasta Gigi', '2'),
('Sikat Gigi', '2'),
('Shampoo', '2'),
('Pembersih Lantai', '2'),
('Pembersih Kaca', '2'),
('Sapu', '2'),
('Sarung Tangan', '2'),
('Penghapus', '3'),
('Pensil', '3'),
('Buku Catatan', '3'),
('Baterai AA', '4'),
('Baterai AAA', '4'),
('Kabel USB', '4'),
('Mouse', '4'),
('Keyboard', '4'),
('Speaker', '4'),
('Lampu LED', '4'),
('Charger HP', '4'),
('Powerbank', '4'),
('Sikat Toilet', '2'),
('Lap Pembersih', '2');

SELECT * FROM barang;

INSERT INTO Gudang (Nama_Gudang, Alamat) VALUES
('Gudang A', 'Surabaya'),
('Gudang B', 'Surabaya'),
('Gudang C', 'Surabaya'),
('Gudang D', 'Surabaya'),
('Gudang E', 'Surabaya'),
('Gudang F', 'Sidoarjo'),
('Gudang G', 'Sidoarjo'),
('Gudang H', 'Sidoarjo'),
('Gudang I', 'Sidoarjo'),
('Gudang J', 'Sidoarjo'),
('Gudang K', 'Surabaya'),
('Gudang L', 'Surabaya'),
('Gudang M', 'Surabaya'),
('Gudang N', 'Surabaya'),
('Gudang O', 'Surabaya'),
('Gudang P', 'Sidoarjo'),
('Gudang Q', 'Sidoarjo'),
('Gudang R', 'Sidoarjo'),
('Gudang S', 'Sidoarjo'),
('Gudang T', 'Sidoarjo'),
('Gudang U', 'Sidoarjo');

SELECT * FROM gudang;

INSERT INTO pegawai (Nama_Pegawai, ID_Jabatan, Nomor_Telepon, ID_Gudang)
VALUES
('Dewi', 'Manager Gudang', '081803666453', 1),
('Susi', 'Manager Gudang', '081285766617', 2),
('Rudi', 'Staf Gudang', '0827363334080', 1),
('Budi', 'Staf Gudang', '081233422890', 2),
('Indra', 'Staf Gudang', '085234555808', 3),
('Lina', 'Staf Gudang', '085135567111', 4),
('Tono', 'Pengemas Barang', '081234567818', 1),
('Putri', 'Pengemas Barang', '085716335222', 2),
('Fahmi', 'Pengemas Barang', '081534334221', 3),
('Hadi', 'Pengemas Barang', '085545888202', 4),
('Andi', 'Pengemas Barang', '081245344400', 1),
('Gita', 'Pengemas Barang', '082544432306', 2),
('Nina', 'Buruh Umum', '081463788892', 1),
('Kiki', 'Buruh Umum', '082007540390', 2),
('Umar', 'Buruh Umum', '081976555112', 3),
('Mila', 'Buruh Umum', '081999736488', 4),
('Joko', 'Buruh Umum', '081873633455', 1),
('Eka', 'Buruh Umum', '0827665490837', 2),
('Oscar', 'Buruh Umum', '082345546784', 3),
('Susi', 'Buruh Umum', '081777524336', 4);

SELECT * FROM pegawai;

INSERT INTO Supplier (Nama_Supplier, Alamat, Nomor_Telepon) VALUES
('Supplier A', 'Gresik', '082333959449'),
('Supplier B', 'Gresik', '081232009220'),
('Supplier C', 'Pasuruan', '0817515666456'),
('Supplier D', 'Pasuruan', '085736334991'),
('Supplier E', 'Pasuruan', '085893239445'),
('Supplier F', 'Bangkalan', '081657888946'),
('Supplier G', 'Bangkalan', '085768999867'),
('Supplier H', 'Bangkalan', '081222131424'),
('Supplier I', 'Jombang', '082334543422'),
('Supplier J', 'Pasuruan', '081998760090'),
('Supplier K', 'Gresik', '082334637828'),
('Supplier L', 'Gresik', '081657488001'),
('Supplier M', 'Pasuruan', '082344563772'),
('Supplier N', 'Pasuruan', '081564666803'),
('Supplier O', 'Bangkalan', '085663474899'),
('Supplier P', 'Bangkalan', '081657483743'),
('Supplier Q', 'Jombang', '082323445896'),
('Supplier R', 'Jombang', '081444535677'),
('Supplier S', 'Gresik', '081766899908'),
('Supplier T', 'Pasuruan', '085456654209');

SELECT * FROM supplier;

INSERT INTO Penerimaan (Tanggal_Penerimaan, ID_Supplier, ID_Barang, Jumlah_Terima, ID_Gudang, ID_Pegawai) VALUES
('2025-03-01', 1, 1, 100, 4, 6),
('2025-03-02', 2, 2, 150, 2, 4),
('2025-03-03', 2, 3, 200, 4, 6),
('2025-03-04', 4, 4, 50, 4, 6),
('2025-03-05', 5, 5, 120, 5, 6),
('2025-03-06', 7, 6, 80, 1, 3),
('2025-03-07', 7, 7, 100, 2, 4),
('2025-03-08', 8, 8, 150, 3, 5),
('2025-03-09', 9, 9, 200, 1, 3),
('2025-03-10', 10, 10, 70, 5, 6),
('2025-03-11', 1, 11, 90, 1, 3),
('2025-03-12', 3, 12, 110, 2, 4),
('2025-03-13', 3, 13, 80, 3, 5),
('2025-03-14', 4, 14, 130, 3, 5),
('2025-03-15', 5, 15, 180, 5, 6),
('2025-03-16', 6, 16, 60, 3, 5),
('2025-03-17', 6, 17, 90, 2, 4),
('2025-03-18', 8, 18, 120, 1, 3),
('2025-03-19', 9, 19, 100, 4, 6),
('2025-03-20', 3, 20, 150, 5, 6);

SELECT * FROM penerimaan;

--updatable
CREATE VIEW supplieralamat AS
SELECT Nama_Supplier, Nomor_Telepon FROM supplier;
SELECT * FROM supplieralamat;


--readonly
CREATE VIEW pgudang AS
SELECT Nama_Gudang, Nama_Pegawai FROM gudang JOIN pegawai ON gudang.ID_Gudang=pegawai.ID_Gudang;
SELECT * FROM pgudang;

CREATE VIEW pegawaipenerimaan AS
SELECT Nama_Pegawai, Tanggal_Penerimaan FROM pegawai JOIN penerimaan ON pegawai.ID_Pegawai=penerimaan.ID_Pegawai;
SELECT * FROM pegawaipenerimaan;

INSERT INTO supplieralamat (Nama_Supplier, Nomor_Telepon) VALUES ('Supplier V', '123456789');
UPDATE supplieralamat SET Nomor_Telepon = '987654321' WHERE Nama_Supplier = 'Supplier B';
DELETE FROM supplieralamat WHERE Nama_Supplier = 'Supplier T';

--error<dua tabel>
INSERT INTO pgudang (Nama_Gudang, Nama_Pegawai) VALUES ('Gudang V', 'Agung');
DELETE FROM pgudang WHERE Nama_Pegawai = 'Susi';

ALTER TABLE pegawai ADD COLUMN alamat CHAR(255) AFTER Jabatan;
DESC barang;

SELECT a.Nama_Supplier, c.Nama_Barang 
FROM supplier a
JOIN penerimaan b ON a.ID_Supplier = b.ID_Supplier 
JOIN barang c ON b.ID_Barang = c.ID_Barang;

CREATE VIEW supbarang AS
SELECT a.Nama_Supplier, c.Nama_Barang 
FROM supplier a
JOIN penerimaan b ON a.ID_Supplier = b.ID_Supplier 
JOIN barang c ON b.ID_Barang = c.ID_Barang;
SELECT * FROM supbarang;

DROP VIEW supbarang;

CREATE TABLE kategoribarang (
    ID_Kategori INT PRIMARY KEY AUTO_INCREMENT,
    Kategori_Barang VARCHAR(50) NOT NULL
);

ALTER TABLE pegawai DROP COLUMN Jabatan;

INSERT INTO kategoribarang (Kategori_Barang) VALUES
('Sembako'),
('Alat kebersihan'),
('Alat tulis'),
('Elektronik');

CREATE TABLE jabpegawai (
    ID_Jabatan INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Jabatan VARCHAR(50) NOT NULL
);
INSERT INTO jabpegawai (Nama_Jabatan) VALUES
('Manager Gudang'),
('Staff Gudang'),
('Pengemas Barang'),
('Buruh Umum');

CREATE TABLE kota (
    ID_Kota INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Kota VARCHAR(50) NOT NULL
);
INSERT INTO kota (Nama_Kota) VALUES
('Gresik'),
('Lamongan'),
('Pasuruan');

DROP VIEW jabatanpegawai;

CREATE VIEW total AS
SELECT SUM(Jumlah_Terima), YEAR (Tanggal_Penerimaan) FROM penerimaan
WHERE YEAR (Tanggal_Penerimaan) = '2024';
SELECT * FROM total;

DROP VIEW total;
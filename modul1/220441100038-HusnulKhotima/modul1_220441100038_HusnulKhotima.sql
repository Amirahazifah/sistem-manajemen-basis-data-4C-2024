CREATE DATABASE ekspedisi;
---membuat table customer---
CREATE TABLE Customer (
    CustomerID INT (20) PRIMARY KEY,
    NamaCustomer VARCHAR(100) NOT NULL,
    Alamat VARCHAR(255) NOT NULL,
    Kota VARCHAR(100) NOT NULL,
    Telp VARCHAR(20) NOT NULL
);
---membuat table karyawan---
CREATE TABLE Karyawan (
    KaryawanID INT PRIMARY KEY,
    NamaKaryawan VARCHAR(100) NOT NULL,
    posisi VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);
---membuat table pengiriman---
CREATE TABLE pengiriman (
    PengirimanID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    KaryawanID INT NOT NULL,
    TanggalPengiriman DATE NOT NULL,
    TotalBerat DECIMAL(10,2) NOT NULL,
    TotalBiaya DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
    FOREIGN KEY (KaryawanID) REFERENCES karyawan(KaryawanID)
);
---membuat table detaipengiriman---
CREATE TABLE detailpengiriman (
    DetailPengirimanID INT PRIMARY KEY,
    PengirimanID INT,
    NamaProduk VARCHAR(100),
    Kuantitas INT,
    HargaSatuan DECIMAL(10,2),
    FOREIGN KEY (PengirimanID) REFERENCES pengiriman(PengirimanID)
); 
---membuat table cproduk---
CREATE TABLE produk (
    ProdukID INT PRIMARY KEY,
    NamaProduk VARCHAR(100),
    DESCRIPTION TEXT,
    TotalBerat DECIMAL(10,2) ,
    HargaSatuan DECIMAL(10,2) 
);

---- insert ke tabel customer----
INSERT INTO Customer (CustomerID, NamaCustomer, Alamat, Kota, Telp) VALUES
(1, 'PT ABC', 'Jl. Merdeka No. 123', 'Jakarta', '081234567890'),
(2, 'PT XYZ', 'Jl. Gatot Subroto No. 456', 'Surabaya', '082345678901'),
(3, 'CV Jaya', 'Jl. Diponegoro No. 789', 'Bandung', '083456789012'),
(4, 'UD Makmur', 'Jl. Asia No. 321', 'Semarang', '084567890123'),
(5, 'PT Sentosa', 'Jl. Cendrawasih No. 654', 'Yogyakarta', '085678901234'),
(6, 'PT BCD', 'Jl. Indah No. 234', 'Bali', '082654889123'),
(7, 'PT EFG', 'Jl. Gatot Kaca No. 456', 'Banyuangi', '081560784523'),
(8, 'CV Banyu', 'Jl. Bogor No. 554', 'Medan', '082346287397'),
(9, 'UD Bahagia', 'Jl. Pahlawan No. 889', 'Malang', '081816952580'),
(10, 'PT Smile', 'Jl. Bahagia No. 112', 'Sidoarjo', '085665878863'),
(11, 'PT HIJ', 'Jl. Trunojoyo No. 111', 'Madura', '085334786528'),
(12, 'PT KLM', 'Jl. Garuda No. 212', 'Jember', '085853978881'),
(13, 'CV Maju', 'Jl. Probolinggo No. 777', 'Probolinggo', '083766785388'),
(14, 'UD Mundur', 'Jl. Batu No. 901', 'Madiun', '084335758885'),
(15, 'PT Warna', 'Jl. Tandus No. 731', 'Tegal', '082233346997'),
(16, 'PT OPQ', 'Jl. Madura No. 590', 'Jambi', '088357233455'),
(17, 'PT RST', 'Jl. Sudirman No. 875', 'Solo', '081864777779'),
(18, 'CV BAGA', 'Jl. Patokan No. 901', 'Kalimantan', '085976833336'),
(19, 'UD BIMA', 'Jl. Bundaran No. 690', 'Nganjuk', '083444552225'),
(20, 'PT MANDIRI', 'Jl. Banyuangi No. 313', 'Gersik', '088896437658');

---insert ke tabel karyawan-----
INSERT INTO Karyawan (KaryawanID, NamaKaryawan, posisi, Department, Email) VALUES
(101, 'John Doe', 'Manager', 'Operations', 'john.doe@gmail.com'),
(102, 'Jane Smith', 'Supervisor', 'Logistics', 'jane.smith@gmail.com'),
(103, 'Michael Johnson', 'Staff', 'Warehouse', 'michael.johnson@gmail.com'),
(104, 'Emily Brown', 'Staff', 'Administration', 'emily.brown@gmail.com'),
(105, 'David Lee', 'Driver', 'Transportation', 'david.lee@gmail.com'),
(106, 'Sarah Wong', 'Supervisor', 'Operations', 'sarah.wong@gmail.com'),
(107, 'James Wilson', 'Staff', 'Logistics', 'james.wilson@gmail.com'),
(108, 'Michelle Garcia', 'Staff', 'Warehouse', 'michelle.garcia@gmail.com'),
(109, 'Daniel Martinez', 'Driver', 'Transportation', 'daniel.martinez@gmail.com'),
(110, 'Olivia Taylor', 'Staff', 'Administration', 'olivia.taylor@gmail.com'),
(111, 'Risya Kuma', 'Manager', 'Operations', 'risya.kuma@gmail.com'),
(112, 'Khair Bust', 'Supervisor', 'Logistics', 'khair.bust@gmail.com'),
(113, 'Rinda Bayu', 'Staff', 'Warehouse', 'rindra.bayu@gmail.com'),
(114, 'Meysa Syur', 'Staff', 'Administration', 'Meysa.sur@gmail.com'),
(115, 'Gio Rion', 'Driver', 'Transportation', 'gio.rion@gmail.com'),
(116, 'Jamsi Fath', 'Manager', 'Operations', 'jamsi.fath@gmail.com'),
(117, 'Husnul Khotimah', 'Supervisor', 'Logistics', 'husnul.khotimah@gmail.com'),
(118, 'Farzian Misi', 'Staff', 'Warehouse', 'farzian.misi@gmail.com'),
(119, 'Bara Zhoro', 'Staff', 'Administration', 'bara.zhoro@gmail.com'),
(120, 'Hiska Jumi', 'Driver', 'Transportation', 'hiska.jumi@gmail.com');

--- insert ke tabel pengiriman—
INSERT INTO pengiriman (PengirimanID, CustomerID, KaryawanID, TanggalPengiriman, TotalBerat, TotalBiaya) VALUES
(1001, 1, 101, '2024-03-01', 500.00, 1500000.00),
(1002, 2, 102, '2024-03-05', 300.00, 900000.00),
(1003, 3, 103, '2024-03-10', 700.00, 2100000.00),
(1004, 4, 104, '2024-03-15', 400.00, 1200000.00),
(1005, 5, 105, '2024-03-20', 600.00, 1800000.00),
(1006, 6, 106, '2024-03-11', 800.00, 1000000.00),
(1007, 7, 107, '2024-03-25', 700.00, 900000.00),
(1008, 8, 108, '2024-03-30', 200.00, 2100000.00),
(1009, 9, 109, '2024-03-27', 100.00, 1200000.00),
(1010, 10, 110, '2024-03-12', 500.00, 1800000.00),
(1011, 11, 111, '2024-03-08', 500.00, 1500000.00),
(1012, 12, 112, '2024-03-06', 900.00, 900000.00),
(1013, 13, 113, '2024-03-29', 700.00, 2100000.00),
(1014, 14, 114, '2024-03-13', 300.00, 1200000.00),
(1015, 15, 115, '2024-03-22', 600.00, 1800000.00),
(1016, 16, 116, '2024-03-21', 200.00, 1500000.00),
(1017, 17, 117, '2024-03-17', 300.00, 900000.00),
(1018, 18, 118, '2024-03-14', 800.00, 2100000.00),
(1019, 19, 119, '2024-03-19', 400.00, 1200000.00),
(1020, 20, 120, '2024-03-02', 600.00, 1800000.00);

--insert ke detail pengiriman----
INSERT INTO detailpengiriman (DetailPengirimanID, pengirimanID, NamaProduk, Kuantitas, HargaSatuan) VALUES
(2001, 1001, 'Box', 100, 5000.00, 1),
(2002, 1001, 'Pallet', 20, 15000.00, 5),
(2003, 1002, 'Crate', 50, 8000.00, 2),
(2004, 1003, 'Barrel', 70, 30000.00, 3),
(2005, 1004, 'Drum', 40, 10000.00, 4),
(2006, 1005, 'Bag', 60, 12000.00, 21),
(2007, 1006, 'Baju', 100, 5000.00, 22),
(2008, 1007, 'Skincare', 20, 15000.00, 23),
(2009, 1008, 'Snack', 50, 8000.00, 24),
(2010, 1009, 'Minuman', 70, 30000.00, 25),
(2011, 1010, 'Handpone', 40, 10000.00, 26),
(2012, 1012, 'Permen', 100, 5000.00, 28),
(2013, 1013, 'Rak', 20, 15000.00, 29);

---insert tabel produk---
INSERT INTO produk (ProdukID, NamaProduk, DESCRIPTION, TotalBerat, HargaSatuan) VALUES
(1, 'Box', 'Standard cardboard box', 2.5, 5000.00),
(2, 'Crate', 'Wooden crate for fragile items', 5.0, 8000.00),
(3, 'Barrel', 'Steel barrel for liquids', 20.0, 30000.00),
(4, 'Drum', 'Plastic drum for chemicals', 15.0, 10000.00),
(5, 'Pallet', 'Wooden pallet for bulk items', 30.0, 15000.00),
(6, 'Bublewrap', 'gulungan bublewrap yang dikirim per bulan kepada pelanggan', 2.5, 5000.00),
(7, 'Kantong Bublewrap', 'bublewrap berukuran kecil yang dikirim per bulan untuk pengiriman kecil', 5.0, 8000.00),
(8, 'Tong Baja farmasi', 'tong baja berisi bahan baku farmasi yang dikirim per bulan', 20.0, 30000.00),
(9, 'Drum organik', 'drum plastik berisi pelarut organik yang dikirim per hari', 25.0, 30000.00),
(10, 'Pallet biji bijian', 'palet kayu yang digunakan per hari untuk mengangkut biji-bijian', 30.0, 15000.00),
(11, 'Box', 'Berat cardboard box', 2.5, 5000.00),
(12, 'Bublewrap jangka panjang', 'mengemas barang-barang yang akan disimpan dalam penyimpanan jangka panjang', 5.0, 8000.00),
(13, 'Tong Baja minuman', 'berisi bahan baku untuk minuman beralkohol yang dikirim per hari', 20.0, 30000.00),
(14, 'Drum perhari', 'drum plastik berisi pewarna kimia yang dikirim per hari', 30.0, 20000.00),
(15, 'Pallet kerikil', ' palet kayu yang dikirim per minggu untuk transportasi pasir dan kerikil', 30.0, 15000.00),
(16, 'Box', 'Medium cardboard box', 2.5, 5000.00),
(17, 'Bublewrapkerajinan', 'bublewrap yang digunakan per minggu untuk mengemas barang-barang seni dan kerajinan', 5.0, 8000.00),
(18, 'Tong Baja cat', ' berisi cat atau tinta yang dikirim per hari', 20.0, 30000.00),
(19, 'Drum kertas', 'drum plastik berisi bahan kimia untuk pembuatan kertas yang dikirim per minggu', 215.0, 10000.00),
(20, 'Pallet pertanian', 'palet kayu yang dikirim per bulan untuk mengemas pupuk pertanian.', 30.0, 15000.00),
(22, 'Bag', 'Standart', 2.50, 5000.00),
(22, 'Baju', 'Ringan', 2.0, 5000.00),
(23, 'Skincare', 'Standart', 1.5, 5000.00),
(24, 'Snack', 'Ringan', 2.5, 5000.00),
(25, 'Minuman', 'Standart', 2.5, 5000.00),
(26, 'Handpone', 'ringan', 2.5, 5000.00),
(27, 'Sendal', 'Standart', 2.5, 5000.00),
(28, 'Permen', 'Ringan', 1.0, 5000.00),
(29, 'Rak', 'Berat', 3.5, 5000.00),
(30, 'Tisu', 'Ringan', 1.5, 5000.00);




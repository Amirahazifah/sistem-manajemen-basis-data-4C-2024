-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Mar 2024 pada 14.38
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detailpenjualan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detailpenjualan` (
`Id_Penjualan` int(20)
,`Tgl_Penjualan` date
,`Nama_Pelanggan` varchar(50)
,`Nama_Obat` varchar(70)
,`Harga_Obat` int(20)
,`Total_Harga` int(20)
,`Nominal_Pembayaran` int(20)
,`Kembalian` int(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detailresep`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detailresep` (
`Id_Resep` int(20)
,`Nama_Pelanggan` varchar(50)
,`Nama_Dokter` varchar(30)
,`Nama_Obat` varchar(70)
,`Tgl_Resep` date
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `Id_Dokter` int(20) NOT NULL,
  `Nama_Dokter` varchar(30) DEFAULT NULL,
  `Spesialisasi` varchar(50) DEFAULT NULL,
  `No_Telp_Dokter` varchar(20) DEFAULT NULL,
  `Rumah_Sakit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`Id_Dokter`, `Nama_Dokter`, `Spesialisasi`, `No_Telp_Dokter`, `Rumah_Sakit`) VALUES
(1, 'Dr. Ahmad Surya', 'Bedah Umum', '081234567891', 'RS Sentosa'),
(2, 'Dr. Maya Wijaya', 'Bedah Umum', '081234567899', 'RS Trunojoyo'),
(3, 'Dr. Budi Santoso', 'Anak', '081234567898', 'RS Cita Hati'),
(4, 'Dr. Citra Pertiwi', 'Kulit', '081234567897', 'RS Jiwa Sejahtera'),
(5, 'Dr. Farhan Ibrahim', 'Mata', '081234567896', 'RS Kesehatan Mulia'),
(6, 'Dr. Liana Setiawan', 'Gigi', '081234567895', 'RS Medika Sentral'),
(7, 'Dr. Anna Susanto', 'Jantnug', '081234567894', 'RS Puri Medika'),
(8, 'Dr. Tono Wibowo', 'Saraf', '081234567893', 'RS Bunda'),
(9, 'Dr. Anita Permana', 'THT', '081234567892', 'RS Harapan Sejahtera'),
(10, 'Dr. Joko Susilo', 'Psikiatri', '081234567890', 'RS Jaya'),
(11, 'Dr. Ida Ayu Putri', 'Bedah Umum', '08123456780', 'RS Bersinar'),
(12, 'Dr. Ahmad Rizky Ramadhan', 'Kardiologi', '081345678901', 'RS Ceria'),
(13, 'Dr. Budi Wijaya', 'Kardiologi', '081345678912', 'RS Cerdas'),
(14, 'Dr. Citra Lestari', 'Anestesiologi', '082123456789', 'RS Damai'),
(15, 'Dr. Dian Kartika', 'Ginekologi', '082234567890', 'RS Pusat Pertamina'),
(16, 'Dr. Eka Putra', 'Ortopedi', ' 083123456789', 'RS Sardjito'),
(17, 'Dr. Faisal Rahman', 'Bedah Umum', '083234567890', 'RSUP Dr. Hasan Sadikin'),
(18, 'Dr. Gita Pratiwi', 'Bedah Umum', '081234567890', 'RS Pondok Indah'),
(19, 'Dr. Hendra Tan', 'Bedah Umum', '082123456789', 'RS Siloam Semanggi'),
(20, 'Dr. Indah Lestari', 'Endokrinologi', '082234567891', 'RS Premier Bintaro'),
(21, 'Dr. Dina Kusuma', 'Anestesiologi', '081234567891', 'RS Amanah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_penjualan`
--

CREATE TABLE `laporan_penjualan` (
  `Id_Laporan` int(20) NOT NULL,
  `Id_Penjualan` int(20) DEFAULT NULL,
  `Id_Obat` int(20) NOT NULL,
  `Jumlah` int(15) NOT NULL,
  `Total_penjualan` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan_penjualan`
--

INSERT INTO `laporan_penjualan` (`Id_Laporan`, `Id_Penjualan`, `Id_Obat`, `Jumlah`, `Total_penjualan`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 1, 1),
(3, 3, 3, 1, 1),
(4, 4, 4, 1, 1),
(5, 5, 5, 1, 1),
(6, 6, 6, 1, 1),
(7, 7, 7, 1, 1),
(8, 8, 8, 1, 1),
(9, 9, 9, 1, 1),
(10, 10, 10, 1, 1),
(11, 11, 6, 1, 1),
(12, 12, 12, 1, 1),
(13, 13, 13, 1, 1),
(14, 14, 14, 1, 1),
(15, 15, 15, 1, 1),
(16, 16, 16, 1, 1),
(17, 17, 17, 1, 1),
(18, 18, 18, 1, 1),
(19, 19, 19, 1, 1),
(20, 20, 20, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `Id_Obat` int(20) NOT NULL,
  `id_Supplier` int(20) NOT NULL,
  `Nama_Obat` varchar(70) DEFAULT NULL,
  `Jenis_Obat` varchar(30) DEFAULT NULL,
  `Harga_Obat` int(20) DEFAULT NULL,
  `Jumlah_Obat` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`Id_Obat`, `id_Supplier`, `Nama_Obat`, `Jenis_Obat`, `Harga_Obat`, `Jumlah_Obat`) VALUES
(1, 2, 'Paracetamol', 'Obat Sakit Kepala', 5000, 20),
(2, 1, 'Amoxicillin', 'Antibiotik', 6000, 10),
(3, 6, 'Ibuprofen', 'Antiinflamasi', 7000, 30),
(4, 9, 'Cetirizine', 'Antihistamin', 8000, 25),
(5, 7, 'Omeprazole', 'Antasida', 9000, 15),
(6, 10, 'Diphenhydramine', 'Antihistamin', 9500, 21),
(7, 5, 'Simvastatin', 'Obat Penurun Kolesterol', 12000, 45),
(8, 4, 'Metformin', 'Obat Diabetes', 4500, 10),
(9, 3, 'Losartan', 'Obat Tekanan Darah Tinggi', 6000, 20),
(10, 8, 'Metamizole', 'Analgesik', 9500, 15),
(11, 1, 'Simvastatin', 'Antilipidemik', 8500, 15),
(12, 7, 'Prednisone', 'Steroid', 8000, 10),
(13, 8, 'Loratadine', 'Antihistamin', 6500, 15),
(14, 10, 'Cefixime', 'Antibiotik', 10500, 10),
(15, 9, 'Metronidazole', 'Antibiotik', 9500, 20),
(16, 3, 'Salbutamol', 'Bronkodilator', 7500, 15),
(17, 10, 'Losartan', 'Antipertensi', 9000, 20),
(18, 9, 'Atenolol', 'Antipertensi', 8500, 15),
(19, 9, 'Ciprofloxacin', 'Antibiotik', 15000, 15),
(20, 10, 'Tramadol', 'Analgesik', 8000, 15),
(21, 9, 'Oskadon', 'Obat Sakit Kepala', 6000, 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `Id_Pelanggan` int(20) NOT NULL,
  `Nama_Pelanggan` varchar(50) DEFAULT NULL,
  `No_Telp_Pelanggan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`Id_Pelanggan`, `Nama_Pelanggan`, `No_Telp_Pelanggan`) VALUES
(1, 'Rania Putri', '081234561234'),
(2, 'Aluna Zahra', '081234568765'),
(3, 'Michael Johnson', '081234560987'),
(4, 'Ethan Pratama', '081234564321'),
(5, 'Rayhan Aditya', '081234569876'),
(6, 'Kirana Devi', '081234562345'),
(7, 'Haiqall Purnama', '081234563210'),
(8, 'Edo Laksamana', '081234567890'),
(9, 'Rahman Adi Putra', '081234565432'),
(10, 'Rafa Kusuma', '081234567123'),
(11, 'Dewi Lestari', '082234567890'),
(12, 'Ahmad Yani', '081234567666'),
(13, 'Siti Nurjanah', '083345678901'),
(14, 'Bambang Suryadi', '084456789012'),
(15, 'Retno Wulandari', '085567890123'),
(16, 'Rudi Hartono', '086678901234'),
(17, 'Nana Susanti', '088890123456'),
(18, 'Iwan Setiawan', '087789012345'),
(19, 'Ratna Sari', '089901234567'),
(20, 'Dedi Kurniawan', '081012345678');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `Id_Penjualan` int(20) NOT NULL,
  `Id_Pelanggan` int(20) DEFAULT NULL,
  `Tgl_Penjualan` date DEFAULT NULL,
  `Total_Harga` int(20) DEFAULT NULL,
  `Nominal_Pembayaran` int(20) DEFAULT NULL,
  `Kembalian` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`Id_Penjualan`, `Id_Pelanggan`, `Tgl_Penjualan`, `Total_Harga`, `Nominal_Pembayaran`, `Kembalian`) VALUES
(1, 1, '2024-03-24', 5000, 10000, 5000),
(2, 2, '2024-03-21', 6000, 10000, 4000),
(3, 3, '2024-03-23', 7000, 1000, 3000),
(4, 4, '2024-03-24', 8000, 10000, 2000),
(5, 5, '2024-03-29', 9000, 9000, 0),
(6, 6, '2024-03-30', 9500, 10000, 500),
(7, 7, '2024-03-04', 12000, 10000, 2000),
(8, 8, '2024-03-20', 4500, 5000, 500),
(9, 9, '2024-03-13', 6000, 10000, 4000),
(10, 10, '2024-03-31', 9500, 10000, 500),
(11, 3, '2024-04-01', 9500, 10000, 500),
(12, 12, '2024-04-02', 8000, 10000, 2000),
(13, 13, '2024-04-02', 6500, 10000, 3500),
(14, 14, '2024-04-02', 10500, 10500, 0),
(15, 15, '2024-04-03', 9500, 10000, 500),
(16, 16, '2024-04-11', 7500, 10000, 2500),
(17, 17, '2024-04-11', 9000, 9000, 0),
(18, 18, '2024-04-11', 8500, 9000, 500),
(19, 19, '2024-04-12', 15000, 15000, 0),
(20, 20, '2024-04-12', 8000, 10000, 2000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

CREATE TABLE `resep` (
  `Id_Resep` int(20) NOT NULL,
  `Id_Dokter` int(20) NOT NULL,
  `Id_Pelanggan` int(20) NOT NULL,
  `Id_Obat` int(20) NOT NULL,
  `Tgl_Resep` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `resep`
--

INSERT INTO `resep` (`Id_Resep`, `Id_Dokter`, `Id_Pelanggan`, `Id_Obat`, `Tgl_Resep`) VALUES
(1, 1, 1, 1, '2024-03-24'),
(2, 2, 2, 2, '2024-03-21'),
(3, 3, 3, 3, '2024-03-23'),
(4, 4, 4, 4, '2024-03-24'),
(5, 5, 5, 5, '2024-03-29'),
(6, 6, 6, 6, '2024-03-30'),
(7, 7, 7, 7, '2024-03-04'),
(8, 8, 8, 8, '2024-03-20'),
(9, 9, 9, 9, '2024-03-12'),
(10, 10, 10, 10, '2024-03-31'),
(11, 9, 3, 6, '2024-04-01'),
(12, 12, 12, 12, '2024-04-02'),
(13, 13, 13, 13, '2024-04-02'),
(14, 14, 14, 14, '2024-04-02'),
(15, 15, 15, 15, '2024-04-03'),
(16, 16, 16, 16, '2024-04-11'),
(17, 17, 17, 17, '2024-04-11'),
(18, 18, 18, 18, '2024-04-11'),
(19, 19, 19, 19, '2024-04-12'),
(20, 20, 20, 20, '2024-04-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `Id_Supplier` int(20) NOT NULL,
  `Nama_Supplier` varchar(50) DEFAULT NULL,
  `Alamat_Supplier` varchar(255) DEFAULT NULL,
  `No_Telp_Supplier` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`Id_Supplier`, `Nama_Supplier`, `Alamat_Supplier`, `No_Telp_Supplier`) VALUES
(1, 'PT Sejahtera Farmasi', 'Jl. Kesehatan No. 10, Jakarta', '087788990011'),
(2, 'CV Sehat Abadi', 'Jl. Sejahtera No. 20, Surabaya', '08123238742'),
(3, 'PT Kesehatan Utama', 'Jl. Kesejahteraan No. 30, Bandung', '081234567893'),
(4, 'CV Sentosa Medika', 'Jl. Harmoni No. 40, Medan', '081234567894'),
(5, 'PT Sejahtera Medika', 'Jl. Kesejahteraan No. 50, Semarang', '081234567895'),
(6, 'CV Sehat Bersama', 'Jl. Bahagia No. 60, Bali', '081234567896'),
(7, 'PT Kesehatan Mulia', 'Jl. Mulia No. 70, Makassar', '081234567897'),
(8, 'CV Sentosa Abadi', 'Jl. Abadi No. 80, Pontianak', '081234567898'),
(9, 'PT Sejahtera Bersama', 'Jl. Harmonis No. 90, Palembang', '081234567899'),
(10, 'CV Kesehatan Sejahtera', 'Jl. Sejahtera No. 100, Yogyakarta', '081234567890'),
(11, 'PT Tawa Sehat Abadi', 'Jl. Ceria No. 123, Jakarta', '0812345678912'),
(12, 'CV Senyum Bahagia Jaya', 'Jl. Riang Ria No. 456, Bandung', '082345678912'),
(13, 'PT Suka Duka Mandiri', 'Jl. Gembira No. 789, Surabaya', '083456789123'),
(14, 'CV Wajah Ceria Sentosa', 'Jl. Kebahagiaan No. 101, Medan', '084567891234'),
(15, 'PT Geli Gelisah', 'Jl. Bahagia Indah No. 202, Makassar', '085678912345'),
(16, 'CV Cerita Lucu Berhadiah', 'Jl. Ketawa Damai No. 303, Semarang', '086789123456'),
(17, 'CV Sehat Hati', 'Jl. Riuh Meriah No. 404, Yogyakarta', '087891234567'),
(18, 'PT Heboh Hebat', 'Jl. Riuh Meriah No. 404, Yogyakarta', '088912345678'),
(19, 'PT Jaya Bahagia', 'Jl. Rasa Kocak No. 505, Bali', '089123456789'),
(20, 'CV Sehat Kan', 'Jl. Gelak Guling No. 606, Palembang', '081234567890');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `up_dokter`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `up_dokter` (
`Id_Dokter` int(20)
,`Nama_Dokter` varchar(30)
,`Spesialisasi` varchar(50)
,`No_Telp_Dokter` varchar(20)
,`Rumah_Sakit` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `up_supplier`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `up_supplier` (
`Id_Supplier` int(20)
,`Nama_Supplier` varchar(50)
,`Alamat_Supplier` varchar(255)
,`No_Telp_Supplier` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `detailpenjualan`
--
DROP TABLE IF EXISTS `detailpenjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detailpenjualan`  AS SELECT `pj`.`Id_Penjualan` AS `Id_Penjualan`, `pj`.`Tgl_Penjualan` AS `Tgl_Penjualan`, `pl`.`Nama_Pelanggan` AS `Nama_Pelanggan`, `ob`.`Nama_Obat` AS `Nama_Obat`, `ob`.`Harga_Obat` AS `Harga_Obat`, `pj`.`Total_Harga` AS `Total_Harga`, `pj`.`Nominal_Pembayaran` AS `Nominal_Pembayaran`, `pj`.`Kembalian` AS `Kembalian` FROM (((`penjualan` `pj` join `pelanggan` `pl` on(`pj`.`Id_Pelanggan` = `pl`.`Id_Pelanggan`)) join `laporan_penjualan` `lp` on(`pj`.`Id_Penjualan` = `lp`.`Id_Penjualan`)) join `obat` `ob` on(`lp`.`Id_Obat` = `ob`.`Id_Obat`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detailresep`
--
DROP TABLE IF EXISTS `detailresep`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detailresep`  AS SELECT `p`.`Id_Resep` AS `Id_Resep`, `pl`.`Nama_Pelanggan` AS `Nama_Pelanggan`, `d`.`Nama_Dokter` AS `Nama_Dokter`, `o`.`Nama_Obat` AS `Nama_Obat`, `p`.`Tgl_Resep` AS `Tgl_Resep` FROM (((`resep` `p` join `dokter` `d` on(`p`.`Id_Dokter` = `d`.`Id_Dokter`)) join `pelanggan` `pl` on(`p`.`Id_Pelanggan` = `pl`.`Id_Pelanggan`)) join `obat` `o` on(`p`.`Id_Obat` = `o`.`Id_Obat`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `up_dokter`
--
DROP TABLE IF EXISTS `up_dokter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `up_dokter`  AS SELECT `dokter`.`Id_Dokter` AS `Id_Dokter`, `dokter`.`Nama_Dokter` AS `Nama_Dokter`, `dokter`.`Spesialisasi` AS `Spesialisasi`, `dokter`.`No_Telp_Dokter` AS `No_Telp_Dokter`, `dokter`.`Rumah_Sakit` AS `Rumah_Sakit` FROM `dokter``dokter`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `up_supplier`
--
DROP TABLE IF EXISTS `up_supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `up_supplier`  AS SELECT `supplier`.`Id_Supplier` AS `Id_Supplier`, `supplier`.`Nama_Supplier` AS `Nama_Supplier`, `supplier`.`Alamat_Supplier` AS `Alamat_Supplier`, `supplier`.`No_Telp_Supplier` AS `No_Telp_Supplier` FROM `supplier``supplier`  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`Id_Dokter`);

--
-- Indeks untuk tabel `laporan_penjualan`
--
ALTER TABLE `laporan_penjualan`
  ADD PRIMARY KEY (`Id_Laporan`),
  ADD KEY `Id_Penjualan` (`Id_Penjualan`),
  ADD KEY `Id_Obat` (`Id_Obat`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`Id_Obat`),
  ADD KEY `id_Supplier` (`id_Supplier`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`Id_Pelanggan`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`Id_Penjualan`),
  ADD KEY `Id_Pelanggan` (`Id_Pelanggan`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`Id_Resep`),
  ADD KEY `Id_Dokter` (`Id_Dokter`),
  ADD KEY `Id_Obat` (`Id_Obat`),
  ADD KEY `Id_Pelanggan` (`Id_Pelanggan`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id_Supplier`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan_penjualan`
--
ALTER TABLE `laporan_penjualan`
  ADD CONSTRAINT `id_penjualan` FOREIGN KEY (`Id_Penjualan`) REFERENCES `penjualan` (`Id_Penjualan`),
  ADD CONSTRAINT `obatt` FOREIGN KEY (`Id_Obat`) REFERENCES `obat` (`Id_Obat`);

--
-- Ketidakleluasaan untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `id_supplier` FOREIGN KEY (`id_Supplier`) REFERENCES `supplier` (`Id_Supplier`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `id_pelanggan` FOREIGN KEY (`Id_Pelanggan`) REFERENCES `pelanggan` (`Id_Pelanggan`);

--
-- Ketidakleluasaan untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `Id_Dokter` FOREIGN KEY (`Id_Dokter`) REFERENCES `dokter` (`Id_Dokter`),
  ADD CONSTRAINT `Id_Obat` FOREIGN KEY (`Id_Obat`) REFERENCES `obat` (`Id_Obat`),
  ADD CONSTRAINT `pelanggan` FOREIGN KEY (`Id_Pelanggan`) REFERENCES `pelanggan` (`Id_Pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

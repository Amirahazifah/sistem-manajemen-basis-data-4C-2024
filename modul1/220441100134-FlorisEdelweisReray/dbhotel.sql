-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2024 pada 17.50
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
-- Database: `dbhotel`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `datatamu`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `datatamu` (
`Id_Tamu` int(20)
,`Alamat` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `datatransaksi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `datatransaksi` (
`Id_Transaksi` int(20)
,`Metode_Pembayaran` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `Id_Fasilitas` int(20) NOT NULL,
  `Nama_Fasilitas` varchar(50) NOT NULL,
  `Harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`Id_Fasilitas`, `Nama_Fasilitas`, `Harga`) VALUES
(1, 'Sarapan', 60000),
(2, 'Makan Siang', 60000),
(3, 'Makan Malam', 60000),
(4, 'Kolam Renang', 150000),
(5, 'Laundry', 25000),
(6, 'Spa', 300000),
(7, 'Gym', 50000),
(8, 'Kasur Tambahan', 350000),
(9, 'Bantal Tambahan', 50000),
(10, 'Ranjang Bayi', 150000),
(11, 'Ruang Rapat', 500000),
(12, 'Playground', 100000),
(13, 'Antar Jemput Bandara', 100000),
(14, 'Layanan Concierge', 50000),
(15, 'Adaptor Tambahan', 25000),
(16, 'Morning Call', 25000),
(17, 'Water Sport', 100000),
(18, 'Sauna', 100000),
(19, 'Pijat Refleksi', 300000),
(20, 'Time Zone', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `Id_Kamar` int(20) NOT NULL,
  `Nomor_Kamar` varchar(20) NOT NULL,
  `Tipe_Kamar` varchar(30) NOT NULL,
  `Harga_Malam` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`Id_Kamar`, `Nomor_Kamar`, `Tipe_Kamar`, `Harga_Malam`) VALUES
(1, '01', 'Standard Room', 670000),
(2, '02', 'Standard Room', 670000),
(3, '03', 'Standard Room', 670000),
(4, '04', 'Standard Room', 670000),
(5, '05', 'Standard Room', 670000),
(6, '06', 'Superior Room', 787000),
(7, '07', 'Superior Room', 787000),
(8, '08', 'Superior Room', 787000),
(9, '09', 'Superior Room', 787000),
(10, '10', 'Superior Room', 787000),
(11, '11', 'Deluxe Room', 926500),
(12, '12', 'Deluxe Room', 926500),
(13, '13', 'Deluxe Room', 926500),
(14, '14', 'Deluxe Room', 926500),
(15, '15', 'Deluxe Room', 926500),
(16, '16', 'Junior Suite Room', 1140000),
(17, '17', 'Junior Suite Room', 1140000),
(18, '18', 'Junior Suite Room', 1140000),
(19, '19', 'Junior Suite Room', 1140000),
(20, '20', 'Junior Suite Room', 1140000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `Id_Pemesanan` int(20) NOT NULL,
  `Id_Tamu` int(20) NOT NULL,
  `Id_Kamar` int(20) NOT NULL,
  `Id_Fasilitas` int(20) NOT NULL,
  `Tanggal_Checkin` date NOT NULL,
  `Tanggal_Checkout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`Id_Pemesanan`, `Id_Tamu`, `Id_Kamar`, `Id_Fasilitas`, `Tanggal_Checkin`, `Tanggal_Checkout`) VALUES
(1, 1, 1, 1, '2024-01-22', '2024-01-23'),
(2, 2, 2, 2, '2024-01-27', '2024-01-28'),
(3, 3, 3, 3, '2024-01-30', '2024-01-31'),
(4, 4, 4, 4, '2024-02-03', '2024-02-04'),
(5, 5, 5, 5, '2024-02-05', '2024-02-06'),
(6, 6, 6, 6, '2024-02-07', '2024-02-08'),
(7, 7, 7, 7, '2024-02-10', '2024-02-11'),
(8, 8, 8, 8, '2024-02-13', '2024-02-14'),
(9, 9, 9, 9, '2024-02-15', '2024-02-16'),
(10, 10, 10, 10, '2024-02-17', '2024-02-18'),
(11, 11, 11, 11, '2024-02-17', '2024-02-18'),
(12, 12, 12, 12, '2024-02-17', '2024-03-18'),
(13, 13, 13, 13, '2024-02-19', '2024-02-20'),
(14, 14, 14, 14, '2024-02-19', '2024-02-20'),
(15, 15, 15, 15, '2024-03-23', '2024-03-24'),
(16, 16, 16, 16, '2024-02-28', '2024-02-29'),
(17, 17, 17, 17, '2024-03-02', '2024-03-03'),
(18, 18, 18, 18, '2024-03-09', '2024-03-10'),
(19, 19, 19, 19, '2024-03-16', '2024-03-17'),
(20, 20, 20, 20, '2024-03-23', '2024-03-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `Id_Tamu` int(20) NOT NULL,
  `Nama_Tamu` varchar(50) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Nomor_Telepon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tamu`
--

INSERT INTO `tamu` (`Id_Tamu`, `Nama_Tamu`, `Alamat`, `Nomor_Telepon`) VALUES
(1, 'Viola Dara Bunga', 'Jl. Ahmad Yani No. 55, Surabaya', '081335959586'),
(2, 'Bintang Galih Ramadani', 'Jl. Kenjeran No. 32, Surabaya', '087755158900'),
(3, 'Dina Lutfia', 'Jl. Munginsidi No. 99, Mojokerto', '081456876756'),
(4, 'Esti Nur Fadila', 'Jl. Kartini No. 37, Jombang', '089945327861'),
(5, 'Putri Bilqis', 'Jl. Kapasan No. 11, Surabaya', '085789457613'),
(6, 'Aldo Winaldy', 'Jl. Kedung Cowek No. 65, Surabaya', '087287497125'),
(7, 'Anggun Rima Andini', 'Jl. Untung Suropati No. 29, Gresik', '085487235414'),
(8, 'Nicholas Ferdi', 'Jl. Teuku Umar No. 71, Lamongan', '083065280936'),
(9, 'Aditia Febrino', 'Jl. Diponegoro No. 49, Sidoarjo', '086180923648'),
(10, 'Ega Saputra', 'Jl. Mastrip No. 23, Jakarta', '087625807429'),
(11, 'Ela Pertiwi', 'Jl. Rajekwesi No. 17, Gresik', '081053461420'),
(12, 'Bustomi Arda', 'Jl. Lontar No. 38, Semarang', '086432097651'),
(13, 'Felisha Ana', 'Jl. Pemuda No. 83, Tuban', '085123847651'),
(14, 'Fahmi Ariyanto', 'Jl. Basuki Rahmat No. 14, Malang', '085342785193'),
(15, 'Angelika Anggreini', 'Jl. Panglima Polim No. 03, Lamongan', '081652348764'),
(16, 'Dimas Ahmad', 'Jl. Hayam Wuruk No. 55, Sidoarjo', '083298634581'),
(17, 'Siti Aisyah', 'Jl. Veteran No. 10, Mojokerto', '087345198725'),
(18, 'Berliana Anggrek', 'Jl. Arjuno No. 31, Jember', '081523847562'),
(19, 'Reza Hariadin', 'Jl. Kupang No. 78, Bogor', '086519734870'),
(20, 'Rafli Ramdani', 'Jl. Darmo No. 94, Solo', '087236475619');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `Id_Transaksi` int(20) NOT NULL,
  `Id_Pemesanan` int(20) NOT NULL,
  `Total_Harga` int(20) NOT NULL,
  `Metode_Pembayaran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`Id_Transaksi`, `Id_Pemesanan`, `Total_Harga`, `Metode_Pembayaran`) VALUES
(1, 1, 730000, 'Tunai'),
(2, 2, 730000, 'Tunai'),
(3, 3, 730000, 'Tunai'),
(4, 4, 820000, 'Tunai'),
(5, 5, 695000, 'Tunai'),
(6, 6, 1087000, 'Tunai'),
(7, 7, 837000, 'Tunai'),
(8, 8, 1137000, 'Tunai'),
(9, 9, 837000, 'Tunai'),
(10, 10, 937000, 'Kartu Kredit'),
(11, 11, 1426500, 'Kartu Kredit'),
(12, 12, 1026500, 'Kartu Kredit'),
(13, 13, 1026500, 'Kartu Kredit'),
(14, 14, 976500, 'Kartu Kredit'),
(15, 15, 1165000, 'Kartu Kredit'),
(16, 16, 1165000, 'Kartu Kredit'),
(17, 17, 1240000, 'Kartu Kredit'),
(18, 18, 1240000, 'Kartu Kredit'),
(19, 19, 1440000, 'Kartu Kredit'),
(20, 20, 1240000, 'Kartu Kredit');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_kamar_pemesanan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_kamar_pemesanan` (
`ID_Kamar` int(20)
,`Nomor_Kamar` varchar(20)
,`Tipe_Kamar` varchar(30)
,`Harga_Malam` int(20)
,`ID_Pemesanan` int(20)
,`ID_Tamu` int(20)
,`Tanggal_Checkin` date
,`Tanggal_Checkout` date
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_tamu_info`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_tamu_info` (
`ID_Tamu` int(20)
,`Nama_Tamu` varchar(50)
,`Alamat` varchar(100)
,`Nomor_Telepon` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_tamu_pemesanan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_tamu_pemesanan` (
`ID_Tamu` int(20)
,`Nama_Tamu` varchar(50)
,`Alamat` varchar(100)
,`Nomor_Telepon` varchar(50)
,`ID_Pemesanan` int(20)
,`ID_Kamar` int(20)
,`Tanggal_Checkin` date
,`Tanggal_Checkout` date
);

-- --------------------------------------------------------

--
-- Struktur untuk view `datatamu`
--
DROP TABLE IF EXISTS `datatamu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `datatamu`  AS SELECT `tamu`.`Id_Tamu` AS `Id_Tamu`, `tamu`.`Alamat` AS `Alamat` FROM `tamu``tamu`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `datatransaksi`
--
DROP TABLE IF EXISTS `datatransaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `datatransaksi`  AS SELECT `transaksi`.`Id_Transaksi` AS `Id_Transaksi`, `transaksi`.`Metode_Pembayaran` AS `Metode_Pembayaran` FROM `transaksi``transaksi`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_kamar_pemesanan`
--
DROP TABLE IF EXISTS `view_kamar_pemesanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kamar_pemesanan`  AS SELECT `kamar`.`Id_Kamar` AS `ID_Kamar`, `kamar`.`Nomor_Kamar` AS `Nomor_Kamar`, `kamar`.`Tipe_Kamar` AS `Tipe_Kamar`, `kamar`.`Harga_Malam` AS `Harga_Malam`, `pemesanan`.`Id_Pemesanan` AS `ID_Pemesanan`, `pemesanan`.`Id_Tamu` AS `ID_Tamu`, `pemesanan`.`Tanggal_Checkin` AS `Tanggal_Checkin`, `pemesanan`.`Tanggal_Checkout` AS `Tanggal_Checkout` FROM (`kamar` join `pemesanan` on(`kamar`.`Id_Kamar` = `pemesanan`.`Id_Kamar`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_tamu_info`
--
DROP TABLE IF EXISTS `view_tamu_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tamu_info`  AS SELECT `tamu`.`Id_Tamu` AS `ID_Tamu`, `tamu`.`Nama_Tamu` AS `Nama_Tamu`, `tamu`.`Alamat` AS `Alamat`, `tamu`.`Nomor_Telepon` AS `Nomor_Telepon` FROM `tamu``tamu`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_tamu_pemesanan`
--
DROP TABLE IF EXISTS `view_tamu_pemesanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tamu_pemesanan`  AS SELECT `tamu`.`Id_Tamu` AS `ID_Tamu`, `tamu`.`Nama_Tamu` AS `Nama_Tamu`, `tamu`.`Alamat` AS `Alamat`, `tamu`.`Nomor_Telepon` AS `Nomor_Telepon`, `pemesanan`.`Id_Pemesanan` AS `ID_Pemesanan`, `pemesanan`.`Id_Kamar` AS `ID_Kamar`, `pemesanan`.`Tanggal_Checkin` AS `Tanggal_Checkin`, `pemesanan`.`Tanggal_Checkout` AS `Tanggal_Checkout` FROM (`tamu` join `pemesanan` on(`tamu`.`Id_Tamu` = `pemesanan`.`Id_Tamu`))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`Id_Fasilitas`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`Id_Kamar`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`Id_Pemesanan`),
  ADD KEY `Id_Tamu` (`Id_Tamu`),
  ADD KEY `Id_Kamar` (`Id_Kamar`),
  ADD KEY `Id_Fasilitas` (`Id_Fasilitas`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`Id_Tamu`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Id_Transaksi`),
  ADD KEY `Id_Pemesanan` (`Id_Pemesanan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `Id_Kamar` FOREIGN KEY (`Id_Kamar`) REFERENCES `kamar` (`Id_Kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`Id_Tamu`) REFERENCES `tamu` (`Id_Tamu`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`Id_Fasilitas`) REFERENCES `fasilitas` (`Id_Fasilitas`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Id_Pemesanan`) REFERENCES `pemesanan` (`Id_Pemesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

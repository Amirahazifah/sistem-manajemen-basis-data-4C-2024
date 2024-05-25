-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2024 at 12:54 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datakeretaapi`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `infokeretaview`
-- (See below for the actual view)
--
CREATE TABLE `infokeretaview` (
`id_kereta` int(11)
,`nama_kereta` varchar(50)
,`jenis_kereta` varchar(50)
,`kapasitas` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kereta`
--

CREATE TABLE `jadwal_kereta` (
  `id_jadwal` int(11) NOT NULL,
  `id_kereta` int(11) NOT NULL,
  `id_rute` int(11) NOT NULL,
  `waktu_berangkat` datetime(6) NOT NULL,
  `waktu_sampai` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_kereta`
--

INSERT INTO `jadwal_kereta` (`id_jadwal`, `id_kereta`, `id_rute`, `waktu_berangkat`, `waktu_sampai`) VALUES
(1, 1, 1, '2024-03-25 08:00:00.000000', '2024-03-25 10:00:00.000000'),
(2, 2, 2, '2024-03-06 09:00:00.000000', '2024-03-06 11:00:00.000000'),
(3, 3, 3, '2024-02-12 10:00:00.000000', '2024-02-12 12:00:00.000000'),
(4, 4, 4, '2024-02-15 13:00:00.000000', '2024-02-15 17:00:00.000000'),
(5, 5, 5, '2024-01-10 08:00:00.000000', '2024-01-10 11:00:00.000000'),
(6, 6, 6, '2024-01-21 11:00:00.000000', '2024-01-21 19:00:00.000000'),
(7, 7, 7, '2024-03-19 15:00:00.000000', '2024-03-19 18:00:00.000000'),
(8, 8, 8, '2024-01-04 14:00:00.000000', '2024-01-04 19:00:00.000000'),
(9, 9, 9, '2024-03-05 16:00:00.000000', '2024-03-25 16:45:00.000000'),
(10, 10, 10, '2024-02-08 18:00:00.000000', '2024-02-08 19:05:00.000000'),
(11, 11, 11, '2024-01-17 15:00:00.000000', '2024-01-17 23:30:00.000000'),
(12, 12, 12, '2024-01-25 12:00:00.000000', '2024-01-25 16:30:00.000000'),
(13, 13, 13, '2024-02-13 16:00:00.000000', '2024-02-13 22:10:00.000000'),
(14, 14, 14, '2024-03-22 19:00:00.000000', '2024-03-22 00:00:00.000000'),
(15, 15, 15, '2024-01-04 15:00:00.000000', '2024-03-25 18:30:00.000000'),
(16, 16, 16, '2024-02-14 11:00:00.000000', '2024-02-14 14:00:00.000000'),
(17, 17, 17, '2024-03-18 10:00:00.000000', '2024-03-18 19:12:00.000000'),
(18, 18, 18, '2024-02-20 20:20:00.000000', '2024-02-20 22:07:00.000000'),
(19, 19, 19, '2024-03-11 20:34:00.000000', '2024-03-11 00:18:00.000000'),
(20, 20, 20, '2024-01-30 21:21:00.000000', '2024-01-30 23:46:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--

CREATE TABLE `kereta` (
  `id_kereta` int(11) NOT NULL,
  `nama_kereta` varchar(50) NOT NULL,
  `jenis_kereta` varchar(50) NOT NULL,
  `kapasitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kereta`
--

INSERT INTO `kereta` (`id_kereta`, `nama_kereta`, `jenis_kereta`, `kapasitas`) VALUES
(1, 'Argo Bromo Anggrek', 'Eksekutif', 200),
(2, 'Gajayana', 'Bisnis', 150),
(3, 'Mutiara Timur', 'Ekonomi', 250),
(4, 'Turangga', 'Bisnis', 200),
(5, 'Arjuna', 'Ekonomi', 180),
(6, 'Gumarang', 'Eksekutif', 220),
(7, 'Sembrani', 'Eksekutif', 200),
(8, 'Sancaka', 'Ekonomi', 250),
(9, 'Taksaka', 'Eksekutif', 180),
(10, 'Kutojaya', 'Ekonomi', 200),
(11, 'Majapahit', 'Bisnis', 220),
(12, 'Sritanjung', 'Bisnis', 200),
(13, 'Sawunggalih', 'Ekonomi', 180),
(14, 'Sawunggalih Utama', 'Eksekutif', 250),
(15, 'Senja Utama', 'Bisnis', 200),
(16, 'Matarmaja', 'Ekonomi', 220),
(17, 'Mutiara Selatan', 'Bisnis', 200),
(18, 'Kahuripan', 'Ekonomi', 180),
(19, 'Brantas', 'Ekonomi', 250),
(20, 'Jayabaya', 'Bisnis', 200);

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `id_rute` int(11) NOT NULL,
  `stasiun_asal` int(11) NOT NULL,
  `stasiun_tujuan` int(11) NOT NULL,
  `jarak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rute`
--

INSERT INTO `rute` (`id_rute`, `stasiun_asal`, `stasiun_tujuan`, `jarak`) VALUES
(1, 1, 3, 150),
(2, 3, 5, 780),
(3, 1, 4, 780),
(4, 4, 6, 307),
(5, 4, 5, 325),
(6, 18, 15, 486),
(7, 7, 11, 190),
(8, 8, 20, 172),
(9, 10, 13, 37),
(10, 17, 16, 72),
(11, 15, 3, 461),
(12, 9, 20, 169),
(13, 14, 4, 291),
(14, 16, 3, 199),
(15, 2, 6, 475),
(16, 5, 12, 167),
(17, 12, 4, 467),
(18, 7, 20, 98),
(19, 11, 18, 296),
(20, 12, 5, 167);

-- --------------------------------------------------------

--
-- Table structure for table `stasiun`
--

CREATE TABLE `stasiun` (
  `id_stasiun` int(11) NOT NULL,
  `nama_stasiun` varchar(50) NOT NULL,
  `lokasi_tujuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stasiun`
--

INSERT INTO `stasiun` (`id_stasiun`, `nama_stasiun`, `lokasi_tujuan`) VALUES
(1, 'Stasiun Gambir', 'Jakarta'),
(2, 'Stasiun Pasar Senen', 'Jakarta'),
(3, 'Stasiun Bandung', 'Bandung'),
(4, 'Stasiun Surabaya Gubeng', 'Surabaya'),
(5, 'Stasiun Yogyakarta Tugu', 'Yogyakarta'),
(6, 'Stasiun Semarang Tawang', 'Semarang'),
(7, 'Stasiun Solo Balapan', 'Surakarta'),
(8, 'Stasiun Malang Kota Baru', 'Malang'),
(9, 'Stasiun Pasar Turi', 'Surabaya'),
(10, 'Stasiun Bojonegoro', 'Bojonegoro'),
(11, 'Stasiun Pekalongan', 'Pekalongan'),
(12, 'Stasiun Purwokerto', 'Purwokerto'),
(13, 'Stasiun Babat', 'Babat'),
(14, 'Stasiun Banyuwangi', 'Banyuwangi'),
(15, 'Stasiun Purwosari', 'Purwosari'),
(16, 'Stasiun Tegal', 'Tegal'),
(17, 'Stasiun Cirebon', 'Cirebon'),
(18, 'Stasiun Cikampek', 'Cikampek'),
(19, 'Stasiun Lamongan', 'Lamongan'),
(20, 'Stasiun Madiun', 'Madiun');

-- --------------------------------------------------------

--
-- Stand-in structure for view `stasiuninfoview`
-- (See below for the actual view)
--
CREATE TABLE `stasiuninfoview` (
`id_stasiun` int(11)
,`nama_stasiun` varchar(50)
,`lokasi_tujuan` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `jumlah_tiket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `id_jadwal`, `harga`, `jumlah_tiket`) VALUES
(1, 1, '500000.00', 47),
(2, 2, '255000.00', 60),
(3, 3, '320000.00', 40),
(4, 4, '300000.00', 50),
(5, 5, '280000.00', 35),
(6, 6, '400000.00', 45),
(7, 7, '450000.00', 30),
(8, 8, '100000.00', 80),
(9, 9, '515000.00', 50),
(10, 10, '220000.00', 90),
(11, 11, '280000.00', 35),
(12, 12, '225000.00', 30),
(13, 13, '200000.00', 75),
(14, 14, '520000.00', 50),
(15, 15, '200000.00', 100),
(16, 16, '190000.00', 85),
(17, 17, '225000.00', 40),
(18, 18, '95000.00', 27),
(19, 19, '100000.00', 35),
(20, 20, '280000.00', 38);

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewdaftarjadwal`
-- (See below for the actual view)
--
CREATE TABLE `viewdaftarjadwal` (
`id_jadwal` int(11)
,`nama_kereta` varchar(50)
,`stasiun_asal` int(11)
,`stasiun_tujuan` int(11)
,`waktu_berangkat` datetime(6)
,`waktu_sampai` datetime(6)
,`jumlah_tiket` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewtiketdijual`
-- (See below for the actual view)
--
CREATE TABLE `viewtiketdijual` (
`id_tiket` int(11)
,`id_jadwal` int(11)
,`nama_kereta` varchar(50)
,`stasiun_asal` int(11)
,`stasiun_tujuan` int(11)
,`waktu_berangkat` datetime(6)
,`waktu_sampai` datetime(6)
,`harga` decimal(10,2)
,`jumlah_tiket` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `infokeretaview`
--
DROP TABLE IF EXISTS `infokeretaview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `infokeretaview`  AS SELECT `kereta`.`id_kereta` AS `id_kereta`, `kereta`.`nama_kereta` AS `nama_kereta`, `kereta`.`jenis_kereta` AS `jenis_kereta`, `kereta`.`kapasitas` AS `kapasitas` FROM `kereta``kereta`  ;

-- --------------------------------------------------------

--
-- Structure for view `stasiuninfoview`
--
DROP TABLE IF EXISTS `stasiuninfoview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stasiuninfoview`  AS SELECT `stasiun`.`id_stasiun` AS `id_stasiun`, `stasiun`.`nama_stasiun` AS `nama_stasiun`, `stasiun`.`lokasi_tujuan` AS `lokasi_tujuan` FROM `stasiun``stasiun`  ;

-- --------------------------------------------------------

--
-- Structure for view `viewdaftarjadwal`
--
DROP TABLE IF EXISTS `viewdaftarjadwal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewdaftarjadwal`  AS SELECT `jadwal_kereta`.`id_jadwal` AS `id_jadwal`, `kereta`.`nama_kereta` AS `nama_kereta`, `rute`.`stasiun_asal` AS `stasiun_asal`, `rute`.`stasiun_tujuan` AS `stasiun_tujuan`, `jadwal_kereta`.`waktu_berangkat` AS `waktu_berangkat`, `jadwal_kereta`.`waktu_sampai` AS `waktu_sampai`, `tiket`.`jumlah_tiket` AS `jumlah_tiket` FROM (((`jadwal_kereta` join `kereta` on(`jadwal_kereta`.`id_kereta` = `kereta`.`id_kereta`)) join `rute` on(`jadwal_kereta`.`id_rute` = `rute`.`id_rute`)) join `tiket` on(`jadwal_kereta`.`id_jadwal` = `tiket`.`id_jadwal`))  ;

-- --------------------------------------------------------

--
-- Structure for view `viewtiketdijual`
--
DROP TABLE IF EXISTS `viewtiketdijual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewtiketdijual`  AS SELECT `tiket`.`id_tiket` AS `id_tiket`, `jadwal_kereta`.`id_jadwal` AS `id_jadwal`, `kereta`.`nama_kereta` AS `nama_kereta`, `rute`.`stasiun_asal` AS `stasiun_asal`, `rute`.`stasiun_tujuan` AS `stasiun_tujuan`, `jadwal_kereta`.`waktu_berangkat` AS `waktu_berangkat`, `jadwal_kereta`.`waktu_sampai` AS `waktu_sampai`, `tiket`.`harga` AS `harga`, `tiket`.`jumlah_tiket` AS `jumlah_tiket` FROM (((`tiket` join `jadwal_kereta` on(`tiket`.`id_jadwal` = `jadwal_kereta`.`id_jadwal`)) join `kereta` on(`jadwal_kereta`.`id_kereta` = `kereta`.`id_kereta`)) join `rute` on(`jadwal_kereta`.`id_rute` = `rute`.`id_rute`)) WHERE `tiket`.`jumlah_tiket` > 00  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal_kereta`
--
ALTER TABLE `jadwal_kereta`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_kereta` (`id_kereta`),
  ADD KEY `id_rute` (`id_rute`);

--
-- Indexes for table `kereta`
--
ALTER TABLE `kereta`
  ADD PRIMARY KEY (`id_kereta`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`),
  ADD KEY `id_stasiun` (`stasiun_asal`),
  ADD KEY `stasiun_tujuan` (`stasiun_tujuan`);

--
-- Indexes for table `stasiun`
--
ALTER TABLE `stasiun`
  ADD PRIMARY KEY (`id_stasiun`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal_kereta`
--
ALTER TABLE `jadwal_kereta`
  ADD CONSTRAINT `jadwal_kereta_ibfk_1` FOREIGN KEY (`id_kereta`) REFERENCES `kereta` (`id_kereta`),
  ADD CONSTRAINT `jadwal_kereta_ibfk_2` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`);

--
-- Constraints for table `rute`
--
ALTER TABLE `rute`
  ADD CONSTRAINT `rute_ibfk_1` FOREIGN KEY (`stasiun_asal`) REFERENCES `stasiun` (`id_stasiun`),
  ADD CONSTRAINT `rute_ibfk_2` FOREIGN KEY (`stasiun_tujuan`) REFERENCES `stasiun` (`id_stasiun`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_kereta` (`id_jadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

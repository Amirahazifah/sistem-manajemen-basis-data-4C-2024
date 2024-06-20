-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2024 at 03:09 PM
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
-- Database: `rs`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `spesialisasi` varchar(20) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama`, `spesialisasi`, `no_telepon`, `email`) VALUES
(1, 'Dr. Ani Susanti', 'Dokter Umum', '081234567891', 'ani.susanti@example.'),
(2, 'Dr. Sarah Wulandari', 'Dokter Bedah', '089876543214', 'sarah.wulandari@exam'),
(3, 'Dr. Made Wirawan', 'Dokter Anak', '081398765439', 'made.wirawan@example'),
(4, 'Dr. Dewi Fitriani', 'Dokter Gigi', '087654321092', 'dewi.fitriani@exampl'),
(5, 'Dr. Kevin Pramudya', 'Dokter Mata', '081112223393', 'kevin.pramudya@examp'),
(6, 'Dr. Emily Wijaya', 'Dokter Penyakit Dala', '081278945615', 'emily.wijaya@example'),
(7, 'Dr. Krisna Santoso', 'Dokter THT', '081354769826', 'krisna.santoso@examp'),
(8, 'Dr. Ayu Puspitasari', 'Dokter Jantung', '081237896547', 'ayu.puspitasari@exam'),
(9, 'Dr. Daniel Hermawan', 'Dokter Saraf', '089712345678', 'daniel.hermawan@exam'),
(10, 'Dr. Yanti Kartika', 'Dokter Kulit', '089634125792', 'yanti.kartika@exampl'),
(11, 'Dr. Miranda', 'Dokter Penyakit Dala', '089634125778', 'miranda@exampl'),
(12, 'Dr. Adi Nugroho', 'Dokter Orthopedi', '081237465895', 'adi.nugroho@example.'),
(13, 'Dr. Putri Utami', 'Dokter Obstetri', '081235647896', 'putri.utami@example.'),
(14, 'Dr. Budi Kurniawan', 'Dokter Psikiater', '087623154793', 'budi.kurniawan@examp'),
(15, 'Dr. Maya Wardhani', 'Dokter Endokrinologi', '081376594824', 'maya.wardhani@exampl'),
(16, 'Dr. Andi Surya', 'Dokter Urologi', '081238975645', 'andi.surya@example.c'),
(17, 'Dr. Rita Handayani', 'Dokter Hematologi', '089732165478', 'rita.handayani@examp'),
(18, 'Dr. Dwi Susilo', 'Dokter Onkologi', '081238975641', 'dwi.susilo@example.c'),
(19, 'Dr. Andi Wijaya', 'Dokter Pulmonologi', '087654987323', 'andi.wijaya@example.'),
(20, 'Dr. Ika Wulandari', 'Dokter Radiologi', '081398765432', 'ika.wulandari@exampl');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(30) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `harga` decimal(20,0) NOT NULL,
  `stok` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `jenis`, `harga`, `stok`) VALUES
(1, 'Paracetamol', 'Analgesik', '5000', 100),
(2, 'Obat Hormon', 'Obat Hormon', '10000', 50),
(3, 'Morphine', 'Analgesik Opioid', '15000', 50),
(4, 'Antibiotik', 'Antibakteri', '12000', 100),
(5, 'Amoxicillin', 'Antibiotik', '7000', 80),
(6, 'Obat Kumur', 'Antiseptik Mulut', '15000', 40),
(7, 'Tetes Mata', 'Obat Mata', '9000', 90),
(8, 'Antidepresan', 'Antidepresan', '11000', 60),
(9, 'Obat Hipertensi', 'Antihipertensi', '13000', 70),
(10, 'Insulin', 'Antidiabetik', '10000', 50),
(11, 'Bronkodilator', 'Bronkodilator', '8000', 60),
(12, 'Salep Telinga', 'Obat Telinga', '14000', 40),
(13, 'Obat HIpoglikemik', 'Hipoglikemik', '16000', 50),
(14, 'Antikoagulan', 'Antikoagulan', '12000', 100),
(15, 'Antikonvulsan', 'Antikonvulsan', '17000', 30),
(16, 'Obat Nyeri', 'Analgesik', '5000', 40),
(17, 'Salep Kortikosteroid', 'Antiinflamasi Topikal', '11000', 60),
(18, 'Antibiotik Topikal', 'Antibiotik Topikal', '12000', 70),
(19, 'Antiinflamasi', 'Antiinflamasi', '13000', 80),
(20, 'Kemoterapi', 'Kemoterapi', '20000', 30);

-- --------------------------------------------------------

--
-- Stand-in structure for view `obatview`
-- (See below for the actual view)
--
CREATE TABLE `obatview` (
`id_obat` int(30)
,`jenis` varchar(30)
,`harga` decimal(20,0)
,`stok` int(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(30) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(30) NOT NULL,
  `no_telepon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama`, `tgl_lahir`, `alamat`, `jenis_kelamin`, `no_telepon`) VALUES
(0, '', '0000-00-00', '', '', ''),
(1, 'Hadi Susanto', '2000-01-09', 'Jl. Cendrawasih No. 123', 'Laki-Laki', '2147483647'),
(2, 'Rani Fitriana', '1998-01-17', 'Jl. Cendana No. 35', 'Perempuan', '2147483647'),
(3, 'Arief Kurniawan', '2000-08-14', 'Jl. Diponegoro No. 78', 'Laki-Laki', '2147483647'),
(4, 'Nina Rosalina', '2015-11-21', 'Jl. Dahlia No. 56', 'Perempuan', '2147483647'),
(5, 'Eko Wahyudi', '2003-02-22', 'Jl. Pahlawan No. 90', 'Laki-Laki', '2147483647'),
(6, 'Yuni Cahyani', '1992-05-18', 'Jl. Gajah Mada No. 34', 'Perempuan', '2147483647'),
(7, 'Hendro Saputra', '2002-12-25', 'Jl. Sudirman No. 67', 'Laki-Laki', '2147483647'),
(8, 'Lia Anggraini', '2001-06-15', 'Jl. Thamrin No. 23', 'Perempuan', '2147483647'),
(9, 'Fajar Pratama', '1999-04-24', 'Jl. Kusuma No. 45', 'Laki-Laki', '2147483647'),
(10, 'Diana Sari', '2006-09-29', 'Jl. Ganesha No. 12', 'Perempuan', '2147483647'),
(11, 'Agus Setiawan', '2015-11-21', 'Jl. Riau No. 78', 'Laki-Laki', '2147483647'),
(12, 'Rini Widarti', '2004-12-28', 'Jl. Merdeka No. 34', 'Perempuan', '2147483647'),
(13, 'Andi Susilo', '2000-02-23', 'Jl. Dipa No. 56', 'Laki-Laki', '2147483647'),
(14, 'Nadia Permata', '1999-08-18', 'Jl. Gajah No. 23', 'Perempuan', '2147483647'),
(15, 'Joko Wibowo', '2010-03-31', 'Jl. Majapahit No. 89', 'Laki-Laki', '2147483647'),
(16, 'Layla Arin', '2004-11-08', 'Jl. Kebon Sirih No. 67', 'Perempuan', '2147483647'),
(17, 'Dewi Lestari', '1982-05-12', 'Jl. Diponegoro No. 23', 'Perempuan', '2147483647'),
(18, 'Arini Nurul', '2000-09-25', 'Jl. Mataram No. 56', 'Perempuan', '2147483647'),
(19, 'Ahmad Maulana', '1989-01-10', 'Jl. Pemuda No. 78', 'Laki-Laki', '2147483647'),
(20, 'Siti Rahayu', '1995-06-15', 'Jl. Surya No. 34', 'Perempuan', '2147483647');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pasienview`
-- (See below for the actual view)
--
CREATE TABLE `pasienview` (
`id_pasien` int(30)
,`nama` varchar(30)
,`tgl_lahir` date
,`alamat` varchar(30)
,`jenis_kelamin` varchar(30)
,`no_telepon` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `rawat _inap`
--

CREATE TABLE `rawat _inap` (
  `id_rawat_inap` int(30) NOT NULL,
  `id_pasien` int(30) NOT NULL,
  `id_dokter` int(30) NOT NULL,
  `id_ruangan` int(30) NOT NULL,
  `id_obat` int(30) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `diagnosis` text NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rawat _inap`
--

INSERT INTO `rawat _inap` (`id_rawat_inap`, `id_pasien`, `id_dokter`, `id_ruangan`, `id_obat`, `tgl_masuk`, `tgl_keluar`, `diagnosis`, `status`) VALUES
(1, 1, 4, 2, 6, '2024-01-14', '2024-01-14', 'Gusi Bengkak', 'Keluar'),
(2, 2, 1, 1, 1, '2024-03-01', '2024-03-03', 'Demam\r\n', 'Rawat Inap'),
(3, 3, 3, 2, 5, '2024-03-27', '2024-03-27', 'Diare\r\n', 'Keluar'),
(4, 4, 12, 3, 16, '2024-03-06', '2024-03-09', 'Patah Tulang\r\n', 'Rawat Inap'),
(5, 5, 2, 4, 4, '2024-03-06', '2024-03-09', 'Fraktur', 'Rawat Inap'),
(6, 6, 5, 8, 7, '2024-03-27', '2024-03-27', 'Rabun Jauh\r\n', 'Keluar'),
(7, 7, 8, 5, 14, '2024-03-20', '2024-03-25', 'Serangan Jantung', 'Rawat Inap'),
(8, 8, 6, 6, 10, '2024-03-03', '2024-03-03', 'Diabetes\r\n', 'Keluar'),
(9, 9, 7, 7, 12, '2024-03-20', '2024-03-20', 'Sinusitis', 'Keluar'),
(10, 10, 9, 8, 15, '2024-03-01', '2024-01-06', 'Stroke', 'Rawat Inap'),
(11, 11, 10, 9, 18, '2024-03-27', '2024-03-27', 'Kudis\r\n', 'Keluar'),
(12, 12, 11, 10, 11, '2024-03-26', '2024-03-27', 'Asma\r\n', 'Rawat Inap'),
(13, 13, 14, 11, 8, '2024-03-27', '2024-03-27', 'Depresi\r\n', 'Keluar'),
(14, 14, 13, 12, 2, '2024-03-25', '2024-03-25', 'Kehamilan', 'Keluar'),
(15, 15, 20, 13, 20, '2024-03-22', '2024-03-26', 'Ksnker\r\n', 'Rawat Inap'),
(16, 16, 15, 14, 13, '2024-03-05', '2024-03-10', 'Obesitas', 'Rawat Inap'),
(17, 17, 16, 15, 4, '2024-03-25', '2024-03-26', 'Pneumonia\r\n', 'Keluar'),
(18, 18, 19, 16, 11, '2023-03-01', '2024-03-04', 'Bronkitis\r\n', 'Keluar'),
(19, 19, 18, 17, 20, '2024-03-20', '2024-03-26', 'Kanker Paru Paru', 'Rawat Inap'),
(20, 20, 7, 20, 12, '2024-02-16', '2024-02-16', 'Tonsilitis\r\n', 'Keluar');

-- --------------------------------------------------------

--
-- Stand-in structure for view `readonly_dokter`
-- (See below for the actual view)
--
CREATE TABLE `readonly_dokter` (
`id_dokter` int(20)
,`nama` varchar(20)
,`spesialisasi` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `readonly_obat`
-- (See below for the actual view)
--
CREATE TABLE `readonly_obat` (
`id_obat` int(30)
,`nama_obat` varchar(30)
,`stok` int(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(30) NOT NULL,
  `no_ruangan` varchar(30) NOT NULL,
  `kapasitas` int(30) NOT NULL,
  `lantai` int(30) NOT NULL,
  `fasilitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `no_ruangan`, `kapasitas`, `lantai`, `fasilitas`) VALUES
(1, '101', 2, 1, 'Kasur\r\nLemari\r\nAC'),
(2, '102', 3, 1, 'Kasur\r\nLemari\r\nAC\r\nTV'),
(3, '103', 1, 1, 'Kasur\r\nLemari\r\nAC'),
(4, '104', 4, 1, 'Kasur\r\nLemari\r\nAC\r\nTV\r\nKamar Mandi'),
(5, '105', 2, 1, 'Kasur\r\nLemari\r\nAC'),
(6, '201', 3, 2, 'Kasur\r\nLemari\r\nAC\r\nTV'),
(7, '202', 2, 2, 'Kasur\r\nLemari\r\nAC\r\n'),
(8, '203', 1, 2, 'Kasur\r\nLemari\r\nAC\r\n'),
(9, '204', 4, 2, 'Kasur\r\nLemari\r\nAC\r\nTV\r\nKamar Mandi'),
(10, '205', 2, 2, 'Kasur\r\nLemari\r\nAC\r\n'),
(11, '301', 4, 3, 'Kasur\r\nLemari\r\nAC\r\nTV\r\nKamar Mandi'),
(12, '302', 3, 3, 'Kasur\r\nLemari\r\nAC\r\nTV'),
(13, '303', 1, 3, 'Kasur\r\nLemari\r\nAC\r\n'),
(14, '304', 2, 3, 'Kasur\r\nLemari\r\nAC\r\n\r\n'),
(15, '305', 2, 3, 'Kasur\r\nLemari\r\nAC\r\n'),
(16, '401', 3, 4, 'Kasur\r\nLemari\r\nAC\r\nTV\r\n'),
(17, '402', 1, 4, 'Kasur\r\nLemari\r\nAC'),
(18, '403', 1, 4, 'Kasur\r\nLemari\r\nAC'),
(19, '404', 3, 4, 'Kasur\r\nLemari\r\nAC\r\nTV'),
(20, '405', 2, 4, 'Kasur\r\nLemari\r\nAC\r\nTV\r\nKamar Mandi\r\n');

-- --------------------------------------------------------

--
-- Structure for view `obatview`
--
DROP TABLE IF EXISTS `obatview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obatview`  AS SELECT `obat`.`id_obat` AS `id_obat`, `obat`.`jenis` AS `jenis`, `obat`.`harga` AS `harga`, `obat`.`stok` AS `stok` FROM `obat``obat`  ;

-- --------------------------------------------------------

--
-- Structure for view `pasienview`
--
DROP TABLE IF EXISTS `pasienview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pasienview`  AS SELECT `pasien`.`id_pasien` AS `id_pasien`, `pasien`.`nama` AS `nama`, `pasien`.`tgl_lahir` AS `tgl_lahir`, `pasien`.`alamat` AS `alamat`, `pasien`.`jenis_kelamin` AS `jenis_kelamin`, `pasien`.`no_telepon` AS `no_telepon` FROM `pasien``pasien`  ;

-- --------------------------------------------------------

--
-- Structure for view `readonly_dokter`
--
DROP TABLE IF EXISTS `readonly_dokter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `readonly_dokter`  AS SELECT `dokter`.`id_dokter` AS `id_dokter`, `dokter`.`nama` AS `nama`, `dokter`.`spesialisasi` AS `spesialisasi` FROM `dokter``dokter`  ;

-- --------------------------------------------------------

--
-- Structure for view `readonly_obat`
--
DROP TABLE IF EXISTS `readonly_obat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `readonly_obat`  AS SELECT `obat`.`id_obat` AS `id_obat`, `obat`.`nama_obat` AS `nama_obat`, `obat`.`stok` AS `stok` FROM `obat``obat`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `rawat _inap`
--
ALTER TABLE `rawat _inap`
  ADD PRIMARY KEY (`id_rawat_inap`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_ruangan` (`id_ruangan`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rawat _inap`
--
ALTER TABLE `rawat _inap`
  ADD CONSTRAINT `rawat _inap_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `rawat _inap_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `rawat _inap_ibfk_3` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`),
  ADD CONSTRAINT `rawat _inap_ibfk_4` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id_ruangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

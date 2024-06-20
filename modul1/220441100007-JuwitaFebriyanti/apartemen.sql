-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Mar 2024 pada 06.44
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apartemen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `nama_fasilitas` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `nama_fasilitas`, `deskripsi`) VALUES
(1, 'Kolam Renang', 'Kolam Renang Dewasa'),
(2, 'Lapangan Tenis', 'Lapangan Tenis Outdoor'),
(3, 'Gym', 'Fasilitas Gym Lengkap'),
(4, 'Taman Bermain', 'Area Taman Bermain Anak'),
(5, 'Sauna', 'Ruang Sauna'),
(6, 'Tempat Parkir', 'Area Parkir Kendaraan'),
(7, 'Spa', 'Spa'),
(8, 'Launge', 'Launge Untuk Bersantai'),
(9, 'Ruang Serbaguna', 'Ruang Serbaguna Untuk Acara'),
(10, 'Kolam Renang Anak', 'Kolam Renang Untuk Anak-Anak'),
(11, 'Mini Market', 'Minimarket'),
(12, 'Ruang Pertemuan', 'Ruang pertemuan atau meeting'),
(13, 'BBQ Area', 'Area untuk acara BBQ'),
(14, 'Salon', 'Salon kecantikan'),
(15, 'Laundry', ' Layanan laundry'),
(16, 'Ruang Musik', 'Ruang untuk bermain musik'),
(17, 'Cinema Room', 'Ruang untuk menonton film'),
(18, 'Perpustakaan', 'Perpustakaan umum'),
(19, 'Karaoke Room', 'Ruang karaoke'),
(20, 'CCTV', 'Sistem pengawasan CCTV');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gedung`
--

CREATE TABLE `gedung` (
  `id_gedung` int(11) NOT NULL,
  `nama_gedung` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gedung`
--

INSERT INTO `gedung` (`id_gedung`, `nama_gedung`) VALUES
(1, 'Tower A1'),
(2, 'Tower A2'),
(3, 'Tower A3'),
(4, 'Tower A4'),
(5, 'Tower A5'),
(6, 'Tower B1'),
(7, 'Tower B2'),
(8, 'Tower B3'),
(9, 'Tower B4'),
(10, 'Tower B5'),
(11, 'Tower C1'),
(12, 'Tower C2'),
(13, 'Tower C3'),
(14, 'Tower C4'),
(15, 'Tower C5'),
(16, 'Tower D1'),
(17, 'Tower D2'),
(18, 'Tower D3'),
(19, 'Tower D4'),
(20, 'Tower D5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` int(11) NOT NULL,
  `nama_penyewa` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama_penyewa`, `alamat`, `no_telepon`) VALUES
(1, 'Nana Fitriana', 'Jl. Sudirman NO.01', '081234567868'),
(2, 'Juwita', 'Jl. Gajah Mada No.57', '085271819129'),
(3, 'Achmad Yusha', 'Jl. Kenanga No.34', '085273821999'),
(4, 'Ferdi Prayuda', 'Jl. Kamboja No.76', '089526372836'),
(5, 'Sundari', 'Jl. Imam Bonjol No.44', '089536271837'),
(6, 'Anatasya Putri', 'Jl. Tengku Umar No.23', '082234453647'),
(7, 'Firda Novi Hamida', 'Jl. Veteran No.68', '081235463728'),
(8, 'Ega Abriano', 'Jl. Cempaka No.63', '081374623728'),
(9, 'Ananda Putri Annisa', 'Jl. Pemuda No.22', '081273282638'),
(10, 'Rahmadani', 'Jl. Nusa Indah No.28', '085237463728'),
(11, 'Ikram Ramadhan', 'Jl. Senopati No.82', '089536273527'),
(12, 'Nadrah Umi Kalsum', 'Jl. Pahlawan No.15', '089526352637'),
(13, 'Suhaila Husniya', 'Jl. Asia Afrika No.91', '082215362732'),
(14, 'Rizky Ahmadani', 'Jl. Diponegoro No.18', '082136273263'),
(15, 'Anita Purnamasari', 'Jl. Dipati Ukur No.37', '082235263748'),
(16, 'Fitri Nurdiana', 'Jl. Kartini No.29', '082216372839'),
(17, 'Ridho Saputra', 'Jl. Mawar No.49', '081353263748'),
(18, 'Agam Wahyu', 'Jl. Kebon Sirih No.11', '085326371839'),
(19, 'Suci Lestari', 'Jl. Jendral Sudirman No.53', '081326372839'),
(20, 'Jennie ', 'Jl. Cikini Raya No.72', '085236471819');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `penyewaview`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `penyewaview` (
`id_penyewa` int(11)
,`nama_penyewa` varchar(100)
,`alamat` varchar(100)
,`no_telepon` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

CREATE TABLE `sewa` (
  `id_sewa` int(11) NOT NULL,
  `id_penyewa` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id_sewa`, `id_penyewa`, `id_unit`, `tgl_masuk`, `tgl_keluar`) VALUES
(1, 1, 1, '2023-06-12', '2024-02-15'),
(2, 2, 2, '2023-10-09', '2024-02-09'),
(3, 3, 3, '2023-07-10', '2024-01-10'),
(4, 4, 4, '2024-01-07', '2024-03-07'),
(5, 5, 5, '2023-08-14', '2024-03-14'),
(6, 6, 6, '2023-11-20', '2024-03-20'),
(7, 7, 7, '2023-12-24', '0000-00-00'),
(8, 8, 8, '2023-05-08', '0000-00-00'),
(9, 9, 9, '2023-03-05', '2024-03-05'),
(10, 10, 10, '2023-10-10', '2024-02-10'),
(11, 11, 11, '2023-11-14', '2024-03-14'),
(12, 12, 12, '2023-04-17', '2024-01-17'),
(13, 13, 13, '2023-09-18', '2024-03-18'),
(14, 14, 14, '2023-05-17', '2024-03-17'),
(15, 15, 15, '2023-10-09', '0000-00-00'),
(16, 16, 16, '2023-09-03', '0000-00-00'),
(17, 17, 17, '2023-06-21', '0000-00-00'),
(18, 18, 18, '2024-01-01', '0000-00-00'),
(19, 19, 19, '2023-10-09', '2024-02-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit`
--

CREATE TABLE `unit` (
  `id_unit` int(11) NOT NULL,
  `id_gedung` int(11) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `harga` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `unit`
--

INSERT INTO `unit` (`id_unit`, `id_gedung`, `nomor`, `tipe`, `harga`) VALUES
(1, 1, 'A101', 'Studio', '1000000'),
(2, 2, 'A102', 'Studio', '1000000'),
(3, 3, 'A103', 'Studio', '1000000'),
(4, 4, 'A104', 'Alcove', '1500000'),
(5, 5, 'A105', 'Alcove', '1500000'),
(6, 6, 'AB201', 'Bedroom ', '1500000'),
(7, 7, 'B202', 'Studio', '1000000'),
(8, 8, 'B203', 'Alcove', '1500000'),
(9, 9, 'B204', 'Studio', '1000000'),
(10, 10, 'B205', 'Alcove', '1500000'),
(11, 11, 'C301', 'Alcove', '1500000'),
(12, 12, 'C302', 'Studio', '1000000'),
(13, 13, 'C303', 'Studio', '1000000'),
(14, 14, 'C304', 'Alcove', '1500000'),
(15, 15, 'C405', 'Alcove', '1500000'),
(16, 16, 'D501', 'Studio', '1000000'),
(17, 17, 'D502', 'Studio', '1000000'),
(18, 18, 'D503', 'Alcove', '1500000'),
(19, 19, 'D504', 'Alcove', '1500000'),
(20, 20, 'D505', 'Studio', '1000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit_fasilitas`
--

CREATE TABLE `unit_fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `unit_fasilitas`
--

INSERT INTO `unit_fasilitas` (`id_fasilitas`, `id_unit`) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 5),
(4, 3),
(4, 6),
(5, 18),
(7, 14),
(10, 16),
(17, 12),
(8, 10),
(16, 8),
(3, 15),
(16, 13),
(17, 20),
(19, 9),
(7, 17),
(10, 13),
(19, 17);

-- --------------------------------------------------------

--
-- Struktur untuk view `penyewaview`
--
DROP TABLE IF EXISTS `penyewaview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `penyewaview`  AS SELECT `penyewa`.`id_penyewa` AS `id_penyewa`, `penyewa`.`nama_penyewa` AS `nama_penyewa`, `penyewa`.`alamat` AS `alamat`, `penyewa`.`no_telepon` AS `no_telepon` FROM `penyewa``penyewa`  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indeks untuk tabel `gedung`
--
ALTER TABLE `gedung`
  ADD PRIMARY KEY (`id_gedung`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Indeks untuk tabel `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id_unit`),
  ADD KEY `id_gedung` (`id_gedung`);

--
-- Indeks untuk tabel `unit_fasilitas`
--
ALTER TABLE `unit_fasilitas`
  ADD KEY `id_fasilitas` (`id_fasilitas`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`),
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `unit` (`id_unit`);

--
-- Ketidakleluasaan untuk tabel `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`id_gedung`) REFERENCES `gedung` (`id_gedung`);

--
-- Ketidakleluasaan untuk tabel `unit_fasilitas`
--
ALTER TABLE `unit_fasilitas`
  ADD CONSTRAINT `unit_fasilitas_ibfk_1` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`),
  ADD CONSTRAINT `unit_fasilitas_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `unit` (`id_unit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

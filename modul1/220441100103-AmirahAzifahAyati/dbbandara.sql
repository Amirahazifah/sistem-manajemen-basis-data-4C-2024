-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2024 pada 18.18
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbbandara`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bandara`
--

CREATE TABLE `bandara` (
  `Kode_Bandara` varchar(5) NOT NULL,
  `Nama_Bandara` varchar(100) NOT NULL,
  `Lokasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bandara`
--

INSERT INTO `bandara` (`Kode_Bandara`, `Nama_Bandara`, `Lokasi`) VALUES
('BND01', 'Soekarno-Hatta International Airport', 'Jakarta, Indonesia'),
('BND02', 'Ngurah Rai International Airport', 'Denpasar, Bali, Indonesia'),
('BND03', 'Juanda International Airport', 'Surabaya, Indonesia'),
('BND04', 'Sultan Hasanuddin International Airport', 'Makassar, Indonesia'),
('BND05', ' Adisumarmo International Airport', 'Surakarta, Indonesia'),
('BND06', 'Minangkabau International Airport', 'Padang, Indonesia'),
('BND07', 'Kualanamu International Airport', 'Medan, Indonesia'),
('BND08', 'Adisucipto International Airport', 'Yogyakarta, Indonesia'),
('BND09', 'Ahmad Yani International Airport', 'Semarang, Indonesia'),
('BND10', 'Sultan Mahmud Badaruddin II International Airport', 'Palembang, Indonesia'),
('BND11', 'Hang Nadim International Airport ', 'Batam, Indonesia'),
('BND12', 'Sultan Syarif Kasim II International Airport', 'Pekanbaru, Indonesia'),
('BND13', 'Sam Ratulangi International Airport', 'Manado, Indonesia'),
('BND14', 'Supadio International Airport', 'Pontianak, Indonesia'),
('BND15', 'Sepinggan International Airport', 'Balikpapan, Indonesia'),
('BND16', 'Husein Sastranegara International Airport', 'Bandung, Indonesia'),
('BND17', 'Sultan Iskandar Muda International Airport', 'Banda Aceh, Indonesia'),
('BND18', 'Halim Perdanakusuma International Airport', 'Jakarta, Indonesia'),
('BND19', ' Adi Sutjipto International Airport', 'Yogyakarta, Indonesia'),
('BND20', 'Pattimura International Airport ', 'Ambon, Indonesia'),
('BND21', 'Frans Kaisiepo International Airport', 'Biak, Indonesia'),
('BND22', 'Syamsudin Noor International Airport', 'Banjarmasin, Indonesia'),
('BND23', 'Abdul Rachman Saleh Airport', 'Malang, Indonesia'),
('BND24', 'Silangit International Airport', 'Siborong-Borong, Indonesia'),
('BND25', 'Lombok International Airport', 'Praya, Lombok, Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_penerbangan`
--

CREATE TABLE `jadwal_penerbangan` (
  `ID_Jadwal` int(11) NOT NULL,
  `Kode_Rute` varchar(5) NOT NULL,
  `Kode_Maskapai` varchar(5) NOT NULL,
  `Waktu_Berangkat` datetime NOT NULL,
  `Waktu_Tiba` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_penerbangan`
--

INSERT INTO `jadwal_penerbangan` (`ID_Jadwal`, `Kode_Rute`, `Kode_Maskapai`, `Waktu_Berangkat`, `Waktu_Tiba`) VALUES
(1, 'RT001', 'MSK01', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(2, 'RT002', 'MSK02', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(3, 'RT003', 'MSK03', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(4, 'RT004', 'MSK04', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(5, 'RT005', 'MSK05', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(6, 'RT006', 'MSK06', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(7, 'RT007', 'MSK07', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(8, 'RT008', 'MSK08', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(9, 'RT009', 'MSK09', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(10, 'RT010', 'MSK10', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(11, 'RT011', 'MSK11', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(12, 'RT013', 'MSK13', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(14, 'RT014', 'MSK14', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(15, 'RT015', 'MSK15', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(16, 'RT016', 'MSK16', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(17, 'RT017', 'MSK17', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(18, 'RT018', 'MSK18', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(19, 'RT019', 'MSK19', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(20, 'RT020', 'MSK20', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(21, 'RT021', 'MSK21', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(22, 'RT022', 'MSK22', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(23, 'RT023', 'MSK23', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(24, 'RT024', 'MSK24', '2024-03-28 17:32:03', '2024-03-28 17:32:03'),
(25, 'RT025', 'MSK22', '2024-03-28 17:32:03', '2024-03-28 17:32:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maskapai`
--

CREATE TABLE `maskapai` (
  `Kode_Maskapai` varchar(5) NOT NULL,
  `Nama_Maskapai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `maskapai`
--

INSERT INTO `maskapai` (`Kode_Maskapai`, `Nama_Maskapai`) VALUES
('MSK01', 'Garuda Indonesia'),
('MSK02', 'Lion Air'),
('MSK03', 'Batik Air'),
('MSK04', 'Citilink'),
('MSK05', ' Sriwijaya Air'),
('MSK06', 'AirAsia Indonesia'),
('MSK07', 'Wings Air'),
('MSK08', 'Nam Air'),
('MSK09', 'Indonesia AirAsia'),
('MSK10', 'Trigana Air Service'),
('MSK11', 'Susi Air\r\n'),
('MSK12', 'TransNusa'),
('MSK13', 'XpressAir'),
('MSK14', 'NAM Air'),
('MSK15', 'Pelita Air Service'),
('MSK16', 'Aviastar Mandiri'),
('MSK17', 'Cardig Air'),
('MSK18', 'Deraya Air Taxi'),
('MSK19', 'EastIndo'),
('MSK20', 'Indonesia Air Transport'),
('MSK21', 'Jayawijaya Dirgantara'),
('MSK22', 'Kal Star Aviation'),
('MSK23', 'Manunggal Air Service'),
('MSK24', 'Mega Perkasa Airlines');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_Pembayaran` int(11) NOT NULL,
  `ID_Tiket` int(11) NOT NULL,
  `Metode_Pembayaran` varchar(50) NOT NULL,
  `Total_Bayar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`ID_Pembayaran`, `ID_Tiket`, `Metode_Pembayaran`, `Total_Bayar`) VALUES
(1, 12, 'cash', '90000.00'),
(2, 17, 'cash', '60000.00'),
(3, 20, 'payment', '70000.00'),
(4, 14, 'payment', '80000.00'),
(5, 3, 'cash', '70000.00'),
(6, 4, 'cash', '90000.00'),
(7, 5, 'payment', '100000.00'),
(8, 24, 'cash', '50000.00'),
(9, 8, 'payment', '60000.00'),
(10, 1, 'payment', '30000.00'),
(11, 10, 'cash', '60000.00'),
(12, 6, 'cash', '70000.00'),
(13, 18, 'cash', '50000.00'),
(14, 21, 'payment', '80000.00'),
(15, 16, 'cash', '70000.00'),
(16, 2, 'payment', '90000.00'),
(17, 13, 'cash', '40000.00'),
(18, 25, 'cash', '75000.00'),
(19, 22, 'payment', '67000.00'),
(20, 15, 'cash', '90000.00'),
(21, 23, 'cash', '67000.00'),
(22, 9, 'cash', '87000.00'),
(23, 23, 'payment', '98000.00'),
(24, 22, 'cash', '81000.00'),
(25, 24, 'payment', '78000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE `rute` (
  `Kode_Rute` varchar(5) NOT NULL,
  `Kode_Bandara_Asal` varchar(5) NOT NULL,
  `Kode_Bandara_Tujuan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rute`
--

INSERT INTO `rute` (`Kode_Rute`, `Kode_Bandara_Asal`, `Kode_Bandara_Tujuan`) VALUES
('RT001', 'BND01', 'BND01'),
('RT002', 'BND02', 'BND02'),
('RT003', 'BND03', 'BND03'),
('RT004', 'BND04', 'BND04'),
('RT005', 'BND05', 'BND05'),
('RT006', 'BND06', 'BND06'),
('RT007', 'BND07', 'BND07'),
('RT008', 'BND08', 'BND08'),
('RT009', 'BND09', 'BND09'),
('RT010', 'BND10', 'BND10'),
('RT011', 'BND11', 'BND11'),
('RT012', 'BND12', 'BND12'),
('RT013', 'BND13', 'BND13'),
('RT014', 'BND14', 'BND14'),
('RT015', 'BND15', 'BND15'),
('RT016', 'BND16', 'BND16'),
('RT017', 'BND17', 'BND17'),
('RT018', 'BND18', 'BND18'),
('RT019', 'BND19', 'BND19'),
('RT020', 'BND20', 'BND20'),
('RT021', 'BND21', 'BND21'),
('RT022', 'BND22', 'BND22'),
('RT023', 'BND23', 'BND23'),
('RT024', 'BND24', 'BND24'),
('RT025', 'BND25', 'BND25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket_penerbangan`
--

CREATE TABLE `tiket_penerbangan` (
  `ID_Tiket` int(11) NOT NULL,
  `ID_Jadwal` int(11) NOT NULL,
  `Nama_Penumpang` varchar(100) NOT NULL,
  `Nomor_Kursi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tiket_penerbangan`
--

INSERT INTO `tiket_penerbangan` (`ID_Tiket`, `ID_Jadwal`, `Nama_Penumpang`, `Nomor_Kursi`) VALUES
(1, 1, 'joni', 'A01'),
(2, 2, 'Rina', 'B02'),
(3, 3, 'BELLA', 'C03'),
(4, 4, 'BUNGA', 'D04'),
(5, 5, 'FLORIS', 'E05'),
(6, 6, 'MIRA', 'F06'),
(7, 7, 'WULAN', 'G07'),
(8, 8, 'JOKO', 'H08'),
(9, 9, 'SOFI', 'I09'),
(10, 10, 'LOLI', 'J10'),
(11, 11, 'YULI', 'K11'),
(12, 12, 'ALWI', 'L12'),
(13, 14, 'ROGI', 'M13'),
(14, 14, 'AYU', 'N14'),
(15, 15, 'SAPUTRI', 'O15'),
(16, 16, 'RERAY', 'P16'),
(17, 17, 'ANISATUN', 'Q17'),
(18, 18, 'NABILLA', 'R19'),
(20, 20, 'APRILIYA', 'S20'),
(21, 21, 'PUTRI', 'T21'),
(22, 22, 'ROSA', 'U22'),
(23, 23, 'SINTA', 'V23'),
(24, 24, 'JOJO', 'W24'),
(25, 25, 'RORO', 'X25');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bandara`
--
ALTER TABLE `bandara`
  ADD PRIMARY KEY (`Kode_Bandara`);

--
-- Indeks untuk tabel `jadwal_penerbangan`
--
ALTER TABLE `jadwal_penerbangan`
  ADD PRIMARY KEY (`ID_Jadwal`),
  ADD KEY `Kode_Rute` (`Kode_Rute`),
  ADD KEY `Kode_Maskapai` (`Kode_Maskapai`);

--
-- Indeks untuk tabel `maskapai`
--
ALTER TABLE `maskapai`
  ADD PRIMARY KEY (`Kode_Maskapai`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD KEY `ID_Tiket` (`ID_Tiket`);

--
-- Indeks untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`Kode_Rute`),
  ADD KEY `Kode_Bandara_Asal` (`Kode_Bandara_Asal`),
  ADD KEY `Kode_Bandara_Tujuan` (`Kode_Bandara_Tujuan`);

--
-- Indeks untuk tabel `tiket_penerbangan`
--
ALTER TABLE `tiket_penerbangan`
  ADD PRIMARY KEY (`ID_Tiket`),
  ADD KEY `ID_Jadwal` (`ID_Jadwal`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal_penerbangan`
--
ALTER TABLE `jadwal_penerbangan`
  ADD CONSTRAINT `jadwal_penerbangan_ibfk_1` FOREIGN KEY (`Kode_Rute`) REFERENCES `rute` (`Kode_Rute`),
  ADD CONSTRAINT `jadwal_penerbangan_ibfk_2` FOREIGN KEY (`Kode_Maskapai`) REFERENCES `maskapai` (`Kode_Maskapai`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_Tiket`) REFERENCES `tiket_penerbangan` (`ID_Tiket`);

--
-- Ketidakleluasaan untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD CONSTRAINT `rute_ibfk_1` FOREIGN KEY (`Kode_Bandara_Asal`) REFERENCES `bandara` (`Kode_Bandara`),
  ADD CONSTRAINT `rute_ibfk_2` FOREIGN KEY (`Kode_Bandara_Tujuan`) REFERENCES `bandara` (`Kode_Bandara`);

--
-- Ketidakleluasaan untuk tabel `tiket_penerbangan`
--
ALTER TABLE `tiket_penerbangan`
  ADD CONSTRAINT `tiket_penerbangan_ibfk_1` FOREIGN KEY (`ID_Jadwal`) REFERENCES `jadwal_penerbangan` (`ID_Jadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

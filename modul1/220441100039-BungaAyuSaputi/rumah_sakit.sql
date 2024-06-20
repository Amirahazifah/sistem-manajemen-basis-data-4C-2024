-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Mar 2024 pada 08.09
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
-- Database: `rumah_sakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `spesialis` text NOT NULL,
  `telepon` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `spesialis`, `telepon`) VALUES
(4101, 'Dr. Ahmad Susilo', 'Bedah', 812345678),
(4102, 'Dr. Anisa Dewi', 'Penyakit Dalam', 812345691),
(4103, 'Dr. Budi Santoso', 'Kandungan', 812567892),
(4104, 'Dr. Candra Wijaya', 'Anak', 814567893),
(4105, 'Dr. Dian Kartika', 'Bedah', 1234567894),
(4106, 'Dr. Erwin Setiawan', 'Mata', 834567895),
(4107, 'Dr. Fitri Indah', 'Penyakit Dalam', 812347896),
(4108, 'Dr. Gunawan Surya', 'Bedah', 812347897),
(4109, 'Dr. Hadi Saputra', 'Bedah', 834567898),
(4110, 'Dr. Ika Widya', 'Kulit', 234567899),
(4111, 'Dr. Joko Prabowo', 'THT', 234567800),
(4112, 'Dr. Kartika Dewi', 'Bedah', 812347801),
(4113, 'Dr. Lina Agustina', 'Bedah', 812345802),
(4114, 'Dr. Mira Rahman', 'Bedah', 812567803),
(4115, 'Dr. Nanang Sukma', 'Penyakit Dalam', 812345604),
(4116, 'Dr. Olivia Citra', 'Anak', 81567805),
(4117, 'Dr. Putra Wijaya', 'Kandungan', 234567806),
(4118, 'Dr. Qori Hidayat', 'Bedah', 812367807),
(4119, 'Dr. Ratna Sari', 'Bedah', 814567808),
(4120, 'Dr. Siti Maryam', 'Mata', 812567809);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int(10) NOT NULL,
  `id_pasien` int(10) NOT NULL,
  `id_dokter` int(10) NOT NULL,
  `id_ruang` int(10) NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `keluhan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `id_ruang`, `tanggal_kunjungan`, `keluhan`) VALUES
(2001, 9, 4102, 104, '2024-03-09', 'Migran'),
(2002, 5, 4107, 110, '2024-03-05', 'Gangguan Pencernaan'),
(2003, 21, 4111, 115, '2024-03-14', 'Demam'),
(2004, 3, 4115, 109, '2024-03-21', 'Sakit Kepala'),
(2005, 22, 4120, 103, '2024-03-06', 'Sakit Mata'),
(2006, 1, 4102, 104, '2024-03-07', 'Demam Berdarah'),
(2007, 2, 4107, 110, '2024-03-14', 'Gangguan Paru-Paru'),
(2008, 6, 4111, 115, '2024-03-14', 'Batuk Berdahak'),
(2009, 4, 4120, 116, '2024-03-15', 'Sakit Mata'),
(2010, 7, 4102, 103, '2024-03-16', 'Radang Tenggorokan'),
(2011, 8, 4107, 116, '2024-03-18', 'Batuk Berdahak'),
(2012, 10, 4120, 109, '2024-03-21', 'Periksa Mata'),
(2013, 11, 4115, 103, '2024-03-24', 'Flu & Batuk'),
(2014, 12, 4115, 110, '2024-03-09', 'Demam'),
(2015, 13, 4107, 110, '2024-03-14', 'Asam Lambung'),
(2016, 14, 4102, 115, '2024-03-03', 'Sakit Tenggorokan'),
(2017, 15, 4107, 116, '2024-03-12', 'Sakit Perut'),
(2018, 20, 4120, 103, '2024-03-08', 'Sakit Mata'),
(2019, 19, 4111, 104, '2024-03-01', 'Demam Berdarah'),
(2020, 16, 4111, 116, '2024-03-19', 'Flu & Batuk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(10) NOT NULL,
  `nama_pasien` text NOT NULL,
  `umur` int(5) NOT NULL,
  `jeni_kelamin` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `umur`, `jeni_kelamin`, `alamat`) VALUES
(1, 'Budi Santoso', 40, 'Laki-laki', 'Jl. Mangga Besar'),
(2, 'Siti Rahayu', 25, 'Perempuan', 'Jl. Diponegoro'),
(3, 'Joko Susanto', 35, 'Laki-laki', 'Jl. Sudirman'),
(4, 'Ani Widayati', 50, 'Perempuan', 'Jl. Gatot Subroto'),
(5, 'Adi Nugroho', 30, 'Laki-laki', 'Jl. Pahlawan'),
(6, 'Dewi Cahyani', 45, 'Perempuan', 'Jl. Surya Sumantri'),
(7, 'Rudi Setiawan', 28, 'Laki-laki', 'Jl. Merdeka'),
(8, 'Maya Anggraeni', 20, 'Perempuan', 'Jl. Asia Afrika'),
(9, 'Agus Prabowo', 30, 'Laki-laki', 'Jl. Hayam Wuruk'),
(10, 'Ratna Dewi', 32, 'Perempuan', 'Jl. Teuku Umar'),
(11, 'Bambang Santoso', 48, 'Laki-laki', 'Jl. Mangga Dua'),
(12, 'Nia Ramadhani', 22, 'Perempuan', 'Jl. Dipati Ukur'),
(13, 'Anton Susanto', 38, 'Laki-laki', 'Jl. Asia Afrika'),
(14, 'Lina Dewi', 27, 'Perempuan', 'Jl. Siliwangi'),
(15, 'Andi Susanto', 33, 'Laki-laki', 'Jl. Tamansari'),
(16, 'Rina Sari', 20, 'Perempuan', 'Jl. Braga'),
(17, 'Eko prasetyo', 42, 'Laki-laki', 'Jl. Kebon Jati'),
(18, 'Retno Rahayu', 29, 'Perempuan', 'Jl. Juanda'),
(19, 'Fajar Setiawan', 37, 'laki-laki', 'Jl. Riau'),
(20, 'Citra Dewi', 26, 'Perempuan', 'Jl. Cihampelas'),
(21, 'Amirah Azifa', 18, 'Perempuan', 'Jl. Telang Indah'),
(22, 'Arina', 19, 'Perempuan', 'Jl. Dipati Ukur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(10) NOT NULL,
  `id_kunjungan` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `tanggal_bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `total`, `tanggal_bayar`) VALUES
(3001, 2001, 500000, '2024-03-09'),
(3002, 2002, 150000, '2024-03-05'),
(3003, 2003, 200000, '2024-03-17'),
(3004, 2004, 50000, '2024-03-21'),
(3005, 2005, 150000, '2024-03-06'),
(3006, 2010, 120000, '2024-03-16'),
(3007, 2009, 150000, '2024-03-15'),
(3008, 2008, 70000, '2024-03-14'),
(3009, 2007, 250000, '2024-03-17'),
(3010, 2006, 130000, '2024-03-10'),
(3011, 2011, 40000, '2024-03-18'),
(3012, 2012, 140000, '2024-03-21'),
(3013, 2013, 70000, '2024-03-24'),
(3014, 2014, 160000, '2024-03-12'),
(3015, 2015, 150000, '2024-03-17'),
(3016, 2020, 70000, '2024-03-19'),
(3017, 2019, 150000, '2024-03-04'),
(3018, 2018, 70000, '2024-03-08'),
(3019, 2017, 50000, '2024-03-12'),
(3020, 2016, 120000, '2024-03-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruang` int(10) NOT NULL,
  `nomor_ruangan` varchar(10) NOT NULL,
  `tipe_ruangan` text NOT NULL,
  `kapasitas` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`id_ruang`, `nomor_ruangan`, `tipe_ruangan`, `kapasitas`) VALUES
(101, 'R001', 'ICU', 5),
(102, 'R002', 'Bedah', 5),
(103, 'R003', 'Rawat Inap', 10),
(104, 'R004', 'Poli Umum', 10),
(105, 'R005', 'Radiologi', 10),
(106, 'R006', 'Laboratorium', 10),
(107, 'R007', 'ICU', 5),
(108, 'R008', 'Bedah', 5),
(109, 'R009', 'Rawat Inap', 10),
(110, 'R010', 'Poli Umum', 10),
(111, 'R011', 'Radiologi', 12),
(112, 'R012', 'Laboratorium', 14),
(113, 'R013', 'ICU', 4),
(114, 'R014', 'Bedah', 3),
(115, 'R015', 'Rawat Inap', 11),
(116, 'R016', 'Poli Umum', 8),
(117, 'R017', 'Radiologi', 12),
(118, 'R018', 'Laboratorium', 10),
(119, 'R019', 'ICU', 7),
(120, 'R020', 'Bedah', 5);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_ruang` (`id_ruang`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `pembayaran_ibfk_1` (`id_kunjungan`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4121;

--
-- AUTO_INCREMENT untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2021;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3021;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `kunjungan_ibfk_3` FOREIGN KEY (`id_ruang`) REFERENCES `ruangan` (`id_ruang`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

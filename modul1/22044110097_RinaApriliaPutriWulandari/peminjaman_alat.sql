-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2024 pada 17.29
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
-- Database: `peminjaman_alat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_stok` int(20) NOT NULL,
  `harga_sewa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jumlah_stok`, `harga_sewa`) VALUES
(1, 'gitar', 3, 10000),
(2, 'biola', 2, 15000),
(3, 'piano', 3, 20000),
(4, 'drum', 1, 5000),
(5, 'flute', 1, 5000),
(6, 'sitar', 3, 15000),
(7, 'harmonika', 1, 20000),
(8, 'saxophone', 4, 25000),
(9, 'terompet', 2, 10000),
(10, 'cajon', 1, 15000),
(11, 'harpa', 2, 10000),
(12, 'trombon', 3, 5000),
(13, 'clarinet', 2, 20000),
(14, 'akordion', 2, 25000),
(15, 'tabla', 1, 10000),
(16, 'xylophone', 1, 5000),
(17, 'violoncello', 3, 15000),
(18, 'gong', 2, 20000),
(19, 'mandolin', 1, 15000),
(20, 'marakas', 2, 5000);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `infopembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `infopembayaran` (
`id_pembayaran` int(11)
,`total_bayar` decimal(10,2)
,`harga_sewa` int(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `infopeminjaman`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `infopeminjaman` (
`id_transaksi` int(11)
,`nama_barang` varchar(50)
,`nama_peminjam` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_peminjaman`
--

CREATE TABLE `laporan_peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_pembayaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan_peminjaman`
--

INSERT INTO `laporan_peminjaman` (`id_peminjaman`, `id_pembayaran`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `new_barang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `new_barang` (
`id_barang` int(20)
,`nama_barang` varchar(50)
,`jumlah_stok` int(20)
,`harga_sewa` int(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `new_peminjam`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `new_peminjam` (
`id_peminjam` int(11)
,`nama_peminjam` varchar(255)
,`no_telp` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `total_bayar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `total_bayar`) VALUES
(1, 1, '10000.00'),
(2, 2, '15000.00'),
(3, 3, '20000.00'),
(4, 4, '5000.00'),
(5, 5, '5000.00'),
(6, 6, '15000.00'),
(7, 7, '20000.00'),
(8, 8, '25000.00'),
(9, 9, '10000.00'),
(10, 10, '15000.00'),
(11, 11, '10000.00'),
(12, 12, '5000.00'),
(13, 13, '20000.00'),
(14, 14, '25000.00'),
(15, 15, '10000.00'),
(16, 16, '5000.00'),
(17, 17, '15000.00'),
(18, 18, '20000.00'),
(19, 19, '15000.00'),
(20, 20, '5000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjam`
--

CREATE TABLE `peminjam` (
  `id_peminjam` int(11) NOT NULL,
  `nama_peminjam` varchar(255) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjam`
--

INSERT INTO `peminjam` (`id_peminjam`, `nama_peminjam`, `no_telp`) VALUES
(1, 'budi', '081234567890'),
(2, 'siti', '085678901234'),
(3, 'joko', '087654321098'),
(4, 'ani', '089012345678'),
(5, 'dian', '082345678901'),
(6, 'rudi', '084567890123'),
(7, 'dewi', '088765432109'),
(8, 'hadi', '083456789012'),
(9, 'rina', '086789012345'),
(10, 'andi', '080123456789'),
(11, 'nita', '081345678901'),
(12, 'agus', '085678901234'),
(13, 'maya', '087890123456'),
(14, 'anto', '082123456789'),
(15, 'lina', '084567890123'),
(16, 'bambang', '088901234567'),
(17, 'nita', '083234567890'),
(18, 'eka', '086789012345'),
(19, 'dini', '080456789012'),
(20, 'aprilia', '081234567891');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_peminjam` int(11) DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tgl_peminjaman`, `id_barang`, `id_peminjam`, `tgl_pengembalian`) VALUES
(1, '2024-01-01', 1, 1, '2024-01-02'),
(2, '2024-01-02', 2, 2, '2024-01-03'),
(3, '2024-01-03', 3, 3, '2024-01-04'),
(4, '2024-02-01', 4, 4, '2024-02-02'),
(5, '2024-03-28', 5, 5, '2024-03-29'),
(6, '2024-02-20', 6, 6, '2024-02-21'),
(7, '2024-02-05', 7, 7, '2024-02-06'),
(8, '2024-02-19', 8, 8, '2024-02-20'),
(9, '2024-02-15', 9, 9, '2024-02-16'),
(10, '2024-03-04', 10, 10, '2024-03-05'),
(11, '2024-03-16', 11, 11, '2024-03-17'),
(12, '2024-03-26', 12, 12, '2024-03-27'),
(13, '2024-03-17', 13, 13, '2024-03-18'),
(14, '2024-02-28', 14, 14, '2024-02-29'),
(15, '2024-02-23', 15, 15, '2024-02-24'),
(16, '2024-03-16', 16, 16, '2024-03-17'),
(17, '2024-03-24', 17, 17, '2024-03-25'),
(18, '2024-01-31', 18, 18, '2024-02-01'),
(19, '2024-01-23', 19, 19, '2024-01-24'),
(20, '2024-03-04', 20, NULL, '2024-03-05');

-- --------------------------------------------------------

--
-- Struktur untuk view `infopembayaran`
--
DROP TABLE IF EXISTS `infopembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `infopembayaran`  AS SELECT `p`.`id_pembayaran` AS `id_pembayaran`, `p`.`total_bayar` AS `total_bayar`, `b`.`harga_sewa` AS `harga_sewa` FROM ((`pembayaran` `p` join `transaksi` `t` on(`p`.`id_transaksi` = `t`.`id_transaksi`)) join `barang` `b` on(`t`.`id_barang` = `b`.`id_barang`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `infopeminjaman`
--
DROP TABLE IF EXISTS `infopeminjaman`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `infopeminjaman`  AS SELECT `t`.`id_transaksi` AS `id_transaksi`, `b`.`nama_barang` AS `nama_barang`, `p`.`nama_peminjam` AS `nama_peminjam` FROM ((`transaksi` `t` join `barang` `b` on(`t`.`id_barang` = `b`.`id_barang`)) join `peminjam` `p` on(`t`.`id_peminjam` = `p`.`id_peminjam`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `new_barang`
--
DROP TABLE IF EXISTS `new_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `new_barang`  AS SELECT `barang`.`id_barang` AS `id_barang`, `barang`.`nama_barang` AS `nama_barang`, `barang`.`jumlah_stok` AS `jumlah_stok`, `barang`.`harga_sewa` AS `harga_sewa` FROM `barang``barang`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `new_peminjam`
--
DROP TABLE IF EXISTS `new_peminjam`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `new_peminjam`  AS SELECT `peminjam`.`id_peminjam` AS `id_peminjam`, `peminjam`.`nama_peminjam` AS `nama_peminjam`, `peminjam`.`no_telp` AS `no_telp` FROM `peminjam``peminjam`  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `laporan_peminjaman`
--
ALTER TABLE `laporan_peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_pembayaran` (`id_pembayaran`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indeks untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`id_peminjam`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_peminjam` (`id_peminjam`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `laporan_peminjaman`
--
ALTER TABLE `laporan_peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `id_peminjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan_peminjaman`
--
ALTER TABLE `laporan_peminjaman`
  ADD CONSTRAINT `laporan_peminjaman_ibfk_1` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_peminjam`) REFERENCES `peminjam` (`id_peminjam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 08:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_menu` (IN `id_menu_inp` INT, IN `stock_inp` INT, IN `nama_inp` VARCHAR(20), IN `category_inp` VARCHAR(25), IN `harga_inp` INT(20), IN `harga_disc_inp` INT, IN `discount_inp` INT, IN `deskripsi_inp` VARCHAR(160), IN `gambar_inp` VARCHAR(200))   BEGIN
    UPDATE menu 
    SET stock = stock_inp, nama = nama_inp, category = category_inp, harga = harga_inp, harga_disc = harga_disc_inp, discount = discount_inp, deskripsi = deskripsi_inp, gambar = gambar_inp
    WHERE id_menu = id_menu_inp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_menu` (IN `id_menu_inp` INT)   BEGIN
    DELETE FROM menu
    WHERE id_menu = id_menu_inp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_user` (IN `id_user_inp` INT)   BEGIN
    DELETE FROM user
    WHERE id_user = id_user_inp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `jumlah_data_by_statusorder` (IN `status_order_inp` VARCHAR(128))   BEGIN
    DECLARE total_order INT;

    IF status_order_inp = 'sukses' THEN
        SELECT COUNT(*) INTO total_order FROM transaksi WHERE status_order = 'SUCCESS';
    ELSEIF status_order_inp = 'pending' THEN
        SELECT COUNT(*) INTO total_order FROM transaksi WHERE status_order = 'PENDING';
    ELSEIF status_order_inp = 'ordering' THEN
        SELECT COUNT(*) INTO total_order FROM transaksi WHERE status_order = 'ORDERING';
    ELSEIF status_order_inp = 'reject' THEN
        SELECT COUNT(*) INTO total_order FROM transaksi WHERE status_order = 'REJECTED';
    ELSE
        SELECT COUNT(*) INTO total_order FROM transaksi WHERE status_order = status_order_inp;
    END IF;
    
    SELECT total_order AS total_by_status;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stored_order` (IN `id_user_inp` INT, IN `id_menu_inp` INT, IN `id_transaksi_inp` VARCHAR(30), IN `kuantitas_inp` INT, IN `harga_barang_inp` BIGINT(20), IN `total_inp` BIGINT(20))   BEGIN
    INSERT INTO pemesanan (id_user,id_menu,id_transaksi,kuantitas,harga_barang,total)
    VALUES (id_user_inp,id_menu_inp,id_transaksi_inp,kuantitas_inp,harga_barang_inp,total_inp);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_menu` (IN `stock_inp` INT, IN `nama_inp` VARCHAR(100), IN `category_inp` VARCHAR(25), IN `harga_inp` INT(20), IN `harga_disc_inp` INT, IN `discount_inp` INT, IN `deskripsi_inp` VARCHAR(160), IN `gambar_inp` VARCHAR(200))   BEGIN
    INSERT INTO menu (stock,nama,category,harga,harga_disc,discount,deskripsi,gambar)
    VALUES (stock_inp,nama_inp,category_inp,harga_inp,harga_disc_inp,discount_inp,deskripsi_inp,gambar_inp);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_rating` (IN `id_transaksi_inp` VARCHAR(50), IN `rate_inp` FLOAT)   BEGIN
    INSERT INTO rating (id_transaksi, rate_value)
    VALUES (id_transaksi_inp,rate_inp);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi` (IN `id_transaksi_inp` VARCHAR(30), IN `id_user_inp` INT, IN `sub_total_inp` BIGINT(20), IN `ongkir_inp` INT, IN `total_harga_inp` BIGINT(20), IN `address_inp` TEXT, IN `tgl_pesan_inp` DATE, IN `status_order_inp` VARCHAR(100))   BEGIN
    INSERT INTO transaksi (id_transaksi,id_user,sub_total,ongkir,total_harga,address,tgl_pesan,status_order)
    VALUES (id_transaksi_inp,id_user_inp,sub_total_inp,ongkir_inp,total_harga_inp,address_inp,tgl_pesan_inp,status_order_inp);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `total_terjual` ()   BEGIN
    DECLARE totalterjual BIGINT DEFAULT 0;
    DECLARE jumlahbaris INT;
    DECLARE indeks INT DEFAULT 0;
    DECLARE harga BIGINT;

    SELECT COUNT(*) INTO jumlahbaris FROM transaksi WHERE status_order = 'SUCCESS';

    WHILE indeks < jumlahbaris DO
        SELECT sub_total INTO harga 
        FROM transaksi 
        WHERE status_order = 'SUCCESS'
        LIMIT 1 OFFSET indeks;

        SET totalterjual = totalterjual + harga;

        SET indeks = indeks + 1;
    END WHILE;

    SELECT totalterjual AS totalakhir;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_inbox`
-- (See below for the actual view)
--
CREATE TABLE `badge_inbox` (
`jumlah_inbox` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_menu`
-- (See below for the actual view)
--
CREATE TABLE `badge_menu` (
`jumlah_menu` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_pending`
-- (See below for the actual view)
--
CREATE TABLE `badge_pending` (
`jumlah_pending` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_sukses`
-- (See below for the actual view)
--
CREATE TABLE `badge_sukses` (
`jumlah_sukses` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_user`
-- (See below for the actual view)
--
CREATE TABLE `badge_user` (
`jumlah_user` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `id_inbox` int(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `message` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`id_inbox`, `nama`, `email`, `message`) VALUES
(5, 'Aisyah', 'aisyah@gmail.com', 'Enak kak'),
(6, 'Rani', 'rani@gmail.com', 'nyam nyam');

-- --------------------------------------------------------

--
-- Table structure for table `log_menu_update`
--

CREATE TABLE `log_menu_update` (
  `id_log` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nama_lama` varchar(100) NOT NULL,
  `nama_baru` varchar(100) NOT NULL,
  `harga_lama` int(11) NOT NULL,
  `harga_baru` int(11) NOT NULL,
  `tanggal_ubah` date DEFAULT NULL,
  `aksi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `log_menu_update`
--

INSERT INTO `log_menu_update` (`id_log`, `id_menu`, `nama_lama`, `nama_baru`, `harga_lama`, `harga_baru`, `tanggal_ubah`, `aksi`) VALUES
(171, 33, '-', 'Nasi Goreng Spesial', 0, 15000, '2024-06-12', 'INSERT'),
(172, 34, '-', 'Salmon Teriyaki', 0, 43000, '2024-06-12', 'INSERT'),
(173, 35, '-', 'Mie Beef Teriyaki', 0, 30000, '2024-06-12', 'INSERT'),
(174, 36, '-', 'Ayam Laksa', 0, 36000, '2024-06-12', 'INSERT'),
(175, 37, '-', 'Risoles Panjang', 0, 10000, '2024-06-12', 'INSERT'),
(176, 37, 'Risoles Panjang', 'Risoles Krispi', 10000, 10000, '2024-06-12', 'UPDATE'),
(177, 38, '-', 'Beef Ribs', 0, 112000, '2024-06-12', 'INSERT'),
(178, 38, 'Beef Ribs', '-', 112000, 0, '2024-06-12', 'DELETE'),
(179, 39, '-', 'Jus Semangka', 0, 8000, '2024-06-12', 'INSERT'),
(180, 40, '-', 'Milk Coffee', 0, 10000, '2024-06-12', 'INSERT'),
(181, 41, '-', 'Kopi Chai Latte', 0, 11000, '2024-06-12', 'INSERT'),
(182, 42, '-', 'Apple Milkshake', 0, 10000, '2024-06-12', 'INSERT'),
(183, 43, '-', 'Oreo Milkshake', 0, 11000, '2024-06-12', 'INSERT'),
(184, 33, 'Nasi Goreng Spesial', 'Nasi Goreng Spesial', 15000, 15000, '2024-06-12', 'UPDATE'),
(185, 34, 'Salmon Teriyaki', 'Salmon Teriyaki', 43000, 43000, '2024-06-12', 'UPDATE'),
(186, 36, 'Ayam Laksa', 'Ayam Laksa', 36000, 36000, '2024-06-12', 'UPDATE'),
(187, 37, 'Risoles Krispi', 'Risoles Krispi', 10000, 10000, '2024-06-12', 'UPDATE'),
(188, 35, 'Mie Beef Teriyaki', 'Mie Beef Teriyaki', 30000, 30000, '2024-06-12', 'UPDATE'),
(189, 34, 'Salmon Teriyaki', 'Salmon Teriyaki', 43000, 43000, '2024-06-12', 'UPDATE'),
(190, 36, 'Ayam Laksa', 'Ayam Laksa', 36000, 36000, '2024-06-12', 'UPDATE'),
(191, 35, 'Mie Beef Teriyaki', 'Beef Teriyaki Noodle', 30000, 30000, '2024-06-12', 'UPDATE'),
(192, 33, 'Nasi Goreng Spesial', 'Nasi Goreng Spesial', 15000, 15000, '2024-06-12', 'UPDATE'),
(193, 33, 'Nasi Goreng Spesial', 'Nasi Goreng Spesial', 15000, 15000, '2024-06-12', 'UPDATE'),
(194, 33, 'Nasi Goreng Spesial', 'Nasi Goreng Spesial', 15000, 15000, '2024-06-12', 'UPDATE'),
(195, 33, 'Nasi Goreng Spesial', 'Nasi Goreng Spesial', 15000, 15000, '2024-06-12', 'UPDATE'),
(196, 33, 'Nasi Goreng Spesial', 'Nasi Goreng Spesial', 15000, 15000, '2024-06-13', 'UPDATE'),
(197, 39, 'Jus Semangka', 'Jus Semangka', 8000, 8000, '2024-06-13', 'UPDATE');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `harga` bigint(50) NOT NULL,
  `harga_disc` bigint(50) NOT NULL,
  `discount` int(11) NOT NULL,
  `deskripsi` mediumtext NOT NULL,
  `gambar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `stock`, `nama`, `category`, `harga`, `harga_disc`, `discount`, `deskripsi`, `gambar`) VALUES
(33, 50, 'Nasi Goreng Spesial', 'Makanan', 15000, 15000, 0, 'Nasi goreng spesial buatan mama', '66695327d67bd.webp'),
(34, 45, 'Salmon Teriyaki', 'Makanan', 43000, 41710, 3, 'Hidangan spesial dari salmon dengan bumbu teriyaki', '6669536e0c6cd.jpg'),
(35, 72, 'Beef Teriyaki Noodle', 'Makanan', 30000, 30000, 0, 'Mie goreng terbaik sedunia', '666953b49d4ca.jpg'),
(36, 65, 'Ayam Laksa', 'Makanan', 36000, 34200, 5, 'Ayam dengan bumbu laksa', '666953d4c76dc.jpg'),
(37, 85, 'Risoles Krispi', 'Makanan', 10000, 10000, 0, 'Risoles debesss', '6669540539927.jpg'),
(39, 86, 'Jus Semangka', 'Minuman', 8000, 8000, 0, 'Jus semangka segar', '66695612c32d8.webp'),
(40, 65, 'Milk Coffee', 'Minuman', 10000, 10000, 0, 'Kopi susu', '666956397c97c.webp'),
(41, 65, 'Kopi Chai Latte', 'Minuman', 11000, 11000, 0, 'Kopi latte', '666956540ca48.webp'),
(42, 87, 'Apple Milkshake', 'Minuman', 10000, 10000, 0, 'Milkshake dari apel', '6669567761904.webp'),
(43, 86, 'Oreo Milkshake', 'Minuman', 11000, 11000, 0, 'Milkshake oreo creamy', '66695696b7daa.webp');

--
-- Triggers `menu`
--
DELIMITER $$
CREATE TRIGGER `trigger_delete_menu` AFTER DELETE ON `menu` FOR EACH ROW BEGIN
	INSERT INTO log_menu_update SET 
	id_menu = old.id_menu, 
	nama_lama = old.nama, 
	nama_baru = "-",
	harga_lama = old.harga,
	harga_baru = "-",
	tanggal_ubah = CURRENT_TIMESTAMP,
	aksi = "DELETE";
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_insert_menu` AFTER INSERT ON `menu` FOR EACH ROW BEGIN
	INSERT INTO log_menu_update SET 
	id_menu = new.id_menu, 
	nama_lama = "-", 
	nama_baru = new.nama,
	harga_lama = "-",
	harga_baru = new.harga,
	tanggal_ubah = CURRENT_TIMESTAMP,
	aksi = "INSERT";
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_update_menu` AFTER UPDATE ON `menu` FOR EACH ROW BEGIN
	INSERT INTO log_menu_update SET 
	id_menu = new.id_menu, 
	nama_lama = old.nama, 
	nama_baru = new.nama,
	harga_lama = old.harga,
	harga_baru = new.harga,
	tanggal_ubah = CURRENT_TIMESTAMP,
	aksi = "UPDATE";
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `menu_by_idmenu`
-- (See below for the actual view)
--
CREATE TABLE `menu_by_idmenu` (
`id_menu` int(11)
,`stock` int(11)
,`nama` varchar(255)
,`category` varchar(50)
,`harga` bigint(50)
,`harga_disc` bigint(50)
,`discount` int(11)
,`deskripsi` mediumtext
,`gambar` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_transaksi` varchar(30) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pesan`, `id_user`, `id_menu`, `id_transaksi`, `kuantitas`, `harga_barang`, `total`) VALUES
(1, 5, 33, '7123638336', 1, 15000, 15000),
(2, 5, 34, '7123638336', 2, 41710, 83420),
(3, 5, 36, '2454851673', 2, 34200, 68400),
(4, 5, 37, '6376055807', 3, 10000, 30000),
(5, 5, 35, '6661220422', 2, 30000, 60000),
(6, 5, 34, '4106238350', 1, 41710, 41710),
(7, 5, 36, '4106238350', 1, 34200, 34200),
(8, 5, 33, '2561202679', 4, 15000, 60000),
(9, 5, 39, '2561202679', 3, 8000, 24000);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `rate_value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id_rating`, `id_transaksi`, `rate_value`) VALUES
(4, '6376055807', 3.8);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `sub_total` bigint(20) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `total_harga` bigint(50) NOT NULL,
  `address` text NOT NULL,
  `tgl_pesan` date NOT NULL,
  `status_order` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_transaksi`, `id_user`, `sub_total`, `ongkir`, `total_harga`, `address`, `tgl_pesan`, `status_order`) VALUES
(1, '7123638336', 5, 98420, 8000, 106420, 'Surabaya', '2024-06-12', 'ORDERING'),
(2, '2454851673', 5, 68400, 8000, 76400, 'Surabaya', '2024-06-12', 'SUCCESS'),
(3, '6376055807', 5, 30000, 8000, 38000, 'Surabaya', '2024-06-12', 'SUCCESS'),
(4, '6661220422', 5, 60000, 8000, 68000, 'Surabaya', '2024-06-12', 'PENDING'),
(5, '4106238350', 5, 75910, 8000, 83910, 'Surabaya', '2024-06-12', 'REJECTED'),
(6, '2561202679', 5, 84000, 8000, 92000, 'Surabaya', '2024-06-12', 'SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `username` char(200) NOT NULL,
  `pass` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `role`, `username`, `pass`) VALUES
(4, 'admin', 'Admin', 'admin', '$2y$10$dRmAiPUwX4Hl0at8908a5.vzMAW8Gk.5.r6oIBDoeha6zqnqb9B0.'),
(5, 'user', 'User', 'user', '$2y$10$6WtRq71U1Yc/91tAzQQLEuFoUU8bmSBhqxzmSzwChvTiShj7bBNGu'),
(6, 'ridho', 'User', 'ridhoooo', '$2y$10$HYHMaqQRB/GrhqtUXheSjuzphB6WLGNf4gqcn7LkLxmBLKI84OR0.'),
(7, 'prili', 'User', 'prilliiii', '$2y$10$HYHMaqQRB/GrhqtUXheSjuzphB6WLGNf4gqcn7LkLxmBLKI84OR0.'),
(10, 'Rezy', 'User', 'Rezy123', '$2y$10$SRgsqalu4uk3Uh9nwzbRJudF/SYs0FPgVsZsfgAWGqNEJH7FzQLD.');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_menu_makanan`
-- (See below for the actual view)
--
CREATE TABLE `view_menu_makanan` (
`id_menu` int(11)
,`stock` int(11)
,`nama` varchar(255)
,`category` varchar(50)
,`harga` bigint(50)
,`harga_disc` bigint(50)
,`discount` int(11)
,`deskripsi` mediumtext
,`gambar` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_menu_minuman`
-- (See below for the actual view)
--
CREATE TABLE `view_menu_minuman` (
`id_menu` int(11)
,`stock` int(11)
,`nama` varchar(255)
,`category` varchar(50)
,`harga` bigint(50)
,`harga_disc` bigint(50)
,`discount` int(11)
,`deskripsi` mediumtext
,`gambar` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`id_user` int(11)
,`nama` varchar(200)
,`role` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vinbox`
-- (See below for the actual view)
--
CREATE TABLE `vinbox` (
`id_inbox` int(20)
,`nama` varchar(100)
,`email` varchar(150)
,`message` mediumtext
);

-- --------------------------------------------------------

--
-- Structure for view `badge_inbox`
--
DROP TABLE IF EXISTS `badge_inbox`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_inbox`  AS SELECT count(`inbox`.`id_inbox`) AS `jumlah_inbox` FROM `inbox` ;

-- --------------------------------------------------------

--
-- Structure for view `badge_menu`
--
DROP TABLE IF EXISTS `badge_menu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_menu`  AS SELECT count(`menu`.`id_menu`) AS `jumlah_menu` FROM `menu` ;

-- --------------------------------------------------------

--
-- Structure for view `badge_pending`
--
DROP TABLE IF EXISTS `badge_pending`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_pending`  AS SELECT count(`transaksi`.`id_transaksi`) AS `jumlah_pending` FROM `transaksi` WHERE `transaksi`.`status_order` = 'ORDERING' OR `transaksi`.`status_order` = 'PENDING' ;

-- --------------------------------------------------------

--
-- Structure for view `badge_sukses`
--
DROP TABLE IF EXISTS `badge_sukses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_sukses`  AS SELECT count(`transaksi`.`id_transaksi`) AS `jumlah_sukses` FROM `transaksi` WHERE `transaksi`.`status_order` = 'SUCCESS' ;

-- --------------------------------------------------------

--
-- Structure for view `badge_user`
--
DROP TABLE IF EXISTS `badge_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_user`  AS SELECT count(`user`.`id_user`) AS `jumlah_user` FROM `user` ;

-- --------------------------------------------------------

--
-- Structure for view `menu_by_idmenu`
--
DROP TABLE IF EXISTS `menu_by_idmenu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu_by_idmenu`  AS SELECT `menu`.`id_menu` AS `id_menu`, `menu`.`stock` AS `stock`, `menu`.`nama` AS `nama`, `menu`.`category` AS `category`, `menu`.`harga` AS `harga`, `menu`.`harga_disc` AS `harga_disc`, `menu`.`discount` AS `discount`, `menu`.`deskripsi` AS `deskripsi`, `menu`.`gambar` AS `gambar` FROM `menu` ORDER BY `menu`.`id_menu` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `view_menu_makanan`
--
DROP TABLE IF EXISTS `view_menu_makanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_menu_makanan`  AS SELECT `menu`.`id_menu` AS `id_menu`, `menu`.`stock` AS `stock`, `menu`.`nama` AS `nama`, `menu`.`category` AS `category`, `menu`.`harga` AS `harga`, `menu`.`harga_disc` AS `harga_disc`, `menu`.`discount` AS `discount`, `menu`.`deskripsi` AS `deskripsi`, `menu`.`gambar` AS `gambar` FROM `menu` WHERE `menu`.`category` = 'Makanan' ORDER BY `menu`.`id_menu` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `view_menu_minuman`
--
DROP TABLE IF EXISTS `view_menu_minuman`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_menu_minuman`  AS SELECT `menu`.`id_menu` AS `id_menu`, `menu`.`stock` AS `stock`, `menu`.`nama` AS `nama`, `menu`.`category` AS `category`, `menu`.`harga` AS `harga`, `menu`.`harga_disc` AS `harga_disc`, `menu`.`discount` AS `discount`, `menu`.`deskripsi` AS `deskripsi`, `menu`.`gambar` AS `gambar` FROM `menu` WHERE `menu`.`category` = 'Minuman' ORDER BY `menu`.`id_menu` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS SELECT `user`.`id_user` AS `id_user`, `user`.`nama` AS `nama`, `user`.`role` AS `role` FROM `user` ;

-- --------------------------------------------------------

--
-- Structure for view `vinbox`
--
DROP TABLE IF EXISTS `vinbox`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vinbox`  AS SELECT `inbox`.`id_inbox` AS `id_inbox`, `inbox`.`nama` AS `nama`, `inbox`.`email` AS `email`, `inbox`.`message` AS `message` FROM `inbox` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`id_inbox`);

--
-- Indexes for table `log_menu_update`
--
ALTER TABLE `log_menu_update`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `id_inbox` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_menu_update`
--
ALTER TABLE `log_menu_update`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

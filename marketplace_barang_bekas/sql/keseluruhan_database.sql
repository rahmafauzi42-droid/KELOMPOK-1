CREATE DATABASE IF NOT EXISTS `marketplace_db`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `marketplace_db`;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2026 at 04:32 PM
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
-- Database: `marketplace_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(11) NOT NULL,
  `No_Admin` varchar(30) DEFAULT NULL,
  `ID_Pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_Admin`, `No_Admin`, `ID_Pengguna`) VALUES
(1, 'AD-001', 3);

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `ID_Detail` int(11) NOT NULL,
  `ID_Transaksi` int(11) NOT NULL,
  `ID_Produk` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Status_Transaksi` varchar(30) NOT NULL,
  `Total_Pembayaran` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `ID_Laporan` int(11) NOT NULL,
  `Jenis_Laporan` varchar(100) NOT NULL,
  `Tanggal_Laporan` datetime NOT NULL DEFAULT current_timestamp(),
  `Keterangan` text DEFAULT NULL,
  `ID_Pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_Pembayaran` int(11) NOT NULL,
  `Metode_Pembayaran` varchar(50) NOT NULL,
  `Jumlah_Pembayaran` decimal(14,2) NOT NULL,
  `Status_Pembayaran` varchar(30) NOT NULL DEFAULT 'Menunggu',
  `Tanggal_Pembayaran` datetime DEFAULT NULL,
  `ID_Transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`ID_Pembayaran`, `Metode_Pembayaran`, `Jumlah_Pembayaran`, `Status_Pembayaran`, `Tanggal_Pembayaran`, `ID_Transaksi`) VALUES
(1, 'Transfer Bank', 4500000.00, 'Berhasil', '2026-11-11 12:54:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `ID_Pembeli` int(11) NOT NULL,
  `No_Pembeli` varchar(30) DEFAULT NULL,
  `ID_Pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`ID_Pembeli`, `No_Pembeli`, `ID_Pengguna`) VALUES
(1, 'PB-001', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_Pengguna` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `No_HP` varchar(20) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `Tipe_Pengguna` enum('Pembeli','Penjual','Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`ID_Pengguna`, `Nama`, `Email`, `No_HP`, `Alamat`, `Tipe_Pengguna`) VALUES
(1, 'Dafin Hazzaki', 'dafin@email.com', '081234567890', 'Jakarta Selatan', 'Penjual'),
(2, 'Bramantha Bagaskara', 'bagas@email.com', '081298765432', 'Bandung', 'Pembeli'),
(3, 'Admin Utama', 'admin@marketplace.com', '081111111111', 'Jakarta', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `ID_Pengiriman` int(11) NOT NULL,
  `Alamat_Pengiriman` text NOT NULL,
  `Kurir` varchar(100) DEFAULT NULL,
  `No_Resi` varchar(100) DEFAULT NULL,
  `Status_Pengiriman` varchar(30) NOT NULL DEFAULT 'Menunggu',
  `ID_Transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`ID_Pengiriman`, `Alamat_Pengiriman`, `Kurir`, `No_Resi`, `Status_Pengiriman`, `ID_Transaksi`) VALUES
(1, 'Jl. Melati No. 12, Bandung', 'JNE', 'JNE123456789', 'Dikirim', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjual`
--

CREATE TABLE `penjual` (
  `ID_Penjual` int(11) NOT NULL,
  `No_Penjual` varchar(30) DEFAULT NULL,
  `ID_Pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjual`
--

INSERT INTO `penjual` (`ID_Penjual`, `No_Penjual`, `ID_Pengguna`) VALUES
(1, 'PJ-001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `ID_Produk` int(11) NOT NULL,
  `Nama_Produk` varchar(150) NOT NULL,
  `Kondisi` varchar(50) NOT NULL,
  `Harga` decimal(12,2) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Lokasi` varchar(150) DEFAULT NULL,
  `Berat` decimal(10,2) DEFAULT NULL,
  `Atribut` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Atribut`)),
  `Metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Metadata`)),
  `ID_Kategori` int(11) NOT NULL,
  `ID_Penjual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`ID_Produk`, `Nama_Produk`, `Kondisi`, `Harga`, `Deskripsi`, `Foto`, `Lokasi`, `Berat`, `Atribut`, `Metadata`, `ID_Kategori`, `ID_Penjual`) VALUES
(1, 'iPhone 12 128GB', 'Bekas - Baik', 4500000.00, 'Mulus, baterai 87%', NULL, 'Jakarta', 0.20, NULL, NULL, 1, 1),
(2, 'Jaket Denim Levi\'s', 'Bekas - Sangat Baik', 250000.00, 'Size M, jarang dipakai', NULL, 'Bandung', 0.80, NULL, NULL, 2, 1),
(3, 'Samsung Galaxy S21', 'Bekas - Baik', 4500000.00, 'HP bekas mulus, lengkap box', 's21.jpg', 'Jakarta Selatan', 0.17, '{\"merek\": \"Samsung\", \"warna\": \"Phantom Black\", \"ram\": \"8GB\", \"penyimpanan\": \"128GB\", \"tahun_beli\": 2022, \"kelengkapan\": [\"Box\", \"Charger\", \"Kabel\"]}', '{\"rating\": 4.5, \"tags\": [\"android\", \"flagship\", \"bekas-bagus\"], \"garansi_sisa_bulan\": 3}', 1, 1),
(4, 'Samsung Galaxy S29', 'Bekas - Seperti Baru', 4500000.00, 'HP bekas mulus, lengkap box', 's29.jpg', 'Jakarta Timur', 0.29, '{\"merek\": \"Samsung\", \"warna\": \"Mid Night Blue\", \"ram\": \"16GB\", \"penyimpanan\": \"268GB\", \"tahun_beli\": 2026, \"kelengkapan\": [\"Box\", \"Charger\", \"Kabel\"]}', '{\"rating\": 5.0, \"tags\": [\"android\", \"flagship\", \"bekas-baru\"], \"garansi_sisa_bulan\": 12}', 1, 1),
(6, 'Laptop ASUS VivoBook 14', 'Bekas - Baik', 5500000.00, 'Laptop bekas mulus, masih sangat nyaman dipakai, lengkap charger', 'vivobook14.jpg', 'Surabaya', 1.40, '{\"merek\": \"ASUS\", \"processor\": \"Intel Core i5-1235U\", \"ram\": \"8GB\", \"storage\": \"512GB SSD\", \"tahun\": 2023, \"kelengkapan\": [\"Charger\", \"Box\", \"Tas\"]}', '{\"rating\": 4.6, \"tags\": [\"laptop\", \"kerja\", \"kuliah\"], \"garansi_sisa\": 4}', 2, 1),
(8, 'Laptop Lenovo IdeaPad Slim 3', 'Bekas - Baik', 4800000.00, 'Laptop bekas mulus, performa masih kencang, lengkap charger & box', 'ideapad-slim3.jpg', 'Bekasi', 1.35, '{\"merek\": \"Lenovo\", \"processor\": \"AMD Ryzen 5 5500U\", \"ram\": \"8GB\", \"storage\": \"512GB SSD\", \"ukuran_layar\": \"14 inch\", \"tahun_beli\": 2023, \"kelengkapan\": [\"Charger\", \"Box\", \"Tas Laptop\"]}', '{\"rating\": 4.6, \"tags\": [\"laptop\", \"kuliah\", \"kerja\", \"ringan\"], \"garansi_sisa_bulan\": 5}', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rekap_transaksi_pembeli`
--

CREATE TABLE `rekap_transaksi_pembeli` (
  `ID_Pembeli` int(11) NOT NULL,
  `Total_Transaksi` int(11) DEFAULT 0,
  `Total_Barang_Dibeli` int(11) DEFAULT 0,
  `Total_Pembayaran` decimal(14,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `ID_Stok` int(11) NOT NULL,
  `ID_Produk` int(11) NOT NULL,
  `Jumlah_Awal` int(11) NOT NULL DEFAULT 0,
  `Jumlah_Terjual` int(11) NOT NULL DEFAULT 0,
  `Jumlah_Tersedia` int(11) GENERATED ALWAYS AS (`Jumlah_Awal` - `Jumlah_Terjual`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`ID_Stok`, `ID_Produk`, `Jumlah_Awal`, `Jumlah_Terjual`) VALUES
(1, 1, 3, 0),
(2, 2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_Transaksi` int(11) NOT NULL,
  `Tanggal_Transaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `Jumlah` int(11) NOT NULL,
  `Harga` decimal(12,2) NOT NULL,
  `ID_Pembeli` int(11) NOT NULL,
  `ID_Penjual` int(11) NOT NULL,
  `ID_Produk` int(11) NOT NULL,
  `Status_Transaksi` varchar(30) NOT NULL DEFAULT 'Menunggu',
  `Total_Pembayaran` decimal(14,2) GENERATED ALWAYS AS (`Jumlah` * `Harga`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_Transaksi`, `Tanggal_Transaksi`, `Jumlah`, `Harga`, `ID_Pembeli`, `ID_Penjual`, `ID_Produk`, `Status_Transaksi`) VALUES
(1, '2026-11-11 12:54:13', 1, 4500000.00, 1, 1, 1, 'Selesai'),
(2, '2026-11-11 12:54:13', 1, 250000.00, 1, 1, 2, 'Menunggu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD UNIQUE KEY `ID_Pengguna` (`ID_Pengguna`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`ID_Detail`),
  ADD KEY `ID_Transaksi` (`ID_Transaksi`),
  ADD KEY `ID_Produk` (`ID_Produk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`ID_Laporan`),
  ADD KEY `ID_Pengguna` (`ID_Pengguna`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD UNIQUE KEY `ID_Transaksi` (`ID_Transaksi`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`ID_Pembeli`),
  ADD UNIQUE KEY `ID_Pengguna` (`ID_Pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_Pengguna`),
  ADD UNIQUE KEY `Email` (`Email`);

--
  ADD KEY `fk_produk_penjual` (`ID_Penjual`),
  ADD KEY `idx_produk_nama` (`Nama_Produk`),
  ADD KEY `idx_produk_lokasi` (`Lokasi`),
  ADD KEY `idx_produk_harga` (`Harga`),
  ADD KEY `idx_produk_lokasi_harga` (`Lokasi`,`Harga`),
  ADD KEY `idx_produk_penjual` (`ID_Penjual`);

--
-- Indexes for table `rekap_transaksi_pembeli`
--
ALTER TABLE `rekap_transaksi_pembeli`
  ADD PRIMARY KEY (`ID_Pembeli`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`ID_Stok`),
  ADD UNIQUE KEY `ID_Produk` (`ID_Produk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_Transaksi`),
  ADD KEY `ID_Pembeli` (`ID_Pembeli`),
  ADD KEY `ID_Penjual` (`ID_Penjual`),
  ADD KEY `ID_Produk` (`ID_Produk`),
  ADD KEY `idx_transaksi_status` (`Status_Transaksi`),
  ADD KEY `idx_transaksi_tanggal` (`Tanggal_Transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `ID_Detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `ID_Kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `ID_Laporan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `ID_Pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `ID_Pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `ID_Pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `ID_Pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penjual`
--
ALTER TABLE `penjual`
  MODIFY `ID_Penjual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `ID_Produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `ID_Stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_Transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID_Pengguna`) REFERENCES `pengguna` (`ID_Pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`ID_Produk`) REFERENCES `produk` (`ID_Produk`);

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`ID_Pengguna`) REFERENCES `pengguna` (`ID_Pengguna`) ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`) ON UPDATE CASCADE;

--
-- Constraints for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD CONSTRAINT `pembeli_ibfk_1` FOREIGN KEY (`ID_Pengguna`) REFERENCES `pengguna` (`ID_Pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`) ON UPDATE CASCADE;

--
-- Constraints for table `penjual`
--
ALTER TABLE `penjual`
  ADD CONSTRAINT `penjual_ibfk_1` FOREIGN KEY (`ID_Pengguna`) REFERENCES `pengguna` (`ID_Pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_produk_kategori` FOREIGN KEY (`ID_Kategori`) REFERENCES `kategori` (`ID_Kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produk_penjual` FOREIGN KEY (`ID_Penjual`) REFERENCES `penjual` (`ID_Penjual`) ON UPDATE CASCADE;

--
-- Constraints for table `rekap_transaksi_pembeli`
--
ALTER TABLE `rekap_transaksi_pembeli`
  ADD CONSTRAINT `rekap_transaksi_pembeli_ibfk_1` FOREIGN KEY (`ID_Pembeli`) REFERENCES `pembeli` (`ID_Pembeli`);

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`ID_Produk`) REFERENCES `produk` (`ID_Produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_Pembeli`) REFERENCES `pembeli` (`ID_Pembeli`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_Penjual`) REFERENCES `penjual` (`ID_Penjual`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`ID_Produk`) REFERENCES `produk` (`ID_Produk`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

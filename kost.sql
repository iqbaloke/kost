-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2020 at 11:27 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kost`
--

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `namaproduk` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `id_users` int(11) DEFAULT NULL,
  `datecreate` datetime DEFAULT NULL,
  `lokasi` text NOT NULL,
  `no_hp` text NOT NULL,
  `nama_pemilik` text NOT NULL,
  `keterangan` text NOT NULL,
  `level` int(11) NOT NULL,
  `fasilitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `namaproduk`, `qty`, `harga`, `image`, `deskripsi`, `id_users`, `datecreate`, `lokasi`, `no_hp`, `nama_pemilik`, `keterangan`, `level`, `fasilitas`) VALUES
(87, 'Hasbun', 1, 600000, '10052020141521kosthasbun.jpg', 'kosong', 1, '2020-05-10 19:15:21', 'palembang, seberang Ulu II Palembang', '', 'Kost Bu Nova', ' kostan khusus putri siap huni. Lokasi strategis dekat Pertamina Plaju , Pusat \r\nperbelanjaan dan kampus', 1, 'Kloset Duduk , kamar mandi luar, akses 24 jam'),
(88, 'bedeng pink', 1, 6000000, '10052020143321kostpink.jpg', 'kosong', 1, '2020-05-10 19:33:21', 'lorong aur gading, silaberanti,kecamatan seberang ulu 1', '', 'Kost Bu Nova', ' Tersedia 40 kamar dengan masing-masing kamar memiliki luas 3x2 dan kamar mandi di dalam kemudian listrik token dan air sudah lancar, tersedia juga parkiran untuk motor yang bisa menampung hampir 20 motor dengan juga disediakan parkiran untuk tamu. Campur cewek cowok Untuk biaya sewa pertahun 6juta termasuk air. \r\n \r\n ', 2, ''),
(95, 'Kost LA Jakabaring Tipe B Seberang Ulu I Palembang', 1, 2000000, '10052020151419kos3.jpg', 'kosong', 1, '2020-05-10 20:14:19', 'Perumahan TOP 100 Blok A1 Nomor 2 Jakabaring Seberang Ulu I', '', 'Mami Kost', 'La kost tersedia 10 kamar dengan suasana nyaman fasilitas lengkap di lengkapi wi fi cctv 24 jam. dekat dengan pasar induk lokasi strategis dekat dengan jalan utama. dengan luas kamar 3x4 kamar mandi di dalam. Tersedia juga tempat parkir mobil dan motor yang luas. Campur untuk cewek cowok. harga kost perbulan', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `hp` text NOT NULL,
  `level` int(11) NOT NULL,
  `datecreate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `hp`, `level`, `datecreate`) VALUES
(1, 'p1', 'percobaan1@gmail.com', '28c376610511e0de8232021cb672a5d5', '202cb962ac59075b964b07152d234b70', 0, '2020-04-10 07:33:10'),
(2, '', 'percobaan2@gmail.com', 'c18ea5b1d8c46eb03f17cc10d857eef1', '202cb962ac59075b964b07152d234b70', 2, '2020-04-10 07:35:55'),
(3, 'p2', 'percobaan2@gmail.com', 'c18ea5b1d8c46eb03f17cc10d857eef1', '202cb962ac59075b964b07152d234b70', 0, '2020-04-10 07:36:11'),
(4, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '202cb962ac59075b964b07152d234b70', 1, '2020-04-10 07:38:53'),
(5, 'percobaan', '10', 'c81e728d9d4c2f636f067f89cc14862c', 'a87ff679a2f3e71d9181a67b7542122c', 0, '2020-04-10 18:54:05'),
(6, 'hsjz', 'uaua', 'abd914e64e381c8c72a167d93a1e9407', '2a87329ecacdd049c42d05cdc4d24731', 0, '2020-04-11 00:05:06'),
(7, 'user', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'f52854cc99ae1c1966b0a21d0127975b', 2, '2020-05-02 15:50:01'),
(8, 'user2', 'user2', '7e58d63b60197ceb55a1c487989a3720', '52627', 2, '2020-05-02 16:02:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `id_user` (`id_users`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 05:16 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `invoices_tbl`
--

CREATE TABLE `invoices_tbl` (
  `id` bigint(30) NOT NULL,
  `invoice_code` varchar(50) NOT NULL,
  `customer` text NOT NULL,
  `cashier` text NOT NULL,
  `total_amount` float(12,2) NOT NULL,
  `discount_percentage` float NOT NULL,
  `discount_amount` float(12,2) NOT NULL,
  `tendered_amount` float(12,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices_tbl`
--

INSERT INTO `invoices_tbl` (`id`, `invoice_code`, `customer`, `cashier`, `total_amount`, `discount_percentage`, `discount_amount`, `tendered_amount`, `created_at`, `updated_at`) VALUES
(1, '1001', 'Guest', 'Cashier 1', 3668.57, 2, 73.37, 3600.00, '2023-11-15 15:27:30', NULL),
(2, '1002', 'Guest', 'Cashier 1', 1145.55, 10, 114.56, 1100.00, '2023-11-15 16:31:07', NULL),
(3, '1003', 'Guest', 'Cashier 1', 551.75, 10, 55.18, 500.00, '2023-11-15 16:34:52', NULL),
(4, '1004', 'John Smith', 'Cashier 1', 1114.30, 20, 222.86, 1000.00, '2023-11-15 16:48:59', NULL),
(5, '001', 'Rizki Agung Sentosa', 'Cashier 1', 20000.00, 0, 0.00, 0.00, '2024-01-10 10:53:03', NULL),
(6, '001', 'Rizki Agung Sentosa', 'Cashier 3', 2000.00, 0, 0.00, 0.00, '2024-01-10 10:56:34', NULL),
(7, '001', 'Rizki Agung Sentosa', 'Cashier 3', 11.00, 0, 0.00, 0.00, '2024-01-10 10:57:06', NULL),
(8, '001', 'Rizki Agung Sentosa', 'Cashier 3', 12221.00, 0, 0.00, 0.00, '2024-01-10 10:57:58', NULL),
(9, '001', 'Rizki Agung Sentosa', 'Cashier 3', 10000.00, 0, 0.00, 0.00, '2024-01-10 10:58:23', NULL),
(10, '0001', 'Rizki', 'Cashier 3', 10000.00, 0, 0.00, 0.00, '2024-01-10 10:58:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_meta_tbl`
--

CREATE TABLE `invoice_meta_tbl` (
  `id` bigint(30) NOT NULL,
  `invoice_id` bigint(30) NOT NULL,
  `item` text NOT NULL,
  `price` float(12,2) NOT NULL,
  `qty` float NOT NULL,
  `unit` varchar(50) NOT NULL,
  `total` float(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_meta_tbl`
--

INSERT INTO `invoice_meta_tbl` (`id`, `invoice_id`, `item`, `price`, `qty`, `unit`, `total`) VALUES
(1, 1, 'Sample 1', 375.99, 3, 'pcs', 1127.97),
(2, 1, 'Sample 2', 635.15, 4, 'pcs', 2540.60),
(3, 2, 'Sample 101', 88.99, 5, 'pcs', 444.95),
(4, 2, 'Sample 102', 175.15, 4, 'pcs', 700.60),
(5, 3, 'Sample 101', 88.00, 2, 'pcs', 176.00),
(6, 3, 'Sample 102', 75.15, 5, 'pcs', 375.75),
(7, 4, 'Sample 101', 57.89, 5, 'pcs', 289.45),
(8, 4, 'Sample 102', 54.99, 15, 'pcs', 824.85),
(9, 5, '1000 Followers Instagram', 10000.00, 1, '1', 10000.00),
(10, 5, '1000 Like Instagram', 10000.00, 1, '1', 10000.00),
(11, 6, '2', 1000.00, 2, '2', 2000.00),
(12, 7, '11111', 11.00, 1, 'pcs1', 11.00),
(13, 8, '1', 1111.00, 11, 'pcs1', 12221.00),
(14, 9, '1111', 10000.00, 1, 'pcs1', 10000.00),
(15, 10, 'Instagram Followers', 10000.00, 1, '1', 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `settings_tbl`
--

CREATE TABLE `settings_tbl` (
  `id` int(11) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings_tbl`
--

INSERT INTO `settings_tbl` (`id`, `meta_field`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 'store_name', 'Dev Rizkiagungid', '2023-11-15 15:37:40', '2024-01-10 10:55:29'),
(2, 'store_address', 'Indonesia, Jawa barat, Kab.Bogor, 16610', '2023-11-15 15:37:40', '2024-01-10 10:55:29'),
(3, 'store_contact', '+62  812-9005-3660', '2023-11-15 15:37:40', '2024-01-10 10:55:29'),
(4, 'footer_note', 'Terima kasih sudah melakukan transaksi dengan @rizkiagung.id\r\n\r\nHarap melakukan pembayaran sebagai berikut:\r\n*silahkan pilih salah satu.\r\n\r\n- 081290053660 ( Dana )', '2023-11-15 15:37:40', '2024-01-10 10:55:29');

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `id` int(255) NOT NULL,
  `namaweb` varchar(255) NOT NULL,
  `deskripsiweb` varchar(255) NOT NULL,
  `kontakweb` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`id`, `namaweb`, `deskripsiweb`, `kontakweb`) VALUES
(1, '@rizkiagung.id', 'Creator Invoice Payment', '081290053660');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoices_tbl`
--
ALTER TABLE `invoices_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_meta_tbl`
--
ALTER TABLE `invoice_meta_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id_fk` (`invoice_id`);

--
-- Indexes for table `settings_tbl`
--
ALTER TABLE `settings_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoices_tbl`
--
ALTER TABLE `invoices_tbl`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_meta_tbl`
--
ALTER TABLE `invoice_meta_tbl`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings_tbl`
--
ALTER TABLE `settings_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_meta_tbl`
--
ALTER TABLE `invoice_meta_tbl`
  ADD CONSTRAINT `invoice_id_fk` FOREIGN KEY (`invoice_id`) REFERENCES `invoices_tbl` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

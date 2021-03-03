-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021 m. Kov 03 d. 12:16
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jorksyro_terjerai`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `suniukai`
--

CREATE TABLE `suniukai` (
  `id` int(100) NOT NULL,
  `Lytis` varchar(10) COLLATE utf32_lithuanian_ci NOT NULL,
  `Gimimo_data` date NOT NULL,
  `Tevas` varchar(225) COLLATE utf32_lithuanian_ci NOT NULL,
  `Mama` varchar(225) COLLATE utf32_lithuanian_ci NOT NULL,
  `Defektai` varchar(255) COLLATE utf32_lithuanian_ci NOT NULL,
  `Paskirtis` varchar(255) COLLATE utf32_lithuanian_ci NOT NULL,
  `Kaina` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `suniukai`
--

INSERT INTO `suniukai` (`id`, `Lytis`, `Gimimo_data`, `Tevas`, `Mama`, `Defektai`, `Paskirtis`, `Kaina`) VALUES
(1, 'Patinas', '2021-01-27', 'Lietuvos, Rusijos, Latvijos čempionas', 'Lietuvos čempionė', 'Nėra', 'Parodoms', 1500),
(3, 'Kalytė', '2021-01-27', 'Lietuvos, rusijos, Latvijos čempionas', 'Lietuvos čempionė', 'Nėra', 'Parodoms', 1700),
(4, 'Kalytė', '2021-02-05', 'Lietuvos, Rusijos, Latvijos čempionas', '2019 metų Pasaulio čempionė', 'Nėra', 'Parodoms', 2500),
(38, 'KalytÄ', '2021-02-05', 'Lietuvos Äempionas', 'Lietuvos cemp', 'Kreivi dantukai', 'Namams', 500),
(40, 'Patinas', '2021-01-17', 'Be dokumentu', 'Be dokumentu', 'per didelis svoris', 'Namams', 300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `suniukai`
--
ALTER TABLE `suniukai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `suniukai`
--
ALTER TABLE `suniukai`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

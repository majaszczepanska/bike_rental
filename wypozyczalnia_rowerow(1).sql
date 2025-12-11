-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 12, 2023 at 11:10 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wypozyczalnia_rowerow`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `historia_zmian_klienta`
--

CREATE TABLE `historia_zmian_klienta` (
  `id_zmiany` int(10) NOT NULL,
  `id_klienta` int(10) NOT NULL,
  `nazwa_pola_zmienionego` varchar(100) NOT NULL,
  `wartosc_pola_przed` varchar(200) NOT NULL,
  `wartosc_pola_po` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kliecni`
--

CREATE TABLE `kliecni` (
  `id_klienta` int(10) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(200) NOT NULL,
  `adres_email` varchar(100) NOT NULL,
  `nr_telefonu` int(20) NOT NULL,
  `data_rejestracji` datetime(6) NOT NULL,
  `pesel` int(20) NOT NULL,
  `aktywny` char(1) NOT NULL,
  `dluznik` char(1) NOT NULL,
  `uwierzytelniony` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `naprawy`
--

CREATE TABLE `naprawy` (
  `id_naprawy` int(10) NOT NULL,
  `id_roweru` int(10) NOT NULL,
  `id_serwisu` int(10) NOT NULL,
  `data_naprawy` datetime(6) NOT NULL,
  `nazwa_naprawy` varchar(200) NOT NULL,
  `koszt_naprawy(zl)` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operacje`
--

CREATE TABLE `operacje` (
  `id_operacji` int(10) NOT NULL,
  `id_klienta` int(10) NOT NULL,
  `id_roweru` int(10) NOT NULL,
  `id_wypozyczalni_poczatkowej` int(10) NOT NULL,
  `id_wypozyczalni_koncowej` int(10) NOT NULL,
  `data_godzina_wypozyczenia` datetime(6) NOT NULL,
  `data_godzina_oddania` datetime(6) NOT NULL,
  `oplata(zl)` float NOT NULL,
  `oplacone` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `promocje`
--

CREATE TABLE `promocje` (
  `id_promocji` float NOT NULL,
  `nazwa_promocji` varchar(100) NOT NULL,
  `rabat_procentowy(%)` int(5) NOT NULL,
  `data_rozpoczecia_promocji` datetime(6) NOT NULL,
  `data_zakonczenia_promocji` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rower`
--

CREATE TABLE `rower` (
  `id_roweru` int(10) NOT NULL,
  `nr_roweru` varchar(100) NOT NULL,
  `model_roweru` varchar(100) NOT NULL,
  `dostepny` char(1) NOT NULL,
  `data_zakupu` datetime(6) NOT NULL,
  `data_ostatniego_serwisu` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `serwisy`
--

CREATE TABLE `serwisy` (
  `id_serwisu` int(10) NOT NULL,
  `nazwa_serwisu` varchar(200) NOT NULL,
  `pojemnosc_serwisu` int(20) NOT NULL,
  `lokalizacja_gps_serwisu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczalnie`
--

CREATE TABLE `wypozyczalnie` (
  `id_wypozyczalni` int(10) NOT NULL,
  `nazwa_wypozyczalni` int(200) NOT NULL,
  `pojemnosc_wypozyczalni` int(20) NOT NULL,
  `lokalizacja_gps_wypozyczalni` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `historia_zmian_klienta`
--
ALTER TABLE `historia_zmian_klienta`
  ADD PRIMARY KEY (`id_zmiany`),
  ADD KEY `historia_zmian_klienta_ibfk_1` (`id_klienta`);

--
-- Indeksy dla tabeli `kliecni`
--
ALTER TABLE `kliecni`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `naprawy`
--
ALTER TABLE `naprawy`
  ADD PRIMARY KEY (`id_naprawy`),
  ADD KEY `id_serwisu` (`id_serwisu`),
  ADD KEY `id_roweru` (`id_roweru`);

--
-- Indeksy dla tabeli `operacje`
--
ALTER TABLE `operacje`
  ADD PRIMARY KEY (`id_operacji`),
  ADD KEY `id_klienta` (`id_klienta`),
  ADD KEY `id_roweru` (`id_roweru`),
  ADD KEY `id_wypozyczalni_koncowej` (`id_wypozyczalni_koncowej`),
  ADD KEY `id_wypozyczalni_poczatkowej` (`id_wypozyczalni_poczatkowej`),
  ADD KEY `oplata(zl)` (`oplata(zl)`);

--
-- Indeksy dla tabeli `promocje`
--
ALTER TABLE `promocje`
  ADD PRIMARY KEY (`id_promocji`);

--
-- Indeksy dla tabeli `rower`
--
ALTER TABLE `rower`
  ADD PRIMARY KEY (`id_roweru`);

--
-- Indeksy dla tabeli `serwisy`
--
ALTER TABLE `serwisy`
  ADD PRIMARY KEY (`id_serwisu`);

--
-- Indeksy dla tabeli `wypozyczalnie`
--
ALTER TABLE `wypozyczalnie`
  ADD PRIMARY KEY (`id_wypozyczalni`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `historia_zmian_klienta`
--
ALTER TABLE `historia_zmian_klienta`
  ADD CONSTRAINT `historia_zmian_klienta_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `kliecni` (`id_klienta`);

--
-- Constraints for table `naprawy`
--
ALTER TABLE `naprawy`
  ADD CONSTRAINT `naprawy_ibfk_1` FOREIGN KEY (`id_serwisu`) REFERENCES `serwisy` (`id_serwisu`),
  ADD CONSTRAINT `naprawy_ibfk_2` FOREIGN KEY (`id_roweru`) REFERENCES `rower` (`id_roweru`);

--
-- Constraints for table `operacje`
--
ALTER TABLE `operacje`
  ADD CONSTRAINT `operacje_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `kliecni` (`id_klienta`),
  ADD CONSTRAINT `operacje_ibfk_2` FOREIGN KEY (`id_roweru`) REFERENCES `rower` (`id_roweru`),
  ADD CONSTRAINT `operacje_ibfk_3` FOREIGN KEY (`id_wypozyczalni_koncowej`) REFERENCES `wypozyczalnie` (`id_wypozyczalni`),
  ADD CONSTRAINT `operacje_ibfk_4` FOREIGN KEY (`id_wypozyczalni_poczatkowej`) REFERENCES `wypozyczalnie` (`id_wypozyczalni`),
  ADD CONSTRAINT `operacje_ibfk_5` FOREIGN KEY (`oplata(zl)`) REFERENCES `promocje` (`id_promocji`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

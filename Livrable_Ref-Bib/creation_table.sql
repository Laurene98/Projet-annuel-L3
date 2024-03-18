-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 05 avr. 2023 à 15:50
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nomen`
--

-- --------------------------------------------------------

--
-- Structure de la table `authors`
--

CREATE TABLE `Reference_authors` (
  `Author_NO` int(11) NOT NULL,
  `Name_Author` varchar(100) NOT NULL,
  `Author_Initial` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reference_title`
--

CREATE TABLE `Reference_title` (
  `REF_NO` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Publ_IN` int(11) DEFAULT NULL,
  `TITLE` varchar(500) NOT NULL,
  `JOURNAL` varchar(200) NOT NULL,
  `PAGES` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `written_by`
--

CREATE TABLE `Reference_written_by` (
  `Rank` int(11) NOT NULL,
  `Author_NO` int(11) DEFAULT NULL,
  `REF_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authors`
--
ALTER TABLE `Reference_authors`
  ADD PRIMARY KEY (`Author_NO`);

--
-- Index pour la table `reference_title`
--
ALTER TABLE `Rreference_title`
  ADD PRIMARY KEY (`REF_NO`);

--
-- Index pour la table `written_by`
--
ALTER TABLE `Reference_written_by`
  ADD KEY `Author_NO` (`Author_NO`),
  ADD KEY `REF_NO` (`REF_NO`);

--
-- Contraintes pour les tables déchargées
--
--
-- Contraintes pour la table `written_by`
--
ALTER TABLE `Reference_written_by`
  ADD CONSTRAINT `Author_NO` FOREIGN KEY (`Author_NO`) REFERENCES `Reference_authors` (`Author_NO`),
  ADD CONSTRAINT `REF_NO` FOREIGN KEY (`REF_NO`) REFERENCES `Reference_title` (`REF_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

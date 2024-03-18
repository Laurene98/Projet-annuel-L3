-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 11 avr. 2023 à 09:28
-- Version du serveur : 8.0.27
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aboneham`
--
CREATE DATABASE IF NOT EXISTS `aboneham` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `aboneham`;

-- --------------------------------------------------------

--
-- Structure de la table `Choix`
--

CREATE TABLE `Choix` (
  `Quantite` int NOT NULL,
  `idPanier` int NOT NULL,
  `idProduit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Choix`
--

INSERT INTO `Choix` (`Quantite`, `idPanier`, `idProduit`) VALUES
(4, 1, 2),
(1, 1, 3),
(1, 5, 2),
(3, 6, 2),
(1, 8, 3),
(42, 10, 3),
(1, 3, 13),
(10, 7, 3),
(3, 7, 13),
(10, 12, 2),
(21, 13, 14),
(100, 14, 19),
(1, 9, 22),
(1, 9, 14),
(-1, 21, 62),
(1, 14, 15),
(5, 23, 3),
(1, 3, 16),
(50, 20, 13),
(1, 26, 3),
(1, 26, 14),
(50, 26, 13),
(1, 29, 3),
(1, 29, 15),
(2, 29, 13),
(3, 31, 14),
(1, 31, 3),
(1, 25, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Commentaire`
--

CREATE TABLE `Commentaire` (
  `idCommentaire` int NOT NULL,
  `idProduit` int DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL,
  `Commentaire` varchar(300) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Commentaire`
--

INSERT INTO `Commentaire` (`idCommentaire`, `idProduit`, `idService`, `idUtilisateur`, `Commentaire`) VALUES
(5, 3, NULL, 15, 'Trop cher !!'),
(6, 3, NULL, 17, 'bon'),
(7, 2, NULL, 15, 'Parfait !'),
(8, 3, NULL, 18, 'Bien... C\'est des ballons quoi !'),
(9, 2, NULL, 19, 'Bon pour fête.'),
(10, 62, NULL, 25, 'Laurène est bien moins serviable qu\'Anthéa.'),
(11, 3, NULL, 26, 'Bien'),
(12, 3, NULL, 28, 'Mauvaise qualité'),
(13, 3, NULL, 29, 'Parfait');

-- --------------------------------------------------------

--
-- Structure de la table `Conformite`
--

CREATE TABLE `Conformite` (
  `Conforme` tinyint(1) NOT NULL,
  `idProduit` int DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Conformite`
--

INSERT INTO `Conformite` (`Conforme`, `idProduit`, `idService`, `idUtilisateur`) VALUES
(1, 3, NULL, 15),
(1, 3, NULL, 17),
(1, 2, NULL, 15),
(1, 3, NULL, 18),
(1, 2, NULL, 19),
(1, 62, NULL, 25),
(1, 3, NULL, 26),
(0, 3, NULL, 28),
(1, 3, NULL, 29);

-- --------------------------------------------------------

--
-- Structure de la table `Favoris`
--

CREATE TABLE `Favoris` (
  `idProduit` int DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Note`
--

CREATE TABLE `Note` (
  `idNote` int NOT NULL,
  `Note` int NOT NULL,
  `idProduit` int DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Note`
--

INSERT INTO `Note` (`idNote`, `Note`, `idProduit`, `idService`, `idUtilisateur`) VALUES
(11, 2, 3, NULL, 15),
(12, 4, 3, NULL, 17),
(13, 5, 2, NULL, 15),
(14, 4, 3, NULL, 18),
(15, 4, 2, NULL, 19),
(16, 3, 62, NULL, 25),
(17, 4, 3, NULL, 26),
(18, 2, 3, NULL, 28),
(19, 5, 3, NULL, 29);

-- --------------------------------------------------------

--
-- Structure de la table `Panier`
--

CREATE TABLE `Panier` (
  `idPanier` int NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '0',
  `idUtilisateur` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Panier`
--

INSERT INTO `Panier` (`idPanier`, `valide`, `idUtilisateur`) VALUES
(1, 1, 15),
(3, 0, 1),
(5, 1, 15),
(6, 1, 15),
(7, 0, 15),
(8, 1, 17),
(9, 1, 17),
(10, 1, 18),
(11, 0, 18),
(12, 1, 19),
(13, 1, 19),
(14, 1, 19),
(15, 0, 20),
(16, 0, 21),
(17, 0, 22),
(18, 0, 23),
(19, 0, 24),
(20, 1, 17),
(21, 1, 25),
(22, 0, 25),
(23, 1, 19),
(24, 0, 19),
(25, 1, 17),
(26, 1, 26),
(27, 0, 26),
(28, 0, 27),
(29, 1, 28),
(30, 0, 28),
(31, 1, 29),
(32, 0, 29),
(33, 0, 30),
(34, 0, 17);

-- --------------------------------------------------------

--
-- Structure de la table `Photos`
--

CREATE TABLE `Photos` (
  `idPhoto` int NOT NULL,
  `Photo` blob NOT NULL,
  `idCommentaire` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `idProduit` int NOT NULL,
  `NomP` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Prix` float NOT NULL,
  `Couleur` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Theme` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Categorie` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Motif` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Taille` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Suggestion` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Produit`
--

INSERT INTO `Produit` (`idProduit`, `NomP`, `Prix`, `Couleur`, `Theme`, `Categorie`, `Motif`, `Taille`, `Suggestion`) VALUES
(2, 'Ballon (50/paquet)', 4.21, 'Plusieurs couleurs', 'Autres', 'Ballons', 'Pas_de_motif', 'Medium', 1),
(3, 'Ballon', 2.12, 'Plusieurs couleurs', 'Anniversaire', 'Ballons', 'Pas_de_motif', 'Medium', 1),
(13, 'Cendrillon', 34.99, 'Non specifie', 'Fete', 'Deguisement', 'Pas_de_motif', 'Medium', 1),
(14, 'Blanche neige', 39.99, 'Plusieurs couleurs', 'Anniversaire', 'Deguisement', 'Pas_de_motif', 'Large', 1),
(15, 'Robe courte avec paillettes manche courte', 69.99, 'Noir', 'Fete', 'Robe', 'Pas_de_motif', 'Large', 1),
(16, 'Robe courte avec paillettes manche courte', 69.99, 'Noir', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Large', 1),
(18, 'Rose (99p)', 120, 'Rouge', 'Occasion_special', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 1),
(19, 'Panier de fleurs de saison', 30, 'Plusieurs couleurs', 'Nouvel_An', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 1),
(20, 'Panier de fleurs de saison', 30, 'Plusieurs couleurs', 'Anniversaire', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 1),
(21, 'Panier de fleurs de saison', 30, 'Plusieurs couleurs', 'Fete', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(22, 'Panier de fleurs de saison', 30, 'Plusieurs couleurs', 'Occasion_special', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(24, 'Guirlande lumineuse à LED 10 mètres', 29.99, 'Blanc', 'Fete', 'Guirlandes', 'Pas_de_motif', 'Large', 0),
(25, 'Guirlande de Noël étoilé', 9.99, 'Autres', 'Noel', 'Guirlandes', 'Etoile', 'Xlarge', 0),
(26, 'Guirlande lumineuse solaire 8 modes ', 24.99, 'Plusieurs couleurs', 'Nouvel_An', 'Guirlandes', 'Pas_de_motif', 'Autres', 0),
(27, 'Guirlande lumineuse solaire 8 modes ', 24.99, 'Plusieurs couleurs', 'Anniversaire', 'Guirlandes', 'Pas_de_motif', 'Autres', 0),
(28, 'Guirlande lumineuse solaire 8 modes ', 24.99, 'Plusieurs couleurs', 'Occasion_special', 'Guirlandes', 'Pas_de_motif', 'Autres', 0),
(29, 'Guirlande lumineuse solaire 8 modes ', 24.99, 'Plusieurs couleurs', 'Autres', 'Guirlandes', 'Pas_de_motif', 'Autres', 1),
(30, 'Guirlande de fleurs en tissu pour mariage', 19.99, 'Autres', 'Autres', 'Guirlandes', 'Autres', 'Large', 0),
(31, 'Guirlande de perles blanches', 14.99, 'Blanc', 'Anniversaire', 'Guirlandes', 'Autres', 'Large', 0),
(32, 'Guirlande de perles blanches', 14.99, 'Blanc', 'Occasion_special', 'Guirlandes', 'Autres', 'Large', 0),
(33, 'Guirlande lumineuse de fées 100 LED', 12.99, 'Jaune', 'Anniversaire', 'Guirlandes', 'Autres', 'Pas_de_taille', 1),
(34, 'Guirlande lumineuse de fées 100 LED', 12.99, 'Jaune', 'Fete', 'Guirlandes', 'Autres', 'Pas_de_taille', 0),
(35, 'Guirlande lumineuse de fées 100 LED', 12.99, 'Jaune', 'Occasion_special', 'Guirlandes', 'Autres', 'Pas_de_taille', 0),
(36, 'Guirlande lumineuse de fées 100 LED', 12.99, 'Jaune', 'Autres', 'Guirlandes', 'Autres', 'Pas_de_taille', 0),
(37, 'Roses rouges', 29.99, 'Rouge', 'Occasion_special', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(38, 'Pivoines roses et blanches', 39.99, 'Plusieurs couleurs', 'Anniversaire', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 1),
(39, 'Pivoines roses et blanches', 39.99, 'Plusieurs couleurs', 'Fete', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(40, 'Pivoines roses et blanches', 39.99, 'Plusieurs couleurs', 'Autres', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(41, 'Tulipes multicolores', 24.99, 'Plusieurs couleurs', 'Fete', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(42, 'Tulipes multicolores', 24.99, 'Plusieurs couleurs', 'Occasion_special', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(43, 'Lys blancs', 34.99, 'Blanc', 'Fete', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(44, 'Lys blancs', 34.99, 'Blanc', 'Occasion_special', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(45, 'Marguerites jaunes', 19.99, 'Jaune', 'Anniversaire', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(46, 'Marguerites jaunes', 19.99, 'Jaune', 'Fete', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(47, 'Marguerites jaunes', 19.99, 'Jaune', 'Occasion_special', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(48, 'Marguerites jaunes', 19.99, 'Jaune', 'Autres', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(49, 'Chrysanthèmes oranges', 22.99, 'Orange', 'Anniversaire', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(50, 'Chrysanthèmes oranges', 22.99, 'Orange', 'Fete', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(51, 'Chrysanthèmes oranges', 22.99, 'Orange', 'Occasion_special', 'Fleurs', 'Pas_de_motif', 'Pas_de_taille', 0),
(52, 'Plafonnier LED encastré rond', 49.99, 'Non specifie', 'Autres', 'Lumieres', 'Pas_de_motif', 'Pas_de_taille', 0),
(53, 'Applique murale design en verre', 39.99, 'Non specifie', 'Autres', 'Lumieres', 'Pas_de_motif', 'Pas_de_taille', 0),
(54, 'Spot LED encastrable orientable', 12.99, 'Non specifie', 'Autres', 'Lumieres', 'Pas_de_motif', 'Pas_de_taille', 0),
(55, 'Suspension lumineuse en osier naturel', 49.99, 'Non specifie', 'Autres', 'Lumieres', 'Pas_de_motif', 'Pas_de_taille', 0),
(56, 'Applique murale en métal doré ', 29.99, 'Non specifie', 'Autres', 'Lumieres', 'Pas_de_motif', 'Pas_de_taille', 0),
(57, 'Lot de 50 ballons multicolores en latex ', 9.99, 'Plusieurs couleurs', 'Autres', 'Ballons', 'Pas_de_motif', 'Small', 0),
(58, 'Ballon géant en forme de cœur rouge', 5.99, 'Rouge', 'Fete', 'Ballons', 'Autres', 'Xlarge', 0),
(59, 'Ballon géant en forme de cœur rouge', 5.99, 'Rouge', 'Occasion_special', 'Ballons', 'Autres', 'Xlarge', 0),
(60, 'Ballon géant chiffre doré de 40 ans', 7.99, 'Autres', 'Anniversaire', 'Ballons', 'Chiffre_Lettre', 'Large', 0),
(61, 'Lot de 20 ballons pastel en latex', 4.99, 'Plusieurs couleurs', 'Autres', 'Ballons', 'Pas_de_motif', 'Medium', 0),
(62, 'Ballon géant en aluminium en forme d\'étoile dorée', 6.99, 'Autres', 'Noel', 'Ballons', 'Etoile', 'Large', 0),
(63, 'Ballon géant en aluminium en forme d\'étoile dorée', 6.99, 'Autres', 'Nouvel_An', 'Ballons', 'Etoile', 'Large', 0),
(64, 'Ballon géant en aluminium en forme d\'étoile dorée', 6.99, 'Autres', 'Anniversaire', 'Ballons', 'Etoile', 'Large', 0),
(65, 'Ballon géant en aluminium en forme d\'étoile dorée', 6.99, 'Autres', 'Fete', 'Ballons', 'Etoile', 'Large', 0),
(66, 'Ballon géant en aluminium en forme d\'étoile dorée', 6.99, 'Autres', 'Occasion_special', 'Ballons', 'Etoile', 'Large', 0),
(67, 'Ballon géant en aluminium en forme d\'étoile dorée', 6.99, 'Autres', 'Autres', 'Ballons', 'Etoile', 'Large', 0),
(68, 'Kit de ballons blancs et dorés pour mariage', 12.99, 'Plusieurs couleurs', 'Occasion_special', 'Ballons', 'Pas_de_motif', 'Pas_de_taille', 0),
(69, 'Ballon géant en aluminium en forme de licorne', 8.99, 'Non specifie', 'Anniversaire', 'Ballons', 'Autres', 'Xlarge', 0),
(70, 'Ballon géant en aluminium en forme de licorne', 8.99, 'Non specifie', 'Occasion_special', 'Ballons', 'Autres', 'Xlarge', 0),
(71, 'Ballon géant en aluminium en forme de licorne', 8.99, 'Non specifie', 'Anniversaire', 'Ballons', 'Autres', 'Xlarge', 0),
(72, 'Ballon géant en aluminium en forme de licorne', 8.99, 'Non specifie', 'Occasion_special', 'Ballons', 'Autres', 'Xlarge', 0),
(73, 'Ballon géant en aluminium en forme de lettre \"HAPPY BIRTHDAY\"', 9.99, 'Autres', 'Anniversaire', 'Ballons', 'Chiffre_Lettre', 'Large', 0),
(74, 'Robe longue en dentelle noire', 149.99, 'Noir', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Small', 0),
(75, 'Robe fourreau rouge en satin', 199.99, 'Rouge', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Medium', 0),
(76, 'Robe bustier rose poudré avec jupe évasée', 179.99, 'Rose', 'Fete', 'Robe', 'Pas_de_motif', 'Medium', 0),
(77, 'Robe bustier rose poudré avec jupe évasée', 179.99, 'Rose', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Medium', 0),
(78, 'Robe sirène en mousseline de soie bleue', 229.99, 'Bleu', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Medium', 0),
(79, 'Robe à sequins dorés encolure en V ', 149.99, 'Autres', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Large', 0),
(80, 'Robe bustier noire avec jupe plissée', 139.99, 'Noir', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Medium', 0),
(81, 'Robe longue en mousseline de soie vert émeraude', 189.99, 'Vert', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Small', 0),
(82, 'Robe longue en crêpe bleu marine avec dos décolleté', 209.99, 'Bleu', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Medium', 0),
(83, 'Costume slim fit en laine bleu marine', 299.99, 'Bleu', 'Occasion_special', 'Costume', 'Pas_de_motif', 'Medium', 0),
(84, 'Costume trois pièces gris anthracite en laine mélangée', 349.99, 'Autres', 'Occasion_special', 'Costume', 'Pas_de_motif', 'Large', 0),
(85, 'Costume en lin beige avec veste à deux boutons', 259.99, 'Autres', 'Occasion_special', 'Costume', 'Pas_de_motif', 'Medium', 0),
(86, 'Costume croisé en laine noire avec revers en satin', 399.99, 'Noir', 'Occasion_special', 'Costume', 'Pas_de_motif', 'Medium', 0),
(87, 'Costume trois pièces en tweed marron', 329.99, 'Autres', 'Occasion_special', 'Costume', 'Pas_de_motif', 'Medium', 0),
(88, 'Costume en flanelle de laine grise avec gilet assorti ', 389.99, 'Autres', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Large', 0),
(89, 'Costume en coton bleu clair avec veste croisée', 279.99, 'Bleu', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Large', 0),
(90, 'Costume deux pièces en laine noire avec revers cranté', 319.99, 'Noir', 'Occasion_special', 'Costume', 'Pas_de_motif', 'Xsmall', 0),
(91, 'Costume en velours côtelé bleu avec gilet', 379.99, 'Bleu', 'Occasion_special', 'Robe', 'Pas_de_motif', 'Xlarge', 0),
(92, 'Costume trois pièces en laine rayée marron', 359.99, 'Autres', 'Occasion_special', 'Costume', 'Pas_de_motif', 'Small', 0),
(93, 'Pirate avec chapeau et épée', 39.99, 'Plusieurs couleurs', 'Anniversaire', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(94, 'Pirate avec chapeau et épée', 39.99, 'Plusieurs couleurs', 'Fete', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(95, 'Super-héros avec cape et masque', 29.99, 'Plusieurs couleurs', 'Fete', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(96, 'Super-héros avec cape et masque', 29.99, 'Plusieurs couleurs', 'Occasion_special', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(97, 'Super-héros avec cape et masque', 29.99, 'Plusieurs couleurs', 'Autres', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(98, 'Sorcière avec chapeau pointu et balai ', 24.99, 'Noir', 'Fete', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(99, 'Zombie avec maquillage et faux sang', 34.99, 'Non specifie', 'Fete', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(100, 'Zombie avec maquillage et faux sang', 34.99, 'Non specifie', 'Occasion_special', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(101, 'Princesse avec robe et couronne', 49.98, 'Non specifie', 'Fete', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(102, 'Princesse avec robe et couronne', 49.98, 'Non specifie', 'Occasion_special', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(103, 'Chevalier avec armure en plastique ', 39.99, 'Non specifie', 'Occasion_special', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(104, 'Chevalier avec armure en plastique ', 39.99, 'Non specifie', 'Autres', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(105, 'Cow-boy avec chapeau et revolver en plastique', 29.99, 'Non specifie', 'Autres', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(106, 'Licorne avec combinaison et corne sur la tête ', 44.99, 'Non specifie', 'Autres', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(107, 'Squelette avec combinaison et cagoule', 24.99, 'Non specifie', 'Autres', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(108, 'Dinosaure avec combinaison et queue', 34.99, 'Non specifie', 'Autres', 'Deguisement', 'Pas_de_motif', 'Pas_de_taille', 0),
(109, 'Fontaine de chocolat pour le dessert ', 39.99, 'Non specifie', 'Noel', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(110, 'Fontaine de chocolat pour le dessert ', 39.99, 'Non specifie', 'Anniversaire', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(111, 'Fontaine de chocolat pour le dessert ', 39.99, 'Non specifie', 'Fete', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(112, 'Fontaine de chocolat pour le dessert ', 39.99, 'Non specifie', 'Occasion_special', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(113, 'Machine à barbe à papa pour les gourmands', 49.99, 'Non specifie', 'Autres', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(114, 'Machine à pop-corn', 34.99, 'Non specifie', 'Autres', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(115, 'Set de musique karaoké', 79.99, 'Non specifie', 'Autres', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(116, 'Machine à fumée', 39.99, 'Non specifie', 'Autres', 'Autres', 'Pas_de_motif', 'Pas_de_taille', 0),
(117, 'bbbb', 0.02, 'Non specifie', 'Fete', 'Non_specifie', 'Pas_de_motif', 'Pas_de_taille', 0),
(118, 'ff', 0.04, 'Non specifie', 'Fete', 'Non_specifie', 'Pas_de_motif', 'Pas_de_taille', 0);

-- --------------------------------------------------------

--
-- Structure de la table `Recommandation`
--

CREATE TABLE `Recommandation` (
  `Recommande` tinyint(1) NOT NULL,
  `idProduit` int DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Recommandation`
--

INSERT INTO `Recommandation` (`Recommande`, `idProduit`, `idService`, `idUtilisateur`) VALUES
(0, 3, NULL, 15),
(1, 3, NULL, 17),
(1, 2, NULL, 15),
(1, 3, NULL, 18),
(1, 2, NULL, 19),
(0, 62, NULL, 25),
(1, 3, NULL, 26),
(0, 3, NULL, 28),
(1, 3, NULL, 29);

-- --------------------------------------------------------

--
-- Structure de la table `Service`
--

CREATE TABLE `Service` (
  `idService` int NOT NULL,
  `NomC` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `PrenomC` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `EmailC` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `NomS` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CategorieS` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Type_Transport` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `Capacite` int DEFAULT NULL,
  `Localisation` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `Parking` tinyint(1) NOT NULL DEFAULT '0',
  `Gastronomie` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Regime` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Candidature` tinyint(1) NOT NULL DEFAULT '0',
  `Suggestion` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Service`
--

INSERT INTO `Service` (`idService`, `NomC`, `PrenomC`, `EmailC`, `NomS`, `CategorieS`, `Type_Transport`, `Capacite`, `Localisation`, `Parking`, `Gastronomie`, `Regime`, `Candidature`, `Suggestion`) VALUES
(1, 'Pierre', 'Erné', 'pierre_erne@galetta.com', 'Galetta', 'Traiteur', 'Non_concerne', 24, 'Paris', 1, 'Francais', 'Aucun', 1, 0),
(2, 'Gorgio', 'Gabriel', 'gabriel_gorgio@pasta.com', 'Pasta', 'Traiteur', 'Non_concerne', 50, 'Poitiers', 1, 'Italien', 'Divers', 1, 1),
(3, 'Zhang', 'Christine', 'christine_zhang@haochi.com', 'Haochi', 'Traiteur', 'Non_concerne', 123, 'Bordeaux', 1, 'Chinois', 'Divers', 1, 1),
(4, 'Lavari', 'Corentin', 'lavari.corentin@gmail.com', 'Chandelle', 'Serveur', 'Non_concerne', 12, 'Rouen', 0, 'Non_specifie', 'Aucun', 1, 0),
(5, 'Ben', 'Akouri', 'ben.akouri@gmail.com', 'Mex\'Tacos', 'Traiteur', 'Non_concerne', 20, 'Poitiers', 0, 'Mexicain', 'Divers', 1, 1),
(6, 'Gastro', 'Gaspard', 'gastro.gaspard@gmail.com', 'Gastro', 'Traiteur', 'Non_concerne', 35, 'Paris', 1, 'Francais', 'Divers', 1, 0),
(7, 'Frère', 'Jacques', 'frere.jacques@gmail.com', 'Billancourt', 'Salle_de_fete', 'Non_concerne', 200, 'Poitiers', 1, 'Non_specifie', 'Aucun', 1, 0),
(10, 'Grace', 'Manon', 'grace.manon@gmail.com', 'Grèce', 'Traiteur', 'Non_concerne', 300, 'Aubervilliers', 1, 'Italien', 'Vegetarien', 1, 1),
(13, 'Berlin', 'Maxime', 'max_o@gmail.com', 'Max\'o', 'DJ', 'Non_concerne', 0, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(14, 'Karpin', 'Momo', 'karpin.momo@gmail.com', 'Taxi Momo', 'Transport', 'Taxi', 5, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(15, 'Martin', 'Marie', 'marie.martin@abrunch.com', 'Appet\'Brunch', 'Traiteur', 'Non_concerne', 15, 'Rennes', 1, 'Autres', 'Vegetalien', 1, 0),
(16, 'Ormix', 'Bertille', 'o.bertille@gmail.com', 'Hal\'safe', 'Traiteur', 'Non_concerne', 9, 'Lyon', 0, 'Autres', 'Halal', 1, 1),
(17, 'Bruneau', 'Martin', 'martin.bruneau@yahoo.frf', 'Health\'meal', 'Traiteur', 'Non_concerne', 30, 'Havre', 0, 'Francais', 'Vegetarien', 1, 1),
(19, 'Coper', 'Karine', 'karine.coper@gmail.com', 'Karita', 'Traiteur', 'Non_concerne', 21, 'Rennes', 0, 'Mexicain', 'Vegetalien', 1, 0),
(20, 'Rosa', 'Carolina', 'caroina.rosa@hotmail.com', 'Pasta\'box', 'Traiteur', 'Non_concerne', 7, 'Paris', 0, 'Italien', 'Divers', 1, 0),
(21, 'Lay', 'Medy', 'medy.lay@gmail.com', 'Halal All', 'Traiteur', 'Non_concerne', 15, 'Poitiers', 0, 'Autres', 'Halal', 1, 0),
(22, 'Zhang', 'Elise', 'elise.zhang@lacantinechinoise.com', 'La cantine chinoise', 'Traiteur', 'Non_concerne', 24, 'Tours', 0, 'Chinois', 'Divers', 1, 0),
(23, 'Durand ', 'Elodie', 'elodie.durand@orange.fr', 'Corbeille', 'Salle_de_fete', 'Non_concerne', 300, 'Corbeil-Essonnes', 1, 'Non_specifie', 'Aucun', 1, 1),
(24, 'Jean', 'Marc', 'marc.jean@gmail.com', 'Champigny', 'Salle_de_fete', 'Non_concerne', 150, 'Champigny-en-Rochereau', 1, 'Non_specifie', 'Aucun', 1, 0),
(25, 'Leclerc', 'Melissa', 'melissa.leclerc@yahoo.com', 'Salle des moulin', 'Salle_de_fete', 'Non_concerne', 200, 'Poitiers', 1, 'Non_specifie', 'Aucun', 1, 0),
(26, 'Boris', 'Anita', 'anita.boris@gmail.com', 'Salle de fetes', 'Salle_de_fete', 'Non_concerne', 500, 'Poitiers', 1, 'Non_specifie', 'Aucun', 1, 0),
(27, 'Perez', 'Jacob', 'dj.jacob@hotmail.com', 'Jacob', 'DJ', 'Non_concerne', 0, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(28, 'Roux', 'Nathan', 'nathan.roux@gmail.com', 'Nathan', 'DJ', 'Non_concerne', 0, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(29, 'Lambert', 'Thomas', 'thomas.lambert@yahoo.fr', 'Thomas', 'Animateur', 'Non_concerne', 0, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(30, 'Girard', 'William', 'girard.william@gmail.com', 'William', 'Animateur', 'Non_concerne', 0, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(31, 'Dubois', 'Julie', 'julie.dubois', 'Julie', 'Animateur', 'Non_concerne', 0, 'Bordeaux', 0, 'Non_specifie', 'Aucun', 1, 0),
(32, 'Petit', 'Hugo', 'hugo.petit@gmail.com', 'Hugo', 'Photographe', 'Non_concerne', 0, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(33, 'Girard', 'Camille', 'camille.girard@orange.fr', 'Camille', 'Photographe', 'Non_concerne', 0, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(34, 'Bernard', 'Anais', 'anais.bernard@live.fr', 'Anais', 'Photographe', 'Non_concerne', 0, 'Bordeaux', 0, 'Non_specifie', 'Aucun', 1, 0),
(35, 'Garcia', 'Emma', 'emma.garcia@yahoo.com', 'Rapido team', 'Serveur', 'Non_concerne', 30, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(36, 'Beauvais', 'Nicolas', 'nicolas.beauvais@yahoo.fr', 'Best\'serv', 'Serveur', 'Non_concerne', 100, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(37, 'Bernard', 'Lucie', 'lucie.bernard@outlook.com', 'Fast\'serv', 'Serveur', 'Non_concerne', 20, 'Bordeaux', 0, 'Non_specifie', 'Aucun', 1, 0),
(38, 'Rousseau', 'Charlotte', 'charlotte.rousseau@outlook.com', 'Best service', 'Serveur', 'Non_concerne', 50, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(39, 'Bertrand', 'Romain', 'romain.bertrand@outlook.com', 'Taxi Bertrand', 'Transport', 'Taxi', 5, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(40, 'Dubois', 'Lucas', 'lucas.dubois@outlook.com', 'Taxi Lucas', 'Transport', 'Taxi', 5, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(41, 'Mercier', 'Alexi', 'alexi.dubois@gmail.com', 'Lendcar', 'Transport', 'Voiture', 5, 'Bordeaux', 0, 'Non_specifie', 'Aucun', 1, 0),
(42, 'Fournier', 'Noemie', 'noemie.fournier@yahoo.fr', 'Lendmecar', 'Transport', 'Voiture', 5, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(43, 'Leroy', 'Manon', 'manon.leroy@gmail.com', 'Immediat\'car', 'Transport', 'Voiture', 5, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(44, 'Moron', 'Maxime', 'maxime.moron@blablabus.com', 'Blablabus', 'Transport', 'Bus', 50, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(45, 'Bernard', 'Tom', 'tom.bernard@snbus.com', 'SnBus', 'Transport', 'Bus', 60, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(46, 'Garcia', 'Sofia', 'sofia.garcia@havebus.com', 'Havebus', 'Transport', 'Bus', 45, 'Bordeaux', 0, 'Non_specifie', 'Aucun', 1, 0),
(47, 'Rodriguez', 'Ana', 'ana.rodriguez@velocycle.com', 'Velocycle', 'Transport', 'Autres', 1, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(48, 'Lopez', 'Diego', 'diego.lopez@taketrain.com', 'Take Train', 'Transport', 'Train', 150, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(49, 'Ali', 'Ahmed', 'ahmed.ali@meettrain.com', 'Meet Train', 'Transport', 'Bus', 200, 'Paris', 0, 'Non_specifie', 'Aucun', 1, 0),
(50, 'Anderson', 'Elsa', 'elsa.anderson@traintrip.com', 'Train Trip', 'Transport', 'Train', 80, 'Bordeaux', 0, 'Non_specifie', 'Aucun', 1, 0),
(51, 'Chang', 'Jason', 'jason.chang@oraorganizer.com', 'Ora Organizer', 'Autres', 'Non_concerne', 0, 'Poitiers', 0, 'Non_specifie', 'Aucun', 1, 0),
(52, 'Cao', 'XiaoLi', 'xiaoli.cao@gmail.com', 'Mianguan', 'Traiteur', 'Non_concerne', 20, 'Potiers', 0, 'Chinois', 'Divers', 0, 0),
(53, 'Alibert', 'Mori', 'mori.alibert@texashome.com', 'Texas Home', 'Traiteur', 'Non_concerne', 50, 'Paris', 1, 'Mexicain', 'Vegetalien', 0, 0),
(54, 'Jacques', 'Noé', 'noejakpro@gmail.com', 'Noejac Corporation', 'DJ', 'Autres', 3, 'Roubaix', 1, 'Chinois', 'Halal', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `idUtilisateur` int NOT NULL,
  `Nom` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Prenom` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Pseudo` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `Email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Mdp` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `identifie` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`idUtilisateur`, `Nom`, `Prenom`, `Pseudo`, `Email`, `Mdp`, `identifie`) VALUES
(1, 'Groupe', '111', 'Admin', 'evento@gmail.com', '$2y$10$cqmiDMDLO8XmKI1xjpR7LOLp4XWBQGaQWZJzKz4ZUxEGvnGMxn9HS', 1),
(15, 'Dubois', 'Titi', 'Titi45', 'titi.dubois@gmail.com', '$2y$10$jetMTAs.856udDfxKA7Zcuov2LiWnYcDb3dzOm4Mup4AUppuJ7EHm', 1),
(17, 'Dong', 'Laurène', 'LoloD', 'LoloD@gmail.com', '$2y$10$JdN.NpGYjYv6YnSuCntRvuzkGAyNKbwvFUS2tLCJk46POsgM0Ke5C', 1),
(18, 'Boneham', 'Anthéa', 'Antik02', 'antikB@gmail.com', '$2y$10$ydraqzONGggZy8rd4hRtweuVmPR7lU3n.CgKNnRwuFb/STUbN609.', 1),
(19, 'Dupain', 'Claire', 'ClaireD', 'claire.dupain@gmail.com', '$2y$10$1StYrPDXCOGmKzGNTr/CIOD3nTXGUVLQCJhR8MY.Ll9eKKEuekZJC', 1),
(20, 'Jackson', 'Percy', 'PSea', 'jackson.percy@gmail.com', '$2y$10$GrrhMHVFIR77bfBddylTTuz5notyfaT4r.cpmYv3qXKHMqzP81NPO', 1),
(21, 'Ciel', 'Zeus', 'Zsky', 'ciel.zeus@gmail.com', '$2y$10$4kROAKo31S8MEx1vt5M13Od9CCreG.5x9fLtQnmQK8bxK3uB/hhle', 1),
(22, 'Hell', 'Hades', 'Hhell', 'hell.hades@gmail.com', '$2y$10$T182JOpD/8p7QRZWRl//jODwZQ9v9FoYM3fdApPvnq1OkRPN5Ihn.', 1),
(23, 'Sea', 'Posseidon', 'PSeadad', 'sea.posseidon@gmail.com', '$2y$10$IGja/FYFUmrXeim1UW9QNey1W4QSMaAoIegCo/7jV75C.O/LKVyFu', 1),
(24, 'Perdu', 'Pane', 'PainP', 'pane.perdu@gmail.com', '$2y$10$nYZ.HeAsXilC9ye2iCgSO.8ubETtHzkLtuQuRvHNX3MBUuhk4WVKK', 1),
(25, 'Jacques', 'Noé', 'NOejak', 'noejac@gmail.com', '$2y$10$2m4dq/.TeAcZRQV712agf.uvWbJg6XQrZ5Hx2/5N.R1w3YaXmZcKW', 1),
(26, 'Dupont', 'Sarah', 'SarahDP', 'sarah.dupont@gmail.com', '$2y$10$/XU5O3CgpH21PEX/n5vl5.P1GTfxZODAs34owxRN8XGZdat2Zlfta', 1),
(27, 'Bernard', 'Coco', 'Coco', 'coco.b@gmail.com', '$2y$10$yBY5WLdBFffv7Ft.gS3sFOxBTzwnc7uT.fVDDxikTmxvyOmKs5vWG', 1),
(28, 'Beau', 'Jean', 'JeanB', 'jean.beau@gmail.com', '$2y$10$A35yUj0/u9Q31/MyrzTXeOwJSUr53/AWzRIa45jbXoO8TicocpOkW', 1),
(29, 'Boris', 'Ethan', 'eboris', 'eboris@gmail.com', '$2y$10$u1fna7Kx3iKV07VLqxCAPODNLUkQ1LaImFkT9E3jnOjeirfYPvQaq', 1),
(30, 'Cai', 'Laura', 'Claura', 'laura.cai@gmail.com', '$2y$10$mXYpaAVMm3u8lKeYPwf2GeoKos4SJS44OkttSxuTXd7CKR/W7n0xi', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Choix`
--
ALTER TABLE `Choix`
  ADD KEY `fk_idPanier_Cho` (`idPanier`),
  ADD KEY `fk_idProduit_Cho` (`idProduit`);

--
-- Index pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD PRIMARY KEY (`idCommentaire`),
  ADD KEY `fk_idProduit_Com` (`idProduit`),
  ADD KEY `fk_idService_Com` (`idService`),
  ADD KEY `fk_idUtilisateur_Com` (`idUtilisateur`);

--
-- Index pour la table `Conformite`
--
ALTER TABLE `Conformite`
  ADD KEY `fk_idProduit_Con` (`idProduit`),
  ADD KEY `fk_idService_Con` (`idService`),
  ADD KEY `fk_idUtilisateur_Con` (`idUtilisateur`);

--
-- Index pour la table `Favoris`
--
ALTER TABLE `Favoris`
  ADD KEY `fk_idProduit_Fav` (`idProduit`),
  ADD KEY `fk_idService_Fav` (`idService`),
  ADD KEY `fk_idUtilisateur_Fav` (`idUtilisateur`);

--
-- Index pour la table `Note`
--
ALTER TABLE `Note`
  ADD PRIMARY KEY (`idNote`),
  ADD KEY `fk_idProduit_Not` (`idProduit`),
  ADD KEY `fk_idService_Not` (`idService`),
  ADD KEY `fk_idUtilisateur_Not` (`idUtilisateur`);

--
-- Index pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD PRIMARY KEY (`idPanier`),
  ADD KEY `fk_idUtilisateur_Pan` (`idUtilisateur`);

--
-- Index pour la table `Photos`
--
ALTER TABLE `Photos`
  ADD PRIMARY KEY (`idPhoto`),
  ADD KEY `fk_idCommentaire_Pho` (`idCommentaire`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`idProduit`);

--
-- Index pour la table `Recommandation`
--
ALTER TABLE `Recommandation`
  ADD KEY `fk_idProduit_Rec` (`idProduit`),
  ADD KEY `fk_idService_Rec` (`idService`),
  ADD KEY `fk_idUtilisateur_Rec` (`idUtilisateur`);

--
-- Index pour la table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`idService`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  MODIFY `idCommentaire` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `Note`
--
ALTER TABLE `Note`
  MODIFY `idNote` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `Panier`
--
ALTER TABLE `Panier`
  MODIFY `idPanier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `Photos`
--
ALTER TABLE `Photos`
  MODIFY `idPhoto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `idProduit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT pour la table `Service`
--
ALTER TABLE `Service`
  MODIFY `idService` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `idUtilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Choix`
--
ALTER TABLE `Choix`
  ADD CONSTRAINT `fk_idPanier_Cho` FOREIGN KEY (`idPanier`) REFERENCES `Panier` (`idPanier`),
  ADD CONSTRAINT `fk_idProduit_Cho` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`);

--
-- Contraintes pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD CONSTRAINT `fk_idProduit_Com` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`),
  ADD CONSTRAINT `fk_idService_Com` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`),
  ADD CONSTRAINT `fk_idUtilisateur_Com` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `Conformite`
--
ALTER TABLE `Conformite`
  ADD CONSTRAINT `fk_idProduit_Con` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`),
  ADD CONSTRAINT `fk_idService_Con` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`),
  ADD CONSTRAINT `fk_idUtilisateur_Con` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `Favoris`
--
ALTER TABLE `Favoris`
  ADD CONSTRAINT `fk_idProduit_Fav` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`),
  ADD CONSTRAINT `fk_idService_Fav` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`),
  ADD CONSTRAINT `fk_idUtilisateur_Fav` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `Note`
--
ALTER TABLE `Note`
  ADD CONSTRAINT `fk_idProduit_Not` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`),
  ADD CONSTRAINT `fk_idService_Not` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`),
  ADD CONSTRAINT `fk_idUtilisateur_Not` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD CONSTRAINT `fk_idUtilisateur_Pan` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `Photos`
--
ALTER TABLE `Photos`
  ADD CONSTRAINT `fk_idCommentaire_Pho` FOREIGN KEY (`idCommentaire`) REFERENCES `Commentaire` (`idCommentaire`);

--
-- Contraintes pour la table `Recommandation`
--
ALTER TABLE `Recommandation`
  ADD CONSTRAINT `fk_idProduit_Rec` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`),
  ADD CONSTRAINT `fk_idService_Rec` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`),
  ADD CONSTRAINT `fk_idUtilisateur_Rec` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

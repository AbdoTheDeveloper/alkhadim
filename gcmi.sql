-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 10:02 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gcmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `achat`
--

CREATE TABLE `achat` (
  `id_achat` int(11) NOT NULL,
  `id_fournisseur` int(11) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `valide` int(11) DEFAULT '0',
  `num_facture` text,
  `num_bon` text,
  `id_agence` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `achat`
--

INSERT INTO `achat` (`id_achat`, `id_fournisseur`, `montant`, `date_achat`, `remarque`, `id_user`, `valide`, `num_facture`, `num_bon`, `id_agence`) VALUES
(7, 2, NULL, '2023-05-16', '', 35, 0, NULL, NULL, NULL),
(10, 2, NULL, '2023-05-16', '', 35, 1, NULL, NULL, NULL),
(13, 1, NULL, '2023-05-24', '', 35, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agence`
--

CREATE TABLE `agence` (
  `id_agence` int(11) NOT NULL,
  `raisonsocial` varchar(255) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `iff` varchar(30) DEFAULT NULL,
  `rc` varchar(30) DEFAULT NULL,
  `patente` varchar(30) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `avoir`
--

CREATE TABLE `avoir` (
  `id_avoir` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_avoir` date DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `numbon` int(11) DEFAULT NULL,
  `datebon` date DEFAULT NULL,
  `remarquebon` text,
  `num_devi` int(11) DEFAULT NULL,
  `id_agence` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `boncommande`
--

CREATE TABLE `boncommande` (
  `id_bon` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_bon` date DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `numbon` int(100) DEFAULT NULL,
  `remarquebon` text,
  `id_agence` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `boncommandevendeur`
--

CREATE TABLE `boncommandevendeur` (
  `id_bon` int(11) NOT NULL,
  `id_vendeur` int(11) DEFAULT NULL,
  `date_bon` text,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `etat` varchar(200) NOT NULL DEFAULT 'En cours',
  `numbon` text,
  `remarquebon` text,
  `id_agence` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `caisse`
--

CREATE TABLE `caisse` (
  `id` int(11) NOT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `type_reg` varchar(250) DEFAULT NULL,
  `date_caisse` date DEFAULT NULL,
  `montant` varchar(250) DEFAULT '0',
  `image` text,
  `id_user` text,
  `remarque` text,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date_delete` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `id_user`) VALUES
(1, 'Conserve', 35),
(2, 'Les pates', 35),
(3, 'Les epices', 35),
(4, 'Pet food', 35),
(5, 'Boissons', 35),
(6, 'Chocolat & bonbons', 35),
(7, 'Les sauces', 35),
(8, 'Lamps', 35),
(9, 'Petit dejeuner', 35),
(10, 'Biscuits et chwingum', 35),
(11, 'Yoghourt & lait', 35),
(12, 'Entretien et sanitai', 35),
(13, 'Beaute et douche', 35),
(14, 'Fromagerie & charcut', 35),
(15, 'Insecticide & sacs', 35),
(16, 'Aluminium et film al', 35),
(17, 'anniversaire', 35),
(18, 'fruits secs', 35),
(19, 'Enfant alimentaire', 35),
(20, 'Maison et electromen', 35),
(21, 'Lingette et couche', 35),
(22, 'Jouets', 35),
(23, 'Surgelee', 35),
(24, 'Herbes', 35),
(25, 'Farine et patisserie', 35),
(26, 'Koutoubia', 35),
(27, 'GROUP 27', 35),
(28, 'GROUP 28', 35),
(29, 'GROUP 29', 35),
(30, 'GROUP 30', 35),
(31, 'GROUP 31', 35);

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE `charge` (
  `id` int(11) NOT NULL,
  `id_achat` text,
  `designation` varchar(250) DEFAULT NULL,
  `mode_reg` varchar(250) DEFAULT NULL,
  `num_cheque` varchar(250) DEFAULT NULL,
  `date_charge` date DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `devise` varchar(300) DEFAULT NULL,
  `montant` varchar(250) DEFAULT '0',
  `image` text,
  `id_user` text,
  `remarque` text,
  `id_agence` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `nom_prenom_ar` varchar(255) DEFAULT NULL,
  `cin` varchar(225) DEFAULT NULL,
  `ice` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `date_archive` date DEFAULT NULL,
  `id_archiveur` int(11) DEFAULT NULL,
  `type_compte` int(11) DEFAULT '0',
  `plafond` double DEFAULT NULL,
  `plafond2` double DEFAULT NULL,
  `prix_vente` int(11) DEFAULT '1',
  `remise` float DEFAULT NULL,
  `responsable` text,
  `iff` text,
  `rc` text,
  `ville` text,
  `activite` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `code`, `nom`, `prenom`, `nom_prenom_ar`, `cin`, `ice`, `telephone`, `email`, `adresse`, `image`, `date_creation`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `type_compte`, `plafond`, `plafond2`, `prix_vente`, `remise`, `responsable`, `iff`, `rc`, `ville`, `activite`) VALUES
(1, NULL, 'CANAL FOOD     ', '', NULL, '', 'tertetwe', '', '', '', '', '2023-05-10', '', 35, 0, '2023-05-10', 0, 1, 100000, NULL, 2, 50, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'tst tst tst tst', 'tst', NULL, 'g4653', 'fhtr5464', '896389045', 'test01@gmail.com', 'fafafafa666', '', '2023-05-24', 'faer', 35, 0, '2023-05-24', 0, 0, 1000, NULL, 2, 0, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'teeeeeeeeeest ', '', NULL, '', '', '', '', '', '', '2023-05-24', '', 35, 0, '2023-05-24', 0, 1, 0, NULL, 2, 11, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commande_usine`
--

CREATE TABLE `commande_usine` (
  `id_cmd` int(11) NOT NULL,
  `id_client` int(11) DEFAULT '-1',
  `date_cmd` text,
  `id_usine` int(11) NOT NULL DEFAULT '-1',
  `remarque` text,
  `id_vente` int(11) NOT NULL DEFAULT '-1',
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `num_compte` varchar(100) NOT NULL,
  `nom_compte` varchar(100) NOT NULL,
  `nom_banque` varchar(50) DEFAULT NULL,
  `responsable` varchar(60) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `remarque` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compte`
--

INSERT INTO `compte` (`id`, `num_compte`, `nom_compte`, `nom_banque`, `responsable`, `telephone`, `fax`, `email`, `remarque`) VALUES
(1, 'BP', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `depot`
--

CREATE TABLE `depot` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `UUID` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot`
--

INSERT INTO `depot` (`id`, `nom`, `UUID`) VALUES
(5, 'Depot limci', '53c475f0-117c-4865-b1ff-742b95b6e8f1'),
(11, 'Super marche wanny', '2cb6dfe6-2fec-480f-ac11-05bcf7c92d57');

-- --------------------------------------------------------

--
-- Table structure for table `depot_op`
--

CREATE TABLE `depot_op` (
  `id_depot_op` int(11) NOT NULL,
  `remarque` text,
  `date_op` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot_op`
--

INSERT INTO `depot_op` (`id_depot_op`, `remarque`, `date_op`, `id_user`) VALUES
(4, '', '2023-05-18', 48),
(8, '', '2023-05-20', 35),
(9, '', '2023-05-20', 35),
(10, '', '2023-05-22', 35);

-- --------------------------------------------------------

--
-- Table structure for table `design`
--

CREATE TABLE `design` (
  `id` int(11) NOT NULL,
  `libele` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_achat`
--

CREATE TABLE `detail_achat` (
  `id_detail` int(11) NOT NULL,
  `id_achat` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `prix_produit` decimal(10,2) DEFAULT NULL,
  `qte_achete` decimal(10,2) DEFAULT NULL,
  `date_expiration` date DEFAULT NULL,
  `devise_produit` varchar(11) DEFAULT '1',
  `remise` decimal(10,2) DEFAULT NULL,
  `cout_device` double NOT NULL DEFAULT '1',
  `f_approch` double NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_achat`
--

INSERT INTO `detail_achat` (`id_detail`, `id_achat`, `id_produit`, `id_depot`, `prix_produit`, `qte_achete`, `date_expiration`, `devise_produit`, `remise`, `cout_device`, `f_approch`, `id_user`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(61, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(11, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(12, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(13, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(14, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(17, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(18, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(19, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(20, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(21, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(22, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(23, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(24, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(25, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(26, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(27, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(28, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(29, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(30, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(31, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(32, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(33, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(34, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(35, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(36, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(37, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(38, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(39, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(40, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(41, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(42, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(43, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(44, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(45, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(46, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(47, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(48, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(49, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(50, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(51, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(52, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(53, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(54, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(55, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(56, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(57, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(58, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(59, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(60, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(62, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(63, 4, 336, 5, '7.83', '1000.00', NULL, '1', NULL, 1, 1, 35),
(64, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(65, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(66, 6, 336, 5, '7.83', '1000.00', NULL, '1', NULL, 1, 1, 35),
(67, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(68, 7, 336, 5, '7.83', '2000.00', NULL, '1', NULL, 1, 1, 35),
(69, 8, 336, 5, '7.83', '10.00', NULL, '1', NULL, 1, 1, 35),
(70, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(71, 9, 336, 5, '7.83', '1000.00', NULL, '1', NULL, 1, 1, 35),
(72, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(73, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(74, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(75, 10, 336, 5, '7.83', '2000.00', NULL, '1', NULL, 1, 1, 35),
(76, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(77, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(78, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(79, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(80, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(81, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(82, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(83, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(84, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(85, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(86, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(100, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(88, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(102, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(103, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(104, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(109, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(93, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(107, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(108, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(99, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(97, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(98, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(110, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(111, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(112, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(113, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(114, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(115, 13, 698, 5, '1.00', '10.00', '2023-06-12', '1', NULL, 1, 1, 35),
(116, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(117, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(118, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(119, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL),
(120, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_avoir`
--

CREATE TABLE `detail_avoir` (
  `id_detail` int(11) NOT NULL,
  `id_avoir` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `prix_produit` decimal(10,2) DEFAULT NULL,
  `qte_rendu` decimal(10,2) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `remise` decimal(4,2) DEFAULT NULL,
  `unit` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_bon_vendeur`
--

CREATE TABLE `detail_bon_vendeur` (
  `id_detail` int(11) NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `qte_actuel` double DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `unit` text,
  `valunit` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_commande`
--

CREATE TABLE `detail_commande` (
  `id_detail` int(11) UNSIGNED NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `valunit` double DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_depot_op`
--

CREATE TABLE `detail_depot_op` (
  `id_detail` int(11) NOT NULL,
  `id_depot_op` int(11) DEFAULT NULL,
  `id_depot_src` int(11) DEFAULT NULL,
  `id_depot_dest` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `qte_op` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_depot_op`
--

INSERT INTO `detail_depot_op` (`id_detail`, `id_depot_op`, `id_depot_src`, `id_depot_dest`, `id_produit`, `qte_op`, `id_user`) VALUES
(6, 8, 5, 5, 336, 20, 35),
(2, 4, 5, 11, 322, 8, 48),
(7, 9, 5, 11, 336, 20, 35),
(9, 10, 5, 11, 336, 22, 35);

-- --------------------------------------------------------

--
-- Table structure for table `detail_entre`
--

CREATE TABLE `detail_entre` (
  `id_de` int(11) UNSIGNED NOT NULL,
  `id_cmd` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `valunit` double DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `valide_entre` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_produit`
--

CREATE TABLE `detail_produit` (
  `id` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_sortie`
--

CREATE TABLE `detail_sortie` (
  `id_ds` int(11) UNSIGNED NOT NULL,
  `id_cmd` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `valunit` double DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `valide_sortie` int(11) NOT NULL DEFAULT '0',
  `valide_entre` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_vente`
--

CREATE TABLE `detail_vente` (
  `id_detail` int(11) UNSIGNED NOT NULL,
  `id_vente` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `valunit` double DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `id_bon_vendeur` int(11) DEFAULT NULL,
  `valide_sortie` int(11) NOT NULL DEFAULT '0',
  `id_usine` int(11) NOT NULL DEFAULT '-1',
  `remarque_usine` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_vente`
--

INSERT INTO `detail_vente` (`id_detail`, `id_vente`, `id_produit`, `prix_produit`, `qte_vendu`, `id_user`, `remise`, `valunit`, `unit`, `id_depot`, `id_bon_vendeur`, `valide_sortie`, `id_usine`, `remarque_usine`) VALUES
(1, 1, 320, 150, 5, 35, 0, 0, '', 5, NULL, 0, -1, NULL),
(3, 2, 324, 12, 1, 35, 0, 1, '', 5, NULL, 0, -1, NULL),
(4, 2, 324, 12, 100, 35, 0, 100, '', 5, NULL, 0, -1, NULL),
(10, 4, 2423, 7.5, 0, 35, 0, 0, '', 5, NULL, 0, -1, NULL),
(7, 3, 321, 10, 10, 35, 0, 0, '', 5, NULL, 0, -1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `export`
--

CREATE TABLE `export` (
  `lien` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

CREATE TABLE `facture` (
  `id_facture` int(11) NOT NULL,
  `id_vente` varchar(100) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `tva` int(11) DEFAULT NULL,
  `taux` int(11) DEFAULT NULL,
  `num_fact` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facture`
--

INSERT INTO `facture` (`id_facture`, `id_vente`, `date_facture`, `remarque`, `id_user`, `tva`, `taux`, `num_fact`) VALUES
(1, ',1,', '2023-05-10', '', 35, 0, 0, 1),
(2, ',2,', '2023-05-10', '', 35, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `facture_avoir`
--

CREATE TABLE `facture_avoir` (
  `id_facture` int(11) NOT NULL,
  `id_avoir` varchar(100) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `tva` int(11) DEFAULT NULL,
  `taux` int(11) DEFAULT NULL,
  `num_fact` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) NOT NULL,
  `code_fournisseur` text,
  `raison_sociale` varchar(25) NOT NULL,
  `ice` varchar(25) DEFAULT NULL,
  `rc` varchar(25) DEFAULT NULL,
  `iff` varchar(25) DEFAULT NULL,
  `patente` varchar(25) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `adresse` varchar(60) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `remarque` text,
  `responsable` varchar(40) DEFAULT NULL,
  `tph_respo` varchar(20) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `date_archive` date DEFAULT NULL,
  `id_archiveur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fournisseur`, `code_fournisseur`, `raison_sociale`, `ice`, `rc`, `iff`, `patente`, `telephone`, `email`, `adresse`, `image`, `date_creation`, `remarque`, `responsable`, `tph_respo`, `id_user`, `archive`, `date_archive`, `id_archiveur`) VALUES
(1, NULL, 'MADEC HPC', '', '', '', '', '', '', '', '', '2023-05-15', '', '', '', 35, 0, '2023-05-15', 0),
(2, NULL, 'MAROC GS', '', '', '', '', '0611836050', '', '', '', '2023-05-16', '', '', '', 35, 0, '2023-05-16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `code_bar` varchar(255) DEFAULT NULL,
  `tva` decimal(4,2) DEFAULT '0.20',
  `designation` varchar(255) DEFAULT NULL,
  `designation_ar` varchar(255) DEFAULT NULL,
  `poid` decimal(10,2) DEFAULT NULL,
  `qte_actuel` decimal(10,2) DEFAULT NULL,
  `minqte` decimal(10,2) DEFAULT '10.00',
  `prix_achat` decimal(10,2) DEFAULT NULL,
  `prix_achat_i` double NOT NULL DEFAULT '0',
  `prix_vente` decimal(10,2) DEFAULT NULL,
  `prix_vente2` double NOT NULL DEFAULT '0',
  `prix_vente3` double NOT NULL DEFAULT '0',
  `remise_max` float DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `emplacement` varchar(25) DEFAULT 'Depot 1',
  `date_insertion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_categorie` int(11) DEFAULT NULL,
  `remarque` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `date_archive` date DEFAULT NULL,
  `id_archiveur` int(11) DEFAULT NULL,
  `unite` varchar(20) DEFAULT 'U',
  `unite2` double DEFAULT '1',
  `fournisseur` text,
  `type_produit` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(1, '11', '0.00', 'Vinaigre de table nationale 20cl', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 1),
(2, '12', '0.00', 'Vinaigre de table nationale 50cl', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 1),
(3, '13', '0.00', 'Almahsoul harbal de ble 1kg', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 1),
(4, '14', '0.00', 'Almahsoul couscous d''orge 900g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 1),
(5, '15', '0.00', 'Almahsoul couscous N5 900g mauve', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 17, 22, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(6, '16', '0.00', 'Chef Luncheon', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 120, 140, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(7, '18', '0.00', 'Bay bay balai', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 12, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(8, '80', '0.00', 'Trapa chocolat 70% amemendras', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(9, '1978', '0.00', 'Deliciosa genoise mini 40gr*40ps', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(10, '1997', '0.00', 'Cafe dahab special en grains 250', '', '0.00', '0.00', '0.00', '16.00', 0, '5.00', 17, 27, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(11, '1998', '0.00', 'Cafe dahab special moulu 250g', '', '0.00', '0.00', '0.00', '16.00', 0, '8.00', 17, 27, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(12, '1999', '0.00', 'Cafe dahab special gold 1Kg', '', '0.00', '0.00', '0.00', '65.00', 0, '20.00', 65, 70, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(13, '4240', '0.00', 'Oud achwak', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 71, 90, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(14, '4244', '0.00', 'Oud alBarakah', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 71, 90, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(15, '11127', '0.00', 'Chikinet raclette inoxydable', '', '0.00', '0.00', '0.00', '10.00', 0, '11.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 15, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(16, '11132', '0.00', 'Chiki net serpilliÃ¨re en viscose', '', '0.00', '0.00', '0.00', '6.00', 0, '8.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(17, '11133', '0.00', 'Chiki net SerpilliÃ¨re jn germany', '', '0.00', '0.00', '0.00', '4.00', 0, '5.00', 5, 8, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(18, '11134', '0.00', 'Chiki net serpilliÃ¨re germany co', '', '0.00', '0.00', '0.00', '5.00', 0, '5.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(19, '12241', '0.00', 'Dar al assala gingembre moulu 80', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(20, '12242', '0.00', 'Dar al assala poivre noir moulu', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(21, '12243', '0.00', 'Dar al assala piment doux moulu 80g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 4, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(22, '12244', '0.00', 'Dar al assala cumin moulu 80g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(23, '12245', '0.00', 'Dar al assala curcuma moulu 80g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(24, '12246', '0.00', 'Dar al assala riz blanc 350g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(25, '12247', '0.00', 'Dar al assala pois chiches 350g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(26, '12248', '0.00', 'Dar al assala fevettes cassees 3', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(27, '12249', '0.00', 'Dar al assala lentilles 350g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(28, '12250', '0.00', 'Dar al assala riz jaune 300g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(29, '12251', '0.00', 'Dar al assala mais secs 300g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(30, '12252', '0.00', 'Dar al assala riz rond 350g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(31, '12296', '0.00', 'Couscous 3 cereales farah alkhay', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(32, '12297', '0.00', 'Couscous 5 cereales farah alkhay', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(33, '12298', '0.00', 'Belboula aux herbes 500g farah a', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(34, '12299', '0.00', 'Couscous 5 cereales essmara 1kg', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(35, '12300', '0.00', 'Couscous 2 cereales essmara 1kg', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(36, '12301', '0.00', 'Couscous 3 cereales sahara gold', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(37, '12302', '0.00', 'Couscous 5 cereales sahara gold', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(38, '12303', '0.00', 'Almahsoul barkoukch dorge 900g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(39, '12304', '0.00', 'Almahsoul semoule de mais fin 1k', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 13, 21, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(40, '12305', '0.00', 'Almahsoul farine dorge beldi 900', '', '0.00', '0.00', '0.00', '12.00', 0, '11.00', 11, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(41, '12306', '0.00', 'Almahsoul herbel de mais 1kg', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 13, 21, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(42, '12307', '0.00', 'Almahsoul soupe 1 kg beldi aux herbes', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 17, 23, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(43, '12308', '0.00', 'Almahsoul dchicha dorge fin 1kg', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(44, '12309', '0.00', 'Almahsoul ble complet beldi 900g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(45, '12310', '0.00', 'Almahsoul dchicha dorge gros 1kg', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(46, '12311', '0.00', 'Almahsoul farine de mais 1kg', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 13, 21, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(47, '12349', '0.00', 'Alayafa couscous 5cereales 1kg', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(48, '12497', '0.00', 'Vital fromage 96 portions', '', '0.00', '0.00', '0.00', '53.00', 0, '0.00', 60, 68, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(49, '12509', '0.00', 'Miel pur arabia portion', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(50, '12510', '0.00', 'Icefruit sauce chocolat 250g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(51, '12511', '0.00', 'Icefruit sauce fraise 250g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(52, '12514', '0.00', 'Gym sirop de menthe 75cl', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 16, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(53, '12531', '0.00', 'Briquet fashion lighter G', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(54, '12558', '0.00', 'The akabar srir 1kg 41022AAAAA', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 139, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(55, '12560', '0.00', 'The kantaoui oued alkhayr 500g 9', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 32, 37, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(56, '12571', '0.00', 'The almaksoud 500g 41022', '', '0.00', '0.00', '0.00', '47.00', 0, '0.00', 47, 52, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(57, '12572', '0.00', 'The al oum 500g 41022', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 52, 57, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(58, '12573', '0.00', 'The isane 500g 41022', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 42, 46, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(59, '12574', '0.00', 'The okad 500g 41022AAAAAA qualit', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 62, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(60, '12575', '0.00', 'The okad 200g 41022AAAAAA qualit', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(61, '12576', '0.00', 'The okad 100g 41022AAAAAA qualit', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(62, '12577', '0.00', 'The arifaa 200g 41022 de haut qu', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 23, 25, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(63, '12579', '0.00', 'The tighezart 500g 41022 haute q', '', '0.00', '0.00', '0.00', '41.00', 0, '43.00', 41, 46, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(64, '12580', '0.00', 'The tighezart 200g 41022 haute q', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 18, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(65, '12581', '0.00', 'The kidal 500g 41022 N1', '', '0.00', '0.00', '0.00', '41.00', 0, '44.00', 42, 46, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(66, '12582', '0.00', 'The kidal 200g 41022 N1', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 18, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(67, '12583', '0.00', 'The taouarta 500g 41022 N1', '', '0.00', '0.00', '0.00', '42.00', 0, '44.00', 42, 47, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(68, '12584', '0.00', 'The taouarta 200g 41022 N1', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 23, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(69, '12595', '0.00', 'The kantaoui 500g 9371AAAA', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 39, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(70, '12596', '0.00', 'The attamin 500g 41022 AAAA jaun', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 43, 47, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(71, '12602', '0.00', 'The al batraa 200g 3505AAA', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 18, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(72, '12603', '0.00', 'The al batraa 200g 41022AAAAA', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 22, 24, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(73, '12604', '0.00', 'The al batraa 100g 3505AAA', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 9, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(74, '12605', '0.00', 'The al batraa 100g 41022AAAAA', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 12, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(75, '12606', '0.00', 'The al batraa 100g 41022', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 9, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(76, '12607', '0.00', 'The al batraa 500g 41022', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(77, '12608', '0.00', 'The al batraa 500g 41022AAAAA', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(78, '12609', '0.00', 'The al batraa 500g 3505 AAA', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 44, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(79, '12610', '0.00', 'The okad 500g 3505 AAAAA', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(80, '12611', '0.00', 'The aajmane 500g 41022', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 65, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(81, '12612', '0.00', 'The jhaifa 500g 41022AAAAAA', '', '0.00', '0.00', '0.00', '56.00', 0, '0.00', 56, 63, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(82, '12620', '0.00', 'The oued om fatma 200g 41022', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 22, 24, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(83, '12623', '0.00', 'The okad 100g 3505AAAAA', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 12, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(84, '12627', '0.00', 'The oued chaar 200g 41022', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(85, '12630', '0.00', 'The el gailani 500g 41022 mov', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 43, 50, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(86, '12635', '0.00', 'The sagro 500g 41022', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 42, 46, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(87, '12636', '0.00', 'The attamine 500g 9371 AAA blanc', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(88, '12644', '0.00', 'The ras etaraf 2kg 9366 AAA', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 83, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(89, '12645', '0.00', 'The attamine 800g 41022 AAAA cad', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 130, 145, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(90, '12647', '0.00', 'The el aargoub 2kg 9366 AAA', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 83, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(91, '12648', '0.00', 'The kantaoui srir 1kg super 4102', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 127, 150, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(92, '12650', '0.00', 'The skikima 500g 9371', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 42, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(93, '12651', '0.00', 'The attamine 500g bleu 41022', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 44, 58, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(94, '12652', '0.00', 'The akabar 500g 41022AAAAAA roug', '', '0.00', '0.00', '0.00', '46.00', 0, '0.00', 46, 50, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(95, '12657', '0.00', 'The attamine 200g 41022 AAAA', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(96, '12659', '0.00', 'The attamine srir 1kg 41022AAAAA', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 120, 140, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(97, '12662', '0.00', 'The kidal 1kg 41022', '', '0.00', '0.00', '0.00', '83.00', 0, '0.00', 83, 89, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(98, '12671', '0.00', 'The kantaoui boucraa 200g 9371', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 18, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(99, '12673', '0.00', 'The zemmour 500g chaara 9366AAA', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 44, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(100, '12675', '0.00', 'The maatala super 500g 9371', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 36, 40, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(101, '12678', '0.00', 'The Al khalij Al arabi 200g 4102', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 30, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(102, '12680', '0.00', 'The attamine 500g 41022 AAAA gol', '', '0.00', '0.00', '0.00', '41.00', 0, '0.00', 40, 47, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(103, '12682', '0.00', 'The arrag labyad 200g 41022', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(104, '12684', '0.00', 'The ELid 100g 41022AA', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(105, '12685', '0.00', 'The maatalah 200g 9371', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(106, '12691', '0.00', 'The aajmane 200g 41022', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 28, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(107, '12694', '0.00', 'The baba ahmed 500g 41022', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 46, 56, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(108, '12698', '0.00', 'The Elid 250g 41022AA', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 27, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(109, '12699', '0.00', 'The Al khalij Al arabi 500g 4102', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 70, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(110, '12929', '0.00', 'Bissu papier hygienique 4 roulea', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(111, '12930', '0.00', 'Bonitta super soft 1=10', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(112, '13686', '0.00', 'Nawhal''s sauce samourai 340g', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 30, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(113, '15036', '0.00', 'Labell 9 mouchoires confort blan', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(114, '15037', '0.00', 'Cuisine mega papier 1=48 1200 mo', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 88, 95, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(115, '15038', '0.00', 'Cuisine mega papier 1=60 1400 mo', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 112, 125, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(116, '15052', '0.00', 'Klen sacs congelation 50 pcs', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(117, '15053', '0.00', 'Sofia 15 sacs de congelation 30*', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 23, 26, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(118, '15058', '0.00', 'Al fakhama charbon de bois des o', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(119, '15059', '0.00', 'Al fakhama premium quik lighter', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(120, '15090', '0.00', 'Gillette blue 2', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(121, '15092', '0.00', 'Candle happy birthday 20 cm', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 27, 32, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(122, '15093', '0.00', 'Assiettes gris petits coeurs', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(123, '15094', '0.00', 'Serviettes rafraichissante petit', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(124, '15095', '0.00', 'Fotti serviette parfumee', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(125, '15097', '0.00', 'Sofia film alimentaire 30', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(126, '15098', '0.00', 'Great western etoiles brillants', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(127, '15104', '0.00', 'Nana papier cuisson 12 feuilles', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(128, '15106', '0.00', 'Serviettes colorees', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(129, '15107', '0.00', 'Serviette bleu grande imprime', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(130, '15108', '0.00', 'Serviettes bleu petites', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(131, '15110', '0.00', 'Aroma potpourri rose fleurs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(132, '15115', '0.00', 'Simple sac cadeau petit', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(133, '15118', '0.00', 'Pique brochette avec boules', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(134, '15127', '0.00', 'Kirland petit', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(135, '15128', '0.00', 'Boite plastique 1.5kg', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(136, '15129', '0.00', 'Boite plastique 1kg', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(137, '15130', '0.00', 'Boite plastique 750g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(138, '15131', '0.00', 'Boite plastique 500g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(139, '15132', '0.00', 'Barquettes en aluminium 480cl', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(140, '15133', '0.00', 'Chapeaux de fete long', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(141, '15134', '0.00', 'Chapeaux de fete boules cotton', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(142, '15136', '0.00', 'Eponge metallique 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(143, '15139', '0.00', 'Sacs de fete love G', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(144, '15140', '0.00', 'Simple sac cadeau G', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 11, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(145, '15141', '0.00', 'Quartz clock', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 30, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(146, '15142', '0.00', 'Filtre eau chlorine KCGAC 10A', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 45, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(147, '15151', '0.00', 'Goblet en plastique 100 pcs', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(148, '15152', '0.00', 'Goblet a cafe 4oz 100 pcs', '', '0.00', '0.00', '0.00', '46.00', 0, '0.00', 48, 55, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(149, '15153', '0.00', 'Charlotte hygiene jetable', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 48, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(150, '15162', '0.00', 'Fresh film alim 1er 300*40', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 36, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(151, '15163', '0.00', 'Film alimentaire etirable 100', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(152, '15165', '0.00', 'Fresh film alim 2er 500*40', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 34, 42, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(153, '15166', '0.00', 'Sofia film alimentaire 300 L', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 29, 35, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(154, '15168', '0.00', 'Folia film alimentaire 500m*450m', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 76, 85, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(155, '15169', '0.00', 'Folia film alimentaire 300*29mm', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 28, 33, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(156, '15170', '0.00', 'Balai small tete en caoutchouc', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(157, '15171', '0.00', 'Balai tete en plastique normal', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(158, '15172', '0.00', 'Be one coton disques 120 pcs', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(159, '15173', '0.00', 'Fregona bleu P et manche', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 35, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(160, '15174', '0.00', 'Manche en bois normal', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(161, '15181', '0.00', 'Caissettes dore et argente', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(162, '15182', '0.00', 'Caissettes etoiles colorees', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(163, '15183', '0.00', 'Caissettes boules colorees', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(164, '15201', '0.00', 'Selvage eau de cologne 500ml', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 34, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(165, '15208', '0.00', 'Selvage eau de cologne 1L', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 61, 75, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(166, '15236', '0.00', 'Havainas bleu pack parfume 100ml', '', '0.00', '0.00', '0.00', '68.00', 0, '0.00', 69, 95, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(167, '15281', '0.00', 'La valle de rose douche argan 25', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(168, '15282', '0.00', 'La valle de rose douche rose 250', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(169, '15309', '0.00', 'Deo roll au lait de chamelle', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(170, '15311', '0.00', 'La valle de rose douche aloe 250', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(171, '15319', '0.00', 'Pack johnsons 6 pcs', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 80, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(172, '15320', '0.00', 'Pack maycare baby zone 7 pcs', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 48, 57, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(173, '15321', '0.00', 'Trousse sanex de 3 pcs', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 70, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(174, '15368', '0.00', 'Wardat jnani huile Aloe V 50ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(175, '15369', '0.00', 'Wardat jnani huile glycerin 50ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(176, '15370', '0.00', 'Wardat jnani huile argan 50ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(177, '15371', '0.00', 'Wardat jnani huile  ricine 50ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(178, '15444', '0.00', 'Lucentiere rame and gas 500ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(179, '15445', '0.00', 'Lucentiere inox 500ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(180, '15446', '0.00', 'Linas pure parfume 100ml', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(181, '15573', '0.00', 'Woroud bladi eau de rose 125ml', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(182, '15574', '0.00', 'Eau a la rose 200ml', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 10, 10, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(183, '15575', '0.00', 'Eau parfumee de rose 250ml', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(184, '15576', '0.00', 'Wardat jnani gommage 100g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(185, '15577', '0.00', 'Woroud bladi masque face 200g', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(186, '15578', '0.00', 'Lamasat nisaeia mask face', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 40, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(187, '15579', '0.00', 'Lamasat fermentation de corps', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 29, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(188, '15660', '0.00', 'Shampoo sachets 5 ml', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(189, '15704', '0.00', 'Savon beldi noir 200g aux herbes', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(190, '15705', '0.00', 'Hamama savon beldi bio 250g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(191, '15730', '0.00', 'Synthodon bain de bouche 200ml', '', '0.00', '0.00', '0.00', '37.00', 0, '0.00', 37, 43, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(192, '15756', '0.00', 'Sofia aluminium 30m', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(193, '15757', '0.00', 'Sofia film alimentaire 50 vert', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 11, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(194, '15763', '0.00', 'Water word filtre SH 08CTO', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(195, '15767', '0.00', 'Viazda lamp 36w extra bright', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(196, '15768', '0.00', 'Victor led bulb 9w', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(197, '15769', '0.00', 'Or light lamp 9w', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(198, '15786', '0.00', 'Raclette family ghost tex court', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(199, '15793', '0.00', 'Raclette family ghost tex long', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 23, 26, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(200, '15874', '0.00', 'Lux boite de beurre L282', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(201, '15875', '0.00', 'Bole avec couvercle in2715', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(202, '15880', '0.00', 'Saga boite plastic in468', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(203, '15883', '0.00', 'Pot de sauce en plastic petite', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(204, '15884', '0.00', 'Assiette argente et dore grand', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(205, '15889', '0.00', 'Fil decor mur anniversaire', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(206, '15895', '0.00', 'Balloons happyBirthday Led 18pcs', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 55, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(207, '15898', '0.00', 'YHH balloons with helium 5pcs', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(208, '15905', '0.00', 'Monopoly NO 55002F', '', '0.00', '0.00', '0.00', '51.00', 0, '0.00', 55, 75, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(209, '15906', '0.00', 'Chapeau cowboy brillant', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(210, '15907', '0.00', 'Truck radio control No 898A', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 0, 60, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(211, '15908', '0.00', 'Happy mother monika No ZR 505', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 45, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(212, '15909', '0.00', 'Racing Car radio control No 818', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 0, 99, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(213, '15910', '0.00', 'CRH train hight speed', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 0, 100, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(214, '15932', '0.00', 'Sprinkler water bathroom', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 70, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(215, '15934', '0.00', 'Serviette de plage', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(216, '15935', '0.00', 'Serviette colore petite', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(217, '15936', '0.00', 'Monopoly NO 55182F', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 85, 110, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(218, '15937', '0.00', 'Balloons 100 pcs happy evry day', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(219, '15951', '0.00', 'Foil helium balloon No DS 02', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(220, '15952', '0.00', 'Lettre dessin happy birthday', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(221, '15955', '0.00', 'Cake topper G happy birthday', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(222, '15956', '0.00', 'Cake topper P happy birthday', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(223, '15958', '0.00', 'Zhiyuan ballons lettres et chiff', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(224, '15961', '0.00', 'Chapeau de fete numero', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(225, '15962', '0.00', 'Happy birthday lettre de 13pcs', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 29, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(226, '15963', '0.00', 'Assiette moyen dore et argente', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 11, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(227, '15964', '0.00', 'Assiette en carton simple 20pcs', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(228, '15965', '0.00', 'Sachet bonons petit', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(229, '15970', '0.00', 'Sachet bonbons M anniversaire', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(230, '15974', '0.00', 'CupCakes 1pcs avec brochettes', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(231, '15979', '0.00', 'Let''s party masque 10 pcs', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(232, '15980', '0.00', 'Party favors serviette', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(233, '15981', '0.00', 'Boite anniversaire 1U en carton', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 3, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(234, '15982', '0.00', 'Cravata 10u anniversaire', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(235, '15983', '0.00', 'Sac anniversaire grand mc queen', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(236, '15984', '0.00', 'Guirland anniversaire G', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(237, '15985', '0.00', 'Nonous happy birthday', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(238, '15986', '0.00', 'Ensemble H happy birthday', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(239, '15988', '0.00', 'Sac love anniversaire grande', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(240, '15989', '0.00', 'Flora trendy toy boxes 40L', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 150, 180, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(241, '15990', '0.00', 'Party popper G', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 18, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(242, '15991', '0.00', 'Piques brochette petites', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(243, '15992', '0.00', 'Chapeau de fete mini brillant', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(244, '15993', '0.00', 'Boite pop corn petite 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(245, '15994', '0.00', 'Goblet+serviette+assiette', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 28, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(246, '15995', '0.00', 'Bougie coeur 1pcs', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(247, '15996', '0.00', 'Bougie love 1pcs', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(248, '15997', '0.00', 'Love theme candle 2pcs', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 24, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(249, '15998', '0.00', 'Pack bougie 4pcs', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 49, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(250, '15999', '0.00', 'Naranja bougie de fete 10pcs', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(251, '16054', '0.00', 'The oum chgag 500g 41022AAAA', '', '0.00', '0.00', '0.00', '46.00', 0, '0.00', 46, 53, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(252, '16057', '0.00', 'The attamine 200g 9371AAA blanc', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(253, '16059', '0.00', 'The wady chaar 500g 41022', '', '0.00', '0.00', '0.00', '44.00', 0, '0.00', 44, 47, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(254, '16060', '0.00', 'The wady chaar 1kg 41022', '', '0.00', '0.00', '0.00', '88.00', 0, '0.00', 88, 95, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(255, '16061', '0.00', 'The vert No2 500g 9366', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 31, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(256, '16063', '0.00', 'Arkam miel 1.50kg', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 72, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(257, '16064', '0.00', 'San francisco miel 250g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(258, '16065', '0.00', 'Delices du sud confiture 760g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(259, '16100', '0.00', 'Alsa sucre vanille 1 sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(260, '16101', '0.00', 'Ideal sucre vanille 1 sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(261, '16114', '0.00', 'Colorant alimentaire orange 25g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(262, '16115', '0.00', 'Colorant alimentaire jaune 25g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(263, '16116', '0.00', 'Caissettes blanc petite', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(264, '16117', '0.00', 'Caissette colore rulo', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 14, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(265, '16118', '0.00', 'Colorant alimentaire 15ml', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(266, '16128', '0.00', 'IceFruit sauce caramel 250g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(267, '16176', '0.00', 'Glucose 250g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(268, '16177', '0.00', 'Nappage 250g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 5, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(269, '16183', '0.00', 'Sara monti miel 1.6kg', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(270, '16184', '0.00', 'Flodio miel 300g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(271, '16185', '0.00', 'Sara monti miel 600g bouteille', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(272, '16186', '0.00', 'Delices du sud confiture 430g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(273, '16187', '0.00', 'Lavazza aroma point 2 capsules', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(274, '16219', '0.00', 'Guapa sardino a HT 1kg', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 26, 31, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(275, '16220', '0.00', 'Delmonaco sardine a HV 125g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(276, '16221', '0.00', 'Delmonaco sardine a HVP 125g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(277, '16222', '0.00', 'Delmonaco sardine a la ST 125g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(278, '16253', '0.00', 'Almahsoul herbel grain complet 1', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(279, '16254', '0.00', 'Almahsoul couscous N3 1kg', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(280, '16255', '0.00', 'Almahsoul barkoukch aux herbes 9', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 28, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(281, '16256', '0.00', 'La pina gofio sachet jaune 900g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(282, '16257', '0.00', 'Almahsoul semoule gros de ble 1k', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(283, '16258', '0.00', 'Almahsoul grains de mais 1kg', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(284, '16259', '0.00', 'Almahsoul barkoukch khomasi 900g', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 21, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(285, '16260', '0.00', 'Balboula beldia 500g sakia elham', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 9, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(286, '16261', '0.00', 'Alayafa couscous 6cereales 1kg', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(287, '16272', '0.00', 'MDM miel 500g herbes montagnes', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 61, 74, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(288, '16312', '0.00', 'Nova chocolat au lait 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(289, '16391', '0.00', 'Diasol tonica original 200ml', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 5, 4, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(290, '16739', '0.00', 'Crevette chinois 1kg 70/100', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 90, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(291, '16740', '0.00', 'Crevette decortique 1kg 50/70', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 85, 93, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(292, '16741', '0.00', 'King crevettes 1kg 70/100', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 99, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(293, '16743', '0.00', 'Calibre tube de pota 1kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 70, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(294, '16756', '0.00', 'Crevettes 1kg 100/200 Frozen pud', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 100, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(295, '16757', '0.00', 'Vanonis crevettes gambas 2kg', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 180, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(296, '17019', '0.00', 'Scrabble classique', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 95, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(297, '17025', '0.00', 'Funny shop ice cream set KDL888', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 140, 185, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(298, '18000', '0.00', 'Recharge mop cercle', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(299, '18001', '0.00', 'Safety toys ballon 4pcs', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 28, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(300, '18002', '0.00', 'My heart family cuisine 3 ans+', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 0, 47, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(301, '18003', '0.00', 'My funny cooking cuisine 3ans+', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 0, 47, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(302, '18004', '0.00', 'Truck toys work touck', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(303, '18005', '0.00', 'Truck toys working NO3323', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(304, '18006', '0.00', 'Qashtam and merzaq roue jouets', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 28, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(305, '18007', '0.00', 'Toys bateau petit', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(306, '18008', '0.00', 'Minions the toys flashing LD130C', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 0, 55, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(307, '18029', '0.00', 'Tureen set 3pcs', '', '0.00', '0.00', '0.00', '74.00', 0, '0.00', 74, 89, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(308, '18039', '0.00', 'Lshs fondant decorative punch se', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(309, '18053', '0.00', 'Saes hachoir legume', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(310, '18078', '0.00', 'Silver plated round tray D0334', '', '0.00', '0.00', '0.00', '750.00', 0, '0.00', 750, 900, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(311, '18081', '0.00', 'Moule en silicone HL 9126', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(312, '18082', '0.00', 'Saga porte papier rouleau in116', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(313, '18170', '0.00', 'Almahsoul nokhala de ble 600g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 5, 9, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(314, '18178', '0.00', 'Thym 40g jibal taounate', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(315, '18179', '0.00', 'Flio jibal taounate 40g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(316, '18180', '0.00', 'Pack 50 caissettes marron petite', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(317, '18181', '0.00', 'Stevia 30g jibal taounate', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 23, 28, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(318, '18182', '0.00', 'Feuille de laurier 30g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(319, '18183', '0.00', 'Herbal the 30g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(320, '18184', '0.00', 'Thym vulgaris 40g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(321, '18185', '0.00', 'Gelita gelatine alimentaire 500g', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 168, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(322, '18186', '0.00', 'Cupcake 1 unite', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(323, '18188', '0.00', 'pack 50 Caissettes couleurs peti', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(324, '18189', '0.00', 'Pack 1000 caissettes blancs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(325, '18196', '0.00', 'Gelatine 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(326, '18240', '0.00', 'Miel Al andalus 1.50kg', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(327, '18241', '0.00', 'Miel san francisco 1kg', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 95, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(328, '18251', '0.00', 'MDM shampo anti chute 200ml', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 28, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(329, '18318', '0.00', 'Khlii boeuf de chamelle 200g', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(330, '18319', '0.00', 'Camel''s hump loudek 200g', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 50, 55, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(331, '18320', '0.00', 'Camel''s hump loudek 130g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 32, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(332, '18321', '0.00', 'Lamasat nisaeia deo stick', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(333, '18361', '0.00', 'Kroon edam 900g', '', '0.00', '0.00', '0.00', '114.00', 0, '0.00', 98, 115, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(334, '18362', '0.00', 'Kroon edam 1.7kg', '', '0.00', '0.00', '0.00', '157.00', 0, '0.00', 135, 180, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(335, '18363', '0.00', 'Eress juice mixingMachine RL70', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 180, 220, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(336, '18369', '0.00', 'Bonomi poele el harcha 32 cm', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 120, 145, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(337, '18376', '0.00', 'Pandiani sport bottle 350ml', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 50, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(338, '18382', '0.00', 'Tatch corbeille a pain 2165S', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 75, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(339, '18385', '0.00', 'Bonomi bollitore di ceramica VJ1', '', '0.00', '0.00', '0.00', '210.00', 0, '0.00', 210, 255, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(340, '18389', '0.00', 'Laccor 3pcs bakeware moule cake', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(341, '18390', '0.00', 'Elite fer Ã  repasser 2427', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 145, 180, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(342, '18391', '0.00', 'Tatch corbeille a pain kwa1300', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(343, '18395', '0.00', 'Elite panini grill 4 slice 307', '', '0.00', '0.00', '0.00', '320.00', 0, '0.00', 320, 385, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(344, '18397', '0.00', 'Laccor round springform pan 001', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(345, '18399', '0.00', 'Tatch porte manger electrique 00', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 95, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(346, '18404', '0.00', 'Incense burner WF 107', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 115, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(347, '18417', '0.00', 'Atelas pasta machine', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(348, '18418', '0.00', 'Laccor loaf springform pan 004', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(349, '18419', '0.00', 'Laccor 3pcs bakeware set 005', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(350, '18420', '0.00', 'Tatch classic  verre rectangulaire 1pc', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 75, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(351, '18421', '0.00', 'Laccor 4pcs bakeware set', '', '0.00', '0.00', '0.00', '175.00', 0, '0.00', 180, 225, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(352, '18425', '0.00', 'Laccor electric kettle 1.8L 8005', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(353, '18465', '0.00', 'Aubergine marinees 180g', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(354, '18466', '0.00', 'Adwak atlas Tfaya 180g', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(355, '18474', '0.00', 'Citron au herbes 180g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(356, '18490', '0.00', 'Boujie electric en plastic M', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(357, '18495', '0.00', 'Dattes 3kg assalah nakhil sukari', '', '0.00', '0.00', '0.00', '96.00', 0, '0.00', 96, 115, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(358, '18496', '0.00', 'Dattes taj toulekt 1kg', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 37, 44, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(359, '18499', '0.00', 'Dattes al majd majhoul 2kg vert', '', '0.00', '0.00', '0.00', '230.00', 0, '0.00', 230, 265, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(360, '18500', '0.00', 'Dattes al majd majhoul N2 2kg', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 146, 190, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(361, '18503', '0.00', 'Golden dates sukari 1kg', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 35, 55, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(362, '18510', '0.00', 'Ticket wanny kids normal', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 20, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(363, '18511', '0.00', 'Ticket wanny kids weekend', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(364, '18524', '0.00', 'Beurre frais 10g jaouda', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(365, '18561', '0.00', 'Pate pizza 3pcs moyen', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(366, '18563', '0.00', 'Mortadella 350g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(367, '18570', '0.00', 'Coquelet', '', '0.00', '0.00', '0.00', '46.00', 0, '0.00', 42, 54, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(368, '18571', '0.00', 'Gauffret 1pcs', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(369, '18578', '0.00', 'Forest mozzarella 250g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(370, '81097', '0.00', 'Raclette mimosa 45cm', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(371, '81614', '0.00', '', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(372, '110002', '0.00', 'krissia saumon 1pcs', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(373, '110007', '0.00', 'Koutoubia kasher saucisson cuit', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(374, '110009', '0.00', 'Rafii beurre 200g', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 16, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(375, '110012', '0.00', 'Forest mozzarella 1kg', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(376, '110016', '0.00', 'Mortadella 200g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(377, '110018', '0.00', 'Packet oeufs 15 pcs', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 21, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(378, '110027', '0.00', 'NewTop vanille', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 8, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(379, '110028', '0.00', 'Packet oeufs 30 pcs', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 27, 42, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(380, '110066', '0.00', 'The lamairdat 200g 41022', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(381, '110077', '0.00', 'PrincesMixed rice crackers 500g', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 22, 28, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(382, '110078', '0.00', 'Hrissa 500g adwak atlas', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(383, '110082', '0.00', 'LVDR creme hydratante 200g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(384, '110083', '0.00', 'Oul creme au safran et a l''argan', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(385, '110092', '0.00', 'Forest family bloc 150g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(386, '110105', '0.00', 'Miel al andalouse 1kg', '', '0.00', '0.00', '0.00', '47.00', 0, '0.00', 47, 52, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(387, '110207', '0.00', 'Kik''s sandwich glace', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(388, '110215', '0.00', 'scented candle boujie', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(389, '110223', '0.00', 'The akabar 500g bleu 41022', '', '0.00', '0.00', '0.00', '52.00', 0, '60.00', 53, 59, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(390, '110229', '0.00', 'Filet de dinde cuit fume koutoub', '', '0.00', '0.00', '0.00', '81.00', 0, '0.00', 74, 110, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(391, '110230', '0.00', 'Oeufs saman 18 pcs', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(392, '110251', '0.00', 'Kasher saucisson cuit 350g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(393, '110253', '0.00', 'The vert gailani 1kg en bois', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 115, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(394, '110257', '0.00', 'Plateau oeufs beldi 15pcs', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 28, 38, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(395, '110260', '0.00', 'The attamine 1kg srir extra 4102', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 121, 139, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(396, '110272', '0.00', 'The akabar 500g boite bleu 41022', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 52, 62, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(397, '110274', '0.00', 'The akabar 200g boite rouge 4102', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(398, '110275', '0.00', 'The akabar 200g boite noir 41022', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(399, '110276', '0.00', 'Bouteille petite decore fleur', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(400, '110282', '0.00', 'Adwak atlas hrissa 250g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(401, '110285', '0.00', 'Water filter DB 10 5', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 45, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(402, '110287', '0.00', 'Fresh film alim 300*45 No2', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 34, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(403, '110290', '0.00', 'La gamme 10 pcs happy birthay', '', '0.00', '0.00', '0.00', '56.00', 0, '0.00', 65, 85, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(404, '110307', '0.00', 'The kantaoui oud 700g 9371', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 117, 128, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(405, '110309', '0.00', 'The al batraa 1kg marron 9370', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 56, 64, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(406, '110319', '0.00', 'Lavazza cafe crema et aroma', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 10, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(407, '110322', '0.00', 'Lavazza cafe Aroma Club', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(408, '110323', '0.00', 'Lavazza cafe Aroma Point', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(409, '110325', '0.00', 'The attamine 500g qlt super 6A', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 66, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(410, '110328', '0.00', 'Dubois capresso capsule 1pcs', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(411, '110334', '0.00', 'The al alaila 500g', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 43, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(412, '110337', '0.00', 'The azawad 250g', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(413, '110353', '0.00', 'El benna luncheon viande 600g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(414, '110358', '0.00', 'The el guergarat 200g 41022', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 27, 35, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(415, '110360', '0.00', 'The albatraa 200g 41022', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(416, '110361', '0.00', 'The bab sahara 500g 41022 AAAA', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 49, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(417, '110369', '0.00', 'The skikima 500g 9371', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 39, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(418, '110374', '0.00', 'The tarouma 200g 41022', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(419, '110375', '0.00', 'The lamairdat 200g 41022', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(420, '110378', '0.00', 'Nescafe pack 120 sachets', '', '0.00', '0.00', '0.00', '114.00', 0, '0.00', 116, 140, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(421, '110381', '0.00', 'The nour 200g No1', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(422, '110382', '0.00', 'The boukraa 200g', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(423, '110383', '0.00', 'Pain de sucre 2kg', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(424, '110408', '0.00', 'MDM miel de thym 300g w', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 61, 72, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(425, '110409', '0.00', 'MDM miel d''euphorbe 300g', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 61, 72, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(426, '110412', '0.00', 'Dorada 1pcs', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(427, '110413', '0.00', 'D''apino pate a tartiner 350g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(428, '110414', '0.00', 'Miel flodio 700g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(429, '110417', '0.00', 'Plateau G en carton', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(430, '110430', '0.00', 'Arabia confiture portion', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(431, '110435', '0.00', 'Pate pizza 5 pcs moyen', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(432, '110436', '0.00', 'Pate pizza 5 pcs grande', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 21, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(433, '110437', '0.00', 'Pate pizza 2pcs', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(434, '110438', '0.00', 'Panor pate pizza  grande *3ps', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(435, '110439', '0.00', 'Kantaoui 1L voyageur No 4', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 109, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(436, '110440', '0.00', 'Dentelle 30*40cm grande', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(437, '110441', '0.00', 'Dentelle petite', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(438, '110442', '0.00', 'Planche cake  mini 50 pcs en carton', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 48, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(439, '110446', '0.00', 'Kantaoui aqua bravia 1L No 5', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 109, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(440, '110449', '0.00', 'Smen beldi 100g sahara gold', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(441, '110450', '0.00', 'Kantaoui bergamot 1L No 8', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 109, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(442, '110451', '0.00', 'Kantaoui nuro 1L No 7', '', '0.00', '0.00', '0.00', '113.00', 0, '0.00', 109, 125, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(443, '110452', '0.00', 'Kantaoui versailles 1L No 3', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 109, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(444, '110453', '0.00', 'Kantaoui ruses 1L No 6', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 109, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(445, '110454', '0.00', 'Kantaoui sumatra 1L No 2', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 109, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(446, '110455', '0.00', 'Kantaoui edge 1L No 1', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 109, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(447, '110458', '0.00', 'Bon cafee', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(448, '110462', '0.00', 'Plateau 3 Pcs silver century', '', '0.00', '0.00', '0.00', '480.00', 0, '0.00', 480, 540, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(449, '110465', '0.00', 'Zakia tomato ketchup 2kg', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(450, '110523', '0.00', 'Bougie anniversaire mini 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(451, '110542', '0.00', 'Love theme candle 3pcs', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 24, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(452, '110544', '0.00', 'Cadre perle pour photo', '', '0.00', '0.00', '0.00', '51.00', 0, '0.00', 52, 62, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(453, '110565', '0.00', 'Dattes d''algerie deglet nour 1kg', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 36, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(454, '110567', '0.00', 'Verona fromage a pizza 200g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(455, '110573', '0.00', 'Saga gelass', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 37, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(456, '110574', '0.00', 'Moule a cake silicon 25*12cm', '', '0.00', '0.00', '0.00', '74.00', 0, '0.00', 76, 90, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(457, '110584', '0.00', 'Halls extra strong 2.8g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(458, '110585', '0.00', 'Garantia halal', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(459, '110586', '0.00', 'Verona fromage a pizza 500g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 29, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(460, '110598', '0.00', 'Janat al nakhil dattes 800g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(461, '110603', '0.00', 'verres grands en bronze', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(462, '110604', '0.00', 'Saga boite verre moyen', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(463, '110607', '0.00', 'Accessoire de douche', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(464, '110615', '0.00', 'Table cloth 180r 1pcs', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 48, 58, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(465, '110617', '0.00', 'Improved vegetable grater', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 28, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(466, '110626', '0.00', 'Embalage de cake', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 55, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(467, '110632', '0.00', 'Sac anniversaire dessinee petit', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(468, '110640', '0.00', 'Protective mat mc wares', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(469, '110646', '0.00', 'Goron crayon', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(470, '110648', '0.00', 'Dolci idee moule 30', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 69, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(471, '110665', '0.00', 'Kool food cacao crema 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(472, '110676', '0.00', 'Zina eau de rose 125ml', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(473, '110698', '0.00', 'Fleurs', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 36, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(474, '110699', '0.00', 'Pack Dentelle anniversaire plast', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 54, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(475, '110702', '0.00', 'Jambon de dinde fume maxi', '', '0.00', '0.00', '0.00', '71.00', 0, '0.00', 72, 110, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(476, '110703', '0.00', 'Mortadella megusta', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(477, '110704', '0.00', 'Mortadella megusta 90g', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(478, '110705', '0.00', 'Kasher megusta piquant 90g', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(479, '110706', '0.00', 'Kasher saucisson cuit 200g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(480, '110707', '0.00', 'Cuisse de dinde fumee 1kg koutou', '', '0.00', '0.00', '0.00', '74.00', 0, '0.00', 74, 90, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(481, '110708', '0.00', 'Candle flame 1pcs 20cm', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(482, '110710', '0.00', 'Saada film alimentaire 50', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(483, '110712', '0.00', 'Oil camel anti rhumatisme 50ml', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(484, '110713', '0.00', 'Crevettes gris ola 2kg 50 60', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 180, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(485, '110715', '0.00', 'Panier des dragees', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(486, '110716', '0.00', 'Candle live simple', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(487, '110718', '0.00', 'Desire scented candle mango', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 60, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(488, '110723', '0.00', 'Aluminium pro 200m mauve', '', '0.00', '0.00', '0.00', '86.00', 0, '0.00', 88, 105, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(489, '110724', '0.00', 'Kirland maxi anniversaire', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 20, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(490, '110761', '0.00', 'Moms film alimentaire 50 450', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(491, '110762', '0.00', 'Film alimentaire etirable 50', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(492, '110763', '0.00', 'Moms film alimentaire 450 300', '', '0.00', '0.00', '0.00', '29.00', 0, '0.00', 29, 35, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(493, '110773', '0.00', 'oeuf 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(494, '110799', '0.00', 'kale glacier', '', '0.00', '0.00', '0.00', '105.00', 0, '0.00', 105, 130, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(495, '110800', '0.00', 'Moshaf coffret sebha co1307', '', '0.00', '0.00', '0.00', '145.00', 0, '0.00', 145, 175, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(496, '110806', '0.00', 'Petit pain', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(497, '110807', '0.00', 'Pain rond', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(498, '110821', '0.00', 'Matt food petit pois 425g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(499, '110826', '0.00', 'Menjel savon gd', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(500, '110827', '0.00', 'Menjel savon petit', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(501, '110831', '0.00', 'Balaie ref 05', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(502, '110832', '0.00', 'Clorets gum 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(503, '110870', '0.00', 'Les enfants fromage 24 portions', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 24, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(504, '110871', '0.00', 'La vache quit rit 24 portions', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(505, '110891', '0.00', 'Idodane lentille 400g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(506, '110892', '0.00', 'Idodane haricot blanc 400g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(507, '110895', '0.00', 'Gofio 1kg', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(508, '110896', '0.00', 'Goufi d''orge 800g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(509, '110904', '0.00', 'Ideal levure sachet 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(510, '110905', '0.00', 'Romarin 35g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(511, '110906', '0.00', 'Barida peche jus en sachet 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(512, '110911', '0.00', 'Party balloons 10 pcs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(513, '110914', '0.00', 'Goblet plastic 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(514, '110916', '0.00', 'Premier cadeau 1u', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(515, '110917', '0.00', 'Tirma mini 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(516, '110922', '0.00', 'Mozzabella 200g mont blanc', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(517, '110923', '0.00', 'Mozzabella 250g mont blanc', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 19, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(518, '110924', '0.00', 'Mozzabella 500g mont blanc', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 32, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(519, '110925', '0.00', 'Paladin sauce piquante sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(520, '110933', '0.00', 'Miel flolo 760g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(521, '110934', '0.00', 'Alsa levure sachet 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(522, '110939', '0.00', 'La vache qui rit 16 portions', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(523, '110942', '0.00', 'Meriem dattes 1kg', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 32, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(524, '110945', '0.00', 'Paladin mayonnaise sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(525, '110946', '0.00', 'Paladin ketchup sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(526, '110947', '0.00', 'Paladin moutarde sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(527, '110948', '0.00', 'Bouche jetable G', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(528, '110950', '0.00', 'Kiri 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(529, '110952', '0.00', 'Fraise 500g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(530, '110958', '0.00', 'Wings tex mex surgele nutrisla 8', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 55, 60, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(531, '110960', '0.00', 'Golden dattes sukari 3kg', '', '0.00', '0.00', '0.00', '84.00', 0, '0.00', 85, 98, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(532, '110961', '0.00', 'Fromage portions 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(533, '110966', '0.00', 'Mortadella avec olives 350g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(534, '110968', '0.00', 'Bouche jetable P', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(535, '110969', '0.00', 'Conikos gout fromage 35g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(536, '110973', '0.00', 'Sel de table sachet 400g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(537, '110974', '0.00', 'Figue jibal taounate 500g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(538, '110994', '0.00', 'Raclette express G', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 21, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(539, '111003', '0.00', 'Huile D''olive Annor 1L', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 49, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(540, '111006', '0.00', 'Albadia the sahara vert 500g', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 33, 38, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(541, '111007', '0.00', 'Mabrouka Olives Vertes 850g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(542, '111008', '0.00', 'Mabroka olives vertes pitted 425', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(543, '111009', '0.00', 'The ain arrag 200g 41022', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(544, '111010', '0.00', 'Matt food petit pois 850g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 11, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(545, '111011', '0.00', 'BeOne coconut oil 200ml', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 33, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(546, '111013', '0.00', 'Cosmac coupe d''ongles', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(547, '111021', '0.00', 'Couvercle de table 20u', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(548, '111022', '0.00', 'Meska horra 1u', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(549, '111023', '0.00', 'Tempo mouchoire 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(550, '111030', '0.00', 'Safran pure 1g', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 33, 45, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(551, '111031', '0.00', 'Coconut bonbons 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(552, '111033', '0.00', 'Fini pop sucette', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(553, '111036', '0.00', 'Migarome sauce 1kg', '', '0.00', '0.00', '0.00', '137.00', 0, '0.00', 139, 175, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(554, '111037', '0.00', 'Goblet a jus 50 u', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 43, 50, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(555, '111039', '0.00', 'Barquette aluminium 2 place', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(556, '111040', '0.00', 'Barquette aluminium P', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(557, '111043', '0.00', 'Hrissa verts 450g', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(558, '111044', '0.00', 'Oplat savon 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(559, '111045', '0.00', 'Fromage sandwich 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(560, '111046', '0.00', 'Capsule cafe 1pcs', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(561, '111049', '0.00', 'Moub gota gota 170ml', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 15, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(562, '111050', '0.00', 'Torchon jaune', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(563, '111051', '0.00', 'Briquet alaska', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(564, '111052', '0.00', 'Sachet Pr AssiÃ¨tte Gateaux Mega', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(565, '111056', '0.00', 'The wady chaar 200g', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(566, '111057', '0.00', 'Sacs poubelle noir G', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(567, '111058', '0.00', 'Sac poubelle 1kg', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 0, 28, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(568, '111060', '0.00', 'Oil camel anti hair fall 50ml', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 40, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(569, '111061', '0.00', 'Hair loss traitement mask', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(570, '111062', '0.00', 'Milk scrub camel hump 50g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(571, '111063', '0.00', 'Lip balm camel hump 15g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(572, '111064', '0.00', 'Megle mohamas 800g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(573, '111065', '0.00', 'Nour huile d''avocat 60ml', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(574, '111066', '0.00', 'Ole deo stick', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(575, '111067', '0.00', 'Vermicelle chocolate 1kg', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 40, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(576, '111069', '0.00', 'Embalage cake mini 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(577, '111070', '0.00', 'Coupe mini verre caramel', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 33, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(578, '111071', '0.00', 'Coupe mini verre chocolat', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 33, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(579, '111073', '0.00', 'Huile d''olive 500ml', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(580, '111079', '0.00', 'Kids bibereon set', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 35, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(581, '111080', '0.00', 'Mop double serpelier', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(582, '111081', '0.00', 'Boite plastique 2kg', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(583, '111093', '0.00', 'Rawafid el janoub couscous N3', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(584, '111094', '0.00', 'Rawafid el janoub couscous n5', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(585, '111116', '0.00', 'Al majd majhoul 1kg No1 vert', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 120, 138, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(586, '111117', '0.00', 'Al majd majhoul 1kg No2 noir', '', '0.00', '0.00', '0.00', '83.00', 0, '0.00', 84, 99, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(587, '111118', '0.00', 'Dattes sanwan sukari 3kg', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 81, 100, NULL, '', '', '0000-00-00 00:00:00', 19, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(588, '112136', '0.00', 'Crevette decortique 80/120', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 99, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(589, '112158', '0.00', 'Nata 1u', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(590, '112159', '0.00', 'Tirma barrita 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(591, '112160', '0.00', 'Pate kounafa', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(592, '112162', '0.00', 'Trident gum 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(593, '112191', '0.00', 'Bueno soluble al cacao 400g', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(594, '112192', '0.00', 'Bueno pate a tartiner 900g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 21, 26, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(595, '112193', '0.00', 'Bueno pate a tartiner 450g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(596, '112194', '0.00', 'Bueno pate a tartiner 100g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(597, '112203', '0.00', 'Viande de moule 1kg surgelee', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 81, 95, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(598, '112208', '0.00', 'Camel milk shower gel 200ml', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 40, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(599, '112209', '0.00', 'Argan oil cosmetic', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(600, '112210', '0.00', 'Camel hump hand & foot cream', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 38, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(601, '112211', '0.00', 'Oil camel hump body oil 50ml', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 40, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(602, '112212', '0.00', 'Camel hump face cream 50g', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 40, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(603, '112213', '0.00', 'Camel milk shampoin 200ml', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(604, '112214', '0.00', 'Camels hump lip palm 30g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(605, '112215', '0.00', 'Bokhour oud cooperative sahara', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 23, 28, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(606, '112217', '0.00', 'Raclette express PM', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(607, '112229', '0.00', 'V clean avance gel rafraichissan', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 32, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(608, '112230', '0.00', 'The shave factory', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 33, 40, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(609, '112232', '0.00', 'Moms film alimentaire 200/450', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 34, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(610, '112237', '0.00', 'Serviette vitre colore arix', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(611, '113000', '0.00', 'Moule silicone', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 22, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(612, '113013', '0.00', 'Al amal rice 10kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 91, 105, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(613, '113029', '0.00', 'Rouleau de mur en bois 45 cm*2m', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(614, '113041', '0.00', 'Livre chiiriat al kitaba', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 45, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(615, '113044', '0.00', 'Baby bath set 5pcs', '', '0.00', '0.00', '0.00', '225.00', 0, '0.00', 230, 280, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(616, '113051', '0.00', 'Livre ahmed battah', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 30, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(617, '113052', '0.00', 'Couteaux inox', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(618, '113064', '0.00', 'Boite plastique 250g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(619, '113067', '0.00', 'Decor aigle suc art 200g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(620, '113068', '0.00', 'Luxury chocolat 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(621, '113072', '0.00', 'Tableau 3D', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 80, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(622, '113073', '0.00', 'Barquette aluminium P', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(623, '113074', '0.00', 'Barquette aluminium M', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(624, '113075', '0.00', 'Barquette aluminiuim G', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(625, '113076', '0.00', 'Tirma digestive naranja 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(626, '113080', '0.00', 'Almahsoul herbel d''orge beldi 1kg', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 21, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(627, '113081', '0.00', 'Almahsoul Barkoukch de ble 900g', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 15, 21, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(628, '113082', '0.00', 'confiture de dattes tafilalet 25', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 15, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(629, '113084', '0.00', 'Sucre glace 200g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 3, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(630, '113085', '0.00', 'Adwak epices sachet petit', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(631, '113094', '0.00', 'Golden mare thon 1700g', '', '0.00', '0.00', '0.00', '103.00', 0, '0.00', 103, 115, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(632, '113095', '0.00', 'The nour 500g No1', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 43, 50, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(633, '113096', '0.00', 'Riz clovert 10kg', '', '0.00', '0.00', '0.00', '97.00', 0, '0.00', 97, 105, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(634, '113098', '0.00', 'Huile d''aoud kmari 60ml nour', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(635, '113100', '0.00', 'Loxe briquet', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(636, '113105', '0.00', 'Sachet sandwich', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 10, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(637, '113113', '0.00', 'Mortadella 100g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 2, 4, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(638, '113115', '0.00', 'Route d''or lotion 500ml', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(639, '113116', '0.00', 'Plaza aqua eau de toilette 500ml', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(640, '113117', '0.00', 'Esperansa parfume 500ml', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(641, '113139', '0.00', 'Fro d''or mozzarella 1kg', '', '0.00', '0.00', '0.00', '47.00', 0, '0.00', 47, 60, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(642, '113140', '0.00', 'Forest bella mozza 1kg verte', '', '0.00', '0.00', '0.00', '47.00', 0, '0.00', 46, 56, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(643, '113141', '0.00', 'Forest edamy cheese 1kg', '', '0.00', '0.00', '0.00', '56.00', 0, '0.00', 51, 62, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(644, '113147', '0.00', 'Plateau de the', '', '0.00', '0.00', '0.00', '750.00', 0, '0.00', 750, 850, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(645, '113148', '0.00', 'Plateau mbikhra', '', '0.00', '0.00', '0.00', '430.00', 0, '0.00', 430, 580, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(646, '113154', '0.00', 'Stop souris 300g', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 55, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(647, '113251', '0.00', 'The okad 200g 3505AAAAA vert', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 22, 26, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(648, '113260', '0.00', 'Game enfant', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 45, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(649, '113269', '0.00', 'Sofia film alimentaire 500ml', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 66, 80, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(650, '113270', '0.00', 'Dattes ichraq 2kg', '', '0.00', '0.00', '0.00', '54.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(651, '113304', '0.00', 'Gym sirop amande 75cl', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(652, '113321', '0.00', 'Hello kitty 4D light', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 77, 95, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(653, '113324', '0.00', 'Couscous gros 1kg tindbar', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(654, '113325', '0.00', 'Couscous moyen 1kg tindbar', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(655, '113339', '0.00', 'Bavette enfant', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(656, '113340', '0.00', 'Sac marchandises 50pcs', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(657, '113367', '0.00', 'Papier cadeau No 2', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(658, '113392', '0.00', 'Sachet frite', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(659, '113409', '0.00', 'Forest beurre doux 250g', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 14, 22, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(660, '113410', '0.00', 'Forest mix cream', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(661, '113413', '0.00', 'Sara monti miel 1800g', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(662, '113414', '0.00', 'Sara monti miel 500g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(663, '113415', '0.00', 'support TV', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 70, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(664, '113417', '0.00', 'Papier cadeau No 1', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(665, '113469', '0.00', 'Fresh nut pistache 1kg', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 135, 160, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(666, '113471', '0.00', 'Dattes oasis 2kg', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 62, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(667, '113472', '0.00', 'Tomoor finjan sukari 3kg', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 100, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(668, '113473', '0.00', 'Bel amri eau fleur d''oranger 25c', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(669, '113526', '0.00', 'Beurre 100g sahara milk', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 3, 3, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(670, '113528', '0.00', 'Santa rosa crevette gris 50/60 2', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 148, 180, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(671, '113529', '0.00', 'Pot mini noha', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(672, '113539', '0.00', 'The kantaoui 200g 9371AAAAA', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(673, '113540', '0.00', 'Sofia alu 200 pro bleu', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 23, 34, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(674, '113547', '0.00', 'Tchno swiss crepiere electrique', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 195, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(675, '113581', '0.00', 'Couteau plastic', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(676, '113585', '0.00', 'Ballon petit', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(677, '113586', '0.00', 'Kenz theiere 1.5L', '', '0.00', '0.00', '0.00', '66.00', 0, '0.00', 67, 89, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(678, '113600', '0.00', 'Almohajir sardine ST 125g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(679, '113607', '0.00', 'Chabakia d''amande 500g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 32, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(680, '113615', '0.00', 'Sandbad dates sukari 3kg', '', '0.00', '0.00', '0.00', '96.00', 0, '0.00', 96, 115, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(681, '113616', '0.00', 'Chriha boite 1kg', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 72, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(682, '113617', '0.00', 'Sandbad dates 5kg', '', '0.00', '0.00', '0.00', '87.00', 0, '0.00', 88, 100, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(683, '113620', '0.00', 'Chabakia simple 500g', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 27, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(684, '113623', '0.00', 'The jhayfa 200g 41022AAAAAA', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 23, 25, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(685, '113624', '0.00', 'The wady naame 200g 9371AA', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 17, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(686, '113625', '0.00', 'The attamine 500g mkerkeb 3505AA', '', '0.00', '0.00', '0.00', '44.00', 0, '0.00', 44, 49, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(687, '113626', '0.00', 'The attamine 500g 41022AAA', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 43, 48, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(688, '113627', '0.00', 'The attamine 500g bazar 4A 41022', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(689, '113631', '0.00', 'Badaouia raibi banane mini', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(690, '113700', '0.00', 'Sara monti miel 350g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(691, '113707', '0.00', 'Meriem dates 5kg', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 135, 150, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(692, '113708', '0.00', 'Dattes oasis 1kg', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 33, 38, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(693, '113717', '0.00', 'Frite Food 2.5kg', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 36, 45, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(694, '113725', '0.00', 'Crevette chinois 1kg 50/70', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 90, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(695, '113731', '0.00', 'Fromage mozzarella 250g nfis', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(696, '113738', '0.00', 'Moule silicone crealys rd', '', '0.00', '0.00', '0.00', '89.00', 0, '0.00', 89, 90, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(697, '113743', '0.00', 'Barquette aluminium 3 places', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(698, '80895237', '0.00', 'Accessoire cake 1u', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '5', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 1),
(699, '113745', '0.00', 'Kenz inox theiere', '', '0.00', '0.00', '0.00', '71.00', 0, '0.00', 71, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(700, '113774', '0.00', 'Dattes majhoul 2kg', '', '0.00', '0.00', '0.00', '165.00', 0, '0.00', 165, 195, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(701, '113775', '0.00', 'Alghalla semoule fine 5kg', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 34, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(702, '113799', '0.00', 'MozzaDor 500g', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 25, 32, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(703, '113811', '0.00', 'Couscous 3 sakia elhamra 900g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(704, '113812', '0.00', 'Couscous aux herbes sakia hamra', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(705, '113813', '0.00', 'Couscous NÂ°5 sakia hamra', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(706, '113816', '0.00', 'Jomayra dattes sukari 3kg', '', '0.00', '0.00', '0.00', '78.00', 0, '0.00', 78, 100, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(707, '113832', '0.00', 'Olive oil bottle 1.5L', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 18, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(708, '113971', '0.00', 'Miel aljibal de fleurs 900g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(709, '113972', '0.00', 'Miel aljibal de fleurs 450g', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(710, '113997', '0.00', 'Sevan 550 soft tissue', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(711, '113999', '0.00', 'Saga miroir salle de bain', '', '0.00', '0.00', '0.00', '63.00', 0, '0.00', 63, 80, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(712, '114001', '0.00', 'IceFruit sauce framboise 1kg', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 40, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(713, '114002', '0.00', 'IceFruit sauce caramel 1kg', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 40, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(714, '114005', '0.00', 'Papa falcons filet de maquereaux', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 84, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(715, '114006', '0.00', 'Couverture machine a vaisselle', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(716, '114029', '0.00', 'Cleaning products', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(717, '114030', '0.00', 'The biranzaran 500g 41022AAAAAA', '', '0.00', '0.00', '0.00', '46.00', 0, '0.00', 46, 52, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(718, '114031', '0.00', 'The ain tengarfa 500g 41022AAAAA', '', '0.00', '0.00', '0.00', '41.00', 0, '0.00', 41, 49, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(719, '114032', '0.00', 'The ain tengarfa 200g 41022AAAAA', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(720, '114033', '0.00', 'The arrayan 200g 41022AAAAA', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(721, '114039', '0.00', 'Decor argente petit', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 115, 140, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(722, '114040', '0.00', 'Decor argente moyen', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 145, 180, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(723, '114041', '0.00', 'Decor argente grand', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 175, 220, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(724, '114042', '0.00', 'Stickers decoration', '', '0.00', '0.00', '0.00', '10.00', 0, '10.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(725, '114043', '0.00', 'Kids coleurs vetement', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(726, '114044', '0.00', 'Metoo', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 30, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(727, '114045', '0.00', 'Ballon colore petite illastique', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(728, '114046', '0.00', 'Album photo', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 45, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(729, '114047', '0.00', 'Cadre photo animal', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 35, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(730, '114048', '0.00', 'Collection barrel', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 140, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(731, '114049', '0.00', 'Fuhua raclette bad minton', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 90, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(732, '114050', '0.00', 'Cadre musicale', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 50, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(733, '114055', '0.00', 'Bicyclette magic wheel', '', '0.00', '0.00', '0.00', '500.00', 0, '0.00', 500, 700, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(734, '114056', '0.00', 'Sachet wanny moyen', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(735, '114057', '0.00', 'Sachet wanny grand', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(736, '114059', '0.00', 'Skii land surfing', '', '0.00', '0.00', '0.00', '250.00', 0, '0.00', 250, 350, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(737, '114060', '0.00', 'Etagere decoratif', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 240, 250, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(738, '114076', '0.00', 'Crealys  faitout 8L inox 28cm ol', '', '0.00', '0.00', '0.00', '224.00', 0, '0.00', 230, 225, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(739, '114091', '0.00', 'Toys toys picatchu', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 18, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(740, '114103', '0.00', 'Serviettes lagarto blanc raye', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(741, '114114', '0.00', 'The kantaoui 500g boite divers', '', '0.00', '0.00', '0.00', '54.00', 0, '0.00', 55, 62, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(742, '114115', '0.00', 'The kantaoui 1kg chameau blanc', '', '0.00', '0.00', '0.00', '86.00', 0, '0.00', 87, 99, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(743, '114121', '0.00', 'The elgazira 200g 9371', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 20, 23, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(744, '114122', '0.00', 'The laayoune aaniya 200g 9371', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 23, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(745, '114123', '0.00', 'The atyab almotamaniat 500g Ro', '', '0.00', '0.00', '0.00', '63.00', 0, '0.00', 63, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(746, '114124', '0.00', 'The atyab almotamaniat 500g Go', '', '0.00', '0.00', '0.00', '62.00', 0, '0.00', 63, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(747, '114125', '0.00', 'The laayoune aaniya 500g 9371', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 51, 58, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(748, '114126', '0.00', 'The elgazira 500g 9371', '', '0.00', '0.00', '0.00', '49.00', 0, '0.00', 49, 58, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(749, '114127', '0.00', 'Brochette anniversaire 1U', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(750, '114136', '0.00', 'Basket saga', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(751, '114158', '0.00', 'Oncle achour dates majhoul 2kg', '', '0.00', '0.00', '0.00', '220.00', 0, '0.00', 225, 290, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(752, '114227', '0.00', 'Chupa chups sucette', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(753, '114238', '0.00', 'Dollar chocolate', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(754, '114245', '0.00', 'Lamp set procelain', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(755, '114250', '0.00', 'Top candy mallow 1kg', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 65, 75, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(756, '115000', '0.00', 'Couscous alfoa 900g farah alkhay', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(757, '115001', '0.00', 'Couscous illane 900g farah alkha', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(758, '115002', '0.00', 'Couscous alhamra 900g farah alkh', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(759, '115003', '0.00', 'Couscous au riz 900g farah alkha', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(760, '115004', '0.00', 'Zamita beldia au thym 450g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(761, '115063', '0.00', 'Mofi pan rallado 250g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(762, '115065', '0.00', 'Mofi pan rallado 500g', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(763, '116010', '0.00', 'Seau', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 29, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(764, '116012', '0.00', 'Le palmier dattes 500g deglet no', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(765, '116018', '0.00', 'Boite Ã  epices 1pcs', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(766, '116030', '0.00', 'Adwak confiture de peche 320g', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(767, '117006', '0.00', 'Dattes Khairat sukari 1kg boite', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 43, 50, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(768, '117076', '0.00', 'Lollipops sucette', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(769, '117107', '0.00', 'Ticket lailat alkader', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(770, '117114', '0.00', 'Estepa polvoron 1 pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(771, '117115', '0.00', 'La union halal 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(772, '117156', '0.00', 'Darlet cacao soluble 900g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 37, 45, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(773, '117160', '0.00', 'Boujie electric en plastic P', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(774, '117163', '0.00', 'Idodane sucre glace 400g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(775, '117165', '0.00', 'Verona mozzarella edam 1kg', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 55, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(776, '117166', '0.00', 'Verona mozzarella 250g', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(777, '117185', '0.00', 'Plateau gateaux mini', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 35, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(778, '118100', '0.00', 'Serviette ryan', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(779, '118101', '0.00', 'Chikinet serpilliere orange 160g', '', '0.00', '0.00', '0.00', '4.00', 0, '5.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(780, '121029', '0.00', 'Boite en verre petite', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(781, '121030', '0.00', 'Boite en verre grande', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(782, '121043', '0.00', 'Boite plastic in 469', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(783, '121059', '0.00', 'Happy moto', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(784, '121069', '0.00', 'Plateau mini', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(785, '121085', '0.00', 'Rangement storage 4 etageres', '', '0.00', '0.00', '0.00', '235.00', 0, '0.00', 240, 310, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(786, '121086', '0.00', 'Rangement storage 6 etageres', '', '0.00', '0.00', '0.00', '600.00', 0, '0.00', 620, 750, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(787, '121087', '0.00', 'Roulette transport alimentaire', '', '0.00', '0.00', '0.00', '195.00', 0, '0.00', 200, 260, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(788, '121102', '0.00', 'Voiture super stunt', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 210, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(789, '121103', '0.00', 'Moyen clown', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(790, '121104', '0.00', 'Rouleaux d''anniversaire file', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(791, '121105', '0.00', 'Princesse rose', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 120, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(792, '121106', '0.00', 'Present lamp', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 45, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(793, '121107', '0.00', 'Vase rose moyen', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 80, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(794, '121108', '0.00', 'Trousse high scool C 188', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(795, '121125', '0.00', 'artesania polvoron 44g', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(796, '121126', '0.00', 'Ballon petite makam', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(797, '121129', '0.00', 'Montre tom et jerry', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(798, '121130', '0.00', 'Darwa camel aux herbes 300g', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 115, 140, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(799, '121131', '0.00', 'Darwa camel 300g', '', '0.00', '0.00', '0.00', '105.00', 0, '0.00', 105, 125, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(800, '121132', '0.00', 'Darwa snam camel 1kg', '', '0.00', '0.00', '0.00', '155.00', 0, '0.00', 155, 185, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(801, '121133', '0.00', 'Darwa snam camel grain katan 1kg', '', '0.00', '0.00', '0.00', '185.00', 0, '0.00', 185, 220, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(802, '121134', '0.00', 'Al hilal balaie dore argente', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(803, '121135', '0.00', 'Darwa camel aux herbes 80g', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 55, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(804, '121136', '0.00', 'Darwa camel 80g', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(805, '121137', '0.00', 'Darwa camel 230g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(806, '121138', '0.00', 'Darwa camel aux figues 230g', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(807, '121139', '0.00', 'Darwa aux herbes 150g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(808, '121140', '0.00', 'Khlii au darwa de camel 350g', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 120, 145, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(809, '121141', '0.00', 'Khlii de camel 200g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(810, '121142', '0.00', 'Creme au darwa de camel 50g', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(811, '121143', '0.00', 'Creme au darwa de camel 100g', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 80, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(812, '121144', '0.00', 'Hair oil with camels darwa 50ml', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(813, '121145', '0.00', 'Ghasoul pour femme 200g', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(814, '121146', '0.00', 'Argile blanche marocaine', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(815, '121147', '0.00', 'Argile rouge marocaine', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(816, '121148', '0.00', 'Mask hair with henna', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(817, '121149', '0.00', 'Alk', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(818, '121150', '0.00', 'Kamcha', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(819, '121151', '0.00', 'Takia', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 43, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(820, '121152', '0.00', 'Akaya', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(821, '121153', '0.00', 'Al katef', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(822, '121154', '0.00', 'Sadra verte', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(823, '121155', '0.00', 'Ataleh', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 43, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(824, '121156', '0.00', 'Cumin arrak', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 38, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(825, '121157', '0.00', 'Hair color with henna and herbes', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(826, '121174', '0.00', 'ChikiNet 12sacs po 35L zentek', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 11, NULL, '', '', '0000-00-00 00:00:00', 15, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(827, '121186', '0.00', 'Alkhayrat savon nilla', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(828, '121187', '0.00', 'Alkhayrat creme aloubane', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 80, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(829, '121188', '0.00', 'Alkhayrat hair oil', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 80, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(830, '121189', '0.00', 'Alkhayrat sesame oil', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 75, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(831, '121190', '0.00', 'Alkhayrat rose water', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(832, '121191', '0.00', 'Creme de soin articulations alkh', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 200, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(833, '121192', '0.00', 'Alkhayrat coffee gommage', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(834, '121193', '0.00', 'Alkhayrat almond gommage', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 100, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(835, '121194', '0.00', 'Alkhayrat chufa oil to enlarge', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 100, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(836, '121195', '0.00', 'Concentrated oil for hair alkhay', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 100, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(837, '121202', '0.00', 'Mop avec manche', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 60, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(838, '121203', '0.00', 'parfume pos', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 45, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(839, '2090917', '0.00', '10 Brochettes viande de chameau', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '5', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 1),
(840, '121231', '0.00', 'Filets viande de chameau 400g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(841, '121232', '0.00', 'Viande hachee de chameau 400g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(842, '121248', '0.00', 'scotch', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(843, '121251', '0.00', 'Embalage pizza N24 50u', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 72, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(844, '121252', '0.00', 'Embalage pizza N26 50u', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 78, 80, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(845, '121253', '0.00', 'Embalage pizza N 31 50u', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 90, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(846, '121254', '0.00', 'Embalage pizza N29 50u', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(847, '121295', '0.00', 'Lavande 40g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(848, '121296', '0.00', 'Babounj 40g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(849, '121297', '0.00', 'Azir 40g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(850, '121302', '0.00', 'Alkhayrat aker fassi soap', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(851, '121303', '0.00', 'Alkhayrat flaxseed oil', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 99, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(852, '121304', '0.00', 'Alkhayrat sweet almond oil', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 110, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(853, '121305', '0.00', 'Alkhayrat bitter almond oil', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 110, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(854, '121315', '0.00', 'Plateau argente sur 2', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(855, '121316', '0.00', 'Tatch couverts de table inox', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 199, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(856, '121318', '0.00', 'Assiettes blanche', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(857, '121319', '0.00', 'Verre Ã  cafe + assiettes', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 90, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(858, '121346', '0.00', 'Ticket promo normale', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 10, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(859, '121347', '0.00', 'Ticket promo weekend', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(860, '121348', '0.00', 'Frescamar crevette gris 1,4kg', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 160, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(861, '121356', '0.00', 'Tasse+soutasse', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 21, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(862, '121357', '0.00', 'Chat decor grande', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 100, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(863, '121358', '0.00', 'Bavettes 10 pcs', '', '0.00', '0.00', '0.00', '6.00', 0, '8.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(864, '121373', '0.00', 'The ain el baida 500g', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 43, 49, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(865, '121374', '0.00', 'The ain el baida 200g 41022', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(866, '121376', '0.00', 'Pois casse 500g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(867, '121383', '0.00', 'Pack cosmetic camel', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 180, 240, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(868, '121392', '0.00', 'Alia miette de thon 2kg', '', '0.00', '0.00', '0.00', '98.00', 0, '0.00', 98, 119, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(869, '121398', '0.00', 'Pinta dubois coffee machine', '', '0.00', '0.00', '0.00', '1000.00', 0, '0.00', 1000, 1199, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(870, '121399', '0.00', 'Popping candy gerio 2g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(871, '121414', '0.00', 'Juper valencia orange 1L', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(872, '121423', '0.00', 'Ritter sport chocolat 16.67g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(873, '121455', '0.00', 'Spray mop', '', '0.00', '0.00', '0.00', '107.00', 0, '0.00', 110, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(874, '121501', '0.00', 'Livre tabraa alhassani', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(875, '121502', '0.00', 'Livre rakassat alwajaa', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(876, '121503', '0.00', 'Livre misk alharam', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(877, '121504', '0.00', 'Clock decore', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 120, 160, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(878, '121505', '0.00', 'Moon bounce', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 115, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(879, '121506', '0.00', 'tasse Ã  motif kids', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(880, '121507', '0.00', 'Ballon kids', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(881, '121508', '0.00', 'Music doll', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 45, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(882, '121509', '0.00', 'Led night light 0.5w', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 12, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(883, '121510', '0.00', '', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(884, '121511', '0.00', 'Lamp set procelain', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(885, '121512', '0.00', 'Quakey float sauvetage', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 60, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(886, '121514', '0.00', 'Poupee avec sonnerie', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(887, '121515', '0.00', 'Vase rose grand', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 130, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(888, '121516', '0.00', 'Poupee makam petite', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(889, '121517', '0.00', 'Poupee makam grande', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 45, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(890, '121518', '0.00', 'Decor fusee grand', '', '0.00', '0.00', '0.00', '200.00', 0, '0.00', 200, 250, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(891, '121520', '0.00', 'Ya di si coeur decore', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 45, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(892, '121529', '0.00', 'Vase rose petit', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 65, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(893, '121547', '0.00', 'Alkhayrat chickpea oil', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 95, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(894, '121548', '0.00', 'Enlargement cream alkhayrat', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 150, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(895, '121549', '0.00', 'Bitter almond oil pack duo', '', '0.00', '0.00', '0.00', '195.00', 0, '0.00', 195, 220, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(896, '121558', '0.00', 'Lamacom fourchette inox petits', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 11, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(897, '121562', '0.00', 'Pandiani verres ovale pack 3', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 165, 210, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(898, '121566', '0.00', 'Challa filets de maqueraux 2kg', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 81, 99, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(899, '121569', '0.00', 'Challa thon entier 80g*3', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(900, '121572', '0.00', 'Une heure un enfant', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(901, '121573', '0.00', 'Une heure deux enfants', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(902, '121574', '0.00', 'Une heure 3 enfants', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(903, '121588', '0.00', 'Mask face with nila', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 29, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(904, '121589', '0.00', 'Sesame oil 50 ml ibdaa alsahara', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(905, '121590', '0.00', 'Huile de grains de lin 50ml ibda', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(906, '121591', '0.00', 'Huile d''argan 100ml basmat ibdaa', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 48, 59, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(907, '121592', '0.00', 'Huile d''argan 60ml basmat ibdaa', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 44, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(908, '121593', '0.00', 'Huile de ricin basmat ibdaa', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(909, '121594', '0.00', 'Huile de glicirine basmat ibdaa', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(910, '121595', '0.00', 'Huile de citron basmat ibdaa', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(911, '121596', '0.00', 'Bitter almond oil 50ml basmat ib', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(912, '121597', '0.00', 'Huile d''amande douce basmat ibda', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(913, '121598', '0.00', 'Nila sahraouia 20g basmat ibdaa', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(914, '121599', '0.00', 'Black soap with lavander & nila', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(915, '121600', '0.00', 'Black soap with aaker fassi', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(916, '121601', '0.00', 'Black soap with eucalyptus & nil', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(917, '121602', '0.00', 'Camel''s hump loudek 300g', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 95, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(918, '121603', '0.00', 'Foot scrub cream with peak camel', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(919, '121604', '0.00', 'Indesit whirlpool congelateur os', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1500, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(920, '121610', '0.00', 'Kids card dakhla *10', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 240, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(921, '121611', '0.00', 'Kids card laayoune *20', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 300, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(922, '121631', '0.00', 'Soap liquide violet', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(923, '121632', '0.00', 'Pack femme prestige', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 115, 145, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(924, '121633', '0.00', 'Bonomi serie de 3 poeles granit', '', '0.00', '0.00', '0.00', '275.00', 0, '0.00', 280, 380, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(925, '121642', '0.00', 'Laccor original 4pcs bakewar set', '', '0.00', '0.00', '0.00', '190.00', 0, '0.00', 194, 265, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(926, '121644', '0.00', 'Bonomi plaque a grillade 45cm', '', '0.00', '0.00', '0.00', '280.00', 0, '0.00', 285, 390, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(927, '121647', '0.00', 'Zafran date sukari 3kg', '', '0.00', '0.00', '0.00', '63.00', 0, '0.00', 64, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(928, '121648', '0.00', 'Sucre semoule lavazza 1kg', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(929, '121680', '0.00', 'Lipstick li dan xiu', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 4, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(930, '121689', '0.00', 'Ekbal dattes 5kg', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 145, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(931, '121691', '0.00', 'Kinder cards 1 pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(932, '121692', '0.00', 'Bavette 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(933, '121693', '0.00', 'Wanny kids ticket 20 heures', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 300, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(934, '121707', '0.00', 'kids picture frames', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(935, '121713', '0.00', 'Sidi ali pack 2L *4', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 23, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(936, '121714', '0.00', 'Bahia pack 1.5L *6', '', '0.00', '0.00', '0.00', '21.00', 0, '27.00', 21, 26, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(937, '121715', '0.00', 'Bahia pack 60cl *12', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 29, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(938, '121716', '0.00', 'Bahia pack 2L *4', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(939, '121717', '0.00', 'Ciel pack 33cl *12', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 23, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(940, '121718', '0.00', 'Ciel pack 1.5L *6', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 23, 25, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(941, '121745', '0.00', 'Une heure offre WDK', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 20, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(942, '121747', '0.00', 'Sachet bonbons G', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 21, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(943, '121786', '0.00', 'Wanny kids fete aachoura', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(944, '121899', '0.00', 'Dar al adama sucre glace 1kg', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(945, '121900', '0.00', 'Chamsse sucre granule 5kg', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 26, 29, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(946, '121901', '0.00', 'Chamsse sucre glace 5kg', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 30, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(947, '121902', '0.00', 'Oceo filets maquereaux 125g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(948, '121903', '0.00', 'Axe deo dark temptation 150ml', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(949, '121904', '0.00', 'Flameless led tealight 1pcs', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(950, '121907', '0.00', 'Happy ballon divers', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(951, '121908', '0.00', 'Cutlery cuillere plastic', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(952, '121910', '0.00', 'Sac cadeau anniversaire moyen', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(953, '121911', '0.00', 'Sac cadeau anniversaire grande', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(954, '121912', '0.00', 'Foil balloon helium 14 pcs', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 28, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(955, '121913', '0.00', 'Chapeau happy long cotton dore', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(956, '121914', '0.00', 'Tongle party baloon 100pcs', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(957, '121915', '0.00', 'Tongle party baloon coeur 100pcs', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(958, '121916', '0.00', 'TongQuan balloon petites 100pcs', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 32, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(959, '121917', '0.00', 'Candle number led', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(960, '121918', '0.00', 'Foil balloon with tige', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(961, '121919', '0.00', 'Candle happy birthday 18cm', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 23, 29, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(962, '121920', '0.00', 'Candle happy birthday 15cm', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 26, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(963, '121925', '0.00', 'Woogie bonbon miel 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(964, '121927', '0.00', 'Colorant alimentaire mixte 30g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(965, '121930', '0.00', 'Disposable plastic gloves 100pcs', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(966, '121931', '0.00', 'Papagena boule de gaufrette 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(967, '121940', '0.00', 'The kantaoui 200g boite divers 4', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 22, 25, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(968, '121944', '0.00', 'bracelet kids', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 5, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(969, '121945', '0.00', 'Petit clown', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 15, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(970, '121946', '0.00', 'Chat decor moyen', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 90, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(971, '121947', '0.00', 'Chat decor petite', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 80, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(972, '121948', '0.00', 'Chien decor', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 100, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(973, '121950', '0.00', 'Amlou cacahuete arsmouki 500ml', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 18, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(974, '121951', '0.00', 'Demi heure kids wanny dakhla', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(975, '121952', '0.00', 'Oeuf dinde 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(976, '122003', '0.00', 'Porte brousses a dents', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(977, '122096', '0.00', 'Small Toys', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(978, '122123', '0.00', 'Kenza confitura abricots 300g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(979, '122124', '0.00', 'Kenza confiture fraises 300g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(980, '122125', '0.00', 'Kenza confiture abricots 700gr', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(981, '122126', '0.00', 'Kenza confiture fraises 700gr', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(982, '122127', '0.00', 'Oceo thon Ã  huile vg 80g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(983, '122128', '0.00', 'Oceo thon  sauce tomate 80g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(984, '122130', '0.00', 'Forno pasta fussili colore 400g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(985, '122132', '0.00', 'Forno pasta  penne 400g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(986, '122133', '0.00', 'Forno pasta fussili 400gr', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(987, '122134', '0.00', 'Forno pasta gnocchi 400g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(988, '122135', '0.00', 'Forno pasta vermicelle 400g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(989, '122136', '0.00', 'Rico gaufrette choco 180g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(990, '122137', '0.00', 'Rico geant vanille 180g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(991, '122143', '0.00', 'Damti cube de bouillon special h', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(992, '122147', '0.00', 'Huile d''olive 750ml ain asserdou', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 58, 80, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(993, '122153', '0.00', 'Bougie chiffre doree', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(994, '122154', '0.00', 'Party popper mini', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(995, '122155', '0.00', 'Party popper transparent G', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 23, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(996, '122161', '0.00', 'Pailles pop corne', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(997, '122164', '0.00', 'Boite pop corne 10pcs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(998, '122165', '0.00', 'masque papillon', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 12, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(999, '122172', '0.00', 'Panda film alimentaire 500m', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 43, 50, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1000, '122213', '0.00', 'Rosalio champignons 12g noirs', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1001, '122214', '0.00', 'Rosalio champignons noirs seches 25g', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 8, 11, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1002, '123006', '0.00', 'Moule Ã  chocolat en plastique', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1003, '123007', '0.00', 'Smogin mini perles 1kg', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 180, 190, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1004, '123008', '0.00', 'Crispo confetti 1000g', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 180, 190, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1005, '123009', '0.00', 'Decorador pasteles 3pcs', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1006, '123010', '0.00', 'Spring form cake pans set of 3 p', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 80, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1007, '123011', '0.00', 'Moule Ã  gateau carre', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 23, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1008, '123012', '0.00', 'Moule Ã  gateaux cercle', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 23, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1009, '123013', '0.00', 'moules Ã  gateaux 5pcs', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 130, 160, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1010, '123020', '0.00', 'Pack cosmetic camel 3pcs', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 110, 150, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1011, '123024', '0.00', 'Miss istanbul 520 feuilles', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 24, NULL, '', '', '0000-00-00 00:00:00', 21, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1012, '123034', '0.00', 'Lamacom couverts inox P 6pcs', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1013, '123038', '0.00', 'Tatch couverts dore 24 pcs', '', '0.00', '0.00', '0.00', '195.00', 0, '0.00', 200, 280, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1014, '123058', '0.00', 'Sanoshi blender 2in1 YT 4677 A G', '', '0.00', '0.00', '0.00', '220.00', 0, '0.00', 225, 280, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1015, '124068', '0.00', 'Couscous aux herbes sahara gold', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1016, '124069', '0.00', 'Bon d''achat', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 300, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1017, '124075', '0.00', 'Chaussette wanny kids', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 21, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1018, '124080', '0.00', 'Vannamei crevette 2Kg 40/50', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 175, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1019, '124081', '0.00', 'Almahsoul gofio d''orge 900gr', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1020, '124082', '0.00', 'Almahsoul herbal ble  1kg', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1021, '124083', '0.00', 'Almahsoul herbal de ble entier 1', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1022, '124084', '0.00', 'Almahsoul couscous ble complet 9', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 15, 21, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1023, '124085', '0.00', 'Almahsoul couscous azenbo 900gr', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 30, 34, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1024, '124086', '0.00', 'Almahsoul zamitta azenbo 900gr', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 34, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1025, '124087', '0.00', 'Challa thon entier HV 400g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1026, '125005', '0.00', 'Delcielo champignons de paris', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1027, '125087', '0.00', 'Arkam miel', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 135, 150, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1028, '126072', '0.00', 'Bony gum fraise', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1029, '126083', '0.00', 'Aiguebelle amandes effilees 1kg', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 120, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1030, '127038', '0.00', 'Frite fin  2.5kg', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 0, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1031, '127052', '0.00', 'Dattes al ahbab vert', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 70, 65, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1032, '127053', '0.00', 'Dattes copperative dayaate ennou', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 85, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1033, '127069', '0.00', 'Good britha pistach', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 135, 160, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1034, '128000', '0.00', 'Ballon', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1035, '128001', '0.00', 'Dubois capriccio sachet 1.8g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1036, '128018', '0.00', 'Depiliss cire cartouche miel 100', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1037, '128021', '0.00', 'Aloevera lipstick', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1038, '128050', '0.00', 'Kroon & fils fromage fondu  2 kg', '', '0.00', '0.00', '0.00', '132.00', 0, '0.00', 133, 160, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1039, '128051', '0.00', 'plateau oeuf de dinde 20 pcs', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 47, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1040, '128054', '0.00', 'Nuggets surgele 800g', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 50, 65, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1041, '128055', '0.00', 'Tenders surgele 800g', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 50, 65, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1042, '128065', '0.00', 'Janat al nakhil 3kg', '', '0.00', '0.00', '0.00', '112.00', 0, '0.00', 112, 125, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1043, '129006', '0.00', 'Santa rosa crevettes 40/50 2kg', '', '0.00', '0.00', '0.00', '170.00', 0, '0.00', 170, 180, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1044, '140011', '0.00', 'MDM miel caroubier 300g', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1045, '140012', '0.00', 'Miel de thym 300g', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 80, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(1046, '140041', '0.00', 'Plateau oeufs dinde 10 pcs', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1047, '140048', '0.00', 'Datte al assil majhoul 2kg', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 140, 169, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1048, '140049', '0.00', 'Pretty single matte eye shadaw 3', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 37, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1049, '140050', '0.00', 'Pretty eyebrow shadaw 3.5g', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 43, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1050, '140051', '0.00', 'Pretty stars baked eye shadaw 3.', '', '0.00', '0.00', '0.00', '46.00', 0, '0.00', 46, 71, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1051, '140052', '0.00', 'Pretty baked highlighter 7.5g', '', '0.00', '0.00', '0.00', '49.00', 0, '0.00', 49, 78, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1052, '140053', '0.00', 'Pretty quartet eye shadaw 8g', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 43, 71, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1053, '140054', '0.00', 'Pretty bronze powder 7.5g', '', '0.00', '0.00', '0.00', '46.00', 0, '0.00', 46, 83, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1054, '140055', '0.00', 'Pretty baked Powder 7.5g', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 83, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1055, '140059', '0.00', 'Pretty essential nail enamel 9ml', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 19, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1056, '140060', '0.00', 'Mattifying pressed powder 9g', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 51, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1057, '140090', '0.00', 'Pretty stick concealer 5.3g', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 35, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1058, '140091', '0.00', 'Pretty rouge matte lipstick 4g', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 51, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1059, '140092', '0.00', 'Pretty  stay true lipstick 4g', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 51, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1060, '140093', '0.00', 'Pretty essential lipstick 4g', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 51, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1061, '140094', '0.00', 'Pretty pressed powder 9g', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 51, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1062, '140095', '0.00', 'Pretty blush 9g', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 51, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1063, '140096', '0.00', 'Pretty matte blush 9g', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 51, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1064, '140097', '0.00', 'Pretty matte nail enamel 9ml', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 19, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1065, '140098', '0.00', 'Pretty baked blush 7.5g', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 83, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1066, '140099', '0.00', 'Pretty single eye shadow 3.5g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 37, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1067, '140100', '0.00', 'Pain complet dkl', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1068, '140103', '0.00', 'The attamine boite bleu 200g 3A', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 24, 27, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1069, '140104', '0.00', 'The attamine qlt sup 500g bleu 6A', '', '0.00', '0.00', '0.00', '51.00', 0, '0.00', 52, 68, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1070, '140105', '0.00', 'The attamine qlt sup 500g boite', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 59, 69, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1071, '140107', '0.00', 'Pretty mattifying primer 30ml', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 52, 75, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1072, '140108', '0.00', 'Pretty illiminating primer 30ml', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 52, 75, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1073, '140109', '0.00', 'Pretty get real matte foundation', '', '0.00', '0.00', '0.00', '78.00', 0, '0.00', 78, 111, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1074, '140110', '0.00', 'Pretty BB cream 30ml', '', '0.00', '0.00', '0.00', '39.00', 0, '0.00', 39, 62, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1075, '140111', '0.00', 'Pretty hi cover foundation 30ml', '', '0.00', '0.00', '0.00', '78.00', 0, '0.00', 78, 112, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1076, '140112', '0.00', 'Pretty matte liquid lipstick 6.5', '', '0.00', '0.00', '0.00', '39.00', 0, '0.00', 39, 61, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1077, '140129', '0.00', 'Pretty high definition mascara 1', '', '0.00', '0.00', '0.00', '39.00', 0, '0.00', 39, 61, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1078, '140130', '0.00', 'Pretty extra volumizing mascara', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 36, 65, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1079, '140131', '0.00', 'Pretty curling mascara 12.5ml', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 33, 63, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1080, '140132', '0.00', 'Pretty waterproof lengthening ma', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 36, 79, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1081, '140133', '0.00', 'Pretty stay true lip gloss 6.5ml', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 51, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1082, '140134', '0.00', 'Pretty cover up liquid concealer', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 49, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1083, '140135', '0.00', 'Pretty lip balm 4.8g', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1084, '140136', '0.00', 'Pretty eyebrow mascara 4.5ml', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 56, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1085, '140137', '0.00', 'Pretty liquid eyeliner 3.5ml', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1086, '140138', '0.00', 'Pretty vinly dipliner 3.5ml', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 33, 48, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1087, '140139', '0.00', 'Pretty matte dipliner 3.5ml', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 33, 48, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1088, '140140', '0.00', 'Pretty eyebrow essentials kit', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 42, 64, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1089, '140141', '0.00', 'Pretty eyeshadow palette 9g', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 77, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1090, '140142', '0.00', 'Pretty gel eyeliner black 2.8g', '', '0.00', '0.00', '0.00', '54.00', 0, '0.00', 54, 81, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1091, '140143', '0.00', 'Pretty ultimate dipliner black 3', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1092, '140158', '0.00', 'Plateau the double', '', '0.00', '0.00', '0.00', '700.00', 0, '0.00', 700, 850, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1093, '140165', '0.00', 'Candle flame 1pcs 18cm', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1094, '140166', '0.00', 'Candle flame 1pcs 15cm', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1095, '140170', '0.00', 'Heron maxi gel anti cafards', '', '0.00', '0.00', '0.00', '73.00', 0, '0.00', 73, 88, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1096, '140185', '0.00', 'Ever silk paper hygienic *4', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1097, '140192', '0.00', 'Nour huile de menthe poivree 60m', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1098, '140196', '0.00', 'Bubbaloo', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1099, '140197', '0.00', 'What''s up sucette', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1100, '140198', '0.00', 'Huile d''olive 1L', '', '0.00', '0.00', '0.00', '47.00', 0, '0.00', 47, 55, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1101, '140203', '0.00', 'Wheat flour tortillas 30cm', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 32, 38, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1102, '140204', '0.00', 'Dinner spoons 24 pcs', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1103, '140205', '0.00', 'Hachoir des fines herbes inox', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1104, '140208', '0.00', 'Pongal recharge mop', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 29, 35, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1105, '140209', '0.00', 'Recharge raclette', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1106, '140210', '0.00', 'Clotheshorse', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 24, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1107, '140211', '0.00', 'Jex fin', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1108, '140213', '0.00', 'Disposable decorating 18 inch', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1109, '140214', '0.00', 'Fleur tige decor anniversaire', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1110, '140218', '0.00', 'Saga etagere Ã  epices in115', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 18, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1111, '140225', '0.00', 'accessoire anniversaire tige', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1112, '140226', '0.00', 'Assiette Ã  gateau dore petite', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1113, '140227', '0.00', 'Verre 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1114, '140230', '0.00', 'Goblet jus cocktail 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1115, '140233', '0.00', 'Dates nourhane 5kg', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 120, 145, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1116, '140240', '0.00', 'Deluxe folding drying rack', '', '0.00', '0.00', '0.00', '230.00', 0, '0.00', 234, 290, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1117, '140243', '0.00', 'Gelas sloki 6 buah glass 6pcs', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 112, 140, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1118, '140252', '0.00', 'Tatch bouilloire electr KE1802', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 127, 155, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1119, '140253', '0.00', 'Laccor electric kettle BL8005', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 102, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1120, '140257', '0.00', 'Plat pizza en bois moyen', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 52, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1121, '140265', '0.00', 'Daisini  double grill pan 32', '', '0.00', '0.00', '0.00', '220.00', 0, '0.00', 225, 275, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1122, '140270', '0.00', 'Bonomi poele alarme 24cm', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 127, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1123, '140271', '0.00', 'Bonomi pele diamond 26cm', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 86, 110, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1124, '140274', '0.00', 'Lamacom poele a frite 24cm', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 132, 165, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1125, '140278', '0.00', 'Laccor 3pcs bake ware 006', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 127, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1126, '140279', '0.00', 'wanny laayoune kids bon fete', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1127, '140290', '0.00', 'wanny laayoune kids bon fete', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1128, '140299', '0.00', 'Ticket 1H30min kids wanny', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1129, '140300', '0.00', 'bon fete ticket 15min', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 10, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1130, '140301', '0.00', 'bon fete ticket 25dh', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1131, '140302', '0.00', 'Bon fete 30min', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1132, '140303', '0.00', 'Bon fete 10 heures', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 200, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1133, '140319', '0.00', 'Allo special cuir 750ml', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1134, '140347', '0.00', 'Savon kef 125g petite', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1135, '140367', '0.00', 'Tools vehicle 2in1 AJ 661 188', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 153, 195, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1136, '140368', '0.00', 'Medical vehicle AJ 661 171', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 153, 195, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1137, '140407', '0.00', 'Verre hello jus', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 27, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1138, '140426', '0.00', 'Linas gel wc 1L', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1139, '140463', '0.00', 'Couscous 3 cereales essmara 1kg', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1140, '140472', '0.00', 'Eponge 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1141, '140473', '0.00', 'The moumtaz 500g 9371', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 40, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1142, '140486', '0.00', 'Louis Esspresso 1 Kg', '', '0.00', '0.00', '0.00', '94.00', 0, '0.00', 95, 105, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1143, '140487', '0.00', 'Gustolongo Espresso Blend 1 kg', '', '0.00', '0.00', '0.00', '81.00', 0, '0.00', 81, 90, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1144, '140488', '0.00', 'Paliccia Arabica Cafe 1 kg', '', '0.00', '0.00', '0.00', '83.00', 0, '0.00', 84, 93, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1145, '140489', '0.00', 'Paliacci robusta cafe 1kg', '', '0.00', '0.00', '0.00', '67.00', 0, '0.00', 68, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1146, '140491', '0.00', 'The al maksoud 500g 41022 boite', '', '0.00', '0.00', '0.00', '57.00', 0, '0.00', 58, 65, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1147, '140492', '0.00', 'The al oum 500g 41022 boite', '', '0.00', '0.00', '0.00', '62.00', 0, '0.00', 63, 70, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1148, '140493', '0.00', 'The al oum 200g 41022', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 24, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1149, '140494', '0.00', 'The al maksoud 200g 41022', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 22, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1150, '140495', '0.00', 'Condor batterie 1.5L', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1151, '140497', '0.00', 'Couvercle de table 20 u grand', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1152, '140513', '0.00', 'Tajine', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1153, '140676', '0.00', 'La hollandaise fromage 24 port', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 19, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1154, '140687', '0.00', 'Olive noir morakad 500g', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1155, '140688', '0.00', 'Olive noir garnit naturel 500g', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1156, '140689', '0.00', 'Olive vert garnit piquant 500g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1157, '140690', '0.00', 'Olive vert garnit naturel 500g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1158, '140691', '0.00', 'Pack epicerie', '', '0.00', '0.00', '0.00', '53.00', 0, '0.00', 53, 67, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1159, '140692', '0.00', 'Pack sanitaire', '', '0.00', '0.00', '0.00', '146.00', 0, '0.00', 146, 165, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1160, '140693', '0.00', 'Pack petit dejeuner', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 135, 159, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1161, '140703', '0.00', 'Kitkat mini', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1162, '140704', '0.00', 'Raclette en plastic', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1163, '140722', '0.00', 'Water purifier', '', '0.00', '0.00', '0.00', '175.00', 0, '0.00', 176, 200, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1164, '140725', '0.00', 'Sac noire grand', '', '0.00', '0.00', '0.00', '400.00', 0, '0.00', 400, 500, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1165, '140728', '0.00', 'Laccor ensemble caserole 5pcs', '', '0.00', '0.00', '0.00', '300.00', 0, '0.00', 302, 380, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1166, '140741', '0.00', 'Lamacom roulette pour chabakia', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1167, '140749', '0.00', 'Laccor 24 piece cutlery set', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 102, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1168, '140751', '0.00', 'Crealys couscousier', '', '0.00', '0.00', '0.00', '300.00', 0, '0.00', 305, 390, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1169, '140753', '0.00', 'Lamacom cuilleres 6pcs', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1170, '140757', '0.00', 'Rideau pour douche', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 56, 70, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1171, '140758', '0.00', 'Tapis petite', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 36, 45, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1172, '140760', '0.00', 'Tapis bubbles', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 46, 60, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1173, '140765', '0.00', 'Electric lunch box', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 101, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1174, '140766', '0.00', 'Nettoyeur poisson', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1175, '140768', '0.00', 'Tatch porte Ã  manger', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 96, 120, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1176, '140774', '0.00', 'Tafi thermos water jar 9.5L', '', '0.00', '0.00', '0.00', '200.00', 0, '0.00', 205, 260, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1177, '140775', '0.00', 'Arther martin fregidaire', '', '0.00', '0.00', '0.00', '1500.00', 0, '0.00', 1520, 1850, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1178, '140778', '0.00', 'Papier cuisson 50 feuilles', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 46, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1179, '140785', '0.00', 'Jia tai Tapis douche 3pcs', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 126, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1180, '140786', '0.00', 'Jia tai tapis douche 4 pcs', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 142, 175, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1181, '140832', '0.00', 'Petrin look in', '', '0.00', '0.00', '0.00', '800.00', 0, '0.00', 810, 1050, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1182, '140833', '0.00', 'Look in hachoir viande', '', '0.00', '0.00', '0.00', '550.00', 0, '0.00', 560, 700, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1183, '140834', '0.00', 'Tatch balance', '', '0.00', '0.00', '0.00', '400.00', 0, '0.00', 405, 540, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1184, '140836', '0.00', 'Laccor food processor BL 328', '', '0.00', '0.00', '0.00', '550.00', 0, '0.00', 555, 700, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1185, '140838', '0.00', 'Tvs moule 28cm et 30 cm', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 46, 58, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1186, '140850', '0.00', 'Thermos kens inox 2 pcs', '', '0.00', '0.00', '0.00', '220.00', 0, '0.00', 225, 270, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1187, '140851', '0.00', 'Thermos luxus inox 2pcs', '', '0.00', '0.00', '0.00', '199.00', 0, '0.00', 205, 260, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1188, '140853', '0.00', 'Luminarc verre 1pcs', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 18, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1189, '140859', '0.00', 'Tatch four 5 feu inox', '', '0.00', '0.00', '0.00', '1450.00', 0, '0.00', 1480, 1800, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1190, '140863', '0.00', 'Flora ensemble douche', '', '0.00', '0.00', '0.00', '170.00', 0, '0.00', 175, 210, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1191, '140870', '0.00', 'Bekhara china cannette', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 153, 190, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1192, '140872', '0.00', 'Pandiani cake mould 24 pcs', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 51, 65, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1193, '140873', '0.00', 'Delys curdent en bois', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 50, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1194, '140874', '0.00', 'Bol blanche', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1195, '140875', '0.00', 'Bol en verre Ã  motif fruits', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1196, '140878', '0.00', 'Calconut amande poudre 1kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 110, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1197, '140893', '0.00', 'Citron 1kg', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 12, 25, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1198, '140894', '0.00', 'Creme patissiere en poudre 5kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 69, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1199, '140896', '0.00', 'Glucose 5kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 84, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1200, '140898', '0.00', 'Papier surfilise 5kg', '', '0.00', '0.00', '0.00', '220.00', 0, '0.00', 220, 245, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1201, '140899', '0.00', 'Safran 3g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 37, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1202, '140900', '0.00', 'Smen 1kg', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 100, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1203, '140904', '0.00', 'Bouteille press orange 1L', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1204, '140906', '0.00', 'Luxus procelain ware tasse 6pcs', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 180, 230, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1205, '140911', '0.00', 'Farine megli oued eddahab 900g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1206, '140913', '0.00', 'Balayeur', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1207, '140915', '0.00', 'Spray oil inox', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 44, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1208, '140917', '0.00', 'Boite microwave rouge', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1209, '140918', '0.00', 'Carafe en verre solo', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1210, '140919', '0.00', 'Brosse wc life is beautiful', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 17, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1211, '140920', '0.00', 'Verre 1pcs mod france', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1212, '140921', '0.00', 'Soupira blanche', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 70, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1213, '140922', '0.00', 'Gourmet sandwich 1pcs', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1214, '140923', '0.00', 'Egoutoir crome avec plat plastic', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 150, 190, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1215, '140924', '0.00', 'Tatch raclette grill', '', '0.00', '0.00', '0.00', '350.00', 0, '0.00', 350, 440, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1216, '140927', '0.00', 'Chay ain arrag 500g 41022', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 43, 50, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1217, '140931', '0.00', 'Rafaello 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1218, '140932', '0.00', 'Assiette blanche cercle grande', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 46, 58, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1219, '140933', '0.00', 'Assiette blanche S', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1220, '140934', '0.00', 'Assiette blanche M', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 11, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1221, '140935', '0.00', 'Assiette blanche XL', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1222, '140936', '0.00', 'Assiette blanche L', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 18, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1223, '140941', '0.00', 'Couteau inox et plastic petit', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1224, '140944', '0.00', 'Fota lagarto colore 80% poliester', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1225, '140945', '0.00', 'Serviette lagarto bleu raye', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1226, '140946', '0.00', 'Serviette lagarto bleu raye petits', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1227, '140948', '0.00', 'Serviette raye colore', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1228, '140949', '0.00', 'Fota lagarto 1pcs petit lagarto', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1229, '140950', '0.00', 'Mini tableau', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 69, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1230, '150035', '0.00', 'Nescafe dolce gusto 16 cps', '', '0.00', '0.00', '0.00', '53.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1231, '150165', '0.00', 'Lakhliaa dakhla moyen', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 100, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1232, '150166', '0.00', 'Lakhliaa dakhla petit', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1233, '150167', '0.00', 'Loudek dakhla petit', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 48, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1234, '150168', '0.00', 'Loudek dakhla grand', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 80, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1235, '150201', '0.00', 'Demi heure kids W LA normale', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 10, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1236, '150202', '0.00', 'Demi heure kids W LA wekend', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1237, '150279', '0.00', 'Jben lait de chamelle', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1238, '150282', '0.00', 'Saad dattes 5kg', '', '0.00', '0.00', '0.00', '155.00', 0, '0.00', 155, 180, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1239, '150283', '0.00', 'test', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1240, '150285', '0.00', 'Pascual flan creme caramel 100g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 4, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1241, '150305', '0.00', 'Lav verre 1pcs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1242, '150306', '0.00', 'Huile d''olive 5L', '', '0.00', '0.00', '0.00', '255.00', 0, '0.00', 255, 290, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1243, '150309', '0.00', 'Ocean deli crevette 2kg 40/50', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 160, 190, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1244, '150316', '0.00', 'Date yosra alaarche 5kg', '', '0.00', '0.00', '0.00', '155.00', 0, '0.00', 155, 179, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1245, '150319', '0.00', 'Ticket anniversaire 2', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 2817, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1246, '150320', '0.00', 'Lavazza sucre semoule 500g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 15, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1247, '150326', '0.00', 'Pack happy birthday 3pcs', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 35, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1248, '150327', '0.00', 'Boujie happy birthday to you', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 23, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1249, '150328', '0.00', 'Caissette blanche moyenne', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1250, '150329', '0.00', 'Scented candle in glass', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1251, '150330', '0.00', 'Pack boujie long 4pcs', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1252, '150331', '0.00', 'Party ballon chain', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 91, 110, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1253, '150333', '0.00', 'Guirland happy moyen', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1254, '150336', '0.00', 'Taj happy birthday electrique', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1255, '150342', '0.00', 'Colorant alimentaire blanc 30g', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1256, '150343', '0.00', 'Colorant alimentaire lake 10g', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 33, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1257, '150344', '0.00', 'Gloves powder free 100pcs', '', '0.00', '0.00', '0.00', '82.00', 0, '0.00', 83, 105, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1258, '150345', '0.00', 'Pack happy 6pcs', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 39, 46, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1259, '150354', '0.00', 'Moi 2 moche et mechant music', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 65, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1260, '150392', '0.00', 'Ticket offre 2 heures normal', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1261, '150393', '0.00', 'Ticket offre 2 heures week end', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1262, '150398', '0.00', 'Tornado gyro combat', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 27, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1263, '150400', '0.00', 'Ben 10 alien force 002A', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 37, 60, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1264, '150402', '0.00', 'Dattes naturelles 1kg', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 37, 44, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1265, '150403', '0.00', 'Ideal cacao poudre sachet 7g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1266, '150416', '0.00', 'Cadre retro sport', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 56, 70, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1267, '150422', '0.00', 'Porcelain dolls collection', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1268, '150424', '0.00', 'Ballon petite for kids', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 6, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1269, '150425', '0.00', 'Porte cle for kids', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 4, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1270, '150426', '0.00', 'small ball for kids MKM', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 6, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1271, '150464', '0.00', 'Gourmet frito tomate pack 3', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 4, 12, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1272, '150466', '0.00', 'Papagena boules coco 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1273, '150469', '0.00', 'Meuble etagere de salle de bain', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 220, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1274, '150472', '0.00', 'Date star deglet nour 1kg', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 39, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1275, '150478', '0.00', 'Pain baguette', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1276, '150483', '0.00', 'ChikiNet serpilliere coton 70*50', '', '0.00', '0.00', '0.00', '3.00', 0, '4.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1277, '150484', '0.00', 'Almahsoul finot de ble beldi 1kg', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1278, '150506', '0.00', 'Solis tomate frito 360g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1279, '150516', '0.00', 'Kinder bueno 1pcs', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 4, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1280, '150517', '0.00', 'Plateau miror dore', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 140, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1281, '150520', '0.00', 'Heroga gofio bleu 900g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 16, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1282, '150523', '0.00', 'Ferrero rocher 1pcs', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1283, '150524', '0.00', 'Brosse Ã  tete', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1284, '150526', '0.00', 'Verres tymbark 1pcs', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1285, '150543', '0.00', 'Gomy gomme', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1286, '150546', '0.00', 'Sucette colore', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1287, '150550', '0.00', 'Lacasa chocolate promo', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1288, '150553', '0.00', 'Cravate fleur anniversaire 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1289, '150563', '0.00', 'King sauce moutarde 2kg', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 33, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1290, '150568', '0.00', 'BonBon Bum sucette 17g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1291, '150570', '0.00', 'Offre kalise natillas+asinez', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1292, '150588', '0.00', 'Smarties mini', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1293, '150589', '0.00', 'Quaity street 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1294, '150600', '0.00', 'Accord poele en aluminium 24cm', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 76, 95, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1295, '150615', '0.00', 'Kraft line cafetera KP300', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1296, '150621', '0.00', 'Luissant tetera de acero 2.5L', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 97, 120, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1297, '150628', '0.00', 'Kraft line cafetera KP600', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 82, 100, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1298, '150632', '0.00', 'Tatch classic verre cercle 1pcs', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 46, 60, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1299, '150633', '0.00', 'Pandiani classic verre cercle 2pcs', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 76, 95, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1300, '150634', '0.00', 'Pandiani classic verres pack 3', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 165, 230, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1301, '150639', '0.00', 'Prima presse orange 1.2L', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 138, 170, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1302, '150641', '0.00', 'Pack promo petit dejeuner', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 43, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1303, '150643', '0.00', 'Swiss  line couvercle de table', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1304, '150644', '0.00', 'Elite cuillere Ã  the inox 9744', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(1305, '150645', '0.00', 'Fleur metal fassia moule 30', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 97, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1306, '150648', '0.00', 'Leonardo tea pot 0.8L', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 85, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1307, '150667', '0.00', 'Dattes qoutouf sukari 3kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 110, 125, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1308, '150668', '0.00', 'Gullon wafer mix 60g', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1309, '150669', '0.00', 'Knoor 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1310, '150670', '0.00', 'Miel flodio 600g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1311, '150674', '0.00', 'Dattes hachimi 5kg', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 115, 135, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1312, '150675', '0.00', 'Almohagir sardine piq 125g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1313, '150678', '0.00', 'Sesta olives noires confites 850ml', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1314, '150688', '0.00', 'Fresh vite mouth spray 15ml', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1315, '150690', '0.00', 'Savon beldi Ã  l''argan 400g essaouira', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1316, '150694', '0.00', 'small toys kids', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 4, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1317, '150695', '0.00', 'Toothbrush holder D321', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 4, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1318, '150696', '0.00', 'Clipe porte feuille kids', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 4, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1319, '150697', '0.00', 'Vogue badge', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1320, '150698', '0.00', 'autocollants de voiture kids', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 3, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1321, '150699', '0.00', 'Mesure  taille du bebe', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 50, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1322, '150700', '0.00', 'Nounous petit', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 4, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1323, '150713', '0.00', 'Sac thank you grand', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1324, '150714', '0.00', 'Sac thank you moyen', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1325, '150715', '0.00', 'Sac thank you petit', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1326, '150716', '0.00', 'Ballon hello kity 10 pcs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1327, '150719', '0.00', 'Cup cake 12 pcs', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1328, '150721', '0.00', 'Boujie petit cercle', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1329, '150722', '0.00', 'Boite plastique 375g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1330, '150723', '0.00', 'Sachet frite P', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1331, '150724', '0.00', 'Pot sauce', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1332, '150730', '0.00', 'Fete 19/02', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 2241, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1333, '150731', '0.00', 'Fete 12/03', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 2357, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1334, '150740', '0.00', 'The attamine 500g super decore', '', '0.00', '0.00', '0.00', '41.00', 0, '0.00', 42, 48, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1335, '150741', '0.00', 'Jasso sani concentre 60ml', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1336, '150742', '0.00', 'Gota gota pigeon essaouira 125ml', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1337, '150751', '0.00', 'Cadre photo petit', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 5, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1338, '150752', '0.00', 'Grass head', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 5, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1339, '150759', '0.00', 'Printemps 9 % 30 vol 60ml', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 6, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1340, '150770', '0.00', 'Decor floral grande', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 45, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1341, '150771', '0.00', 'Decor floral moyen', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1342, '150772', '0.00', 'Decor floral petit', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1343, '150791', '0.00', 'Ferrero kusschen 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1344, '150793', '0.00', 'Number electrique', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1345, '150794', '0.00', 'Banner candle', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1346, '150796', '0.00', 'Cadeau love', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 46, 58, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1347, '150797', '0.00', 'Party favor masque', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1348, '150798', '0.00', 'Ballon helium 10 pcs', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1349, '150799', '0.00', 'Party popper dore petit', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1350, '150808', '0.00', 'Toys fly', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1351, '150810', '0.00', 'Boule en cristal cadeau', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1352, '150835', '0.00', 'Doussy savon 125g 1pcs', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1353, '150843', '0.00', 'Chabakia 1kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1354, '150874', '0.00', 'Forest beurre 500g', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 42, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1355, '150881', '0.00', 'Imany food graine de chia 200g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1356, '150882', '0.00', 'Dates alghaliya algerienne 2kg', '', '0.00', '0.00', '0.00', '67.00', 0, '0.00', 68, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1357, '150891', '0.00', 'Kroum miel d''orange 1kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 61, 72, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1358, '150892', '0.00', 'Kroum miel de thym 1kg', '', '0.00', '0.00', '0.00', '200.00', 0, '0.00', 202, 230, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1359, '150893', '0.00', 'Kroum miel d''euphobre 1kg', '', '0.00', '0.00', '0.00', '170.00', 0, '0.00', 172, 200, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1360, '150894', '0.00', 'Kroum miel d''eucalyptus 1kg', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 142, 170, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1361, '150895', '0.00', 'Kroum miel de charoon 1kg', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 152, 170, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1362, '150896', '0.00', 'The noir de chine boite 250g BT415', '', '0.00', '0.00', '0.00', '37.00', 0, '0.00', 37, 42, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1363, '150901', '0.00', 'Golden palm datte sukari 1kg', '', '0.00', '0.00', '0.00', '39.00', 0, '0.00', 40, 46, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1364, '150902', '0.00', 'Dates naturel zagoura 1kg', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 39, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1365, '150929', '0.00', 'Oualili vinaigre 50cl', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1366, '150931', '0.00', 'Paille colore', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1367, '150932', '0.00', 'Assala miel 250g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 10, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1368, '150945', '0.00', 'Demi heure un enfant', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1369, '150946', '0.00', 'Demi heure deux enfants plus', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1370, '150952', '0.00', 'Monogotas stick deo 92.1g', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 16, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1371, '150960', '0.00', 'Goblet en plastic transparent 100pcs', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1372, '150974', '0.00', 'Ketta sardine HV', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1373, '150979', '0.00', 'Bonomi theiere en verre 500ml', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 72, 90, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1374, '150980', '0.00', 'Bonomi theiere en verre 650ml', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 77, 95, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1375, '150983', '0.00', 'Bonomi bouilloire electrique 1L', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 122, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1376, '150995', '0.00', 'Bonomi poele en pierre 20cm120', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 112, 135, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1377, '150996', '0.00', 'Bonomi poele en pierre 28cm128', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 164, 200, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1378, '150997', '0.00', 'Bonomi poele en pierre 24cm124', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 138, 170, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1379, '150998', '0.00', 'Bonomi poele a paella 20cm', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 52, 65, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1380, '150999', '0.00', 'Bonomi poele a paella 24cm', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 62, 75, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1381, '160014', '0.00', 'Frit 2.5kg Nv', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 33, 39, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1382, '160016', '0.00', 'Dattes superieur majhoul 1kg', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 90, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1383, '160017', '0.00', 'Dattes achifaa 2kg', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1384, '161085', '0.00', 'Kohinoor rice basmati 2kg', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 51, 59, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1385, '161091', '0.00', 'Lara food amlou 500g', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 17, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1386, '161092', '0.00', 'Lara food amlou 1kg', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 28, 32, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1387, '161152', '0.00', 'Dattes superieur majhoul 2Kg', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 160, 185, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1388, '161153', '0.00', 'Dates alaswdan sukari 3kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 99, 110, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1389, '161154', '0.00', 'Dattes yosra 2kg', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 65, 70, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1390, '161155', '0.00', 'Dattes lojeyn 2kg', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 52, 69, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1391, '161172', '0.00', 'El baraka confiture  portion', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1392, '161181', '0.00', 'Almahsoul dchicha d''orge beldi fine 500g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1393, '161182', '0.00', 'Almahsoul dchicha d''orge gros 500g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1394, '161183', '0.00', 'Almahsoul soupe 500g beldi aux herbes', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1395, '161184', '0.00', 'Almahsoul herbel dorge beldi 500g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1396, '161187', '0.00', 'Nixi baby couches 4maxi 3pcs', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 21, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1397, '161196', '0.00', 'Dattes al majhoul 2Kg', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 155, 180, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1398, '161197', '0.00', 'Sirop naturel des dattes', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 19, 22, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1399, '161198', '0.00', 'Havi topping sauce 1Kg', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 36, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1400, '161199', '0.00', 'Havi topping sauce 250gr', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1401, '161207', '0.00', 'Elite fer a repasser oc 2482', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 0, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1402, '161208', '0.00', 'Prima fer a repasser', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 0, 180, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1403, '161209', '0.00', 'Plat pizza en bois  grand', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 55, 63, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1404, '161213', '0.00', 'Corbeille a frite', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1405, '161214', '0.00', 'Dattes tafilalt 2Kg', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 0, 180, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1406, '161240', '0.00', 'Assiette ronde Ã  rayure', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1407, '161259', '0.00', 'Flash 2 sticks 3g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1408, '161260', '0.00', 'Freegum 4 pcs eucalyptus', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1409, '161288', '0.00', 'Amora frozen crab claws 1kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 83, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1410, '161291', '0.00', 'Anniversaire', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 400, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1411, '161297', '0.00', 'Dosidicus gigas calamar 2kg', '', '0.00', '0.00', '0.00', '132.00', 0, '0.00', 132, 155, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1412, '161338', '0.00', 'Ruchers karoum amlou cacahuete 1/4', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1413, '161339', '0.00', 'Ruchers karoum amlou amande 1kg', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 131, 155, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1414, '161340', '0.00', 'Ruchers karoum amlou amande 1/2', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 67, 78, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1415, '161341', '0.00', 'Ruchers karoum amlou amande 1/4', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 33, 39, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1416, '161342', '0.00', 'Karoum huile d''olive attaouia 1L', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 61, 70, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1417, '161343', '0.00', 'Karoum huile d''olive attaouia 1/2 L', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 36, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1418, '161344', '0.00', 'Karoum huile d''olive attaouia 250ml', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 16, 18, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1419, '161385', '0.00', 'Princese mixed rice crackers 500g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 26, 30, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1420, '161401', '0.00', 'Chiken burger surgele 800g', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 51, 65, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1421, '161403', '0.00', 'Dattes al ahbab jaune', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 55, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1422, '161404', '0.00', 'Crevette decortique 1kg 30/50', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 85, 89, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1423, '161501', '0.00', 'Tymbark 6 verre Ã  jus', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1424, '161506', '0.00', 'Printemps creme oxydante 6%', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 6, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1425, '161525', '0.00', 'The lamairdat 100g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1426, '161529', '0.00', 'Delice max sucette', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1427, '161530', '0.00', 'Casserole inox + couvert', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1428, '161540', '0.00', 'Ja butter keks 200g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 5, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1429, '161580', '0.00', 'Chiki net SerpilliÃ¨re jaune 150pcs', '', '0.00', '0.00', '0.00', '4.00', 0, '5.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 15, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1430, '161608', '0.00', 'Dattes naturel zagoura 1Kg', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 34, 40, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1431, '161610', '0.00', 'Royal palm dattes sukari 3kg', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 108, 124, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1432, '161611', '0.00', 'serpilliÃ¨re normal', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1433, '161612', '0.00', 'president beurre portion 10g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 0, 2, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1434, '161613', '0.00', 'Dattes khairat sukari 3kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 102, 110, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1435, '161626', '0.00', 'Eau de fleur', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 0, 4, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1436, '161633', '0.00', 'Balai', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1437, '161655', '0.00', 'Rotary mopp 88 style', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 105, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1438, '161714', '0.00', 'Photo fram moyen', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1439, '161715', '0.00', 'Beijing 2008 pot', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1440, '161717', '0.00', 'Paprika 500g', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 35, 36, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1441, '161718', '0.00', 'Poivre en graines', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 0, 35, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1442, '161719', '0.00', 'Cumin 500g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 0, 35, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1443, '161720', '0.00', 'Coriandre', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1444, '161721', '0.00', 'Feuille de laurier 250g', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1445, '161729', '0.00', 'Happy birthday goblet serviette assiette', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 23, 29, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1446, '161733', '0.00', 'Figue taounat 1kg', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 58, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1447, '161734', '0.00', 'Dattes golden palm sukari 3kg', '', '0.00', '0.00', '0.00', '92.00', 0, '0.00', 97, 105, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1448, '161735', '0.00', 'Chapeau dessin anime disney', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 4, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1449, '161736', '0.00', 'laalk 50g', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1450, '161737', '0.00', 'Tichtar moyen', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 81, 80, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1451, '161738', '0.00', 'Tichtar petit 40g', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 41, 40, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1452, '161739', '0.00', 'Cumin reg 50gr', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 0, 35, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1453, '161742', '0.00', 'Golden crocodile 12 pince a ligne', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1454, '161744', '0.00', 'Ochenz crevettes 40/50 2kg', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 0, 195, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1455, '161750', '0.00', 'Asseitte happy birthday 10pcs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 0, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1456, '161751', '0.00', 'Serviettes happy birthday', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 0, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1457, '161753', '0.00', 'Keskes khoumassi', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1458, '161754', '0.00', 'Assiette petite dore et argente', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 0, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1459, '161756', '0.00', 'Happy party cake topper', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 0, 13, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1460, '161758', '0.00', 'Ballon happy bithday chiffre', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 15, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1461, '161759', '0.00', 'Ballon happy bithday', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1462, '161797', '0.00', 'Oil camel peak with frankincense 30ml', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1463, '161798', '0.00', 'Camel peak cream to lighten sensitive 50', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 45, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1464, '161799', '0.00', 'Vasline camel 200g', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1465, '161800', '0.00', 'basmat ibdaa huile de sesame 60ml', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 26, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1466, '161801', '0.00', 'Camel hump mask for hair', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 35, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1467, '161802', '0.00', 'Face mask with nila lamsat ibdaa', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1468, '161803', '0.00', 'Lamsat ibdaa pack oil camel', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 91, 95, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1469, '161804', '0.00', 'lamsat ibdaa pack scrub cream', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 61, 70, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1470, '161806', '0.00', 'Alhidaya dattes geglet 5kg', '', '0.00', '0.00', '0.00', '155.00', 0, '0.00', 0, 160, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1471, '161850', '0.00', 'Dattes d''algerie 1kg', '', '0.00', '0.00', '0.00', '37.00', 0, '0.00', 37, 44, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1472, '161851', '0.00', 'Dattes deglet nour meilleur  2kg', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 0, 115, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1473, '161852', '0.00', 'Calamar tube de pota 1KG', '', '0.00', '0.00', '0.00', '66.00', 0, '0.00', 0, 79, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1474, '161924', '0.00', 'Arabia huile d''olive portion', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1475, '161950', '0.00', 'Johnsons baby savon 100g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1476, '171022', '0.00', 'sahel saucisses volaille 1kg', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 44, 50, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1477, '171025', '0.00', 'Dates jambou premium majhoul 1Kg', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 0, 120, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1478, '171026', '0.00', 'Dates large medium majhoul 1Kg', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 0, 90, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1479, '171027', '0.00', 'Dates royal majhoul 1KG', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 0, 140, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1480, '171036', '0.00', 'Cordon bleu surgele 800g', '', '0.00', '0.00', '0.00', '66.00', 0, '0.00', 55, 75, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1481, '171040', '0.00', 'Turka tortilla wraps 30 cm', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 38, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1482, '171046', '0.00', 'Dates palm treasures 3kg', '', '0.00', '0.00', '0.00', '103.00', 0, '0.00', 104, 119, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1483, '171048', '0.00', 'Dates al ikhoua tunisia 1kg', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 33, 39, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1484, '171052', '0.00', 'Pailles *100ps', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1485, '171054', '0.00', 'Dattes royal 1kg d''algerie', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 48, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1486, '171055', '0.00', 'Dattes deglet 2kg O D', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 86, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1487, '171056', '0.00', 'Panor pizza mini*12pcs', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1488, '171071', '0.00', 'Dattes deglet d''algerie 2kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 85, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1489, '171077', '0.00', 'Selecta luncheon 550g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1490, '171085', '0.00', 'Twix biscuit au caramel', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1491, '171115', '0.00', 'Dattes al hanaa majhoul 2kg', '', '0.00', '0.00', '0.00', '170.00', 0, '0.00', 165, 195, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1492, '171120', '0.00', 'Forest mix cream', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1493, '171121', '0.00', 'Forest cream cheese', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 30, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1494, '171122', '0.00', 'Forest fromage d''or', '', '0.00', '0.00', '0.00', '77.00', 0, '0.00', 0, 90, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1495, '171127', '0.00', 'Dattes al mehari 5Kg', '', '0.00', '0.00', '0.00', '175.00', 0, '0.00', 0, 190, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1496, '171128', '0.00', 'Dates alhidaya 1Kg', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1497, '171135', '0.00', 'Panor chaplure 250gr', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1498, '171141', '0.00', 'Challa filets de maquereaux 125g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1499, '171142', '0.00', 'Veiga morceaux de thon 80g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1500, '171150', '0.00', 'Santana tortilla 25cm', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1501, '171161', '0.00', 'Forest cheese mozzarella 500g', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 28, 33, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1502, '171166', '0.00', 'Forest family bloc  rape', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1503, '171170', '0.00', 'grazioso crispy 1pc', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1504, '171205', '0.00', 'Forest mozalait 200g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1505, '171315', '0.00', 'Dattes al ahbab N', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 65, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1506, '171336', '0.00', 'Figue rif 1kg', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 52, 65, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1507, '171337', '0.00', 'Figue rif 500g', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 30, 34, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1508, '171338', '0.00', 'Figue rif 250g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1509, '171389', '0.00', 'Fairy ultra original 780ml', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 29, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1510, '180000', '0.00', 'Bonomi poele a paella 32cm', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 92, 115, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1511, '180001', '0.00', 'Fete 26/03/2022', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 2184, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1512, '180003', '0.00', 'Dates marhaba standard 5kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 110, 160, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1513, '180013', '0.00', 'Jumbo', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1514, '180014', '0.00', 'Monogotas vanille locion 250ml', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 33, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1515, '180016', '0.00', 'ticket ramadan un enfant 1H30', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1516, '180017', '0.00', 'Ticket ramadan 2 enfants 1H30', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1517, '180018', '0.00', 'Ticket ramadan 3 enfants 1H30', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 60, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1518, '180019', '0.00', 'Stone film alimentaire 300*45', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 31, 39, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1519, '180025', '0.00', 'Mozzador 200g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1520, '180054', '0.00', 'Printemps veritable savon 100g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1521, '180107', '0.00', 'Vilda four', '', '0.00', '0.00', '0.00', '3000.00', 0, '0.00', 3000, 4000, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1522, '180108', '0.00', 'Kenz 5 feu', '', '0.00', '0.00', '0.00', '750.00', 0, '0.00', 750, 900, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1523, '180109', '0.00', 'Alsa sucre fleur d''orange 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1524, '180130', '0.00', 'Durum tortilla 30cm', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 36, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1525, '180140', '0.00', 'Huile d''amande 60ml', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1526, '180142', '0.00', 'Petit gold 1pcs', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1527, '180143', '0.00', 'Gateau belkis 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1528, '180146', '0.00', 'Sac Super Marche WannY', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1529, '180155', '0.00', 'Precigaz rechaud 1 feu', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 40, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1530, '180163', '0.00', 'Mortadella megusta 350g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1531, '180164', '0.00', 'Kasher piquante 200g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1532, '180165', '0.00', 'Carton emballage G', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1533, '180166', '0.00', 'Carton emballage P', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1534, '180167', '0.00', 'Carton emballage M', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1535, '180171', '0.00', 'Tatch hachoir', '', '0.00', '0.00', '0.00', '800.00', 0, '0.00', 800, 950, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1536, '180172', '0.00', 'Parfume 49', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 0, 49, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1537, '180173', '0.00', 'Ballon cotton', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 20, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1538, '180177', '0.00', 'Date zagoura 1kg', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1539, '180208', '0.00', 'Fte team ramadan', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 820, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1540, '180216', '0.00', 'Vivalia chocolat 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1541, '180228', '0.00', 'Lait de camel 500ml', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1542, '180231', '0.00', 'Fete lailat alkader', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 3575, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1543, '180232', '0.00', 'Goblet jus Z14', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 36, 44, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1544, '180243', '0.00', 'Centrale salim lait uht 1L*6', '', '0.00', '0.00', '0.00', '51.00', 0, '0.00', 51, 64, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1545, '180244', '0.00', 'Centrale salim lait uht 0.5L*6', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 35, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1546, '180245', '0.00', 'Seau retro', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 105, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1547, '180247', '0.00', 'Kroum miel de thym 250g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1548, '180248', '0.00', 'Kroum miel de thym 500g', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 120, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1549, '180249', '0.00', 'Kroum miel de chardon 500g', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 90, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1550, '180250', '0.00', 'Kroum miel de chardon 250g', '', '0.00', '0.00', '0.00', '37.00', 0, '0.00', 37, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1551, '180251', '0.00', 'Kroum miel d''euphobre 500g', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 100, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1552, '180252', '0.00', 'Kroum miel d''euphorbe 250g', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 42, 52, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1553, '180253', '0.00', 'Kroum miel d''orange 500g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 40, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1554, '180254', '0.00', 'Kroum miel d''orange 250g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1555, '180255', '0.00', 'Kroum miel d''herbes jaune 500g', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 80, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1556, '180256', '0.00', 'Kroum miel d''herbes jaune 250g', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1557, '180257', '0.00', 'Kroum miel d''herbes bleu', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 80, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1558, '180258', '0.00', 'Kroum miel d''herbes bleu 250g', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1559, '180259', '0.00', 'Kroum miel de jujubier 500g', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 80, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1560, '180260', '0.00', 'Kroum miel de jujubier 250g', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1561, '180261', '0.00', 'Kroum miel d''eucalyptus 500g', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 85, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1562, '180262', '0.00', 'Kroum miel d''eucalyptus 250g', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 43, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1563, '180263', '0.00', 'Chergui beurre', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1564, '180285', '0.00', 'Cake topper alf mabrouk', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1565, '180287', '0.00', 'Sifflet anniversaire 10 pcs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 12, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(1566, '180289', '0.00', 'Design canister set', '', '0.00', '0.00', '0.00', '165.00', 0, '0.00', 165, 225, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1567, '180290', '0.00', 'Cuilliere plastic blanche grande', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1568, '180291', '0.00', 'Fourchette plastic grande', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1569, '180292', '0.00', 'Cuilliere plastic petite', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1570, '180302', '0.00', 'Bella maquereaux ST 425g', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1571, '180304', '0.00', 'Bella thon HV 80g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1572, '180316', '0.00', 'Gouza 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1573, '180327', '0.00', 'Apis tomate frito 400g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1574, '180333', '0.00', 'Sandbad dates 5kg', '', '0.00', '0.00', '0.00', '145.00', 0, '0.00', 145, 0, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1575, '180336', '0.00', 'Alkaline battery AG13 LR44W', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1576, '180338', '0.00', 'Da vinci batteries 3v CR2016', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 5, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1577, '180339', '0.00', 'Castor oil 50ml basmat ibdaa', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1578, '180340', '0.00', 'Sweet almond oil 50ml', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1579, '180350', '0.00', 'All natural milk', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 0, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1580, '180365', '0.00', 'All natural milk 500ml', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1581, '180366', '0.00', 'All natural milk 1L', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 16, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1582, '180371', '0.00', 'Torchone vitre', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 9, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1583, '180373', '0.00', 'Tapis welcom', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 36, 45, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1584, '180386', '0.00', 'Tapis colors', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 50, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1585, '180387', '0.00', 'Fota 70% polyester 30% polyamide', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 22, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1586, '180388', '0.00', 'Fota quality', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 22, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1587, '180394', '0.00', 'Proclean vinyl gloves', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 100, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1588, '180395', '0.00', 'Glucose 1kg', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1589, '180399', '0.00', 'Ras lhanout 500g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1590, '180400', '0.00', 'Les belles de tantan sardine 125g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1591, '180401', '0.00', 'Fete al aiid 04/05/2022', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 2118, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1592, '180423', '0.00', 'Voiture transforme herald', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1593, '180424', '0.00', 'Voiture metal scal model', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 42, 50, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1594, '180425', '0.00', 'Voiture classic 1/38 scale', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 45, 55, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1595, '180426', '0.00', 'Voiture police car', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 42, 50, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1596, '180427', '0.00', 'Voiture climbing car', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 24, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1597, '180428', '0.00', 'Voiture sports YWD', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 24, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1598, '180429', '0.00', 'Moteur sport YWD', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 24, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1599, '180430', '0.00', 'Flamingo pull toys series', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 17, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1600, '180432', '0.00', 'Disnep cross country car', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1601, '180433', '0.00', 'Die cast metal voiture R1019', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1602, '180434', '0.00', 'Fire rescue die cast metal R1017', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1603, '180435', '0.00', 'Construction truck die cast metal R1017', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1604, '180436', '0.00', 'Voiture BM', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1605, '180437', '0.00', 'Cavengers speed racing HY027', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1606, '180438', '0.00', 'Moteur speed game', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1607, '180439', '0.00', 'Cavengers montre', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 23, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1608, '180440', '0.00', 'Rubik''s cube 2', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1609, '180441', '0.00', 'Rubik''s cube 1', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 23, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1610, '180442', '0.00', 'Concept racing voiture yj 388 48', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 80, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1611, '180444', '0.00', 'Saraj eau de toilette 1L', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 76, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1612, '180445', '0.00', 'Granada eau de toilette 1L', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 76, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1613, '180446', '0.00', 'Aqua classico eau de toilette 1L', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 76, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1614, '180447', '0.00', 'Plaza eau de toilette 1L', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 76, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1615, '180451', '0.00', 'Hermanos eau de toilette 1L', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 76, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1616, '180476', '0.00', 'Love beauty roll on cartridge', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 55, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1617, '180489', '0.00', 'UV control creme ecran total 50ml', '', '0.00', '0.00', '0.00', '87.00', 0, '0.00', 87, 140, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1618, '180578', '0.00', 'Gofio oyoune sahara 800g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1619, '180579', '0.00', 'Pany chocolat a tartiner 1kg', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1620, '180581', '0.00', 'Briquet tempete', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1621, '180582', '0.00', 'Briquet clilkda', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1622, '180583', '0.00', 'Briquet vive le moment', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1623, '180600', '0.00', 'Fatafeat nappage 1kg', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1624, '180614', '0.00', 'Riz blanc 10kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 110, 130, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1625, '180615', '0.00', 'Film alimentaire blanc', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1626, '180619', '0.00', 'Eponge metallique carre', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1627, '180657', '0.00', 'Tatch bouilloire electrique 2.2L S57', '', '0.00', '0.00', '0.00', '165.00', 0, '0.00', 165, 210, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1628, '180664', '0.00', 'Tatch bouilloire electrique 1.8L', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1629, '180667', '0.00', 'Brittany batteur 1006', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 75, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1630, '180674', '0.00', 'Tatch batteur 5 vitesses E617', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 160, 210, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1631, '180681', '0.00', 'Prima barbecue electric 2009JL', '', '0.00', '0.00', '0.00', '200.00', 0, '0.00', 200, 260, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1632, '180714', '0.00', 'Faaber land presse orange 6020B', '', '0.00', '0.00', '0.00', '270.00', 0, '0.00', 270, 340, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1633, '180715', '0.00', 'Faaber land blender B431', '', '0.00', '0.00', '0.00', '210.00', 0, '0.00', 210, 270, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1634, '180721', '0.00', 'MDM miel de thym 1kg w', '', '0.00', '0.00', '0.00', '220.00', 0, '0.00', 220, 265, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1635, '180727', '0.00', '', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1636, '180789', '0.00', 'Plateau gateau grand', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 80, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1637, '180790', '0.00', 'Plateau gateau mini', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 35, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1638, '180818', '0.00', 'Kenz balance electrique 3051', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 115, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1639, '180820', '0.00', 'Tatch balance 136kg', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 95, 125, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1640, '180833', '0.00', 'Janat al nakhil sukari 3kg', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 116, 132, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1641, '180834', '0.00', 'Adizif rkat film alimentaire 1500m', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 90, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1642, '180837', '0.00', 'Aperitivos onditas barbecue', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1643, '180838', '0.00', 'Sonsa sardines in vegetable oil', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1644, '180847', '0.00', 'Sac bleu grande', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 5, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1645, '180875', '0.00', 'Moutchou film alimentaire 300*45', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 34, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1646, '180885', '0.00', 'Dateland deglet nour 500g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1647, '180891', '0.00', 'Fresh nuts pistaches 500g', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 80, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1648, '180896', '0.00', 'Decor argente XL', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 160, 290, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1649, '180897', '0.00', 'Yamma amlou cacahuete', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1650, '180899', '0.00', 'Dattes shahad 2kg', '', '0.00', '0.00', '0.00', '62.00', 0, '0.00', 62, 70, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1651, '180900', '0.00', 'Dattes amiral 2KG', '', '0.00', '0.00', '0.00', '61.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1652, '180910', '0.00', 'Avion cartoon kids', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1653, '180954', '0.00', 'Avion 2014 02', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 27, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1654, '180955', '0.00', 'Monkey go MW333', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 27, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1655, '180956', '0.00', 'Voiture 909', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 23, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1656, '180962', '0.00', 'Ball anfa for kids', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 4, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1657, '180964', '0.00', 'Bubbaloo pop', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1658, '180986', '0.00', 'The attamine 200g gold 4A', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1659, '180987', '0.00', 'The attamine 200g bleu 3A', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1660, '180988', '0.00', 'The attamine gold boite 200g3A', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 23, 27, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1661, '180989', '0.00', 'The oued lahwar 500g 3A', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1662, '180990', '0.00', 'The lamraiat 500g 3A', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1663, '180996', '0.00', 'Toys fun of bubbles', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 15, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1664, '180997', '0.00', 'Police car No8899 126', '', '0.00', '0.00', '0.00', '47.00', 0, '0.00', 47, 65, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1665, '180998', '0.00', 'Stunt dynamic tipping bucket', '', '0.00', '0.00', '0.00', '54.00', 0, '0.00', 54, 75, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1666, '180999', '0.00', 'Bus school electric No 0927', '', '0.00', '0.00', '0.00', '67.00', 0, '0.00', 67, 90, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1667, '181000', '0.00', 'Voiture blocks No BH 64', '', '0.00', '0.00', '0.00', '37.00', 0, '0.00', 37, 60, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1668, '181001', '0.00', 'Strong gale voiture speed 319B', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1669, '181002', '0.00', 'Ben 10 omniverse ZL8524B', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 22, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1670, '181003', '0.00', 'The truck set choose me', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 28, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1671, '181004', '0.00', 'Cube series 3*3*3', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1672, '181005', '0.00', 'Masque fashing top', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1673, '181006', '0.00', 'Voiture 88 speed top', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1674, '181007', '0.00', 'Voiture climbing metal dance team', '', '0.00', '0.00', '0.00', '29.00', 0, '0.00', 30, 45, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1675, '181008', '0.00', 'Small car for kids', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 24, 30, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1676, '181009', '0.00', 'Robot friction petit', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1677, '181010', '0.00', 'Voiture speed racing 1965', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1678, '181021', '0.00', 'Miswak special promo pack', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1679, '181080', '0.00', 'Mr mika sac poubelle30L*40noir', '', '0.00', '0.00', '0.00', '13.00', 0, '14.00', 14, 20, NULL, '', '', '0000-00-00 00:00:00', 15, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1680, '181089', '0.00', 'Serviette arix moyen', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1681, '181095', '0.00', 'Serviette dinosaures', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1682, '181131', '0.00', 'Tan Tan filets de maquereaux 125g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1683, '181144', '0.00', 'Chef aluminium 200', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 41, 48, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1684, '181145', '0.00', 'Top aluminium 200', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 36, 45, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1685, '181153', '0.00', 'Shampoo sachet 5ml', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1686, '181186', '0.00', 'Camel milk natural 1L', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 20, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1687, '181187', '0.00', 'Camel milk natural 500ml', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 10, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1688, '181191', '0.00', 'Dalaa lingette 20 pcs', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 0, 4, NULL, '', '', '0000-00-00 00:00:00', 21, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1689, '181204', '0.00', 'Choco milk 400g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1690, '181205', '0.00', 'Sac de congelation 100 pcs', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1691, '181207', '0.00', 'savon fax 1 pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1692, '181212', '0.00', 'Clean hand wipes lemon petite', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1693, '181213', '0.00', 'Clean hand wipes lemon grande', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1694, '181215', '0.00', 'Plateau giolly blanc grande', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1695, '181216', '0.00', 'Plateau verycarti moyen', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1696, '181217', '0.00', 'Plateau decore grande', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1697, '181224', '0.00', 'Plateau grande dore et argente', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1698, '181241', '0.00', 'Date parfum du bled 2kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 70, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1699, '181242', '0.00', 'Datte al assala loulou 5kg', '', '0.00', '0.00', '0.00', '155.00', 0, '0.00', 155, 175, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1700, '181487', '0.00', 'Pastil cotton disque 100 u', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1701, '181489', '0.00', 'Eau de rose 250ml', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 7, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1702, '181530', '0.00', 'Lina confiture abricot 300g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1703, '181531', '0.00', 'Floper pistache 1kg', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 132, 155, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1704, '181537', '0.00', 'Boujie chiffre led', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1705, '181538', '0.00', 'Happy lettres', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 18, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1706, '181539', '0.00', 'Gamme happy 3pcs', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 26, 32, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1707, '181540', '0.00', 'Love ballon lettres', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 35, 42, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1708, '181542', '0.00', 'Party toys blowouts 6 siflet', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1709, '181543', '0.00', 'Popper have a wonderful day', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1710, '181544', '0.00', 'Boujie coeur led', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1711, '181562', '0.00', 'Garder candle vert', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1712, '181568', '0.00', 'Marseille savon glycerine 1pcs', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1713, '181572', '0.00', 'Bouteille d''huile d''olive', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1714, '181588', '0.00', 'Bonomi ensemble tasse 6pcs', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 135, 175, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1715, '181590', '0.00', 'Storage princesse 4 terroirs petite', '', '0.00', '0.00', '0.00', '400.00', 0, '0.00', 405, 520, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1716, '181591', '0.00', 'Gullon maria 1 rlx', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 8, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1717, '181592', '0.00', 'Schar chocolate  sans gluten', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 4, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1718, '181598', '0.00', 'Assiette dore pack 20pcs', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 17, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1719, '181606', '0.00', 'Euro chocolate 1psc', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1720, '181614', '0.00', 'Puerto jeli crevette 50/60', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 160, 190, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1721, '181618', '0.00', 'Flodio bouteille miel 600g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 16, 19, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1722, '181633', '0.00', 'Golden mais doux 600g', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 22, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1723, '181638', '0.00', 'Plat ciramique coeur', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 12, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1724, '181639', '0.00', 'Irem home plateau rond 30cm', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1725, '181640', '0.00', 'Cooker kare salata kasesi', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 70, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1726, '181643', '0.00', 'Irem home 17.5*17.5', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1727, '181644', '0.00', 'Irem home plateau st01757', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1728, '181646', '0.00', 'Irem home plateau 1762', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 135, 170, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1729, '181649', '0.00', 'Panier deco 25*28cm ST01633', '', '0.00', '0.00', '0.00', '120.00', 0, '0.00', 120, 150, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1730, '181650', '0.00', 'Irem home plateau 1758', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 135, 170, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1731, '181662', '0.00', 'Wari flocons d''avoine 500g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1732, '181666', '0.00', 'Sun gants L', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1733, '181667', '0.00', 'Soft aluminium 200', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 35, 80, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1734, '181715', '0.00', 'Tag food mayonesa 450ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 19, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1735, '181718', '0.00', 'KitKat cacao 41.50g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1736, '181728', '0.00', 'Caly thon a huile vegetale 1.7kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 112, 125, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1737, '181736', '0.00', 'Moule Ã  tarte 25cm', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 38, 48, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1738, '181764', '0.00', 'Lutti cara choco 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1739, '181765', '0.00', 'Beurre chergui 50g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1740, '181766', '0.00', 'Beurre chergui 100g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1741, '181770', '0.00', 'Fete', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1125, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1742, '181772', '0.00', 'Nappage 500g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1743, '181776', '0.00', 'Vitalitys art oxycreme 1L', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 28, 35, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1744, '181803', '0.00', 'Miss helena lait corporel avocat 1L', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1745, '181808', '0.00', 'Fabilor poudre de decoloration 10g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1746, '181816', '0.00', 'Patisse daraa sucre glace 1kg', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1747, '181830', '0.00', 'Origan 500g', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 56, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1748, '181831', '0.00', 'Praline amande 1kg', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 90, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1749, '181832', '0.00', 'Sucre glace 5kg', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 90, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1750, '181833', '0.00', 'Amande effile 5kg', '', '0.00', '0.00', '0.00', '465.00', 0, '0.00', 465, 530, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1751, '181834', '0.00', 'Rama papier cuisson 500', '', '0.00', '0.00', '0.00', '240.00', 0, '0.00', 240, 280, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1752, '181835', '0.00', 'Moule fondant', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1753, '181836', '0.00', 'ticket 1 kids', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 20, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1754, '181837', '0.00', 'Ticket 2 kids', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 35, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1755, '181838', '0.00', 'Ticket 3 kids', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1756, '181839', '0.00', 'Ticket 4 kids', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 65, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1757, '181840', '0.00', 'Migarome arome peche 1kg', '', '0.00', '0.00', '0.00', '118.00', 0, '0.00', 120, 130, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1758, '181841', '0.00', 'Migarome arome fraise 1kg', '', '0.00', '0.00', '0.00', '118.00', 0, '0.00', 120, 130, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1759, '181842', '0.00', 'Migarome arome banane 1kg', '', '0.00', '0.00', '0.00', '118.00', 0, '0.00', 120, 130, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1760, '181843', '0.00', 'Migarome arome abricot 1kg', '', '0.00', '0.00', '0.00', '118.00', 0, '0.00', 120, 130, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1761, '181844', '0.00', 'Migarome arome citron 1kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 112, 125, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1762, '181845', '0.00', 'Migarome arome amande 1kg', '', '0.00', '0.00', '0.00', '148.00', 0, '0.00', 150, 170, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1763, '181846', '0.00', 'Migarome arome cappuccino 1kg', '', '0.00', '0.00', '0.00', '148.00', 0, '0.00', 150, 170, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1764, '181847', '0.00', 'Migarome arome caramel 1kg', '', '0.00', '0.00', '0.00', '148.00', 0, '0.00', 150, 170, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1765, '181848', '0.00', 'Migarome arome chocolat 1kg', '', '0.00', '0.00', '0.00', '148.00', 0, '0.00', 150, 170, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1766, '181849', '0.00', 'Migarome arome vanille 1kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 112, 125, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1767, '181850', '0.00', 'Migarome arome nata 1kg', '', '0.00', '0.00', '0.00', '118.00', 0, '0.00', 120, 130, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1768, '181852', '0.00', 'Sac noir 1kg', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 22, 27, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1769, '181903', '0.00', 'Mayfine 5kg', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 100, 130, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1770, '181904', '0.00', 'La buche', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 56, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1771, '181905', '0.00', 'Gants nitrile noir', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 110, 135, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1772, '181906', '0.00', 'Supermix 500g', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 42, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1773, '181913', '0.00', 'Ticket bonne annee 1 enfant', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 60, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1774, '181914', '0.00', 'Ticket bonne annee 2 enfants', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 100, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1775, '181915', '0.00', 'Ticket bonne annee 3 enfants', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 135, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1776, '181916', '0.00', 'Chocolat praline 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1777, '181935', '0.00', 'Quinoa en grains sahara 200g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1778, '181936', '0.00', 'Migarome arome pistache 1L', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 125, 140, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1779, '181943', '0.00', 'Grains de pavot 1kg', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 90, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1780, '181954', '0.00', 'Gants en vinyl noir', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 110, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1781, '181955', '0.00', 'PROCLEAN gants 100pcs L', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 43, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1782, '181956', '0.00', 'Pate d''amande 3100g', '', '0.00', '0.00', '0.00', '210.00', 0, '0.00', 0, 230, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1783, '181957', '0.00', 'Pate d''amande 55% 4kg', '', '0.00', '0.00', '0.00', '300.00', 0, '0.00', 0, 360, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1784, '181958', '0.00', 'Feuilles pastila kg', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 0, 48, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1785, '181975', '0.00', 'Olive verts denoyaute kg', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 75, 90, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1786, '181976', '0.00', 'Son de ble kg', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1787, '181977', '0.00', 'Amande poudre 5kg', '', '0.00', '0.00', '0.00', '450.00', 0, '0.00', 450, 540, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1788, '181990', '0.00', 'Papier hygiene w01', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1789, '181992', '0.00', 'Arabia verveine 25 sachets', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1790, '182001', '0.00', 'Tonic premium water 200ml', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 5, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1791, '182022', '0.00', 'fAHM AL JIONE', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1792, '182023', '0.00', 'Date al majd al majhoul 2kg', '', '0.00', '0.00', '0.00', '220.00', 0, '0.00', 220, 255, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1793, '182025', '0.00', 'Karom huile d''olive 1L', '', '0.00', '0.00', '0.00', '77.00', 0, '0.00', 78, 82, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1794, '182026', '0.00', 'Karom huile d''olive 500ml', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 39, 42, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1795, '182027', '0.00', 'Karom huile d''olive 250ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 20, 21, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1796, '182028', '0.00', 'Karom huile d''argan 1L', '', '0.00', '0.00', '0.00', '450.00', 0, '0.00', 450, 495, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1797, '182029', '0.00', 'Karom huile d''argan 500ml', '', '0.00', '0.00', '0.00', '225.00', 0, '0.00', 225, 250, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1798, '182030', '0.00', 'Karom huile d''argan 250ml', '', '0.00', '0.00', '0.00', '112.00', 0, '0.00', 113, 130, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1799, '182047', '0.00', 'Chaise plastic', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 22, 28, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1800, '182081', '0.00', 'Clarine creme solaire haut 25g', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 49, 65, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1801, '182092', '0.00', 'Orfine creme solaire 50ml', '', '0.00', '0.00', '0.00', '68.00', 0, '0.00', 69, 85, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1802, '182099', '0.00', 'Elite vacuum cleaner 2L', '', '0.00', '0.00', '0.00', '420.00', 0, '0.00', 420, 550, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1803, '182132', '0.00', 'Ensemble Spatule de cuisine en bois', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1804, '182179', '0.00', 'pizza 5 mozzarella 200g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1805, '182188', '0.00', 'Arax film alimentaire 45*500', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 100, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1806, '182194', '0.00', 'Distributeur Ã  cereales 6 compartiments', '', '0.00', '0.00', '0.00', '131.00', 0, '0.00', 14, 160, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1807, '182210', '0.00', 'Nesma beurre en bloc 5kg', '', '0.00', '0.00', '0.00', '105.00', 0, '0.00', 108, 125, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1808, '182267', '0.00', 'Bonheur mais 150g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1809, '182269', '0.00', 'Artesto pate d''arachide 400g', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 25, 28, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1810, '182281', '0.00', 'Mini pinzas coeur', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 22, 25, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1811, '182292', '0.00', 'Chapeau happy brillant M', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1812, '182293', '0.00', 'Fil decor aniv premiere', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1813, '182300', '0.00', 'Sucette 10g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1814, '182355', '0.00', 'Fresh fruits flavors', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1815, '182360', '0.00', 'The lamaairdat boite 500g 41022', '', '0.00', '0.00', '0.00', '47.00', 0, '0.00', 48, 53, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1816, '182369', '0.00', 'Nonos pooh KL84', '', '0.00', '0.00', '0.00', '66.00', 0, '0.00', 69, 90, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1817, '182370', '0.00', 'Dog toys KL10', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 30, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1818, '182371', '0.00', 'Happy paddle KJ 502', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 19, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1819, '182373', '0.00', 'Pockemon', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 30, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1820, '182374', '0.00', 'LerRs toys NT96', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 18, 24, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1821, '182377', '0.00', 'Die cast helicopter 1109', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 18, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1822, '182378', '0.00', 'Death rate K239', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 22, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1823, '182379', '0.00', 'GHitar piano K340', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 18, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1824, '182380', '0.00', 'Die cast alloy car model 104', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 42, 54, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1825, '182381', '0.00', 'Shoots water gun K251', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 19, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1826, '182382', '0.00', 'Guitar BN11', '', '0.00', '0.00', '0.00', '39.00', 0, '0.00', 44, 55, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(1827, '182383', '0.00', 'Fantastic music HK1307A', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 67, 80, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1828, '182384', '0.00', 'Dog piano music 417', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 67, 80, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1829, '182385', '0.00', 'Talkie Walkie', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1830, '182386', '0.00', 'Beyblade', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1831, '182387', '0.00', 'Kitchen happy little chef K129', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 25, 34, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1832, '182388', '0.00', 'Joyful play car fun model 176', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 66, 80, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1833, '182389', '0.00', 'Baby toys set K193', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1834, '716093', '0.00', 'Chiki net serpilliÃ¨re vert germany', '', '0.00', '0.00', '0.00', '5.00', 0, '5.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1835, '716094', '0.00', 'Chiki net serpilliÃ¨re violette germany', '', '0.00', '0.00', '0.00', '5.00', 0, '6.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1836, '717512', '0.00', 'Soire 1 enfant', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1837, '717514', '0.00', 'Soire 2 enfants', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1838, '717516', '0.00', 'Soire 3 enfants plus', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 100, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1839, '1280018', '0.00', 'Evenement noel', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 5950, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1840, '1713016', '0.00', 'Escalope de poulet 800g', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 63, 65, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1841, '1713036', '0.00', 'Aalk en boite', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 0, 12, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1842, '1713060', '0.00', 'Regal aluminium foil 200 mtr', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 122, 145, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1843, '1713076', '0.00', 'Chia seeds 200g', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1844, '1713077', '0.00', 'Chia seeds 120g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1845, '1713096', '0.00', 'Almahsoul herbel d''orge beldi 1kg', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 22, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1846, '1713097', '0.00', 'Datvita dattes 1kg', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 0, 45, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1847, '1713098', '0.00', 'Dattes reef sukari 3kg', '', '0.00', '0.00', '0.00', '112.00', 0, '0.00', 113, 135, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1848, '1713099', '0.00', 'Leader eponges metaliq 25 pcs', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 19, 24, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1849, '1714000', '0.00', 'Ekbal dattes 1 kg', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1850, '1714001', '0.00', 'El medina dattes 2kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1851, '1714007', '0.00', 'Vanoni''s langua crevette 2kg', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 162, 180, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1852, '1714038', '0.00', 'Bic stylo bleu 1pc', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1853, '1714040', '0.00', 'Star ketchup sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1854, '1714041', '0.00', 'Star hot sauce 7g sachet', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1855, '1714042', '0.00', 'Star mayonnise 10g', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1856, '1714047', '0.00', 'Gaplana choco squares 1 pc', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 0, 2, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1857, '1714052', '0.00', 'Dattes agricultural sukari 3kg', '', '0.00', '0.00', '0.00', '112.00', 0, '0.00', 113, 135, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1858, '1714060', '0.00', 'Delice coq nuggets 1 kg', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 55, 65, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1859, '1714061', '0.00', 'Delice coq escaloppe 1 kg', '', '0.00', '0.00', '0.00', '68.00', 0, '0.00', 68, 80, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1860, '1715002', '0.00', 'Choco wafer coconut 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1861, '1715009', '0.00', 'Itimat plg gas cooker 4 burners', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 399, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1862, '1715059', '0.00', 'Figues al baraka 500g', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 34, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1863, '1715076', '0.00', 'Faast super lave vitre 750ml', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1864, '1715077', '0.00', 'Quotouf dates sukari 1kg', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 44, 50, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1865, '1715078', '0.00', 'Ghaliya dattes tunisiene 1kg', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 33, 38, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1866, '1715079', '0.00', 'Papier cuisson 8 feuilles', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1867, '1715085', '0.00', 'Rotana film alimentaire 500 m', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 90, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1868, '1715089', '0.00', 'Elegans film alimentaire 500m', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 0, 105, NULL, '', '', '0000-00-00 00:00:00', 16, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1869, '1715090', '0.00', 'Alkaissar mozzarella 200g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1870, '1715096', '0.00', 'Miettes de samon congoles 500g', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 95, 105, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1871, '1715099', '0.00', 'Plaquette saumon 200g', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 0, 90, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1872, '1716025', '0.00', 'Escoba balaie', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 0, 16, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1873, '1716026', '0.00', 'Amlou 1kg basmat ibdaa', '', '0.00', '0.00', '0.00', '37.00', 0, '0.00', 38, 45, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1874, '1716027', '0.00', 'Amlou 1/2 kg basmat ibdaa', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1875, '1716069', '0.00', 'Dattes al aarousa 2kg', '', '0.00', '0.00', '0.00', '56.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1876, '1716071', '0.00', 'Huile d''olive 2L ainasserdoune', '', '0.00', '0.00', '0.00', '118.00', 0, '0.00', 119, 132, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1877, '1716072', '0.00', 'Dattes al aarousa 5kg', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 0, 165, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1878, '1716099', '0.00', 'Crevettes decortiques 41/50', '', '0.00', '0.00', '0.00', '105.00', 0, '0.00', 110, 115, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1879, '1717030', '0.00', 'Dattes sukari alhouda 3Kg', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 116, 135, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1880, '1717031', '0.00', 'Boule d''or cheddar tranches 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1881, '1717105', '0.00', 'Depilatory heater', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 0, 60, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1882, '1717172', '0.00', 'Evenement 1', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1153, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1883, '1717173', '0.00', 'Evenement 2', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1365, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1884, '1717174', '0.00', 'Itimat gas cooker 5 burner', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 800, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1885, '1717175', '0.00', 'La pina 500g  & molinera 200ml', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 16, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1886, '1717180', '0.00', 'Almahsoul farine dorge complet 900gr', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1887, '1717181', '0.00', 'Almahsoul couscous khoumassi 900g vert', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 0, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1888, '1717183', '0.00', 'Almahsoul smen 150g', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 0, 27, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1889, '1717200', '0.00', 'Fete de la marche vert', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1525, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1890, '1717210', '0.00', 'Dattes tunisiennes deglet nour 1kg', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 0, 38, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1891, '1717219', '0.00', 'Bande de rhodoid 1m', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 0, 5, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1892, '1717226', '0.00', 'Retaj confiture d''abricots 1kg', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 0, 18, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1893, '1717231', '0.00', 'Cache table jetable 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1894, '1717240', '0.00', 'Curcuma moulu 250g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 16, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1895, '1717241', '0.00', 'Poivre noir moulu 250g', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 0, 27, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1896, '1717242', '0.00', 'Cumin moulu 250g', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1897, '1717243', '0.00', 'Gingembre 500g', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 20, 40, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1898, '1717244', '0.00', 'Cannelle moulu 250g', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1899, '1717245', '0.00', 'Amande poudre 2kg', '', '0.00', '0.00', '0.00', '210.00', 0, '0.00', 0, 250, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1900, '1717246', '0.00', 'Praline amande 500g', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 0, 63, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1901, '1717247', '0.00', 'Praline noisete 640g', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 92, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1902, '1717248', '0.00', 'Gelatine 250g', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 0, 56, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1903, '1717249', '0.00', 'Pepite chco noir 1kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 0, 105, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1904, '1717260', '0.00', 'Basmat ibdaa oil fenugreek 50ml', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1905, '1717261', '0.00', 'Basmat ibdaa tabrima 100g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1906, '1717265', '0.00', 'Retaj confiture d''abricots 300g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 0, 8, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1907, '1717282', '0.00', '', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1908, '1717288', '0.00', 'Dattes khairat 500G', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 0, 45, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1909, '1717331', '0.00', 'Milky food pizza cheese 200g edam', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 0, 13, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1910, '1717332', '0.00', 'Crevette gris 1kg', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 0, 115, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1911, '1717340', '0.00', 'Dattes enma sukari 3kg', '', '0.00', '0.00', '0.00', '105.00', 0, '0.00', 0, 125, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1912, '1717341', '0.00', 'Eroma savon a main liquide 5 L', '', '0.00', '0.00', '0.00', '67.00', 0, '0.00', 72, 85, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1913, '1717345', '0.00', 'Casserole avec couvercle 3L', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1914, '1717346', '0.00', 'Beurre 60g sahara milk', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1915, '1717365', '0.00', 'Dubois cafe bresil 500g grains', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 0, 52, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1916, '1717366', '0.00', 'Amani dattes deglet tunisie 2kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1917, '1717370', '0.00', 'Royal palm dattes  3kg sukari', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 0, 85, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1918, '1717395', '0.00', 'Colline fromage 200g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 0, 16, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1919, '1717411', '0.00', 'El gailani the 1kg 41022', '', '0.00', '0.00', '0.00', '125.00', 0, '0.00', 0, 140, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1920, '1717412', '0.00', 'El gailani the super cadeau bleu', '', '0.00', '0.00', '0.00', '130.00', 0, '0.00', 0, 150, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1921, '1717414', '0.00', 'Fete hind', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 680, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1922, '1717424', '0.00', 'Dattes alghalia tunisien 1kg', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1923, '1717446', '0.00', 'Zafran dattes sukari 3kg', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 0, 110, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1924, '1717447', '0.00', 'Crealys faitout avec couvercle 6L', '', '0.00', '0.00', '0.00', '150.00', 0, '0.00', 0, 170, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1925, '1717456', '0.00', 'muscade noix 1pcs', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 0, 12, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1926, '1717468', '0.00', 'Colline platinium 1kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1927, '1717469', '0.00', 'Collina fromage 1kg', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 0, 62, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1928, '1717474', '0.00', 'Jaouhara dates sukari 3 kg', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 0, 105, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1929, '1717475', '0.00', 'Dates aljanoub 2kg', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 0, 67, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1930, '1717491', '0.00', 'Barari dattes  400G', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 0, 20, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1931, '1717492', '0.00', 'Konafa 1kg', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1932, '1717509', '0.00', 'Alamira dattes deglet nour 1kg', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1933, '1717510', '0.00', 'Olives verte sans noyaux 1kg', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 0, 34, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1934, '1717523', '0.00', 'Dattes aljazairia 1Kg', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 0, 46, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1935, '1717529', '0.00', 'Dates luxe 2kg', '', '0.00', '0.00', '0.00', '53.00', 0, '0.00', 54, 60, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1936, '1717533', '0.00', 'Musli avoine 1Kg', '', '0.00', '0.00', '0.00', '29.00', 0, '0.00', 30, 34, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1937, '1717534', '0.00', 'Goblet anniversaire*10pcs', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 0, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1938, '1717551', '0.00', 'The vert chameau 500g NÂ°2', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 0, 32, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1939, '1717552', '0.00', 'Ekbal dattes tunisien 2kg', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 0, 66, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1940, '1717554', '0.00', 'Dattes deluxe d''algerie 1kg', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 0, 43, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1941, '1717557', '0.00', 'El hoggar dattes 2kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 0, 79, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1942, '1717568', '0.00', 'Retaj miel 400g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 0, 8, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1943, '1717625', '0.00', 'Giant eagle parfum 750ml', '', '0.00', '0.00', '0.00', '100.00', 0, '0.00', 0, 120, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1944, '1717630', '0.00', 'Figues 4 saison 500g', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 0, 36, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1945, '1717631', '0.00', 'Figues jibal taounate 250g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 0, 18, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1946, '1717632', '0.00', 'Figues 4 saison 1 kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1947, '1717633', '0.00', 'Almahsoul thyme', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 0, 17, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1948, '1717650', '0.00', 'Tochiba lamp led 15w', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1949, '1717652', '0.00', 'Topage led lamp 18w b22', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1950, '1717653', '0.00', 'Pila lamp color round 25w e27', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 0, 8, NULL, '', '', '0000-00-00 00:00:00', 8, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1951, '1717654', '0.00', 'Tochiba lamp grand 36w', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 8, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1952, '1717655', '0.00', 'Golden led lamp grand 60w', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1953, '1717659', '0.00', 'Plastique rollo', '', '0.00', '0.00', '0.00', '55.00', 0, '0.00', 0, 70, NULL, '', '', '0000-00-00 00:00:00', 15, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1954, '1717661', '0.00', 'Le lion elastiqur 25metres', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 15, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1955, '1717672', '0.00', 'Film etirable 1.5', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 0, 65, NULL, '', '', '0000-00-00 00:00:00', 15, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1956, '1717710', '0.00', 'Assiettes anniversaires', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 0, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1957, '1717718', '0.00', 'Briquet long', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 0, 12, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1958, '1717722', '0.00', 'The ouad chouk 2kg', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 98, 105, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1959, '1717723', '0.00', 'The ouad chouk 1kg', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 0, 55, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1960, '1717730', '0.00', 'Punaises', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 0, 2, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1961, '1717735', '0.00', 'Servietes anniversaire', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 0, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1962, '1717740', '0.00', 'Iguider sucre glace 400g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 0, 8, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1963, '1717741', '0.00', 'Konafa 500gr', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 0, 20, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1964, '1717748', '0.00', 'Delcielo ananas au sirop 830g', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 0, 35, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1965, '1717764', '0.00', 'Dante tradition cafe moulu 250g', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 0, 27, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1966, '1717765', '0.00', 'Dante raffine cafe moulu 250g', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 0, 27, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1967, '1717766', '0.00', 'Dante tradition cafe moulu 125', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1968, '1717767', '0.00', 'Dante raffine cafe moulu 125g', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1969, '1717771', '0.00', 'Mozzador 1kg', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 0, 55, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1970, '1717807', '0.00', 'Sonic s3 rasoire', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 0, 4, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1971, '1717810', '0.00', 'Toumour al majhoul 2kg', '', '0.00', '0.00', '0.00', '170.00', 0, '0.00', 0, 195, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1972, '1717814', '0.00', 'Barquette aluminiuim 2 compartiment', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 0, 2, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1973, '1717820', '0.00', 'Retaj confiture d''abricots 700g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 0, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1974, '1717828', '0.00', 'Latex gants M', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 0, 16, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1975, '1717833', '0.00', 'Kitchen stickers ptt', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 0, 18, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1976, '1717838', '0.00', 'Michoc sucette 1pcs', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 0, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1977, '1717896', '0.00', 'Ciseau pince a gateaux', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 0, 10, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1978, '1717899', '0.00', 'The nabeel 200g', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 21, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1979, '1717909', '0.00', 'Ballon plastique', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 22, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1980, '1717910', '0.00', 'Nappe de table petit', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 0, 14, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1981, '1717911', '0.00', 'Nappe de table grand', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1982, '1717912', '0.00', 'Tablier de cuisine', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 0, 22, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1983, '1717932', '0.00', 'Brosse Ã  cheveux plastique', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1984, '1717936', '0.00', 'Tapis de bain', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 22, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1985, '1717960', '0.00', 'Mozhira dattes sukari 3kg', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 0, 90, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1986, '1717969', '0.00', 'Fete lailat al qadr 1 P', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 60, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1987, '1717970', '0.00', 'Fete lailat al qadr 2 P', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 100, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1988, '1717971', '0.00', 'Fete lailat al qadr 3 P', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', 0, 120, NULL, '', '', '0000-00-00 00:00:00', 22, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1989, '1717972', '0.00', 'Chocolate drops 1kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 0, 105, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1990, '1718011', '0.00', 'Finger de poisson 600g', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1991, '1718012', '0.00', 'Nuggets de poisson 600g', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 0, 40, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1992, '1718014', '0.00', 'Burger de poisson 600g panes', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 35, 40, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1993, '1718032', '0.00', 'Toujenin the vert 200g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 0, 17, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1994, '1718038', '0.00', 'Sucre semoule sachet', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 0, 1, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1995, '2090002', '0.00', 'Saucisse de boeuf', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1996, '2090003', '0.00', 'Saucisse de dinde', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1997, '2090004', '0.00', 'Edam fromage tranche', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 80, 100, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1998, '2090005', '0.00', 'Fromage rouge boule', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 90, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(1999, '2090006', '0.00', 'Viande hache de boeuf', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 80, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2000, '2090007', '0.00', 'La dinde 1kg', '', '0.00', '0.00', '0.00', '50.00', 0, '0.00', 50, 60, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2001, '2090008', '0.00', 'Edam fromage boule', '', '0.00', '0.00', '0.00', '77.00', 0, '0.00', 77, 90, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2002, '2090009', '0.00', 'Filet de saumon', '', '0.00', '0.00', '0.00', '260.00', 0, '0.00', 260, 300, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2003, '2090010', '0.00', 'Moules 1kg', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 89, 100, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2004, '2090011', '0.00', 'Farine de mais 1kg', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2005, '2090017', '0.00', 'Petit plomb 1kg', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2006, '2090018', '0.00', 'Langue d''oiseau 1kg', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2007, '2090019', '0.00', 'Vermicelle de ble 1kg', '', '0.00', '0.00', '0.00', '9.00', 0, '14.00', 10, 14, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2008, '2090020', '0.00', 'Graines ilan 1kg', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 0, 15, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2009, '2090021', '0.00', 'Alitkane pates 1kg', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 14, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2010, '2090022', '0.00', 'Haricot blanc sec 1kg la', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 17, 22, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2011, '2090023', '0.00', 'Lentille 1kg la', '', '0.00', '0.00', '0.00', '16.00', 0, '18.00', 15, 19, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2012, '2090024', '0.00', 'Lentille rouge 1kg la', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 18, 22, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2013, '2090025', '0.00', 'Pruneaux sec 1kg la', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 66, 75, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2014, '2090026', '0.00', 'Farine 1kg', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2015, '2090027', '0.00', 'Anis graines 1kg', '', '0.00', '0.00', '0.00', '75.00', 0, '0.00', 0, 85, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2016, '2090028', '0.00', 'Cheveux d''ange 1kg', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 11, 15, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2017, '2090029', '0.00', 'Graines de lin 1kg', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 22, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2018, '2090030', '0.00', 'Riz blanc 1kg La', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 10, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2019, '2090031', '0.00', 'Raisin rouge sec 1kg la', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 40, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2020, '2090032', '0.00', 'Noisette 1kg', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 0, 125, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2021, '2090033', '0.00', 'Raisin blanc sec 1kg la', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 46, 56, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2022, '2090036', '0.00', 'Amande 1kg la', '', '0.00', '0.00', '0.00', '72.00', 0, '0.00', 75, 80, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2023, '2090037', '0.00', 'Coco rape 1kg', '', '0.00', '0.00', '0.00', '38.00', 0, '0.00', 39, 46, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2024, '2090038', '0.00', 'Poulet congle', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 33, 39, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2025, '2090039', '0.00', 'Filet de dinde 1kg GMTD', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 51, 69, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2026, '2090040', '0.00', 'Sesam 1kg', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 30, 38, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2027, '2090041', '0.00', 'Pois chiche 1kg la', '', '0.00', '0.00', '0.00', '21.00', 0, '25.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2028, '2090043', '0.00', 'Amande effilee 1kg la', '', '0.00', '0.00', '0.00', '110.00', 0, '100.00', 0, 110, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2029, '2090044', '0.00', 'Sucre granula 1kg', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2030, '2090046', '0.00', 'Chips couleur 1kg', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 44, 58, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2031, '20005719', '0.00', 'Abricot sec 1kg la', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 112, 145, NULL, '', '5', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 1),
(2032, '2090050', '0.00', 'Noix decortiquees 1kg', '', '0.00', '0.00', '0.00', '97.00', 0, '98.00', 99, 110, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2033, '2090060', '0.00', 'Cacahuette mkacher 1kg', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 30, 36, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2034, '2090080', '0.00', 'Amande hache 1kg', '', '0.00', '0.00', '0.00', '120.00', 0, '95.00', 120, 115, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2035, '2090096', '0.00', 'Vermicelle noir 1kg', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 32, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2036, '2090101', '0.00', 'Brochette dinde', '', '0.00', '0.00', '0.00', '72.00', 0, '0.00', 72, 80, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2037, '2090102', '0.00', 'Brochette de poulet', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 85, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2038, '2090103', '0.00', 'Steak de dinde', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 75, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2039, '2090104', '0.00', 'Roule viande hachee de dinde 1kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 80, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2040, '2090105', '0.00', 'Chawarma de dinde 1kg', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 85, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2041, '2090106', '0.00', 'Chawarma de poulet 1kg', '', '0.00', '0.00', '0.00', '72.00', 0, '0.00', 72, 80, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2042, '2090107', '0.00', 'Nougette de poulet 1kg', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 85, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2043, '2090108', '0.00', 'Haute cuisse kintaki', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 70, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2044, '2090109', '0.00', 'Brochette viarianta', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 72, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2045, '2090110', '0.00', 'Saucisse de dinde aux fromage', '', '0.00', '0.00', '0.00', '63.00', 0, '0.00', 63, 70, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2046, '2090111', '0.00', 'Saucisse de dinde nature', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 65, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2047, '2090112', '0.00', 'Viande hachee de dinde', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 65, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2048, '2090113', '0.00', 'Pilon de poulet kintaki', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 68, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2049, '2090114', '0.00', 'Nugette de dinde', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 80, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2050, '2090115', '0.00', 'Brochette cuisse de dinde', '', '0.00', '0.00', '0.00', '63.00', 0, '0.00', 63, 70, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2051, '2090116', '0.00', 'Escalope aux fromage', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 85, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2052, '2090117', '0.00', 'Filet de dinde cuit fume', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 108, 120, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2053, '2090118', '0.00', 'Cuisse de dinde fume', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 108, 120, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2054, '2090119', '0.00', 'Salami cuit fume', '', '0.00', '0.00', '0.00', '113.00', 0, '0.00', 113, 126, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2055, '2090120', '0.00', 'Jambon de boeuf fume', '', '0.00', '0.00', '0.00', '186.00', 0, '0.00', 186, 207, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2056, '2090121', '0.00', 'Rouleaux de printemps', '', '0.00', '0.00', '0.00', '97.00', 0, '0.00', 97, 108, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2057, '2090122', '0.00', 'Rouleaux royal', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 103, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2058, '2090123', '0.00', 'Rouleaux bon gout', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 103, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2059, '2090124', '0.00', 'Rouleaux surprise', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 103, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2060, '2090125', '0.00', 'Jambon de dinde fume', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 108, 120, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2061, '2090126', '0.00', 'Pastrami de boeuf fume', '', '0.00', '0.00', '0.00', '288.00', 0, '0.00', 288, 320, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2062, '2090127', '0.00', 'Poitrine de boeuf fume', '', '0.00', '0.00', '0.00', '270.00', 0, '0.00', 270, 300, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2063, '2090128', '0.00', 'Pastrami de dinde fume', '', '0.00', '0.00', '0.00', '164.00', 0, '0.00', 164, 182, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2064, '2090129', '0.00', 'Poitrine de dinde fume', '', '0.00', '0.00', '0.00', '171.00', 0, '0.00', 171, 190, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2065, '2090130', '0.00', 'Salami de boeuf fume', '', '0.00', '0.00', '0.00', '164.00', 0, '0.00', 164, 182, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2066, '2090131', '0.00', 'Galantine aux olives', '', '0.00', '0.00', '0.00', '81.00', 0, '0.00', 81, 90, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2067, '2090132', '0.00', 'Galantine aux legumes', '', '0.00', '0.00', '0.00', '72.00', 0, '0.00', 72, 76, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2068, '2090133', '0.00', 'Pepperoni de dinde', '', '0.00', '0.00', '0.00', '105.00', 0, '0.00', 105, 117, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2069, '2090134', '0.00', 'parmesan', '', '0.00', '0.00', '0.00', '270.00', 0, '0.00', 270, 300, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2070, '2090135', '0.00', 'Gouda cumin', '', '0.00', '0.00', '0.00', '157.00', 0, '0.00', 157, 175, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2071, '2090136', '0.00', 'Gouda nature', '', '0.00', '0.00', '0.00', '157.00', 0, '0.00', 157, 175, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2072, '2090137', '0.00', 'Fromage bleu', '', '0.00', '0.00', '0.00', '234.00', 0, '0.00', 234, 260, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2073, '2090138', '0.00', 'Maasdam fromage', '', '0.00', '0.00', '0.00', '157.00', 0, '0.00', 157, 175, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2074, '2090139', '0.00', 'Fromage rouge', '', '0.00', '0.00', '0.00', '126.00', 0, '0.00', 108, 140, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2075, '2090140', '0.00', 'fromage de chevre', '', '0.00', '0.00', '0.00', '135.00', 0, '0.00', 135, 150, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2076, '2090141', '0.00', 'emmental fromage', '', '0.00', '0.00', '0.00', '165.00', 0, '0.00', 165, 220, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2077, '2090142', '0.00', 'filet de dinde nature', '', '0.00', '0.00', '0.00', '54.00', 0, '0.00', 54, 64, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2078, '2090143', '0.00', 'Filet de poulet nature', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 65, 75, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2079, '2090144', '0.00', 'Coquelet marine Ã  la marocaine', '', '0.00', '0.00', '0.00', '22.00', 0, '0.00', 22, 25, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2080, '2090145', '0.00', 'Pilon de poulet marine Ã  la maro', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 65, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2081, '2090146', '0.00', 'Luncheon sby 1kg', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 44, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2082, '2090147', '0.00', 'Mortadelle gini', '', '0.00', '0.00', '0.00', '31.00', 0, '0.00', 31, 35, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2083, '2090148', '0.00', 'Mortadelle mugs 1kg', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 36, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2084, '2090149', '0.00', 'Fromage brie 1kg', '', '0.00', '0.00', '0.00', '221.00', 0, '0.00', 221, 245, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2085, '2090150', '0.00', 'Ricota 1kg', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 85, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2086, '2090151', '0.00', 'Kasher aux olives', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 87, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2087, '2090152', '0.00', 'Smoked cheese natural gran coeur', '', '0.00', '0.00', '0.00', '198.00', 0, '0.00', 198, 220, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(2088, '2090153', '0.00', 'Mozzarella cheese word 1kg kouto', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 118, 120, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2089, '2090154', '0.00', 'Original cheddar 1kg huizer kaas', '', '0.00', '0.00', '0.00', '189.00', 0, '0.00', 189, 210, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2090, '2090155', '0.00', 'Fromage blanc Al raii 1kg', '', '0.00', '0.00', '0.00', '76.00', 0, '0.00', 76, 85, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2091, '2090156', '0.00', 'Beurre d''or 1kg', '', '0.00', '0.00', '0.00', '72.00', 0, '0.00', 72, 80, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2092, '2090159', '0.00', 'Ananas sec 1kg LA', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 105, 110, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2093, '2090160', '0.00', 'Kiwi sec 1kg la', '', '0.00', '0.00', '0.00', '95.00', 0, '0.00', 86, 115, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2094, '2090161', '0.00', 'Mortadella F H P', '', '0.00', '0.00', '0.00', '74.00', 0, '0.00', 74, 80, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2095, '2090162', '0.00', 'Fromage d''autriche pyrenero 1kg', '', '0.00', '0.00', '0.00', '203.00', 0, '0.00', 203, 255, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2096, '2090163', '0.00', 'Roule saveur crabe 1kg', '', '0.00', '0.00', '0.00', '194.00', 0, '0.00', 194, 215, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2097, '2090164', '0.00', 'Smoked cheese pepper 1kg', '', '0.00', '0.00', '0.00', '189.00', 0, '0.00', 189, 220, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2098, '2090165', '0.00', 'Fromage compte le montagnard 1kg', '', '0.00', '0.00', '0.00', '297.00', 0, '0.00', 297, 390, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2099, '2090166', '0.00', 'Saucisson de dinde sec 1kg', '', '0.00', '0.00', '0.00', '180.00', 0, '0.00', 180, 220, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2100, '2090167', '0.00', 'Gouda Pesto 1kg', '', '0.00', '0.00', '0.00', '293.00', 0, '0.00', 293, 290, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2101, '2090168', '0.00', 'Gouda poivre 1kg', '', '0.00', '0.00', '0.00', '234.00', 0, '0.00', 234, 290, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2102, '2090169', '0.00', 'Dutch goat cheese 1kg', '', '0.00', '0.00', '0.00', '315.00', 0, '0.00', 315, 350, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2103, '2090170', '0.00', 'Fromage raclette 1Kg', '', '0.00', '0.00', '0.00', '270.00', 0, '0.00', 270, 300, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2104, '2090171', '0.00', 'Fromage rodez 1kg', '', '0.00', '0.00', '0.00', '333.00', 0, '0.00', 333, 370, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2105, '2090172', '0.00', 'Chabakia sapak', '', '0.00', '0.00', '0.00', '57.00', 0, '0.00', 57, 70, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2106, '2090173', '0.00', 'Briwat sapak', '', '0.00', '0.00', '0.00', '82.00', 0, '0.00', 82, 100, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2107, '2090174', '0.00', 'Zamita sapak', '', '0.00', '0.00', '0.00', '97.00', 0, '0.00', 97, 120, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2108, '2090200', '0.00', 'Vermicelle couleur 1kg', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 35, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2109, '2090201', '0.00', 'Penne regate 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2110, '2090343', '0.00', 'Forest frommage dor tranche', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 95, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2111, '2090396', '0.00', 'le berger edam cheese', '', '0.00', '0.00', '0.00', '70.00', 0, '66.00', 0, 85, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2112, '2090400', '0.00', 'Flocon d''avoine flakes', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 50, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2113, '2090401', '0.00', 'Wowoats fruitberry 500G', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 36, 25, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2114, '2090500', '0.00', 'Boule rouge el castillo 900g', '', '0.00', '0.00', '0.00', '67.00', 0, '0.00', 90, 98, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2115, '2090501', '0.00', 'El castillo edam boule 1.7kg', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 90, 98, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2116, '2090502', '0.00', 'Pistache 1kg la', '', '0.00', '0.00', '0.00', '145.00', 0, '0.00', 145, 165, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2117, '2090503', '0.00', 'Kroon edam 1.7kg', '', '0.00', '0.00', '0.00', '92.00', 0, '0.00', 92, 0, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2118, '2090600', '0.00', 'Torsade et penne 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 11, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2119, '2090603', '0.00', 'Farine d''orge 1kg', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2120, '2090604', '0.00', 'Lentille 1kg da', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2121, '2090606', '0.00', 'Haricot blanc 1kg da', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2122, '2090607', '0.00', 'Splitbeans 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 11, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2123, '2090609', '0.00', 'Farine extra de mais 1kg', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2124, '2090610', '0.00', 'Raisin rouge 1kg da', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 32, 40, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2125, '2090611', '0.00', 'Raisin blanc 1kg da', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 56, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2126, '2090612', '0.00', 'Pruneaux sec 1kg da', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 52, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2127, '2090614', '0.00', 'Cacao poudre 1kg', '', '0.00', '0.00', '0.00', '59.00', 0, '52.00', 45, 70, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2128, '2090615', '0.00', 'Sucre sachet 1kg', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 9, 14, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2129, '2090616', '0.00', 'Ail 1kg', '', '0.00', '0.00', '0.00', '40.00', 0, '0.00', 40, 48, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2130, '2090617', '0.00', 'Cacahuette rouge 1kg', '', '0.00', '0.00', '0.00', '34.00', 0, '0.00', 34, 37, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2131, '2090618', '0.00', 'Cacahuette complet 1kg', '', '0.00', '0.00', '0.00', '29.00', 0, '0.00', 29, 35, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2132, '2090620', '0.00', 'Grains de sesam 1kg', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 36, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2133, '2090621', '0.00', 'Belboula moyen 1kg', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2134, '2090622', '0.00', 'Semoule de ble gros 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 11, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2135, '2090623', '0.00', 'Semoule fin de ble dur 1kg', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2136, '2090624', '0.00', 'Finot 1kg', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2137, '2090625', '0.00', 'Fandy farine 1kg', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2138, '2090629', '0.00', 'Cheveux d''ange 1kg Dakhla', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 16, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2139, '2090630', '0.00', 'Coco 1kg', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 35, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2140, '2090631', '0.00', 'Sucre glace 1kg', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2141, '2090632', '0.00', 'Sucre semoule 1kg', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2142, '2090636', '0.00', 'Pois chiche grains 1kg', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 16, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2143, '2090641', '0.00', 'Mais 1kg', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 13, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2144, '2090642', '0.00', 'Vermicelle chocolat 1kg', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 28, 40, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2145, '2090643', '0.00', 'Beurre 1kg', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 73, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2146, '2090644', '0.00', 'Riz jaune 1kg', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 19, 22, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2147, '2090645', '0.00', 'Riz blanc glace 1kg', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 14, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2148, '2090646', '0.00', 'Papier glace', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 15, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2149, '2090647', '0.00', 'Dattes el aarche 1kg', '', '0.00', '0.00', '0.00', '26.00', 0, '0.00', 26, 35, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2150, '2090648', '0.00', 'Couscous 1kg', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2151, '2090649', '0.00', 'Langue d''oiseau 1kg', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2152, '2090650', '0.00', 'Petit plomb 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2153, '2090656', '0.00', 'Amande 1kg da', '', '0.00', '0.00', '0.00', '73.00', 0, '0.00', 73, 88, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2154, '2090657', '0.00', 'Noyer belade 1kg', '', '0.00', '0.00', '0.00', '82.00', 0, '0.00', 82, 105, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2155, '2090661', '0.00', 'Pistache 1kg', '', '0.00', '0.00', '0.00', '128.00', 0, '0.00', 129, 145, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2156, '2090668', '0.00', 'Poivre noir 1kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 65, 100, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2157, '2090669', '0.00', 'Cumin 1kg', '', '0.00', '0.00', '0.00', '70.00', 0, '66.00', 50, 80, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2158, '2090670', '0.00', 'Piments doux 1kg', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 49, 58, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2159, '2090671', '0.00', 'Gingembre 1kg', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 50, 80, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2160, '2090672', '0.00', 'Cannelle 1kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 29, 80, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2161, '2090673', '0.00', 'Sachet', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 30, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2162, '2090674', '0.00', 'Vermicelle patissier 1kg', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 40, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2163, '2090675', '0.00', 'Cajou 1kg', '', '0.00', '0.00', '0.00', '115.00', 0, '0.00', 120, 140, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2164, '2090676', '0.00', 'Amande megli 1kg da', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 95, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2165, '2090677', '0.00', 'Cacahuette megli 1kg', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 23, 35, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2166, '2090680', '0.00', 'Ananas sec 1kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 90, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2167, '2090682', '0.00', 'Fruits secs 1kg', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 25, 55, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2168, '2090688', '0.00', 'Dattes sukari 1kg', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 32, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2169, '2090689', '0.00', 'Vermicelle et etoiles 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 11, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2170, '2090690', '0.00', 'Harbal 1kg', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2171, '2090691', '0.00', 'Amande effiles 1kg da', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 110, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2172, '2090695', '0.00', 'Gelatine poudre 1kg', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 140, 170, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2173, '2090696', '0.00', 'Abricot sec 1kg da', '', '0.00', '0.00', '0.00', '127.00', 0, '0.00', 115, 135, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2174, '2090700', '0.00', 'Habat hlawa 1kg', '', '0.00', '0.00', '0.00', '48.00', 0, '0.00', 43, 57, NULL, '', '', '0000-00-00 00:00:00', 24, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2175, '2090701', '0.00', 'Ila farine 1kg', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 15, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2176, '2090702', '0.00', 'Soja 1kg', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 13, 20, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2177, '2090703', '0.00', 'Kattan 1kg', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 20, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2178, '2090707', '0.00', 'Curcuma 1kg', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 70, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2179, '2090710', '0.00', 'Prestige colore', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 22, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2180, '2090713', '0.00', 'Chocolate care', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2181, '2090714', '0.00', 'Krichlat 1kg', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 20, 20, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2182, '2090715', '0.00', 'Farine complet 1kg', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 8, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2183, '2090716', '0.00', 'Choufane 1kg', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 17, 13, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2184, '2090719', '0.00', 'Epices melanger 1kg', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 100, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2185, '2090720', '0.00', 'Fuettine 1kg', '', '0.00', '0.00', '0.00', '110.00', 0, '0.00', 110, 140, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2186, '2090721', '0.00', 'Cacahuette efiles 1kg', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 40, 52, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2187, '2090722', '0.00', 'Amande beldi 1kg', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 105, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2188, '2090724', '0.00', 'Kiwi 1kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 110, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2189, '2090730', '0.00', 'Fromage fondu', '', '0.00', '0.00', '0.00', '117.00', 0, '0.00', 117, 130, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2190, '2090800', '0.00', 'T kroon & fils fromage', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 75, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2191, '2090801', '0.00', 'Luncheon chef', '', '0.00', '0.00', '0.00', '108.00', 0, '0.00', 108, 120, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2192, '2090802', '0.00', 'Feuille de laurier 1kg', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 65, 108, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2193, '2090803', '0.00', 'Gouza 1kg', '', '0.00', '0.00', '0.00', '170.00', 0, '0.00', 120, 180, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2194, '2090804', '0.00', 'Poivre en grains 1kg', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 52, 62, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2195, '2090805', '0.00', 'Thym 1kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 70, 82, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2196, '2090806', '0.00', 'Giroflier 1kg', '', '0.00', '0.00', '0.00', '160.00', 0, '0.00', 160, 190, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2197, '2090807', '0.00', 'Cannelle oud 1kg', '', '0.00', '0.00', '0.00', '45.00', 0, '0.00', 45, 54, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2198, '2090808', '0.00', 'Alk en boite', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2199, '2090809', '0.00', 'Clou de girofle 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2200, '2090810', '0.00', 'Beurre newZeland', '', '0.00', '0.00', '0.00', '87.00', 0, '0.00', 87, 99, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2201, '2090811', '0.00', 'Chriha figue 1kg', '', '0.00', '0.00', '0.00', '58.00', 0, '0.00', 58, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2202, '2090812', '0.00', 'Chriha figue DKL 1kg', '', '0.00', '0.00', '0.00', '57.00', 0, '0.00', 58, 70, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2203, '2090813', '0.00', 'Petit pois 1kg', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2204, '2090814', '0.00', 'T kroon & fils fromage', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 75, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2205, '2090815', '0.00', 'Riz basmati', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 42, 43, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2206, '2090816', '0.00', 'T kroon & fils fromage', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 78, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2207, '2090817', '0.00', 'Kroon fromage gouda nature', '', '0.00', '0.00', '0.00', '96.00', 0, '0.00', 96, 120, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2208, '2090818', '0.00', 'Kroon fromage gouda cumin', '', '0.00', '0.00', '0.00', '96.00', 0, '0.00', 96, 115, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2209, '2090819', '0.00', 'Riz colvert', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2210, '2090820', '0.00', 'Riz dchicha', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 25, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2211, '2090821', '0.00', 'datte loulou', '', '0.00', '0.00', '0.00', '28.00', 0, '0.00', 28, 33, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2212, '2090822', '0.00', 'Riz etuve caprice suzana', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2213, '2090823', '0.00', 'Fromage boule d''or', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 105, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2214, '2090824', '0.00', 'Chabakia', '', '0.00', '0.00', '0.00', '60.00', 0, '0.00', 60, 75, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2215, '2090825', '0.00', 'Roulade de dinde', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 100, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2216, '2090826', '0.00', 'Luncheon boeuf', '', '0.00', '0.00', '0.00', '90.00', 0, '0.00', 90, 100, NULL, '', '', '0000-00-00 00:00:00', 26, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2217, '2090827', '0.00', 'Kroon fromage tranche', '', '0.00', '0.00', '0.00', '103.00', 0, '0.00', 105, 115, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2218, '2090830', '0.00', 'Fruits confit 1kg', '', '0.00', '0.00', '0.00', '65.00', 0, '0.00', 0, 80, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2219, '2090900', '0.00', 'Belboula fine d''orge 1kg', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2220, '2090901', '0.00', 'Semoule gros d''orge 1kg', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2221, '2090902', '0.00', 'Feve 1kg', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2222, '2090903', '0.00', 'Hrissa moulue 1kg', '', '0.00', '0.00', '0.00', '35.00', 0, '0.00', 35, 42, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2223, '2090904', '0.00', 'Beurre copag 1kg', '', '0.00', '0.00', '0.00', '80.00', 0, '0.00', 80, 90, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2224, '2090905', '0.00', 'Sandbad dates', '', '0.00', '0.00', '0.00', '145.00', 0, '0.00', 145, 165, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2225, '2090906', '0.00', 'Gelatine poudre 250G', '', '0.00', '0.00', '0.00', '37.00', 0, '0.00', 0, 45, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2226, '2090907', '0.00', 'Thym 250g', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 0, 30, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2227, '2090908', '0.00', 'Origan 250g', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 0, 25, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2228, '2090909', '0.00', 'Romarin 250g', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 0, 18, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2229, '2090910', '0.00', 'Cacahuette poudre 1kg', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 33, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2230, '2090911', '0.00', 'Amande ronde', '', '0.00', '0.00', '0.00', '79.00', 0, '0.00', 80, 95, NULL, '', '', '0000-00-00 00:00:00', 25, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2231, '2090912', '0.00', 'Sunflowers seeds', '', '0.00', '0.00', '0.00', '84.00', 0, '0.00', 84, 85, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2232, '2090913', '0.00', 'Chick peas', '', '0.00', '0.00', '0.00', '168.00', 0, '0.00', 168, 170, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2233, '2090914', '0.00', 'Pumpkin seeds', '', '0.00', '0.00', '0.00', '140.00', 0, '0.00', 140, 145, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2234, '2090915', '0.00', 'Peanuts', '', '0.00', '0.00', '0.00', '84.00', 0, '0.00', 84, 85, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2235, '2090916', '0.00', 'Kroon & fils fromage', '', '0.00', '0.00', '0.00', '64.00', 0, '0.00', 64, 75, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2236, '2090917', '0.00', 'Pave de saumon congele', '', '0.00', '0.00', '0.00', '260.00', 0, '0.00', 260, 300, NULL, '', '', '0000-00-00 00:00:00', 23, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2237, '2090918', '0.00', 'Riz largo', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 2, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2238, '6011701', '0.00', 'Beone masque fortifiant 500ml', '', '0.00', '0.00', '0.00', '25.00', 0, '0.00', 26, 32, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2239, '17177888', '0.00', 'Bodouiar biscuits 200g', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 0, 18, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2240, '20005719', '0.00', 'Alesto pistaches 250g', '', '0.00', '0.00', '0.00', '43.00', 0, '0.00', 46, 55, NULL, '', '', '0000-00-00 00:00:00', 18, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2241, '20056681', '0.00', 'Aromata sacs congelation 3L', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2242, '20900811', '0.00', 'Arish beurre 1kg', '', '0.00', '0.00', '0.00', '70.00', 0, '0.00', 71, 80, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2243, '20980061', '0.00', 'Floralys ultra absorbent kitchen', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 12, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2244, '27240557', '0.00', 'Today 300 stuck watte stabchen', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2245, '27240922', '0.00', 'Today 300 stuck watte stabchen', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2246, '27241899', '0.00', 'Today 300 stuck watte stabchen', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2247, '30056640', '0.00', 'Rexona stick aloe wera 48 h', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2248, '30079847', '0.00', 'The golossal maybelline', '', '0.00', '0.00', '0.00', '44.00', 0, '0.00', 46, 55, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2249, '30087781', '0.00', 'Pik croq 35g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 14, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2250, '30097100', '0.00', 'Mybelline color show bleu 7ml', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2251, '30143401', '0.00', 'Maybelline mascara', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 37, 48, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2252, '30428188', '0.00', 'Miel afoulki de thym 500g', '', '0.00', '0.00', '0.00', '145.00', 0, '0.00', 145, 170, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2253, '30428225', '0.00', 'Afoulki miel de fleur 500gr', '', '0.00', '0.00', '0.00', '85.00', 0, '0.00', 85, 105, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2254, '30428917', '0.00', 'Afoulki miel de chardon 250g', '', '0.00', '0.00', '0.00', '57.00', 0, '0.00', 58, 69, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2255, '40052403', '0.00', 'KitKat new 41.5g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2256, '40052410', '0.00', 'Kitkat chocolat 41,5g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2257, '40052458', '0.00', 'Nestle kitkat 54.5g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2258, '40058153', '0.00', 'Nivea creme 30 ml', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2259, '40063294', '0.00', 'Nivea body souffle cherry 200ml', '', '0.00', '0.00', '0.00', '41.00', 0, '0.00', 41, 49, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2260, '40063690', '0.00', 'Nivea creme 100ml tube', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2261, '40066110', '0.00', 'Nivea creme body souffle 200ml', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 34, 42, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2262, '40084077', '0.00', 'Kinder maxi 21g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2263, '40084107', '0.00', 'Kinder surprise 20g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 8, 11, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2264, '40084701', '0.00', 'Kinder chocolate *8 pcs', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 15, 15, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2265, '40111001', '0.00', 'Bounty 57g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2266, '40111216', '0.00', 'Bounty chocolat 28,50gr*2', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2267, '40111445', '0.00', 'm&ms bonbons 45gr', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2268, '40111490', '0.00', 'm&ms bonbons au chocolat 45gr', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2269, '40144016', '0.00', 'Werthers cream candies 50g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2270, '40144382', '0.00', 'Knoppers milk 25g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2271, '40144399', '0.00', 'Knoppers 25g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 4, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2272, '40338637', '0.00', 'Zottis dessert 460g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2273, '40338644', '0.00', 'Zottis dessert caramel 460g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 11, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2274, '40345123', '0.00', 'Smarties 34g', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2275, '40737171', '0.00', 'Kuhne relish aux cornichons350g', '', '0.00', '0.00', '0.00', '42.00', 0, '0.00', 0, 50, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2276, '40822747', '0.00', 'Schweppes citron 50cl', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2277, '40883007', '0.00', 'Dove soin corps 300ml', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 30, 38, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2278, '42104964', '0.00', 'Ciel eau minerale 33cl', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2279, '42105244', '0.00', 'Coca cola 33 cl', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 4, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2280, '42140191', '0.00', 'Rossini wafers noisette 20,8g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 2, 1, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2281, '42164104', '0.00', 'Nivea creme 60ml', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2282, '42182627', '0.00', 'Vasline original  50ml', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2283, '42182634', '0.00', 'Vaseline original 100ml', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 17, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2284, '42182658', '0.00', 'Vaseline original 200ml', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 27, 34, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2285, '42192534', '0.00', 'Atrix creme pr les mains 30 ml', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2286, '42192541', '0.00', 'Atrix creme 60ml', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 10, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2287, '42211518', '0.00', 'Evolution chicles five sin azuca', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2288, '42217565', '0.00', 'Nivea men deo stick 40ml', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 19, 26, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2289, '42229032', '0.00', 'JA creme de noisette et nougat 4', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2290, '42240174', '0.00', 'Nivea stick BW invisible 40ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2291, '42240235', '0.00', 'Nivea deo stick 40ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2292, '42240259', '0.00', 'Nivea men deo stick fresh 40ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2293, '42277774', '0.00', 'Nivea men creme 30ml', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 9, 11, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2294, '42289036', '0.00', 'Nivea deo protect & care 40ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2295, '42289234', '0.00', 'Nivea men protect care 40ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2296, '42299554', '0.00', 'Nivea deo roll protect care 50ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2297, '42299943', '0.00', 'Nivea deo roll 50ml double effec', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2298, '42345121', '0.00', 'Nivea stick black&white pure 50m', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2299, '42345220', '0.00', 'Nivea deodorant roll dry comfort', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 26, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2300, '42345275', '0.00', 'Nivea stick double effect 50ml', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2301, '42345312', '0.00', 'Nivea deo fresh 50ml', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2302, '42345503', '0.00', 'Nivea men stick black&white 50ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2303, '42349686', '0.00', 'Nivea creme nourissante 50ml', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2304, '42349693', '0.00', 'Nivea creme nourissante 100ml', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 21, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2305, '42349709', '0.00', 'Nivea creme nourissante 200ml', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 36, 42, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2306, '42349716', '0.00', 'Nivea creme eclaircissante 50ml', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2307, '42349723', '0.00', 'Nivea eclaircissante 100ml', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2308, '42349730', '0.00', 'Nivea creme eclaircissante 200ml', '', '0.00', '0.00', '0.00', '36.00', 0, '0.00', 37, 44, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2309, '42355656', '0.00', 'Nivea deo invisible 50ml', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2310, '42360353', '0.00', 'Nivea stick fresh flower 50ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2311, '42389316', '0.00', 'Nivea deo roll fresh ocean 50ml', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2312, '42389330', '0.00', 'Nivea deo roll fresh natural 50m', '', '0.00', '0.00', '0.00', '19.00', 0, '0.00', 19, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2313, '42397588', '0.00', 'Nivea soft 50ml', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 10, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2314, '42417637', '0.00', 'Nivea crema de manos 100ml', '', '0.00', '0.00', '0.00', '24.00', 0, '0.00', 24, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2315, '50075126', '0.00', 'Rexona deo stick 50ml', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 17, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2316, '50076598', '0.00', 'Rexona stick invisible 40ml', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2317, '50096190', '0.00', 'Dove stock original 50ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 21, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2318, '50112265', '0.00', 'Schweppes tonic 500ml', '', '0.00', '0.00', '0.00', '6.00', 0, '5.00', 5, 7, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2319, '50112784', '0.00', 'Aquarius lemon 500ml', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 7, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2320, '50158973', '0.00', 'Dettol savon 70g original', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2321, '50158980', '0.00', 'Dettol savon antibacterial origi', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 8, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2322, '50251100', '0.00', 'Quality street chocolat 240gr', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 52, 60, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2323, '50285662', '0.00', 'Dove stick go fresh 40ml cucumbe', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 21, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2324, '50287062', '0.00', 'Dove stick invisible dry 40ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 21, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2325, '50287345', '0.00', 'Dove invisible deo 50ml', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 13, 21, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2326, '50457878', '0.00', 'Heinz classic barbecue 480gr', '', '0.00', '0.00', '0.00', '27.00', 0, '0.00', 28, 33, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2327, '54011557', '0.00', 'Hawai tropical 33cl', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2328, '54024205', '0.00', 'Signal gel presco 75ml', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2329, '54024502', '0.00', 'Rexona deo cotton 40ml', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 18, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2330, '54491069', '0.00', 'Sprite 0.5L', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 5, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2331, '54491472', '0.00', 'Cocacola 0.5L', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 5, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2332, '54492103', '0.00', 'Hawai tropical 500ml', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 6, 6, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2333, '57027890', '0.00', 'Milka sercret box 14.4g', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 0, 17, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2334, '59032823', '0.00', 'Nutella 630g', '', '0.00', '0.00', '0.00', '49.00', 0, '0.00', 55, 62, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2335, '59079576', '0.00', 'Dove go fresh deo stick 50ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2336, '59079750', '0.00', 'Rexona reo stick cool 50ml', '', '0.00', '0.00', '0.00', '20.00', 0, '0.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2337, '59082613', '0.00', 'Dove men cool fresh stick 50ml', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 13, 20, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2338, '59085621', '0.00', 'Rexona deo stick', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 21, 25, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2339, '61110014', '0.00', 'Knor bouillon au de poulet 18g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2340, '61110021', '0.00', 'Knor bouillon boeuf 18g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2341, '61110038', '0.00', 'Knor bouillon mouton 18g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 2, NULL, '', '', '0000-00-00 00:00:00', 3, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2342, '76145513', '0.00', 'Toblerone 50g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 10, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2343, '76145759', '0.00', 'Toblerone 35g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 7, 8, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2344, '76222276', '0.00', 'Molka leo 33,30gr', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2345, '80050025', '0.00', 'Tic tac orange', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2346, '80050100', '0.00', 'nutella go 52g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2347, '80050124', '0.00', 'Tic tac fresh mint', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2348, '80050278', '0.00', 'Ferrero rocher chocolat *3ps', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 13, 15, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2349, '80050780', '0.00', 'Tic tac spearmint', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2350, '80052357', '0.00', 'Duplo ferrero 26g', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 8, 9, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0);
INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`) VALUES
(2351, '80052487', '0.00', 'Rafaello 3 pcs', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 12, 15, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2352, '80052760', '0.00', 'Kinder bueno 43g', '', '0.00', '0.00', '0.00', '7.00', 0, '4.00', 7, 9, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2353, '80135463', '0.00', 'Nutella 200g', '', '0.00', '0.00', '0.00', '21.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2354, '80135876', '0.00', 'Nutella ferrero 400g', '', '0.00', '0.00', '0.00', '32.00', 0, '0.00', 32, 38, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2355, '80176732', '0.00', 'Kinder happy hippo cocoa', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 2, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2356, '80176800', '0.00', 'Nutella 750gr', '', '0.00', '0.00', '0.00', '63.00', 0, '0.00', 63, 70, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2357, '80177173', '0.00', 'Nutella 350gr', '', '0.00', '0.00', '0.00', '30.00', 0, '0.00', 31, 37, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2358, '80177180', '0.00', 'Kinder chocolate with cereals 23', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 2, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2359, '80177609', '0.00', 'Kinder chocolate 12,5g*4ps', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 4, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2360, '80177616', '0.00', 'Kinder chocolate 8 batonnets 100', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 16, 20, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2361, '80180004', '0.00', 'Rubber party set balloon', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2362, '80180236', '0.00', 'Rubber party set balloon', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 12, 16, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2363, '80310891', '0.00', 'kinder joy minions 20g', '', '0.00', '0.00', '0.00', '9.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2364, '80466437', '0.00', 'Dove original stick 40ml', '', '0.00', '0.00', '0.00', '17.00', 0, '0.00', 18, 24, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2365, '80466444', '0.00', 'Dove original deo 50ml', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 17, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2366, '80466468', '0.00', 'Dove original deo 50ml', '', '0.00', '0.00', '0.00', '23.00', 0, '0.00', 25, 30, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2367, '80473656', '0.00', 'Bon bons parfum butterfly 50ml', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2368, '80483656', '0.00', 'Bon Bons malizia 50ml', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2369, '80483663', '0.00', 'Bon nons parfum happiness 50ml', '', '0.00', '0.00', '0.00', '12.00', 0, '0.00', 13, 16, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2370, '80602309', '0.00', 'Balconi rollino nicciola 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2371, '80602310', '0.00', 'Balconi rollino cacao 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2372, '80602311', '0.00', 'Balconi rollino cacao 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 0, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2373, '80633044', '0.00', 'Trancetto cacao creme 1pcs', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2374, '80633075', '0.00', 'Balconi rollino latte 1pcs', '', '0.00', '0.00', '0.00', '2.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2375, '80634171', '0.00', 'BonBons malizia parfum kids', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2376, '80670346', '0.00', 'BonBons malizia parfum kids', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2377, '80733140', '0.00', 'Mentos gum full fruit 30g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2378, '80756637', '0.00', 'Mentos pure fresh mint gum 14pcs', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 13, NULL, '', '', '0000-00-00 00:00:00', 7, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2379, '80759294', '0.00', 'BonBons malizia parfum kids', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2380, '80759300', '0.00', 'Bon bons parfum fashion girl 50m', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 18, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2381, '80761761', '0.00', 'Kinder bueno  white 43g', '', '0.00', '0.00', '0.00', '6.00', 0, '6.00', 7, 7, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2382, '80767725', '0.00', 'Callipo trancetti de tonno 170g', '', '0.00', '0.00', '0.00', '33.00', 0, '0.00', 34, 40, NULL, '', '', '0000-00-00 00:00:00', 1, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2383, '80768258', '0.00', 'Kinder joy girl 20g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2384, '80794301', '0.00', 'Mentos pure fresh 30g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2385, '80811152', '0.00', 'Mentos gum fraise 30g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2386, '80824107', '0.00', 'Kinder creamy 19g', '', '0.00', '0.00', '0.00', '6.00', 0, '0.00', 6, 3, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2387, '80845379', '0.00', 'Nutella 25g', '', '0.00', '0.00', '0.00', '13.00', 0, '0.00', 14, 12, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2388, '80883272', '0.00', 'Tic tac stawberry mix', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 6, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2389, '80895237', '0.00', 'Nutella 700g', '', '0.00', '0.00', '0.00', '52.00', 0, '0.00', 58, 68, NULL, '', '', '0000-00-00 00:00:00', 20, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2390, '80897873', '0.00', 'Mentos pure fresh 30g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2391, '80957447', '0.00', 'Mentos gum pure fresh fraise 30g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2392, '80974482', '0.00', 'Kinder joy boy 20g', '', '0.00', '0.00', '0.00', '11.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2393, '84100016', '0.00', 'Flan royal 4pcs', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 12, 14, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2394, '84100061', '0.00', 'Filipinos con chocolat negro 75g', '', '0.00', '0.00', '0.00', '10.00', 0, '0.00', 11, 12, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2395, '84100559', '0.00', 'Cuajada royal flan 48g', '', '0.00', '0.00', '0.00', '18.00', 0, '0.00', 18, 21, NULL, '', '', '0000-00-00 00:00:00', 17, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2396, '84117144', '0.00', 'Puleva batido de chocolate 200ml', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2397, '84117151', '0.00', 'Puleva batido de vanilla 200ml', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2398, '84117168', '0.00', 'Puleva batido sabor fresa 200ml', '', '0.00', '0.00', '0.00', '7.00', 0, '0.00', 10, 13, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2399, '84117205', '0.00', 'Puleva batido de chocolate 200ml', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2400, '84117212', '0.00', 'Puleva batido de vanilla 200ml c', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2401, '84117229', '0.00', 'Puleva batido de fresa 200ml car', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2402, '84164445', '0.00', 'Trident chwingum menta peppermin', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2403, '84164452', '0.00', 'Trident chwingum menthe  14.5g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2404, '84164872', '0.00', 'Trident chwingum fraise 14.5g', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 4, 5, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2405, '84196842', '0.00', 'Chupa chups melody pops', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 6, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2406, '87126631', '0.00', 'Sprite 33 cl', '', '0.00', '0.00', '0.00', '4.00', 0, '0.00', 4, 4, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2407, '87150834', '0.00', 'Gourmet 85gr saumon', '', '0.00', '0.00', '0.00', '8.00', 0, '0.00', 9, 10, NULL, '', '', '0000-00-00 00:00:00', 4, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2408, '87172607', '0.00', 'Penotti duo noiset lait 350g', '', '0.00', '0.00', '0.00', '11.00', 0, '12.00', 14, 16, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2409, '87172652', '0.00', 'Penotti duo noiset lait 750g', '', '0.00', '0.00', '0.00', '16.00', 0, '18.00', 20, 24, NULL, '', '', '0000-00-00 00:00:00', 9, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2410, '87340655', '0.00', 'Rexona stick active 50ml', '', '0.00', '0.00', '0.00', '16.00', 0, '0.00', 17, 23, NULL, '', '', '0000-00-00 00:00:00', 13, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2411, '87345124', '0.00', 'Mentos banana 37.50g F', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 3, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2412, '87345377', '0.00', 'Mentos chewy dragees 37.5g', '', '0.00', '0.00', '0.00', '5.00', 0, '0.00', 5, 6, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2413, '90162602', '0.00', 'Red bull energy drink 250ml', '', '0.00', '0.00', '0.00', '15.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2414, '90162909', '0.00', 'Red bull energy drink 250ml', '', '0.00', '0.00', '0.00', '14.00', 0, '0.00', 15, 20, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2415, '90331862', '0.00', 'Puly peche 25cl', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2416, '90338243', '0.00', 'Cocacola 25cl', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 3, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2417, '90377204', '0.00', 'Fanta 25cl', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 2, 3, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2418, '90382383', '0.00', 'Cuppy pulpy orange 25cl', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2419, '90399794', '0.00', 'Sprite 25 cl', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 3, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2420, '90418235', '0.00', 'Hawai tropical 25 cl', '', '0.00', '0.00', '0.00', '3.00', 0, '0.00', 3, 4, NULL, '', '', '0000-00-00 00:00:00', 5, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2421, '90444470', '0.00', 'Pez 8.5g', '', '0.00', '0.00', '0.00', '1.00', 0, '0.00', 1, 1, NULL, '', '', '0000-00-00 00:00:00', 10, '', 35, 0, '0000-00-00', 0, 'U', 1, '', 0),
(2422, '', '0.00', 'swdw', 'dqwdwq', '1.00', '0.00', '10.00', '0.00', 0, '1.00', 1, 1, 15, '', '5', '2023-05-23 23:00:00', 16, '', 35, 0, '2023-05-24', 0, 'U', 1, NULL, 1),
(2423, '0089927320209', '0.20', 'Test', '', '1.00', '1000.00', '10.00', '5.00', 0, '10.00', 15, 20, 20, '', '5', '2023-05-23 23:00:00', 16, '', 35, 0, '2023-05-24', 0, 'U', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produit_depot`
--

CREATE TABLE `produit_depot` (
  `id` int(11) NOT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `qte` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit_depot`
--

INSERT INTO `produit_depot` (`id`, `id_produit`, `id_depot`, `qte`) VALUES
(1, 305, 14, 10),
(2, 306, 14, 10),
(3, 307, 14, 10),
(4, 308, 14, 10),
(5, 309, 14, 10),
(6, 310, 14, 10),
(7, 311, 14, 10),
(8, 312, 14, 10),
(9, 313, 14, 10),
(10, 314, 14, 10),
(11, 315, 14, 10),
(12, 316, 14, 10),
(13, 317, 14, 10),
(14, 318, 14, 10),
(15, 319, 14, 10),
(16, 320, 5, 95),
(17, 321, 5, 0),
(18, 322, 5, 2),
(19, 323, 5, 10),
(20, 324, 5, -91),
(21, 325, 5, 10),
(22, 326, 5, 10),
(23, 327, 5, 10),
(24, 328, 5, 10),
(25, 329, 5, 10),
(26, 330, 5, 10),
(27, 331, 5, 10),
(28, 332, 5, 10),
(29, 333, 5, 10),
(30, 334, 5, 10),
(31, 335, 5, 10),
(32, 336, 5, 1958),
(33, 322, 11, 6),
(34, 336, 11, 41),
(35, 2422, 5, 0),
(36, 2423, 5, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `reg_achat`
--

CREATE TABLE `reg_achat` (
  `id_reg` int(11) NOT NULL,
  `id_achat` int(11) DEFAULT NULL,
  `mode_reg` varchar(25) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='reg_achat';

-- --------------------------------------------------------

--
-- Table structure for table `reg_avoir`
--

CREATE TABLE `reg_avoir` (
  `id_reg` int(11) NOT NULL,
  `id_avoir` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `remarque` text,
  `mode_reg` varchar(25) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_client`
--

CREATE TABLE `reg_client` (
  `id_reg` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `remarque` text,
  `mode_reg` varchar(50) DEFAULT NULL,
  `num_cheque` varchar(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `id_agence` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_client`
--

INSERT INTO `reg_client` (`id_reg`, `id_client`, `date_reg`, `montant`, `remarque`, `mode_reg`, `num_cheque`, `id_user`, `etat`, `date_validation`, `id_compte`, `id_agence`) VALUES
(1, 1, '2023-05-10', '600.00', '', 'Cheque', '0', 35, 1, '2023-05-14', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reg_commande`
--

CREATE TABLE `reg_commande` (
  `id_reg` int(11) NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(65,2) DEFAULT NULL,
  `remarque` text,
  `mode_reg` varchar(25) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_fournisseur`
--

CREATE TABLE `reg_fournisseur` (
  `id_reg` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `date_reg` date NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `remarque` text NOT NULL,
  `mode_reg` varchar(50) NOT NULL,
  `num_cheque` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `etat` tinyint(4) NOT NULL,
  `date_validation` date NOT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `id_agence` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_vendeur`
--

CREATE TABLE `reg_vendeur` (
  `id_reg` int(11) NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `mode_reg` text,
  `num_cheque` text,
  `date_reg` text,
  `montant` double DEFAULT NULL,
  `remarque` text,
  `etat` text,
  `id_user` int(11) DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `date_validation` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_vente`
--

CREATE TABLE `reg_vente` (
  `id_reg` int(11) NOT NULL,
  `id_vente` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(65,2) DEFAULT NULL,
  `remarque` text,
  `mode_reg` varchar(25) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `id_reg_client` int(11) DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_vente`
--

INSERT INTO `reg_vente` (`id_reg`, `id_vente`, `date_reg`, `montant`, `remarque`, `mode_reg`, `id_user`, `num_cheque`, `etat`, `date_validation`, `id_compte`, `id_reg_client`) VALUES
(1, 1, '2023-05-10', '50.00', 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-05-10]', 'Espece', 35, '0', 0, '1900-01-01', 1, -1),
(2, 1, '2023-05-10', '600.00', 'Reglement global [ Montant : 600/Mode de Reglement : Cheque/Date : 2023-05-10]', 'Cheque', 35, '0', 1, '2023-05-14', 1, 1),
(3, 1, '2023-05-10', '0.00', 'Reglement global [ Montant : 600/Mode de Reglement : Cheque/Date : 2023-05-10]', 'Cheque', 35, '0', 1, '2023-05-14', 1, -1);

-- --------------------------------------------------------

--
-- Table structure for table `serial_code`
--

CREATE TABLE `serial_code` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `date_activation` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serial_code`
--

INSERT INTO `serial_code` (`id`, `code`, `date_activation`) VALUES
(0, 'apJrZ5Fgl2Bpaw==', '2021-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `societe`
--

CREATE TABLE `societe` (
  `id` int(11) NOT NULL,
  `raisonsocial` varchar(255) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `compte` varchar(30) DEFAULT NULL,
  `iff` varchar(30) DEFAULT NULL,
  `rc` varchar(30) DEFAULT NULL,
  `patente` varchar(30) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `header_footer` int(11) DEFAULT NULL,
  `unite_util` varchar(20) DEFAULT NULL,
  `etat_unite` int(11) DEFAULT NULL,
  `IdUser` int(11) DEFAULT NULL,
  `valeur_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nb` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `societe`
--

INSERT INTO `societe` (`id`, `raisonsocial`, `telephone`, `fax`, `email`, `compte`, `iff`, `rc`, `patente`, `adresse`, `logo`, `header_footer`, `unite_util`, `etat_unite`, `IdUser`, `valeur_key`, `nb`) VALUES
(1, 'GCMI', '0612345678', '', 'contact@gcmi.store', '', '', '', '', 'LAAYOUNE', '', 0, '', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `usine`
--

CREATE TABLE `usine` (
  `id_usine` int(11) NOT NULL,
  `raisonsocial` varchar(255) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `iff` varchar(30) DEFAULT NULL,
  `rc` varchar(30) DEFAULT NULL,
  `patente` varchar(30) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `tele` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `privilege` varchar(20) DEFAULT NULL,
  `idu` int(11) DEFAULT NULL,
  `achat` int(2) DEFAULT NULL,
  `vente` int(2) DEFAULT NULL,
  `client` int(2) DEFAULT NULL,
  `fournisseur` int(2) DEFAULT NULL,
  `produit` int(2) DEFAULT NULL,
  `avoir` int(2) DEFAULT NULL,
  `charge` int(2) DEFAULT NULL,
  `poste` varchar(200) NOT NULL DEFAULT 'Indefinie',
  `agences` text,
  `id_depot` int(11) NOT NULL DEFAULT '-1',
  `id_usine` int(11) NOT NULL DEFAULT '-1',
  `display_usine` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `nom`, `tele`, `email`, `pwd`, `privilege`, `idu`, `achat`, `vente`, `client`, `fournisseur`, `produit`, `avoir`, `charge`, `poste`, `agences`, `id_depot`, `id_usine`, `display_usine`) VALUES
(35, 'admin', 'admin', '', '', 'admin', 'Admin', 35, 1, 1, 1, 1, 1, 1, 1, 'Chef d\\''usine', '2', -1, 5, 1),
(47, 'FATI', 'FATIMA EZAHRA', '', '', 'FATI@1995', 'User', 35, 1, 0, 1, 0, 0, 0, 0, 'Indefinie', NULL, -1, -1, 0),
(48, 'a', 'a', 'a', 'a', 'a', 'User+', 35, 1, 1, 0, 0, 1, 0, 1, 'Indefinie', NULL, -1, -1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE `vente` (
  `id_vente` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_vente` date DEFAULT NULL,
  `remarque` text,
  `id_user` int(11) DEFAULT NULL,
  `numbon` int(100) DEFAULT NULL,
  `datebon` date DEFAULT NULL,
  `remarquebon` text,
  `num_devi` int(11) DEFAULT NULL,
  `bon_commande` text,
  `validite` varchar(60) DEFAULT '1 mois',
  `client` text,
  `id_bon` int(11) DEFAULT NULL,
  `localisation` text,
  `id_agence` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vente`
--

INSERT INTO `vente` (`id_vente`, `id_client`, `date_vente`, `remarque`, `id_user`, `numbon`, `datebon`, `remarquebon`, `num_devi`, `bon_commande`, `validite`, `client`, `id_bon`, `localisation`, `id_agence`, `created_at`) VALUES
(1, 1, '2023-05-10', '', 35, 1, '2023-05-10', NULL, NULL, '0', '1 mois', NULL, NULL, NULL, NULL, '2023-05-10 16:28:05'),
(2, 1, '2023-05-10', '', 35, 2, '2023-05-10', NULL, NULL, '0', '1 mois', NULL, NULL, NULL, NULL, '2023-05-10 17:04:36'),
(3, 1, '2023-05-15', '', 35, 3, '2023-05-15', NULL, NULL, '0', '1 mois', NULL, NULL, NULL, NULL, '2023-05-15 15:55:27'),
(4, 1, '2023-05-24', '', 35, 4, '2023-05-24', NULL, NULL, '0', '1 mois', NULL, NULL, NULL, NULL, '2023-05-24 19:59:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`id_achat`);

--
-- Indexes for table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`id_agence`);

--
-- Indexes for table `avoir`
--
ALTER TABLE `avoir`
  ADD PRIMARY KEY (`id_avoir`);

--
-- Indexes for table `boncommande`
--
ALTER TABLE `boncommande`
  ADD PRIMARY KEY (`id_bon`);

--
-- Indexes for table `boncommandevendeur`
--
ALTER TABLE `boncommandevendeur`
  ADD PRIMARY KEY (`id_bon`);

--
-- Indexes for table `caisse`
--
ALTER TABLE `caisse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `commande_usine`
--
ALTER TABLE `commande_usine`
  ADD PRIMARY KEY (`id_cmd`);

--
-- Indexes for table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `depot`
--
ALTER TABLE `depot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `depot_op`
--
ALTER TABLE `depot_op`
  ADD PRIMARY KEY (`id_depot_op`);

--
-- Indexes for table `design`
--
ALTER TABLE `design`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_achat`
--
ALTER TABLE `detail_achat`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `detail_avoir`
--
ALTER TABLE `detail_avoir`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `detail_bon_vendeur`
--
ALTER TABLE `detail_bon_vendeur`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `detail_depot_op`
--
ALTER TABLE `detail_depot_op`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `detail_entre`
--
ALTER TABLE `detail_entre`
  ADD PRIMARY KEY (`id_de`);

--
-- Indexes for table `detail_produit`
--
ALTER TABLE `detail_produit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_sortie`
--
ALTER TABLE `detail_sortie`
  ADD PRIMARY KEY (`id_ds`);

--
-- Indexes for table `detail_vente`
--
ALTER TABLE `detail_vente`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `export`
--
ALTER TABLE `export`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id_facture`);

--
-- Indexes for table `facture_avoir`
--
ALTER TABLE `facture_avoir`
  ADD PRIMARY KEY (`id_facture`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_fournisseur`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `designation` (`designation`);

--
-- Indexes for table `produit_depot`
--
ALTER TABLE `produit_depot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_achat`
--
ALTER TABLE `reg_achat`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indexes for table `reg_avoir`
--
ALTER TABLE `reg_avoir`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indexes for table `reg_client`
--
ALTER TABLE `reg_client`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indexes for table `reg_commande`
--
ALTER TABLE `reg_commande`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indexes for table `reg_fournisseur`
--
ALTER TABLE `reg_fournisseur`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indexes for table `reg_vendeur`
--
ALTER TABLE `reg_vendeur`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indexes for table `reg_vente`
--
ALTER TABLE `reg_vente`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indexes for table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usine`
--
ALTER TABLE `usine`
  ADD PRIMARY KEY (`id_usine`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id_vente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achat`
--
ALTER TABLE `achat`
  MODIFY `id_achat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `agence`
--
ALTER TABLE `agence`
  MODIFY `id_agence` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `avoir`
--
ALTER TABLE `avoir`
  MODIFY `id_avoir` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `boncommande`
--
ALTER TABLE `boncommande`
  MODIFY `id_bon` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `boncommandevendeur`
--
ALTER TABLE `boncommandevendeur`
  MODIFY `id_bon` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `caisse`
--
ALTER TABLE `caisse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `charge`
--
ALTER TABLE `charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `commande_usine`
--
ALTER TABLE `commande_usine`
  MODIFY `id_cmd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `depot`
--
ALTER TABLE `depot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `depot_op`
--
ALTER TABLE `depot_op`
  MODIFY `id_depot_op` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `design`
--
ALTER TABLE `design`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_achat`
--
ALTER TABLE `detail_achat`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `detail_avoir`
--
ALTER TABLE `detail_avoir`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_bon_vendeur`
--
ALTER TABLE `detail_bon_vendeur`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_commande`
--
ALTER TABLE `detail_commande`
  MODIFY `id_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_depot_op`
--
ALTER TABLE `detail_depot_op`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `detail_entre`
--
ALTER TABLE `detail_entre`
  MODIFY `id_de` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_produit`
--
ALTER TABLE `detail_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_sortie`
--
ALTER TABLE `detail_sortie`
  MODIFY `id_ds` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_vente`
--
ALTER TABLE `detail_vente`
  MODIFY `id_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `facture`
--
ALTER TABLE `facture`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `facture_avoir`
--
ALTER TABLE `facture_avoir`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2424;
--
-- AUTO_INCREMENT for table `produit_depot`
--
ALTER TABLE `produit_depot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `reg_achat`
--
ALTER TABLE `reg_achat`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reg_avoir`
--
ALTER TABLE `reg_avoir`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reg_client`
--
ALTER TABLE `reg_client`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reg_commande`
--
ALTER TABLE `reg_commande`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reg_fournisseur`
--
ALTER TABLE `reg_fournisseur`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reg_vendeur`
--
ALTER TABLE `reg_vendeur`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reg_vente`
--
ALTER TABLE `reg_vente`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `societe`
--
ALTER TABLE `societe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `usine`
--
ALTER TABLE `usine`
  MODIFY `id_usine` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `vente`
--
ALTER TABLE `vente`
  MODIFY `id_vente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

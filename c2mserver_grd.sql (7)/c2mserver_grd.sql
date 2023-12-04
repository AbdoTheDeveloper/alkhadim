-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 30 nov. 2023 à 15:45
-- Version du serveur : 10.3.38-MariaDB
-- Version de PHP : 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `c2mserver_grd`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE `achat` (
  `id_achat` int(11) NOT NULL,
  `id_fournisseur` int(11) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `valide` int(11) DEFAULT 0,
  `num_facture` text DEFAULT NULL,
  `num_bon` text DEFAULT NULL,
  `id_agence` text DEFAULT NULL,
  `devise_produit` varchar(25) DEFAULT NULL,
  `num_dum` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `achat`
--

INSERT INTO `achat` (`id_achat`, `id_fournisseur`, `montant`, `date_achat`, `remarque`, `id_user`, `valide`, `num_facture`, `num_bon`, `id_agence`, `devise_produit`, `num_dum`) VALUES
(10, 1, 6600, '2023-11-27', '', 56, 1, '111', NULL, NULL, 'Â£', 222);

-- --------------------------------------------------------

--
-- Structure de la table `agence`
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

CREATE TABLE `avoir` (
  `id_avoir` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_avoir` date DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `numbon` int(11) DEFAULT NULL,
  `datebon` date DEFAULT NULL,
  `remarquebon` text DEFAULT NULL,
  `num_devi` int(11) DEFAULT NULL,
  `id_agence` text DEFAULT NULL,
  `is_synced` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boncommande`
--

CREATE TABLE `boncommande` (
  `id_bon` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_bon` date DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `numbon` int(100) DEFAULT NULL,
  `remarquebon` text DEFAULT NULL,
  `id_agence` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boncommandevendeur`
--

CREATE TABLE `boncommandevendeur` (
  `id_bon` int(11) NOT NULL,
  `id_vendeur` int(11) DEFAULT NULL,
  `date_bon` text DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `etat` varchar(200) NOT NULL DEFAULT 'En cours',
  `numbon` text DEFAULT NULL,
  `remarquebon` text DEFAULT NULL,
  `id_agence` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `boncommandevendeur`
--

INSERT INTO `boncommandevendeur` (`id_bon`, `id_vendeur`, `date_bon`, `remarque`, `id_user`, `etat`, `numbon`, `remarquebon`, `id_agence`) VALUES
(12, 61, '2023-11-24', '', 56, 'En cours', NULL, NULL, NULL),
(13, 61, '2023-11-24', '', 56, 'En cours', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `caisse`
--

CREATE TABLE `caisse` (
  `id` int(11) NOT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `type_reg` varchar(250) DEFAULT NULL,
  `date_caisse` date DEFAULT NULL,
  `montant` varchar(250) DEFAULT '0',
  `image` text DEFAULT NULL,
  `id_user` text DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `date_add` timestamp NULL DEFAULT current_timestamp(),
  `date_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `date_delete` timestamp NULL DEFAULT NULL,
  `id_depot` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `remise_max` float NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `remise_max`, `id_user`) VALUES
(97, 'Les sauces', 0, 35),
(98, 'Les pates', 0, 35),
(99, 'Yoghourt & lait', 0, 35),
(100, 'Chocolat & bonbons', 0, 35),
(101, 'Biscuits et chwingum', 0, 35),
(102, 'MANZANA', 0, 35),
(103, 'Beaute et douche', 0, 35),
(104, 'Insecticide & sacs', 0, 35),
(105, 'Entretien et sanitai', 0, 35),
(106, 'NECTAR', 0, 35),
(107, 'anniversaire', 5, 35),
(108, 'Maison et electromen', 0, 35),
(109, 'Aluminium et film al', 0, 35),
(110, 'Jouets', 0, 35),
(111, 'Boissons', 0, 35),
(112, 'FRISCO', 0, 35),
(113, 'BISCUITE', 0, 35),
(114, 'CONSERVE MAIZ', 0, 35),
(115, 'PATISSERIE', 0, 35),
(116, 'fruits secs', 0, 35),
(117, 'Conserve', 0, 35),
(118, 'VERRE', 0, 35),
(119, 'Lingette et couche', 0, 35),
(120, 'ENERGER', 0, 35),
(121, 'GALLETAS', 0, 35),
(122, 'Pet food', 0, 35);

-- --------------------------------------------------------

--
-- Structure de la table `charge`
--

CREATE TABLE `charge` (
  `id` int(11) NOT NULL,
  `id_achat` text DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `mode_reg` varchar(250) DEFAULT NULL,
  `num_cheque` varchar(250) DEFAULT NULL,
  `date_charge` date DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `devise_produit` varchar(25) DEFAULT NULL,
  `montant` varchar(250) DEFAULT '0',
  `image` text DEFAULT NULL,
  `id_user` text DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_agence` text DEFAULT NULL,
  `date_delete` int(11) DEFAULT NULL,
  `id_fournisseur` varchar(25) DEFAULT NULL,
  `cout_device` varchar(25) NOT NULL,
  `id_depot` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `charge`
--

INSERT INTO `charge` (`id`, `id_achat`, `designation`, `mode_reg`, `num_cheque`, `date_charge`, `date_validation`, `devise_produit`, `montant`, `image`, `id_user`, `remarque`, `id_agence`, `date_delete`, `id_fournisseur`, `cout_device`, `id_depot`) VALUES
(16, '10', 'tax', '', '', '2023-11-27', '2023-11-27', 'MAD', '800', NULL, '56', '', NULL, NULL, '11', '1', NULL),
(14, '10', 'tras', 'Espece', NULL, '2023-11-27', '2023-11-27', 'MAD', '200', NULL, '56', '', NULL, NULL, '15', '1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cheque_transfert_caisse`
--

CREATE TABLE `cheque_transfert_caisse` (
  `id` int(11) NOT NULL,
  `montant_cheque` varchar(25) DEFAULT NULL,
  `num_cheque` int(11) NOT NULL,
  `id_transfert_caisse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
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
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT 0,
  `date_archive` date DEFAULT NULL,
  `id_archiveur` int(11) DEFAULT NULL,
  `type_compte` int(11) DEFAULT 0,
  `plafond` double DEFAULT NULL,
  `plafond2` double DEFAULT NULL,
  `prix_vente` int(11) DEFAULT 1,
  `remise` float DEFAULT NULL,
  `responsable` text DEFAULT NULL,
  `iff` text DEFAULT NULL,
  `rc` text DEFAULT NULL,
  `ville` text DEFAULT NULL,
  `activite` text DEFAULT NULL,
  `pv_guid` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `code`, `nom`, `prenom`, `nom_prenom_ar`, `cin`, `ice`, `telephone`, `email`, `adresse`, `image`, `date_creation`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `type_compte`, `plafond`, `plafond2`, `prix_vente`, `remise`, `responsable`, `iff`, `rc`, `ville`, `activite`, `pv_guid`) VALUES
(1, NULL, 'ABDERRAZAK RAZZOUK  ', '', NULL, '', '', '0636037933', '', '', '', '2023-11-16', 'ESPECE ', 35, 0, '2023-11-16', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(2, NULL, 'MOHAMED LKADI', '', NULL, '', '', '0670811226', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 400000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'ABDELMALEK ZAAJ', '', NULL, '', '', '0677277075', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'JAMAL MAGHROD ', '', NULL, '', '', '0667837902', '', 'IMZOUREN', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 1e18, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(5, NULL, 'IMAD EL GHABZOURI ', '', NULL, '', '', '0664280555', '', 'TANGER', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 1e21, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(6, NULL, 'MHAMED ERRADDAHI ', '', NULL, '', '', '0667512227', '', 'BABERAD', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 500000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(7, NULL, 'AZIZ 207', '', NULL, '', '', '0611349887', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 'CHAIB', '', NULL, '', '', '0611562916', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 'MHAMED BENAIAD ', '', NULL, '', '', '0668622246', '', 'TEMARA', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 1e21, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(10, NULL, 'RACHID SUPER MARCHER ', '', NULL, '', '', '0678062529', '', 'NADOR', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(11, NULL, 'ABDELILAH AKNOUL ', '', NULL, '', '', '0665717582', '', 'AKNOUL', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(12, NULL, 'HAMID EL HADOUCHI', '', NULL, '', '', '0661549926', '', 'FES', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, 'NASER SUPER MARCHER', '', NULL, '', '', '0668697716/0654015715', '', 'NADOR', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, 'KHALID AAROUSS', '', NULL, '', '', '0662572415', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 500000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, 'MOHAMED SAIDI', '', NULL, '', '', '0661523092', '', 'IMZOUREN', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, 'FARID EL OURATI', '', NULL, '', '', '0616098405', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, 'HAMZA BOUKHRISI', '', NULL, '', '', '0638949339', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, 'HICHAM FES', '', NULL, '', '', '0677484651', '', 'FES', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 500000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, 'ALI ZAIO', '', NULL, '', '', '0670811226', '', 'ZAIO', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, 'MOHAMED ASHAD 2', '', NULL, '', '', '0660212912', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, 'MOHAMED ASRIHI', '', NULL, '', '', '0689539931', '', '', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, 'MOHAMED TAZI ', '', NULL, '', '', '0699213097', '', 'OUJDA SOUK FALLAH', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, ''),
(23, NULL, 'MOHAMED SAIYAD', '', NULL, '', '', '0666348597', '', 'OUJDA SOUK FALLAH', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, 'HASSAN CHABRAK', '', NULL, '', '', '0671562867', '', 'OUJDA SOUK FALLAH', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, 'MOHAMED LALMAN', '', NULL, '', '', '0673026557', '', 'OUJDA SOUK FALLAH', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, 'MOURAD ', '', NULL, '', '', '0676958492', '', 'OUJDA SOUK FALLAH', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, 'DRISS RGIB', '', NULL, '', '', '0661354161', '', 'OUJDA SOUK FALLAH', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, 'ABDELGHANI TITR', '', NULL, '', '', '0642160053', '', 'OUJDA SOUK FALLAH', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, 'MOHAMED AIN SFA', '', NULL, '', '', '0687318040', '', 'OUJDA SOUK FALLAH ', '', '2023-11-22', '', 35, 0, '2023-11-22', 0, 0, 200000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, 'DRESS', '', NULL, '', '', '0666985330', '', 'OUJDA', '', '2023-11-22', '', 35, 1, '2023-11-22', 35, 0, 300000, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cloturages`
--

CREATE TABLE `cloturages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_trav` int(11) NOT NULL,
  `id_clotur_pv` int(11) DEFAULT NULL,
  `montant` double(22,0) DEFAULT NULL,
  `nombreOperation` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `montant_espece` float DEFAULT NULL,
  `montant_carte` float DEFAULT NULL,
  `montant_compte` float DEFAULT NULL,
  `montant_offert` float DEFAULT NULL,
  `pv_guid` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_usine`
--

CREATE TABLE `commande_usine` (
  `id_cmd` int(11) NOT NULL,
  `id_client` int(11) DEFAULT -1,
  `date_cmd` text DEFAULT NULL,
  `id_usine` int(11) NOT NULL DEFAULT -1,
  `remarque` text DEFAULT NULL,
  `id_vente` int(11) NOT NULL DEFAULT -1,
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
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
  `remarque` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `num_compte`, `nom_compte`, `nom_banque`, `responsable`, `telephone`, `fax`, `email`, `remarque`) VALUES
(1, '001', 'LA CAISSE', 'SELOUAN', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `depot`
--

CREATE TABLE `depot` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `UUID` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `depot`
--

INSERT INTO `depot` (`id`, `nom`, `UUID`) VALUES
(1, 'DEPOT NADOR', '39f072f1-8e74-49b4-ab1b-42c8b3f43040'),
(2, 'DEPOT TANGER', '818b4906-11d7-4701-b57f-3c2f9a380ef5'),
(3, 'DEPOT TEMARA', '04fb3ce4-2bad-4113-9ed8-3bca6541ecd8'),
(4, 'DEPOT IMZOUREN', '2051fc5f-a10e-4f31-8136-4624ac16772b');

-- --------------------------------------------------------

--
-- Structure de la table `depot_op`
--

CREATE TABLE `depot_op` (
  `id_depot_op` int(11) NOT NULL,
  `remarque` text DEFAULT NULL,
  `date_op` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `design`
--

CREATE TABLE `design` (
  `id` int(11) NOT NULL,
  `libele` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `design`
--

INSERT INTO `design` (`id`, `libele`) VALUES
(1, 'LOYER D1'),
(2, 'LOYER D2'),
(3, 'Saleres'),
(4, 'Les Charges'),
(5, 'Saler R'),
(6, 'Salere S'),
(7, 'Voiture'),
(8, 'Ford transit ');

-- --------------------------------------------------------

--
-- Structure de la table `detail_achat`
--

CREATE TABLE `detail_achat` (
  `id_detail` int(11) NOT NULL,
  `id_achat` int(11) DEFAULT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `prix_produit` decimal(10,2) DEFAULT NULL,
  `qte_achete` decimal(10,2) DEFAULT NULL,
  `date_expiration` date DEFAULT NULL,
  `devise_produit` varchar(11) DEFAULT '1',
  `remise` decimal(10,2) DEFAULT NULL,
  `cout_device` double NOT NULL DEFAULT 1,
  `f_approch` double NOT NULL DEFAULT 1,
  `id_user` int(11) DEFAULT NULL,
  `date_validation` varchar(25) DEFAULT NULL,
  `valide` tinyint(11) DEFAULT NULL,
  `prix_revient` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `detail_achat`
--

INSERT INTO `detail_achat` (`id_detail`, `id_achat`, `id_produit`, `id_depot`, `prix_produit`, `qte_achete`, `date_expiration`, `devise_produit`, `remise`, `cout_device`, `f_approch`, `id_user`, `date_validation`, `valide`, `prix_revient`) VALUES
(91, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL, NULL, NULL, ''),
(94, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL, NULL, NULL, ''),
(95, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL, NULL, NULL, ''),
(97, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL, NULL, NULL, ''),
(98, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL, NULL, NULL, ''),
(101, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL, NULL, NULL, ''),
(102, 10, 86, 1, 6.00, 1000.00, '2023-11-08', 'Â£', NULL, 11, 1, 56, '2023-11-28', 1, ''),
(103, 10, 87, 1, 2.00, 100.00, '2023-11-08', 'Â£', NULL, 11, 1, 56, '2023-11-27', 1, '47.00'),
(104, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `detail_avoir`
--

CREATE TABLE `detail_avoir` (
  `id_detail` int(11) NOT NULL,
  `id_avoir` int(11) DEFAULT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `prix_produit` decimal(10,2) DEFAULT NULL,
  `qte_rendu` decimal(10,2) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `remise` decimal(4,2) DEFAULT NULL,
  `unit` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_bon_vendeur`
--

CREATE TABLE `detail_bon_vendeur` (
  `id_detail` int(11) NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `qte_actuel` double DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `unit` text DEFAULT NULL,
  `valunit` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `detail_bon_vendeur`
--

INSERT INTO `detail_bon_vendeur` (`id_detail`, `id_bon`, `id_depot`, `id_produit`, `prix_produit`, `qte_vendu`, `qte_actuel`, `remise`, `id_user`, `unit`, `valunit`) VALUES
(73, 14, 1, 23, 120, 90, 90, 0, 68, '   ', '90'),
(72, 14, 1, 24, 120, 90, 90, 0, 68, '   ', '90'),
(71, 14, 1, 63, 90, 90, 90, 0, 68, '   ', '90'),
(33, 13, 1, 13, 265, 5, 5, 0, 56, '', '5'),
(34, 13, 1, 29, 155, 15, 0, 0, 56, '', '15'),
(35, 13, 1, 62, 1050, 2, 2, 0, 56, '', '2'),
(36, 13, 1, 4, 150, 60, 0, 0, 56, '', '60'),
(37, 13, 1, 43, 205, 5, 3, 0, 56, '', '5'),
(38, 13, 1, 66, 130, 20, 18, 0, 56, '', '20'),
(39, 13, 1, 26, 205, 20, 0, 0, 56, '', '20'),
(41, 13, 1, 15, 255, 5, 5, 0, 56, '   ', '5'),
(42, 13, 1, 53, 130, 15, -6, 0, 56, '', '15'),
(43, 13, 1, 17, 350, 36, -9, 0, 56, '', '36'),
(44, 13, 1, 22, 355, 4, 0, 0, 56, '   ', '4'),
(45, 13, 1, 9, 195, 5, 0, 0, 56, '   ', '5'),
(47, 13, 1, 55, 180, 15, 14, 0, 56, '   ', '15'),
(48, 13, 1, 20, 180, 15, 12, 0, 56, '   ', '15'),
(49, 13, 1, 52, 851, 2, 2, 26, 56, '', '2'),
(50, 13, 1, 50, 120, 10, 9, 0, 56, '   ', '10'),
(51, 13, 1, 40, 120, 10, 10, 0, 56, '   ', '10'),
(52, 13, 1, 24, 120, 10, 10, 0, 56, '   ', '10'),
(53, 13, 1, 33, 120, 10, 10, 0, 56, '   ', '10'),
(54, 13, 1, 23, 120, 10, 8, 0, 56, '   ', '10'),
(55, 13, 1, 21, 170, 15, 15, 0, 56, '   ', '15'),
(56, 13, 1, 8, 138, 10, 0, 0, 56, '   ', '10'),
(57, 13, 1, 1, 155, 15, 0, 0, 56, '', '15'),
(58, 13, 1, 2, 170, 5, 0, 0, 56, '   ', '5'),
(59, 13, 1, 31, 160, 10, 10, 0, 56, '', '10'),
(60, 13, 1, 27, 160, 10, 10, 0, 56, '', '10'),
(61, 13, 1, 7, 110, 5, 0, 0, 56, '   ', '5'),
(62, 13, 1, 47, 550, 6, 6, 0, 56, '   ', '6'),
(63, 13, 1, 32, 515, 6, 6, 0, 56, '   ', '6'),
(64, 13, 1, 30, 505, 10, 10, 0, 56, '   ', '10'),
(65, 13, 1, 70, 855, 3, 3, 0, 56, '   ', '3'),
(66, 13, 1, 64, 1065, 3, 2, 0, 56, '   ', '3'),
(67, 13, 1, 19, 870, 6, 0, 0, 56, '   ', '6'),
(68, 13, 1, 45, 775, 20, 16, 0, 56, '   ', '20'),
(69, 13, 1, 46, 730, 20, 13, 0, 56, '   ', '20');

-- --------------------------------------------------------

--
-- Structure de la table `detail_commande`
--

CREATE TABLE `detail_commande` (
  `id_detail` int(11) UNSIGNED NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `valunit` double DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_depot_op`
--

CREATE TABLE `detail_depot_op` (
  `id_detail` int(11) NOT NULL,
  `id_depot_op` int(11) DEFAULT NULL,
  `id_depot_src` int(11) DEFAULT NULL,
  `id_depot_dest` int(11) DEFAULT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `qte_op` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `detail_depot_op`
--

INSERT INTO `detail_depot_op` (`id_detail`, `id_depot_op`, `id_depot_src`, `id_depot_dest`, `id_produit`, `qte_op`, `id_user`) VALUES
(2, -1857, 1, 2, 77, 10, 35);

-- --------------------------------------------------------

--
-- Structure de la table `detail_entre`
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
  `valide_entre` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_produit`
--

CREATE TABLE `detail_produit` (
  `id` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_sortie`
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
  `valide_sortie` int(11) NOT NULL DEFAULT 0,
  `valide_entre` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_vente`
--

CREATE TABLE `detail_vente` (
  `id_detail` int(11) UNSIGNED NOT NULL,
  `id_vente` int(11) DEFAULT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `prix_produit` double DEFAULT NULL,
  `qte_vendu` double DEFAULT NULL,
  `qte_restante` int(11) DEFAULT 0,
  `id_user` int(11) DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `valunit` double DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `id_bon_vendeur` int(11) DEFAULT NULL,
  `valide_sortie` int(11) NOT NULL DEFAULT 0,
  `id_usine` int(11) NOT NULL DEFAULT -1,
  `remarque_usine` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `detail_vente`
--

INSERT INTO `detail_vente` (`id_detail`, `id_vente`, `id_produit`, `prix_produit`, `qte_vendu`, `qte_restante`, `id_user`, `remise`, `valunit`, `unit`, `id_depot`, `id_bon_vendeur`, `valide_sortie`, `id_usine`, `remarque_usine`) VALUES
(4, -151, 83, 100, 0, 0, 35, 10, 0, '', 1, NULL, 0, -1, NULL),
(3, -151, 83, 100, 0, 0, 35, 10, 0, '', 1, NULL, 0, -1, NULL),
(5, -151, 83, 100, 0, 0, 35, 10, 0, '', 1, NULL, 0, -1, NULL),
(19, -1717, 3, 110, 10, 0, 57, 0, 10, '', NULL, 4, 0, -1, NULL),
(22, 15, 1, 152.5, 50, 0, 57, 0, 50, '', NULL, 5, 0, -1, NULL),
(23, 16, 23, 122.5, 100, 0, 55, 0, 100, '', NULL, 6, 0, -1, NULL),
(10, 4, 86, 100, 20, 0, 49, 0, 20, '', NULL, 1, 0, -1, NULL),
(11, 4, 86, 0, 1, 0, 49, 0, 1, '', NULL, 1, 0, -1, NULL),
(12, 5, 1, 152.5, 10, 0, 57, 0, 10, '', NULL, 2, 0, -1, NULL),
(13, 5, 3, 110, 10, 0, 57, 0, 10, '', NULL, 2, 0, -1, NULL),
(14, 5, 8, 137.5, 10, 0, 57, 0, 10, '', NULL, 2, 0, -1, NULL),
(15, 6, 71, 120, 10, 0, 57, 0, 10, '', NULL, 3, 0, -1, NULL),
(16, 6, 12, 147.5, 10, 0, 57, 0, 10, '', NULL, 3, 0, -1, NULL),
(17, 6, 41, 280, 10, 0, 57, 0, 10, '', NULL, 3, 0, -1, NULL),
(21, 14, 1, 152.5, 10, 0, 57, 0, 10, '', NULL, 4, 0, -1, NULL),
(73, 40, 23, 120, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(74, 40, 55, 180, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(75, 40, 53, 130, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(76, 41, 26, 205, 10, 0, 61, 0, 10, '', NULL, 12, 0, -1, NULL),
(77, 42, 43, 205, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(78, 43, 26, 205, 3, 0, 61, 0, 3, '', NULL, 12, 0, -1, NULL),
(38, 25, 3, 110, 5, 0, 61, 0, 5, '', NULL, 7, 0, -1, NULL),
(39, 25, 3, 110, 5, 0, 61, 0, 5, '', NULL, 7, 0, -1, NULL),
(40, 25, 31, 160, 5, 0, 61, 0, 5, '', NULL, 7, 0, -1, NULL),
(41, 26, 1, 150, 5, 0, 61, 0, 5, '', NULL, 8, 0, -1, NULL),
(42, 26, 3, 107.5, 5, 0, 61, 0, 5, '', NULL, 8, 0, -1, NULL),
(43, 26, 2, 165, 5, 0, 61, 0, 5, '', NULL, 8, 0, -1, NULL),
(44, 27, 4, 150, 9, 0, 61, 0, 9, '', NULL, 9, 0, -1, NULL),
(45, 28, 1, 150, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(46, 28, 3, 107.5, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(47, 28, 2, 165, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(48, 28, 7, 102.5, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(49, 29, 1, 150, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(50, 29, 3, 107.5, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(51, 29, 2, 165, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(52, 29, 7, 102.5, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(53, 30, 1, 150, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(54, 30, 3, 107.5, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(55, 30, 2, 165, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(56, 30, 7, 102.5, 10, 0, 61, 0, 10, '', NULL, 10, 0, -1, NULL),
(57, 31, 1, 150, 20, 0, 61, 0, 20, '', NULL, 10, 0, -1, NULL),
(58, 31, 3, 107.5, 20, 0, 61, 0, 20, '', NULL, 10, 0, -1, NULL),
(59, 31, 2, 165, 20, 0, 61, 0, 20, '', NULL, 10, 0, -1, NULL),
(60, 31, 7, 102.5, 20, 0, 61, 0, 20, '', NULL, 10, 0, -1, NULL),
(61, 32, 13, 295, 5, 0, 61, 0, 5, '', NULL, 11, 0, -1, NULL),
(62, 32, 62, 1065, 1, 0, 61, 0, 1, '', NULL, 11, 0, -1, NULL),
(63, 33, 4, 150, 55, 0, 61, 0, 55, '', NULL, 11, 0, -1, NULL),
(64, 34, 1, 155, 5, 0, 61, 0, 5, '', NULL, 13, 0, -1, NULL),
(65, 35, 2, 170, 2, 0, 61, 0, 2, '', NULL, 13, 0, -1, NULL),
(66, 35, 2, 170, 2, 0, 61, 0, 2, '', NULL, 13, 0, -1, NULL),
(67, 36, 29, 155, 2, 0, 61, 0, 2, '', NULL, 12, 0, -1, NULL),
(68, 37, 7, 110, 5, 0, 61, 0, 5, '', NULL, 13, 0, -1, NULL),
(69, 38, 17, 360, 5, 0, 61, 0, 5, '', NULL, 12, 0, -1, NULL),
(70, 38, 9, 195, 2, 0, 61, 0, 2, '', NULL, 12, 0, -1, NULL),
(71, 38, 22, 355, 2, 0, 61, 0, 2, '', NULL, 12, 0, -1, NULL),
(72, 39, 4, 150, 3, 0, 61, 0, 3, '', NULL, 12, 0, -1, NULL),
(79, 44, 64, 1065, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(80, 44, 45, 775, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(81, 44, 46, 730, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(82, 45, 17, 350, 20, 0, 61, 0, 20, '', NULL, 12, 0, -1, NULL),
(83, 45, 17, 350, 20, 0, 61, 0, 20, '', NULL, 12, 0, -1, NULL),
(84, 45, 20, 180, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(86, 47, 1, 155, 5, 0, 61, 0, 5, '', NULL, 13, 0, -1, NULL),
(87, 47, 8, 138, 3, 0, 61, 0, 3, '', NULL, 13, 0, -1, NULL),
(88, 47, 19, 870, 2, 0, 61, 0, 2, '', NULL, 13, 0, -1, NULL),
(89, 48, 26, 205, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(90, 48, 22, 355, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(91, 48, 29, 155, 5, 0, 61, 0, 5, '', NULL, 12, 0, -1, NULL),
(92, 49, 45, 775, 2, 0, 61, 0, 2, '', NULL, 13, 0, -1, NULL),
(93, 49, 46, 730, 4, 0, 61, 0, 4, '', NULL, 13, 0, -1, NULL),
(94, 51, 46, 730, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(95, 51, 46, 730, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(96, 52, 20, 180, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(97, 53, 4, 150, 2, 0, 61, 0, 2, '', NULL, 12, 0, -1, NULL),
(98, 54, 20, 180, 1, 0, 61, 0, 1, '', NULL, 12, 0, -1, NULL),
(99, 55, 53, 130, 3, 0, 61, 0, 3, '', NULL, 12, 0, -1, NULL),
(100, 56, 12, 146, 20, 20, 69, 0, 20, '', 1, NULL, 0, -1, NULL),
(101, 57, 43, 205, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(102, 58, 66, 130, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(103, 58, 4, 150, 34, 0, 61, 0, 34, '', NULL, 13, 0, -1, NULL),
(104, 59, 29, 155, 2, 0, 61, 0, 2, '', NULL, 13, 0, -1, NULL),
(105, 59, 9, 195, 2, 0, 61, 0, 2, '', NULL, 13, 0, -1, NULL),
(106, 59, 22, 355, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(107, 60, 53, 130, 4, 0, 61, 0, 4, '', NULL, 13, 0, -1, NULL),
(108, -1440, 3, 107.5, 10, 10, 68, 0, 10, '', 1, NULL, 0, -1, NULL),
(111, 61, 19, 870, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(112, 61, 66, 130, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(113, 62, 53, 130, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(114, 62, 9, 195, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(115, 63, 4, 150, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(116, 63, 50, 120, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(117, 63, 23, 120, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(118, 64, 45, 775, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(119, 65, 26, 205, 6, 0, 61, 0, 6, '', NULL, 13, 0, -1, NULL),
(120, 65, 4, 150, 20, 0, 61, 0, 20, '', NULL, 13, 0, -1, NULL),
(121, 65, 19, 870, 3, 0, 61, 0, 3, '', NULL, 13, 0, -1, NULL),
(122, 65, 53, 130, 6, 0, 61, 0, 6, '', NULL, 13, 0, -1, NULL),
(123, 65, 29, 155, 6, 0, 61, 0, 6, '', NULL, 13, 0, -1, NULL),
(124, 65, 53, 130, 6, 0, 61, 0, 6, '', NULL, 13, 0, -1, NULL),
(125, 65, 8, 138, 6, 0, 61, 0, 6, '', NULL, 13, 0, -1, NULL),
(126, 65, 8, 138, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL),
(127, 65, 2, 170, 1, 0, 61, 0, 1, '', NULL, 13, 0, -1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `effet_transfert_caisse`
--

CREATE TABLE `effet_transfert_caisse` (
  `id` int(11) NOT NULL,
  `montant_effet` varchar(25) DEFAULT NULL,
  `num_effet` int(11) NOT NULL,
  `id_transfert_caisse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `export`
--

CREATE TABLE `export` (
  `lien` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id_facture` int(11) NOT NULL,
  `id_vente` varchar(100) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tva` int(11) DEFAULT NULL,
  `taux` int(11) DEFAULT NULL,
  `num_fact` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `id_vente`, `date_facture`, `remarque`, `id_user`, `tva`, `taux`, `num_fact`) VALUES
(1, ',2,', '2023-11-22', '', 35, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `facture_avoir`
--

CREATE TABLE `facture_avoir` (
  `id_facture` int(11) NOT NULL,
  `id_avoir` varchar(100) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tva` int(11) DEFAULT NULL,
  `taux` int(11) DEFAULT NULL,
  `num_fact` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) NOT NULL,
  `code_fournisseur` text DEFAULT NULL,
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
  `remarque` text DEFAULT NULL,
  `responsable` varchar(40) DEFAULT NULL,
  `tph_respo` varchar(20) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `date_archive` date DEFAULT NULL,
  `id_archiveur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fournisseur`, `code_fournisseur`, `raison_sociale`, `ice`, `rc`, `iff`, `patente`, `telephone`, `email`, `adresse`, `image`, `date_creation`, `remarque`, `responsable`, `tph_respo`, `id_user`, `archive`, `date_archive`, `id_archiveur`) VALUES
(1, NULL, 'DESKAMEL', '', '', '', '', '', '', 'ESPANE', '', '2023-11-16', '', '', '', 35, 0, '2023-11-16', 0),
(2, NULL, 'EURO CHILALI', '', '', '', '', '', '', 'ESPANE', '', '2023-11-16', '', '', '', 35, 0, '2023-11-16', 0),
(3, NULL, 'GALLETAS CORAL', '', '', '', '', '', '', 'ESPANE', '', '2023-11-16', '', '', '', 35, 0, '2023-11-16', 0),
(4, NULL, 'MAROC', '', '', '', '', '', '', 'ESPANE', '', '2023-11-16', '', '', '', 35, 0, '2023-11-16', 0),
(5, NULL, 'MAHMOUD', '', '', '', '', '', '', 'CASA', '', '2023-11-16', '', '', '', 35, 0, '2023-11-16', 0),
(6, NULL, 'MARSA MAROC', '000028283000040', '156717', '1104763', '35790737', '0536608518', 'nador@marsamaroc.co.ma', 'BNI NSAR NADOR', '', '2023-11-22', '', 'MAROUAN TRANZIT', '0661262240', 35, 0, '2023-11-22', 0),
(7, NULL, 'TICKET DOUANES ', '', '', '', '', '', '', 'BNI NSAR', '', '2023-11-22', '', 'ARTICLE 1', '', 35, 0, '2023-11-22', 0),
(8, NULL, 'TICKET DOUANES ', '', '', '', '', '', '', 'BNI NSAR', '', '2023-11-22', '', 'ARTICLE 2', '', 35, 0, '2023-11-22', 0),
(9, NULL, 'TICKET DOUANES ', '', '', '', '', '', '', 'BNI NSAR', '', '2023-11-22', '', 'ARTICLE 3', '', 35, 0, '2023-11-22', 0),
(10, NULL, 'FACTUR ONSSA', '', '', '', '', '', '', 'NADOR', '', '2023-11-22', '', '', '', 35, 0, '2023-11-22', 0),
(11, NULL, 'CONOCIMIENTO DE EMPARQUE', '', '', '', '', '', '', 'PORT BNI NSAR', '', '2023-11-22', '', '', '', 35, 0, '2023-11-22', 0),
(12, NULL, 'FAOUZI TRANSIT SARL', '001741510000077', '13503', '15178261', '56301112', '0661611816', '', 'BÃ‰NI NSAR', '', '2023-11-22', '', 'MAROUAN TRANZIT', '0661262240', 35, 0, '2023-11-22', 0),
(13, NULL, 'LES CHARGER', '', '', '', '', '', '', '', '', '2023-11-22', '', '', '', 35, 0, '2023-11-22', 0),
(14, NULL, 'ABDELKADER', '', '', '', '', '', '', '', '', '2023-11-22', '', '', '', 35, 0, '2023-11-22', 0),
(15, NULL, 'TRANSPORTÃ‰ ', '', '', '', '', '', '', '', '', '2023-11-22', '', '', '', 35, 0, '2023-11-22', 0),
(16, NULL, 'RECARDO', '', '', '', '', '', '', '', '', '2023-11-22', '', '', '', 35, 0, '2023-11-22', 0);

-- --------------------------------------------------------

--
-- Structure de la table `historiques_modifs_vente`
--

CREATE TABLE `historiques_modifs_vente` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_modification` varchar(25) NOT NULL,
  `id_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `historique_modifs_achat`
--

CREATE TABLE `historique_modifs_achat` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_modification` varchar(25) NOT NULL,
  `id_achat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `historique_modifs_achat`
--

INSERT INTO `historique_modifs_achat` (`id`, `id_user`, `date_modification`, `id_achat`) VALUES
(1, 56, '2023-11-30', 11);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` bigint(20) NOT NULL,
  `code_bar` varchar(255) DEFAULT NULL,
  `tva` decimal(4,2) DEFAULT 0.20,
  `designation` varchar(255) DEFAULT NULL,
  `designation_ar` varchar(255) DEFAULT NULL,
  `poid` decimal(10,2) DEFAULT NULL,
  `qte_actuel` decimal(10,2) DEFAULT NULL,
  `minqte` decimal(10,2) DEFAULT 10.00,
  `prix_achat` decimal(10,2) DEFAULT NULL,
  `prix_achat_i` double NOT NULL DEFAULT 0,
  `prix_vente` decimal(10,2) DEFAULT NULL,
  `prix_vente2` double NOT NULL DEFAULT 0,
  `prix_vente3` double NOT NULL DEFAULT 0,
  `remise_max` float DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `emplacement` varchar(25) DEFAULT 'Depot 1',
  `date_insertion` timestamp NULL DEFAULT current_timestamp(),
  `id_categorie` int(11) DEFAULT NULL,
  `remarque` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT 0,
  `date_archive` date DEFAULT NULL,
  `id_archiveur` int(11) DEFAULT NULL,
  `unite` varchar(20) DEFAULT 'U',
  `unite2` double DEFAULT 1,
  `fournisseur` text DEFAULT NULL,
  `type_produit` int(11) NOT NULL DEFAULT 1,
  `bloque` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `code_bar`, `tva`, `designation`, `designation_ar`, `poid`, `qte_actuel`, `minqte`, `prix_achat`, `prix_achat_i`, `prix_vente`, `prix_vente2`, `prix_vente3`, `remise_max`, `image`, `emplacement`, `date_insertion`, `id_categorie`, `remarque`, `id_user`, `archive`, `date_archive`, `id_archiveur`, `unite`, `unite2`, `fournisseur`, `type_produit`, `bloque`) VALUES
(1, 'C0001', 0.00, 'NECTAR ROSTOY BIQUE 1LX12', '', 0.00, 1657.00, 1872.00, 0.00, 0, 150.00, 152.5, 155, 5, 'tÃ©lÃ©chargement (27).jpg', '1', '2023-11-15 23:00:00', 111, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(2, 'C0002', 0.00, 'NECTAR ROSTOY CANNETTE 24X330ML', '', 0.00, -100.00, 0.00, 0.00, 0, 165.00, 162.5, 170, 0, 'tÃ©lÃ©chargement (30).jpg', '1', '2023-11-15 23:00:00', 111, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(3, 'C0003', 0.00, 'NECTAR ROSTOY BOUTEILLE 1LX6', '', 0.00, -155.00, 1000.00, 0.00, 0, 107.50, 110, 112.5, 0, 'tÃ©lÃ©chargement (28).jpg', '1', '2023-11-15 23:00:00', 111, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(4, 'C0004', 0.00, 'CORAL  BOER SABOR COCO 450GRX10UN', '', 4.50, 4628.00, 2000.00, 0.00, 0, 146.00, 147.5, 150, 0, 'tÃ©lÃ©chargement (26).jpg', '1', '2023-11-15 23:00:00', 121, '', 56, 0, '2023-11-16', 0, '10', 1, '3', 1, 0),
(5, 'C0005', 0.00, 'CORAL  BOER SABOR LIMON 330GRX10UN', '', 0.00, 1000.00, 0.00, 0.00, 0, 146.00, 147.5, 150, 0, 'FOTO.jpg', '1', '2023-11-15 23:00:00', 121, '', 56, 0, '2023-11-16', 0, 'U', 1, '3', 1, 0),
(6, 'C0006', 0.00, 'CORAL BOER SABOR CHOCO-NATA 400GRX10UN', '', 0.00, 0.00, 0.00, 0.00, 0, 146.00, 147.5, 150, 0, 'FOTO.jpg', '1', '2023-11-15 23:00:00', 121, '', 56, 0, '2023-11-16', 0, 'U', 1, '3', 1, 0),
(7, 'C0007', 0.00, 'NECTAR ROSTOY MINI BRIQUE 3X10X200ML', '', 0.00, -55.00, 0.00, 0.00, 0, 102.50, 105, 107.5, 0, 'images.png', '1', '2023-11-15 23:00:00', 111, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(8, 'C0008', 0.00, 'NECTAR ROSTOY BOUTEILLE 24X200ML', '', 0.00, -20.00, 0.00, 0.00, 0, 135.00, 137.5, 138, 0, 'tÃ©lÃ©chargement (29).jpg', '1', '2023-11-15 23:00:00', 111, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(9, 'C0009', 0.00, 'HULALA CREMA VEGETAL 24X200GR', '', 0.00, -5.00, 0.00, 0.00, 0, 190.00, 192.5, 195, 0, 'tÃ©lÃ©chargement (12).jpg', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(10, 'C0012', 0.00, 'CORAL BOER SABOR NATA 330GRX10UN', '', 0.00, 0.00, 0.00, 0.00, 0, 146.00, 147.5, 150, 0, 'Boer-Nata-330.png', '1', '2023-11-15 23:00:00', 121, '', 56, 0, '2023-11-16', 0, 'U', 1, '3', 1, 0),
(11, 'C0011', 0.00, 'ENERGY DRINK REDBULL 250MLX24UN', '', 0.00, 300.00, 0.00, 0.00, 0, 300.00, 305, 315, 0, 'tÃ©lÃ©chargement (5).jpg', '1', '2023-11-15 23:00:00', 120, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(12, 'C0010', 0.00, 'CORAL  BOER SABOR CHOCOLATE 330GRX10UN', '', 0.00, -40.00, 0.00, 0.00, 0, 146.00, 147.5, 150, 0, 'Boer-Choco-330.png', '1', '2023-11-15 23:00:00', 121, '', 56, 0, '2023-11-16', 0, 'U', 1, '3', 1, 0),
(13, 'C0013', 0.00, 'ANANAS CONSERVE 850GRX12 UN', '', 0.00, -10.00, 0.00, 0.00, 0, 265.00, 285, 295, 0, 'images (2).jpg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(14, 'C0014', 0.00, 'CST H', '', 0.00, 0.00, 0.00, 0.00, 0, 535.00, 540, 545, 0, 'tÃ©lÃ©chargement (6).jpg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(15, 'C0015', 0.00, 'PETIT DEFOOD 400GRX20 UN', '', 0.00, 1975.00, 0.00, 0.00, 0, 240.00, 245, 250, 0, 'tÃ©lÃ©chargement (8).jpg', '1', '2023-11-15 23:00:00', 113, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(16, 'C0016', 0.00, 'THON PESCAMAR EN TOMATE 80GRX100 UN', '', 0.00, 0.00, 0.00, 0.00, 0, 765.00, 770, 775, 0, 'tÃ©lÃ©chargement (37).jpg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(17, 'C0017', 0.00, 'HULALA CREMA CLASSIC  1LX12 UN', '', 0.00, 64.00, 0.00, 0.00, 0, 345.00, 350, 360, 0, 'tÃ©lÃ©chargement (13).jpg', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(18, 'C0018', 0.00, 'CST T', '', 0.00, -50.00, 0.00, 0.00, 0, 535.00, 540, 545, 0, 'tÃ©lÃ©chargement (6).jpg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(19, 'C0019', 0.00, 'THON PESCAMAR ACEITE 80GRX100 UN', '', 0.00, 1914.00, 0.00, 0.00, 0, 865.00, 870, 875, 0, 'f53602f0-0fe8-4ef6-b225-f909369566ea.jpeg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(20, 'C0020', 0.00, 'MANTICA FUENTES 5KG', '', 0.00, -15.00, 0.00, 0.00, 0, 170.00, 175, 180, 0, 'tÃ©lÃ©chargement (14).jpg', '1', '2023-11-15 23:00:00', 113, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(21, 'C0021', 0.00, 'RIZ GAMBA 1KG X 10 UN', '', 0.00, -15.00, 0.00, 0.00, 0, 160.00, 165, 170, 0, 'tÃ©lÃ©chargement (25).jpg', '1', '2023-11-15 23:00:00', 118, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(22, 'C0022', 0.00, 'HULALA CREMA VEGETAL 500GR X 20UN', '', 0.00, -4.00, 0.00, 0.00, 0, 345.00, 350, 355, 0, 'tÃ©lÃ©chargement (11).jpg', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(23, 'C0023', 0.00, 'NECTAR READY UVA ROJA 1LX12UN', '', 0.00, -200.00, 0.00, 0.00, 0, 120.00, 122.5, 125, 0, 'tÃ©lÃ©chargement (23).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(24, 'C0024', 0.00, 'NECTAR RAEDY NARANJA 1LX12UN', '', 0.00, -100.00, 0.00, 0.00, 0, 120.00, 122.5, 125, 0, 'tÃ©lÃ©chargement.jfif', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(25, 'C0025', 0.00, 'PATE A TARTINER NUGALA NOIR 700GX8UN', '', 0.00, 0.00, 0.00, 0.00, 0, 182.50, 185, 187.5, 0, 'images (7).jpg', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(26, 'C0026', 0.00, 'DORADA DEFOOD 800G X 10UN', '', 0.00, -20.00, 0.00, 0.00, 0, 202.50, 205, 207.5, 0, 'tÃ©lÃ©chargement (7).jpg', '1', '2023-11-15 23:00:00', 113, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(27, 'C0027', 0.00, 'NECTAR ROSTOY CANNETTE PINA-COCO 330ML X 24UN', '', 0.00, -10.00, 0.00, 0.00, 0, 155.00, 160, 165, 0, 'tÃ©lÃ©chargement (31).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(28, 'C0028', 0.00, 'FLOR ANDALOSI 1.5KGX6UN', '', 0.00, 0.00, 0.00, 0.00, 0, 315.00, 320, 325, 0, '', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(29, 'C0029', 0.00, 'BANGOR TOMATE FRITO 350G X 24UN', '', 0.00, -15.00, 0.00, 0.00, 0, 155.00, 160, 165, 0, 'tÃ©lÃ©chargement (1).jpg', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(30, 'C0030', 0.00, 'THON ONS PACK 3 TOMATE 3X32UN', '', 0.00, -10.00, 0.00, 0.00, 0, 500.00, 505, 510, 0, 'tÃ©lÃ©chargement (39).jpg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(31, 'C0031', 0.00, 'NECTAR ROSTOY CANNETTE MANGO 330MKL X 24UN', '', 0.00, -20.00, 0.00, 0.00, 0, 155.00, 160, 165, 0, 'images (4).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(32, 'C0032', 0.00, 'THON ONS PACK 3 HUIL 3 X 32UN', '', 0.00, -6.00, 0.00, 0.00, 0, 510.00, 515, 520, 0, '', '1', '2023-11-15 23:00:00', 117, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(33, 'C0033', 0.00, 'NECTAR READY PINA 1L X 12UN', '', 0.00, -10.00, 0.00, 0.00, 0, 120.00, 122.5, 125, 0, 'tÃ©lÃ©chargement (21).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(34, 'C0034', 0.00, 'VERRE A BOIRE  16 CL   9 X 12 ', '', 0.00, 0.00, 0.00, 0.00, 0, 230.00, 235, 240, 0, 'tÃ©lÃ©chargement (41).jpg', '1', '2023-11-15 23:00:00', 118, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(35, 'C0035', 0.00, 'THON ONS EN TOMATE', '', 0.00, 0.00, 0.00, 0.00, 0, 545.00, 550, 555, 0, '', '1', '2023-11-15 23:00:00', 117, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(36, 'C0036', 0.00, 'PATE A TARTINER NUGALA NOIR 350G X12UN', '', 0.00, 0.00, 0.00, 0.00, 0, 170.00, 172.5, 175, 0, '', '1', '2023-11-15 23:00:00', 115, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(37, 'C0037', 0.00, 'PATE A TARTINER NUGALA DUO 350G X12UN', '', 0.00, 0.00, 0.00, 0.00, 0, 160.00, 162.5, 165, 0, '', '1', '2023-11-15 23:00:00', 115, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(38, 'C0038', 0.00, 'MAIS DULCE DIDILO 340G X 12UN', '', 0.00, 0.00, 0.00, 0.00, 0, 110.00, 120, 190, 0, 'tÃ©lÃ©chargement (15).jpg', '1', '2023-11-15 23:00:00', 114, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(39, 'C0039', 0.00, 'PATE A TARTINER NUGALA DUO 700G X 8UN', '', 0.00, 0.00, 0.00, 0.00, 0, 175.00, 177.5, 180, 0, '', '1', '2023-11-15 23:00:00', 115, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(40, 'C0040', 0.00, 'NECTAR READY MULTIFRUTAS 1L X 12UN', '', 0.00, -10.00, 0.00, 0.00, 0, 120.00, 122.5, 125, 0, 'tÃ©lÃ©chargement (22).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(41, 'C0041', 0.00, 'SACS POUBELLE 20UN', '', 0.00, -20.00, 0.00, 0.00, 0, 275.00, 280, 285, 0, '', '1', '2023-11-15 23:00:00', 104, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(42, 'C0042', 0.00, 'VERRE A BOIRE 30 CL 9X12', '', 0.00, 0.00, 0.00, 0.00, 0, 325.00, 330, 335, 0, 'tÃ©lÃ©chargement (41).jpg', '1', '2023-11-15 23:00:00', 118, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(43, 'C0043', 0.00, 'CORAL CHIQUITILLOS 500G X12UN', '', 0.00, -5.00, 0.00, 0.00, 0, 200.00, 197.5, 205, 0, 'tÃ©lÃ©chargement (9).jpg', '1', '2023-11-15 23:00:00', 113, '', 56, 0, '2023-11-16', 0, 'U', 1, '3', 1, 0),
(44, 'C0044', 0.00, 'HULALA GRAN CUCINA 200G X 24UN', '', 0.00, 0.00, 0.00, 0.00, 0, 185.00, 187.5, 190, 0, 'tÃ©lÃ©chargement (16).jpg', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(45, 'C0045', 0.00, 'THON PESCAMAR EN HUILE PACK 3 X32', '', 0.00, -20.00, 0.00, 0.00, 0, 770.00, 775, 780, 0, 'ee036b5c-3d8c-418c-9c72-f7149c280399.jpeg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(46, 'C0046', 0.00, 'THON PESCAMAR EN TOMATE PACK 3X32', '', 0.00, -20.00, 0.00, 0.00, 0, 720.00, 725, 730, 0, 'ee036b5c-3d8c-418c-9c72-f7149c280399.jpeg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(47, 'C0047', 0.00, 'THON ONS EN HUILE 100UN', '', 0.00, 44.00, 0.00, 0.00, 0, 545.00, 547.5, 550, 0, '', '1', '2023-11-15 23:00:00', 117, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(48, 'C0048', 0.00, 'HULALA GRAN CUCINA 500G X20UN', '', 0.00, 0.00, 0.00, 0.00, 0, 345.00, 350, 355, 0, 'tÃ©lÃ©chargement (17).jpg', '1', '2023-11-15 23:00:00', 115, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(49, 'C0049', 0.00, 'PINA COLADA CAPRIANA 330ML X20UN', '', 0.00, 0.00, 0.00, 0.00, 0, 125.00, 140, 145, 0, 'tÃ©lÃ©chargement (33).jpg', '1', '2023-11-15 23:00:00', 112, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(50, 'C0050', 0.00, 'NECTAR READY MELOCOTON 1L X12UN ', '', 0.00, -10.00, 0.00, 0.00, 0, 120.00, 122.5, 125, 0, 'tÃ©lÃ©chargement (21).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(51, 'C0051', 0.00, 'TOMATE FRITO ANMAR 2.550G X6UN', '', 0.00, 0.00, 0.00, 0.00, 0, 275.00, 280, 285, 0, '', '1', '2023-11-15 23:00:00', 115, '', 35, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(52, 'C0052', 0.00, 'MANZANILLA NATURAL POLSITAS', '', 0.00, -2.00, 0.00, 0.00, 0, 1100.00, 1120, 1150, 0, '', '1', '2023-11-15 23:00:00', 102, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(53, 'C0053', 0.00, 'GARBANZO LA PEDRIZA 560G X12UN', '', 0.00, -15.00, 0.00, 0.00, 0, 120.00, 125, 130, 0, 'tÃ©lÃ©chargement (18).jpg', '1', '2023-11-15 23:00:00', 114, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(54, 'C0054', 0.00, 'VERRE A BOIRE 20CL', '', 0.00, 0.00, 0.00, 0.00, 0, 290.00, 295, 300, 0, 'tÃ©lÃ©chargement (41).jpg', '1', '2023-11-15 23:00:00', 118, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(55, 'C0055', 0.00, 'MANTICADO POLVORON 4KG', '', 0.00, -15.00, 0.00, 0.00, 0, 175.00, 180, 185, 0, 'tÃ©lÃ©chargement (19).jpg', '1', '2023-11-15 23:00:00', 113, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(56, 'C0056', 0.00, 'REMOLACHA ROJA RALLADA DIDILO 2.5KG X3UN', '', 0.00, 0.00, 0.00, 0.00, 0, 120.00, 125, 130, 0, 'tÃ©lÃ©chargement (34).jpg', '1', '2023-11-15 23:00:00', 114, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(57, 'C0057', 0.00, 'ZANAHORIA RALLADA DIDILO CAROTE 2.5KG X3UN', '', 0.00, 0.00, 0.00, 0.00, 0, 105.00, 110, 115, 0, 'tÃ©lÃ©chargement (35).jpg', '1', '2023-11-15 23:00:00', 114, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(58, 'C0058', 0.00, 'PISTACHO TOSTADO 1KG X10UN', '', 0.00, 0.00, 0.00, 0.00, 0, 1200.00, 1205, 1210, 0, '', '1', '2023-11-15 23:00:00', 116, '', 35, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(59, 'C0059', 0.00, 'OASIS TROPIC 1.5L X6UN', '', 0.00, 0.00, 0.00, 0.00, 0, 80.00, 85, 90, 0, '', '1', '2023-11-15 23:00:00', 111, '', 35, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(60, 'C0060', 0.00, 'VERMICELLI BEANSTHRED 100G X250 UN', '', 0.00, 0.00, 0.00, 0.00, 0, 750.00, 750, 750, 0, 'tÃ©lÃ©chargement (40).jpg', '1', '2023-11-15 23:00:00', 107, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(61, 'C0061', 0.00, 'VERMICELLI BEANSTHREAD 250G X100 UN', '', 0.00, 0.00, 0.00, 0.00, 0, 750.00, 750, 750, 0, 'tÃ©lÃ©chargement (40).jpg', '1', '2023-11-15 23:00:00', 107, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(62, 'C0062', 0.00, 'COLORANTE ALIMENTARIO', '', 0.00, -3.00, 0.00, 0.00, 0, 1050.00, 1060, 1065, 0, 'tÃ©lÃ©chargement (2).jpg', '1', '2023-11-15 23:00:00', 116, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(63, 'C0063', 0.00, 'NECTAR DE FRUTAS COFRUTOS 200ML X24UN', '', 0.00, -2.00, 0.00, 0.00, 0, 90.00, 95, 100, 0, 'tÃ©lÃ©chargement (24).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(64, 'C0064', 0.00, 'THON PESCAMAR ACEITE 550G X 24UN', '', 0.00, -3.00, 0.00, 0.00, 0, 1057.00, 1062.5, 1170, 0, 'images (8).jpg', '1', '2023-11-15 23:00:00', 117, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(65, 'C0066', 0.00, 'CHAMPINONES LAMINADOR DIDILO 2.650KG X6UN', '', 0.00, 0.00, 0.00, 0.00, 0, 400.00, 405, 410, 0, 'tÃ©lÃ©chargement (3).jpg', '1', '2023-11-15 23:00:00', 114, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(66, 'C0065', 0.00, 'CORAL MIRANDINAS 225G X 12UN', '', 0.00, -20.00, 0.00, 0.00, 0, 150.00, 155, 155, 0, 'tÃ©lÃ©chargement (10).jpg', '1', '2023-11-15 23:00:00', 121, '', 56, 0, '2023-11-16', 0, 'U', 1, '3', 1, 0),
(67, 'C0067', 0.00, 'NECTAR ROSTOY FRUTAS BRIQUE TROPICAL 330ML X24UN', '', 0.00, 0.00, 0.00, 0.00, 0, 155.00, 160, 165, 0, 'images (3).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(68, 'C0068', 0.00, 'PETIT DORE 420G X12UN', '', 0.00, 0.00, 0.00, 0.00, 0, 195.00, 200, 205, 0, 'tÃ©lÃ©chargement (36).jpg', '1', '2023-11-15 23:00:00', 113, '', 56, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(69, 'C0069', 0.00, 'NECTAR ROSTOY  FRUTAS BRIQUE MEDITERRANE 330ML X 24UN', '', 0.00, 0.00, 0.00, 0.00, 0, 155.00, 160, 165, 0, 'images (3).jpg', '1', '2023-11-15 23:00:00', 106, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(70, 'C0070', 0.00, 'THON PESCAMAR ACEITE 900G X 12UN', '', 0.00, -3.00, 0.00, 0.00, 0, 850.00, 855, 860, 0, '', '1', '2023-11-15 23:00:00', 117, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(71, 'C0071', 0.00, 'MAYA PALO PLASTIFICADO ROJO 140CM X 12UN', '', 0.00, 165.00, 0.00, 0.00, 0, 120.00, 120, 120, 0, '', '1', '2023-11-15 23:00:00', 103, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(72, 'C0072', 0.00, 'SERVILLETAS MINI SERVIS  SAVISOL 140X60', '', 0.00, 0.00, 0.00, 0.00, 0, 245.00, 250, 255, 0, '', '1', '2023-11-15 23:00:00', 103, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(73, 'C0073', 0.00, 'MAIZ DOULCE ANMAR 2.5KG X6UN', '', 0.00, -5.00, 0.00, 0.00, 0, 355.00, 360, 365, 0, 'tÃ©lÃ©chargement (20).jpg', '1', '2023-11-15 23:00:00', 114, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(74, 'C0074', 0.00, 'FLOR DE LA ALPUJARRA 5KG', '', 0.00, 0.00, 0.00, 0.00, 0, 460.00, 465, 480, 0, '', '1', '2023-11-15 23:00:00', 114, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(75, 'C0075', 0.00, 'TOMATE TRITURADO ANMAR 4KG X 3UN', '', 0.00, 0.00, 0.00, 0.00, 0, 190.00, 195, 200, 0, '', '1', '2023-11-15 23:00:00', 114, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(76, 'C0076', 0.00, 'MAYONESA LIGHT LA GAMBA 3.6KG X 4UN', '', 0.00, 200.00, 0.00, 0.00, 0, 100.00, 190, 200, 0, '', '1', '2023-11-15 23:00:00', 107, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(77, 'C0077', 0.00, 'FLOR DE LA ALPUJARRA 1.5KG X 6UN', '', 0.00, 200.00, 0.00, 0.00, 0, 325.00, 330, 335, 0, '', '1', '2023-11-15 23:00:00', 107, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(78, 'C0078', 0.00, 'CORAL BIZCOCHO KING', '', 0.00, 0.00, 0.00, 0.00, 0, 110.00, 115, 120, 0, 'images.jpg', '1', '2023-11-15 23:00:00', 113, '', 56, 0, '2023-11-16', 0, 'U', 1, '3', 1, 0),
(79, 'C0079', 0.00, 'CHAMPINONES MARI MARI 355G X 12UN', '', 0.00, 0.00, 0.00, 0.00, 0, 110.00, 115, 120, 0, 'images (1).jpg', '1', '2023-11-15 23:00:00', 114, '', 56, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(80, 'C0080', 0.00, 'SIROPE CHOCOKIN LA FLOR DE MALAGA 1KG X 6', '', 0.00, 0.00, 0.00, 0.00, 0, 450.00, 450, 450, 0, '', '1', '2023-11-15 23:00:00', 115, '', 35, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(81, 'C0081', 0.00, 'SIROPE CHOCOGOFRE LA FLOR DE MALAGA 1KG X 6UN', '', 0.00, 0.00, 0.00, 0.00, 0, 450.00, 450, 450, 0, '', '1', '2023-11-15 23:00:00', 115, '', 35, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(82, 'C0082', 0.00, 'TOMATE FRITO CELORRIO 2.5KG X 6', '', 0.00, 0.00, 0.00, 0.00, 0, 245.00, 245, 245, 0, '', '1', '2023-11-15 23:00:00', 114, '', 35, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(83, 'C0084', 0.00, 'MAYONESA ALTEZA 450ML X 12UN', '', 0.00, 0.00, 0.00, 0.00, 0, 100.00, 100, 120, 0, '', '1', '2023-11-15 23:00:00', 107, '', 35, 0, '2023-11-16', 0, 'U', 1, '4', 1, 0),
(84, 'C0083', 0.00, 'THE NEGRO 100 4X25', '', 0.00, 0.00, 0.00, 0.00, 0, 350.00, 355, 360, 0, '', '1', '2023-11-15 23:00:00', 102, '', 35, 0, '2023-11-16', 0, 'U', 1, '1', 1, 0),
(85, 'C0085', 0.00, 'NICKY PAPIER CUISINE 12UN', '', 0.00, 0.00, 0.00, 0.00, 0, 265.00, 270, 275, 0, 'tÃ©lÃ©chargement (32).jpg', '1', '2023-11-15 23:00:00', 103, '', 56, 0, '2023-11-16', 0, 'U', 1, '2', 1, 0),
(86, '8000070055254', 0.00, 'Test arcticle Masterlab', '', 0.00, 25691.75, 0.00, 80.00, 0, 100.00, 0, 0, 0, '', '1', '2023-11-16 23:00:00', 120, '', 35, 0, '2023-11-17', 0, 'U', 1, '1', 1, 0),
(87, 'C0078', 0.00, 'test b', '', 0.00, 211.00, 0.00, 8.00, 0, 10.00, 20, 0, 0, '', '1', '2023-11-26 23:00:00', 113, '', 56, 0, '2023-11-27', 0, 'U', 1, '5', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit_depot`
--

CREATE TABLE `produit_depot` (
  `id` bigint(20) NOT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `id_depot` int(11) DEFAULT NULL,
  `qte` double NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `produit_depot`
--

INSERT INTO `produit_depot` (`id`, `id_produit`, `id_depot`, `qte`) VALUES
(1, 1, 1, -215),
(2, 2, 1, -100),
(3, 3, 1, -155),
(4, 4, 1, 4628),
(5, 5, 1, 1000),
(6, 6, 1, 0),
(7, 7, 1, -55),
(8, 8, 1, -20),
(9, 9, 1, -5),
(10, 10, 1, 0),
(11, 11, 1, 300),
(12, 12, 1, -40),
(13, 13, 1, -10),
(14, 14, 1, 0),
(15, 15, 1, -5),
(16, 16, 1, 0),
(17, 17, 1, -36),
(18, 18, 1, 0),
(19, 19, 1, -6),
(20, 20, 1, -15),
(21, 21, 1, -15),
(22, 22, 1, -4),
(23, 23, 1, -200),
(24, 24, 1, -100),
(25, 25, 1, 0),
(26, 26, 1, -20),
(27, 27, 1, -10),
(28, 28, 1, 0),
(29, 29, 1, -15),
(30, 30, 1, -10),
(31, 31, 1, -20),
(32, 32, 1, -6),
(33, 33, 1, -10),
(34, 34, 1, 0),
(35, 35, 1, 0),
(36, 36, 1, 0),
(37, 37, 1, 0),
(38, 38, 1, 0),
(39, 39, 1, 0),
(40, 40, 1, -10),
(41, 41, 1, -20),
(42, 42, 1, 0),
(43, 43, 1, -5),
(44, 44, 1, 0),
(45, 45, 1, -20),
(46, 46, 1, -20),
(47, 47, 1, -6),
(48, 48, 1, 0),
(49, 49, 1, 0),
(50, 50, 1, -10),
(51, 51, 1, 0),
(52, 52, 1, -2),
(53, 53, 1, -15),
(54, 54, 1, 0),
(55, 55, 1, -15),
(56, 56, 1, 0),
(57, 57, 1, 0),
(58, 58, 1, 0),
(59, 59, 1, 0),
(60, 60, 1, 0),
(61, 61, 1, 0),
(62, 62, 1, -3),
(63, 63, 1, -90),
(64, 64, 1, -3),
(65, 65, 1, 0),
(66, 66, 1, -20),
(67, 67, 1, 0),
(68, 68, 1, 0),
(69, 69, 1, 0),
(70, 70, 1, -3),
(71, 71, 1, -20),
(72, 72, 1, 0),
(73, 73, 1, -5),
(74, 74, 1, 0),
(75, 75, 1, 0),
(76, 76, 1, 0),
(77, 77, 1, 0),
(78, 78, 1, -190),
(79, 79, 1, 0),
(80, 80, 1, 0),
(81, 81, 1, 0),
(82, 82, 1, 0),
(83, 83, 1, -190),
(84, 84, 1, 0),
(85, 85, 1, 0),
(86, 86, 1, 2279),
(87, 78, 4, 0),
(88, 87, 1, 100);

-- --------------------------------------------------------

--
-- Structure de la table `reg_achat`
--

CREATE TABLE `reg_achat` (
  `id_reg` int(11) NOT NULL,
  `id_achat` int(11) DEFAULT NULL,
  `mode_reg` varchar(25) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='reg_achat';

-- --------------------------------------------------------

--
-- Structure de la table `reg_avoir`
--

CREATE TABLE `reg_avoir` (
  `id_reg` int(11) NOT NULL,
  `id_avoir` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `mode_reg` varchar(25) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reg_client`
--

CREATE TABLE `reg_client` (
  `id_reg` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `mode_reg` varchar(50) DEFAULT NULL,
  `num_cheque` varchar(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `id_agence` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reg_commande`
--

CREATE TABLE `reg_commande` (
  `id_reg` int(11) NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(65,2) DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `mode_reg` varchar(25) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reg_fournisseur`
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
  `id_agence` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reg_vendeur`
--

CREATE TABLE `reg_vendeur` (
  `id_reg` int(11) NOT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `mode_reg` text DEFAULT NULL,
  `num_cheque` text DEFAULT NULL,
  `date_reg` text DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `etat` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `date_validation` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `reg_vendeur`
--

INSERT INTO `reg_vendeur` (`id_reg`, `id_bon`, `mode_reg`, `num_cheque`, `date_reg`, `montant`, `remarque`, `etat`, `id_user`, `id_compte`, `date_validation`) VALUES
(1, 1, 'Espece', '0', '2023-11-22', 2000, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-22]', '0', 35, 1, '1900-01-01'),
(2, 2, 'Espece', '0', '2023-11-22', 14500, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-22]', '0', 56, 1, '1900-01-01'),
(3, 5, 'Espece', '0', '2023-11-23', 5000, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(4, 5, 'Cheque', 'T55', '2023-11-23', 2625, 'Reglement global [ Montant : /Mode de Reglement : Cheque/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(5, 6, 'Espece', '0', '2023-11-23', 10000, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(7, 6, 'Cheque', '555555', '2023-11-23', 2250, 'Reglement global [ Montant : /Mode de Reglement : Cheque/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(8, 8, 'Espece', '0', '2023-11-23', 2112.5, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(9, 9, 'Espece', '0', '2023-11-23', 1000, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(10, 9, 'Espece', '0', '2023-11-23', 350, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(11, 10, 'Espece', '0', '2023-11-23', 26250, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-23]', '0', 56, 1, '1900-01-01'),
(12, 11, 'Espece', '0', '2023-11-24', 10000, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-24]', '0', 56, 1, '1900-01-01'),
(13, 11, 'Espece', '0', '2023-11-24', 790, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-24]', '0', 56, 1, '1900-01-01'),
(15, 13, 'Espece', '0', '2023-11-25', 775, 'Reglement global [ Montant : /Mode de Reglement : Espece/Date : 2023-11-25]', '0', 56, 1, '1900-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `reg_vente`
--

CREATE TABLE `reg_vente` (
  `id_reg` int(11) NOT NULL,
  `id_vente` int(11) DEFAULT NULL,
  `date_reg` date DEFAULT NULL,
  `montant` decimal(65,2) DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `mode_reg` varchar(25) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_cheque` varchar(30) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `id_reg_client` int(11) DEFAULT -1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `serial_code`
--

CREATE TABLE `serial_code` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `date_activation` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `serial_code`
--

INSERT INTO `serial_code` (`id`, `code`, `date_activation`) VALUES
(0, 'apJraJFgmGBrcA==', '2023-11-16');

-- --------------------------------------------------------

--
-- Structure de la table `societe`
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
  `nb` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `societe`
--

INSERT INTO `societe` (`id`, `raisonsocial`, `telephone`, `fax`, `email`, `compte`, `iff`, `rc`, `patente`, `adresse`, `logo`, `header_footer`, `unite_util`, `etat_unite`, `IdUser`, `valeur_key`, `nb`) VALUES
(1, 'G.R.D', '', '', '', '', '', '', '', 'NADOR', '', 0, '', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `tracking_vente`
--

CREATE TABLE `tracking_vente` (
  `id` int(11) NOT NULL,
  `code_bar` varchar(100) NOT NULL,
  `date_vente` date NOT NULL,
  `qte_vendu` int(11) NOT NULL,
  `guid_client` varchar(50) NOT NULL,
  `num_ticket` varchar(100) NOT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transfert_caisse`
--

CREATE TABLE `transfert_caisse` (
  `id` int(11) NOT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `type_reg` varchar(250) DEFAULT NULL,
  `date_transfert_caisse` date DEFAULT NULL,
  `montant_espece` varchar(250) DEFAULT '0',
  `image` text DEFAULT NULL,
  `id_user` text DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `date_add` timestamp NULL DEFAULT current_timestamp(),
  `date_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `date_delete` timestamp NULL DEFAULT NULL,
  `devise_produit` varchar(25) DEFAULT NULL,
  `cout_device` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `usine`
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
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
  `agences` text DEFAULT NULL,
  `id_depot` int(11) NOT NULL DEFAULT -1,
  `id_usine` int(11) NOT NULL DEFAULT -1,
  `display_usine` int(11) NOT NULL DEFAULT 0,
  `bloque` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `depot` int(11) DEFAULT NULL,
  `ancienne_vente` int(11) DEFAULT NULL,
  `devis` int(11) DEFAULT NULL,
  `achat_vente` int(11) DEFAULT NULL,
  `bon_commande` int(11) DEFAULT NULL,
  `commande_vendeur` int(11) DEFAULT NULL,
  `bon_livraison` int(11) DEFAULT NULL,
  `reglement` int(11) DEFAULT NULL,
  `facture` int(11) DEFAULT NULL,
  `caisse` int(11) DEFAULT NULL,
  `transfert_caisse` int(11) DEFAULT NULL,
  `recette_point_vente` int(11) DEFAULT NULL,
  `annulation` int(11) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `utilisateur` int(11) NOT NULL,
  `supprimer` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `nom`, `tele`, `email`, `pwd`, `privilege`, `idu`, `achat`, `vente`, `client`, `fournisseur`, `produit`, `avoir`, `charge`, `poste`, `agences`, `id_depot`, `id_usine`, `display_usine`, `bloque`, `id_zone`, `depot`, `ancienne_vente`, `devis`, `achat_vente`, `bon_commande`, `commande_vendeur`, `bon_livraison`, `reglement`, `facture`, `caisse`, `transfert_caisse`, `recette_point_vente`, `annulation`, `etat`, `utilisateur`, `supprimer`, `modifier`) VALUES
(35, 'RACHID', 'admin', '', '', 'admin', 'Admin', 35, 1, 1, 1, 1, 1, 1, 1, 'Chef d\\\'usine', '2', -1, 5, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(48, 'OMAYMA', 'OMAYMA', 'a', 'a', '2023', 'User', 56, 1, 0, 1, 0, 0, 0, 1, 'Indefinie', NULL, -1, -1, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 1, NULL, 0, NULL, NULL),
(63, 'ZAAJ', 'ABDELMALIK ZAAJ', '0677277075', '', '2001', 'Vendeur', 56, 0, 1, 1, 0, 0, 0, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(59, '', 'ABDELMALEK ZAAJ', '', '', '', 'Admin', 47, 1, 1, 1, 1, 1, 1, 1, 'Indefinie', NULL, -1, -1, 0, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(58, 'SAIF', 'SAIF EDDENE', '0661848224', '', '1990', 'Admin', 56, 1, 1, 1, 1, 1, 1, 1, 'Indefinie', NULL, -1, -1, 0, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(56, 'admin', 'admin', '', '', 'admin', 'Admin', 48, 1, 1, 1, 1, 1, 1, 1, 'Indefinie', NULL, -1, -1, 0, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(62, 'LKADI', 'MOHAMED EL LKADI', '0670811226', '', '2000', 'Vendeur', 56, 0, 1, 1, 0, 0, 0, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(61, 'MOHAMED', 'MOHAMED ASRIHI', '0689539931', '', '123456', 'Vendeur', 56, 0, 1, 1, 0, 1, 1, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(64, 'RAZZOK', 'ABDERRAZAK RAZOUK', '0636037933', '', '2002', 'Vendeur', 56, 0, 1, 1, 0, 0, 0, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(65, 'AAROUSS', 'KHALID AAROUSS', '0662572415', '', '2003', 'Vendeur', 56, 0, 1, 1, 0, 0, 0, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(66, 'BOUKHRISI', 'HAMZA BOUKHRISI', '0627887286', '', '2004', 'Vendeur', 56, 0, 1, 1, 0, 0, 0, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(67, 'ASHAD', 'MOHAMED ASHAD', '0660212912', '', '2005', 'Vendeur', 56, 0, 1, 1, 0, 0, 0, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(68, 'FADOUA', 'FADOUA RACHIDI', '', '', '2010', 'User+', 56, 1, 1, 1, 1, 1, 1, 0, 'Indefinie', NULL, -1, -1, 0, 0, 10, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1),
(69, 'LOUARTI', 'FARID ELOUARTI', '', '', 'FARID', 'Vendeur', 56, 1, 1, 1, 1, 1, 1, 1, 'Indefinie', NULL, -1, -1, 0, 0, 10, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `id_vente` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_vente` date DEFAULT NULL,
  `remarque` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `numbon` int(100) DEFAULT NULL,
  `datebon` date DEFAULT NULL,
  `remarquebon` text DEFAULT NULL,
  `num_devi` int(11) DEFAULT NULL,
  `bon_commande` text DEFAULT NULL,
  `validite` varchar(60) DEFAULT '1 mois',
  `client` text DEFAULT NULL,
  `id_bon` int(11) DEFAULT NULL,
  `localisation` text DEFAULT NULL,
  `id_agence` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_synced` int(11) DEFAULT 0,
  `amount_paid` decimal(10,0) NOT NULL DEFAULT 0,
  `is_paied` int(11) NOT NULL DEFAULT 0,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id_vente`, `id_client`, `date_vente`, `remarque`, `id_user`, `numbon`, `datebon`, `remarquebon`, `num_devi`, `bon_commande`, `validite`, `client`, `id_bon`, `localisation`, `id_agence`, `created_at`, `is_synced`, `amount_paid`, `is_paied`, `id_vendeur`) VALUES
(1, 1, '2023-11-18', '', 35, 1, '2023-11-18', '', NULL, '0', '7 jours', NULL, NULL, NULL, NULL, '2023-11-18 20:32:57', 0, 0, 0, 51),
(7, 57, '2023-11-22', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', '', 4, '', NULL, '2023-11-22 23:52:45', 0, 0, 0, NULL),
(8, 57, '2023-11-22', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', '', 4, '', NULL, '2023-11-22 23:53:16', 0, 0, 0, NULL),
(4, 49, '2023-11-22', '', 49, 0, NULL, NULL, NULL, NULL, '1 mois', 'ali', 1, '35.0435861,-2.9482825', NULL, '2023-11-22 17:05:29', 0, 0, 0, NULL),
(5, 57, '2023-11-22', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', 'Hasan', 2, '', NULL, '2023-11-22 19:43:56', 0, 0, 0, NULL),
(6, 57, '2023-11-22', 'EL HOCEIMA', 57, 0, NULL, NULL, NULL, NULL, '1 mois', 'Khalid', 3, 'Sahili', NULL, '2023-11-22 20:07:44', 0, 0, 0, NULL),
(9, 57, '2023-11-22', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', '', 4, '', NULL, '2023-11-22 23:54:24', 0, 0, 0, NULL),
(10, 57, '2023-11-22', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', 'KHALID', 4, '35.165409,-2.9341245', NULL, '2023-11-22 23:54:56', 0, 0, 0, NULL),
(11, 57, '2023-11-23', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', 'KHALID', 4, '35.165409,-2.9341245', NULL, '2023-11-22 23:55:20', 0, 0, 0, NULL),
(12, 57, '2023-11-23', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', 'KHALID', 4, '35.1099953,-2.7307058', NULL, '2023-11-22 23:58:02', 0, 0, 0, NULL),
(13, 57, '2023-11-22', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', '', 4, '35.1099953,-2.7307058', NULL, '2023-11-22 23:58:50', 0, 0, 0, NULL),
(14, 57, '2023-11-22', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', '', 4, '35.1099953,-2.7307058', NULL, '2023-11-22 23:59:16', 0, 0, 0, NULL),
(15, 57, '2023-11-23', '', 57, 0, NULL, NULL, NULL, NULL, '1 mois', 'Khalid', 5, '', NULL, '2023-11-23 00:03:33', 0, 0, 0, NULL),
(16, 55, '2023-11-23', '', 55, 0, NULL, NULL, NULL, NULL, '1 mois', 'Hicham ', 6, 'Fes', NULL, '2023-11-23 00:13:03', 0, 0, 0, NULL),
(40, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Ayoube afazar', 12, '35.2377706,-3.9391716', NULL, '2023-11-27 10:01:14', 0, 0, 0, NULL),
(22, 17, '2023-11-23', '', 47, 3, '2023-11-23', NULL, NULL, '0', '1 mois', NULL, NULL, NULL, NULL, '2023-11-23 17:33:07', 0, 0, 0, NULL),
(41, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Mounair biceno', 12, '35.2377665,-3.9391755', NULL, '2023-11-27 10:50:06', 0, 0, 0, NULL),
(25, 61, '2023-11-23', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 7, '35.1502336,-2.932736', NULL, '2023-11-23 21:32:07', 0, 0, 0, NULL),
(26, 61, '2023-11-23', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'KHALID', 8, '35.1502336,-2.932736', NULL, '2023-11-23 21:56:32', 0, 0, 0, NULL),
(27, 61, '2023-11-23', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 9, '35.1654131,-2.9341244', NULL, '2023-11-23 22:17:22', 0, 0, 0, NULL),
(28, 61, '2023-11-23', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'SADIK', 10, '35.1654096,-2.9341219', NULL, '2023-11-23 22:35:20', 0, 0, 0, NULL),
(29, 61, '2023-11-23', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'AZIZ', 10, '35.1654096,-2.9341219', NULL, '2023-11-23 22:36:16', 0, 0, 0, NULL),
(30, 61, '2023-11-23', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'HASAN', 10, '35.1654096,-2.934122', NULL, '2023-11-23 22:36:48', 0, 0, 0, NULL),
(31, 61, '2023-11-23', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'NAAIM', 10, '35.1461461,-2.947576', NULL, '2023-11-23 22:37:17', 0, 0, 0, NULL),
(32, 61, '2023-11-24', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Aziz', 11, '35.0435803,-2.9482704', NULL, '2023-11-24 12:52:52', 0, 0, 0, NULL),
(33, 61, '2023-11-24', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 11, '35.0435803,-2.9482704', NULL, '2023-11-24 12:55:03', 0, 0, 0, NULL),
(34, 61, '2023-11-24', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Aziz', 13, '35.0435803,-2.9482704', NULL, '2023-11-24 16:58:57', 0, 0, 0, NULL),
(35, 61, '2023-11-25', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Soufain village', 13, '35.1468206,-3.8512676', NULL, '2023-11-25 11:07:08', 0, 0, 0, NULL),
(36, 61, '2023-11-25', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 12, '35.1521069,-3.8488353', NULL, '2023-11-25 11:53:00', 0, 0, 0, NULL),
(37, 61, '2023-11-25', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Hadi igar azogagh', 13, '35.2270034,-3.9272823', NULL, '2023-11-25 12:56:04', 0, 0, 0, NULL),
(38, 61, '2023-11-25', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Khalid chrif', 12, '35.2425819,-3.9292741', NULL, '2023-11-25 13:40:28', 0, 0, 0, NULL),
(39, 61, '2023-11-25', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Jamal lbaz', 12, '35.2465448,-3.9450152', NULL, '2023-11-25 14:13:02', 0, 0, 0, NULL),
(42, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Alhasouni', 12, '35.2377824,-3.9391972', NULL, '2023-11-27 11:36:08', 0, 0, 0, NULL),
(43, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Imad yahya', 12, '35.241721,-3.9284241', NULL, '2023-11-27 13:45:33', 0, 0, 0, NULL),
(44, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Imad yahya', 13, '35.241693,-3.9284598', NULL, '2023-11-27 13:48:15', 0, 0, 0, NULL),
(45, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Ismaril hado', 12, '35.2474924,-3.9354836', NULL, '2023-11-27 14:29:01', 0, 0, 0, NULL),
(47, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Moutad marmoucha', 13, '35.2449672,-3.9305716', NULL, '2023-11-27 19:59:40', 0, 0, 0, NULL),
(48, 61, '2023-11-27', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Moutad marmoucha', 12, '35.2449672,-3.9305716', NULL, '2023-11-27 20:02:27', 0, 0, 0, NULL),
(49, 61, '2023-11-28', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Yassine asaidi', 13, '35.2414612,-3.9327413', NULL, '2023-11-28 09:50:41', 0, 0, 0, NULL),
(50, 61, '2023-11-28', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Yassine asaidi', 12, '35.2414679,-3.9327304', NULL, '2023-11-28 09:52:31', 0, 0, 0, NULL),
(51, 61, '2023-11-28', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Mohamed taki', 13, '35.2414861,-3.9327191', NULL, '2023-11-28 11:55:42', 0, 0, 0, NULL),
(52, 61, '2023-11-28', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 12, '35.2414529,-3.9327284', NULL, '2023-11-28 11:56:43', 0, 0, 0, NULL),
(53, 61, '2023-11-28', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 12, '35.1479697,-3.8498932', NULL, '2023-11-28 12:39:42', 0, 0, 0, NULL),
(54, 61, '2023-11-28', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Khalid boukidan', 12, '35.1475969,-3.8493576', NULL, '2023-11-28 14:03:04', 0, 0, 0, NULL),
(55, 61, '2023-11-28', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Khalid boukidan', 12, '35.174317,-3.8647364', NULL, '2023-11-28 14:07:47', 0, 0, 0, NULL),
(56, 28, '2023-11-28', '', 69, 4, '2023-11-28', NULL, NULL, '0', '1 mois', NULL, NULL, NULL, NULL, '2023-11-28 15:52:45', 0, 0, 0, 63),
(57, 61, '2023-11-29', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 13, '35.1176899,-3.8422814', NULL, '2023-11-29 10:32:51', 0, 0, 0, NULL),
(58, 61, '2023-11-29', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Halim azghar', 13, '35.2697653,-3.6799135', NULL, '2023-11-29 16:18:30', 0, 0, 0, NULL),
(59, 61, '2023-11-29', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', '', 13, '35.2486966,-3.6396724', NULL, '2023-11-29 16:31:01', 0, 0, 0, NULL),
(60, 61, '2023-11-29', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Mohamed azghar', 13, '35.252761,-3.6569788', NULL, '2023-11-29 16:48:14', 0, 0, 0, NULL),
(61, 61, '2023-11-30', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Hosaine aitkamra', 13, '35.1440043,-3.9881463', NULL, '2023-11-30 09:57:34', 0, 0, 0, NULL),
(62, 61, '2023-11-30', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Mohamed rwadi', 13, '35.1401832,-4.1344078', NULL, '2023-11-30 10:24:13', 0, 0, 0, NULL),
(63, 61, '2023-11-30', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Boulahya rwadi', 13, '35.1400932,-4.1332054', NULL, '2023-11-30 10:53:35', 0, 0, 0, NULL),
(64, 61, '2023-11-30', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Souhail aitkanra', 13, '35.1439747,-3.988052', NULL, '2023-11-30 11:32:43', 0, 0, 0, NULL),
(65, 61, '2023-11-30', '', 61, 0, NULL, NULL, NULL, NULL, '1 mois', 'Mounrim secteur', 13, '35.2437478,-3.9366961', NULL, '2023-11-30 13:02:55', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE `zone` (
  `id_zone` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `zone`
--

INSERT INTO `zone` (`id_zone`, `libelle`, `zone`, `code_postal`) VALUES
(1, 'North Zone', 'A', '12345'),
(2, 'South Zone', 'B', '67890'),
(3, 'East Zone', 'C', '54321'),
(4, 'West Zone', 'D', '09876'),
(5, 'Central Zone', 'E', '98765'),
(6, 'Coastal Zone', 'F', '45678'),
(7, 'Mountain Zone', 'G', '23456'),
(8, 'Island Zone', 'H', '87654'),
(9, 'Metropolitan Zone', 'I', '34567'),
(10, 'Border Zone', 'J', '01234');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`id_achat`);

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`id_agence`);

--
-- Index pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD PRIMARY KEY (`id_avoir`);

--
-- Index pour la table `boncommande`
--
ALTER TABLE `boncommande`
  ADD PRIMARY KEY (`id_bon`);

--
-- Index pour la table `boncommandevendeur`
--
ALTER TABLE `boncommandevendeur`
  ADD PRIMARY KEY (`id_bon`);

--
-- Index pour la table `caisse`
--
ALTER TABLE `caisse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cheque_transfert_caisse`
--
ALTER TABLE `cheque_transfert_caisse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `cloturages`
--
ALTER TABLE `cloturages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `commande_usine`
--
ALTER TABLE `commande_usine`
  ADD PRIMARY KEY (`id_cmd`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `depot`
--
ALTER TABLE `depot`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `depot_op`
--
ALTER TABLE `depot_op`
  ADD PRIMARY KEY (`id_depot_op`);

--
-- Index pour la table `design`
--
ALTER TABLE `design`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `detail_achat`
--
ALTER TABLE `detail_achat`
  ADD PRIMARY KEY (`id_detail`);

--
-- Index pour la table `detail_avoir`
--
ALTER TABLE `detail_avoir`
  ADD PRIMARY KEY (`id_detail`);

--
-- Index pour la table `detail_bon_vendeur`
--
ALTER TABLE `detail_bon_vendeur`
  ADD PRIMARY KEY (`id_detail`);

--
-- Index pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD PRIMARY KEY (`id_detail`);

--
-- Index pour la table `detail_depot_op`
--
ALTER TABLE `detail_depot_op`
  ADD PRIMARY KEY (`id_detail`);

--
-- Index pour la table `detail_entre`
--
ALTER TABLE `detail_entre`
  ADD PRIMARY KEY (`id_de`);

--
-- Index pour la table `detail_produit`
--
ALTER TABLE `detail_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `detail_sortie`
--
ALTER TABLE `detail_sortie`
  ADD PRIMARY KEY (`id_ds`);

--
-- Index pour la table `detail_vente`
--
ALTER TABLE `detail_vente`
  ADD PRIMARY KEY (`id_detail`);

--
-- Index pour la table `effet_transfert_caisse`
--
ALTER TABLE `effet_transfert_caisse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `export`
--
ALTER TABLE `export`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id_facture`);

--
-- Index pour la table `facture_avoir`
--
ALTER TABLE `facture_avoir`
  ADD PRIMARY KEY (`id_facture`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_fournisseur`);

--
-- Index pour la table `historiques_modifs_vente`
--
ALTER TABLE `historiques_modifs_vente`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `historique_modifs_achat`
--
ALTER TABLE `historique_modifs_achat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `designation` (`designation`);

--
-- Index pour la table `produit_depot`
--
ALTER TABLE `produit_depot`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reg_achat`
--
ALTER TABLE `reg_achat`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `reg_avoir`
--
ALTER TABLE `reg_avoir`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `reg_client`
--
ALTER TABLE `reg_client`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `reg_commande`
--
ALTER TABLE `reg_commande`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `reg_fournisseur`
--
ALTER TABLE `reg_fournisseur`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `reg_vendeur`
--
ALTER TABLE `reg_vendeur`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `reg_vente`
--
ALTER TABLE `reg_vente`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tracking_vente`
--
ALTER TABLE `tracking_vente`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transfert_caisse`
--
ALTER TABLE `transfert_caisse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `usine`
--
ALTER TABLE `usine`
  ADD PRIMARY KEY (`id_usine`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id_vente`);

--
-- Index pour la table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id_zone`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achat`
--
ALTER TABLE `achat`
  MODIFY `id_achat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `agence`
--
ALTER TABLE `agence`
  MODIFY `id_agence` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `avoir`
--
ALTER TABLE `avoir`
  MODIFY `id_avoir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `boncommande`
--
ALTER TABLE `boncommande`
  MODIFY `id_bon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `boncommandevendeur`
--
ALTER TABLE `boncommandevendeur`
  MODIFY `id_bon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `caisse`
--
ALTER TABLE `caisse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT pour la table `charge`
--
ALTER TABLE `charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `cloturages`
--
ALTER TABLE `cloturages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande_usine`
--
ALTER TABLE `commande_usine`
  MODIFY `id_cmd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `depot`
--
ALTER TABLE `depot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `depot_op`
--
ALTER TABLE `depot_op`
  MODIFY `id_depot_op` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `design`
--
ALTER TABLE `design`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `detail_achat`
--
ALTER TABLE `detail_achat`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pour la table `detail_avoir`
--
ALTER TABLE `detail_avoir`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `detail_bon_vendeur`
--
ALTER TABLE `detail_bon_vendeur`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  MODIFY `id_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `detail_depot_op`
--
ALTER TABLE `detail_depot_op`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `detail_entre`
--
ALTER TABLE `detail_entre`
  MODIFY `id_de` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `detail_produit`
--
ALTER TABLE `detail_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `detail_sortie`
--
ALTER TABLE `detail_sortie`
  MODIFY `id_ds` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `detail_vente`
--
ALTER TABLE `detail_vente`
  MODIFY `id_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT pour la table `effet_transfert_caisse`
--
ALTER TABLE `effet_transfert_caisse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `facture_avoir`
--
ALTER TABLE `facture_avoir`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `historiques_modifs_vente`
--
ALTER TABLE `historiques_modifs_vente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `historique_modifs_achat`
--
ALTER TABLE `historique_modifs_achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT pour la table `produit_depot`
--
ALTER TABLE `produit_depot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT pour la table `reg_achat`
--
ALTER TABLE `reg_achat`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `reg_avoir`
--
ALTER TABLE `reg_avoir`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reg_client`
--
ALTER TABLE `reg_client`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reg_commande`
--
ALTER TABLE `reg_commande`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reg_fournisseur`
--
ALTER TABLE `reg_fournisseur`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reg_vendeur`
--
ALTER TABLE `reg_vendeur`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `reg_vente`
--
ALTER TABLE `reg_vente`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `societe`
--
ALTER TABLE `societe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tracking_vente`
--
ALTER TABLE `tracking_vente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transfert_caisse`
--
ALTER TABLE `transfert_caisse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `usine`
--
ALTER TABLE `usine`
  MODIFY `id_usine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
  MODIFY `id_vente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `zone`
--
ALTER TABLE `zone`
  MODIFY `id_zone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

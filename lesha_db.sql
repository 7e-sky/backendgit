-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 22 nov. 2019 à 18:08
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `lesha_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `id` int(11) NOT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `societe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent2` int(11) DEFAULT NULL,
  `civilite` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ice` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fix` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `secteur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `pays_id`, `ville_id`, `societe`, `parent2`, `civilite`, `ice`, `fix`, `website`, `description`, `secteur_id`) VALUES
(2, 1, 1, '', NULL, '', '', '', '', '', NULL),
(18, 1, 1, 'ArasElect', NULL, '', '', '', '', '', NULL),
(28, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL),
(29, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL),
(30, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL),
(31, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL),
(32, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL),
(33, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL),
(34, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL),
(35, NULL, NULL, 'Testi', NULL, 'M', NULL, NULL, NULL, NULL, NULL),
(36, NULL, NULL, 'Testi', NULL, 'M', NULL, NULL, NULL, NULL, NULL),
(37, NULL, NULL, 'Testi', NULL, 'M', NULL, NULL, NULL, NULL, NULL),
(38, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(39, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(42, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(43, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(45, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(46, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(47, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(48, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(49, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(50, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL),
(68, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1),
(69, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1),
(70, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1),
(71, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1),
(72, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1),
(73, 1, 2, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1),
(74, 2, 33, '3f industrie', NULL, 'M.', NULL, '', '', '', 1),
(76, 1, 1, '3f industrie2', NULL, 'M.', '124554474445612', '0622201475', 'https://www.d.fr', 'skkkkkkkkkkk', 3);

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`) VALUES
(1),
(10),
(11),
(21),
(22),
(23),
(26),
(27);

-- --------------------------------------------------------

--
-- Structure de la table `attachement`
--

CREATE TABLE `attachement` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attachement`
--

INSERT INTO `attachement` (`id`, `url`, `file_size`, `type`) VALUES
(23, '5dcab6fdecaa7790043530.jpg', 21519, 'image/jpeg'),
(24, '5dcab70d04f2b669272328.pdf', 163157, 'application/pdf'),
(26, '5dcab76c24153452341781.jpg', 21519, 'image/jpeg'),
(27, '5dcab78977f8b734808049.pdf', 142995, 'application/pdf'),
(29, '5dcab7954b7ce643504081.png', 562, 'image/png'),
(31, '5dcab82be9dec954195275.pdf', 163157, 'application/pdf'),
(32, '5dcab83595f34330036645.pdf', 646308, 'application/pdf'),
(33, '5dcab84d8d774969024642.pdf', 646308, 'application/pdf'),
(34, '5dcab851345a7180357856.txt', 1264, 'text/plain'),
(35, '5dcab85671eb6095495491.jpg', 21519, 'image/jpeg'),
(36, '5dcab866e88f6289429709.pdf', 142995, 'application/pdf'),
(37, '5dcab87486bf8343010105.pdf', 163157, 'application/pdf'),
(38, '5dcab8d28de3c871661751.jpg', 21519, 'image/jpeg'),
(39, '5dcab9253f39b683227578.jpg', 21519, 'image/jpeg'),
(40, '5dcab9429e86b424221656.jpg', 21519, 'image/jpeg'),
(41, '5dcab98c48907826393808.jpg', 21519, 'image/jpeg'),
(42, '5dcab9e40d2b6032270730.jpg', 21519, 'image/jpeg'),
(44, '5dcac5f011f5f903912087.xlsx', 10231, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
(45, '5dcacde5a4d9b380063344.jpg', 21519, 'image/jpeg'),
(46, '5dcacdf94ff67888382922.jpg', 8864, 'image/jpeg'),
(48, '5dcace7d5edf5436427940.pdf', 143935, 'application/pdf'),
(49, '5dcace80c7450732121576.jpg', 21519, 'image/jpeg'),
(50, '5dcace83db6a1763461079.jpg', 8864, 'image/jpeg'),
(51, '5dcace872c970570331576.jpg', 21519, 'image/jpeg'),
(52, '5dcacea7a103a410415777.jpg', 21519, 'image/jpeg'),
(53, '5dcad10a2fc39214017493.jpg', 21519, 'image/jpeg'),
(54, '5dcad22669f74457160233.jpg', 21519, 'image/jpeg'),
(64, '5dcae2fc7d974503423221.jpg', 8864, 'image/jpeg'),
(65, '5dcae2ff803c3658111922.png', 38731, 'image/png'),
(66, '5dcae303acced226626780.jpg', 119505, 'image/jpeg'),
(67, '5dcae30907f5c240585009.pdf', 163157, 'application/pdf'),
(68, '5dcae420aec51694491452.jpg', 21519, 'image/jpeg'),
(69, '5dcae4242007a499388557.jpg', 8864, 'image/jpeg'),
(71, '5dcae45835571205831693.jpg', 8864, 'image/jpeg'),
(72, '5dcae54e189c5902067045.jpg', 119505, 'image/jpeg'),
(74, '5dcbdafc4e102406561612.jpg', 8864, 'image/jpeg'),
(75, '5dcbe01de2f67540142420.png', 29628, 'image/png'),
(77, '5dcc063a3dd89676064733.pdf', 163157, 'application/pdf'),
(79, '5dcc06d02333d219049968.jpg', 8864, 'image/jpeg'),
(82, '5dcc0840c4e01196060068.pdf', 143935, 'application/pdf'),
(83, '5dcc08443e480300590687.jpg', 21519, 'image/jpeg'),
(84, '5dcc0dced3485368884472.jpg', 21519, 'image/jpeg'),
(85, '5dcd7afd886b2320222661.jpg', 21519, 'image/jpeg'),
(86, '5dcd8b68cc6b7826721087.jpg', 21519, 'image/jpeg'),
(87, '5dcd8f846c8bd831938608.jpg', 8864, 'image/jpeg'),
(88, '5dd64e92b71a2474530957.doc', 83456, 'application/msword'),
(89, '5dd64ec2d4ae2368177952.doc', 83456, 'application/msword'),
(90, '5dd64f2b073b2505359657.doc', 83456, 'application/msword'),
(91, '5dd64f41ede83672399745.doc', 83456, 'application/msword'),
(92, '5dd64f772a509532426686.doc', 83456, 'application/msword'),
(93, '5dd64f89534cc912135849.doc', 83456, 'application/msword');

-- --------------------------------------------------------

--
-- Structure de la table `avatar`
--

CREATE TABLE `avatar` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `avatar`
--

INSERT INTO `avatar` (`id`, `url`) VALUES
(1, '5d48404eeb298772992394.jpg'),
(2, '5d4aa639a0734708287066.jpg'),
(3, '5da74be9e6a4c081892072.jpg'),
(4, '5da84ad22a790717568726.png'),
(5, '5da84b0b72244808443238.png'),
(6, '5da84bbfa0b30384453465.png'),
(7, '5da84ea347fd6815706406.png'),
(8, '5da84ff5db9d5151660740.png'),
(9, '5da8501231d40632942966.png'),
(10, '5da8508fb5cf1827786880.png'),
(11, '5da8510ca6649285327308.png'),
(12, '5da852ee10263277114989.jpg'),
(13, '5da853425edc9933032974.jpg'),
(14, '5da85371517d9170564596.jpg'),
(15, '5da8538f1e6de730053101.png'),
(16, '5da853d8dce56318849656.jpg'),
(17, '5da854af8d4f7496353385.png'),
(18, '5da8577d342d1317234145.PNG'),
(19, '5da859457b27c764750523.png'),
(20, '5da8596abf868577640228.png'),
(21, '5da85ac0ca2b2137908194.jpeg'),
(22, '5da87552ef8bb995224026.jpg'),
(23, '5da875b93945a664970234.jpg'),
(24, '5da8760f2e5ae790790537.jpg'),
(25, '5da8763b51bac302965304.jpg'),
(26, '5da88361dc444479361541.jpg'),
(27, '5da88383145b5508486255.jpeg'),
(28, '5da8839f805e9119574439.png'),
(29, '5da883f157336819105949.png'),
(30, '5da88d2340759715353386.jpg'),
(31, '5da998970480e538063043.jpeg'),
(32, '5da9e5ad981db017469990.png'),
(33, '5dd7fc9dbd65f256435782.png'),
(34, '5dd7fcd8128ca705073747.png'),
(35, '5dd7fcfa722c7806280573.png'),
(36, '5dd7fd413f5d6763820939.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `black_listes`
--

CREATE TABLE `black_listes` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `raison` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `acheteur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `black_listes`
--

INSERT INTO `black_listes` (`id`, `fournisseur_id`, `raison`, `created`, `acheteur_id`) VALUES
(51, 75, 'makantfahmouch ', '2019-11-21 09:23:05', 76);

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE `commercial` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commercial`
--

INSERT INTO `commercial` (`id`) VALUES
(6),
(7),
(9),
(19);

-- --------------------------------------------------------

--
-- Structure de la table `commercial_ville`
--

CREATE TABLE `commercial_ville` (
  `commercial_id` int(11) NOT NULL,
  `ville_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commercial_ville`
--

INSERT INTO `commercial_ville` (`commercial_id`, `ville_id`) VALUES
(6, 1),
(19, 1),
(6, 2),
(7, 2),
(6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `demande_achat`
--

CREATE TABLE `demande_achat` (
  `id` int(11) NOT NULL,
  `acheteur_id` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_expiration` datetime NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `nbr_visite` int(11) DEFAULT NULL,
  `nbr_share` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `date_modification` datetime NOT NULL,
  `is_alerted` tinyint(1) NOT NULL,
  `is_anonyme` tinyint(1) NOT NULL,
  `langue_p` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` longtext COLLATE utf8mb4_unicode_ci,
  `description_es` longtext COLLATE utf8mb4_unicode_ci,
  `motif_rejet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` decimal(10,0) NOT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_achat`
--

INSERT INTO `demande_achat` (`id`, `acheteur_id`, `statut`, `reference`, `description`, `date_expiration`, `is_public`, `nbr_visite`, `nbr_share`, `created`, `date_modification`, `is_alerted`, `is_anonyme`, `langue_p`, `description_en`, `description_es`, `motif_rejet`, `budget`, `del`) VALUES
(1, 76, 0, 'aaaaa0_deleted-1', 'azertyuiop', '2019-11-14 16:59:00', 1, 0, 0, '2019-11-14 16:59:52', '2019-11-15 11:38:56', 0, 0, NULL, NULL, NULL, NULL, '100000', 1),
(2, 76, 1, 'aaaaa0q', 'azertyuioppok', '2019-11-22 23:03:00', 1, 0, 5, '2019-11-14 17:03:25', '2019-11-19 14:47:55', 1, 0, NULL, NULL, NULL, '', '25130', 0),
(3, 76, 0, 'qdqdsqsd', 'azqsdazeqd', '2019-11-14 14:03:00', 1, 0, 0, '2019-11-14 17:04:17', '2019-11-14 17:10:38', 0, 0, NULL, NULL, NULL, NULL, '11555', 0);

-- --------------------------------------------------------

--
-- Structure de la table `demande_achat_attachement`
--

CREATE TABLE `demande_achat_attachement` (
  `demande_achat_id` int(11) NOT NULL,
  `attachement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_achat_attachement`
--

INSERT INTO `demande_achat_attachement` (`demande_achat_id`, `attachement_id`) VALUES
(1, 87),
(2, 86),
(3, 85);

-- --------------------------------------------------------

--
-- Structure de la table `demande_ha_sous_secteur`
--

CREATE TABLE `demande_ha_sous_secteur` (
  `sous_secteur_id` int(11) NOT NULL,
  `demande_achat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_ha_sous_secteur`
--

INSERT INTO `demande_ha_sous_secteur` (`sous_secteur_id`, `demande_achat_id`) VALUES
(6, 1),
(6, 2),
(7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `diffusion_demande`
--

CREATE TABLE `diffusion_demande` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `demande_id` int(11) DEFAULT NULL,
  `date_diffusion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `diffusion_demande`
--

INSERT INTO `diffusion_demande` (`id`, `fournisseur_id`, `demande_id`, `date_diffusion`) VALUES
(86, 61, 2, '2019-11-15 16:49:35'),
(87, 64, 2, '2019-11-15 16:49:35'),
(88, 65, 2, '2019-11-15 16:49:35'),
(89, 66, 2, '2019-11-15 16:49:35'),
(90, 67, 2, '2019-11-15 16:49:35');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `societe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civilite` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ice` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fix` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `pays_id`, `ville_id`, `societe`, `civilite`, `ice`, `fix`, `website`, `description`) VALUES
(3, 2, 1, '', '', '', '', '', ''),
(8, 2, 2, '', '', '', '', '', ''),
(13, 1, 1, '', '', '', '', '', ''),
(17, 1, 1, '', '', '', '', '', ''),
(51, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(52, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(53, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(54, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(55, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(56, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(57, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(58, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(59, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(60, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL),
(61, 1, 1, '3f industriee', 'M.', '123456789123456', '', '', ''),
(62, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', ''),
(63, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', ''),
(64, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', 'aaaaaaaaaaaaaaaaaaaaaaaaa'),
(65, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', ''),
(66, 1, 2, '3f industrie', 'M.', '123456789123456', '', '', ''),
(67, 1, 15, '3F Industrie', 'M.', '001531606000066', '0696318051', '', ''),
(75, 1, 1, '3f industrie', 'M.', '123456789123456', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur_sous_secteur`
--

CREATE TABLE `fournisseur_sous_secteur` (
  `fournisseur_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur_sous_secteur`
--

INSERT INTO `fournisseur_sous_secteur` (`fournisseur_id`, `sous_secteur_id`) VALUES
(61, 6),
(64, 6),
(65, 6),
(66, 6),
(67, 6),
(75, 6),
(61, 7),
(64, 7),
(75, 7),
(61, 8),
(65, 8),
(67, 8),
(64, 9),
(65, 9),
(66, 9),
(67, 9),
(67, 142),
(75, 142),
(67, 270);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191114155555', '2019-11-14 15:56:27'),
('20191114155657', '2019-11-14 15:57:01');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `name`, `del`) VALUES
(1, 'Maroc', 0),
(2, 'France', 0),
(3, 'Italie', 0),
(4, 'Irlandes', 0),
(5, 'USA', 0),
(6, 'Liba', 0),
(7, 'Mali', 0),
(8, 'Afghanistan ', 0),
(9, 'Afrique du sud ', 0),
(10, 'Albanie ', 0),
(11, 'Algérie ', 0),
(12, 'Allemagne ', 0),
(13, 'Arabie saoudite ', 0),
(14, 'Argentine ', 0),
(15, 'Australie ', 0),
(16, 'Autriche ', 0),
(17, 'Belgique ', 0),
(18, 'Brésil ', 0),
(19, 'Bulgarie ', 0),
(20, 'Canada ', 0),
(21, 'Chili ', 0),
(22, 'Chine ', 0),
(23, 'Colombie ', 0),
(24, 'Corée, Sud ', 0),
(25, 'Costa Rica ', 0),
(26, 'Croatie ', 0),
(27, 'Danemark ', 0),
(28, 'Égypte ', 0),
(29, 'Émirats Arabes Unis ', 0),
(30, 'Équateur ', 0),
(31, 'El Salvador ', 0),
(32, 'Espagne ', 0),
(33, 'Finlande ', 0),
(34, 'Grèce ', 0),
(35, 'Hong Kong ', 0),
(36, 'Hongrie ', 0),
(37, 'Inde ', 0),
(38, 'Indonésie ', 0),
(39, 'Israël ', 0),
(40, 'Japon ', 0),
(41, 'Jordanie ', 0),
(42, 'Malaisie ', 0),
(43, 'Mexique ', 0),
(44, 'Norvège', 0),
(45, 'Nouvelle-Zélande ', 0),
(46, 'Pérou ', 0),
(47, 'Pakistan ', 0),
(48, 'Pays-Bas ', 0),
(49, 'Philippines ', 0),
(50, 'Pologne ', 0),
(51, 'Porto Rico ', 0),
(52, 'Portugal ', 0),
(53, 'République tchèque ', 0),
(54, 'Roumanie ', 0),
(55, 'Royaume-Uni ', 0),
(56, 'Russie ', 0),
(57, 'Singapour ', 0),
(58, 'Suède ', 0),
(59, 'Suisse ', 0),
(60, 'Taiwan ', 0),
(61, 'Thaïlande', 0),
(62, 'Turquie ', 0),
(63, 'Tunisie', 0),
(64, 'Mauritanie', 0),
(65, 'Sénégal', 0),
(66, 'Côte d’ivoire ', 0),
(67, 'Ukraine ', 0),
(68, 'Venezuela ', 0),
(69, 'Yougoslavie ', 0),
(70, 'Autre', 0),
(84, 'Slovaquie', 0),
(88, 'Béni', 0),
(90, 'Luxembourg', 0),
(91, 'Guinée', 0),
(92, 'teeeeeeest_deleted-92', 1);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`id`, `name`, `del`) VALUES
(1, 'Bureautique & Mobilier', 0),
(2, 'Conception & Graphismes', 0),
(3, 'Conseil en Finance', 0),
(4, 'Emballage', 0),
(5, 'Energie', 0),
(6, 'Evénements', 0),
(7, 'Formations', 0),
(8, 'Impressio', 0),
(9, 'Informatique', 0),
(11, 'Logistique', 0),
(12, 'Marketing & Communicatio', 0),
(14, 'Nettoyage & Environnement', 0),
(15, 'Photo, Vidéo & Présentations', 0),
(16, 'Promo & Cadeaux d\'affaires', 0),
(17, 'Ressource Humaines', 0),
(18, 'Rénovation & Constructio', 0),
(19, 'Sécurité & Surveillance', 0),
(20, 'Automobiles', 0),
(23, 'Autre (à préciser sur le descriptif)', 0),
(24, 'Voyages et loisirs', 0),
(25, 'Sols, mine et carrière', 0),
(26, 'Agro-industrie', 0),
(27, 'Matériaux de construction ', 0),
(28, 'Industries mécaniques et manufacturières ', 0),
(29, 'Sidérurgie, métallurgie ', 0),
(30, 'Industries de transformation ', 0),
(31, 'Energie, électricité, Electronique', 0),
(32, 'Environnement ', 0),
(34, 'Bâtiment', 0),
(35, 'Pétrole et Gaz', 0),
(36, 'Equipements généraux ', 0),
(37, 'Chimie, parachimie, pharmacie, santé ', 0),
(38, 'Acier, Bois et Tôle', 0),
(39, 'Agro-Alimentaire', 0),
(40, 'Architectes', 0),
(41, 'Ascenseurs et montes charges', 0),
(42, 'Bien d’équipement industriel', 0),
(43, 'Bureau d’étude', 0),
(44, 'Consommable industriel', 0),
(45, 'Entreprise intervenant dans le bâtiment', 0),
(46, 'Internet & Webdesig', 0),
(47, 'Maintenance et entretien ', 0),
(48, 'Matériel et fourniture ', 0),
(49, 'Matériel et installation d’automatisme industriel', 0),
(50, 'Matière première et consommable', 0),
(51, 'Matière première Plastique Caoutchouc et dérivé', 0),
(52, 'Pièce et accessoire pour automobile', 0),
(53, 'Pièce et accessoire pour camion et poids lourd', 0),
(54, 'Produit Chimique', 0),
(55, 'Télécom & Réseaux', 0),
(56, 'Location de véhicule', 0),
(57, 'Transport', 0),
(58, 'Audit et Conseil', 0),
(59, 'Chaudronnerie', 0),
(60, 'Charpente', 0),
(61, 'Rayonnages et systèmes de stockage', 0),
(62, 'Manutentio', 0),
(63, 'Peinture', 0),
(64, 'Services', 0),
(65, 'Fourniture Industrielle', 0),
(67, 'Expertise', 0),
(68, 'Distribution', 0),
(70, 'Place de marché', 0),
(74, 'BTP', 0),
(75, 'Froid et Climatisatio', 0),
(77, 'Autre', 0),
(78, 'Centre commercial', 0),
(79, 'Educatio', 0),
(80, 'test_deleted-80', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sous_secteur`
--

CREATE TABLE `sous_secteur` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `secteur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_secteur`
--

INSERT INTO `sous_secteur` (`id`, `name`, `del`, `secteur_id`) VALUES
(6, 'Acier Inoxydable', 0, 38),
(7, 'Aciers spéciaux', 0, 38),
(8, 'Aluminium en barre', 0, 38),
(9, 'Bois en panneau et dérivé', 0, 38),
(10, 'Profilé aluminium', 0, 38),
(11, 'Tôles ondulées', 0, 38),
(12, 'Tube et Raccord', 0, 38),
(13, 'Additifs alimentaires', 0, 39),
(14, 'Alimentation animale', 0, 39),
(15, 'Aliments pour bébés', 0, 39),
(16, 'Fabrication Alimentation générale ', 0, 39),
(17, 'Fabrication d’huiles et graisses alimentaires', 0, 39),
(18, 'Fabrication de chocolats ', 0, 39),
(19, 'Fabrication de Confiseries', 0, 39),
(20, 'Fabrication de Glaces et sorbets ', 0, 39),
(21, 'Fabrication de Sucres', 0, 39),
(22, 'Fabrication Pâtes alimentaires', 0, 39),
(23, 'Fourniture de Minerais et minéraux', 0, 39),
(24, 'Fours pour boulangeries et pâtisseries', 0, 39),
(25, 'Graisses alimentaires', 0, 39),
(26, 'Lait médical et alimentation pour bébés', 0, 39),
(27, 'Machines à café installation et entretie', 0, 39),
(28, 'Matériel et fournitures boucheries et charcuterie', 0, 39),
(29, 'Matériel et fournitures pour Boulangeries et pâtis', 0, 39),
(30, 'Matériel et fournitures pour café et restaurant', 0, 39),
(31, 'Matériel et fournitures pour Glaciers ', 0, 39),
(32, 'Matériel et fournitures Industrie Alimentaire', 0, 39),
(33, 'Matériel et fournitures Pâtisseries confiserie', 0, 39),
(34, 'Mobilier pour magasins, cafés', 0, 39),
(35, 'Produits alimentaires de luxe', 0, 39),
(36, 'Produits alimentaires Surgelés', 0, 39),
(37, 'Produits alimentaires surgelés et congelés', 0, 39),
(38, 'Balance et bascule', 0, 42),
(39, 'Broyeur', 0, 42),
(40, 'Chauffage ', 0, 42),
(41, 'Compresseur', 0, 42),
(42, 'Extrudeuse', 0, 42),
(43, 'Froid industriel', 0, 42),
(44, 'Machine d’injection plastique', 0, 42),
(45, 'Machine divers', 0, 42),
(46, 'Machine-outil', 0, 42),
(47, 'Matériel et fourniture pour blanchisserie et laver', 0, 42),
(48, 'Souffleuse', 0, 42),
(49, 'Traitement des eaux', 0, 42),
(50, 'Caisse enregistreuse ', 0, 1),
(51, 'Climatiseur', 0, 1),
(52, 'Coffre-fort', 0, 1),
(53, 'Distributeur de confiseries, snacks et tabac ', 0, 1),
(54, 'Distributeurs de boissons froides ', 0, 1),
(55, 'Distributeurs de café et boissons chaudes ', 0, 1),
(56, 'Fontaines à eau ', 0, 1),
(57, 'Mobilier de bureau ', 0, 1),
(58, 'Papier ', 0, 1),
(59, 'Photocopieurs ', 0, 1),
(60, 'Projecteurs ', 0, 1),
(61, 'Télécopieurs', 0, 1),
(63, 'Conception et réalisation de brochures et catalogu', 0, 2),
(64, 'Conception et réalisation de support publicitaire ', 0, 2),
(65, 'Création logo ou charte graphique', 0, 2),
(66, 'Comptabilité et Expert financier', 0, 3),
(67, 'Conseil opérationnel et industriel', 0, 3),
(68, 'Conseil stratégique et études', 0, 3),
(69, 'Recouvrement de créances', 0, 3),
(70, 'Boulonnerie, visserie, articles de fixatio', 0, 44),
(71, 'Carburant, fuel ', 0, 44),
(72, 'Consommable de soudure', 0, 44),
(73, 'Consommable et composant électrique', 0, 44),
(74, 'Droguerie', 0, 44),
(75, 'Emballage et conditionnement', 0, 44),
(76, 'Produit d’entretien et de nettoyage', 0, 44),
(77, 'Quincaillerie ', 0, 44),
(78, 'Vêtement de sécurité', 0, 44),
(79, 'Vêtement de travaille', 0, 44),
(80, 'Carton ondulé', 0, 4),
(81, 'Design emballage et étiquettes', 0, 4),
(82, 'Emballage et conditionnement ', 0, 4),
(83, 'Fioul - mazout', 0, 5),
(84, 'Energie Solaire', 0, 5),
(85, 'Biocarburant', 0, 5),
(86, 'Agencement, décoratio', 0, 45),
(87, 'Bâtiment préfabriqué', 0, 45),
(88, 'Construction métallique', 0, 45),
(89, 'Entreprise de construction de bâtiment', 0, 45),
(90, 'Génie civil', 0, 45),
(91, 'Gros-œuvre ', 0, 45),
(92, 'Menuiserie aluminium', 0, 45),
(93, 'Menuiserie bois', 0, 45),
(94, 'Piscine ', 0, 45),
(95, 'Porte, cloison amovible', 0, 45),
(96, 'Terrassement', 0, 45),
(97, 'Travaux tout corps d’état', 0, 45),
(98, 'Enseignes pour stand d\'exposition ', 0, 6),
(99, 'Hôtesses ', 0, 6),
(100, 'Location de salles pour mariage, fêtes,... ', 0, 6),
(101, 'Location de salles pour séminaire, réunion,... ', 0, 6),
(102, 'Location matériel et tentes', 0, 6),
(103, 'Organisation d\'événements ', 0, 6),
(104, 'Salons et conventions ', 0, 6),
(105, 'Services de traiteur ', 0, 6),
(106, 'Son et lumière', 0, 6),
(107, 'Formation continue ', 0, 7),
(108, 'Formation du soir', 0, 7),
(109, 'Formation extra-entreprise', 0, 7),
(110, 'Formation intra-entreprise', 0, 7),
(111, 'Formation langue ', 0, 7),
(112, 'Formation logiciel ', 0, 7),
(113, 'Formation professionnel', 0, 7),
(114, 'Formation vente et marketing', 0, 7),
(115, 'Brochures et catalogues ', 0, 8),
(116, 'Impression cartes de visite et papier à lettres ', 0, 8),
(117, 'Impression classeurs et boîtes de rangement ', 0, 8),
(118, 'Impression enveloppes ', 0, 8),
(119, 'Impression factures et formulaires ', 0, 8),
(120, 'Impression feuillets, dépliants et affiches ', 0, 8),
(121, 'Impression magazines, livres et journaux ', 0, 8),
(122, 'Impression rapports annuels ', 0, 8),
(123, 'Impression spéciale', 0, 8),
(124, 'Conseil informatique', 0, 9),
(125, 'Développement et intégration base de données', 0, 9),
(126, 'Développement, programmation logiciel ', 0, 9),
(127, 'Intégration et gestion de projet', 0, 9),
(128, 'Logiciel gestion CRM - SRM', 0, 9),
(129, 'Logiciel gestion documents ', 0, 9),
(130, 'Logiciel standard', 0, 9),
(131, 'Progiciel de gestion intégré (ERP) ', 0, 9),
(132, 'Services sécurité informatique', 0, 9),
(133, 'Création site web de présentation ', 0, 46),
(134, 'Création site web gestion et e-commerce ', 0, 46),
(135, 'Fournisseur d\'accès FAI ', 0, 46),
(136, 'Graphisme et animations web ', 0, 46),
(137, 'Hébergement sites web ', 0, 46),
(138, 'Marketing internet ', 0, 46),
(139, 'Réalisation de bannières ', 0, 46),
(140, 'Référencement moteur de recherche', 0, 46),
(141, 'Bacs de stockage et conteneurs ', 0, 11),
(142, 'Chariots élévateurs', 0, 11),
(143, 'Transpalette et Gerbeur', 0, 11),
(144, 'Entreposage ', 0, 11),
(145, 'Grues ', 0, 11),
(146, 'Palettes ', 0, 11),
(148, 'Achat / location de bases de données', 0, 12),
(149, 'Agence de marketing direct ', 0, 12),
(150, 'Agence de publicité ', 0, 12),
(151, 'Conseil vente et marketing ', 0, 12),
(152, 'Enseignes lumineuses et signalétique ', 0, 12),
(153, 'Mailing direct ', 0, 12),
(154, 'Rédaction de textes ', 0, 12),
(155, 'Relations presse', 0, 12),
(156, 'Télémarketing et Centres d\'appels', 0, 12),
(157, 'Aspirateur et cireuse', 0, 48),
(158, 'Chocolat et confiserie', 0, 48),
(159, 'Electroménager', 0, 48),
(160, 'Hi-fi', 0, 48),
(161, 'Literie, draps  ', 0, 48),
(162, 'Sonorisation et effet lumineux', 0, 48),
(163, 'Vêtement de travaille', 0, 48),
(164, 'Armoire et coffret', 0, 49),
(165, 'Automate programmable', 0, 49),
(166, 'Bobinage pour moteur électrique', 0, 49),
(167, 'Câble et fil électrique', 0, 49),
(168, 'Carte électronique', 0, 49),
(169, 'Composant d’automatisme pneumatique', 0, 49),
(170, 'Composant électronique', 0, 49),
(171, 'Composant et article hydraulique', 0, 49),
(172, 'Conception et installation d’automatisme', 0, 49),
(173, 'Disjoncteur, relais électrique', 0, 49),
(174, 'Transformateur électrique', 0, 49),
(177, 'Imprimantes ', 0, 9),
(179, 'Ordinateurs PC', 0, 9),
(180, 'PC portables ', 0, 9),
(181, 'Serveurs ', 0, 9),
(182, 'Support hardware', 0, 9),
(183, 'Carto', 0, 50),
(184, 'Encre', 0, 50),
(185, 'Machine', 0, 50),
(186, 'Papier', 0, 50),
(187, 'Audit environnemental', 0, 14),
(188, 'Gestion de déchèterie ', 0, 14),
(189, 'Gestion du nettoyage ', 0, 14),
(190, 'Matériel et produits de nettoyage ', 0, 14),
(191, 'Nettoyage & Environnement', 0, 14),
(192, 'Services de nettoyage', 0, 14),
(193, 'Concepteur de reportage vidéo ', 0, 15),
(194, 'Duplication de CD ou DVD ', 0, 15),
(195, 'Photographie ', 0, 15),
(196, 'Production spot radio ', 0, 15),
(197, 'Production vidéo présentation d\'entreprise', 0, 15),
(198, 'Production vidéo pour publicité ', 0, 15),
(199, 'Présentation CD ou DVD ', 0, 15),
(200, 'Streaming vidéo', 0, 15),
(201, 'Streaming vidéo', 0, 15),
(202, 'PLV', 0, 15),
(203, 'Affichage', 0, 15),
(204, 'Accessoire et équipement ', 0, 52),
(205, 'Entretien et maintenance', 0, 52),
(206, 'Pièce détaché pour moteur', 0, 52),
(207, 'Accessoire et équipement ', 0, 53),
(208, 'Entretien et maintenance', 0, 53),
(209, 'Pièce détaché pour moteur', 0, 53),
(210, 'Colorant pour matière plastique', 0, 54),
(211, 'Articles promotionnels ', 0, 16),
(212, 'Cadeaux d\'affaires ', 0, 16),
(213, 'Vêtements promotionnels', 0, 16),
(214, 'Architecture d\'intérieur ', 0, 18),
(215, 'Climatisation ', 0, 18),
(216, 'Construction générale ', 0, 18),
(217, 'Décoration intérieure ', 0, 18),
(218, 'Installation électrique ', 0, 18),
(219, 'Installations spéciales ', 0, 18),
(220, 'Peinture et rafraîchissement ', 0, 18),
(221, 'Rénovation  bâtiment', 0, 18),
(222, 'Sol et fondation ', 0, 18),
(223, 'Toit et isolation ', 0, 18),
(224, 'Tuyauterie et sanitaire', 0, 18),
(225, 'Intérim ', 0, 17),
(226, 'Gardiennage', 0, 17),
(227, 'Recrutement ', 0, 17),
(228, 'Relocation ', 0, 17),
(229, 'Alarme et appareil de surveillance', 0, 19),
(230, 'Antivol', 0, 19),
(231, 'Contrôle d’accès', 0, 19),
(232, 'Détection d’incendie', 0, 19),
(233, 'Gardiennage', 0, 19),
(234, 'Prévention contre le feu ', 0, 19),
(235, 'Surveillance vidéo ', 0, 19),
(236, 'Centraux téléphoniques', 0, 55),
(237, 'Câblage et réseaux ', 0, 55),
(238, 'Téléphonie VOIP ', 0, 55),
(239, 'Téléphonie mobile', 0, 55),
(240, 'Téléphonie Fixe', 0, 55),
(249, 'Billets d\'avion ', 0, 24),
(250, 'Location d\'autocars', 0, 24),
(251, 'Hôtel', 0, 24),
(252, 'Aciers de constructio', 0, 27),
(253, 'Agrafages – vulcanisatio', 0, 53),
(254, 'outillage', 0, 44),
(255, 'Appareils de mesure et de contrôle électrique', 0, 36),
(256, 'Location de véhicule utilitaire', 0, 56),
(257, 'Location de camio', 0, 56),
(258, 'VEHICULE UTILITAIRE', 0, 20),
(259, 'CAMIO', 0, 20),
(260, 'AUTOMOBILES', 0, 20),
(261, 'MINIBUS', 0, 20),
(262, 'FOURGONNETTES, FOURGONS', 0, 20),
(263, 'Transport National', 0, 57),
(264, 'Tansport International', 0, 57),
(265, 'Messagerie', 0, 57),
(266, 'Services de Coursiers', 0, 57),
(267, 'Déménagement', 0, 57),
(268, 'Matériel Informatique', 0, 9),
(269, 'Palettes', 0, 61),
(270, 'Rayonnage', 0, 11),
(271, 'Chariots élévateurs', 0, 62),
(272, 'Transpalettes', 0, 62),
(273, 'Gerbeurs', 0, 62),
(274, 'Ustensiles', 0, 48),
(275, 'Tables et chaises', 0, 48),
(276, 'Accessoires HCR', 0, 48),
(286, 'Industrie Mécanique', 0, 28),
(287, 'Manufactures', 0, 28),
(288, 'Chargeuses sur pneus', 0, 74),
(289, 'Chargeuses - pelleteuses', 0, 74),
(290, 'Pelles', 0, 74),
(291, 'Tombereaux articulés', 0, 74),
(292, 'Niveleuses', 0, 74),
(293, 'Finisseurs de routes', 0, 74),
(294, 'Raboteuses', 0, 74),
(295, 'Compacteurs', 0, 74),
(296, 'Froid et climatisatio', 0, 75),
(297, 'AUTRE', 0, 75),
(298, 'Accessoires', 0, 9),
(299, 'Entretien et réparatio', 0, 9),
(301, 'Ordinateurs Mac', 0, 9),
(306, 'Autre (à préciser sur le descriptif)', 0, 23),
(307, 'Sols', 0, 25),
(308, 'Mines', 0, 25),
(309, 'Carrière', 0, 25),
(311, 'Agro-industrie', 0, 26),
(312, 'Matériaux de construction ', 0, 27),
(313, 'Sidérurgie', 0, 29),
(314, 'Métallurgie', 0, 29),
(315, 'Industrie de transformatio', 0, 30),
(316, 'Energie', 0, 31),
(317, 'Electricité', 0, 31),
(319, 'Electronique', 0, 31),
(320, 'Environnement', 0, 32),
(321, 'Equipements', 0, 34),
(322, 'Infrastructures', 0, 34),
(323, 'Pétrole', 0, 35),
(324, 'Gaz', 0, 35),
(325, 'Chimie', 0, 37),
(326, 'Parachimie', 0, 37),
(327, 'Pharmacie', 0, 37),
(328, 'Santé', 0, 37),
(329, 'Architectes', 0, 40),
(330, 'Ascenseurs', 0, 41),
(331, 'Montes charges', 0, 41),
(332, 'Bureau d\'étude', 0, 43),
(333, 'Maintenance', 0, 47),
(334, 'Entretie', 0, 47),
(335, 'Plastiques', 0, 51),
(336, 'Caoutchouc', 0, 51),
(337, 'Dérivés de matières plastiques', 0, 51),
(338, 'Audit', 0, 58),
(339, 'Conseil', 0, 58),
(340, 'Chaudronerie', 0, 59),
(341, 'Charpente', 0, 60),
(342, 'Rayonnages', 0, 61),
(343, 'Peinture à huile', 0, 63),
(344, 'Colorant', 0, 63),
(345, 'Services de tranport', 0, 64),
(346, 'Agence immobilière', 0, 64),
(347, 'Agence de location de voiture', 0, 64),
(348, 'Sécurité', 0, 64),
(349, 'Nettoyage', 0, 64),
(350, 'Assistance', 0, 64),
(351, 'Dépannage', 0, 64),
(352, 'Bricolage', 0, 64),
(353, 'Matériel de manutentio', 0, 65),
(354, 'Outillage à mai', 0, 65),
(355, 'Expertise', 0, 67),
(356, 'Distributio', 0, 68),
(357, 'Place de marché', 0, 70),
(358, 'Autre', 0, 34),
(364, 'Autre', 0, 6),
(365, 'Autre', 0, 7),
(366, 'Autre', 0, 8),
(367, 'Autre', 0, 9),
(368, 'Autre', 0, 11),
(369, 'Autre', 0, 12),
(370, 'Autre', 0, 14),
(371, 'Autre', 0, 15),
(372, 'Autre', 0, 16),
(373, 'Autre', 0, 17),
(374, 'Autre', 0, 18),
(375, 'Autre', 0, 19),
(376, 'Autre', 0, 20),
(377, 'Autre', 0, 24),
(378, 'Autre', 0, 25),
(379, 'Autre', 0, 26),
(380, 'Autre', 0, 27),
(381, 'Autre', 0, 28),
(382, 'Autre', 0, 29),
(383, 'Autre', 0, 30),
(384, 'Autre', 0, 32),
(385, 'Autre', 0, 36),
(386, 'Autre', 0, 37),
(387, 'Autre', 0, 38),
(388, 'Autre', 0, 39),
(389, 'Autre', 0, 40),
(390, 'Autre', 0, 41),
(391, 'Autre', 0, 42),
(392, 'Autre', 0, 43),
(393, 'Autre', 0, 44),
(394, 'Autre', 0, 45),
(395, 'Autre', 0, 46),
(396, 'Autre', 0, 48),
(397, 'Autre', 0, 49),
(398, 'Autre', 0, 50),
(399, 'Autre', 0, 51),
(400, 'Autre', 0, 52),
(401, 'Autre', 0, 53),
(402, 'Autre', 0, 54),
(403, 'Autre', 0, 55),
(404, 'Autre', 0, 56),
(405, 'Autre', 0, 57),
(406, 'Autre', 0, 58),
(407, 'Autre', 0, 59),
(408, 'Autre', 0, 60),
(409, 'Autre', 0, 61),
(410, 'Autre', 0, 62),
(411, 'Autre', 0, 63),
(412, 'Autre', 0, 64),
(413, 'Autre', 0, 65),
(414, 'Autre', 0, 67),
(415, 'Autre', 0, 68),
(416, 'Autre', 0, 70),
(417, 'Autre', 0, 74),
(418, 'Centre commercial', 0, 78),
(419, 'Université', 0, 79),
(420, 'Logiciel', 0, 11),
(421, 'Machine et Equipement', 0, 4),
(422, 'testt_deleted-422', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `adresse1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codepostal` int(11) DEFAULT NULL,
  `phone` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `isactif` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:simple_array)',
  `password_change_date` int(11) DEFAULT NULL,
  `parent1` int(11) DEFAULT NULL,
  `confirmation_token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `redirect` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `adresse1`, `adresse2`, `codepostal`, `phone`, `email`, `password`, `del`, `isactif`, `created`, `first_name`, `last_name`, `username`, `discr`, `roles`, `password_change_date`, `parent1`, `confirmation_token`, `avatar_id`, `redirect`) VALUES
(1, '36, rue imam al boukhari maarif', 'HAY EL KHAIR_2', 20370, '+212696318051', 'webmasster@3findustrie.com', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 1, 1, '2019-08-05 17:01:48', 'YOUNESS', 'ARBOUH', 'unessami', 'Admin', 'ROLE_ADMIN', 1565020062, NULL, 'ljmRxc&Jmrgox3ZYugIYQiSzqheC4N', 1, '/dashboard'),
(2, 'HAY EL KHAIRàà', 'HAY EL KHAIR', 26000, '+212696318051', 'youness.arbouh1s@gmail.com', '$2y$13$uXkilBRFzlnwOFN7VHPkXucJ1Iz3R1IoLSvAsec3pnJlitBXcpYee', 0, 1, '2019-08-05 17:16:12', 'firstAcheteur', 'lastAcheteur', 'acheteur', 'Acheteur', 'ROLE_ACHETEUR', 1565020457, NULL, 'E.4rYgkSwxyIdaEBZpeXHmS&WON44t', 1, '/dashboard_ac'),
(3, 'HAY EL KHAIRoo', 'HAY EL KHAIRoo', 2600, '+212696318051', 'youness.arbouh1@gmail.com', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 0, 1, '2019-08-05 17:21:18', 'firstFournisseur', 'lastfrns', 'frsnora', 'Fournisseur', 'ROLE_FOURNISSEUR', 1565021174, NULL, 'mpTGWY.Z9OjHTGSgCwV7apEqapombk', 1, '/dashboard_fr'),
(4, 'HAY EL KHA22IR', 'cmrsoia cmrsoi2a', 2622820, '+212696318051', 'youness.arbouh4@gmail.com', '$2y$13$D5ucNPg0F4x3NASOS4VYgOPcbK.jT6aW4nmMn42ZBadntqFSZFM1W', 0, 1, '2019-08-05 17:30:47', 'cmrsoia2222', 'cmrsoi2a2223', 'cmrsoia22222d', 'ZoneCommercial', 'ROLE_ZONE', 1565078960, 1, 'HnmaGHUOcAiIecY01yyGKTw@pDugWR', 1, ''),
(5, 'HAY EL 00', 'HAY EL 11', 26400, '+212696318051', 'youness.arbouh5@gmail.com_deleted-5', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 1, 0, '2019-08-05 17:32:07', 'Commerc_107', 'Commerciale_107', 'cmrciale_107_deleted-5', 'ZoneCommercial', 'ROLE_ZONE', 1565079056, 1, 'mZiQL@&239srr1aa95P&EuJwWCNZfP', 1, ''),
(6, 'HAY EL KHAIRqqq1', 'HAY EL qqqqqqqqq1', 26600, '+212696318051', 'youness.arbouh6@gmail.com', '$2y$13$.kjXEmyAnYvRpqhuqKC7te0B2PKlt7aCKkwgIt.IhJbUKnkXbIBHe', 0, 1, '2019-08-05 17:38:54', 'Commerc_2', 'Commerciale_2', 'cmrciale_2', 'Commercial', 'ROLE_COMMERCIAL', NULL, 1, 'MPsPbG9uMXgReM4P66K0zBgW7cxW&g', 31, ''),
(7, 'HAY EL KHAIRqsdfsdfsdfsdqq1', 'HAY EL qqqqqsdfqqqq1', 266100, '+212696318051', 'youness.arbouh7@gmail.com', '$2y$13$sRp0FwPwQD5Y6zCCp5IQjOQzOXvvrP5UgP8r4wfB2/cU8EXYiJfmW', 0, 0, '2019-08-05 17:40:05', 'Commerciale', 'Commerciale_ok', 'cmrciale_chaalali', 'Commercial', 'ROLE_COMMERCIAL', NULL, 1, 'Q8GJ@OVh@&7F.q5EjZ02Yp7wPb9HBp', 1, ''),
(8, 'HAY EL KHAIR1', 'kkkkkkkkkkkkkkk', 260500, '+212696318051', 'youness.arbouh155@gmail.com', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 0, 1, '2019-08-05 18:09:07', '', 'Fournisseur31', '', 'Fournisseur', 'ROLE_FOURNISSEUR', 1565021584, NULL, 'P806FKQ4mSULMT3qhqwNdr8aomwqeV', 1, ''),
(9, 'HAY EL KHA22IR', 'cmrsoia cmrsoi2a', 2622820, '+212696318051', 'youness.arbouh81@gmail.com', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 0, 1, '2019-08-06 09:57:42', 'cmrsoia2222', 'cmrsoi2a2223', 'cmrsoia22222', 'Commercial', 'ROLE_COMMERCIAL', NULL, 5, 'cgmFMjrz4HE41YOihJyJgXWEp7Jh8w', 1, ''),
(10, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'youness.arbouh55@gmail.com', '$2y$13$H./PWBuS/z5G4Zb2vnhUUeecSGafd4WpT6HOKJdB2aLajgV2sV57q', 0, 1, '2019-08-06 10:59:17', 'YOUNESS', 'ARBOUH', 'unessami1253', 'Admin', 'ROLE_ADMIN', 1569857840, NULL, 'lcL6@PnSmZRYWhJ0iWbX8cygti4tnj', 26, '/dashboard'),
(11, 'aaaaaa', NULL, 110055, '+212696318051', 'youness.aaaaa_deleted-11', '$2y$13$EZRR7o1ht29aWb3gr4L23ucEZ1HBcEeeTmm2zf9WayviOR/rVg4xa', 1, 0, '2019-08-06 17:06:31', 'aaaaaaaa', 'aaaaaa', 'aaaaaa_deleted-11', 'Admin', 'ROLE_ADMIN', NULL, NULL, 'iUXeb8wKsOdjYEcnnxQHOGWzexX4mt', NULL, ''),
(13, 'aaaaaa', 'aaaafff', 110055, '+212696318051', 'youness.arbouh@live.fr', '$2y$13$gUXUfjhomFDca0DFfLkD1eOiYBIYiaB8ld059Ci2SOFNWAfR4kjlS', 1, 1, '2019-08-06 17:15:05', 'aaaaaaa', 'aaaaaaa', 'aaaaaa', 'Fournisseur', 'ROLE_FOURNISSEUR', 1565104755, NULL, NULL, NULL, ''),
(17, 'aaaaaa', 'aaaafff', 110055, '+212696318051', 'youness.arbouh465@gmail.com', '$2y$13$uXkilBRFzlnwOFN7VHPkXucJ1Iz3R1IoLSvAsec3pnJlitBXcpYee', 0, 1, '2019-08-06 17:47:54', 'aaaaaaa', 'aaaaaaa', 'aaa4aaa', 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, 'kwEdkaiENyv4UWckDWZrZWHi&RFvav', NULL, ''),
(18, 'aaaaaa', 'aaaafff', 110055, '+212696318051', 'youness.arbouh2@live.fr', '$2y$13$uXkilBRFzlnwOFN7VHPkXucJ1Iz3R1IoLSvAsec3pnJlitBXcpYee', 0, 1, '2019-08-06 17:53:34', 'aaaaaaa', 'aaaaaaa', 'unessamgi14123', 'Acheteur', 'ROLE_ACHETEUR', 1565106931, NULL, NULL, NULL, ''),
(19, 'aaaaaa', 'aaaafff', 110055, '+212696318051', 'youness.arbouh23@live.fr_deleted-19', '$2y$13$CVWGvj.HTHQ.LgONjkrRieX/cy4U4TV.4mCmX5PoiJ8lsVLoktP0.', 1, 1, '2019-08-06 18:02:19', 'aaaaaaa', 'aaaaaaa', 'unessami112253_deleted-19', 'Commercial', 'ROLE_COMMERCIAL', 1565107563, 5, '3jUhm.8ew9bTX9sfufis&F8QWFm0DA', NULL, ''),
(20, 'aaaaaa', 'aaaafff', 110055, '+212696318051', 'youness.arbouh235@live.fr', '$2y$13$TB.uAeFymkMWG7EIuCHFPux4QPVDLgK5P9rEht59OjdraDWLi5Lju', 1, 0, '2019-08-06 18:10:06', 'aaaaaaa', 'aaaaaaa', 'unessami1123', 'ZoneCommercial', 'ROLE_ZONE', 1565108105, 10, 'OfGWTzltXV4ILr1uDMLHmiwu4.&VaS', NULL, ''),
(21, 'aaaaaa', 'aaaafff', 110055, '+212696318051', 'youness.arbouh23s5@live.fr', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 0, 0, '2019-08-06 18:16:42', 'aaaaaaa', 'aaaaaaa', 'unessamgi1123', 'Admin', 'ROLE_ADMIN', 1565108326, NULL, 'o.szT3OMtJbESI4JMcP1j0v0nXRI8U', 27, ''),
(22, 'string', 'string', 44774, '+212696318051', 'yooooo.aaaaa@gggg.ccc', '$2y$13$liU0naR4WW2dCeykm0i8CudqR7oK2.NUN3VEt7Zlk8enWbaAJY52S', 0, 0, '2019-10-14 18:23:20', 'straaaaaing', 'ssssss', 'aaaassaa', 'Admin', 'ROLE_ADMIN', 1571070349, NULL, '0VsOPg2Vq4z6X5C.Ry0Z52x&sxnats', NULL, '/dashboard'),
(23, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'webmaster@3findustrie.com_deleted-23', '$2y$13$YzQdVbAs7qYZEGdi9OFaRO7GwIQJmtE2/VW7oOWmXJzDmUQ3.thi2', 1, 1, '2019-10-15 18:52:10', 'YOUNESS', 'ARBOUH', 'youness.arbouh55@gmail.com_deleted-23', 'Admin', 'ROLE_ADMIN', NULL, NULL, 'Az3Hg9qUqiKpMiBBA2AX&ps8CPczND', NULL, '/dashboard'),
(24, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'wejjster@3findustrie.com', '$2y$13$g3yC6CnuoIaq3RGCLNDjguCNwMUc/knmtgRIozNiannjlmS/gcQqq', 0, 1, '2019-10-16 16:03:29', 'YOUNESS', 'ARBOUH', 'youness.arbouh55', 'ZoneCommercial', 'ROLE_ZONE', NULL, NULL, 'f@NPKNRa9P2O0YBvbATeATAL958fuW', 19, '/dashboard_zc'),
(25, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'webmasterd@3findustrie.com', '$2y$13$e37Nvp/D2Apz9e39ZOgGCe7eKc5Plx3/F6mtTYsxhclhOptF0T1W2', 0, 1, '2019-10-17 16:10:07', 'YOUNESS', 'ARBOUH', 'youness.arbouh5', 'ZoneCommercial', 'ROLE_ZONE', NULL, NULL, 'IDUClPZHBdgIvY20KLZZYhxK@KLLw9', 25, '/dashboard_zc'),
(26, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'webmastder@3findustrie.com_deleted-26', '$2y$13$RYyEg0ynyszBfDpWS/0pW./OYeTPio/Oc2xC1hkU6e/BwGwn03jqu', 1, 1, '2019-10-17 17:08:35', 'YOUNESS', 'ARBOUH', 'youness.ard_deleted-26', 'Admin', 'ROLE_ADMIN', NULL, NULL, '68AhfRTqAzBXaTntSyZjiYeIAYjEU9', 29, '/dashboard'),
(27, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'webmastezzr@3findustrie.com_deleted-27', '$2y$13$MhdQRTZUeTh3dHgCpv3t3um40upICaxR5jauWSWmgZloE2e1h5Q3i', 1, 1, '2019-10-17 17:47:50', 'YOUNESS', 'ARBOUH', 'Youness.arzzzbo2_deleted-27', 'Admin', 'ROLE_ADMIN', NULL, NULL, 'f49VMWNa.YOKfVUItweIQaQup85hdi', 30, '/dashboard'),
(28, 'abeereer', 'string', 26000, '+212696318051', 'youness.arbouh4566456@gmail.com', '$2y$13$UcBuzb3iaPdeZ6SR8pcqg.7UEBvT9fM49d2NWW7W00ZBv.z.cbld2', 0, 1, '2019-10-28 15:15:33', 'abeereer', 'abeereer', 'abeereer', 'Acheteur', 'ROLE_ACHETEUR', NULL, 6, NULL, 1, '/dashboard_ac'),
(29, 'abeereer', 'string', 26000, '+212696318051', 'youness.arbohhuh@gmail.com', '$2y$13$t2CFetfIhT2r/dLmQrtuh.BQdK9TpVa/oVKBhsTBklL37aLoaxtQ2', 0, 0, '2019-10-29 12:40:38', 'abeereer', 'abeereer', 'abeereher', 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'F@CzvAYmGhG@EdLTPfpXAdReXgDX@o', 1, '/dashboard_ac'),
(30, 'abeereer', 'string', 26000, '+212696318051', 'youness.arbohshuh@gmail.com', '$2y$13$pQupxbncAVpGoOF.z7LklOHYcUfDFUPjW3gvKVbfriehIb2tuPegu', 0, 0, '2019-10-29 14:36:28', 'abeereer', 'abeereer', 'abeerehesr', 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'v2VOtg5JToCjjDqDev6Qv.pjLMSIZ&', 1, '/dashboard_ac'),
(31, 'abeereer', 'string', 26000, '+212696318051', 'youness.arboshshuh@gmail.com', '$2y$13$pXDV6Oy2rYuK6JFpjoAzHeWeXt9e6CPYgHLyC4QeWJRgCzfsXA0tS', 0, 0, '2019-10-29 14:37:39', 'abeereer', 'abeereer', 'abeerehessr', 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'HsYYJwngtOEoR.ZqSyCQAYgHC&OO2f', 1, '/dashboard_ac'),
(32, 'abeereer', 'string', 26000, '+212696318051', 'youness.arbosghshuh@gmail.com', '$2y$13$X9RfDpZLTfWYkZXVtgLXHO4HmwCBQl7HtAaCiRVYfoj3b5QYJx9cu', 0, 0, '2019-10-29 14:38:33', 'abeereer', 'abeereer', 'abeerehgessr', 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'Qy@YDMNCKdl50jeX8maTfaBaluv@kz', 1, '/dashboard_ac'),
(33, 'abeereer', 'string', 26000, '+212696318051', 'youness.arbosgshshuh@gmail.com', '$2y$13$8o6Y8DOCYECs7u68l9kcw.eueewtgMv90zW7ruBkKNV2mcqIj677e', 0, 0, '2019-10-29 14:42:16', 'abeereer', 'abeereer', 'abeerehsdgessr', 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'LvUC@F3kQkytroO7lBg3wFBueSGQoM', 1, '/dashboard_ac'),
(34, 'abeereer', 'string', 26000, '+212696318051', 'youness.arbosgshsgghuh@gmail.com', '$2y$13$tWZyvFkDKfMVALkLl0XmYuhTvFZW272h8eOHKLaiCs95wdVRWDvZi', 0, 0, '2019-10-29 14:45:09', 'abeereer', 'abeereer', 'abeerehsdghgessr', 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'Vd7vagmV8WVFdC1Sz@CHotSgR3z.Hs', 1, '/dashboard_ac'),
(35, NULL, NULL, NULL, '+212696318051', 'youness.arbosg4shsgghuh@gmail.com', '$2y$13$oVfZ0G7a2aLDofWMViC0Rum17Ni8zdgExElXYkeB64ag5ne8r0J6S', 0, 0, '2019-10-29 14:52:16', 'abeereer', 'abeereer', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'T2JRdH1okgCM4riqFYeYnD.gnygBIi', NULL, '/dashboard_ac'),
(36, NULL, NULL, NULL, '+212696318051', 'youness.arbosg4shsg1ghuh@gmail.com', '$2y$13$v/zaXlzzkm.EH7yTRhhi6.RJxnKSjyQTKg5uEYpPjd2mH87YHMvO6', 0, 0, '2019-10-29 14:56:40', 'abeereer', 'abeereer', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'j4R6IYOebtSdteLkcu2lh4G6ytZwBN', NULL, '/dashboard_ac'),
(37, NULL, NULL, NULL, '+212696318051', 'youness.arbosg4shsg1g12huh@gmail.com', '$2y$13$NuqMwxsJByhvLGvpyEIwLeQCmvdJHkNYBqMIl1VK7H0q2H28JtFom', 0, 0, '2019-10-29 14:57:57', 'abeereer', 'abeereer', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'wJORuyueHHDmko5tMeo7Czd.mWxfUH', NULL, '/dashboard_ac'),
(38, NULL, NULL, NULL, '+212696318051', 'youness.arbouh5@gmail.com', '$2y$13$7OAwDLWuGc27JwUuAM8R.uwMhB5U/59jmNG8eZ/xZvGFlZZ9LJv6.', 0, 0, '2019-10-29 16:52:40', 'ARBOUH', 'Youness', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'ABJnt6@m2EPjHE9yTyLHBFv57bs2hP', NULL, '/dashboard_ac'),
(39, NULL, NULL, NULL, '0622124578', 'youness.arbouhdf@gmail.com', '$2y$13$hytegz9Iz0jXkOrkx87TPunWkUpVt9qMgVBwzwm85EV1dmh.YZSWK', 0, 0, '2019-10-30 09:31:59', 'ARBOUH', 'Youness', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'FpbiZg8q&I&OOFR1wYN7O@8.T2ZMqm', NULL, '/dashboard_ac'),
(40, NULL, NULL, NULL, '0622124578f', 'youness.arboufhdf@gmail.com', '$2y$13$lhLYSq2MCR97uIb6jHkWA.pWi.Ze7cdicmfCELIG0bbTcJ11PzCoG', 0, 0, '2019-10-30 09:32:27', 'ARBOUH', 'Youness', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'aAvyk4DWR4LxT6BUbwYaZhBFHJ8Aom', NULL, '/dashboard_ac'),
(41, NULL, NULL, NULL, '0622331144s', 'youness.arboufh4df@gmail.com', '$2y$13$06As/1//z7wUEu95.RsX1.fOhqkASUQWFVVeoyye9vv4Y9MJPoJ1W', 0, 0, '2019-10-30 09:34:35', 'ARBOUH', 'Youness', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'alLiFnntgtqNEp8HJPr0O2fHgSJb@r', NULL, '/dashboard_ac'),
(42, NULL, NULL, NULL, 'b0622331144', 'youness.arbocufh4df@gmail.com', '$2y$13$QoSpdJFjsDGaucLj1k7ed.KMeRtfyHTeIOug.DS0JljhCtFAQjdlm', 0, 0, '2019-10-30 09:34:49', 'ARBOUH', 'Youness', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'd5R5Ue97i3.QtL&yLia6RGvWM.FCxZ', NULL, '/dashboard_ac'),
(43, NULL, NULL, NULL, '0696318051', 'youness.arbouh5d5@gmail.com', '$2y$13$2QGhNMmEBbgQLTnewIV9Auv/hUJNTojwq2DCD7jvHVRSWuAuxuWu2', 0, 0, '2019-10-30 17:39:15', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, '@uenxyu3qTUJynpX1G455JnRXBdMNb', NULL, '/dashboard_ac'),
(44, NULL, NULL, NULL, '0696318051', 'youness.arbouh5sdd5@gmail.com', '$2y$13$htiGoQ7iMs9uLZdDcIKhH.h6j9.TdoL4sTkqo5SHugeRm8Sd5Td1C', 0, 0, '2019-10-30 17:40:45', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'nta19&pQ8RULdlFbaWFObmOem.JxcD', NULL, '/dashboard_ac'),
(45, NULL, NULL, NULL, '0696318051', 'youness.arbouh551@gmail.com', '$2y$13$k74aCKb7NkwFzM8GoAr85ejVQTa2aC8qAVQYWopq2R1oJu2C/1pm2', 0, 0, '2019-10-30 17:49:08', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, '0bAbId.LqhtZsp6QhueR7u5pDg3Cx4', NULL, '/dashboard_ac'),
(46, NULL, NULL, NULL, '0696318051', 'youness.arbouhiu55@gmail.com', '$2y$13$pK2.IJLEpUzWstL3UirnF.WGUkxbTRoQK58FOY8DrCwJWtMI8tldK', 0, 0, '2019-10-30 17:50:35', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'CNf2P8uZh6QRn9Fe9Jmj@Zqb8XX.jr', NULL, '/dashboard_ac'),
(47, NULL, NULL, NULL, '0696318051', 'youness.arbouh5665@gmail.com', '$2y$13$fIB4YWQ/lbqMbn4p5xteTOo9g2iT.1.z2o826SOvE12dVOUM/BYjq', 0, 0, '2019-10-30 17:53:21', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'pPl0W2BLXDpmHP@evJcFqpOaugxjnp', NULL, '/dashboard_ac'),
(48, NULL, NULL, NULL, '0696318051', 'youness.arbouh5ss5@gmail.com', '$2y$13$51iq0L6Z9SMcXaRIsvlPlukCsZPAHyO3PhLhgEAWdVs7suHTiA4DW', 0, 0, '2019-10-30 17:54:46', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'vG99MxBxa.nlLLOtSCD1d8wlskB52t', NULL, '/dashboard_ac'),
(49, NULL, NULL, NULL, '0696318051', 'youness.arbouh55ff@gmail.com', '$2y$13$hA.IlVTPhxnAjR/4F4rvOuZwd80eruRdASxg4O/5TRAOe1QSTtyCq', 0, 0, '2019-10-30 18:04:36', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'xHpEQzXs&fMK@08jF7WSAPG1Xyuy4H', NULL, '/dashboard_ac'),
(50, NULL, NULL, NULL, '0696318051', 'youness.arbouhsdsds@gmail.com', '$2y$13$mvfJH1lakO0IofkSPn3xPuYrz9Gxtf9S8Wr/AE3hZ4TXtVRwI0YbC', 0, 0, '2019-10-30 18:05:35', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'juYNj0SpheW&gJRIx8TRgEI8hmU4&y', NULL, '/dashboard_ac'),
(51, NULL, NULL, NULL, '0696318051', 'youness.arbouh12@gmail.com', '$2y$13$jrjFZ1K7z3M.OzVDyDSKA.a/McHPxzDqA0ZjkwRFE54I4hBzfHm2a', 0, 0, '2019-10-31 09:46:18', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, 'oF0kqtXb66134Yb2uYhM5rZoOECC&h', NULL, '/dashboard_fr'),
(52, NULL, NULL, NULL, '0696318051', 'youness.arbouh555@gmail.com', '$2y$13$cfS6na4wnF3DCJvnfL9Do.7jndbFgTgYTbfbiB/bGJBDO2c6yBqGW', 0, 0, '2019-10-31 09:49:11', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, 'tmpnLcnyB0HL9T88wzxc@bNvPshgrH', NULL, '/dashboard_fr'),
(53, NULL, NULL, NULL, '0696318051', 'youness.arbouhqdfqf@gmail.com', '$2y$13$6L5blmVWdhzyE2sdOzRwMegfwgbmmhuxrLHlX7DLTvRqep6wimgcO', 0, 0, '2019-10-31 10:00:14', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, '23fPoHQ12UwuHUcfiJUCazoy9II8ij', NULL, '/dashboard_fr'),
(54, NULL, NULL, NULL, '0696318051', 'youness.arbouhl@gmail.com', '$2y$13$yKWxA8j2kPboSJu6bTq3XuqGaaXPSDGv2H930EQ5v.PnsZw9wbhUq', 0, 1, '2019-10-31 10:05:28', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, '24&HH3wyjaneayetvBnbexirsdfsdKD&s0N', NULL, '/register/step2'),
(55, NULL, NULL, NULL, '0696318051', 'youness.arbouhqsdsd@gmail.com', '$2y$13$tpYPAkjgPVewskLHOFCNg.1pdwScFdGaIHlJERHWm8x0BSF3rqvJ6', 0, 1, '2019-10-31 12:14:51', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard_fr'),
(56, NULL, NULL, NULL, '0696318051', 'youness.arbouhxcvxcv@gmail.com', '$2y$13$0U7UEnwF2iXRjwWicDnA5.lkAT5xdMFRJl.MrmEjMr9HczfVf2ozC', 0, 1, '2019-10-31 12:16:40', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/register/step2'),
(57, NULL, NULL, NULL, '0696318051', 'youness.arbouhkkl@gmail.com', '$2y$13$Gc8Tsg49aAfWTFZ3B.IaxeOzLeGiG1pPmqnrj6.L0xwjgEapwzotO', 0, 1, '2019-10-31 12:21:45', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/register/step2'),
(58, NULL, NULL, NULL, '0696318051', 'youness.arbouh5sss5@gmail.com', '$2y$13$d1l.y50a.SpfvjVCdfhS5Oj/jN1b03gRRKx8A3tv62Ie06eM00DIC', 0, 0, '2019-10-31 12:23:05', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, 'H7rLvJqTgELcsTP2kiuTI.9hkRuEPU', NULL, '/register/step2'),
(59, NULL, NULL, NULL, '0696318051', 'youness.arbouhdfdf@gmail.com', '$2y$13$vxiZp6R54paCNbz2EzEG2OPIz2a9Oz/kF.F/HWJbnQxJZ9VvhoYli', 0, 1, '2019-10-31 12:26:05', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/register/step2'),
(60, NULL, NULL, NULL, '0696318051', 'youness.arboutyth@gmail.com', '$2y$13$O8Mne.hFXglWwLPDwyL.NOe7EoaXD00ZsuVFW2KNeE1UJHtxOXNHq', 0, 1, '2019-10-31 14:31:40', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/register/step2'),
(61, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'it.3findustrie@gmail.com', '$2y$13$BQ6beK.SmtMTTCiO42q09OiiLdwnYU7CKVp0wknshFTrrZptKSt7W', 0, 1, '2019-10-31 15:16:00', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(62, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhljcd@gmail.com', '$2y$13$iJEJStfF7cd12UaW72v0auAzHPP.zTPhOGcA4FzJMfa2phWifxqla', 0, 1, '2019-11-01 16:34:41', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/register/step3'),
(63, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbodfsfsdfsdfuh@gmail.com', '$2y$13$.gE2tS39CEzPJr29U8Zfc.a.cmnToMA..vazl7Qni7TwprYpvdth.', 0, 1, '2019-11-01 16:39:29', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/register/step3'),
(64, '36, rue imam al boukhari maarif', 'youness.arbouh55@gmail.com', NULL, '0696318051', 'youness.arbouhdfdfdf@gmail.com', '$2y$13$MTha1LuCim6J6JpmIYCsNOqVUa7ydwgJDNUePlqmSPGbbaBovA7NC', 0, 1, '2019-11-01 16:43:10', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(65, '36, rue imam al boukhari maarif', 'HAY EL KHAIR_21', NULL, '0696318051', 'youness.asdsdsdsdrbouh@gmail.com', '$2y$13$3LsoRp.wt2x4Yl5FYoNw4OTZ.XWi.6z.IShIkbeK1EaO0iM3aa3J.', 0, 1, '2019-11-01 16:46:52', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(66, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouh12s@gmail.com', '$2y$13$eAq2AlDCVUcB9gzZA5J6BuZBT55fwO4OOivrHabTzEFAQQlyT7tgO', 0, 1, '2019-11-01 16:51:04', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(67, '36, RUE IMAM AL BOUKHARI MAARIF', '', NULL, '+212661355218', 'webmaster@lesachatsindustriels.com', '$2y$13$Xnhn/wvI8jzjbjjfGCE3Aea7IW3YGW2B9uCPCYBPgCo.dpBrrbFS2', 0, 1, '2019-11-04 11:03:22', 'Younes', 'HALOUI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(68, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhdf@gmail.com', '$2y$13$U86NTGZtfq708W56jTUF4O5p1BNRqBpZxRPRF29KMzBzqBIxaU.sG', 0, 1, '2019-11-05 10:03:35', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(69, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhgh@gmail.com', '$2y$13$tjXGiJD./0qq6aGSbBUiou8VfMfV5cO3PvbzYXPwo.wVxMZB9AfX.', 0, 1, '2019-11-05 10:42:39', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(70, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhcc@gmail.com', '$2y$13$L/7EhA8GTglr6gRniYhdA.SVZlozETjA5Fnllj5mBuhRTDbMxdq8W', 0, 1, '2019-11-05 10:46:13', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(71, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhsd@gmail.com', '$2y$13$14HI/1V4MUyTFoLxZn76iuOOkgHSYPIk6kv9G0TQjF1F4lnzLwiNK', 0, 1, '2019-11-05 11:04:11', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(72, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhdfg@gmail.com', '$2y$13$Rs/FDPO.vKtbYKE5gzNdl.R1ANygr/23DkGQuuLDIaUqhb5RibHVm', 0, 1, '2019-11-05 11:09:13', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(73, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arboullllllllllh@gmail.com', '$2y$13$uCucAmjImgBX7VNOVHBfWuXsAgDra9E7Spg2h.o0zjlSxlMUBXcke', 0, 1, '2019-11-05 11:11:44', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(74, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhjikjlkl@gmail.com', '$2y$13$gG.Dj.Lpn/m9JPNKtUpcbeZDjA2HCecBOAJaRnqCNDoEaD0MLxAYe', 0, 1, '2019-11-05 12:40:28', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(75, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhssscq@gmail.com', '$2y$13$XtHRg8ztNRAFMlDoO2UEVuTCuIirNUToCSSlQMo.N2j/1PMAbllgy', 0, 1, '2019-11-05 15:38:55', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(76, '36, rue i2', 'adresse ee 23', 26000, '0696318051', 'youness.arbouh@gmail.com', '$2y$13$T7KXkmI59DJgTD0yBavZq.z/1zBtMRSTTAP62O9XbXhrI4qczjJhm', 0, 1, '2019-11-07 09:30:02', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', 1574433080, NULL, NULL, 36, '/dashboard');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `name`, `pays_id`, `del`) VALUES
(1, 'Casablanca', 1, 0),
(2, 'Rabat', 1, 0),
(5, 'Fès', 1, 0),
(6, 'Meknes', 1, 0),
(7, 'Tanger', 1, 0),
(8, 'Oujda', 1, 0),
(9, 'Kenitra', 1, 0),
(10, 'Sale', 1, 0),
(11, 'Ifrane', 1, 0),
(12, 'Marrakech', 1, 0),
(13, 'Agadir', 1, 0),
(14, 'Safi', 1, 0),
(15, 'Settat', 1, 0),
(16, 'Tetoua', 1, 0),
(17, 'Dakhla', 1, 0),
(19, 'Azilal', 1, 0),
(20, 'Berkane', 1, 0),
(21, 'Nador', 1, 0),
(22, 'Hoceïma', 1, 0),
(23, 'Berrechid', 1, 0),
(25, 'Temara', 1, 0),
(26, 'Khouribga', 1, 0),
(27, 'Beni Mellal', 1, 0),
(28, 'Guelmim', 1, 0),
(29, 'Tétoua', 1, 0),
(30, 'Assila', 1, 0),
(31, 'Mohammadia', 1, 0),
(32, 'Bouskoura', 1, 0),
(33, 'Paris', 2, 0),
(34, 'El jadida', 1, 0),
(35, 'Chefchaoue', 1, 0),
(40, 'California', 5, 0),
(41, 'Ouezzane', 1, 0),
(42, 'Ris-Orangis', 2, 0),
(43, 'Wasselonne', 2, 0),
(44, 'Charleroi', 17, 0),
(46, 'Berne', 59, 0),
(47, 'Shanghai', 22, 0),
(48, 'Valladolid', 32, 0),
(49, 'Saragosse', 32, 0),
(50, 'Sainte-Florence', 2, 0),
(51, 'Valls', 32, 0),
(52, 'Brive-la-Gaillarde', 2, 0),
(53, 'Albolote', 32, 0),
(54, 'Oullins', 2, 0),
(55, 'Alger', 11, 0),
(56, 'Sidi Addi', 1, 0),
(57, 'Balma', 2, 0),
(58, 'Oulad Teïma', 1, 0),
(59, 'Mary-sur-Marne', 2, 0),
(60, 'Mions', 2, 0),
(62, 'La Ciotat', 2, 0),
(63, 'Abidja', 66, 0),
(64, 'Caissargues', 2, 0),
(65, 'Gargas', 2, 0),
(66, 'Villejust', 2, 0),
(67, 'Yutz', 2, 0),
(68, 'Chambéry', 2, 0),
(69, 'Le Mans', 2, 0),
(70, 'Gif-sur-Yvette', 2, 0),
(71, 'Arnas', 2, 0),
(72, 'Had Soualem', 1, 0),
(73, 'Caromb', 2, 0),
(74, 'Rumilly', 2, 0),
(75, 'Bursa', 62, 0),
(76, 'Neuilly-Plaisance', 2, 0),
(77, 'Versailles', 2, 0),
(78, 'Santo Ángel', 32, 0),
(79, 'Séville', 32, 0),
(80, 'Boujdour', 1, 0),
(81, 'Roubaix', 2, 0),
(82, 'Neuilly-sur-Seine', 2, 0),
(83, 'Caraglio', 3, 0),
(84, 'Prouvy', 2, 0),
(85, 'Nouaceur', 1, 0),
(86, 'Cugand', 2, 0),
(87, 'Aït Melloul', 1, 0),
(89, 'Ceno', 2, 0),
(90, 'Canto', 22, 0),
(92, 'Guimarães', 52, 0),
(93, 'Frans', 2, 0),
(97, 'Prešov', 84, 0),
(98, 'Laâyoune', 1, 0),
(101, 'Londres', 55, 0),
(102, 'Soisy-sous-Montmore', 2, 0),
(103, 'Bamako', 7, 0),
(104, 'Cotonou', 88, 0),
(105, 'Saint-Laurent-du-Var', 2, 0),
(106, 'Clervaux', 90, 0),
(107, 'Suntec', 57, 0),
(108, 'Sarcedo', 3, 0),
(109, 'Ludhiana', 37, 0),
(110, 'Conakry', 91, 0),
(111, 'khenifra', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `zone_commercial`
--

CREATE TABLE `zone_commercial` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `zone_commercial`
--

INSERT INTO `zone_commercial` (`id`) VALUES
(4),
(5),
(20),
(24),
(25);

-- --------------------------------------------------------

--
-- Structure de la table `zone_commercial_pays`
--

CREATE TABLE `zone_commercial_pays` (
  `zone_commercial_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `zone_commercial_pays`
--

INSERT INTO `zone_commercial_pays` (`zone_commercial_id`, `pays_id`) VALUES
(4, 1),
(20, 1),
(24, 1),
(25, 1),
(4, 2),
(5, 2),
(24, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_304AFF9DA6E44244` (`pays_id`),
  ADD KEY `IDX_304AFF9DA73F0036` (`ville_id`),
  ADD KEY `IDX_304AFF9DFC8B6C6C` (`parent2`),
  ADD KEY `IDX_304AFF9D9F7E4405` (`secteur_id`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `attachement`
--
ALTER TABLE `attachement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `black_listes`
--
ALTER TABLE `black_listes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F6456D1C670C757F` (`fournisseur_id`),
  ADD KEY `IDX_F6456D1C96A7BB5F` (`acheteur_id`);

--
-- Index pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commercial_ville`
--
ALTER TABLE `commercial_ville`
  ADD PRIMARY KEY (`ville_id`,`commercial_id`),
  ADD KEY `IDX_6CBDDBE27854071C` (`commercial_id`),
  ADD KEY `IDX_6CBDDBE2A73F0036` (`ville_id`);

--
-- Index pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D077077F96A7BB5F` (`acheteur_id`),
  ADD KEY `search_idx` (`statut`);

--
-- Index pour la table `demande_achat_attachement`
--
ALTER TABLE `demande_achat_attachement`
  ADD PRIMARY KEY (`demande_achat_id`,`attachement_id`),
  ADD KEY `IDX_B1D67F41B8CC98D5` (`demande_achat_id`),
  ADD KEY `IDX_B1D67F41A05591E0` (`attachement_id`);

--
-- Index pour la table `demande_ha_sous_secteur`
--
ALTER TABLE `demande_ha_sous_secteur`
  ADD PRIMARY KEY (`sous_secteur_id`,`demande_achat_id`),
  ADD KEY `IDX_457CE2F8790611EF` (`sous_secteur_id`),
  ADD KEY `IDX_457CE2F8B8CC98D5` (`demande_achat_id`);

--
-- Index pour la table `diffusion_demande`
--
ALTER TABLE `diffusion_demande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_65C68FFF670C757F` (`fournisseur_id`),
  ADD KEY `IDX_65C68FFF80E95E18` (`demande_id`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_369ECA32A6E44244` (`pays_id`),
  ADD KEY `IDX_369ECA32A73F0036` (`ville_id`);

--
-- Index pour la table `fournisseur_sous_secteur`
--
ALTER TABLE `fournisseur_sous_secteur`
  ADD PRIMARY KEY (`sous_secteur_id`,`fournisseur_id`),
  ADD KEY `IDX_CA2D7FC3670C757F` (`fournisseur_id`),
  ADD KEY `IDX_CA2D7FC3790611EF` (`sous_secteur_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A34C5D529F7E4405` (`secteur_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D93D64965823DD6` (`parent1`),
  ADD KEY `IDX_8D93D64986383B10` (`avatar_id`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_43C3D9C3A6E44244` (`pays_id`);

--
-- Index pour la table `zone_commercial`
--
ALTER TABLE `zone_commercial`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `zone_commercial_pays`
--
ALTER TABLE `zone_commercial_pays`
  ADD PRIMARY KEY (`pays_id`,`zone_commercial_id`),
  ADD KEY `IDX_723D3B09675444E0` (`zone_commercial_id`),
  ADD KEY `IDX_723D3B09A6E44244` (`pays_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `attachement`
--
ALTER TABLE `attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT pour la table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `black_listes`
--
ALTER TABLE `black_listes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `diffusion_demande`
--
ALTER TABLE `diffusion_demande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `FK_304AFF9D9F7E4405` FOREIGN KEY (`secteur_id`) REFERENCES `secteur` (`id`),
  ADD CONSTRAINT `FK_304AFF9DA6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_304AFF9DA73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_304AFF9DBF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_304AFF9DFC8B6C6C` FOREIGN KEY (`parent2`) REFERENCES `acheteur` (`id`);

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK_880E0D76BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `black_listes`
--
ALTER TABLE `black_listes`
  ADD CONSTRAINT `FK_F6456D1C670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_F6456D1C96A7BB5F` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`);

--
-- Contraintes pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD CONSTRAINT `FK_7653F3AEBF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commercial_ville`
--
ALTER TABLE `commercial_ville`
  ADD CONSTRAINT `FK_6CBDDBE27854071C` FOREIGN KEY (`commercial_id`) REFERENCES `commercial` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6CBDDBE2A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  ADD CONSTRAINT `FK_D077077F96A7BB5F` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`);

--
-- Contraintes pour la table `demande_achat_attachement`
--
ALTER TABLE `demande_achat_attachement`
  ADD CONSTRAINT `FK_B1D67F41A05591E0` FOREIGN KEY (`attachement_id`) REFERENCES `attachement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B1D67F41B8CC98D5` FOREIGN KEY (`demande_achat_id`) REFERENCES `demande_achat` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `demande_ha_sous_secteur`
--
ALTER TABLE `demande_ha_sous_secteur`
  ADD CONSTRAINT `FK_457CE2F8790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_457CE2F8B8CC98D5` FOREIGN KEY (`demande_achat_id`) REFERENCES `demande_achat` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `diffusion_demande`
--
ALTER TABLE `diffusion_demande`
  ADD CONSTRAINT `FK_65C68FFF670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_65C68FFF80E95E18` FOREIGN KEY (`demande_id`) REFERENCES `demande_achat` (`id`);

--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `FK_369ECA32A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_369ECA32A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_369ECA32BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fournisseur_sous_secteur`
--
ALTER TABLE `fournisseur_sous_secteur`
  ADD CONSTRAINT `FK_CA2D7FC3670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CA2D7FC3790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  ADD CONSTRAINT `FK_A34C5D529F7E4405` FOREIGN KEY (`secteur_id`) REFERENCES `secteur` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64965823DD6` FOREIGN KEY (`parent1`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_8D93D64986383B10` FOREIGN KEY (`avatar_id`) REFERENCES `avatar` (`id`);

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `FK_43C3D9C3A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);

--
-- Contraintes pour la table `zone_commercial`
--
ALTER TABLE `zone_commercial`
  ADD CONSTRAINT `FK_56B2E04EBF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `zone_commercial_pays`
--
ALTER TABLE `zone_commercial_pays`
  ADD CONSTRAINT `FK_723D3B09675444E0` FOREIGN KEY (`zone_commercial_id`) REFERENCES `zone_commercial` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_723D3B09A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

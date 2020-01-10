-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 10 jan. 2020 à 18:02
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
-- Structure de la table `abonnement`
--

CREATE TABLE `abonnement` (
  `id` int(11) NOT NULL,
  `offre_id` int(11) DEFAULT NULL,
  `demande_id` int(11) DEFAULT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `commercial_id` int(11) DEFAULT NULL,
  `mode_id` int(11) DEFAULT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `prix` double NOT NULL,
  `created` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `date_peiment` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `abonnement_sous_secteur`
--

CREATE TABLE `abonnement_sous_secteur` (
  `abonnement_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `secteur_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `pays_id`, `ville_id`, `societe`, `parent2`, `civilite`, `ice`, `fix`, `website`, `description`, `secteur_id`, `currency_id`) VALUES
(2, 1, 1, '', NULL, '', '', '', '', '', NULL, NULL),
(18, 1, 1, 'ArasElect', NULL, '', '', '', '', '', NULL, NULL),
(28, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL, NULL),
(29, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL, NULL),
(30, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL, NULL),
(31, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL, NULL),
(32, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL, NULL),
(33, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL, NULL),
(34, 1, 1, 'Testi', NULL, 'M', '123456789101254', '0696318521', 'www.aaaaaaaa.fr', 'string', NULL, NULL),
(35, NULL, NULL, 'Testi', NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL),
(36, NULL, NULL, 'Testi', NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL),
(37, NULL, NULL, 'Testi', NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL),
(38, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(39, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(43, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(45, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(47, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(48, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(49, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(50, NULL, NULL, '3f industrie', NULL, 'M.', NULL, NULL, NULL, NULL, NULL, NULL),
(68, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1, NULL),
(69, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1, NULL),
(70, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1, NULL),
(71, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1, NULL),
(72, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1, NULL),
(73, 1, 2, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 1, NULL),
(74, 2, 33, '3f industrie', NULL, 'M.', NULL, '', '', '', 1, NULL),
(76, 1, 1, '1244n', NULL, 'M.', '123456676102145', '0622201475', 'https://www.d.fr0', 'skkkkkkkkkkk2', 3, NULL),
(77, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', 'https://www.d.com', '', 1, NULL),
(80, 1, 1, '7e-sky', NULL, 'M.', '123456789123456', '', '', '', 1, 1);

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
(93, '5dd64f89534cc912135849.doc', 83456, 'application/msword'),
(94, '5de5359013251332921903.png', 38731, 'image/png'),
(95, '5de53e446ccae223568061.jpg', 8864, 'image/jpeg'),
(96, '5de54252e58e5216591597.jpg', 119505, 'image/jpeg'),
(97, '5de617c114ee1045765045.jpg', 8864, 'image/jpeg'),
(98, '5defcfc15ca5a335415375.jpg', 8864, 'image/jpeg'),
(99, '5dfb2dd925054548052461.pdf', 143935, 'application/pdf');

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
(36, '5dd7fd413f5d6763820939.jpg'),
(37, '5de7b82c30b16184376461.jpg'),
(38, '5dea1b68181f5676822270.png'),
(39, '5df88e2de0727067647954.PNG'),
(40, '5e01ce4eaa860033725161.png');

-- --------------------------------------------------------

--
-- Structure de la table `black_listes`
--

CREATE TABLE `black_listes` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `raison` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `acheteur_id` int(11) DEFAULT NULL,
  `deblacklister` datetime DEFAULT NULL,
  `etat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `black_listes`
--

INSERT INTO `black_listes` (`id`, `fournisseur_id`, `raison`, `created`, `acheteur_id`, `deblacklister`, `etat`) VALUES
(51, 75, '1-makantfahmouch \n2-its okey', '2019-11-21 09:23:05', 76, '2019-12-11 10:09:42', 0),
(53, 64, 'okey okey', '2019-12-09 11:24:23', 76, '2019-12-11 10:16:19', 0),
(54, 65, '000000000', '2019-12-11 10:25:22', 76, NULL, 1),
(55, 63, 'aaaaaaaaaaaa', '2019-12-13 11:11:11', 76, NULL, 1);

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
-- Structure de la table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `currency`
--

INSERT INTO `currency` (`id`, `currency`, `del`) VALUES
(1, 'EUR', 0),
(2, 'USD', 0),
(3, 'JPY', 0),
(4, 'GPB', 0),
(5, 'CAD', 0),
(6, 'AUD', 0),
(7, 'INR', 0),
(8, 'NZD', 0),
(9, 'CHF', 0),
(10, 'ZAR', 0),
(11, 'DHS', 0),
(12, '.', 0);

-- --------------------------------------------------------

--
-- Structure de la table `demande_abonnement`
--

CREATE TABLE `demande_abonnement` (
  `id` int(11) NOT NULL,
  `offre_id` int(11) DEFAULT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `commercial_id` int(11) DEFAULT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `mode_id` int(11) DEFAULT NULL,
  `duree_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_abonnement`
--

INSERT INTO `demande_abonnement` (`id`, `offre_id`, `fournisseur_id`, `zone_id`, `commercial_id`, `reference`, `statut`, `created`, `mode_id`, `duree_id`) VALUES
(14, 1, 75, 5, 9, '2020-14', 0, '2020-01-08 11:01:39', 1, NULL),
(15, 1, 75, 5, 9, '2020-2', 0, '2020-01-08 11:58:59', 1, NULL),
(16, 1, 75, 5, 9, '2020-3', 0, '2020-01-08 12:09:53', 1, NULL),
(17, 1, 75, 5, 9, '2020-4', 0, '2020-01-08 17:11:02', 1, NULL),
(18, 1, 75, 5, 9, '2020-5', 0, '2020-01-08 17:13:46', 1, NULL),
(19, 1, 75, 5, 9, '2020-6', 0, '2020-01-08 17:14:32', 1, NULL),
(20, 3, 75, 5, 9, '2020-7', 1, '2020-01-08 17:39:38', 1, NULL),
(21, 1, 75, 5, 9, '2020-8', 0, '2020-01-10 11:22:55', 1, 2),
(22, 2, 75, 5, 9, '2020-9', 0, '2020-01-10 11:24:23', 1, 2),
(23, 3, 75, 5, 9, '2020-10', 0, '2020-01-10 11:28:09', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `demande_achat`
--

CREATE TABLE `demande_achat` (
  `id` int(11) NOT NULL,
  `acheteur_id` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_expiration` datetime NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `nbr_visite` int(11) DEFAULT NULL,
  `nbr_share` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `date_modification` datetime NOT NULL,
  `is_alerted` tinyint(1) NOT NULL,
  `is_anonyme` tinyint(1) NOT NULL,
  `budget` double NOT NULL,
  `del` tinyint(1) NOT NULL,
  `motif_rejet_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_achat`
--

INSERT INTO `demande_achat` (`id`, `acheteur_id`, `statut`, `reference`, `description`, `date_expiration`, `is_public`, `nbr_visite`, `nbr_share`, `created`, `date_modification`, `is_alerted`, `is_anonyme`, `budget`, `del`, `motif_rejet_id`, `currency_id`) VALUES
(2, 76, 1, 'aaaaa0q', 'azertyuioppok', '2019-11-30 23:03:00', 1, 0, 5, '2019-11-25 08:03:25', '2019-11-28 14:00:30', 1, 0, 25132, 0, NULL, 1),
(3, 76, 0, 'qdqdsqsd', 'azqsdazeqd', '2019-11-26 08:03:00', 1, 0, 0, '2019-11-26 17:04:17', '2019-11-14 17:10:38', 0, 0, 11555, 0, NULL, 11),
(4, 76, 0, 'test', 'aji tfhel achno fhemt', '2019-11-30 12:20:00', 1, 0, 0, '2019-11-28 12:21:21', '2019-11-28 12:21:21', 0, 0, 5000, 0, NULL, 5),
(5, 76, 0, 'test2', 'mmmmmmmmmm', '2019-11-30 12:21:00', 1, 0, 0, '2019-11-28 12:22:21', '2019-11-28 12:22:21', 0, 0, 1, 0, NULL, 5),
(6, 76, 1, 'aaaaa0', 'testtttttt', '2019-12-25 16:53:00', 1, 0, 0, '2019-12-02 16:53:55', '2019-12-02 16:53:55', 0, 0, 251101, 0, NULL, 9),
(7, 76, 1, 'aaaaa0sqd', 'azazeaqsdqq', '2019-12-24 17:01:00', 1, 0, 0, '2019-12-02 17:01:26', '2019-12-02 17:11:10', 0, 0, 10001, 0, NULL, 5),
(8, 76, 0, 'abcde5', 'qsqdqsdqqqaq5', '2020-01-09 17:01:00', 1, 0, 0, '2019-12-02 17:01:50', '2019-12-10 18:05:29', 0, 1, 20199.5025, 1, NULL, 5),
(9, 76, 1, 'qqqqqq', 'azertyuuuuu', '2019-12-25 17:02:00', 1, 0, 0, '2019-12-02 17:02:29', '2019-12-02 18:05:53', 0, 0, 5000, 0, NULL, 1),
(10, 76, 1, '102454', 'azertyuopaja', '2019-12-25 09:06:00', 1, 0, 0, '2019-12-03 09:07:34', '2019-12-10 11:45:15', 0, 1, 500000.55, 0, NULL, 11),
(11, 76, 1, 'aaaaa', 'aaaaaaaaaaaaaaaa', '2019-12-09 09:07:00', 1, 0, 0, '2019-12-03 09:08:03', '2019-12-06 17:35:52', 1, 0, 8888886, 0, NULL, 6),
(12, 76, 1, 'azqs', 'azertyuiuu', '2019-12-18 09:08:00', 1, 0, 0, '2019-12-03 09:08:27', '2019-12-03 09:25:41', 0, 0, 12447, 0, NULL, 4),
(13, 76, 0, 'En attente', 'azertyuuuuuu', '2019-12-31 16:35:00', 1, 0, 0, '2019-12-10 16:36:25', '2019-12-10 18:03:17', 0, 0, 201588.55, 1, NULL, 9),
(14, 76, 1, '2019-8', 'azerty yyyyy', '2019-12-29 17:06:00', 1, 0, 0, '2019-12-10 17:07:28', '2019-12-10 18:01:56', 0, 0, 250.55, 0, NULL, 5),
(15, 76, 1, '2019-10', 'teeeeeeeeeeeeeeestj', '2019-12-30 18:02:00', 1, 0, 0, '2019-12-10 18:03:05', '2019-12-19 08:59:36', 1, 0, 5000.51, 0, NULL, 11),
(16, 76, 0, '2019-9', 'aaaaaaaaaaaaa', '2019-12-31 18:03:00', 0, 0, 0, '2019-12-10 18:04:03', '2020-01-08 20:09:01', 0, 0, 255.25, 0, NULL, 11),
(17, 80, 1, '2019-11', 'teeeeeeeeeeeeest', '2019-12-25 11:39:00', 1, 0, 0, '2019-12-17 11:40:50', '2019-12-17 12:01:38', 0, 0, 20000.5, 0, NULL, 9),
(18, 80, 1, '2019-12', 'c\'est tjrs pour le test222', '2019-12-27 18:17:00', 1, 1, 0, '2019-12-17 12:19:49', '2019-12-19 08:58:16', 1, 0, 25000, 0, NULL, 1);

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
(2, 86),
(3, 85),
(9, 94),
(9, 95),
(9, 96),
(10, 97),
(15, 98),
(15, 99);

-- --------------------------------------------------------

--
-- Structure de la table `demande_devis`
--

CREATE TABLE `demande_devis` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `societe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `del` tinyint(1) NOT NULL,
  `date_validation` datetime DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_devis`
--

INSERT INTO `demande_devis` (`id`, `produit_id`, `contact`, `societe`, `phone`, `email`, `message`, `created`, `adresse`, `statut`, `del`, `date_validation`, `quantity`, `fournisseur_id`, `is_read`, `date_read`) VALUES
(9, 1, 'Mehdi', 'Sergh', '+212696318010', 'yon@gmail.com', 'i want this product', '2019-12-30 11:31:38', 'Hay hassani n18 casablanca', 1, 1, '2019-12-31 15:16:28', 0, 75, 1, '2019-12-31 15:10:16'),
(10, 8, 'Mehdi', 'Sergh', '+212696318010', 'yon@gmail.com', 'i want this product', '2019-12-30 11:48:52', 'Hay hassani n18 casablanca', 1, 0, '2019-12-30 11:58:09', 0, 57, 0, NULL),
(11, 1, 'Mehdi', 'Sergh', '+212696318010', 'yon@gmail.com', 'i want this product', '2019-12-30 12:06:19', 'Hay hassani n18 casablanca', 1, 1, '2019-12-30 12:08:57', 0, 75, 0, NULL),
(12, 1, 'Me3d', 'Se3d', '+212696318010', 'yon@gmail.com', 'i want this product', '2019-12-30 12:16:20', 'Hay hassani n18 casablanca', 0, 1, NULL, 0, 75, 0, NULL),
(13, 1, 'Me3ss', 'Se3ss', '+212696318010', 'yoness@gmail.com', 'i want this productrrrrrrrrs', '2019-12-30 12:22:22', 'Hay hassani n18 casablancas', 1, 0, '2019-12-31 08:52:51', 4, 75, 1, '2019-12-31 15:00:56');

-- --------------------------------------------------------

--
-- Structure de la table `demande_dmdabonnement_sous_secteur`
--

CREATE TABLE `demande_dmdabonnement_sous_secteur` (
  `demande_abonnement_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_dmdabonnement_sous_secteur`
--

INSERT INTO `demande_dmdabonnement_sous_secteur` (`demande_abonnement_id`, `sous_secteur_id`) VALUES
(14, 6),
(14, 9),
(15, 6),
(16, 6),
(16, 7),
(17, 6),
(18, 6),
(18, 7),
(18, 8),
(18, 9),
(18, 10),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(20, 6),
(20, 7),
(21, 6),
(21, 7),
(22, 6),
(22, 7),
(23, 6),
(23, 9);

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
(6, 2),
(6, 4),
(6, 6),
(6, 8),
(6, 10),
(6, 13),
(6, 14),
(6, 16),
(6, 17),
(6, 18),
(7, 3),
(7, 5),
(7, 7),
(7, 9),
(7, 15),
(7, 18),
(8, 4),
(8, 10),
(8, 14),
(8, 15),
(9, 11),
(10, 12);

-- --------------------------------------------------------

--
-- Structure de la table `demande_jeton`
--

CREATE TABLE `demande_jeton` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `nbr_jeton` smallint(6) NOT NULL,
  `is_use` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_jeton`
--

INSERT INTO `demande_jeton` (`id`, `fournisseur_id`, `nbr_jeton`, `is_use`, `created`) VALUES
(1, 75, 10, 1, '2019-12-11 15:48:03'),
(2, 75, 20, 1, '2019-12-11 15:58:37'),
(3, 75, 20, 1, '2019-12-11 15:58:37'),
(4, 75, 20, 1, '2019-12-11 15:58:37'),
(5, 75, 20, 1, '2019-12-11 15:58:37'),
(10, 75, 20, 1, '2019-12-11 15:58:37'),
(11, 75, 20, 1, '2019-12-11 15:58:37'),
(12, 75, 20, 1, '2019-12-11 15:58:37'),
(13, 75, 20, 1, '2019-12-11 15:58:37'),
(14, 75, 20, 1, '2019-12-11 15:58:37'),
(15, 75, 20, 1, '2019-12-11 15:58:37'),
(16, 75, 20, 1, '2019-12-11 15:58:37'),
(17, 75, 20, 1, '2019-12-11 15:58:37'),
(19, 75, 20, 1, '2019-12-11 15:58:37'),
(20, 75, 10, 0, '2019-12-11 15:58:37'),
(21, 75, 20, 0, '2019-12-11 15:58:37'),
(22, 75, 20, 0, '2019-12-11 15:58:37'),
(23, 75, 20, 0, '2019-12-11 15:58:37'),
(24, 75, 20, 0, '2019-12-11 15:58:37'),
(25, 75, 20, 0, '2019-12-11 15:58:37'),
(26, 75, 20, 0, '2019-12-11 15:58:37'),
(27, 75, 20, 0, '2019-12-11 15:58:37'),
(28, 75, 20, 0, '2019-12-11 15:58:37'),
(29, 75, 20, 0, '2019-12-11 15:58:37'),
(30, 75, 20, 1, '2019-12-12 15:58:37'),
(31, 53, 20, 1, '2019-12-12 16:58:37'),
(32, 75, 20, 1, '2019-12-16 10:22:33'),
(33, 78, 20, 0, '2019-12-17 09:20:30');

-- --------------------------------------------------------

--
-- Structure de la table `detail_visite`
--

CREATE TABLE `detail_visite` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `demande_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `date_rec` datetime NOT NULL,
  `is_send` tinyint(1) NOT NULL,
  `budget` double NOT NULL,
  `statut` smallint(6) NOT NULL,
  `personnel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `detail_visite`
--

INSERT INTO `detail_visite` (`id`, `fournisseur_id`, `demande_id`, `created`, `date_rec`, `is_send`, `budget`, `statut`, `personnel_id`) VALUES
(1, 75, 3, '2019-12-02 10:50:01', '2019-12-02 10:50:02', 1, 7000000, 2, NULL),
(2, 75, 2, '2019-12-02 10:50:23', '2019-12-02 10:50:24', 1, 289018, 2, NULL),
(3, 75, 16, '2019-11-16 17:11:40', '2019-12-23 17:11:40', 0, 255.25, 1, 3),
(4, 75, 15, '2019-12-16 17:14:50', '2019-12-23 17:14:50', 0, 5000.54, 1, 3),
(8, 75, 9, '2019-12-16 17:30:16', '2019-12-23 17:30:16', 0, 122200.5, 1, 3),
(9, 75, 18, '2019-12-24 15:51:00', '2019-12-31 15:51:00', 0, 257300, 1, NULL);

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
(90, 67, 2, '2019-11-15 16:49:35'),
(91, 64, 11, '2019-12-06 17:35:52'),
(92, 65, 11, '2019-12-06 17:35:52'),
(93, 66, 11, '2019-12-06 17:35:52'),
(94, 67, 11, '2019-12-06 17:35:52'),
(95, 61, 18, '2019-12-19 08:50:12'),
(96, 64, 18, '2019-12-19 08:50:12'),
(97, 65, 18, '2019-12-19 08:50:12'),
(98, 66, 18, '2019-12-19 08:50:12'),
(99, 67, 18, '2019-12-19 08:50:12'),
(100, 75, 18, '2019-12-19 08:50:12'),
(101, 78, 18, '2019-12-19 08:50:12'),
(102, 61, 18, '2019-12-19 08:56:33'),
(103, 64, 18, '2019-12-19 08:56:33'),
(104, 65, 18, '2019-12-19 08:56:33'),
(105, 66, 18, '2019-12-19 08:56:33'),
(106, 67, 18, '2019-12-19 08:56:33'),
(107, 75, 18, '2019-12-19 08:56:33'),
(108, 78, 18, '2019-12-19 08:56:33'),
(109, 61, 18, '2019-12-19 08:58:17'),
(110, 64, 18, '2019-12-19 08:58:17'),
(111, 65, 18, '2019-12-19 08:58:17'),
(112, 66, 18, '2019-12-19 08:58:17'),
(113, 67, 18, '2019-12-19 08:58:17'),
(114, 75, 18, '2019-12-19 08:58:17'),
(115, 78, 18, '2019-12-19 08:58:17'),
(116, 61, 15, '2019-12-19 08:59:36'),
(117, 64, 15, '2019-12-19 08:59:36'),
(118, 75, 15, '2019-12-19 08:59:36'),
(119, 78, 15, '2019-12-19 08:59:36'),
(120, 67, 15, '2019-12-19 08:59:36');

-- --------------------------------------------------------

--
-- Structure de la table `duree`
--

CREATE TABLE `duree` (
  `id` int(11) NOT NULL,
  `name` smallint(6) NOT NULL,
  `remise` smallint(6) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `duree`
--

INSERT INTO `duree` (`id`, `name`, `remise`, `created`) VALUES
(1, 12, 0, '2020-01-10 09:43:41'),
(2, 24, 20, '2020-01-10 09:43:51');

-- --------------------------------------------------------

--
-- Structure de la table `fiche`
--

CREATE TABLE `fiche` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fiche`
--

INSERT INTO `fiche` (`id`, `url`, `file_size`, `type`) VALUES
(1, '5de7ba8d1d1ab366562345.doc', 83456, 'application/msword'),
(2, '5de90d909277b147797610.pdf', 143935, 'application/pdf'),
(3, '5de90dcf19b75059484436.png', 38731, 'image/png'),
(4, '5de90e517f04b944921937.jpg', 8864, 'image/jpeg'),
(6, '5de90e8a9d88d482672869.jpg', 8864, 'image/jpeg'),
(8, '5de90f6faf7ae563104404.pdf', 143935, 'application/pdf'),
(9, '5de90fb4d11ee013565933.pdf', 143935, 'application/pdf'),
(10, '5de9105c8fbe7835227044.pdf', 143935, 'application/pdf'),
(11, '5de91079f31b9803979874.pdf', 143935, 'application/pdf'),
(12, '5de910c6cccfd865714410.pdf', 143935, 'application/pdf'),
(13, '5de91538cf3a1775715736.pdf', 143935, 'application/pdf'),
(14, '5de91f17c1bbc561116568.pdf', 143935, 'application/pdf'),
(15, '5e0b6b417db6f728632627.pdf', 143935, 'application/pdf');

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
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `pays_id`, `ville_id`, `societe`, `civilite`, `ice`, `fix`, `website`, `description`, `currency_id`) VALUES
(3, 2, 1, '', '', '', '', '', '', NULL),
(8, 2, 2, '', '', '', '', '', '', NULL),
(13, 1, 1, '', '', '', '', '', '', NULL),
(17, 1, 1, '', '', '', '', '', '', NULL),
(51, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(52, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(53, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(54, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(55, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(56, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(57, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(58, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(59, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(60, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL),
(61, 1, 1, '3f industriee', 'M.', '123456789123456', '', '', '', NULL),
(62, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', '', NULL),
(63, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', '', NULL),
(64, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', 'aaaaaaaaaaaaaaaaaaaaaaaaa', NULL),
(65, 1, 1, '3f industrie', 'M.', '123456789123456', '+212522963180', 'https://www.d.c', '', NULL),
(66, 1, 2, '3f industrie', 'M.', '123456789123456', '', '', '', NULL),
(67, 1, 15, '3F Industrie', 'M.', '001531606000066', '0696318051', '', '', NULL),
(75, 1, 1, '3f industrie2', 'M.', '123456789123456', '0523547812', 'http://www.3fi.com', '', 11),
(78, 1, 2, '7e-sky', 'M.', '123456789123456', '', 'https://www.d.com', '', NULL),
(79, NULL, NULL, '7e-sky', 'M.', NULL, NULL, NULL, NULL, NULL),
(81, 1, 1, '3f industrie', 'M.', '123456789123456', '', '', '', 1);

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
(78, 6),
(81, 6),
(61, 7),
(64, 7),
(75, 7),
(78, 7),
(81, 7),
(61, 8),
(65, 8),
(67, 8),
(75, 8),
(81, 8),
(64, 9),
(65, 9),
(66, 9),
(67, 9),
(75, 9),
(75, 10),
(75, 11),
(75, 12),
(75, 13),
(75, 14),
(75, 15),
(75, 16),
(75, 18),
(75, 19),
(75, 20),
(75, 21),
(75, 22),
(75, 23),
(75, 24),
(67, 142),
(67, 270),
(81, 270);

-- --------------------------------------------------------

--
-- Structure de la table `historique_visite`
--

CREATE TABLE `historique_visite` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `demande_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `historique_visite`
--

INSERT INTO `historique_visite` (`id`, `fournisseur_id`, `demande_id`, `created`) VALUES
(1, 75, 18, '2019-12-23 10:22:00'),
(2, 56, 17, '2019-12-23 10:47:57'),
(3, 75, 16, '2019-12-23 10:48:34'),
(5, 67, 15, '2019-12-23 11:08:27'),
(7, 52, 15, '2019-12-23 11:08:27'),
(8, 75, 15, '2019-12-23 14:45:46'),
(9, 51, 10, '2019-12-23 11:08:27'),
(10, 3, 15, '0000-00-00 00:00:00'),
(11, 8, 15, '0000-00-00 00:00:00'),
(12, 13, 15, '0000-00-00 00:00:00'),
(13, 17, 15, '0000-00-00 00:00:00'),
(14, 51, 15, '0000-00-00 00:00:00'),
(15, 3, 18, '2019-12-23 10:22:00'),
(16, 8, 18, '2019-12-23 10:22:00'),
(17, 13, 18, '2019-12-23 10:22:00'),
(18, 17, 18, '2019-12-23 10:22:00'),
(19, 51, 18, '2019-12-23 10:22:00'),
(20, 52, 18, '2019-12-23 10:22:00'),
(21, 55, 18, '2019-12-23 10:22:00'),
(22, 54, 18, '2019-12-23 10:22:00'),
(23, 55, 18, '2019-12-23 10:22:00'),
(24, 75, 17, '2019-12-23 10:47:57'),
(25, 75, 14, '2019-12-23 15:11:13'),
(26, 75, 11, '2019-12-23 15:11:21'),
(27, 75, 10, '2019-12-23 15:11:36'),
(28, 75, 9, '2019-12-23 15:14:55'),
(30, 75, 6, '2019-12-23 15:48:39'),
(31, 78, 17, '2019-12-24 08:57:15'),
(32, 81, 18, '2019-12-24 09:36:36'),
(33, 81, 17, '2019-12-24 10:12:25'),
(34, 75, 7, '2019-12-24 17:24:14');

-- --------------------------------------------------------

--
-- Structure de la table `image_produit`
--

CREATE TABLE `image_produit` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image_produit`
--

INSERT INTO `image_produit` (`id`, `url`) VALUES
(1, '5de7ba78c8b88456413076.jpg'),
(2, '5de8d8bff09b3195675862.jpg'),
(3, '5de8d8ff41cbc701720058.png'),
(4, '5de8d94125199683447386.jpg'),
(5, '5de8d9489cbb0055108313.jpg'),
(6, '5de8d94cb15ce861482956.jpg'),
(7, '5de8d9508171a778718273.jpg'),
(8, '5de8d95464168380366332.png'),
(9, '5de8d95838ef7746389193.jpg'),
(10, '5de8d95c99a63672653092.jpg'),
(11, '5de8d986cb0d0650802756.jpg'),
(12, '5de8d9cea815f152662161.jpg'),
(13, '5de8da1ccabd2268788537.jpg'),
(14, '5de8da25281b6483115902.png'),
(15, '5de8da302d1e2545162858.jpg'),
(16, '5de8da3c0fd87743469761.png'),
(17, '5de8da3f13efe307942283.jpg'),
(18, '5de8dbc089850037382546.jpg'),
(19, '5de8dbee2ce0a098098736.jpg'),
(20, '5de8dc018c750579949309.jpg'),
(21, '5de8dc1e67e46410831978.jpg'),
(22, '5de8dc79177cf126264438.jpg'),
(23, '5de8dc7dd1a1b440262562.png'),
(25, '5de8dca8b515b029588841.png'),
(26, '5de8dcae3eaaf445763012.jpg'),
(27, '5de8e2ba236e2033272105.jpg'),
(28, '5de8e2bd20cc7243501542.png'),
(29, '5de8e308ae963435083351.jpg'),
(30, '5de8e30cd565c689245790.png'),
(31, '5de8e36c47e9c110534280.jpg'),
(32, '5de8e370360b0645355459.png'),
(33, '5de8e4fe133c8650442489.jpg'),
(34, '5de8e501a7ca2957855790.png'),
(35, '5de8e5049fc27565885299.jpg'),
(36, '5de8e507a8651488970123.png'),
(37, '5de8e50ac4003967237893.jpg'),
(42, '5de908e06821a065765064.png'),
(43, '5de90f688ef6f219955375.jpg'),
(44, '5de90fb9bcd5d524573955.jpg'),
(45, '5de91082ec613433490143.jpg'),
(46, '5de910caa3dcd273411931.jpg'),
(47, '5de91531d04d2181711964.jpg'),
(48, '5dfcadf848ab3447082428.png'),
(49, '5e0b6b38551e1055853678.jpg'),
(50, '5e0b6b3bcbe81174258244.png');

-- --------------------------------------------------------

--
-- Structure de la table `jeton`
--

CREATE TABLE `jeton` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `paiement_id` int(11) DEFAULT NULL,
  `demande_id` int(11) DEFAULT NULL,
  `nbr_jeton` smallint(6) NOT NULL,
  `prix` double NOT NULL,
  `is_payed` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jeton`
--

INSERT INTO `jeton` (`id`, `fournisseur_id`, `paiement_id`, `demande_id`, `nbr_jeton`, `prix`, `is_payed`, `created`, `del`) VALUES
(18, 75, 1, 32, 6, 2000, 1, '2019-12-16 10:38:50', 0);

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
('20191114155657', '2019-11-14 15:57:01'),
('20191202094120', '2019-12-02 09:41:45'),
('20191204111630', '2019-12-04 11:16:36'),
('20191204140113', '2019-12-04 14:01:22'),
('20191204162047', '2019-12-04 16:20:52'),
('20191205084551', '2019-12-05 08:45:57'),
('20191205100305', '2019-12-05 10:03:10'),
('20191205114029', '2019-12-05 11:40:35'),
('20191205135951', '2019-12-05 13:59:59'),
('20191209093107', '2019-12-09 09:31:23'),
('20191209133716', '2019-12-09 13:37:21'),
('20191209133851', '2019-12-09 13:38:56'),
('20191209135255', '2019-12-09 13:53:00'),
('20191209144353', '2019-12-09 14:43:58'),
('20191210084603', '2019-12-10 08:46:09'),
('20191210094646', '2019-12-10 09:46:56'),
('20191210095429', '2019-12-10 09:54:33'),
('20191210153813', '2019-12-10 15:38:18'),
('20191211084148', '2019-12-11 08:42:03'),
('20191211084940', '2019-12-11 08:49:44'),
('20191211141704', '2019-12-11 14:17:08'),
('20191211143624', '2019-12-11 14:36:29'),
('20191211143645', '2019-12-11 14:36:49'),
('20191212160720', '2019-12-12 16:07:24'),
('20191217085831', '2019-12-17 08:58:39'),
('20191217102537', '2019-12-17 10:25:41'),
('20191217111512', '2019-12-17 11:15:18'),
('20191217151121', '2019-12-17 15:11:27'),
('20191217170431', '2019-12-17 17:04:36'),
('20191220105911', '2019-12-20 10:59:16'),
('20191220110046', '2019-12-20 11:00:50'),
('20191223085832', '2019-12-23 08:58:36'),
('20191224082455', '2019-12-24 08:25:02'),
('20191227083845', '2019-12-27 08:38:50'),
('20191230094233', '2019-12-30 09:42:43'),
('20191230105314', '2019-12-30 10:53:19'),
('20191230112148', '2019-12-30 11:21:52'),
('20191230113232', '2019-12-30 11:32:36'),
('20191230160125', '2019-12-30 16:01:57'),
('20191230162736', '2019-12-30 16:27:56'),
('20191231135256', '2019-12-31 13:53:01'),
('20200102085806', '2020-01-02 08:58:12'),
('20200103135655', '2020-01-03 13:57:13'),
('20200103152217', '2020-01-03 15:22:23'),
('20200106101416', '2020-01-06 10:14:36'),
('20200106141612', '2020-01-06 14:16:17'),
('20200107084827', '2020-01-07 08:48:35'),
('20200107162511', '2020-01-07 16:25:18'),
('20200107164400', '2020-01-07 16:44:08'),
('20200107172319', '2020-01-07 17:23:26'),
('20200108095841', '2020-01-08 09:58:48'),
('20200109165349', '2020-01-09 16:53:55'),
('20200109165527', '2020-01-09 16:55:46'),
('20200110101037', '2020-01-10 10:10:44');

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `motif`
--

INSERT INTO `motif` (`id`, `name`) VALUES
(1, 'Motif de description2'),
(3, 'Designation');

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE `offre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_mad` double NOT NULL,
  `prix_eur` double NOT NULL,
  `image_offre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_activite` smallint(6) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `offre`
--

INSERT INTO `offre` (`id`, `name`, `prix_mad`, `prix_eur`, `image_offre`, `nb_activite`, `description`) VALUES
(1, 'Pack Classique', 100, 10, 'string', 5, '5 Activités à choisir'),
(2, 'Pack Business', 200, 20, 'string', 10, '10 Activités à choisir'),
(3, 'Pack Gold', 300, 30, 'string', 20, '20 Activités à choisir');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `name`) VALUES
(1, 'Virement Bancaire'),
(2, 'Chèque');

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
(92, 'teeeeeeest_deleted-92', 1),
(93, 'test_deleted-93', 1);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `fullName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `fournisseur_id`, `email`, `phone`, `del`, `created`, `fullName`) VALUES
(1, 75, 'string@gmail.com', '0678451220', 1, '2019-12-09 15:03:33', 'aaaaaaa'),
(2, 75, 'webmaster@3findustrie.com', '0696318051', 1, '2019-12-09 15:30:03', 'aaaaaa'),
(3, 75, 'youness.arbouh@gmail.com', '0696318051', 0, '2019-12-09 15:38:02', 'Youness ARBOUH'),
(4, 75, 'youness.arbouhssscq@gmail.com', '0696318051', 0, '2019-12-26 14:57:29', 'GHADBAN Said');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `secteur_id` int(11) DEFAULT NULL,
  `sous_secteurs_id` int(11) DEFAULT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `fiche_technique_id` int(11) DEFAULT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pu` double NOT NULL,
  `del` tinyint(1) NOT NULL,
  `is_select` tinyint(1) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `videos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `featured_image_id_id` int(11) DEFAULT NULL,
  `titre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `secteur_id`, `sous_secteurs_id`, `fournisseur_id`, `fiche_technique_id`, `reference`, `description`, `pu`, `del`, `is_select`, `is_valid`, `created`, `videos`, `categorie_id`, `featured_image_id_id`, `titre`, `currency_id`, `date_validation`) VALUES
(1, 2, 6, 75, 1, 'P10024', 'ddd155jkjg', 0, 0, 0, 0, '2019-12-04 15:02:22', NULL, 424, NULL, '949fd73e', NULL, NULL),
(2, 1, 51, 75, NULL, 'aaaaa0', 'asidi merhba biko2', 1003.5, 0, 0, 0, '2019-12-05 10:57:14', NULL, NULL, NULL, '7f9747b2', NULL, NULL),
(3, 1, 52, 75, NULL, 'ddddd', 'aaji tfhmel', 15542.255, 0, 0, 0, '2019-12-05 11:05:58', NULL, NULL, NULL, '2a0cccf6', NULL, NULL),
(4, 1, 50, 75, NULL, 'aaaaa0', 'BOn to ej e', 15.25, 0, 0, 0, '2019-12-05 11:32:46', NULL, NULL, NULL, 'd346dd0c', NULL, NULL),
(5, 1, 51, 75, NULL, 'abcde', '10005ggv ddd', 0, 0, 0, 0, '2019-12-05 11:58:21', NULL, NULL, NULL, '87a97c37', NULL, NULL),
(6, 1, 50, 75, NULL, 'aaaaa0', 'vvvvvvvvvvvvvv', 0, 0, 0, 1, '2019-12-05 11:59:06', NULL, 50, NULL, 'a3d9a35b', NULL, '2020-01-02 10:58:15'),
(7, 2, 63, 75, NULL, 'aaaaa0', 'vccccccccc', 0, 0, 0, 0, '2019-12-05 11:59:28', NULL, NULL, NULL, '6f64c792', NULL, NULL),
(8, 1, 50, 58, NULL, 'aaaaa0', '144lll jjm', 0, 0, 0, 0, '2019-12-05 15:08:59', NULL, 424, NULL, 'cb139c17', NULL, NULL),
(9, 1, 50, 75, NULL, 'wwwww', 'wwwwwwwwwww', 0, 0, 0, 0, '2019-12-05 15:10:21', NULL, NULL, NULL, 'a2f02a19', NULL, NULL),
(10, 1, 50, 75, NULL, 'aaaaa0s', 'sqsqsqsqsqs', 0, 0, 0, 0, '2019-12-05 15:13:35', NULL, NULL, NULL, '4140ab28', NULL, NULL),
(11, 1, 50, 75, 12, 'aaaaa0sdssd00', 'sfsfsfsfsfsfsfsfssssssdddddd00', 0, 0, 0, 0, '2019-12-05 15:14:49', NULL, 424, NULL, '12f7d763', NULL, NULL),
(12, 1, 51, 75, 13, 'aaaaa0', 'aaaaaaaaaa', 0, 1, 0, 0, '2019-12-05 15:33:33', NULL, NULL, 47, '3f916abb', NULL, NULL),
(13, 2, 6, 75, 1, 'P10024', 'ddd155jkjg', 0, 1, 0, 0, '2019-12-06 16:02:34', NULL, NULL, 48, 'ce51d2fc', NULL, NULL),
(14, 1, 50, 75, NULL, 'Incidunt in repudia', 'Ea nostrum quas haru', 74, 0, 0, 0, '2019-12-31 16:36:01', NULL, 424, NULL, 'Aliquid in assumenda', NULL, NULL),
(15, 1, 50, 75, NULL, 'Suscipit est nostru', 'Unde temporibus temp', 42, 0, 0, 1, '2019-12-31 16:36:23', NULL, 50, NULL, 'Quo dolore ipsum eiu', NULL, '2020-01-02 10:01:38'),
(16, 1, 50, 75, 15, 'Voluptas commodo qua', 'Consequatur fugiat ', 28, 0, 0, 1, '2019-12-31 16:37:42', NULL, 50, 49, 'Iure enim voluptas v', 11, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit_image_produit`
--

CREATE TABLE `produit_image_produit` (
  `produit_id` int(11) NOT NULL,
  `image_produit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit_image_produit`
--

INSERT INTO `produit_image_produit` (`produit_id`, `image_produit_id`) VALUES
(1, 1),
(7, 29),
(7, 30),
(8, 43),
(9, 44),
(10, 45),
(11, 46),
(12, 47),
(13, 1),
(13, 48),
(16, 49),
(16, 50);

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
  `secteur_id` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_secteur`
--

INSERT INTO `sous_secteur` (`id`, `name`, `del`, `secteur_id`, `parent`) VALUES
(6, 'Acier Inoxydable', 0, 38, NULL),
(7, 'Aciers spéciaux', 0, 38, 6),
(8, 'Aluminium en barre', 0, 38, NULL),
(9, 'Bois en panneau et dérivé', 0, 38, NULL),
(10, 'Profilé aluminium', 0, 38, NULL),
(11, 'Tôles ondulées', 0, 38, NULL),
(12, 'Tube et Raccord', 0, 38, NULL),
(13, 'Additifs alimentaires', 0, 39, NULL),
(14, 'Alimentation animale', 0, 39, NULL),
(15, 'Aliments pour bébés', 0, 39, NULL),
(16, 'Fabrication Alimentation générale ', 0, 39, NULL),
(17, 'Fabrication d’huiles et graisses alimentaires', 0, 39, NULL),
(18, 'Fabrication de chocolats ', 0, 39, NULL),
(19, 'Fabrication de Confiseries', 0, 39, NULL),
(20, 'Fabrication de Glaces et sorbets ', 0, 39, NULL),
(21, 'Fabrication de Sucres', 0, 39, NULL),
(22, 'Fabrication Pâtes alimentaires', 0, 39, NULL),
(23, 'Fourniture de Minerais et minéraux', 0, 39, NULL),
(24, 'Fours pour boulangeries et pâtisseries', 0, 39, NULL),
(25, 'Graisses alimentaires', 0, 39, NULL),
(26, 'Lait médical et alimentation pour bébés', 0, 39, NULL),
(27, 'Machines à café installation et entretie', 0, 39, NULL),
(28, 'Matériel et fournitures boucheries et charcuterie', 0, 39, NULL),
(29, 'Matériel et fournitures pour Boulangeries et pâtis', 0, 39, NULL),
(30, 'Matériel et fournitures pour café et restaurant', 0, 39, NULL),
(31, 'Matériel et fournitures pour Glaciers ', 0, 39, NULL),
(32, 'Matériel et fournitures Industrie Alimentaire', 0, 39, NULL),
(33, 'Matériel et fournitures Pâtisseries confiserie', 0, 39, NULL),
(34, 'Mobilier pour magasins, cafés', 0, 39, NULL),
(35, 'Produits alimentaires de luxe', 0, 39, NULL),
(36, 'Produits alimentaires Surgelés', 0, 39, NULL),
(37, 'Produits alimentaires surgelés et congelés', 0, 39, NULL),
(38, 'Balance et bascule', 0, 42, NULL),
(39, 'Broyeur', 0, 42, NULL),
(40, 'Chauffage ', 0, 42, NULL),
(41, 'Compresseur', 0, 42, NULL),
(42, 'Extrudeuse', 0, 42, NULL),
(43, 'Froid industriel', 0, 42, NULL),
(44, 'Machine d’injection plastique', 0, 42, NULL),
(45, 'Machine divers', 0, 42, NULL),
(46, 'Machine-outil', 0, 42, NULL),
(47, 'Matériel et fourniture pour blanchisserie et laver', 0, 42, NULL),
(48, 'Souffleuse', 0, 42, NULL),
(49, 'Traitement des eaux', 0, 42, NULL),
(50, 'Caisse enregistreuse ', 0, 1, NULL),
(51, 'Climatiseur', 0, 1, NULL),
(52, 'Coffre-fort', 0, 1, NULL),
(53, 'Distributeur de confiseries, snacks et tabac ', 0, 1, NULL),
(54, 'Distributeurs de boissons froides ', 0, 1, NULL),
(55, 'Distributeurs de café et boissons chaudes ', 0, 1, NULL),
(56, 'Fontaines à eau ', 0, 1, NULL),
(57, 'Mobilier de bureau ', 0, 1, NULL),
(58, 'Papier ', 0, 1, NULL),
(59, 'Photocopieurs ', 0, 1, NULL),
(60, 'Projecteurs ', 0, 1, NULL),
(61, 'Télécopieurs', 0, 1, NULL),
(63, 'Conception et réalisation de brochures et catalogu', 0, 2, NULL),
(64, 'Conception et réalisation de support publicitaire ', 0, 2, NULL),
(65, 'Création logo ou charte graphique', 0, 2, NULL),
(66, 'Comptabilité et Expert financier', 0, 3, NULL),
(67, 'Conseil opérationnel et industriel', 0, 3, NULL),
(68, 'Conseil stratégique et études', 0, 3, NULL),
(69, 'Recouvrement de créances', 0, 3, NULL),
(70, 'Boulonnerie, visserie, articles de fixatio', 0, 44, NULL),
(71, 'Carburant, fuel ', 0, 44, NULL),
(72, 'Consommable de soudure', 0, 44, NULL),
(73, 'Consommable et composant électrique', 0, 44, NULL),
(74, 'Droguerie', 0, 44, NULL),
(75, 'Emballage et conditionnement', 0, 44, NULL),
(76, 'Produit d’entretien et de nettoyage', 0, 44, NULL),
(77, 'Quincaillerie ', 0, 44, NULL),
(78, 'Vêtement de sécurité', 0, 44, NULL),
(79, 'Vêtement de travaille', 0, 44, NULL),
(80, 'Carton ondulé', 0, 4, NULL),
(81, 'Design emballage et étiquettes', 0, 4, NULL),
(82, 'Emballage et conditionnement ', 0, 4, NULL),
(83, 'Fioul - mazout', 0, 5, NULL),
(84, 'Energie Solaire', 0, 5, NULL),
(85, 'Biocarburant', 0, 5, NULL),
(86, 'Agencement, décoratio', 0, 45, NULL),
(87, 'Bâtiment préfabriqué', 0, 45, NULL),
(88, 'Construction métallique', 0, 45, NULL),
(89, 'Entreprise de construction de bâtiment', 0, 45, NULL),
(90, 'Génie civil', 0, 45, NULL),
(91, 'Gros-œuvre ', 0, 45, NULL),
(92, 'Menuiserie aluminium', 0, 45, NULL),
(93, 'Menuiserie bois', 0, 45, NULL),
(94, 'Piscine ', 0, 45, NULL),
(95, 'Porte, cloison amovible', 0, 45, NULL),
(96, 'Terrassement', 0, 45, NULL),
(97, 'Travaux tout corps d’état', 0, 45, NULL),
(98, 'Enseignes pour stand d\'exposition ', 0, 6, NULL),
(99, 'Hôtesses ', 0, 6, NULL),
(100, 'Location de salles pour mariage, fêtes,... ', 0, 6, NULL),
(101, 'Location de salles pour séminaire, réunion,... ', 0, 6, NULL),
(102, 'Location matériel et tentes', 0, 6, NULL),
(103, 'Organisation d\'événements ', 0, 6, NULL),
(104, 'Salons et conventions ', 0, 6, NULL),
(105, 'Services de traiteur ', 0, 6, NULL),
(106, 'Son et lumière', 0, 6, NULL),
(107, 'Formation continue ', 0, 7, NULL),
(108, 'Formation du soir', 0, 7, NULL),
(109, 'Formation extra-entreprise', 0, 7, NULL),
(110, 'Formation intra-entreprise', 0, 7, NULL),
(111, 'Formation langue ', 0, 7, NULL),
(112, 'Formation logiciel ', 0, 7, NULL),
(113, 'Formation professionnel', 0, 7, NULL),
(114, 'Formation vente et marketing', 0, 7, NULL),
(115, 'Brochures et catalogues ', 0, 8, NULL),
(116, 'Impression cartes de visite et papier à lettres ', 0, 8, NULL),
(117, 'Impression classeurs et boîtes de rangement ', 0, 8, NULL),
(118, 'Impression enveloppes ', 0, 8, NULL),
(119, 'Impression factures et formulaires ', 0, 8, NULL),
(120, 'Impression feuillets, dépliants et affiches ', 0, 8, NULL),
(121, 'Impression magazines, livres et journaux ', 0, 8, NULL),
(122, 'Impression rapports annuels ', 0, 8, NULL),
(123, 'Impression spéciale', 0, 8, NULL),
(124, 'Conseil informatique', 0, 9, NULL),
(125, 'Développement et intégration base de données', 0, 9, NULL),
(126, 'Développement, programmation logiciel ', 0, 9, NULL),
(127, 'Intégration et gestion de projet', 0, 9, NULL),
(128, 'Logiciel gestion CRM - SRM', 0, 9, NULL),
(129, 'Logiciel gestion documents ', 0, 9, NULL),
(130, 'Logiciel standard', 0, 9, NULL),
(131, 'Progiciel de gestion intégré (ERP) ', 0, 9, NULL),
(132, 'Services sécurité informatique', 0, 9, NULL),
(133, 'Création site web de présentation ', 0, 46, NULL),
(134, 'Création site web gestion et e-commerce ', 0, 46, NULL),
(135, 'Fournisseur d\'accès FAI ', 0, 46, NULL),
(136, 'Graphisme et animations web ', 0, 46, NULL),
(137, 'Hébergement sites web ', 0, 46, NULL),
(138, 'Marketing internet ', 0, 46, NULL),
(139, 'Réalisation de bannières ', 0, 46, NULL),
(140, 'Référencement moteur de recherche', 0, 46, NULL),
(141, 'Bacs de stockage et conteneurs ', 0, 11, NULL),
(142, 'Chariots élévateurs', 0, 11, NULL),
(143, 'Transpalette et Gerbeur', 0, 11, NULL),
(144, 'Entreposage ', 0, 11, NULL),
(145, 'Grues ', 0, 11, NULL),
(146, 'Palettes ', 0, 11, NULL),
(148, 'Achat / location de bases de données', 0, 12, NULL),
(149, 'Agence de marketing direct ', 0, 12, NULL),
(150, 'Agence de publicité ', 0, 12, NULL),
(151, 'Conseil vente et marketing ', 0, 12, NULL),
(152, 'Enseignes lumineuses et signalétique ', 0, 12, NULL),
(153, 'Mailing direct ', 0, 12, NULL),
(154, 'Rédaction de textes ', 0, 12, NULL),
(155, 'Relations presse', 0, 12, NULL),
(156, 'Télémarketing et Centres d\'appels', 0, 12, NULL),
(157, 'Aspirateur et cireuse', 0, 48, NULL),
(158, 'Chocolat et confiserie', 0, 48, NULL),
(159, 'Electroménager', 0, 48, NULL),
(160, 'Hi-fi', 0, 48, NULL),
(161, 'Literie, draps  ', 0, 48, NULL),
(162, 'Sonorisation et effet lumineux', 0, 48, NULL),
(163, 'Vêtement de travaille', 0, 48, NULL),
(164, 'Armoire et coffret', 0, 49, NULL),
(165, 'Automate programmable', 0, 49, NULL),
(166, 'Bobinage pour moteur électrique', 0, 49, NULL),
(167, 'Câble et fil électrique', 0, 49, NULL),
(168, 'Carte électronique', 0, 49, NULL),
(169, 'Composant d’automatisme pneumatique', 0, 49, NULL),
(170, 'Composant électronique', 0, 49, NULL),
(171, 'Composant et article hydraulique', 0, 49, NULL),
(172, 'Conception et installation d’automatisme', 0, 49, NULL),
(173, 'Disjoncteur, relais électrique', 0, 49, NULL),
(174, 'Transformateur électrique', 0, 49, NULL),
(177, 'Imprimantes ', 0, 9, NULL),
(179, 'Ordinateurs PC', 0, 9, NULL),
(180, 'PC portables ', 0, 9, NULL),
(181, 'Serveurs ', 0, 9, NULL),
(182, 'Support hardware', 0, 9, NULL),
(183, 'Carto', 0, 50, NULL),
(184, 'Encre', 0, 50, NULL),
(185, 'Machine', 0, 50, NULL),
(186, 'Papier', 0, 50, NULL),
(187, 'Audit environnemental', 0, 14, NULL),
(188, 'Gestion de déchèterie ', 0, 14, NULL),
(189, 'Gestion du nettoyage ', 0, 14, NULL),
(190, 'Matériel et produits de nettoyage ', 0, 14, NULL),
(191, 'Nettoyage & Environnement', 0, 14, NULL),
(192, 'Services de nettoyage', 0, 14, NULL),
(193, 'Concepteur de reportage vidéo ', 0, 15, NULL),
(194, 'Duplication de CD ou DVD ', 0, 15, NULL),
(195, 'Photographie ', 0, 15, NULL),
(196, 'Production spot radio ', 0, 15, NULL),
(197, 'Production vidéo présentation d\'entreprise', 0, 15, NULL),
(198, 'Production vidéo pour publicité ', 0, 15, NULL),
(199, 'Présentation CD ou DVD ', 0, 15, NULL),
(200, 'Streaming vidéo', 0, 15, NULL),
(201, 'Streaming vidéo', 0, 15, NULL),
(202, 'PLV', 0, 15, NULL),
(203, 'Affichage', 0, 15, NULL),
(204, 'Accessoire et équipement ', 0, 52, NULL),
(205, 'Entretien et maintenance', 0, 52, NULL),
(206, 'Pièce détaché pour moteur', 0, 52, NULL),
(207, 'Accessoire et équipement ', 0, 53, NULL),
(208, 'Entretien et maintenance', 0, 53, NULL),
(209, 'Pièce détaché pour moteur', 0, 53, NULL),
(210, 'Colorant pour matière plastique', 0, 54, NULL),
(211, 'Articles promotionnels ', 0, 16, NULL),
(212, 'Cadeaux d\'affaires ', 0, 16, NULL),
(213, 'Vêtements promotionnels', 0, 16, NULL),
(214, 'Architecture d\'intérieur ', 0, 18, NULL),
(215, 'Climatisation ', 0, 18, NULL),
(216, 'Construction générale ', 0, 18, NULL),
(217, 'Décoration intérieure ', 0, 18, NULL),
(218, 'Installation électrique ', 0, 18, NULL),
(219, 'Installations spéciales ', 0, 18, NULL),
(220, 'Peinture et rafraîchissement ', 0, 18, NULL),
(221, 'Rénovation  bâtiment', 0, 18, NULL),
(222, 'Sol et fondation ', 0, 18, NULL),
(223, 'Toit et isolation ', 0, 18, NULL),
(224, 'Tuyauterie et sanitaire', 0, 18, NULL),
(225, 'Intérim ', 0, 17, NULL),
(226, 'Gardiennage', 0, 17, NULL),
(227, 'Recrutement ', 0, 17, NULL),
(228, 'Relocation ', 0, 17, NULL),
(229, 'Alarme et appareil de surveillance', 0, 19, NULL),
(230, 'Antivol', 0, 19, NULL),
(231, 'Contrôle d’accès', 0, 19, NULL),
(232, 'Détection d’incendie', 0, 19, NULL),
(233, 'Gardiennage', 0, 19, NULL),
(234, 'Prévention contre le feu ', 0, 19, NULL),
(235, 'Surveillance vidéo ', 0, 19, NULL),
(236, 'Centraux téléphoniques', 0, 55, NULL),
(237, 'Câblage et réseaux ', 0, 55, NULL),
(238, 'Téléphonie VOIP ', 0, 55, NULL),
(239, 'Téléphonie mobile', 0, 55, NULL),
(240, 'Téléphonie Fixe', 0, 55, NULL),
(249, 'Billets d\'avion ', 0, 24, NULL),
(250, 'Location d\'autocars', 0, 24, NULL),
(251, 'Hôtel', 0, 24, NULL),
(252, 'Aciers de constructio', 0, 27, NULL),
(253, 'Agrafages – vulcanisatio', 0, 53, NULL),
(254, 'outillage', 0, 44, NULL),
(255, 'Appareils de mesure et de contrôle électrique', 0, 36, NULL),
(256, 'Location de véhicule utilitaire', 0, 56, NULL),
(257, 'Location de camio', 0, 56, NULL),
(258, 'VEHICULE UTILITAIRE', 0, 20, NULL),
(259, 'CAMIO', 0, 20, NULL),
(260, 'AUTOMOBILES', 0, 20, NULL),
(261, 'MINIBUS', 0, 20, NULL),
(262, 'FOURGONNETTES, FOURGONS', 0, 20, NULL),
(263, 'Transport National', 0, 57, NULL),
(264, 'Tansport International', 0, 57, NULL),
(265, 'Messagerie', 0, 57, NULL),
(266, 'Services de Coursiers', 0, 57, NULL),
(267, 'Déménagement', 0, 57, NULL),
(268, 'Matériel Informatique', 0, 9, NULL),
(269, 'Palettes', 0, 61, NULL),
(270, 'Rayonnage', 0, 11, NULL),
(271, 'Chariots élévateurs', 0, 62, NULL),
(272, 'Transpalettes', 0, 62, NULL),
(273, 'Gerbeurs', 0, 62, NULL),
(274, 'Ustensiles', 0, 48, NULL),
(275, 'Tables et chaises', 0, 48, NULL),
(276, 'Accessoires HCR', 0, 48, NULL),
(286, 'Industrie Mécanique', 0, 28, NULL),
(287, 'Manufactures', 0, 28, NULL),
(288, 'Chargeuses sur pneus', 0, 74, NULL),
(289, 'Chargeuses - pelleteuses', 0, 74, NULL),
(290, 'Pelles', 0, 74, NULL),
(291, 'Tombereaux articulés', 0, 74, NULL),
(292, 'Niveleuses', 0, 74, NULL),
(293, 'Finisseurs de routes', 0, 74, NULL),
(294, 'Raboteuses', 0, 74, NULL),
(295, 'Compacteurs', 0, 74, NULL),
(296, 'Froid et climatisatio', 0, 75, NULL),
(297, 'AUTRE', 0, 75, NULL),
(298, 'Accessoires', 0, 9, NULL),
(299, 'Entretien et réparatio', 0, 9, NULL),
(301, 'Ordinateurs Mac', 0, 9, NULL),
(306, 'Autre (à préciser sur le descriptif)', 0, 23, NULL),
(307, 'Sols', 0, 25, NULL),
(308, 'Mines', 0, 25, NULL),
(309, 'Carrière', 0, 25, NULL),
(311, 'Agro-industrie', 0, 26, NULL),
(312, 'Matériaux de construction ', 0, 27, NULL),
(313, 'Sidérurgie', 0, 29, NULL),
(314, 'Métallurgie', 0, 29, NULL),
(315, 'Industrie de transformatio', 0, 30, NULL),
(316, 'Energie', 0, 31, NULL),
(317, 'Electricité', 0, 31, NULL),
(319, 'Electronique', 0, 31, NULL),
(320, 'Environnement', 0, 32, NULL),
(321, 'Equipements', 0, 34, NULL),
(322, 'Infrastructures', 0, 34, NULL),
(323, 'Pétrole', 0, 35, NULL),
(324, 'Gaz', 0, 35, NULL),
(325, 'Chimie', 0, 37, NULL),
(326, 'Parachimie', 0, 37, NULL),
(327, 'Pharmacie', 0, 37, NULL),
(328, 'Santé', 0, 37, NULL),
(329, 'Architectes', 0, 40, NULL),
(330, 'Ascenseurs', 0, 41, NULL),
(331, 'Montes charges', 0, 41, NULL),
(332, 'Bureau d\'étude', 0, 43, NULL),
(333, 'Maintenance', 0, 47, NULL),
(334, 'Entretie', 0, 47, NULL),
(335, 'Plastiques', 0, 51, NULL),
(336, 'Caoutchouc', 0, 51, NULL),
(337, 'Dérivés de matières plastiques', 0, 51, NULL),
(338, 'Audit', 0, 58, NULL),
(339, 'Conseil', 0, 58, NULL),
(340, 'Chaudronerie', 0, 59, NULL),
(341, 'Charpente', 0, 60, NULL),
(342, 'Rayonnages', 0, 61, NULL),
(343, 'Peinture à huile', 0, 63, NULL),
(344, 'Colorant', 0, 63, NULL),
(345, 'Services de tranport', 0, 64, NULL),
(346, 'Agence immobilière', 0, 64, NULL),
(347, 'Agence de location de voiture', 0, 64, NULL),
(348, 'Sécurité', 0, 64, NULL),
(349, 'Nettoyage', 0, 64, NULL),
(350, 'Assistance', 0, 64, NULL),
(351, 'Dépannage', 0, 64, NULL),
(352, 'Bricolage', 0, 64, NULL),
(353, 'Matériel de manutentio', 0, 65, NULL),
(354, 'Outillage à mai', 0, 65, NULL),
(355, 'Expertise', 0, 67, NULL),
(356, 'Distributio', 0, 68, NULL),
(357, 'Place de marché', 0, 70, NULL),
(358, 'Autre', 0, 34, NULL),
(364, 'Autre', 0, 6, NULL),
(365, 'Autre', 0, 7, NULL),
(366, 'Autre', 0, 8, NULL),
(367, 'Autre', 0, 9, NULL),
(368, 'Autre', 0, 11, NULL),
(369, 'Autre', 0, 12, NULL),
(370, 'Autre', 0, 14, NULL),
(371, 'Autre', 0, 15, NULL),
(372, 'Autre', 0, 16, NULL),
(373, 'Autre', 0, 17, NULL),
(374, 'Autre', 0, 18, NULL),
(375, 'Autre', 0, 19, NULL),
(376, 'Autre', 0, 20, NULL),
(377, 'Autre', 0, 24, NULL),
(378, 'Autre', 0, 25, NULL),
(379, 'Autre', 0, 26, NULL),
(380, 'Autre', 0, 27, NULL),
(381, 'Autre', 0, 28, NULL),
(382, 'Autre', 0, 29, NULL),
(383, 'Autre', 0, 30, NULL),
(384, 'Autre', 0, 32, NULL),
(385, 'Autre', 0, 36, NULL),
(386, 'Autre', 0, 37, NULL),
(387, 'Autre', 0, 38, NULL),
(388, 'Autre', 0, 39, NULL),
(389, 'Autre', 0, 40, NULL),
(390, 'Autre', 0, 41, NULL),
(391, 'Autre', 0, 42, NULL),
(392, 'Autre', 0, 43, NULL),
(393, 'Autre', 0, 44, NULL),
(394, 'Autre', 0, 45, NULL),
(395, 'Autre', 0, 46, NULL),
(396, 'Autre', 0, 48, NULL),
(397, 'Autre', 0, 49, NULL),
(398, 'Autre', 0, 50, NULL),
(399, 'Autre', 0, 51, NULL),
(400, 'Autre', 0, 52, NULL),
(401, 'Autre', 0, 53, NULL),
(402, 'Autre', 0, 54, NULL),
(403, 'Autre', 0, 55, NULL),
(404, 'Autre', 0, 56, NULL),
(405, 'Autre', 0, 57, NULL),
(406, 'Autre', 0, 58, NULL),
(407, 'Autre', 0, 59, NULL),
(408, 'Autre', 0, 60, NULL),
(409, 'Autre', 0, 61, NULL),
(410, 'Autre', 0, 62, NULL),
(411, 'Autre', 0, 63, NULL),
(412, 'Autre', 0, 64, NULL),
(413, 'Autre', 0, 65, NULL),
(414, 'Autre', 0, 67, NULL),
(415, 'Autre', 0, 68, NULL),
(416, 'Autre', 0, 70, NULL),
(417, 'Autre', 0, 74, NULL),
(418, 'Centre commercial', 0, 78, NULL),
(419, 'Université', 0, 79, NULL),
(420, 'Logiciel', 0, 11, NULL),
(421, 'Machine et Equipement', 0, 4, NULL),
(422, 'testt_deleted-422', 1, 1, NULL),
(424, 'Algeriee2', 0, 1, 50);

-- --------------------------------------------------------

--
-- Structure de la table `suggestion_secteur`
--

CREATE TABLE `suggestion_secteur` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `secteur` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sous_secteur` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_suggestion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suggestion_secteur`
--

INSERT INTO `suggestion_secteur` (`id`, `user_id`, `secteur`, `sous_secteur`, `categorie`, `page_suggestion`, `etat`, `created`) VALUES
(1, 75, 'ccc', 'cccc', NULL, 'Demande Offre d\'abonnement fournisseur', 0, '2020-01-07 16:56:14'),
(2, 75, 'ccc', 'cccc', NULL, 'Demande Offre d\'abonnement fournisseur', 0, '2020-01-07 17:22:17'),
(3, 75, 'sss', 'sss', NULL, 'Demande Offre d\'abonnement fournisseur', 0, '2020-01-07 17:23:02'),
(4, 75, 'sss', 'sssq', NULL, 'Demande Offre d\'abonnement fournisseur', 0, '2020-01-07 17:23:12'),
(5, 75, 'gggg', 'ggggg', NULL, 'Demande Offre d\'abonnement fournisseur', 0, '2020-01-07 17:43:15'),
(6, 75, 'kkk', 'kkkk', NULL, 'Demande Offre d\'abonnement fournisseur', 0, '2020-01-07 17:46:35');

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
(4, 'HAY EL KHA22IR', 'cmrsoia cmrsoi2a', 2622820, '+212696318051', 'youness.arbouh4@gmail.com', '$2y$13$D5ucNPg0F4x3NASOS4VYgOPcbK.jT6aW4nmMn42ZBadntqFSZFM1W', 0, 1, '2019-08-05 17:30:47', 'cmrsoia2222', 'cmrsoi2a2223', 'cmrsoia22222d', 'ZoneCommercial', 'ROLE_ZONE', 1565078960, NULL, 'HnmaGHUOcAiIecY01yyGKTw@pDugWR', 1, ''),
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
(75, '36, rue imam al boukhari maarif', 'kkkkkkkkkkkk', 26000, '0696318051', 'youness.arbouhssscq@gmail.com', '$2y$13$H./PWBuS/z5G4Zb2vnhUUeecSGafd4WpT6HOKJdB2aLajgV2sV57q', 0, 1, '2019-11-05 15:38:55', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, 9, NULL, 38, '/dashboard'),
(76, '36, rue i25', 'adresse ee 2323', 26000, '0696318054', 'youness.arbouh@gmail.com', '$2y$13$T7KXkmI59DJgTD0yBavZq.z/1zBtMRSTTAP62O9XbXhrI4qczjJhm', 0, 1, '2019-11-07 09:30:02', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', 1574433080, NULL, NULL, 36, '/dashboard'),
(77, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'bounce@3findustrie.com', '$2y$13$e59DVr1U7h7OfEoFQXY/UeNuudwndof38YYM/bXpiSSlPos508ULC', 0, 1, '2019-12-17 09:08:46', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, 39, '/dashboard'),
(78, '36, rue imam al boukhari maarif', '', 26000, '0696318051', 'bouncee@3findustrie.ma', '$2y$13$r3E1Hv6tfRWcbQlySkLXUOkIHlh.KUalxRXZO7cr.wV4looBkNHHq', 0, 1, '2019-12-17 09:16:53', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(79, NULL, NULL, NULL, '0696318051', 'webmaster@7e-ky.ma', '$2y$13$J2npEYkTNYeArf8J4YPso.HH6BdZ4DK4ez0uGoLFC6a/YNwFXcknm', 0, 1, '2019-12-17 11:27:08', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR_PRE', NULL, NULL, NULL, NULL, '/register/fournisseur'),
(80, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'webmaster@7e-sky.ma', '$2y$13$COqDwD53EBeEpYbz.pajtO7UfBLX8w11QI02KVCsN0e0kKwEz0Hr2', 0, 1, '2019-12-17 11:31:32', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard_ac'),
(81, '36, rue imam al boukhari maarif', 'youness.arbouh55@gmail.com', NULL, '0696318051', 'bounce@3findustrie.ma', '$2y$13$bYoEpEPrFt7.eUdhzPiG1ueeGdhXes7RC/wWXIE2Z9Dkn7WWwwZpi', 0, 1, '2019-12-24 09:20:37', 'ARBOUH', 'Youness', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, 40, '/dashboard');

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
-- Index pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_351268BB4CC8505A` (`offre_id`),
  ADD KEY `IDX_351268BB80E95E18` (`demande_id`),
  ADD KEY `IDX_351268BB670C757F` (`fournisseur_id`),
  ADD KEY `IDX_351268BB9F2C3FAB` (`zone_id`),
  ADD KEY `IDX_351268BB7854071C` (`commercial_id`),
  ADD KEY `IDX_351268BB77E5854A` (`mode_id`);

--
-- Index pour la table `abonnement_sous_secteur`
--
ALTER TABLE `abonnement_sous_secteur`
  ADD PRIMARY KEY (`abonnement_id`,`sous_secteur_id`),
  ADD KEY `IDX_EFD366E0F1D74413` (`abonnement_id`),
  ADD KEY `IDX_EFD366E0790611EF` (`sous_secteur_id`);

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_304AFF9DA6E44244` (`pays_id`),
  ADD KEY `IDX_304AFF9DA73F0036` (`ville_id`),
  ADD KEY `IDX_304AFF9DFC8B6C6C` (`parent2`),
  ADD KEY `IDX_304AFF9D9F7E4405` (`secteur_id`),
  ADD KEY `IDX_304AFF9D38248176` (`currency_id`);

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
-- Index pour la table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `demande_abonnement`
--
ALTER TABLE `demande_abonnement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C3DE621A4CC8505A` (`offre_id`),
  ADD KEY `IDX_C3DE621A670C757F` (`fournisseur_id`),
  ADD KEY `IDX_C3DE621A9F2C3FAB` (`zone_id`),
  ADD KEY `IDX_C3DE621A7854071C` (`commercial_id`),
  ADD KEY `IDX_C3DE621A77E5854A` (`mode_id`),
  ADD KEY `IDX_C3DE621AD13C140` (`duree_id`);

--
-- Index pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D077077F96A7BB5F` (`acheteur_id`),
  ADD KEY `search_idx` (`statut`,`del`),
  ADD KEY `IDX_D077077FCC36B3F` (`motif_rejet_id`),
  ADD KEY `IDX_D077077F38248176` (`currency_id`);

--
-- Index pour la table `demande_achat_attachement`
--
ALTER TABLE `demande_achat_attachement`
  ADD PRIMARY KEY (`demande_achat_id`,`attachement_id`),
  ADD KEY `IDX_B1D67F41B8CC98D5` (`demande_achat_id`),
  ADD KEY `IDX_B1D67F41A05591E0` (`attachement_id`);

--
-- Index pour la table `demande_devis`
--
ALTER TABLE `demande_devis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7DF94602F347EFB` (`produit_id`),
  ADD KEY `IDX_7DF94602670C757F` (`fournisseur_id`);

--
-- Index pour la table `demande_dmdabonnement_sous_secteur`
--
ALTER TABLE `demande_dmdabonnement_sous_secteur`
  ADD PRIMARY KEY (`demande_abonnement_id`,`sous_secteur_id`),
  ADD KEY `IDX_4932C2CB415015A3` (`demande_abonnement_id`),
  ADD KEY `IDX_4932C2CB790611EF` (`sous_secteur_id`);

--
-- Index pour la table `demande_ha_sous_secteur`
--
ALTER TABLE `demande_ha_sous_secteur`
  ADD PRIMARY KEY (`sous_secteur_id`,`demande_achat_id`),
  ADD KEY `IDX_457CE2F8790611EF` (`sous_secteur_id`),
  ADD KEY `IDX_457CE2F8B8CC98D5` (`demande_achat_id`);

--
-- Index pour la table `demande_jeton`
--
ALTER TABLE `demande_jeton`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F411E752670C757F` (`fournisseur_id`);

--
-- Index pour la table `detail_visite`
--
ALTER TABLE `detail_visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A2569520670C757F` (`fournisseur_id`),
  ADD KEY `IDX_A256952080E95E18` (`demande_id`),
  ADD KEY `IDX_A25695201C109075` (`personnel_id`);

--
-- Index pour la table `diffusion_demande`
--
ALTER TABLE `diffusion_demande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_65C68FFF670C757F` (`fournisseur_id`),
  ADD KEY `IDX_65C68FFF80E95E18` (`demande_id`);

--
-- Index pour la table `duree`
--
ALTER TABLE `duree`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fiche`
--
ALTER TABLE `fiche`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_369ECA32A6E44244` (`pays_id`),
  ADD KEY `IDX_369ECA32A73F0036` (`ville_id`),
  ADD KEY `IDX_369ECA3238248176` (`currency_id`);

--
-- Index pour la table `fournisseur_sous_secteur`
--
ALTER TABLE `fournisseur_sous_secteur`
  ADD PRIMARY KEY (`sous_secteur_id`,`fournisseur_id`),
  ADD KEY `IDX_CA2D7FC3670C757F` (`fournisseur_id`),
  ADD KEY `IDX_CA2D7FC3790611EF` (`sous_secteur_id`);

--
-- Index pour la table `historique_visite`
--
ALTER TABLE `historique_visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_79DE2CE7670C757F` (`fournisseur_id`),
  ADD KEY `IDX_79DE2CE780E95E18` (`demande_id`);

--
-- Index pour la table `image_produit`
--
ALTER TABLE `image_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jeton`
--
ALTER TABLE `jeton`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2CF647B80E95E18` (`demande_id`),
  ADD KEY `IDX_2CF647B670C757F` (`fournisseur_id`),
  ADD KEY `IDX_2CF647B2A4C4478` (`paiement_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offre`
--
ALTER TABLE `offre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A6BCF3DE670C757F` (`fournisseur_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC279F7E4405` (`secteur_id`),
  ADD KEY `IDX_29A5EC27D7BD44DD` (`sous_secteurs_id`),
  ADD KEY `IDX_29A5EC27670C757F` (`fournisseur_id`),
  ADD KEY `IDX_29A5EC27431AD613` (`fiche_technique_id`),
  ADD KEY `IDX_29A5EC27BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_29A5EC276E694C1F` (`featured_image_id_id`),
  ADD KEY `IDX_29A5EC2738248176` (`currency_id`);

--
-- Index pour la table `produit_image_produit`
--
ALTER TABLE `produit_image_produit`
  ADD PRIMARY KEY (`produit_id`,`image_produit_id`),
  ADD KEY `IDX_92EB1D25F347EFB` (`produit_id`),
  ADD KEY `IDX_92EB1D2563EA69CD` (`image_produit_id`);

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
  ADD KEY `IDX_A34C5D529F7E4405` (`secteur_id`),
  ADD KEY `IDX_A34C5D523D8E604F` (`parent`);

--
-- Index pour la table `suggestion_secteur`
--
ALTER TABLE `suggestion_secteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EF9F666BA76ED395` (`user_id`);

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
-- AUTO_INCREMENT pour la table `abonnement`
--
ALTER TABLE `abonnement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `attachement`
--
ALTER TABLE `attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT pour la table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `black_listes`
--
ALTER TABLE `black_listes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `demande_abonnement`
--
ALTER TABLE `demande_abonnement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `demande_devis`
--
ALTER TABLE `demande_devis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `demande_jeton`
--
ALTER TABLE `demande_jeton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `detail_visite`
--
ALTER TABLE `detail_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `diffusion_demande`
--
ALTER TABLE `diffusion_demande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `duree`
--
ALTER TABLE `duree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `fiche`
--
ALTER TABLE `fiche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `historique_visite`
--
ALTER TABLE `historique_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `image_produit`
--
ALTER TABLE `image_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `jeton`
--
ALTER TABLE `jeton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `offre`
--
ALTER TABLE `offre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT pour la table `suggestion_secteur`
--
ALTER TABLE `suggestion_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD CONSTRAINT `FK_351268BB4CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`),
  ADD CONSTRAINT `FK_351268BB670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_351268BB77E5854A` FOREIGN KEY (`mode_id`) REFERENCES `paiement` (`id`),
  ADD CONSTRAINT `FK_351268BB7854071C` FOREIGN KEY (`commercial_id`) REFERENCES `commercial` (`id`),
  ADD CONSTRAINT `FK_351268BB80E95E18` FOREIGN KEY (`demande_id`) REFERENCES `demande_abonnement` (`id`),
  ADD CONSTRAINT `FK_351268BB9F2C3FAB` FOREIGN KEY (`zone_id`) REFERENCES `zone_commercial` (`id`);

--
-- Contraintes pour la table `abonnement_sous_secteur`
--
ALTER TABLE `abonnement_sous_secteur`
  ADD CONSTRAINT `FK_EFD366E0790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EFD366E0F1D74413` FOREIGN KEY (`abonnement_id`) REFERENCES `abonnement` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `FK_304AFF9D38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
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
-- Contraintes pour la table `demande_abonnement`
--
ALTER TABLE `demande_abonnement`
  ADD CONSTRAINT `FK_C3DE621A4CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`),
  ADD CONSTRAINT `FK_C3DE621A670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_C3DE621A77E5854A` FOREIGN KEY (`mode_id`) REFERENCES `paiement` (`id`),
  ADD CONSTRAINT `FK_C3DE621A7854071C` FOREIGN KEY (`commercial_id`) REFERENCES `commercial` (`id`),
  ADD CONSTRAINT `FK_C3DE621A9F2C3FAB` FOREIGN KEY (`zone_id`) REFERENCES `zone_commercial` (`id`),
  ADD CONSTRAINT `FK_C3DE621AD13C140` FOREIGN KEY (`duree_id`) REFERENCES `duree` (`id`);

--
-- Contraintes pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  ADD CONSTRAINT `FK_D077077F38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_D077077F96A7BB5F` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`),
  ADD CONSTRAINT `FK_D077077FCC36B3F` FOREIGN KEY (`motif_rejet_id`) REFERENCES `motif` (`id`);

--
-- Contraintes pour la table `demande_achat_attachement`
--
ALTER TABLE `demande_achat_attachement`
  ADD CONSTRAINT `FK_B1D67F41A05591E0` FOREIGN KEY (`attachement_id`) REFERENCES `attachement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B1D67F41B8CC98D5` FOREIGN KEY (`demande_achat_id`) REFERENCES `demande_achat` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `demande_devis`
--
ALTER TABLE `demande_devis`
  ADD CONSTRAINT `FK_7DF94602670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_7DF94602F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `demande_dmdabonnement_sous_secteur`
--
ALTER TABLE `demande_dmdabonnement_sous_secteur`
  ADD CONSTRAINT `FK_4932C2CB415015A3` FOREIGN KEY (`demande_abonnement_id`) REFERENCES `demande_abonnement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4932C2CB790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `demande_ha_sous_secteur`
--
ALTER TABLE `demande_ha_sous_secteur`
  ADD CONSTRAINT `FK_457CE2F8790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_457CE2F8B8CC98D5` FOREIGN KEY (`demande_achat_id`) REFERENCES `demande_achat` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `demande_jeton`
--
ALTER TABLE `demande_jeton`
  ADD CONSTRAINT `FK_F411E752670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`);

--
-- Contraintes pour la table `detail_visite`
--
ALTER TABLE `detail_visite`
  ADD CONSTRAINT `FK_A25695201C109075` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`),
  ADD CONSTRAINT `FK_A2569520670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_A256952080E95E18` FOREIGN KEY (`demande_id`) REFERENCES `demande_achat` (`id`);

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
  ADD CONSTRAINT `FK_369ECA3238248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
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
-- Contraintes pour la table `historique_visite`
--
ALTER TABLE `historique_visite`
  ADD CONSTRAINT `FK_79DE2CE7670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_79DE2CE780E95E18` FOREIGN KEY (`demande_id`) REFERENCES `demande_achat` (`id`);

--
-- Contraintes pour la table `jeton`
--
ALTER TABLE `jeton`
  ADD CONSTRAINT `FK_2CF647B2A4C4478` FOREIGN KEY (`paiement_id`) REFERENCES `paiement` (`id`),
  ADD CONSTRAINT `FK_2CF647B670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_2CF647B80E95E18` FOREIGN KEY (`demande_id`) REFERENCES `demande_jeton` (`id`);

--
-- Contraintes pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `FK_A6BCF3DE670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC2738248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_29A5EC27431AD613` FOREIGN KEY (`fiche_technique_id`) REFERENCES `fiche` (`id`),
  ADD CONSTRAINT `FK_29A5EC27670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_29A5EC276E694C1F` FOREIGN KEY (`featured_image_id_id`) REFERENCES `image_produit` (`id`),
  ADD CONSTRAINT `FK_29A5EC279F7E4405` FOREIGN KEY (`secteur_id`) REFERENCES `secteur` (`id`),
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `sous_secteur` (`id`),
  ADD CONSTRAINT `FK_29A5EC27D7BD44DD` FOREIGN KEY (`sous_secteurs_id`) REFERENCES `sous_secteur` (`id`);

--
-- Contraintes pour la table `produit_image_produit`
--
ALTER TABLE `produit_image_produit`
  ADD CONSTRAINT `FK_92EB1D2563EA69CD` FOREIGN KEY (`image_produit_id`) REFERENCES `image_produit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_92EB1D25F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  ADD CONSTRAINT `FK_A34C5D523D8E604F` FOREIGN KEY (`parent`) REFERENCES `sous_secteur` (`id`),
  ADD CONSTRAINT `FK_A34C5D529F7E4405` FOREIGN KEY (`secteur_id`) REFERENCES `secteur` (`id`);

--
-- Contraintes pour la table `suggestion_secteur`
--
ALTER TABLE `suggestion_secteur`
  ADD CONSTRAINT `FK_EF9F666BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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

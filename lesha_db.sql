-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 05 mars 2020 à 17:25
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
  `expired` datetime DEFAULT NULL,
  `date_peiment` datetime DEFAULT NULL,
  `duree_id` int(11) DEFAULT NULL,
  `remise` smallint(6) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `commentaire` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
(68, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', NULL, NULL),
(69, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', NULL, NULL),
(70, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', NULL, NULL),
(71, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', NULL, NULL),
(72, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', NULL, NULL),
(73, 1, 2, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', NULL, NULL),
(74, 2, 33, '3f industrie', NULL, 'M.', NULL, '', '', '', NULL, NULL),
(76, 1, 1, '1244n', NULL, 'M.', '123456676102145', '0622201475', 'https://www.d.fr0', 'skkkkkkkkkkk2', NULL, NULL),
(77, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', 'https://www.d.com', '', NULL, NULL),
(80, 1, 1, '7e-sky', NULL, 'M.', '123456789123456', '', '', '', NULL, 1),
(84, 1, 1, '3f industrie', NULL, 'M.', '123456789123456', '', '', '', 81, 1);

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

CREATE TABLE `actualite` (
  `id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`id`, `image_id`, `titre`, `description`, `created`, `is_active`, `keywords`, `source`, `slug`) VALUES
(1, 3, 'string', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 10:13:29', 1, NULL, 'string', ''),
(2, 3, 'string', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 11:58:36', 1, NULL, 'string', 'string'),
(3, 3, 'string', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 11:59:18', 1, NULL, 'string', 'string-1'),
(4, 3, 'string', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 11:59:36', 1, NULL, 'string', 'string-2'),
(5, 3, 'string string string', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:01:36', 1, NULL, 'string', 'string-string-string'),
(6, 3, 'Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:02:05', 1, NULL, 'string', 'title-of-tje-right'),
(7, 3, 'Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:02:09', 1, NULL, 'string', 'title-of-tje-right-1'),
(8, 3, 'Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:04:09', 1, NULL, 'string', 'title-of-tje-right-2'),
(9, 3, 'Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:04:12', 1, NULL, 'string', 'title-of-tje-right-3'),
(10, 3, 'Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:05:51', 1, NULL, 'string', 'title-of-tje-right-title-of-tje-right-title-of-tje-right'),
(11, 3, 'Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:05:57', 1, NULL, 'string', 'title-of-tje-right-title-of-tje-right-title-of-tje-right-1'),
(12, 3, 'Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:06:05', 1, NULL, 'string', 'title-of-tje-right-title-of-tje-right-title-of-tje-right-title-of-tje-right-title-of-tje-right'),
(13, 3, 'Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT Title OF TJE RIGHT', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 12:06:10', 1, NULL, 'string', 'title-of-tje-right-title-of-tje-right-title-of-tje-right-title-of-tje-right-title-of-tje-right-1'),
(14, 3, 'Electrical wiring / interconnextion system ( EWIS )', 'stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring', '2020-02-04 15:29:11', 1, NULL, 'string', 'electrical-wiring-interconnextion-system-ewis'),
(15, 3, 'Electrical wiring / interconnextion system ( EWIS )', '<p>stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring</p>', '2020-02-04 15:29:42', 1, NULL, 'string', 'electrical-wiring-interconnextion-system-ewis-1'),
(16, 8, 'Blanditiis consectet', '<p>Blanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectetBlanditiis consectet</p>', '2020-02-04 15:45:26', 1, NULL, 'http://www.exemple.com', 'blanditiis-consectet'),
(17, 9, 'Electrical wiring / interconnextion system ( EWIS )', '<p><i><strong>Electrical wiring / interconnextion system ( EWIS )</strong></i></p><ol><li>Electrical wiring / interconnextion system ( EWIS )</li></ol><ul><li>Electrical wiring / interconnextion system ( EWIS )</li><li>Electrical wiring / interconnextion system ( EWIS&nbsp;</li><li>Electrical wiring / interconnextion system ( EWIS )</li></ul>', '2020-02-04 16:02:22', 1, NULL, 'http://www.exemple.com', 'electrical-wiring-interconnextion-system-ewis-2'),
(18, 10, 'Placeat ut error au', '<h2>azsssssss</h2><p>&nbsp;</p><p><strong>sddddd</strong><i>sdsdsdsdsd</i><a href=\"http://www.exemple.com\"><i>http://www.exemple.com&nbsp;</i></a></p><ul><li><i>ddddd</i></li><li><i>dddd</i></li><li><i>dddd</i></li></ul><ol><li><i>ddd</i></li><li><i>dfff</i></li><li><i>dfd</i></li></ol><blockquote><p><i>ghggggggggggggg</i></p><p>&nbsp;</p></blockquote>', '2020-03-03 11:43:01', 1, NULL, 'http://www.exemple.com', 'placeat-ut-error-au');

-- --------------------------------------------------------

--
-- Structure de la table `actualite_image`
--

CREATE TABLE `actualite_image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actualite_image`
--

INSERT INTO `actualite_image` (`id`, `url`) VALUES
(1, NULL),
(2, NULL),
(3, '5e3934e22f787033202560.png'),
(4, '5e3981e9627b6889523704.png'),
(5, '5e39822ace553428216011.jpg'),
(6, '5e39825c498cf610893695.png'),
(7, '5e3983173c78d919786687.png'),
(8, '5e3983815fabb550144947.png'),
(9, '5e39877988cea738555613.jpg'),
(10, '5e5e34b077c4b394597086.png');

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
(99, '5dfb2dd925054548052461.pdf', 143935, 'application/pdf'),
(100, '5e5fdcb47e8c2546747869.png', 169239, 'image/jpeg'),
(101, '5e5fdcc63772e864745313.png', 60753, 'image/png'),
(102, '5e5fddaed6b49880270100.png', 172940, 'image/jpeg'),
(103, '5e5fddf17ed7b858588296.png', 316801, 'image/png'),
(104, '5e5fe0504b451551020842.jpg', 806975, 'image/jpeg');

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
-- Structure de la table `contact_fournisseur`
--

CREATE TABLE `contact_fournisseur` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `date_validation` datetime DEFAULT NULL,
  `statut` tinyint(1) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact_fournisseur`
--

INSERT INTO `contact_fournisseur` (`id`, `fournisseur_id`, `contact`, `phone`, `email`, `message`, `created`, `date_validation`, `statut`, `is_read`, `date_read`, `del`) VALUES
(1, NULL, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'sssssssssssssss', '2020-03-02 14:47:46', NULL, 0, 0, NULL, 1),
(2, 82, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'azazazazazaz', '2020-03-02 14:52:00', '2020-03-03 12:08:23', 1, 1, '2020-03-05 12:02:52', 0),
(3, 82, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'SDSDSDSSDSS', '2020-03-02 15:02:06', NULL, 1, 1, '2020-03-03 11:01:25', 0),
(4, 82, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'azazazazaza', '2020-03-02 15:02:36', NULL, 1, 1, '2020-03-03 11:01:56', 0),
(5, 83, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'aji ntfahmo', '2020-03-04 09:18:36', NULL, 0, 0, NULL, 0),
(6, 83, 'YOUNESS ARBOUH', '+33696318051', 'webmaster@3findustrie.com', 'aaaaaaaaaaa', '2020-03-04 09:19:12', NULL, 0, 0, NULL, 0),
(7, 83, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'sdsdsdsdsds', '2020-03-04 09:44:34', NULL, 0, 0, NULL, 0),
(8, 83, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'ggggggggggg', '2020-03-04 09:56:13', NULL, 0, 0, NULL, 0),
(9, 82, 'YOUNESS ARBOUH', '+212696318051', 'webmaster@3findustrie.com', 'hghghghghgh', '2020-03-04 09:56:27', NULL, 0, 0, NULL, 0);

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
  `duree_id` int(11) DEFAULT NULL,
  `prix` double NOT NULL,
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `currency_id` int(11) DEFAULT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_achat`
--

INSERT INTO `demande_achat` (`id`, `acheteur_id`, `statut`, `reference`, `description`, `date_expiration`, `is_public`, `nbr_visite`, `nbr_share`, `created`, `date_modification`, `is_alerted`, `is_anonyme`, `budget`, `del`, `motif_rejet_id`, `currency_id`, `pays`, `ville`, `titre`, `slug`) VALUES
(2, 76, 1, 'aaaaa0q', 'azertyuioppok', '2019-11-30 23:03:00', 1, 0, 5, '2019-11-25 08:03:25', '2019-11-28 14:00:30', 1, 0, 25132, 0, NULL, 1, NULL, NULL, 'titre-2', 'titre-2'),
(3, 76, 0, 'qdqdsqsd', 'azqsdazeqd', '2019-11-26 08:03:00', 1, 0, 0, '2019-11-26 17:04:17', '2019-11-14 17:10:38', 0, 0, 11555, 0, NULL, 11, NULL, NULL, 'titre-3', 'titre-3'),
(4, 76, 0, 'test', 'aji tfhel achno fhemt', '2019-11-30 12:20:00', 1, 0, 0, '2019-11-28 12:21:21', '2019-11-28 12:21:21', 0, 0, 5000, 0, NULL, 5, NULL, NULL, 'titre-4', 'titre-4'),
(5, 76, 0, 'test2', 'mmmmmmmmmm', '2019-11-30 12:21:00', 1, 0, 0, '2019-11-28 12:22:21', '2019-11-28 12:22:21', 0, 0, 1, 0, NULL, 5, NULL, NULL, 'titre-5', 'titre-5'),
(6, 76, 1, 'aaaaa0', 'testtttttt', '2019-12-25 16:53:00', 1, 0, 0, '2019-12-02 16:53:55', '2019-12-02 16:53:55', 0, 0, 251101, 0, NULL, 9, NULL, NULL, 'titre-6', 'titre-6'),
(7, 76, 1, 'aaaaa0sqd', 'azazeaqsdqq', '2019-12-24 17:01:00', 1, 0, 0, '2019-12-02 17:01:26', '2019-12-02 17:11:10', 0, 0, 10001, 0, NULL, 5, NULL, NULL, 'titre-7', 'titre-7'),
(8, 76, 0, 'abcde5', 'qsqdqsdqqqaq5', '2020-01-09 17:01:00', 1, 0, 0, '2019-12-02 17:01:50', '2019-12-10 18:05:29', 0, 1, 20199.5025, 1, NULL, 5, NULL, NULL, 'titre-8', 'titre-8'),
(9, 76, 1, 'qqqqqq', 'azertyuuuuu', '2019-12-25 17:02:00', 1, 0, 0, '2019-12-02 17:02:29', '2019-12-02 18:05:53', 0, 0, 5000, 0, NULL, 1, NULL, NULL, 'titre-9', 'titre-9'),
(10, 76, 1, '102454', 'azertyuopaja', '2019-12-25 09:06:00', 1, 0, 0, '2019-12-03 09:07:34', '2019-12-10 11:45:15', 0, 1, 500000.55, 0, NULL, 11, NULL, NULL, 'titre-10', 'titre-10'),
(11, 76, 1, 'aaaaa', 'aaaaaaaaaaaaaaaa', '2019-12-09 09:07:00', 1, 0, 0, '2019-12-03 09:08:03', '2019-12-06 17:35:52', 1, 0, 8888886, 0, NULL, 6, NULL, NULL, 'titre-11', 'titre-11'),
(12, 76, 1, 'azqs', 'azertyuiuu', '2019-12-18 09:08:00', 1, 0, 0, '2019-12-03 09:08:27', '2019-12-03 09:25:41', 0, 0, 12447, 0, NULL, 4, NULL, NULL, 'titre-12', 'titre-12'),
(13, 76, 0, 'En attente', 'azertyuuuuuu', '2019-12-31 16:35:00', 1, 0, 0, '2019-12-10 16:36:25', '2019-12-10 18:03:17', 0, 0, 201588.55, 1, NULL, 9, NULL, NULL, 'titre-13', 'titre-13'),
(14, 76, 1, '2019-8', 'azerty yyyyy', '2019-12-29 17:06:00', 1, 0, 0, '2019-12-10 17:07:28', '2019-12-10 18:01:56', 0, 0, 250.55, 0, NULL, 5, NULL, NULL, 'titre-14', 'titre-14'),
(15, 76, 1, '2019-10', 'teeeeeeeeeeeeeeestj', '2019-12-30 18:02:00', 1, 0, 0, '2019-12-10 18:03:05', '2019-12-19 08:59:36', 1, 0, 5000.51, 0, NULL, 11, NULL, NULL, 'titre-15', 'titre-15'),
(16, 76, 0, '2019-9', 'aaaaaaaaaaaaa', '2019-12-31 18:03:00', 0, 0, 0, '2019-12-10 18:04:03', '2020-01-08 20:09:01', 0, 0, 255.25, 0, NULL, 11, NULL, NULL, 'titre-16', 'titre-16'),
(17, 80, 1, '2019-11', 'teeeeeeeeeeeeest', '2019-12-25 11:39:00', 1, 0, 0, '2019-12-17 11:40:50', '2019-12-17 12:01:38', 0, 0, 20000.5, 0, NULL, 9, NULL, NULL, 'titre-17', 'titre-17'),
(18, 80, 1, '2019-12', 'c\'est tjrs pour le test222', '2019-12-27 18:17:00', 1, 1, 0, '2019-12-17 12:19:49', '2019-12-19 08:58:16', 1, 0, 25000, 0, NULL, 1, NULL, NULL, 'titre-18', 'titre-18'),
(19, 76, 0, '2020-1', 'aaaaaaaaaaaaaaaaa', '2020-01-31 16:58:00', 1, 0, 0, '2020-01-20 16:58:54', '2020-01-20 17:01:09', 1, 0, 20000, 0, NULL, NULL, NULL, NULL, 'titre-19', 'titre-19'),
(20, 76, 1, '2020-1', 'Sed perferendis Nam ', '2020-02-19 16:34:00', 1, 0, 0, '2020-02-03 16:34:46', '2020-02-03 16:39:43', 0, 0, 22, 0, NULL, NULL, 'Maroc', 'Casablanca', 'titre-20', 'titre-20'),
(21, 76, 0, NULL, 'azazazazazaz', '2020-03-04 17:43:27', 0, 0, 0, '2020-03-04 17:43:40', '2020-03-04 18:07:30', 0, 0, 5000, 0, NULL, NULL, 'Maroc', 'Casablanca', 'Electrical wiring / interconnextion system ( EWIS )', 'electrical-wiring-interconnextion-system-ewis-21'),
(22, 76, 1, '2020-2', 'sdfsdfsfdsfsdf', '2020-03-04 17:46:45', 1, 0, 0, '2020-03-04 17:46:57', '2020-03-05 11:11:32', 0, 0, 88855588, 0, NULL, NULL, 'Maroc', 'Casablanca', 'Electrical wiring / interconnextion system ( EWIS )', 'electrical-wiring-interconnextion-system-ewis'),
(23, 76, 0, NULL, ' loading: true, loading: true, loading: true, loading: true,', '2020-03-29 18:10:00', 0, 0, 0, '2020-03-04 18:11:15', '2020-03-04 18:11:14', 0, 0, 1552, 0, NULL, NULL, 'Maroc', 'Casablanca', 'Familliarisation avion ( M & H )', 'familliarisation-avion-m-h'),
(24, 76, 0, NULL, 'Corrupti voluptate ', '2020-03-28 18:11:00', 0, 0, 0, '2020-03-04 18:12:06', '2020-03-04 18:12:06', 0, 0, 88, 0, NULL, NULL, 'Maroc', 'Casablanca', 'Dolorem temporibus p', 'dolorem-temporibus-p'),
(25, 76, 0, NULL, 'Accusantium aut tene', '2020-03-20 16:14:00', 1, 0, 0, '2020-03-04 18:14:39', '2020-03-04 18:14:39', 0, 0, 22, 0, NULL, NULL, 'Maroc', 'Casablanca', 'Dolore sit aut amet', 'dolore-sit-aut-amet'),
(26, 76, 1, '2020-3', 'Rem quos obcaecati q', '2020-03-31 18:14:00', 1, 0, 0, '2020-03-04 18:14:59', '2020-03-05 11:11:51', 0, 0, 18, 0, NULL, NULL, 'Maroc', 'Casablanca', 'Qui aliquip ducimus', 'qui-aliquip-ducimus');

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
(15, 99),
(21, 102),
(21, 103),
(21, 104),
(22, 101);

-- --------------------------------------------------------

--
-- Structure de la table `demande_devis`
--

CREATE TABLE `demande_devis` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `societe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `del` tinyint(1) NOT NULL,
  `date_validation` datetime DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_devis`
--

INSERT INTO `demande_devis` (`id`, `produit_id`, `contact`, `societe`, `phone`, `email`, `message`, `created`, `adresse`, `statut`, `del`, `date_validation`, `quantity`, `fournisseur_id`, `is_read`, `date_read`) VALUES
(1, 19, 'ARBOUH Youness', NULL, '+212696318051', 'webmaster@3findustrie.com', 'aaaaaaaaaaaaaaa', '2020-02-18 15:49:05', 'aaaaaaaaaaaaaaaaaa', 0, 0, NULL, NULL, 82, 0, NULL),
(2, 19, 'ARBOUH Youness', '3f industrie', '0696318051', 'webmaster@3findustrie.com', 'azazadazdazdadz', '2020-02-18 15:51:41', 'azazazazazaza', 1, 0, '2020-02-18 15:59:32', NULL, 82, 1, '2020-03-03 09:56:31'),
(3, 19, 'YOUNESS ARBOUH', 'aazazaaaa', '+212696318051', 'webmaster@3findustrie.com', 'sqsqsqsqsqsq', '2020-03-04 11:01:11', 'azazazazaza', 0, 0, NULL, 52, 82, 0, NULL),
(4, 19, 'YOUNESS ARBOUH', 'azazzazaz', '+33696318051', 'webmaster@3findustrie.com', 'azazeaeaze aze', '2020-03-04 11:06:32', 'azazazaz azeaz', 0, 0, NULL, 100, 82, 0, NULL),
(5, 50, 'YOUNESS ARBOUH', '3f industrie', '+212696318051', 'webmaster@3findustrie.com', 'ssdfsdfsdfsf', '2020-03-04 11:23:31', 'azazazazazaza', 0, 0, NULL, 50, 82, 0, NULL),
(6, 19, 'YOUNESS ARBOUH', '3f industrie', '+212696318051', 'webmaster@3findustrie.com', 'sdfsdfsdfsdfsdfsfdsf', '2020-03-04 11:23:49', 'dsdfsdfsdfsdf', 0, 0, NULL, 51, 82, 0, NULL),
(7, 30, 'YOUNESS ARBOUH', '3f industrie', '+212696318051', 'webmaster@3findustrie.com', 'sdfsdfsdfsfsdfsdf', '2020-03-04 11:24:07', 'qsdqsdqsdqsdqs', 0, 0, NULL, 55, 82, 0, NULL),
(8, 32, 'YOUNESS ARBOUH', '3f industrie', '+212696318051', 'webmaster@3findustrie.com', 'sdfsfsdfsdfsf', '2020-03-04 11:24:44', 'sdfsdfsdfsdfsdfs', 0, 0, NULL, NULL, 82, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `demande_dmdabonnement_sous_secteur`
--

CREATE TABLE `demande_dmdabonnement_sous_secteur` (
  `demande_abonnement_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(427, 26);

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
  `currency_id` int(11) DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_vu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `pays_id`, `ville_id`, `societe`, `civilite`, `ice`, `fix`, `website`, `description`, `currency_id`, `slug`, `phone_vu`) VALUES
(82, 1, 1, '3f industrie', 'M.', '123456789123456', '0523221144\r\n', 'https://tailwindcss.com/', 'Une petite description ici pour votre société', 1, '3f-industrie', 2),
(83, 8, 1, '3f industrie', 'M.', NULL, NULL, 'https://tailwindcss.com/', 'Une petite description ici pour votre société', NULL, '3f-industrie-1', 1);

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
(83, 425),
(82, 427),
(82, 431);

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
(1, 82, 26, '2020-03-05 11:21:35');

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
('20200304162759', '2020-03-04 16:28:04');

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
  `del` tinyint(1) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `name`, `del`, `slug`) VALUES
(1, 'Maroc', 0, 'maroc'),
(2, 'France', 0, 'france'),
(3, 'Italie', 0, 'italie'),
(4, 'Irlandes', 0, 'irlandes'),
(5, 'USA', 0, 'usa'),
(6, 'Liba', 0, 'liba'),
(7, 'Mali', 0, 'mali'),
(8, 'Afghanistan ', 0, 'afghanistan'),
(9, 'Afrique du sud ', 0, 'afrique-du-sud'),
(10, 'Albanie ', 0, 'albanie'),
(11, 'Algérie ', 0, 'algérie'),
(12, 'Allemagne ', 0, 'allemagne'),
(13, 'Arabie saoudite ', 0, 'arabie-saoudite'),
(14, 'Argentine ', 0, 'argentine'),
(15, 'Australie ', 0, 'australie'),
(16, 'Autriche ', 0, 'autriche'),
(17, 'Belgique ', 0, 'belgique'),
(18, 'Brésil ', 0, 'brésil'),
(19, 'Bulgarie ', 0, 'bulgarie'),
(20, 'Canada ', 0, 'canada'),
(21, 'Chili ', 0, 'chili'),
(22, 'Chine ', 0, 'chine'),
(23, 'Colombie ', 0, 'colombie'),
(24, 'Corée, Sud ', 0, 'corée,-sud'),
(25, 'Costa Rica ', 0, 'costa-rica'),
(26, 'Croatie ', 0, 'croatie'),
(27, 'Danemark ', 0, 'danemark'),
(28, 'Égypte ', 0, 'égypte'),
(29, 'Émirats Arabes Unis ', 0, 'émirats-arabes-unis'),
(30, 'Équateur ', 0, 'équateur'),
(31, 'El Salvador ', 0, 'el-salvador'),
(32, 'Espagne ', 0, 'espagne'),
(33, 'Finlande ', 0, 'finlande'),
(34, 'Grèce ', 0, 'grèce'),
(35, 'Hong Kong ', 0, 'hong-kong'),
(36, 'Hongrie ', 0, 'hongrie'),
(37, 'Inde ', 0, 'inde'),
(38, 'Indonésie ', 0, 'indonésie'),
(39, 'Israël ', 0, 'israël'),
(40, 'Japon ', 0, 'japon'),
(41, 'Jordanie ', 0, 'jordanie'),
(42, 'Malaisie ', 0, 'malaisie'),
(43, 'Mexique ', 0, 'mexique'),
(44, 'Norvège', 0, 'norvège'),
(45, 'Nouvelle-Zélande ', 0, 'nouvelle-zélande'),
(46, 'Pérou ', 0, 'pérou'),
(47, 'Pakistan ', 0, 'pakistan'),
(48, 'Pays-Bas ', 0, 'pays-bas'),
(49, 'Philippines ', 0, 'philippines'),
(50, 'Pologne ', 0, 'pologne'),
(51, 'Porto Rico ', 0, 'porto-rico'),
(52, 'Portugal ', 0, 'portugal'),
(53, 'République tchèque ', 0, 'république-tchèque'),
(54, 'Roumanie ', 0, 'roumanie'),
(55, 'Royaume-Uni ', 0, 'royaume-uni'),
(56, 'Russie ', 0, 'russie'),
(57, 'Singapour ', 0, 'singapour'),
(58, 'Suède ', 0, 'suède'),
(59, 'Suisse ', 0, 'suisse'),
(60, 'Taiwan ', 0, 'taiwan'),
(61, 'Thaïlande', 0, 'thaïlande'),
(62, 'Turquie ', 0, 'turquie'),
(63, 'Tunisie', 0, 'tunisie'),
(64, 'Mauritanie', 0, 'mauritanie'),
(65, 'Sénégal', 0, 'sénégal'),
(66, 'Côte d’ivoire ', 0, 'côte-d’ivoire'),
(67, 'Ukraine ', 0, 'ukraine'),
(68, 'Venezuela ', 0, 'venezuela'),
(69, 'Yougoslavie ', 0, 'yougoslavie'),
(70, 'Autre', 0, 'autre'),
(84, 'Slovaquie', 0, 'slovaquie'),
(88, 'Béni', 0, 'béni'),
(90, 'Luxembourg', 0, 'luxembourg'),
(91, 'Guinée', 0, 'guinée'),
(92, 'teeeeeeest_deleted-92', 1, 'teeeeeeest_deleted-92'),
(93, 'test_deleted-93', 1, 'test_deleted-93');

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

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `secteur_id` int(11) DEFAULT NULL,
  `sous_secteurs_id` int(11) DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
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
  `featured_image_id_id` int(11) DEFAULT NULL,
  `titre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_vu` int(11) NOT NULL,
  `pays_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `secteur_id`, `sous_secteurs_id`, `categorie_id`, `fournisseur_id`, `fiche_technique_id`, `reference`, `description`, `pu`, `del`, `is_select`, `is_valid`, `created`, `videos`, `featured_image_id_id`, `titre`, `currency_id`, `date_validation`, `slug`, `phone_vu`, `pays_id`) VALUES
(19, 81, 425, 429, 82, 1, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', 11, '2020-02-12 16:14:41', 'titre-titre', 11, 18),
(22, 81, 425, 426, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-1', 0, 1),
(26, 82, 427, 428, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-2', 4, 9),
(28, 82, 431, 432, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-3', 1, 6),
(29, 81, 425, 426, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-4', 3, 11),
(30, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-5', 3, 1),
(32, 81, 425, 429, 82, 1, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-6', 9, 18),
(34, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-7', 2, 1),
(35, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-8', 2, 1),
(36, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-9', 2, 1),
(38, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-10', 3, 1),
(39, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-11', 2, 1),
(40, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-12', 2, 1),
(41, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-13', 2, 1),
(42, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-14', 2, 1),
(43, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-15', 2, 1),
(44, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-16', 2, 1),
(45, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-17', 2, 1),
(47, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 0, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-18', 2, 1),
(48, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-19', 2, 1),
(49, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 10000, 0, 0, 1, '2020-02-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre', NULL, '2020-02-12 16:14:41', 'titre-titre-20', 2, 1),
(50, 81, 425, 429, 82, 11, '122455', 'aaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa\r\n\r\naaaaaaaaaaaaaaaa', 100, 0, 0, 1, '2020-03-12 16:13:56', 'exc818JAHZM', 1, 'Titre titre Titre titre Titre titre', 11, '2020-03-12 16:14:41', 'titre-titre-21', 2, 1);

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
(19, 1),
(19, 2);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`id`, `name`, `del`, `slug`) VALUES
(81, 'Test', 0, 'test'),
(82, 'Secteur 2', 0, 'secteur-2');

-- --------------------------------------------------------

--
-- Structure de la table `select_produit`
--

CREATE TABLE `select_produit` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `select_produit`
--

INSERT INTO `select_produit` (`id`, `produit_id`, `updated`) VALUES
(1, 19, '2020-02-06 12:42:18'),
(2, NULL, '2020-02-06 12:43:40'),
(3, NULL, '2020-02-06 12:44:11'),
(4, NULL, '2020-02-06 13:27:30'),
(5, NULL, '2020-02-06 13:28:01'),
(6, NULL, '2020-02-05 17:08:50'),
(7, NULL, '2020-02-05 17:08:53'),
(8, 19, '2020-02-05 17:08:57'),
(9, 19, '2020-02-05 17:09:00'),
(10, NULL, '2020-02-05 17:09:03');

-- --------------------------------------------------------

--
-- Structure de la table `sous_secteur`
--

CREATE TABLE `sous_secteur` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `secteur_id` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_secteur`
--

INSERT INTO `sous_secteur` (`id`, `name`, `del`, `secteur_id`, `parent`, `slug`) VALUES
(425, 'sous-secteur', 0, 81, NULL, 'sous-secteur'),
(426, 'test2', 0, 81, 425, 'test-2'),
(427, 'SS Parent', 0, 82, NULL, 'ss-parent'),
(428, 'SSchild', 0, 82, 427, 'ss-child'),
(429, 'test3', 0, 81, 425, 'test-3'),
(430, 'SSchild1-2', 0, 82, 427, 'ss-child-1-2'),
(431, 'SS Parent 2', 0, 82, NULL, 'ss-parent-2'),
(432, 'SSchild2', 0, 82, 431, 'ss-child-2');

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
(6, 75, 'kkk', 'kkkk', NULL, 'Demande Offre d\'abonnement fournisseur', 0, '2020-01-07 17:46:35'),
(7, 75, 'Acier, Bois et Tôle', 'Acier Inoxydable', 'ssssss', 'Ajout produit par fournisseur', 0, '2020-01-20 10:35:10'),
(8, 75, 'Acier, Bois et Tôle', 'Acier Inoxydable', 'aazerty', 'Ajout produit par fournisseur', 0, '2020-01-20 10:42:02'),
(9, 75, 'Acier, Bois et Tôle', 'Acier Inoxydable', 'ssss', 'Ajout produit par fournisseur', 0, '2020-01-20 10:44:09'),
(10, 75, 'Acier, Bois et Tôle', 'Acier Inoxydable', 'test', 'Ajout produit par fournisseur', 0, '2020-01-22 11:45:34');

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
(3, 'HAY EL KHAIRoo', 'HAY EL KHAIRoo', 2600, '+212696318051', 'youness.arbouh1sd@gmail.com', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 0, 1, '2019-08-05 17:21:18', 'firstFournisseur', 'lastfrns', 'frsnora', 'Fournisseur', 'ROLE_FOURNISSEUR', 1565021174, NULL, 'mpTGWY.Z9OjHTGSgCwV7apEqapombk', 1, '/dashboard_fr'),
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
(81, '36, rue imam al boukhari maarif', 'youness.arbouh55@gmail.com', NULL, '0696318051', 'bounce@3findustrie.ma', '$2y$13$bYoEpEPrFt7.eUdhzPiG1ueeGdhXes7RC/wWXIE2Z9Dkn7WWwwZpi', 0, 1, '2019-12-24 09:20:37', 'ARBOUH', 'Youness', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, 40, '/dashboard'),
(82, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouh1@gmail.com', '$2y$13$H./PWBuS/z5G4Zb2vnhUUeecSGafd4WpT6HOKJdB2aLajgV2sV57q', 0, 1, '2020-02-10 16:19:15', 'ARBOUH', 'Youness', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, 6, '/dashboard'),
(83, NULL, NULL, NULL, '0696318051', 'test@gmail.com', '$2y$13$T8jNKEcHY518EEZyUh79suLLAlLS9mdsVZusoguM0ctmuLNHDuHXq', 0, 1, '2020-02-10 16:41:12', 'ARBOUH', 'Youness', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR_PRE', NULL, NULL, 'q&BastBzQw5GunU1yl1UMIL.H4aw2E', NULL, '/register/fournisseur'),
(84, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'webmastefghr@3findustrie.com', '$2y$13$uYLL7akTZ//jn8pGRSzPjusay5ZjR9PJVSAJd1PQb4MGWi6NM08.S', 0, 1, '2020-02-10 16:56:43', 'ARBOUH', 'Youness', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard_ac');

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
  ADD KEY `IDX_351268BB77E5854A` (`mode_id`),
  ADD KEY `IDX_351268BBD13C140` (`duree_id`),
  ADD KEY `IDX_351268BB38248176` (`currency_id`);

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
-- Index pour la table `actualite`
--
ALTER TABLE `actualite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_54928197989D9B62` (`slug`),
  ADD KEY `IDX_549281973DA5256D` (`image_id`);

--
-- Index pour la table `actualite_image`
--
ALTER TABLE `actualite_image`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `contact_fournisseur`
--
ALTER TABLE `contact_fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5832758C670C757F` (`fournisseur_id`);

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
  ADD UNIQUE KEY `UNIQ_D077077F989D9B62` (`slug`),
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
  ADD UNIQUE KEY `UNIQ_369ECA32989D9B62` (`slug`),
  ADD KEY `IDX_369ECA32A6E44244` (`pays_id`),
  ADD KEY `IDX_369ECA32A73F0036` (`ville_id`),
  ADD KEY `IDX_369ECA3238248176` (`currency_id`),
  ADD KEY `indexe_fournisseur` (`societe`(191));

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_349F3CAE989D9B62` (`slug`);

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
  ADD UNIQUE KEY `UNIQ_29A5EC27989D9B62` (`slug`),
  ADD KEY `IDX_29A5EC279F7E4405` (`secteur_id`),
  ADD KEY `IDX_29A5EC27D7BD44DD` (`sous_secteurs_id`),
  ADD KEY `IDX_29A5EC27670C757F` (`fournisseur_id`),
  ADD KEY `IDX_29A5EC27431AD613` (`fiche_technique_id`),
  ADD KEY `IDX_29A5EC27BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_29A5EC276E694C1F` (`featured_image_id_id`),
  ADD KEY `IDX_29A5EC2738248176` (`currency_id`),
  ADD KEY `indexes_produit2` (`is_valid`),
  ADD KEY `indexes_produit3` (`del`),
  ADD KEY `indexes_produit` (`titre`),
  ADD KEY `IDX_29A5EC27A6E44244` (`pays_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8045251F989D9B62` (`slug`);

--
-- Index pour la table `select_produit`
--
ALTER TABLE `select_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F7E2627EF347EFB` (`produit_id`);

--
-- Index pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A34C5D52989D9B62` (`slug`),
  ADD KEY `IDX_A34C5D529F7E4405` (`secteur_id`),
  ADD KEY `IDX_A34C5D523D8E604F` (`parent`),
  ADD KEY `indexes_sous_secteur` (`name`,`parent`),
  ADD KEY `indexes_sous_secteur2` (`del`);

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
  ADD KEY `IDX_8D93D64986383B10` (`avatar_id`),
  ADD KEY `indexes_user2` (`isactif`),
  ADD KEY `indexes_user` (`del`);

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
-- AUTO_INCREMENT pour la table `actualite`
--
ALTER TABLE `actualite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `actualite_image`
--
ALTER TABLE `actualite_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `attachement`
--
ALTER TABLE `attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pour la table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `black_listes`
--
ALTER TABLE `black_listes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contact_fournisseur`
--
ALTER TABLE `contact_fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `demande_abonnement`
--
ALTER TABLE `demande_abonnement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `demande_devis`
--
ALTER TABLE `demande_devis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `demande_jeton`
--
ALTER TABLE `demande_jeton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `detail_visite`
--
ALTER TABLE `detail_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `diffusion_demande`
--
ALTER TABLE `diffusion_demande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `image_produit`
--
ALTER TABLE `image_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `jeton`
--
ALTER TABLE `jeton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `select_produit`
--
ALTER TABLE `select_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT pour la table `suggestion_secteur`
--
ALTER TABLE `suggestion_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

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
  ADD CONSTRAINT `FK_351268BB38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_351268BB4CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`),
  ADD CONSTRAINT `FK_351268BB670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_351268BB77E5854A` FOREIGN KEY (`mode_id`) REFERENCES `paiement` (`id`),
  ADD CONSTRAINT `FK_351268BB7854071C` FOREIGN KEY (`commercial_id`) REFERENCES `commercial` (`id`),
  ADD CONSTRAINT `FK_351268BB80E95E18` FOREIGN KEY (`demande_id`) REFERENCES `demande_abonnement` (`id`),
  ADD CONSTRAINT `FK_351268BB9F2C3FAB` FOREIGN KEY (`zone_id`) REFERENCES `zone_commercial` (`id`),
  ADD CONSTRAINT `FK_351268BBD13C140` FOREIGN KEY (`duree_id`) REFERENCES `duree` (`id`);

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
-- Contraintes pour la table `actualite`
--
ALTER TABLE `actualite`
  ADD CONSTRAINT `FK_549281973DA5256D` FOREIGN KEY (`image_id`) REFERENCES `actualite_image` (`id`);

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
-- Contraintes pour la table `contact_fournisseur`
--
ALTER TABLE `contact_fournisseur`
  ADD CONSTRAINT `FK_5832758C670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`);

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
  ADD CONSTRAINT `FK_29A5EC27A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `sous_secteur` (`id`),
  ADD CONSTRAINT `FK_29A5EC27D7BD44DD` FOREIGN KEY (`sous_secteurs_id`) REFERENCES `sous_secteur` (`id`);

--
-- Contraintes pour la table `produit_image_produit`
--
ALTER TABLE `produit_image_produit`
  ADD CONSTRAINT `FK_92EB1D2563EA69CD` FOREIGN KEY (`image_produit_id`) REFERENCES `image_produit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_92EB1D25F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `select_produit`
--
ALTER TABLE `select_produit`
  ADD CONSTRAINT `FK_F7E2627EF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

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

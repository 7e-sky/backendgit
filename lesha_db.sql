-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 26 juin 2020 à 13:35
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
  `remise` double NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `commentaire` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL
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
  `currency_id` int(11) DEFAULT NULL,
  `step` int(11) NOT NULL,
  `is_complet` tinyint(1) NOT NULL,
  `code_client` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autre_ville` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autre_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `pays_id`, `ville_id`, `societe`, `parent2`, `civilite`, `ice`, `fix`, `website`, `description`, `secteur_id`, `currency_id`, `step`, `is_complet`, `code_client`, `autre_ville`, `autre_currency`) VALUES
(3, 144, 1, '7e-sky', NULL, 'M.', '001531606000066', '0522365797', 'https://www.lesachatsindustrie', 'Les Achats Industriels est une place de marché qui permet aux Acheteurs et aux Fournisseurs de se rencontrer dans une même plate-forme (électronique).\nNous nous positionnons en tant qu\'intermédiaire entre les deux parties afin de faciliter aux uns et aux autres de vendre ou/et d’acheter de manière fluide, économique, rapide, sans limites géographique .\n\n', 25, 11, 0, 0, NULL, NULL, NULL),
(40, 144, 1, 'Etablissement Ganem', NULL, '', NULL, '0673081295', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(53, 144, 2, 'Compagnie Marocaine', NULL, '', NULL, '0999999', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(58, 144, 9, 'YAZAKI MAROC', NULL, '', NULL, '212537369055', 'www.yazaki-europe.com', '', NULL, 11, 0, 0, NULL, NULL, NULL),
(59, 144, 1, 'SIGMATEL', NULL, '', NULL, '0522974749', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(60, 144, 31, 'SAMIR', NULL, '', NULL, '212523319407', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(66, 144, 15, 'beton engineering de settat s.a', NULL, '', NULL, '05234044420523400111', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(68, 144, 1, 'M\'dina Bus', NULL, '', NULL, '0522995769', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(70, 144, 1, 'Groupe Capital Finance', NULL, '', NULL, '0522363907', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(73, 144, 1, 'Raccomat', NULL, '', NULL, '0661350591', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(74, 144, 1, 'Raccomat', NULL, '', NULL, '0661350591', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(76, 144, 1, 'STE FIRST PNEUMATIQUES SARL', NULL, '', NULL, '0661324297', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(77, 144, 31, 'NEXANS', NULL, '', NULL, '0523319032', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(78, 144, 7, 'YAZAKI MAROC', NULL, '', NULL, '00212660193215', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(80, 75, 42, 'Fives Stein', NULL, '', NULL, '0033160911156', 'www.fivesgroup.com', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(81, 144, 1, 'Expense Reduction Analysts', NULL, '', NULL, '0661318698', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(83, 144, 1, 'centrale laitiere', NULL, '', NULL, '0522958195', 'www.centralelaitiere.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(84, 144, 1, 'TRAREM AFRIQUE', NULL, '', NULL, '0522401216', 'www.trarem.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(89, 144, 41, 'el johri', NULL, '', NULL, '0611670692', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(90, 144, 1, 'MAOS S.A.R.L', NULL, '', NULL, '0664236524', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(94, 144, 1, 'Stockpralim', NULL, '', NULL, '00212522445588', 'www.stockpralim.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(96, 144, 2, 'Nemotek Technologie', NULL, '', NULL, '00212661269098', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(99, 144, 1, 'LOGISMAR', NULL, '', NULL, '0522538711', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(101, 144, 1, 'Institution Balzac', NULL, '', NULL, '00212661258467', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(102, 144, 1, 'GIPAM', NULL, '', NULL, '05 22 96 47 44 ', 'www.carven.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(103, 144, 1, 'DHL Logistics Morocco', NULL, '', NULL, '00212661295975', 'www.dhl.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(104, 144, 2, 'NEO Immobilier', NULL, '', NULL, '0537673767', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(105, 144, 14, 'COMEA', NULL, '', NULL, '0624650866', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(107, 144, 1, 'Vandesko', NULL, '', NULL, '0642061914', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(108, 144, 12, 'ABU EISHEH CONTRUCTION', NULL, '', NULL, '0524420096', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(114, 144, 1, 'HOLSATEK', NULL, '', NULL, '0661052050', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(122, 144, 1, 'BIMO', NULL, '', NULL, '0522345300', 'WWW.BIMO.MA', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(123, 144, 1, 'BMCE Bank', NULL, '', NULL, '0665268989', 'www.bmcebank.co.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(125, 144, 1, 'Office National de l\'Electricité', NULL, '', NULL, '0662384686', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(127, 144, 1, 'MINDS', NULL, '', NULL, '0522224489', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(129, 144, 1, 'STCR', NULL, '', NULL, '0522343535', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(134, 144, 1, 'Recoli-sarl', NULL, '', NULL, '0669770616', 'www.recoli-monde.fr.gd', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(135, 75, 81, 'ZB Distribution', NULL, '', NULL, '0320112763', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(136, 44, 90, 'CJM Consulting', NULL, '', NULL, '13926031779', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(138, 75, 33, 'high.loog technology', NULL, '', NULL, '0142758496', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(141, 144, 31, 'DELIPAT S.A.', NULL, '', NULL, '0523313333', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(143, 144, 12, 'GROUPE MENARA HOLDING', NULL, '', NULL, '052449990015', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(144, 144, 12, 'MENARA PREFA', NULL, '', NULL, '05244900', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(145, 144, 12, 'Groupe Menara (Carriéres et Transport Menara) ', NULL, '', NULL, '0524499900', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(146, 144, 1, 'AB INDUSTRIE', NULL, '', NULL, '0522947626', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(147, 144, 1, 'MEDI TELECOM', NULL, '', NULL, '0665551000', 'www.meditel.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(150, 144, 1, 'SONASID', NULL, '', NULL, '0021222954100', 'WWW.SONASID.MA', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(151, 144, 87, 'TEBELEC', NULL, '', NULL, '212528247300', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(152, 144, 12, 'GROUPE MENARA HOLDING/Tri Atlas Motors', NULL, '', NULL, '0524356588', 'www.triatlasmotors.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(153, 144, 1, 'CMS', NULL, '', NULL, '+ 212 522 43 06 81', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(156, 144, 1, 'Proequipment', NULL, '', NULL, '0522326289', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(160, 144, 1, 'aswak assalam', NULL, '', NULL, '00212522341851', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(162, 144, 85, 'Ominium General d\'Electricité', NULL, '', NULL, '0522536310', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(164, 75, 84, 'ROTTENDORF PHARMA SAS', NULL, '', NULL, '0033327434500', 'www.rottendorf.fr', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(166, 144, 1, 'Meditel', NULL, '', NULL, '0520203103', 'www.meditel.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(167, 128, 106, 'EVOrient', NULL, '', NULL, '0033632359056', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(170, 144, 12, 'ATELIER GRAIN DE SEL', NULL, '', NULL, '0670222411', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(179, 144, 12, 'GROUPE MENARA / INFORMATIQUE', NULL, '', NULL, '05 24 49 99 00', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(182, 144, 2, 'Poste Maroc', NULL, '', NULL, '0537210650', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(183, 144, 1, 'ASWAK ASSALAM', NULL, '', NULL, '0610932090', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(184, 144, 2, 'AS BUSINESS', NULL, '', NULL, '0663359078', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(185, 144, 7, 'ALUMINIUM DU MAROC', NULL, '', NULL, '0021253932290', 'www.aluminiumdumaroc.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(186, 144, 1, 'SONASID', NULL, '', NULL, '212522954100', 'WWW.SONASID.MA', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(191, 75, 105, 'sarl le midi', NULL, '', NULL, '0661749613', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(193, 144, 1, 'consocenter', NULL, '', NULL, '0522982592', 'WWW.CONSOCENTER.MA', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(207, 144, 1, 'Unilever Maghreb', NULL, '', NULL, '0522345097', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(208, 144, 1, 'SEMA CONSEIL', NULL, '', NULL, '0648311537', 'WWW.SEMACONSEIL.COM', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(211, 144, 1, 'cie cherifienne de chocolaterie', NULL, '', NULL, '0522859346', 'www.aiguebelle.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(212, 144, 1, 'Geodis Logistics', NULL, '', NULL, '0661817033', 'www.geodis.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(213, 144, 1, 'Geodis Logistics Maroc', NULL, '', NULL, '0661857559', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(214, 144, 1, 'akwa immobilier', NULL, '', NULL, '0669588582', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(217, 144, 1, 'MAROQUIP', NULL, '', NULL, '0675388854', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(230, 144, 1, 'FAST INDUSTRIE', NULL, '', NULL, '0522638143', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(234, 144, 1, 'HILTI', NULL, '', NULL, '00212522257301', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(242, 144, 1, 'GEODIS MAROC ', NULL, '', NULL, '0522669977', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(245, 144, 1, 'AVENIR FORMATION', NULL, '', NULL, '0522203664', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(247, 144, 7, 'MSCM', NULL, '', NULL, '0606060606', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(249, 144, 32, 'Excelsa Techniques Composites', NULL, '', NULL, '00212 522592053', 'www.excelsa-maroc.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(251, 144, 12, 'GROUPE MENARA HOLDING/MARRAKECH GRAND PRIX', NULL, '', NULL, '05 24 45 84 08', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(256, 144, 1, 'OPTIMACHAT', NULL, '', NULL, '0522944790', NULL, NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(259, 144, 1, 'PRODEC', NULL, '', NULL, '0522667800', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(260, 144, 34, 'NRJ Mecanique', NULL, '', NULL, '0661170732', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(261, 59, 104, 'SAIEM SARL', NULL, '', NULL, '22995341834', 'saiem.fr', NULL, NULL, 2, 0, 0, NULL, NULL, NULL),
(263, 144, 1, 'ISmedia', NULL, '', NULL, '05224327778', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(264, 144, 32, 'Laboratoires Galenica', NULL, '', NULL, '212522859900', 'www.galenica.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(266, 144, 7, 'International cabinet of consulting and brokerage', NULL, '', NULL, '00212667226854', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(271, 144, 1, 'MFC', NULL, '', NULL, '0522320909', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(272, 144, 1, 'MITC', NULL, '', NULL, '212522507871', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(277, 75, 74, 'TEFAL SAS', NULL, '', NULL, '0450885183', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(278, 144, 1, 'MITC', NULL, '', NULL, '0522507552', 'www.technopark.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(283, 75, 73, 'terre de provence', NULL, '', NULL, '0650696536', '', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(284, 144, 1, 'EQUINDUS', NULL, '', NULL, '0522209719', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(287, 144, 1, 'audio Visuel Systeme ', NULL, '', NULL, '0522342934', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(292, 144, 9, 'ENATCOM', NULL, '', NULL, '0537378361', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(293, 144, 1, 'STROC', NULL, '', NULL, '0522991570', 'www.stroc.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(294, 144, 1, 'Ciments du Maroc', NULL, '', NULL, '0522859450', 'www.cimentsdumaroc.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(297, 144, 1, 'STROC', NULL, '', NULL, '212671275430', 'www.stroc.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(299, 144, 2, 'TAD', NULL, '', NULL, '0640261431', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(302, 144, 1, 'Sanofi-Aventis Maroc', NULL, '', NULL, '0522669173', 'www.sanofi-aventis.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(304, 144, 1, 'CAPEP', NULL, '', NULL, '0669281310', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(305, 144, 1, 'CAPEP', NULL, '', NULL, '0669590062', 'www.capep.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(306, 144, 1, 'MONTEPULL', NULL, '', NULL, '0522651449', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(313, 75, 33, 'Itaiquer', NULL, '', NULL, '0033654776987', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(318, 144, 1, 'AIGUEBELLE', NULL, '', NULL, '212522803983', 'www.aiguebelle.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(320, 144, 6, 'MEPOTRAV', NULL, '', NULL, '05 35 54 86 81 ', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(324, 144, 1, 'VISPRO MAROC', NULL, '', NULL, '0522341698', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(335, 144, 2, 'BCI FOOD', NULL, '', NULL, '0537705421', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(336, 75, 67, 'AB&CO CONTROLING', NULL, '', NULL, '0637137745', 'www.sarlabco', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(337, 144, 1, 'Richbond', NULL, '', NULL, '0522754888', 'www.richbond.ma', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(345, 144, 1, 'ASSALAF CHAABI', NULL, '', NULL, '0522393900', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(351, 75, 64, 'TFE', NULL, '', NULL, '0659800462', 'www.grouptfe.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(355, 144, 1, 'EASY DIS', NULL, '', NULL, '212522251059', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(357, 75, 62, 'fakrane Import Export', NULL, '', NULL, '00330486184304', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(358, 144, 25, 'Asment de Temara', NULL, '', NULL, '212668186126', 'www.cimpor.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(360, 144, 1, 'kHELLOUD', NULL, '', NULL, '0664367174', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(361, 144, 1, 'mpes', NULL, '', NULL, '0679082824', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(362, 144, 31, 'omatrac', NULL, '', NULL, '0522661544', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(366, 75, 60, 'CEETRANS', NULL, '', NULL, '0472218334', '', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(368, 75, 59, 'CIRCLEPRINTERS France', NULL, '', NULL, '0160374772', 'www.circleprinters.com', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(370, 144, 34, 'Groupe OCP', NULL, '', NULL, '05 23 34 53 13', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(371, 75, 57, 'Ateliers de la GHaute-Garonne', NULL, '', NULL, '0561836035', 'www.ahg.fr', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(374, 144, 56, 'EXTRALAP', NULL, '', NULL, '00212553867720', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(376, 4, 55, 'SPIM', NULL, '', NULL, '00213669350585', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(377, 75, 54, 'GESTICIEL', NULL, '', NULL, '0000000000', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(384, 144, 32, 'Gaches Chimie Specialites Maroc', NULL, '', NULL, '0522592152', 'www.gaches.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(385, 144, 13, 'Sté Nouvelle AVEIRO MAROC', NULL, '', NULL, '0528244889', 'www.aveiro-maroc.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(391, 144, 13, 'ste PERFECT DECOR ', NULL, '', NULL, '00212528333720', 'www.per-deco.com', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(397, 144, 14, 'BADRABAT', NULL, '', NULL, '0664054119', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(399, 203, 49, 'Solemar', NULL, '', NULL, '697459737', '', NULL, NULL, 1, 0, 0, NULL, NULL, NULL),
(400, 144, 31, 'AUGE SAT MAROC', NULL, '', NULL, '0523319206', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(401, 144, 13, 'Les Domaines ', NULL, '', NULL, '0661784950', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(402, 144, 8, 'EVERDICO SARL', NULL, '', NULL, '212672337890', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(404, 144, 31, 'SILA MAROC', NULL, '', NULL, '0523317444', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(419, 144, 1, 'TCE PARTNERS', NULL, '', NULL, '00212674027932', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(422, 144, 1, 'international security business', NULL, '', NULL, '0522204937', 'www.internationalsecuritybusin', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(428, 144, 1, 'CAPEP', NULL, '', NULL, '0669281310', '', NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(439, 144, 1, 'société marocaine de  consomable & informatique', NULL, '', NULL, '0546228131', NULL, NULL, NULL, 11, 0, 0, NULL, NULL, NULL),
(452, 144, 7, 'tmsa', NULL, '', NULL, '0539337000', 'tmsa.ma', 'TMSA à pour fonction la gestion du port tanger Med', NULL, 11, 0, 0, NULL, NULL, NULL),
(455, 144, 1, 'MADIBAT', NULL, '', NULL, '00212522341578', '', 'ENTREPRISE GÉNÉRALE DE BÂTIMENT TOUS CORPS D\'ÉTAT, D\'AGENCEMENT ET DE DECORATION.', NULL, 11, 0, 0, NULL, NULL, NULL),
(457, 144, 1, 'O\'WEAR sarl', NULL, '', NULL, '0522980580', '', 'Tissus,Vetement professionnel et publicitaire', NULL, 11, 0, 0, NULL, NULL, NULL),
(459, 144, 1, 'BRURSA AFRICA CONSTRUCTION', NULL, '', NULL, '0522459345', '', 'Ste de BTP on a actuellement 3 projets au Maroc', NULL, 11, 0, 0, NULL, NULL, NULL),
(460, 75, 50, 'SCIERIE PIVETEAU', NULL, '', NULL, '0251660976', 'www.piveteau.com', 'TRANSFORMATEUR DE BOIS RESINEUX', NULL, 1, 0, 0, NULL, NULL, NULL),
(461, 144, 31, 'AUGE SAT MAROC', NULL, '', NULL, '0661452798', '', 'fabrication et le stockage, \"leadframes\" (support métallique en alliages cuivreux)  de semi-conducteur  pour l\'industrie des composants électronique\r\n', NULL, 11, 0, 0, NULL, NULL, NULL),
(466, 144, 5, 'MAROC MODIS', NULL, '', NULL, '0535737250', '', 'MAROC MODIS c\'est la filiale du groupe TRIUMPH au Maroc, spécialiste dans la lingerie féminine et masculine', NULL, 11, 0, 0, NULL, NULL, NULL),
(467, 144, 1, 'al barid bank', NULL, '', NULL, '0661952910', 'www.poste.ma', 'Etablissement public, créé en1998 suite à l\'entrée en vigueur de loi 24-96 et la séparation des secteurs Poste et Télécommunications.  ', NULL, 11, 0, 0, NULL, NULL, NULL),
(471, 144, 1, 'NETWORK SYSTEMS', NULL, '', NULL, '0522862082', 'www.ns.ma', 'Crée en 1998, Network Systems est spécialisée dans le domaine des technologies de l’information et la fabrication de supports publicitaires. \r\n\r\nNetwork Systems regroupe un staff dynamique, toujours prêts à apporter son savoir-faire à tout moment avec une volonté d’innovation\r\n', NULL, 11, 0, 0, NULL, NULL, NULL),
(472, 144, 1, 'NETWORK SYSTEMS', NULL, '', NULL, '0522862082', 'www.ns.ma', 'Crée en 1998, Network Systems est spécialisée dans le domaine des technologies de l’information et la fabrication de supports publicitaires. \r\n\r\nNetwork Systems regroupe un staff dynamique, toujours prêts à apporter son savoir-faire à tout moment avec une volonté d’innovation.\r\n', NULL, 11, 0, 0, NULL, NULL, NULL),
(473, 144, 13, 'Société NOUVELLE AVEIRO MAROC ', NULL, '', NULL, '+212 5 28 24 48 45 ', 'www.aveiro-maroc.com', 'La société Nouvelle Aveiro Maroc, est spécialisée dans la production et la commercialisation de conserves de poisson ', NULL, 11, 0, 0, NULL, NULL, NULL),
(475, 144, 1, 'ADIMMO', NULL, '', NULL, '0662637305', 'adimmo.ma', 'sté propotion immobilier', NULL, 11, 0, 0, NULL, NULL, NULL),
(478, 144, 23, 'SODALMU', NULL, '', NULL, '00212522354740', 'www.unimergroup.com', 'PRODUCTION ET DISTRIBUTION DE BOISSON GAZEUSE ET D\'EAU DE TABLE', NULL, 11, 0, 0, NULL, NULL, NULL),
(480, 144, 7, 'SIMON HOLDING /INTERNATIONAL', NULL, '', NULL, '0539393434', '', 'SIMON holding est une société spécialiser au fabrication de l\'appareillage éléctrique.', NULL, 11, 0, 0, NULL, NULL, NULL),
(483, 144, 1, 'AVIACOM', NULL, '', NULL, '0522976095', '', 'AVIACOM', NULL, 11, 0, 0, NULL, NULL, NULL),
(486, 144, 1, 'general comptoir technique et industriel', NULL, '', NULL, '0666442753', '', 'Nos segment sont:\r\nManutention\r\nconsommables et fourniture industrielle.\r\nEPI, Protection? vêtement de travail\r\nSignalisation et affichages\r\npetit outillage', NULL, 11, 0, 0, NULL, NULL, NULL),
(569, 144, 2, 'derichebourg ', NULL, '', NULL, '0662776514', '', 'Multiservice, securite, proprete, facility management. Iso9001/2008, Iso14001, Ohsas18001.', NULL, 11, 0, 0, NULL, NULL, NULL),
(571, 144, 1, 'lumieres et technologie', NULL, '', NULL, '212522014045', 'www.lt.ma', 'lumières et technologie leader dans:\r\n- Equipements Aéroportuaires\r\n- Installation ferroviaires\r\n- Prestations industrie et énergie\r\n- Génie civil Electrique ', NULL, 11, 0, 0, NULL, NULL, NULL),
(573, 144, 7, 'APM TERMINALS TANGER', NULL, '', NULL, '0531061100', 'www.apmterminals.com/en/operat', 'APM Terminals Tangier is a leading terminal operator in Morocco, with direct services to 170 ports in 67 countries all around the world.\r\nOver 200 cargo vessels pass daily, carrying global trade between Asia, Europe, Africa and Americas.', NULL, 1, 0, 0, NULL, NULL, NULL),
(574, 144, 7, 'Valeo Vision Maroc', NULL, '', NULL, '0669698317', '', 'Groupes de Produits Systèmes de Visibilité', NULL, 11, 0, 0, NULL, NULL, NULL),
(581, 94, 110, 'Optimized Business Solutions SARL', NULL, '', NULL, '00224625288609', 'ww.obs4you.com', 'Optimized Business Solutions SARL (OBS SARL) est une SARL de droit guinéen (République de Guinée).\r\nNous sommes une 3PLs ', NULL, 11, 0, 0, NULL, NULL, NULL),
(583, 144, 1, 'UNI CONFORT MAROC DOLIDOL', NULL, '', NULL, '00212660113021', 'WWW.DOLIDOL.MA', 'fabrication de la mousse pour matelas et pour automobile, non tissé, dolinape...', NULL, 11, 0, 0, NULL, NULL, NULL),
(584, 144, 9, 'MTA', NULL, '', NULL, '0664176485', '', 'With this new opening the materials and the components for the electromechanical products. ', NULL, 11, 0, 0, NULL, NULL, NULL),
(589, 144, 1, 'KFB SOLUTION', NULL, '', NULL, '0661857812', '', ' KFB Solutions, et une entreprise située au Maroc et qui opère dans le domaine de ventes et la distribution  des équipements mécaniques et matérielle industrielle.', NULL, 11, 0, 0, NULL, NULL, NULL),
(593, 144, 1, 'Nan', NULL, '', NULL, '212456543445', '', 'Test', NULL, 11, 0, 0, NULL, NULL, NULL),
(607, 144, 10, 'transport thm', NULL, '', NULL, '0661705592', 'thm-messagerie.com', 'nous sommes une société de prestation de service', NULL, 11, 0, 0, NULL, NULL, NULL),
(608, 144, 1, 'Espacio Maroc', NULL, '', NULL, '0698755772', '', 'Société spécialisée dans l\'aménagement des espaces professionnels', NULL, 11, 0, 0, NULL, NULL, NULL),
(611, 144, 111, 'nizatlas', NULL, '', NULL, '0678595335', '', 'production', NULL, 11, 0, 0, NULL, NULL, NULL),
(616, 144, 1, 'Unessfr', NULL, '', NULL, '+212696318051', '', 'ok', NULL, 11, 0, 0, NULL, NULL, NULL),
(621, 144, 10, 'SAAD Multi-Services ', NULL, '', NULL, '0611738945', '', 'Télécommunications & Travaux divers ', NULL, 11, 0, 0, NULL, NULL, NULL),
(622, 144, 9, 'INNOVALU', NULL, '', NULL, '0664568444', '', 'TEST', NULL, 11, 0, 0, NULL, NULL, NULL),
(625, 144, 98, 'SAHARA NAVALS', NULL, '', NULL, '0672682909', '', 'reparation et maintenance des bateaux et navires, reparation et maintenance de coque de navires, reparation et maintenance de chaudiere et tuyauterie', NULL, 11, 0, 0, NULL, NULL, NULL),
(626, 144, 25, 'KORCHI-TRAV', NULL, '', NULL, '0694743111', '', 'Travaux divers BTP', NULL, 11, 0, 0, NULL, NULL, NULL),
(628, 144, 1, 'DSTM', NULL, '', NULL, '0668124714', 'www.decayeuxstm.com', 'Présente au Maroc depuis 2006, DSTM est une entreprise, dédiée à la sous-traitance spécialisée dans le matriçage à chaud et l’usinage de métaux non ferreux.', NULL, 11, 0, 0, NULL, NULL, NULL),
(629, 144, 1, 'ENGIE CONTRACTING AL MAGHRIB', NULL, '', NULL, '0661696356', '', 'ACHETEUR/APPROVISIONNEUR ', NULL, 11, 0, 0, NULL, NULL, NULL),
(630, 144, 1, 'soplami', NULL, '', NULL, '(212) 5 22 97 55 57', '', ' Groupe DE VISU repose sur le thermoformage et le façonnage de matières plastiques pour la réalisation  à l’unité, en petites, moyennes et grandes séries – de produits destinés à l’aéronautique, aux industries du transport...', NULL, 11, 0, 0, NULL, NULL, NULL),
(631, 144, 2, 'Marita immobilier ', NULL, '', NULL, '0771136823', '', 'On est un groupe qui fait de l immobilier pbt et voiture électrique ', NULL, 11, 0, 0, NULL, NULL, NULL),
(632, 144, 111, 'Centrale auto TRUCKS SARL', NULL, '', NULL, '0648975475', '', 'marchand de pièces de rechanges, entretien et réparation et négociant', NULL, 11, 0, 0, NULL, NULL, NULL),
(635, 144, 31, 'hôtel AVANTI ', NULL, '', NULL, '05233-06800', '', 'Hôtel ', NULL, 11, 0, 0, NULL, NULL, NULL),
(636, 144, 1, 'SOFT EQUIPEMENT', NULL, '', NULL, '06 61 33 66 74', '', 'Nous sommes une sté de chaudronnerie et tuyauterie en inox\r\nConstruction métallique# travaux d\'inox d\'architecture (inox de décoration)# travaux divers #Equipement des piscines', NULL, 11, 0, 0, NULL, NULL, NULL),
(639, 144, 1, 'STE BB LUX DECOR', NULL, '', NULL, '0663810285', '', 'décoration intérieure\r\ntravaux de tapisserie et menuiseries bois', NULL, 11, 0, 0, NULL, NULL, NULL),
(642, 144, 7, 'comega sarl', NULL, '', NULL, '0638816580', 'imeguisa.com', 'SPECIALISE EN CONSTRUCTION METALLIQUE ', NULL, 11, 0, 0, NULL, NULL, NULL),
(643, 144, 34, 'SETREL', NULL, '', NULL, '0661408111', '', 'Sécurité Electronique : Vidéo Surveillance - Automatisme pour portes - Systems d\'Alarme * Fourniture Informatique / Bureautique * Réseau informatique', NULL, 11, 0, 0, NULL, NULL, NULL),
(646, 144, 34, 'Picostelec', NULL, '', NULL, '0660303330', 'www.picostelec.com', 'Société principales activités électricité industriel climatisation froid et chaudière ', NULL, 11, 0, 0, NULL, NULL, NULL),
(650, 144, 1, 'Casa Univers Services ', NULL, '', NULL, '0669-977-977 ', '', 'Casa prestations services aux entreprises\r\nPlomberie électricité, bois, travaux divers, Décapage sol, et marbre, inox, aluminium \r\n', NULL, 11, 0, 0, NULL, NULL, NULL),
(651, 144, 9, 'Perfect Metrology', NULL, '', NULL, '0662067229', '', 'Service métrologie et instrumentation', NULL, 11, 0, 0, NULL, NULL, NULL),
(653, 144, 98, 'Négoce, Equipements industriels & protection -NEIP', NULL, '', NULL, '0604319895', '', 'Négoce,Equipements industriels & protection    ', NULL, 11, 0, 0, NULL, NULL, NULL),
(656, 144, 2, '82031', NULL, '', NULL, '0659828735', '', 'STE TRAVAUX DIVERS ET SERVICES : BÂTIMENTS INDUSTRIELS - FROID ET CLIMATISATION - ELECTRICITÉ ET MÉCANIQUE\r\n', NULL, 11, 0, 0, NULL, NULL, NULL),
(657, 144, 1, 'ADELMA', NULL, '', NULL, '0522672983', '', 'Industrialisation de tôlerie fine', NULL, 11, 0, 0, NULL, NULL, NULL),
(658, 144, 7, 'COFICAB MAROC', NULL, '', NULL, '0539393569', '', 'Ikram SALIH acheteuse à COFICAB MAROC \r\nMerci à vous tous', NULL, 11, 0, 0, NULL, NULL, NULL),
(663, 144, 1, 'TGCC', NULL, '', NULL, '+212 522 23 88 93', 'www.tgcc.ma/', 'TGCC est présente, depuis plus d’une vingtaine d’années dans le secteur de la construction au Maroc. Elle capitalise, à son actif, de nombreuses références et ouvrages d’envergure.', NULL, 11, 0, 0, NULL, NULL, NULL),
(665, 144, 34, 'SGIEA', NULL, '', NULL, '+212 619 200 256', '', '- Vente et Installations /maintenance, appareillages électrique et instrumentation, quincailleries, plomberie, chauffage, climatisation\r\n- Formation professionnelle en électricité, instrumentation/automatisme et Formation en projet industriel \r\n- Import et Export matériel et activités électriques', NULL, 11, 0, 0, NULL, NULL, NULL),
(682, 144, 1, 'Acheteur 2', NULL, 'M.', '123456789123456', '+212622151213', 'http://www.3finudstrie.com', '', 1, 11, 2, 1, 'A-6827827', NULL, NULL);

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
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apercu` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`id`, `image_id`, `titre`, `description`, `created`, `is_active`, `keywords`, `source`, `slug`, `apercu`) VALUES
(1, 6, 'DHL forme ses chauffeurs à l\'éco-conduite', '<p>L\'op&eacute;ration n\'est pas termin&eacute;e : d\'ici &agrave; 2011, les 1000 autres chauffeurs du sp&eacute;cialiste du transport express seront form&eacute;s &agrave; la conduite &eacute;conomique et &eacute;cologique. Pour 2009, la d&eacute;marche concerne 220 conducteurs et devrait engendrer une &eacute;conomie suppl&eacute;mentaire de 95 000 litres de carburant et de 260 tonnes de CO2. &laquo;Cette d&eacute;marche &agrave; long terme doit faire &eacute;voluer les comportements et les habitudes de conduite&raquo;, explique Fr&eacute;d&eacute;ric Bilot, responsable du programme de formation &eacute;co-driving chez DHL Express. Deux op&eacute;rations vont de pair avec cette formation : l\'offre DHL green permettant aux clients de compenser leurs &eacute;missions de CO2 ainsi que la certification ISO 14001.</p>\r\n<p><font face=\"Arial\">source: http://www.decision-achats.fr/xml/Breves/2009/05/28/29566/DHL-forme-ses-chauffeurs-a-l-eco-conduite/?xtor=RSS-1</font></p>', '2008-10-13 13:13:45', 1, 'cxcc', '', 'dhl-forme-ses-chauffeurs-a-leco-conduite', 'La formation &agrave; l\'&eacute;co-conduite mise en place en 2006 par DHL Express s\'av&egrave;re efficace. L\'initiation de ses 500 chauffeurs a d&eacute;j&agrave; permis d\'&eacute;conomiser pas moins de 185 000 litres de gazole et de r&eacute;duire les &eacute;missions de CO2 de 500 tonnes par an.'),
(2, 6, 'Sony va diviser par deux le nombre de ses fournisseurs dans le monde', 'Celui-ci devrait ainsi passer de 2500 &agrave; 1200 fournisseurs d\'ici &agrave; mars 2011, selon les d&eacute;clarations d\'un porte-parole de l\'entreprise recueillies par Reuters. Objectif : r&eacute;duire les co&ucirc;ts en augmentant le volume des pi&egrave;ces d&eacute;tach&eacute;es et autres composants achet&eacute;s aupr&egrave;s de chacun d\'eux.\r\n<p _counted=\"undefined\">Sony souhaite notamment r&eacute;duire d&egrave;s cette ann&eacute;e ses co&ucirc;ts d\'approvisionnements de 20%.</p>\r\n<p _counted=\"undefined\">Le volume d\'achats actuel de Sony est estim&eacute; &agrave; 2,3 milliards d\'euros.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\">http://www.decision-achats.fr/xml/Breves/2009/05/25/29519/Sony-va-diviser-par-deux-le-nombre-de-ses-fournisseurs-dans-le-monde/?xtor=RSS-1</font></p>', '2008-10-13 17:52:50', 1, '', '', 'sony-va-diviser-par-deux-le-nombre-de-ses-fournisseurs-dans-le-monde', 'Sony a annonc&eacute; son intention de diviser par deux le nombre de ses fournisseurs dans les deux prochaines ann&eacute;es.'),
(8, 6, 'Manpower France déploie une nouvelle plateforme d\'e-procurement', '<p _counted=\"undefined\">&quot;Le mode SaaS propos&eacute; par Perfect Commerce est une opportunit&eacute; de b&eacute;n&eacute;ficier de plus d&rsquo;innovation, a un prix beaucoup plus comp&eacute;titif que dans le mode licence traditionnel&quot;, a d&eacute;clar&eacute; Fabienne Lampel, directrice achats de Manpower France et sponsor du projet, men&eacute; conjointement avec la DSI de l\'entreprise.</p>\r\n<p _counted=\"undefined\">Le d&eacute;ploiement de la nouvelle plateforme doit se d&eacute;rouler sur trois mois, pour un d&eacute;marrage au d&eacute;but de l&rsquo;&eacute;t&eacute; 2009. En plus des cat&eacute;ries trait&eacute;es dans l&rsquo;outil d&rsquo;e-procurement actuel (35 000 commandes par an, 1 600 r&eacute;f&eacute;rences, 5 cat&eacute;ries d&rsquo;achat), Manpower France pr&eacute;voit &agrave; terme de traiter les achats informatiques, ainsi que les achats de prestations et de travaux.</p>\r\n<p _counted=\"undefined\">&quot;Pour Manpower France, ce projet est l&rsquo;occasion d&rsquo;apporter un meilleur service &agrave; nos clients internes&quot;, ajoute Fabienne Lampel.</p>\r\n<p _counted=\"undefined\">Le volume d\'achats de Manpower France est estim&eacute; &agrave; 150 000 euros.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\">http://www.decision-achats.fr/xml/Breves/2009/05/19/29463/Manpower-France-deploie-une-nouvelle-plateforme-d-e-procurement/?xtor=RSS-1</font></p>', '2009-06-01 23:30:07', 1, '', '', 'manpower-france-deploie-une-nouvelle-plateforme-de-procurement', '<p _counted=\"undefined\">Manpower France vient de retenir Perfect Commerce pour sa nouvelle plateforme d\'e-procurement.</p>'),
(9, 6, 'E-achat : La crise adoucit les enchères en ligne.  Publié le 02/06/2009', '<p>En termes de volumes, de montants ou de segments d&rsquo;achats trait&eacute;s, les repr&eacute;sentants des groupes PPR et PSA Peugeot Citro&euml;n sont cat&eacute;riques : la crise n&rsquo;a aucun impact sur les ench&egrave;res invers&eacute;es. Les acheteurs, en particulier, ne seraient pas plus demandeurs. En revanche, &laquo; en pareille p&eacute;riode, on ne pilote pas l&rsquo;op&eacute;ration de la m&ecirc;me mani&egrave;re &raquo;, a insist&eacute; Gilles Chambon, responsable et expert des ench&egrave;res &agrave; la direction des achats du constructeur automobile, adepte du syst&egrave;me puis 2001 et la cr&eacute;ation de la place de march&eacute; sectorielle Covisint.</p>\r\n<p>&laquo; Alors que les fournisseurs sont pr&ecirc;ts &agrave; tout pour obtenir un march&eacute;, nous devons faire en sorte qu&rsquo;ils ne subissent pas une pression suppl&eacute;mentaire et soient p&eacute;nalis&eacute;s, d&eacute;taille-t-il. Nous voulons travailler avec des partenaires en bonne sant&eacute; &raquo;. Cela passe d&rsquo;abord par un travail de sensibilisation et d&rsquo;explication en amont. &laquo;&nbsp; Avant de lancer l&rsquo;ench&egrave;re, il faut n&rsquo;avoir aucun doute sur la bonne compr&eacute;hension par les fournisseurs de tous les points du cahier des charges et des engagements qu&rsquo;ils devront respecter s&rsquo;ils l&rsquo;emportent &raquo;, a poursuivi le responsable de PSA. &laquo; Il faut rassurer les fournisseurs lors de la phase pr&eacute;paratoire, mais aussi les suivre pendant l&rsquo;ench&egrave;re pour &eacute;viter tout d&eacute;rapage &raquo;, a compl&eacute;t&eacute; Fabienne Hillaire, responsable des ench&egrave;res au sein de Buyco, la direction des achats indirects du groupe PPR.</p>\r\n<p>Mais, comme l&rsquo;a rappel&eacute; Alain Chambon, directeur adjoint des achats chez Bouygues Telecom, en charge du d&eacute;ploiement des outils et des m&eacute;thodes, &laquo; les ench&egrave;res invers&eacute;es demeurent un outil permettant de cr&eacute;er une dynamique de concurrence&hellip; &raquo;.</p>\r\n<p>Source: <font face=\"Arial\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/3F/A7/document_article_web.phtml?IdTis=XTC-BPA-SNXDP-DD-5917U-F5QQ</font></p>\r\n<!-- article_web texte fin-->', '2009-06-02 12:50:34', 1, '', '', 'e-achat-la-crise-adoucit-les-encheres-en-ligne-publie-le-02/06/2009', 'Arme redoutable pour mettre la pression sur les fournisseurs, les ench&egrave;res invers&eacute;es sont aujourd&rsquo;hui entr&eacute;es dans les m&oelig;urs. Mais la crise tend &agrave; adoucir les pratiques, &agrave; en croire les entreprises r&eacute;cemment invit&eacute;es par SynerTrade &agrave; d&eacute;battre sur le sujet.<!-- article_web chapeau fin-->'),
(10, 6, 'Des PME lorraines d’un même secteur envisagent d’acheter en commun', '<p _counted=\"undefined\">Le projet&nbsp; est pilot&eacute; par la DRIRE Lorraine (Direction r&eacute;gionale de l\'industrie, de la recherche et de l\'environnement), avec la participation du CETIM (Centre technique des industries m&eacute;caniques).</p>\r\n<p _counted=\"undefined\">Le mod&egrave;le propos&eacute; permet &agrave; chaque entreprise de continuer &agrave; ma&icirc;triser ses achats tout en b&eacute;n&eacute;ficiant de tarifs n&eacute;ci&eacute;s dignes des grands groupes.</p>\r\n<p _counted=\"undefined\">Le montant des &eacute;conomies r&eacute;alisables n\'a pas encore &eacute;t&eacute; chiffr&eacute;. Il faudra attendre la fin de l\'&eacute;tude de faisabilit&eacute;, le 31 juillet prochain.</p>\r\n<p _counted=\"undefined\">&quot;Ce type d&rsquo;initiative se multiplie actuellement en France et conna&icirc;t un franc succ&egrave;s depuis 10 ans dans d&rsquo;autres r&eacute;gions&quot;, indique Bertrand Gabriel, directeur associ&eacute; du cabinet Acxias. En effet, des groupements existent d&eacute;j&agrave;, par exemple dans les r&eacute;gions Rh&ocirc;ne-Alpes et Pays de la Loire.</p>\r\n<p _counted=\"undefined\">Dans un deuxi&egrave;me temps, la mise &agrave; disposition d\'outils e-achats mutualis&eacute;s permettra aux entreprises d\'acc&eacute;l&eacute;rer les gains potentiels.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\">http://www.decision-achats.fr/xml/Breves/2009/06/08/29695/Des-PME-lorraines-d-un-meme-secteur-envisagent-d-acheter-en-commun/?xtor=RSS-1</font></p>', '2009-06-08 15:37:30', 1, '', '', 'des-pme-lorraines-dun-meme-secteur-envisagent-dacheter-en-commun', '<p _counted=\"undefined\">Selon les premiers r&eacute;sultats d\'une &eacute;tude de faisabilit&eacute; men&eacute;e par le cabinet de conseil Acxias, 40 entreprises lorraines dans le secteur des m&eacute;taux ont annonc&eacute; leur volont&eacute; de collaborer ensemble pour r&eacute;aliser des &eacute;conomies sur leurs achats.</p>'),
(11, 6, 'Dominique Lebit est nommé directeur central des achats de Bouygues Construction. Publié le mar. 09/06/2009 16:38', '<p _counted=\"undefined\">Titulaire du master sp&eacute;cialis&eacute; en management strat&eacute;gique des achats (Desma) de Grenoble, Dominique Lebit a commenc&eacute; sa carri&egrave;re en 1993 comme responsable achats et logistique de RP Scherer France, puis directeur achats Europe en 1996 en Suisse. En 1998, il devient directeur mondial achats et logistique de Cardinal Health PTS (maison m&egrave;re de RP Scherer) aux USA. Il est nomm&eacute; en 2001 directeur achats Europe de Colgate-Palmolive. En 2005, il est promu directeur g&eacute;n&eacute;ral achats Europe de Mittal Steel en Hollande, puis directeur g&eacute;n&eacute;ral achats groupe division tubes d\'Arcelor-Mittal en 2007 au Luxembourg.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\">http://www.decision-achats.fr/xml/Breves/2009/06/09/29734/Dominique-Lebit-est-nomme-directeur-central-des-achats-de-Bouygues-Construction/?xtor=RSS-1</font></p>', '2009-06-09 17:34:06', 1, '', '', 'dominique-lebit-est-nomme-directeur-central-des-achats-de-bouygues-construction-publie-le-mar-09/06/2009-1638', '<p _counted=\"undefined\">Dominique Lebit, 43 ans, vient d\'&ecirc;tre nomm&eacute; directeur central des achats de Bouygues Construction. Il aura en charge l\'optimisation et l\'animation de l\'ensemble de la fili&egrave;re achats du Groupe.</p>'),
(12, 6, 'Schneider Electric va développer sa solution d’e-procurement à l’échelle européenne. Publié le: jeu. 11/06/2009 11:50', '<p _counted=\"undefined\">Pour ce faire, le sp&eacute;cialiste mondial de la gestion d\'&eacute;nergie va poursuivre sa collaboration avec l\'&eacute;diteur Perfect Commerce. Une collaboration ancienne, puisque Schneider Electric utilise aux Etats-Unis les solutions de Commerce One depuis 2001. Et confirm&eacute;e r&eacute;cemment, le groupe ayant d&eacute;ploy&eacute; en France l\'an dernier deux nouveaux modules de gestion des catalogues et des demandes, issus de la suite logicielle propos&eacute;e par Perfect Commerce. Ce sont ces deux modules qui vont &ecirc;tre &eacute;tendus &agrave; toute l\'Europe et pour toutes les familles d\'achats hors production.</p>\r\n<p _counted=\"undefined\">&quot;Nous avions exploit&eacute; toutes les possibilit&eacute;s de notre ancienne solution d\'e-procurement. Nous &eacute;tions donc &agrave; la recherche de nouveaux modules pour simplifier nos process, en particulier toutes les demandes d\'achats, et ce afin d\'orienter les utilisateurs internes vers les produits et les services r&eacute;f&eacute;renc&eacute;s dans nos catalogues&quot;, commente Bertrand Maltaverne, Global Purchasing Application Manager chez Schneider Electric.</p>\r\n<p _counted=\"undefined\">Auparavant, deux tiers des commandes &eacute;taient effectu&eacute;es hors catalogue. &quot;A terme, notre objectif est de ramener le ratio &agrave; 50/50 pour l\'ensemble de nos achats hors production en Europe&quot;, reprend Bertrand Maltaverne.</p>\r\n<p _counted=\"undefined\">Depuis l\'an dernier, les achats informatiques ont servi de tests. L\'exercice s\'est visiblement r&eacute;v&eacute;l&eacute; concluant puisque Schneider Electric a d&eacute;cid&eacute; d\'&eacute;tendre le process &agrave; ses autres familles d\'achats indirects (fournitures de bureau, formation, abonnement, etc.) Pr&egrave;s de 30 000 utilisateurs seront concern&eacute;s.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\">http://www.decision-achats.fr/xml/Breves/2009/06/11/29770/Schneider-Electric-va-developper-sa-solution-d-e-procurement-a-l-echelle-europeenne-/?xtor=RSS-1</font></p>', '2009-06-11 12:04:52', 1, '', '', 'schneider-electric-va-developper-sa-solution-de-procurement-a-lechelle-europeenne-publie-le-jeu-11/06/2009-1150', '<p _counted=\"undefined\">Objectif Europe ! Schneider Electric a d&eacute;cid&eacute; de d&eacute;ployer sa solution d\'e-procurement pour ses achats hors production &agrave; l\'ensemble des entit&eacute;s pr&eacute;sentes sur le Vieux Continent.</p>'),
(13, 14, 'France: Achats publics, la première centrale d’achats de proximité. Publié le 09/06/2009', 'Outre le conseil g&eacute;n&eacute;ral, cette association comprend huit communes, le service d&eacute;partemental d&rsquo;incendie et de secours, le syndicat mixte de l&rsquo;a&eacute;roport de Beauvais-Till&eacute;, celui des transports de l&rsquo;Oise, la maison d&eacute;partementale des handicap&eacute;s et l&rsquo;&eacute;tablissement public foncier de l&rsquo;Oise. Son catalogue sera ouvert &agrave; tous les pouvoirs adjudicateurs du d&eacute;partement.<br />\r\nPour le premier exercice plein, Herv&eacute; Carlier, le directeur adjoint du conseil g&eacute;n&eacute;ral, en charge de la commande publique, ambitionne de couvrir 10 &agrave; 20 % de leur p&eacute;rim&egrave;tre d&rsquo;achats. Le montant des achats annuels des seules communes est estim&eacute; &agrave; 1,04 milliard d&rsquo;euros. La motivation principale de cette cr&eacute;ation est de donner &agrave; ces derni&egrave;res le moyen de faire des &eacute;conomies et de faciliter et s&eacute;curiser leurs achats : &laquo; Beaucoup d&rsquo;entre elles n&rsquo;ont pas les moyens de garantir leurs actes administratifs de mani&egrave;re juridique &raquo;, avance Herv&eacute; Carlier.<br />\r\n&laquo; Cette centrale n&rsquo;est pas concurrente, mais compl&eacute;mentaire par rapport &agrave; l&rsquo;Ugap. Le fait que cette derni&egrave;re soit nationale ne lui permet pas de r&eacute;pondre &agrave; tous les besoins locaux &raquo;, note le responsable. Qui cite les march&eacute;s de prestations intellectuelles et les march&eacute;s de travaux pour lesquels la centrale locale esp&egrave;re avoir des conditions avantageuses, au contraire des v&eacute;hicules pour lesquels l&rsquo;Ugap est particuli&egrave;rement performante.<br />\r\nLes premiers march&eacute;s devraient &ecirc;tre mis en ligne en septembre avec, comme familles d&rsquo;achats identifi&eacute;es, l&rsquo;habillement de s&eacute;curit&eacute;, le gros outillage, les travaux routiers, les fournitures de bureau ou encore la signal&eacute;tique. Un gestionnaire de march&eacute;s doit &ecirc;tre embauch&eacute; d&rsquo;ici &agrave; septembre et un outil de commande en ligne install&eacute; avant la fin de l&rsquo;ann&eacute;e.<br />\r\nSource: <font face=\"Arial\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/3F/BA/document_article_web.phtml</font>', '2009-06-11 12:13:18', 1, '', '', 'france-achats-publics-la-premiere-centrale-dachats-de-proximite-publie-le-09/06/2009', '&Agrave; l&rsquo;initiative du conseil g&eacute;n&eacute;ral, quinze pouvoirs adjudicateurs de l&rsquo;Oise s&rsquo;associent pour fonder une centrale d&rsquo;achats publics qui se veut compl&eacute;mentaire &agrave; l&rsquo;Ugap (Union des groupements d\'achats publics).<!-- article_web chapeau fin-->'),
(14, 6, 'Un acheteur du privé à la tête des achats du ministère Français de la Justice. Publié le: Lundi 6 juillet 2009.', '<p _counted=\"undefined\">Comme <a target=\"_blank\" _counted=\"undefined\" href=\"http://www.decision-achats.fr/xml/Breves/2009/03/02/28454/Jacques-Barrailler-un-acheteur-chevronne-a-la-tete-du-service-achats-de-l-Etat/\">Jacques Barrailler </a>(ex-Alcan), qui dirige depuis le d&eacute;but de l&rsquo;ann&eacute;e le service des achats de l&rsquo;&Eacute;tat (SAE), Fran&ccedil;ois Rochet (ex-France T&eacute;l&eacute;com) a rejoint le secteur public : il occupe depuis janvier les fonctions de responsable minist&eacute;riel des achats (RMA) du minist&egrave;re de la Justice. &Acirc;g&eacute; de 49 ans, ce titulaire d&rsquo;un dipl&ocirc;me sup&eacute;rieur d&rsquo;&eacute;tudes comptables occupait pr&eacute;c&eacute;demment divers postes achats chez France T&eacute;l&eacute;com, avec un double profil de manager d&rsquo;une &eacute;quipe d&rsquo;acheteurs et d&rsquo;acheteur national leader sur certains segments.<br _counted=\"undefined\" />\r\n<em _counted=\"undefined\">&laquo;L&rsquo;opportunit&eacute; de ce poste constitue pour moi une exp&eacute;rience in&eacute;dite, mais coh&eacute;rente, </em>explique-t-il<em _counted=\"undefined\">. Un double challenge me motive : d&rsquo;une part, int&eacute;grer un secteur public en pleine mutation et, d&rsquo;autre part, mettre mon exp&eacute;rience d&rsquo;acheteur du secteur priv&eacute; au service de la modernisation des achats publics.&raquo;</em></p>\r\n<p _counted=\"undefined\"><br _counted=\"undefined\" />\r\n<strong _counted=\"undefined\">1,5 milliard d&rsquo;euros d&rsquo;achats</strong><br _counted=\"undefined\" />\r\nLe montant des achats du minist&egrave;re de la Justice s\'&eacute;l&egrave;ve &agrave; 1,5 milliard d\'euros d\'achats. L&rsquo;effectif acheteur repr&eacute;sente environ 50 personnes, mais se caract&eacute;rise par une forte d&eacute;concentration sur les trois directions (administration p&eacute;nitentiaire, services judiciaires et protection judiciaire de la jeunesse). <em _counted=\"undefined\">&laquo;Il y a &eacute;galement un p&ocirc;le achats informatique et t&eacute;l&eacute;coms pour les besoins nationaux et un p&ocirc;le achats traitant les besoins de l&rsquo;administration centrale&raquo;</em>, explique Fran&ccedil;ois Rochet. Les achats courants repr&eacute;sentent environ la moiti&eacute; des d&eacute;penses du minist&egrave;re, l&rsquo;autre moiti&eacute; des achats dits &ldquo;m&eacute;tiers&rdquo; regroupant principalement les d&eacute;penses li&eacute;es &agrave; la gestion publique et la gestion d&eacute;l&eacute;gu&eacute;e des centres p&eacute;nitentiaires ainsi que les frais de justice.<br _counted=\"undefined\" />\r\n<em _counted=\"undefined\">&laquo;Mon objectif prioritaire est de d&eacute;finir <a target=\"_blank\" _counted=\"undefined\" href=\"http://www.decision-achats.fr/Breves/ConsultBreve.asp?ID_Article=26342&amp;iPageNum=1&amp;TrierPar=&amp;RechAvance=&amp;FldRech=agence+achats+etat&amp;RadioExpression=&amp;RadioTitreArticle=&amp;DateDebMois=&amp;DateDebAnnee=&amp;DateFinMois=&amp;DateFinAnnee=&amp;ListeMag=ACTU&amp;ListeMag=DA\">et de mettre en place une politique achats en coh&eacute;rence avec celle de l&rsquo;&Eacute;tat, d&eacute;finie par le SAE</a>,</em> pr&eacute;cise-t-il. <em _counted=\"undefined\">L&rsquo;approche doit rester pragmatique : mettre en &oelig;uvre en premier lieu des march&eacute;s interminist&eacute;riels sur les segments &ldquo;achats courants&rdquo; et, pour les autres segments, choisir le bon niveau, national ou r&eacute;gional, de mutualisation des achats.&raquo;</em> L&rsquo;autre objectif sera de <em _counted=\"undefined\">&laquo;valoriser les bonnes pratiques d&eacute;j&agrave; exp&eacute;riment&eacute;es au sein du minist&egrave;re&raquo;</em> et de rep&eacute;rer les potentiels d&rsquo;&eacute;conomies rapides et faciles &agrave; mettre en &oelig;uvre. <em _counted=\"undefined\">&laquo;L&rsquo;enjeu majeur est de diffuser la culture achats dans toutes les entit&eacute;s du minist&egrave;re et ainsi faire comprendre notre valeur ajout&eacute;e dans toute d&eacute;cision d&rsquo;achat&raquo;</em>, conclut-il.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/06/25/29956/Un-acheteur-du-prive-a-la-tete-des-achats-du-ministere-de-la-Justice/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/06/25/29956/Un-acheteur-du-prive-a-la-tete-des-achats-du-ministere-de-la-Justice/?xtor=RSS-1</a></font></p>', '2009-07-06 10:24:22', 1, '', '', 'un-acheteur-du-prive-a-la-tete-des-achats-du-ministere-français-de-la-justice-publie-le-lundi-6-juillet-2009', 'Le nouveau responsable minist&eacute;riel des achats, Fran&ccedil;ois Rochet, est en poste depuis janvier dernier. Ce transfuge du priv&eacute; nous d&eacute;voile ses objectifs.'),
(15, 6, 'Pour bien acheter, soyez bien renseigné, Publié le 09 juillet 2009', '<p class=\"paragraphe\" _counted=\"undefined\"><span class=\"pubdroite\" _counted=\"undefined\"><font face=\"Arial\">En mars dernier, 7 000 salari&eacute;s de l\'usine PSA Peugeot Citro&euml;n de Sochaux (Doubs) se sont retrouv&eacute;s au ch&ocirc;mage technique pendant une semaine. Une situation d\'autant plus probl&eacute;matique pour le constructeur qu\'elle n\'est pas li&eacute;e &agrave; un carnet de commandes en berne ou &agrave; une mesure radicale de r&eacute;duction des co&ucirc;ts . Depuis le lancement de deux nouveaux mod&egrave;les, le site conna&icirc;t un regain d\'activit&eacute;. En r&eacute;alit&eacute;, c\'est un conflit social chez Key Plastics, un <font face=\"Arial\">sous-traitant du constructeur, qui a provoqu&eacute; une rupture de la cha&icirc;ne d\'approvisionnement. L\'&eacute;quipementier, plac&eacute; en redressement judiciaire en novembre dernier, est en pleine restructuration et comptait fermer son usine de Voujeaucourt, situ&eacute;e &agrave; quelques kilom&egrave;tres de Sochaux, qui fournit notamment &agrave; PSA des &eacute;l&eacute;ments pour les planches de bord de ses voitures. La gr&egrave;ve a dur&eacute; 15 jours. Au bout d\'une semaine, faute de stock, Key Plastics s\'est retrouv&eacute;e dans l\'incapacit&eacute; de livrer son client. Les cons&eacute;quences pour le constructeur automobile ont &eacute;t&eacute; substantielles: pr&egrave;s de 3 400 v&eacute;hicules n\'ont pu &ecirc;tre fabriqu&eacute;s.</font></font></span></p>\r\n<p class=\"paragraphe\" _counted=\"undefined\"><span class=\"pubdroite\" _counted=\"undefined\"><font face=\"Arial\">Ce type d\'&eacute;v&eacute;nement est un v&eacute;ritable cauchemar pour toute direction achats. Pourtant, l\'&eacute;valuation du risque fournisseurs est une priorit&eacute; souvent oubli&eacute;e, m&ecirc;me en p&eacute;riode de crise. Dans une r&eacute;cente &eacute;tude commandit&eacute;e par BravoSolutionEtude r&eacute;alis&eacute;e par le cabinet Loudhouse Research aupr&egrave;s de 400 directeurs achats, entre f&eacute;vrier et mars 2009., 78% des directeurs achats interrog&eacute;s d&eacute;clarent b&eacute;n&eacute;ficier d\'opportunit&eacute;s inattendues ces derniers mois. Par exemple, un peu plus de la moiti&eacute; consid&egrave;rent se trouver dans une position plus strat&eacute;gique pour n&eacute;cier avec les prestataires. Mais seuls 22% se disent pr&eacute;occup&eacute;s par les risques de faillite chez leurs fournisseurs. &laquo;A l\'heure o&ugrave; les co&ucirc;ts doivent &ecirc;tre r&eacute;duits, de nombreux professionnels des achats poursuivent actuellement des strat&eacute;gies &agrave; court terme. Et parce qu\'ils auront ferm&eacute; les yeux sur le risque fournisseurs &agrave; moyen terme, ils vont &ecirc;tre confront&eacute;s &agrave; de graves difficult&eacute;s au cours des douze prochains mois&raquo;, pr&eacute;vient G&eacute;rard Dahan, vice-pr&eacute;sident marketing et communication de BravoSolution.</font></span></p>\r\n<span class=\"pubdroite\" _counted=\"undefined\">\r\n<p><font face=\"Arial\"><strong><span style=\"FONT-WEIGHT: bold\"><font face=\"Arial\"><strong>DES D&Eacute;FAILLANCES D\'ENTREPRISES EN FORTE HAUSSE</strong></font></span></strong></font></p>\r\n<p><font face=\"Arial\">En p&eacute;riode de crise, le risque fournisseurs est au plus haut. Le nombre de redressements et de liquidations judiciaires ne cesse de cro&icirc;tre. Selon la derni&egrave;re &eacute;tude r&eacute;alis&eacute;e par Altares, en France, les d&eacute;faillances d\'entreprises ont augment&eacute; de 21% au premier trimestre 2009 par rapport &agrave; la m&ecirc;me p&eacute;riode en 2008, avec pr&egrave;s de 15 000 jugements prononc&eacute;s par les tribunaux. Tous les secteurs sont concern&eacute;s, en particulier le transport, l\'industrie et la construction. Si les entreprises de moins de cinq ans sont toujours les plus fragiles, les plus anciennes sont &eacute;galement frapp&eacute;es. &laquo;La forte augmentation des d&eacute;faillances d\'entreprises en ce d&eacute;but d\'ann&eacute;e 2009 &eacute;tait attendue, rappelle Thierry Million, responsable des &eacute;tudes chez Altares. Malheureusement, des &eacute;pisodes encore plus difficiles peuvent &ecirc;tre craints.&raquo; Le sp&eacute;cialiste de l\'information B to B pr&eacute;voit ainsi pr&egrave;s de 60 000 redressements et liquidations pour 2009, soit 2% du total des entreprises fran&ccedil;aises. &laquo;L\'essentiel des organisations passera cette crise. Mais il leur est primordial de d&eacute;tecter les clients et les fournisseurs les plus fragiles, de s&eacute;curiser les relations avec les plus strat&eacute;giques d\'entre eux et d\'en d&eacute;couvrir de nouveaux plus p&eacute;rennes&raquo;, r&eacute;sume Thierry Million. </font></p>\r\n<p><font face=\"Arial\">&nbsp;</font><font face=\"Arial\">Dans leur livre intitul&eacute; Contr&ocirc;le interne et gestion des risques, paru aux Editions Maxima d&eacute;but 2009, Fr&eacute;d&eacute;ric Bernard et Eric Salviac sont revenus sur cette notion de risque fournisseurs. Afin d\'&eacute;valuer la sant&eacute; financi&egrave;re des fournisseurs &agrave; un instant T et d\'effectuer des pr&eacute;visions par rapport aux risques de d&eacute;faillances, les auteurs recommandent aux entreprises de r&eacute;aliser une analyse financi&egrave;re pouss&eacute;e. &laquo;Il est alors possible d\'avoir un avis pertinent sur la qualit&eacute; de gestion du fournisseur, mais &eacute;galement sur sa capacit&eacute; &agrave; faire face &agrave; des variations de cycle d\'activit&eacute;, &agrave; la baisse comme &agrave; la hausse&raquo;, pr&eacute;cise Eric Salviac. L\'analyse financi&egrave;re est alors bas&eacute;e sur l\'&eacute;tude approfondie des bilans, comptes de r&eacute;sultats et &eacute;tat des cash flows. &laquo;Ce type d\'analyse fait appel &agrave; des comp&eacute;tences g&eacute;n&eacute;ralement peu pr&eacute;sentes au niveau de la fonction achats, reprend Eric Salviac. L\'analyse de ce risque sera davantage men&eacute;e avec l\'aide de la direction financi&egrave;re ou de tout organisme externe qui serait susceptible d\'apporter son expertise.&raquo; </font></p>\r\n<p><font face=\"Arial\"><span style=\"FONT-WEIGHT: bold\"><font face=\"Arial\">&nbsp;LA SITUATION DES FOURNISSEURS &Agrave; LA LOUPE</font></span></font></p>\r\n<p><font face=\"Arial\">Autrefois cantonn&eacute; &agrave; l\'&eacute;tude de la sant&eacute; financi&egrave;re d\'un nouveau fournisseur, le recours &agrave; une agence de renseignements &eacute;conomiques et financiers s\'est ainsi &eacute;tendu depuis quelques mois au panel strat&eacute;gique. &laquo;Nous sommes d&eacute;plus en plus sollicit&eacute;s par les directions achats, quel que soit le secteur d\'activit&eacute;&raquo;, confirme Franck Lemoine, directeur des ventes chez Pouey International. Auparavant, seules les entreprises&nbsp;<font face=\"Arial\">industrielles, dont la production d&eacute;pendait de quelques fournisseurs, recouraient aux prestations de l\'agence. &laquo;Aujourd\'hui, m&ecirc;me dans le secteur des services, les grands comptes et les PME souhaitent conna&icirc;tre la situation &eacute;conomique de leurs fournisseurs strat&eacute;giques&raquo;, observe Franck Lemoine (Pouey International). Au-del&agrave; des donn&eacute;es financi&egrave;res, les directions achats recherchent des informations plus pr&eacute;cises sur leurs sous-traitants. Celles-ci veulent pouvoir &eacute;valuer les risques de rupture d\'approvisionnement, d&eacute;terminer la capacit&eacute; d\'un fournisseur &agrave; assumer ses engagements de services, valider sa r&eacute;activit&eacute; en cas de difficult&eacute;s, etc. &laquo;Le recours &agrave; une soci&eacute;t&eacute; de renseignements &eacute;conomique permet de ne pas c&eacute;der &agrave; la panique et, bien souvent, de se rassurer, explique Fr&eacute;d&eacute;ric Soriano, directeur du d&eacute;veloppement de BEIC. M&ecirc;me si le contexte actuel est difficile, on se rend compte que beaucoup de fournisseurs r&eacute;ussissent &agrave; s\'adapter.&raquo;&nbsp;</font></font>&nbsp;</p>\r\n<p>&nbsp;Alors qu\'il existe de nombreuses informations publiques sur la sant&eacute; financi&egrave;re des entreprises, les agences de renseignements d&eacute;fendent leur valeur ajout&eacute;e. &laquo;Les directions achats sont parfois submerg&eacute;es d\'informations. Le recours &agrave; nos services leur donne la possibilit&eacute; d&eacute;faire le tri et de disposer d\'un outil d\'aide &agrave; la d&eacute;cision beaucoup plus rapide&raquo;, argumente Jean-Yves Bajon, directeur g&eacute;n&eacute;ral de Coface Services. &laquo;Quand une entreprise poss&egrave;de plusieurs milliers de fournisseurs, la recherche d\'informations est complexe et fastidieuse, ajoute Emmanuel Robert, directeur marketing et communication d\'Altares. Le recours &agrave; un prestataire externe, dont les processus sont industrialis&eacute;s, permet de r&eacute;pondre &agrave; un tel besoin.&raquo; </p>\r\n<p>&nbsp;Autre avantage et pas des moindres: la qualit&eacute; des informations. Franck Lemoine (Pouey International) rappelle ainsi que les agences r&eacute;alisent des enqu&ecirc;tes sur mesure, &agrave; n\'importe quel moment de l\'ann&eacute;e et qui peuvent &ecirc;tre suivies dans le temps. Pour Fr&eacute;d&eacute;ric Soriano (BEIC), le fait de passer par un interlocuteur ext&eacute;rieur donne &agrave; la direction achats la possibilit&eacute; d\'obtenir des informations plus pertinentes et de recouper certains &eacute;l&eacute;ments. &laquo;Les fournisseurs se livrent davantage, d autant que nous ne donnons jamais le nom du donneur d\'ordres, poursuit-il. </p>\r\n<p>&nbsp;Cela nous permet d aller plus loin dans la discussion. Face &agrave; un acheteur, le fournisseur ne voudra pas risquer de compromettre leur relation.&raquo; Le co&ucirc;t de ce genre de prestations est tr&egrave;s variable, il peut aller de 40 euros par fournisseur pour des renseignements de base (principaux &eacute;l&eacute;ments financiers, qualit&eacute; des paiements, etc.) &agrave; plusieurs centaines d\'euros par prestataire pour r&eacute;aliser une enqu&ecirc;te approfondie (&eacute;tude de l\'environnement &eacute;conomique du fournisseur, liens des dirigeants avec d\'autres structures, &eacute;valuations des points forts et des points faibles de l\'entreprise, etc.). Toutes les agences pratiquent plus ou moins les m&ecirc;mes tarifs. D&egrave;s lors, d\'autres crit&egrave;res de s&eacute;lection apparaissent plus importants, comme la capacit&eacute; de mener une &eacute;tude &agrave; l\'international gr&acirc;ce &agrave; un r&eacute;seau d\'informateurs sur place ou de d&eacute;livrer des r&eacute;sultats en tr&egrave;s peu de temps. &laquo;La collecte d\'informations est tr&egrave;s variable selon les pays, y compris dans des pays d&eacute;velopp&eacute;s tels que l\'Allemagne et les Etats-Unis&raquo;, pr&eacute;cise Emmanuel Robert (Altares). Selon la nature des renseignements demand&eacute;s, les r&eacute;sultats sont g&eacute;n&eacute;ralement d&eacute;livr&eacute;s entre 48 heures et cinq jours. &laquo;Par rapport aux risques fournisseurs, les &eacute;tudes sur les risques clients nous sont souvent demand&eacute;es dans l\'urgence, note Franck Lemoine (Pouey International). Mais de leur c&ocirc;t&eacute;, les directions achats nous accordent des d&eacute;lais plus longs car elles sont tr&egrave;s exigeantes sur la qualit&eacute; des informations.&raquo; Des ruptures d\'approvisionnement &agrave; moyen terme peuvent &ecirc;tre en jeu. </p>\r\n<p>&nbsp;Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/Magazines/ConsultArticle.asp?ID_Article=32726&amp;iPage=1\">http://www.decision-achats.fr/Magazines/ConsultArticle.asp?ID_Article=32726&amp;iPage=1</a></font></p>\r\n</span>', '2009-07-09 14:54:18', 1, '', '', 'pour-bien-acheter-soyez-bien-renseigne-publie-le-09-juillet-2009', '<p class=\"chapeau\" _counted=\"undefined\"><font face=\"Arial\">Alors que les risques de d&eacute;faillances chez les fournisseurs augmentent avec la crise, les directions achats craignent aujourd\'hui des ruptures dans la cha&icirc;ne d\'approvisionnement. L\'achat de renseignements financiers leur permet d\'anticiper de tels al&eacute;as.</font></p>'),
(16, 14, 'NRJ Group : Passer de 35 à 100 % de couverture des achats', '<p>Pierre-Alexandre ulmot a rejoint le groupe NRJ pour reprendre la direction des achats en mars de cette ann&eacute;e, avec un soutien fort, puisqu&rsquo;il est en lien hi&eacute;rarchique direct avec la directrice g&eacute;n&eacute;rale d&eacute;l&eacute;gu&eacute;e, Maryam Salehi. Avec une forte pression aussi, puisqu&rsquo;il doit mener une ambitieuse augmentation du p&eacute;rim&egrave;tre des achats en faisant passer son taux de couverture de 35 % &agrave; 50 % d&rsquo;ici &agrave; la fin 2009 et 100 % l&rsquo;ann&eacute;e suivante. Le p&eacute;rim&egrave;tre cible de la direction des achats, d&rsquo;un montant de 80 millions d&rsquo;euros, fait l&rsquo;impasse sur tr&egrave;s peu de familles : les baux immobiliers ou encore les achats de droits et de programmes.<br />\r\nCette ann&eacute;e, le nouveau directeur des achats doit par ailleurs obtenir une r&eacute;duction des co&ucirc;ts d&rsquo;achat de 10 %. En comptant la remise en cause de certaines d&eacute;penses, le groupe envisage globalement des &eacute;conomies de l&rsquo;ordre de 15 %. Pierre-Alexandre ulmot va notamment agir sur &laquo; la remise en cause des habitudes ou des process au sein de l&rsquo;entreprise &raquo;. Cette d&eacute;marche s&rsquo;appliquera &agrave; l&rsquo;impression, aux consommables, aux assurances, &agrave; la maintenance ou aux r&eacute;seaux. &laquo; Nous utilisons des r&eacute;seaux informatiques, t&eacute;l&eacute; et radio. Je pense qu&rsquo;il y a un potentiel de synergies &agrave; &eacute;tudier &raquo;, d&eacute;taille Pierre-Alexandre ulmot.<br />\r\n<!-- article_web texte fin--></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/3F/document_article_web.phtml\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/3F/document_article_web.phtml</a></font></p>\r\n<p>&nbsp;</p>', '2009-07-13 16:18:58', 1, '', '', 'nrj-group-passer-de-35-a-100-de-couverture-des-achats', 'Fin 2010, le nouveau directeur des achats du groupe audiovisuel NRJ devra tendre vers un taux de couverture de 100 % d&rsquo;un montant cible de 80 millions d&rsquo;euros d&rsquo;achats. Contre une trentaine de millions d&rsquo;euros &agrave; l&rsquo;heure actuelle.<!-- article_web chapeau fin-->'),
(17, 14, 'E-achat : Oracle résiste mais prévoit des coupes, Publié le 15/07/2009 ', '<p>Pour son exercice fiscal 2008-2009, clos le 31 mai, Oracle a annonc&eacute; un chiffre d&rsquo;affaires en hausse de 3,7 % &agrave; 23,3 milliards de dollars, pour un b&eacute;n&eacute;fice net en progression de 1 % &agrave; 5,6 milliards de dollars. Des r&eacute;sultats sup&eacute;rieurs aux pr&eacute;visions des analystes qui appr&eacute;cient surtout les 51 % de marge op&eacute;rationnelle du groupe. La croissance est essentiellement &agrave; mettre au cr&eacute;dit des activit&eacute;s de support et de mise &agrave; jour, en hausse de 14 % (11,8 milliards), alors que les ventes de logiciels ont recul&eacute; de 5 %.<br />\r\nSi Oracle r&eacute;siste donc plut&ocirc;t bien &agrave; la crise, le quatri&egrave;me trimestre a n&eacute;anmoins &eacute;t&eacute; difficile, avec une baisse marqu&eacute;e du b&eacute;n&eacute;fice net et du chiffre d&rsquo;affaires par rapport &agrave; la m&ecirc;me p&eacute;riode de l&rsquo;exercice pr&eacute;c&eacute;dent. Sur ce constat, et arguant une pr&eacute;vision de croissance &laquo; significativement inf&eacute;rieure &raquo; &agrave; ce qu&rsquo;elle attendait, la firme de Redwood Shores a annonc&eacute; 850 &agrave; 1 000 suppressions de postes en Europe, soit 5 % &agrave; 7 % des effectifs. En France, 250 postes sont menac&eacute;s. Pour se justifier, les dirigeants auraient aussi indiqu&eacute; qu&rsquo;ils cherchaient &agrave; pr&eacute;server la marge op&eacute;rationnelle du groupe pour pouvoir maintenir sa strat&eacute;gie &agrave; long terme, c&rsquo;est-&agrave;-dire ses efforts de R &amp; D et sa politique de croissance externe.<br />\r\n<!-- article_web texte fin-->Source: <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/49/document_article_web.phtml?IdTis=XTC-BPA-T48QI-DD-X9TRO-FQIQ\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/49/document_article_web.phtml?IdTis=XTC-BPA-T48QI-DD-X9TRO-FQIQ</a></font></p>', '2009-07-15 12:41:24', 1, '', '', 'e-achat-oracle-resiste-mais-prevoit-des-coupes-publie-le-15/07/2009-', 'M&ecirc;me s&rsquo;il a davantage subi la crise lors de son quatri&egrave;me trimestre fiscal, l&rsquo;&eacute;diteur am&eacute;ricain affiche des r&eacute;sultats annuels satisfaisants. Ce qui ne l&rsquo;emp&ecirc;che pas de pr&eacute;voir des r&eacute;ductions d&rsquo;effectif.<!-- article_web chapeau fin-->'),
(18, 14, 'Formation : L’IMA concilie achat vert et réduction des coûts, Publié le 15/07/2009', '<p>&laquo; Le meilleur achat responsable est celui que l&rsquo;on ne fait pas &raquo;, a ainsi affirm&eacute; Anne de B&eacute;thencourt, responsable mobilisation pour la Fondation Nicolas Hulot. &laquo; Et en diminuant les consommations de transport ou de papier, nous allions respect de l&rsquo;environnement (d&eacute;forestation, r&eacute;duction des &eacute;missions de gaz &agrave; effet de serre) et pr&eacute;occupation &eacute;conomique &raquo;, a confirm&eacute; Thomas Gravis, responsable du d&eacute;partement fonctionnel de la direction des achats pour la Soci&eacute;t&eacute; G&eacute;n&eacute;rale.<br />\r\nUn constat &eacute;galement partag&eacute; par Sanofi Aventis pour qui la gestion des d&eacute;chets chimiques et biologiques a un impact important sur les 10 milliards d&rsquo;euros d&rsquo;achats du groupe. &laquo; Avant la destruction, il faut penser &agrave; la baisse de la consommation &raquo;, a soulign&eacute; Michel Cavalier, directeur adjoint achats g&eacute;n&eacute;raux et marketing du laboratoire pharmaceutique. Une politique qui permet l&agrave; encore de baisser les co&ucirc;ts, tout en r&eacute;duisant les risques de pollution. &laquo; Il faut sortir de la logique qui consiste &agrave; penser que l&rsquo;achat responsable co&ucirc;te cher &raquo;, a confirm&eacute; Thomas Gravis qui a int&eacute;gr&eacute; la RSE (responsabilit&eacute; sociale des entreprises) dans sa politique d&rsquo;achat. Et qui reste convaincu de l&rsquo;utilit&eacute; des primes pour susciter l&rsquo;int&eacute;r&ecirc;t des acheteurs.<br />\r\n<!-- article_web texte fin-->Source: <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/47/document_article_web.phtml?IdTis=XTC-BPA-T48QI-DD-X9TRO-FQX2\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/47/document_article_web.phtml?IdTis=XTC-BPA-T48QI-DD-X9TRO-FQX2</a></font></p>', '2009-07-15 12:45:15', 1, '', '', 'formation-lima-concilie-achat-vert-et-reduction-des-coûts-publie-le-15/07/2009', 'R&eacute;cemment organis&eacute;e par le MBA de l&rsquo;IMA (ing&eacute;nierie et management des achats) du p&ocirc;le universitaire L&eacute;onard de Vinci (92), une conf&eacute;rence sur le th&egrave;me des achats responsables a montr&eacute; que r&eacute;duction des co&ucirc;ts et d&eacute;veloppement durable sont conciliables.<!-- article_web chapeau fin-->'),
(19, 6, 'France: Crédit Agricole Assurances choisit Xerox pour rationaliser son parc d\'impression. Publié le 27/07/2009', '<div _counted=\"undefined\" align=\"justify\">Dans le cadre de l&rsquo;implantation de son nouveau si&egrave;ge social situ&eacute; dans le 15<sup _counted=\"undefined\">e</sup> arrondissement de Paris, Predica a souhait&eacute; mettre en place une nouvelle politique d&rsquo;impression bas&eacute;e sur l&rsquo;utilisation exclusive de syst&egrave;mes multifonctions.</div>\r\n<div _counted=\"undefined\" align=\"justify\">&nbsp;Pour accompagner la compagnie d&rsquo;assurance de personnes de Cr&eacute;dit Agricole Assurances dans cette d&eacute;marche, Xerox a &eacute;t&eacute; retenu au terme d&rsquo;un appel d&rsquo;offres, pour son expertise en mati&egrave;re de gestion et de rationalisation de parc d&rsquo;impression. </div>\r\n<div _counted=\"undefined\" align=\"justify\">&nbsp;En effet, le fabricant a &eacute;quip&eacute; le parc d&rsquo;impression de Cr&eacute;dit Agricole Assurances de <strong _counted=\"undefined\"><span _counted=\"undefined\">53</span> </strong>WorkCentre 7345, des <strong _counted=\"undefined\"><span _counted=\"undefined\">syst&egrave;mes multifonctions couleur A3</span></strong>. Ces derniers seront prochainement dot&eacute;s de lecteurs de badge facilitant l&rsquo;authentification des utilisateurs, en particulier pour les travaux de num&eacute;risation et la r&eacute;cup&eacute;ration des impressions confidentielles. Ces lecteurs permettront d&rsquo;imprimer les documents depuis n&rsquo;importe quel &eacute;quipement des sites selon le constructeur.</div>\r\n<div _counted=\"undefined\" align=\"justify\">&nbsp;<span _counted=\"undefined\" xerox=\"\">Cr&eacute;dit Agricole Assurances souhaitait tout d&rsquo;abord inscrire ce projet dans une politique de d&eacute;veloppement durable pour minimiser l&rsquo;impact de son activit&eacute; sur l&rsquo;environnement<strong _counted=\"undefined\">, </strong>mais &eacute;galement apporter une meilleure qualit&eacute; de service &agrave; ses utilisateurs en leur donnant acc&egrave;s &agrave; la couleur ainsi qu&rsquo;&agrave; des options de finition (perforation, fascicules en automatique, impression sur diff&eacute;rents types de supports&hellip;). Au-del&agrave; des fonctionnalit&eacute;s d&rsquo;impression avanc&eacute;es, Cr&eacute;dit Agricole Assurances recherchait &eacute;galement un prestataire capable de lui proposer des solutions de s&eacute;curisation &eacute;lev&eacute;es des documents.</span></div>\r\n<div _counted=\"undefined\" align=\"justify\">&nbsp;Dans le cadre du plan d&rsquo;accompagnement au changement, Xerox a &eacute;galement propos&eacute; &agrave; Cr&eacute;dit Agricole Assurances de mettre en place une prestation &laquo;&nbsp;ServicePlus&nbsp;&raquo;, son offre de services personnalis&eacute;s pour la gestion des &eacute;quipements bureautiques.</div>\r\n<div _counted=\"undefined\" align=\"justify\">Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/07/27/30165/Credit-Agricole-Assurances-choisit-Xerox-pour-rationaliser-son-parc-d-impression/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/07/27/30165/Credit-Agricole-Assurances-choisit-Xerox-pour-rationaliser-son-parc-d-impression/?xtor=RSS-1</a></font></div>', '2009-07-27 17:56:15', 1, '', '', 'france-credit-agricole-assurances-choisit-xerox-pour-rationaliser-son-parc-dimpression-publie-le-27/07/2009', '<div>Predica, la compagnie d&rsquo;assurance de personnes de Cr&eacute;dit Agricole Assurances, confie &agrave; Xerox la rationalisation de son parc d&rsquo;impression bureautique.</div>'),
(20, 6, 'Legrand satisfait de sa gestion des coûts Publié le 29/07/2009', '<p _counted=\"undefined\">En effet, le r&eacute;sultat op&eacute;rationnel du groupe sp&eacute;cialis&eacute; dans les produits et les syst&egrave;mes &eacute;lectriques sur la premi&egrave;re moiti&eacute; de l\'ann&eacute;e a &eacute;t&eacute; de 306,6 millions d\'euros, soit une marge op&eacute;rationnelle de 16,9%. Un r&eacute;sultat rendu possible gr&acirc;ce notamment &agrave; la r&eacute;duction des frais administratifs et commerciaux de 17,4%. &quot;Legrand d&eacute;montre &agrave; nouveau sa forte capacit&eacute; d\'adaptation dans un environnement toujours difficile&quot;, a-t-il ainsi d&eacute;clar&eacute;.</p>\r\n<p _counted=\"undefined\">En f&eacute;vrier dernier, le groupe annon&ccedil;ait sa volont&eacute; de doubler son programme de r&eacute;duction de co&ucirc;ts en 2009, le portant de 23 &agrave; 48 millions d\'euros. Ces r&eacute;ductions portent notamment sur l\'optimisation des co&ucirc;ts logistiques et informatiques, la diminution des frais de d&eacute;placement et la r&eacute;duction des d&eacute;penses publicitaires.</p>\r\n<p _counted=\"undefined\">&quot;En l&rsquo;absence d&rsquo;une nouvelle d&eacute;t&eacute;rioration du contexte &eacute;conomique et malgr&eacute; la saisonnalit&eacute; d&eacute;favorable habituelle du second semestre, nous sommes pleinement confiants dans notre capacit&eacute; &agrave; r&eacute;aliser une marge op&eacute;rationnelle ajust&eacute;e r&eacute;currente sup&eacute;rieure &agrave; 14% en 2009&quot;, a conclut Gilles Schnepp.</p>\r\n<p _counted=\"undefined\">Le volume d\'achats du groupe Legrand est estim&eacute; &agrave; 3,2 milliards d\'euros. La direction achats est compos&eacute;e d\'environ 350 collaborateurs.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/07/29/30171/Legrand-satisfait-de-sa-gestion-des-couts/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/07/29/30171/Legrand-satisfait-de-sa-gestion-des-couts/?xtor=RSS-1</a></font></p>\r\n<p _counted=\"undefined\">&nbsp;</p>', '2009-07-29 10:56:23', 1, '', '', 'legrand-satisfait-de-sa-gestion-des-coûts-publie-le-29/07/2009', '&nbsp; <span style=\"FONT-FAMILY: \'Calibri\',\'sans-serif\'; mso-fareast-font-family: \'Times New Roman\'\">Le p-dg Gilles Schnepp s&rsquo;est voulu rassurant lors de la pr&eacute;sentation des r&eacute;sultats de l&rsquo;entreprise au premier semestre 2009, et ce en d&eacute;pit d&rsquo;un chiffre d&rsquo;affaires en baisse de 16,7%.<o:p></o:p></span>'),
(21, 6, 'Veolia Environnement réalise 146 millions d’euros d’économies au premier semestre 2009. Publié le 06/08/2009', '<p _counted=\"undefined\">Le chiffre d\'affaires de Veolia Environnement sur les six premiers mois de l\'ann&eacute;e est de 17,4 milliards d\'euros.</p>\r\n<p _counted=\"undefined\">Le volume d\'achats annuel du groupe est estim&eacute; &agrave; plus de 13,5 milliards d\'euros.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/08/06/30212/Veolia-Environnement-realise-146-millions-d-euros-d-economies-au-premier-semestre-2009/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/08/06/30212/Veolia-Environnement-realise-146-millions-d-euros-d-economies-au-premier-semestre-2009/?xtor=RSS-1</a></font></p>', '2009-08-06 17:52:35', 1, '', '', 'veolia-environnement-realise-146-millions-deuros-deconomies-au-premier-semestre-2009-publie-le-06/08/2009', '<div>L&rsquo;objectif du groupe sp&eacute;cialis&eacute; dans gestion de l&rsquo;eau, des d&eacute;chets, des transports et de l&rsquo;&eacute;nergie est de 180 millions d&rsquo;euros d&rsquo;&eacute;conomies r&eacute;currentes sur l&rsquo;ensemble de l&rsquo;ann&eacute;e.</div>');
INSERT INTO `actualite` (`id`, `image_id`, `titre`, `description`, `created`, `is_active`, `keywords`, `source`, `slug`, `apercu`) VALUES
(22, 13, 'Le commerce en ligne a généré 28 MDH  de chiffre d\'affaires en six mois. Publié le 10/08/2009', '<p><font face=\"Arial\"><font face=\"Arial\">Depuis le d&eacute;but de l&rsquo;ann&eacute;e, la toile marocaine a connu une nouvelle avanc&eacute;e dans le domaine du e-commerce, un secteur prometteur avec plus de quarante sites marchands proposant actuellement le paiement en ligne. Pour ce 1e semestre, le chiffre d&rsquo;affaires du e-commerce s&rsquo;&eacute;l&egrave;ve en effet &agrave; 28 MDH, tous paiements confondus, soit 80% des 35 MDH par lesquels s&rsquo;&eacute;tait sold&eacute;e toute l&rsquo;ann&eacute;e 2008. Maroc T&eacute;l&eacute;commerce, interm&eacute;diaire entre les banques et les sites marchands, assurant la s&eacute;curit&eacute; du paiement en ligne, pr&eacute;voit&nbsp; que le chiffre d&rsquo;affaires du secteur atteigne 80 MDH d&rsquo;ici &agrave; la fin de l&rsquo;ann&eacute;e. Une belle &eacute;volution quand on sait que les premi&egrave;res transactions pay&eacute;es avec une carte marocaine n&rsquo;ont &eacute;t&eacute; autoris&eacute;es qu&rsquo;en novembre 2007.</font></font></p>\r\n<p><font face=\"Arial\"><font face=\"Arial\"><strong>3 000 DH pour int&eacute;grer le site marchand sur la plateforme de Maroc T&eacute;l&eacute;commecre.</strong><br />\r\nMais cet emballement a une explication. Les projets mis en place en 2008, comme le t&eacute;l&eacute;paiement de factures de t&eacute;l&eacute;phone, ou, plus r&eacute;cemment, celui de plusieurs imp&ocirc;ts portent leurs fruits en 2009.&nbsp; &laquo;Les services lanc&eacute;s, ou ceux qui sont en cours de lancement, sont innovants et rencontrent un int&eacute;r&ecirc;t av&eacute;r&eacute; aupr&egrave;s de la client&egrave;le marocaine&raquo;, confirme Samira urroum, Directrice Technologie et Business D&eacute;veloppement &agrave; Maroc T&eacute;l&eacute;commerce. <br />\r\nIl est certain que des sites marchands &agrave; fort potentiel comme AirArabia, Jet4You, IAM ou Lydec permettront de nfler le r&eacute;sultat de 2009. D&rsquo;autres grands projets sont en cours de pr&eacute;paration et devraient &ecirc;tre annonc&eacute;s d&rsquo;ici quelques semaines. Pour Samira urroum, &laquo;ils permettent d&rsquo;affirmer que les perspectives sont prometteuses pour le paiement en ligne au Maroc&raquo;. Des secteurs comme le voyage et l&rsquo;artisanat sont amen&eacute;s &agrave; conna&icirc;tre une nouvelle vie sur le web, notamment &agrave; l&rsquo;international. <br />\r\nN&eacute;anmoins, chez Maroc T&eacute;l&eacute;commerce, on se veut prudent. 2009 semble &ecirc;tre une &eacute;tape importante pour le e-commerce mais c&rsquo;est 2010 qui marquera un vrai d&eacute;collage. &laquo;La vulgarisation aupr&egrave;s des commerces pour l&rsquo;enrichissement du contenu et l&rsquo;impl&eacute;mentation qui s&rsquo;en suit demande du temps&raquo;, poursuit Mme urroum. <br />\r\nA noter que les frais d&rsquo;int&eacute;gration d&rsquo;un site marchand sur la plateforme Maroc T&eacute;l&eacute;commerce co&ucirc;tent entre<br />\r\n1 000 et 3 000 DH.</font></font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.lavieeco.com/economie/14454-le-commerce-en-ligne-a-genere-28-mdh-de-chiffre-daffaires-en-six-mois.html\">http://www.lavieeco.com/economie/14454-le-commerce-en-ligne-a-genere-28-mdh-de-chiffre-daffaires-en-six-mois.html</a></font></p>', '2009-08-10 14:50:42', 1, '', '', 'le-commerce-en-ligne-a-genere-28-mdh-de-chiffre-daffaires-en-six-mois-publie-le-10/08/2009', '<font face=\"Arial\">Cela correspond &agrave; 80% du chiffre d&rsquo;affaires r&eacute;alis&eacute; au cours de l&rsquo;ann&eacute;e 2008.<br />\r\nUne quarantaine de sites marchands actuellement, 100 d&rsquo;ici la fin de l&rsquo;ann&eacute;e.</font>'),
(23, 14, 'L’Oréal : Le service achats indirects prend forme, Publié le 25 août 2009', '<p><font face=\"Arial\">Les achats indirects repr&eacute;sentent 1 milliard d&rsquo;euros, sur un montant total pour le groupe d&rsquo;environ 8,7 milliards d&rsquo;euros d&rsquo;achats. Cette cat&eacute;rie comprend l&rsquo;informatique, les t&eacute;l&eacute;coms, les voyages, le facility management, la logistique, la formation, l&rsquo;int&eacute;rim, les prestations intellectuelles et les consommables. Le directeur des achats indirects recrut&eacute; fin 2008, Laszlo Koos, a &agrave; ce jour constitu&eacute; son &eacute;quipe de catery managers, avec un seul recrutement externe, pour un sp&eacute;cialiste des technologies de l&rsquo;information et des t&eacute;l&eacute;coms.</font></p>\r\n<p><font face=\"Arial\">La dizaine de postes restant &agrave; pourvoir sont plac&eacute;s dans les diff&eacute;rents pays du groupe. &laquo; Ces &eacute;quipes pourront &ecirc;tre recrut&eacute;es en interne suite &agrave; la r&eacute;organisation tout juste entam&eacute;e des effectifs achats PLV/Promo &raquo;, pr&eacute;vient Laszlo Koos.</font></p>\r\n<p><font face=\"Arial\">&Agrave; pr&eacute;sent, six cat&eacute;ries d&rsquo;achats sont sous la uvernance de la direction g&eacute;n&eacute;rale des achats du groupe : articles de conditionnement, mati&egrave;res premi&egrave;res, sous-traitance, &eacute;quipements industriels, PLV promo, et indirects. &laquo; Pratiquement dans toutes ces familles une r&eacute;organisation est en cours, dont la constante est une n&eacute;cessit&eacute; d\'accro&icirc;tre la productivit&eacute; du service et de r&eacute;pondre &agrave; des besoins &eacute;largis &raquo;, explique Laszlo Koos. &laquo; Les r&eacute;organisations dans les services achats du groupe ainsi que le d&eacute;veloppement de notre direction des achats indirects se sont faits &agrave; effectif constant, voire en l&eacute;g&egrave;re baisse &raquo;, pr&eacute;cise le directeur des achats indirects.</font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/A3/document_article_web.phtml?IdTis=XTC-BPA-4ORYK-DD-XNXFU-FRX9\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/A3/document_article_web.phtml?IdTis=XTC-BPA-4ORYK-DD-XNXFU-FRX9</a></font></p>', '2009-08-25 17:01:06', 1, '', '', 'loreal-le-service-achats-indirects-prend-forme-publie-le-25-août-2009', '<font face=\"Arial\">Cr&eacute;&eacute; fin 2008, il r&eacute;unit d&eacute;sormais 26 acheteurs. Une dizaine restent &agrave; recruter pour des postes &agrave; l&rsquo;international. Jusqu&rsquo;ici, recrutements internes et gains de productivit&eacute; sont de mise.</font>'),
(24, 14, 'Le Creuset : Des approvisionnements aux achats. Publié le 01 Septembre 2009', '<p><font face=\"Arial\">L&rsquo;objectif de Patrick Jacob, directeur technique du groupe Le Creuset, consiste &agrave; &laquo; cr&eacute;er un poste achats, avec la volont&eacute; de mettre en place le dossier relations fournisseurs et de suivre au plus pr&egrave;s la qualit&eacute; fournisseurs &raquo;. Le directeur technique du groupe partageait, jusqu&rsquo;&agrave; cette ann&eacute;e, la gestion des achats avec le responsable des achats et approvisionnements, parti en retraite apr&egrave;s avoir assum&eacute; et fait monter en puissance la fonction pendant plus de 25 ans.<br />\r\nMarie-Odile Glacet, qui lui a succ&eacute;d&eacute; progressivement, entre juillet et septembre 2009, devra d&eacute;sormais prendre en charge un montant compris entre 20 et 25 millions d&rsquo;euros d&rsquo;achats annuels comprenant 10 % d&rsquo;&eacute;nergie, un tiers de mati&egrave;res premi&egrave;res, 25 % d&rsquo;emballages et le reste en achats g&eacute;n&eacute;raux. Patrick Jacob lui confie la responsabilit&eacute; de l&rsquo;&eacute;nergie, mais conserve la gestion des investissements. Elle devra par ailleurs centraliser la gestion de nouvelles familles : maintenance, s&eacute;curit&eacute;, hygi&egrave;ne, informatique, formation ou encore &eacute;nergie.<br />\r\nSource : <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/A7/document_article_web.phtml?IdTis=XTC-BPA-4SY4H-DD-XRL6W-FSRC\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/A7/document_article_web.phtml?IdTis=XTC-BPA-4SY4H-DD-XRL6W-FSRC</a></font></font></p>', '2009-09-01 15:56:43', 1, '', '', 'le-creuset-des-approvisionnements-aux-achats-publie-le-01-septembre-2009', '<p><span class=\"EC_texte_bleu\"><font face=\"Arial\">Le sp&eacute;cialiste fran&ccedil;ais de la fonte &eacute;maill&eacute;e et du mat&eacute;riel de cuisson recrute une responsable des achats et, au m&ecirc;me moment, fait passer la fonction approvisionnement sous l&rsquo;autorit&eacute; du d&eacute;partement logistique.<br />\r\n</font></span></p>'),
(25, 14, 'GL Events : La fonction achats sur le devant de la scène. Publié le 08/09/09', '<p><font face=\"Arial\">Plac&eacute; sous la responsabilit&eacute; du directeur ex&eacute;cutif, Daniel Chapiro, (achats, SI, contr&ocirc;le de gestion et grands projets), le service achats de GL Events est compos&eacute; de trois responsables achats animant un r&eacute;seau de 11 acheteurs, d&rsquo;acheteurs d&eacute;l&eacute;gu&eacute;s et d&rsquo;approvisionneurs. Pour un chiffre d&rsquo;affaires 2008 de 606 millions d&rsquo;euros, ils g&egrave;rent un montant global de 390 millions d&rsquo;euros d&rsquo;achats.</font></p>\r\n<p><font face=\"Arial\">Leur contribution au plan de r&eacute;duction des co&ucirc;ts lanc&eacute; mi-2008 est pass&eacute;e par une vague de ren&eacute;ciations. D&egrave;s la fin de l&rsquo;ann&eacute;e derni&egrave;re, tous les achats ont &eacute;t&eacute; r&eacute;&eacute;valu&eacute;s au regard du coup de frein impos&eacute; &agrave; l&rsquo;&eacute;conomie par la crise financi&egrave;re. Les prix des mati&egrave;res premi&egrave;res, du transport, de l&rsquo;int&eacute;rim ou de la t&eacute;l&eacute;phonie ont pu &ecirc;tre r&eacute;duits dans des proportions allant de - 5 &agrave; - 60 %. La r&eacute;duction du panel des quelque 7 000 fournisseurs actifs a aussi &eacute;t&eacute; entreprise. Leur nombre devrait baisser de 10 % en 2009, sachant que 9 % d&rsquo;entre eux repr&eacute;sentent 80 % des achats du groupe. Enfin, la part de march&eacute; des LCC a &eacute;t&eacute; rehauss&eacute;e, en particulier pour des prestations de service ou de montage.</font></p>\r\n<p><font face=\"Arial\">Le groupe s&rsquo;interroge d&eacute;sormais sur les moyens &agrave; mobiliser pour faire progresser les achats. &laquo; Si nous voulons passer &agrave; l\'&eacute;tape suivante de construction de la fonction achats, il faut activer des leviers plus complexes : refonte des process, am&eacute;lioration des anticipations achats, contribution plus active &agrave; la conception des produits. Pour cela, nous avons besoin d\'une animation plus forte et d\'un renforcement de la fonction &raquo;, anticipe Daniel Chapiro.<br />\r\n</font></p>\r\n<p><font face=\"Arial\">Source: <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/B8/document_article_web.phtml?IdTis=XTC-BPA-40ETK-DD-XVJFJ-FT9L\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/B8/document_article_web.phtml?IdTis=XTC-BPA-40ETK-DD-XVJFJ-FT9L</a></font></font></p>\r\n<p><font face=\"Arial\"></font></p>', '2009-09-08 11:17:25', 1, '', '', 'gl-events-la-fonction-achats-sur-le-devant-de-la-scene-publie-le-08/09/09', '<font face=\"Arial\">Le groupe sp&eacute;cialiste de l&rsquo;&eacute;v&eacute;nementiel et de la gestion d&rsquo;espaces affiche un bon niveau d&rsquo;activit&eacute; et une marge op&eacute;rationnelle renforc&eacute;e au premier semestre. L&rsquo;action de son service achats, qui monte en puissance, y a largement contribu&eacute;.</font>'),
(26, 6, 'CAC 40 : quelle place pour les achats dans les rapports annuels ? Publié le 10 Septembre 2009', '<p><font face=\"Arial\">Quelle est la visibilit&eacute; des achats dans les rapports annuels ou d&eacute;veloppement durable des entreprises du CAC 40 ? Le cabinet de conseil AgileBuyer, associ&eacute; &agrave; la Cdaf, a men&eacute; pour la premi&egrave;re fois une &eacute;tude sur le sujet, en analysant l\'ensemble des documents de 2007 et de 2008. Et lance un nouvel indice de reconnaissance interne achats (Iria), qui synth&eacute;tise cette visibilit&eacute; au travers de sept crit&egrave;res. </font></p>\r\n<p><font face=\"Arial\"><strong>Quatre bons &eacute;l&egrave;ves</strong></font></p>\r\n<p><font face=\"Arial\">Pour cette premi&egrave;re &eacute;dition, quatre entreprises obtiennent la note maximale : Air France-KLM, Michelin, Peugeot et Vallourec (indice 100). En revanche, Dexia occupe la derni&egrave;re place des entreprises du CAC 40 avec le plus petit Iria (indice 10) juste derri&egrave;re Alstom, EDF, Pernod Ricard, Soci&eacute;t&eacute; G&eacute;n&eacute;rale, Total, Unibail-Rodamco et Vivendi (indice 20).</font></p>\r\n<p><font face=\"Arial\">Au-del&agrave; de ce classement, le verdict, rendu public d&eacute;but septembre, est tr&egrave;s contrast&eacute; pour les achats. Sur le plan de la repr&eacute;sentativit&eacute;, les chiffres traduisent clairement le faible poids des achats au niveau du comit&eacute; de direction ou du comit&eacute; ex&eacute;cutif. Seulement 17,5 % des entreprises du CAC, soit 7 soci&eacute;t&eacute;s (Accor, Air France-KLM, Capgemini, Michelin, Peugeot, Renault et Vallourec), ont indiqu&eacute; clairement que la fonction achats est repr&eacute;sent&eacute;e dans les hautes sph&egrave;res. Et encore faut-il nuancer le constat : m&ecirc;me si les achats sont clairement cit&eacute;s, certaines de ces entreprises ne signalent m&ecirc;me pas le nom du directeur achats.</font></p>\r\n<p><font face=\"Arial\"><strong>Les achats durables mis en avant</strong></font></p>\r\n<p><font face=\"Arial\">Mais d\'autres r&eacute;sultats sont encourageants. &ldquo;La repr&eacute;sentativit&eacute; et le poids de la fonction achats progressent mais le chemin reste long &agrave; parcourir&rdquo;, dit en substance l\'&eacute;tude. Ainsi, 40 % des grandes entreprises ont cit&eacute; leur direction achats. Certains chiffres traduisent plus pr&eacute;cis&eacute;ment les pr&eacute;occupations du moment, &agrave; l\'image de la relation fournisseurs. Plus de 77 % des soci&eacute;t&eacute;s ont, par exemple, &eacute;voqu&eacute; et/ou d&eacute;velopp&eacute; leur politique achats vis-&agrave;-vis de leurs fournisseurs et sous-traitants. On s\'&eacute;tonne moins de voir les entreprises citer unanimement leurs achats dans leur rapport d&eacute;veloppement durable. &ldquo;Ce dernier donne la part belle aux achats dans toutes les entreprises du Cac 40&rdquo;, rel&egrave;ve l\'&eacute;tude. 100 % des entreprises ont, en effet, cit&eacute; l\'action de leurs achats en la mati&egrave;re.</font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Article-A-La-Une/1077/CAC-40-quelle-place-pour-les-achats-dans-les-rapports-annuels--/?XType=XTM&amp;xtor=EPR-3\">http://www.decision-achats.fr/xml/Article-A-La-Une/1077/CAC-40-quelle-place-pour-les-achats-dans-les-rapports-annuels--/?XType=XTM&amp;xtor=EPR-3</a></font></p>', '2009-09-10 13:18:56', 1, '', '', 'cac-40-quelle-place-pour-les-achats-dans-les-rapports-annuels-?-publie-le-10-septembre-2009', '<font face=\"Arial\">M&ecirc;me si la visibilit&eacute; des achats progresse, moins de la moiti&eacute; des entreprises du CAC ont cit&eacute; leur direction achats dans leurs rapports annuels, rel&egrave;ve une &eacute;tude AgileBuyer/Cdaf.</font>'),
(27, 14, 'Aldès : La croissance génère un potentiel de synergies achats. Publié le 15 Septembre 2009.', '<p><font face=\"Arial\">Fin 2008, le groupe Ald&egrave;s a embauch&eacute; une responsable des achats indirects (50 millions d&rsquo;euros par an) et un responsable des achats techniques (achats de production et n&eacute;ce, sur un p&eacute;rim&egrave;tre de 95 millions d&rsquo;euros). Le service achats est d&eacute;sormais compos&eacute; de 14 personnes au si&egrave;ge et d&rsquo;un r&eacute;seau de correspondants dans les filiales.<br />\r\nLe service des achats techniques doit &agrave; pr&eacute;sent prendre en compte l&rsquo;&eacute;volution rapide du groupe : hausse des ventes 2008 de 9 %, cr&eacute;ation de nouvelles filiales &agrave; l&rsquo;&eacute;tranger et prise de participation majoritaire dans la soci&eacute;t&eacute; Airpac en juin dernier. Cette derni&egrave;re entra&icirc;ne, par exemple, la mont&eacute;e en puissance des familles d&rsquo;achats li&eacute;s aux &eacute;quipements hydrauliques. &laquo; Il faut adapter le fonctionnement du service achats &agrave; l\'augmentation des volumes de certains produits et repenser la r&eacute;partition par familles &raquo;, explique Fr&eacute;d&eacute;ric Giraudet. Concernant les ressources humaines, il entend aussi &laquo; mener une r&eacute;flexion, en termes de comp&eacute;tences ou d&rsquo;effectif &raquo;.<br />\r\nLe responsable des achats du groupe souhaite aussi optimiser les relations avec ses fournisseurs, en d&eacute;veloppant des partenariats et en rationalisant le panel. Celui-ci doit &ecirc;tre r&eacute;duit d&rsquo;un tiers cette ann&eacute;e et de moiti&eacute; en 2010.<br />\r\nEn termes d&rsquo;&eacute;conomies le service achats a obtenu 3 % de r&eacute;duction des co&ucirc;ts d&rsquo;achats au premier semestre. </font></p>\r\n<p><font face=\"Arial\">Source: <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/C7/document_article_web.phtml?IdTis=XTC-BPA-UD6RV-DD-X39NN-FT6E\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/40/C7/document_article_web.phtml?IdTis=XTC-BPA-UD6RV-DD-X39NN-FT6E</a></font></font><font face=\"Arial\"></font></p>', '2009-09-15 12:00:44', 1, '', '', 'aldes-la-croissance-genere-un-potentiel-de-synergies-achats-publie-le-15-septembre-2009', '<font face=\"Arial\">Parmi les objectifs de Fr&eacute;d&eacute;ric Giraudet, responsable des achats du sp&eacute;cialiste des &eacute;quipements de ventilation, figure l&rsquo;adaptation de son organisation achats &agrave; la croissance du groupe. Des gains de productivit&eacute; et des synergies sont &agrave; la clef. </font>'),
(28, 6, 'Pour bien acheter, soyez bien renseigné Publié le 17 septembre 2009', '<p><font face=\"Arial\">En mars dernier, 7 000 salari&eacute;s de l\'usine PSA Peugeot Citro&euml;n de Sochaux (Doubs) se sont retrouv&eacute;s au ch&ocirc;mage technique pendant une semaine. Une situation d\'autant plus probl&eacute;matique pour le constructeur qu\'elle n\'est pas li&eacute;e &agrave; un carnet de commandes en berne ou &agrave; une mesure radicale de r&eacute;duction des co&ucirc;ts . Depuis le lancement de deux nouveaux mod&egrave;les, le site conna&icirc;t un regain d\'activit&eacute;. En r&eacute;alit&eacute;, c\'est un conflit social chez Key Plastics, un sous-traitant du constructeur, qui a provoqu&eacute; une rupture de la cha&icirc;ne d\'approvisionnement. L\'&eacute;quipementier, plac&eacute; en redressement judiciaire en novembre dernier, est en pleine restructuration et comptait fermer son usine de Voujeaucourt, situ&eacute;e &agrave; quelques kilom&egrave;tres de Sochaux, qui fournit notamment &agrave; PSA des &eacute;l&eacute;ments pour les planches de bord de ses voitures. La gr&egrave;ve a dur&eacute; 15 jours. Au bout d\'une semaine, faute de stock, Key Plastics s\'est retrouv&eacute;e dans l\'incapacit&eacute; de livrer son client. Les cons&eacute;quences pour le constructeur automobile ont &eacute;t&eacute; substantielles: pr&egrave;s de 3 400 v&eacute;hicules n\'ont pu &ecirc;tre fabriqu&eacute;s. </font></p>\r\n<p><font face=\"Arial\">Ce type d\'&eacute;v&eacute;nement est un v&eacute;ritable cauchemar pour toute direction achats. Pourtant, l\'&eacute;valuation du risque fournisseurs est une priorit&eacute; souvent oubli&eacute;e, m&ecirc;me en p&eacute;riode de crise. Dans une r&eacute;cente &eacute;tude commandit&eacute;e par BravoSolutionEtude r&eacute;alis&eacute;e par le cabinet Loudhouse Research aupr&egrave;s de 400 directeurs achats, entre f&eacute;vrier et mars 2009., 78% des directeurs achats interrog&eacute;s d&eacute;clarent b&eacute;n&eacute;ficier d\'opportunit&eacute;s inattendues ces derniers mois. Par exemple, un peu plus de la moiti&eacute; consid&egrave;rent se trouver dans une position plus strat&eacute;gique pour n&eacute;cier avec les prestataires. Mais seuls 22% se disent pr&eacute;occup&eacute;s par les risques de faillite chez leurs fournisseurs. &laquo;A l\'heure o&ugrave; les co&ucirc;ts doivent &ecirc;tre r&eacute;duits, de nombreux professionnels des achats poursuivent actuellement des strat&eacute;gies &agrave; court terme. Et parce qu\'ils auront ferm&eacute; les yeux sur le risque fournisseurs &agrave; moyen terme, ils vont &ecirc;tre confront&eacute;s &agrave; de graves difficult&eacute;s au cours des douze prochains mois&raquo;, pr&eacute;vient G&eacute;rard Dahan, vice-pr&eacute;sident marketing et communication de BravoSolution. </font></p>\r\n<p><font face=\"Arial\"><strong>DES D&Eacute;FAILLANCES D\'ENTREPRISES EN FORTE HAUSSE<br />\r\n</strong>En p&eacute;riode de crise, le risque fournisseurs est au plus haut. Le nombre de redressements et de liquidations judiciaires ne cesse de cro&icirc;tre. Selon la derni&egrave;re &eacute;tude r&eacute;alis&eacute;e par Altares, en France, les d&eacute;faillances d\'entreprises ont augment&eacute; de 21% au premier trimestre 2009 par rapport &agrave; la m&ecirc;me p&eacute;riode en 2008, avec pr&egrave;s de 15 000 jugements prononc&eacute;s par les tribunaux. Tous les secteurs sont concern&eacute;s, en particulier le transport, l\'industrie et la construction. Si les entreprises de moins de cinq ans sont toujours les plus fragiles, les plus anciennes sont &eacute;galement frapp&eacute;es. &laquo;La forte augmentation des d&eacute;faillances d\'entreprises en ce d&eacute;but d\'ann&eacute;e 2009 &eacute;tait attendue, rappelle Thierry Million, responsable des &eacute;tudes chez Altares. Malheureusement, des &eacute;pisodes encore plus difficiles peuvent &ecirc;tre craints.&raquo; Le sp&eacute;cialiste de l\'information B to B pr&eacute;voit ainsi pr&egrave;s de 60 000 redressements et liquidations pour 2009, soit 2% du total des entreprises fran&ccedil;aises. &laquo;L\'essentiel des organisations passera cette crise. Mais il leur est primordial de d&eacute;tecter les clients et les fournisseurs les plus fragiles, de s&eacute;curiser les relations avec les plus strat&eacute;giques d\'entre eux et d\'en d&eacute;couvrir de nouveaux plus p&eacute;rennes&raquo;, r&eacute;sume Thierry Million. </font></p>\r\n<p><font face=\"Arial\">Dans leur livre intitul&eacute; Contr&ocirc;le interne et gestion des risques, paru aux Editions Maxima d&eacute;but 2009, Fr&eacute;d&eacute;ric Bernard et Eric Salviac sont revenus sur cette notion de risque fournisseurs. Afin d\'&eacute;valuer la sant&eacute; financi&egrave;re des fournisseurs &agrave; un instant T et d\'effectuer des pr&eacute;visions par rapport aux risques de d&eacute;faillances, les auteurs recommandent aux entreprises de r&eacute;aliser une analyse financi&egrave;re pouss&eacute;e. &laquo;Il est alors possible d\'avoir un avis pertinent sur la qualit&eacute; de gestion du fournisseur, mais &eacute;galement sur sa capacit&eacute; &agrave; faire face &agrave; des variations de cycle d\'activit&eacute;, &agrave; la baisse comme &agrave; la hausse&raquo;, pr&eacute;cise Eric Salviac. L\'analyse financi&egrave;re est alors bas&eacute;e sur l\'&eacute;tude approfondie des bilans, comptes de r&eacute;sultats et &eacute;tat des cash flows. &laquo;Ce type d\'analyse fait appel &agrave; des comp&eacute;tences g&eacute;n&eacute;ralement peu pr&eacute;sentes au niveau de la fonction achats, reprend Eric Salviac. L\'analyse de ce risque sera davantage men&eacute;e avec l\'aide de la direction financi&egrave;re ou de tout organisme externe qui serait susceptible d\'apporter son expertise.&raquo; </font></p>\r\n<p><font face=\"Arial\"><strong>LA SITUATION DES FOURNISSEURS &Agrave; LA LOUPE<br />\r\n</strong>Autrefois cantonn&eacute; &agrave; l\'&eacute;tude de la sant&eacute; financi&egrave;re d\'un nouveau fournisseur, le recours &agrave; une agence de renseignements &eacute;conomiques et financiers s\'est ainsi &eacute;tendu depuis quelques mois au panel strat&eacute;gique. &laquo;Nous sommes d&eacute;plus en plus sollicit&eacute;s par les directions achats, quel que soit le secteur d\'activit&eacute;&raquo;, confirme Franck Lemoine, directeur des ventes chez Pouey International. Auparavant, seules les entreprises industrielles, dont la production d&eacute;pendait de quelques fournisseurs, recouraient aux prestations de l\'agence. &laquo;Aujourd\'hui, m&ecirc;me dans le secteur des services, les grands comptes et les PME souhaitent conna&icirc;tre la situation &eacute;conomique de leurs fournisseurs strat&eacute;giques&raquo;, observe Franck Lemoine (Pouey International). Au-del&agrave; des donn&eacute;es financi&egrave;res, les directions achats recherchent des informations plus pr&eacute;cises sur leurs sous-traitants. Celles-ci veulent pouvoir &eacute;valuer les risques de rupture d\'approvisionnement, d&eacute;terminer la capacit&eacute; d\'un fournisseur &agrave; assumer ses engagements de services, valider sa r&eacute;activit&eacute; en cas de difficult&eacute;s, etc. &laquo;Le recours &agrave; une soci&eacute;t&eacute; de renseignements &eacute;conomique permet de ne pas c&eacute;der &agrave; la panique et, bien souvent, de se rassurer, explique Fr&eacute;d&eacute;ric Soriano, directeur du d&eacute;veloppement de BEIC. M&ecirc;me si le contexte actuel est difficile, on se rend compte que beaucoup de fournisseurs r&eacute;ussissent &agrave; s\'adapter.&raquo; <br />\r\nAlors qu\'il existe de nombreuses informations publiques sur la sant&eacute; financi&egrave;re des entreprises, les agences de renseignements d&eacute;fendent leur valeur ajout&eacute;e. &laquo;Les directions achats sont parfois submerg&eacute;es d\'informations. Le recours &agrave; nos services leur donne la possibilit&eacute; d&eacute;faire le tri et de disposer d\'un outil d\'aide &agrave; la d&eacute;cision beaucoup plus rapide&raquo;, argumente Jean-Yves Bajon, directeur g&eacute;n&eacute;ral de Coface Services. &laquo;Quand une entreprise poss&egrave;de plusieurs milliers de fournisseurs, la recherche d\'informations est complexe et fastidieuse, ajoute Emmanuel Robert, directeur marketing et communication d\'Altares. Le recours &agrave; un prestataire externe, dont les processus sont industrialis&eacute;s, permet de r&eacute;pondre &agrave; un tel besoin.&raquo; <br />\r\nAutre avantage et pas des moindres: la qualit&eacute; des informations. Franck Lemoine (Pouey International) rappelle ainsi que les agences r&eacute;alisent des enqu&ecirc;tes sur mesure, &agrave; n\'importe quel moment de l\'ann&eacute;e et qui peuvent &ecirc;tre suivies dans le temps. Pour Fr&eacute;d&eacute;ric Soriano (BEIC), le fait de passer par un interlocuteur ext&eacute;rieur donne &agrave; la direction achats la possibilit&eacute; d\'obtenir des informations plus pertinentes et de recouper certains &eacute;l&eacute;ments. &laquo;Les fournisseurs se livrent davantage, d autant que nous ne donnons jamais le nom du donneur d\'ordres, poursuit-il. <br />\r\nCela nous permet d aller plus loin dans la discussion. Face &agrave; un acheteur, le fournisseur ne voudra pas risquer de compromettre leur relation.&raquo; Le co&ucirc;t de ce genre de prestations est tr&egrave;s variable, il peut aller de 40 euros par fournisseur pour des renseignements de base (principaux &eacute;l&eacute;ments financiers, qualit&eacute; des paiements, etc.) &agrave; plusieurs centaines d\'euros par prestataire pour r&eacute;aliser une enqu&ecirc;te approfondie (&eacute;tude de l\'environnement &eacute;conomique du fournisseur, liens des dirigeants avec d\'autres structures, &eacute;valuations des points forts et des points faibles de l\'entreprise, etc.). Toutes les agences pratiquent plus ou moins les m&ecirc;mes tarifs. D&egrave;s lors, d\'autres crit&egrave;res de s&eacute;lection apparaissent plus importants, comme la capacit&eacute; de mener une &eacute;tude &agrave; l\'international gr&acirc;ce &agrave; un r&eacute;seau d\'informateurs sur place ou de d&eacute;livrer des r&eacute;sultats en tr&egrave;s peu de temps. &laquo;La collecte d\'informations est tr&egrave;s variable selon les pays, y compris dans des pays d&eacute;velopp&eacute;s tels que l\'Allemagne et les Etats-Unis&raquo;, pr&eacute;cise Emmanuel Robert (Altares). Selon la nature des renseignements demand&eacute;s, les r&eacute;sultats sont g&eacute;n&eacute;ralement d&eacute;livr&eacute;s entre 48 heures et cinq jours. &laquo;Par rapport aux risques fournisseurs, les &eacute;tudes sur les risques clients nous sont souvent demand&eacute;es dans l\'urgence, note Franck Lemoine (Pouey International). Mais de leur c&ocirc;t&eacute;, les directions achats nous accordent des d&eacute;lais plus longs car elles sont tr&egrave;s exigeantes sur la qualit&eacute; des informations.&raquo; Des ruptures d\'approvisionnement &agrave; moyen terme peuvent &ecirc;tre en jeu.</font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/Magazines/ConsultArticle.asp?ID_Article=32726&amp;iPage=1&amp;KeyAccess\">http://www.decision-achats.fr/Magazines/ConsultArticle.asp?ID_Article=32726&amp;iPage=1&amp;KeyAccess</a>=</font></p>', '2009-09-17 16:18:22', 1, '', '', 'pour-bien-acheter-soyez-bien-renseigne-publie-le-17-septembre-2009', '<font face=\"Arial\"><font face=\"Arial\">Alors que les risques de d&eacute;faillances chez les fournisseurs augmentent avec la crise, les directions achats craignent aujourd\'hui des ruptures dans la cha&icirc;ne d\'approvisionnement. L\'achat de renseignements financiers leur permet d\'anticiper de tels al&eacute;as.</font></font>'),
(29, 6, 'Réduire ses coûts pour optimiser la gestion administrative de ses RH. Publié le 28 septembre 2009', '<p><font face=\"Arial\">Intitul&eacute;e &laquo; Optimisation de la gestion administrative des RH &raquo;, cette enqu&ecirc;te montre effectivement que les DRH doivent composer avec des contraintes cl&eacute;s parfois exacerb&eacute;es par un contexte &eacute;conomique tendu. Pour plus d&rsquo;une organisation sur deux interrog&eacute;es, il s&rsquo;agit d&rsquo;automatiser les processus de gestion administrative des RH ; d&rsquo;harmoniser, homog&eacute;n&eacute;iser les pratiques en terme de paie et administration du personnel (56%) ; d&rsquo;assurer la veille l&eacute;gale et r&eacute;glementaire (55%) ; d&rsquo;accro&icirc;tre la productivit&eacute; des &eacute;quipes internes (51%) et de conserver l&rsquo;expertise et comp&eacute;tence RH en interne (rester autonome vis-&agrave;-vis de ses prestataires pour 51%). </font></p>\r\n<p><font face=\"Arial\"><strong>Principaux axes d&rsquo;optimisation &eacute;voqu&eacute;s<br />\r\n</strong>Pour plus des deux tiers des responsables interrog&eacute;s, l&rsquo;optimisation de la gestion administrative passe par une r&eacute;vision, voire une d&eacute;finition de l&rsquo;organisation de la gestion administrative&nbsp; RH et des processus associ&eacute;s (85%); la d&eacute;mat&eacute;rialisation des d&eacute;clarations sociales 80 % (ex. attestations de salaires, attestation d\'assurance ch&ocirc;mage...) ; l&rsquo;optimisation des r&egrave;gles de paie (80%) ; la mise en place d&rsquo;une base de connaissances RH permettant de collaborer et de capitaliser sur les bonnes pratiques de chacun (78%) ;&nbsp; la mise en place de solutions en self-service (ESS &ndash; Employee Self Service ou MSS &ndash; Manager Self Service) permettant aux collaborateurs ou &agrave; leurs managers de saisir eux-m&ecirc;mes certaines donn&eacute;es ou d\'acc&eacute;der &agrave; certaines informations (76%) ; la tra&ccedil;abilit&eacute; des processus, gr&acirc;ce &agrave; des solutions de workflow notamment (71%) ; la d&eacute;mat&eacute;rialisation des processus internes associ&eacute;s &agrave; la paie et &agrave; l\'administration du personnel (67%). </font></p>\r\n<p><font face=\"Arial\">&nbsp;</font><font face=\"Arial\">D&rsquo;autres voies d&rsquo;optimisation peuvent &ecirc;tre suivies. &laquo; Le d&eacute;ploiement d&rsquo;un CSP (Centre de Services Partag&eacute;s) pour la paie ou pour l&rsquo;ensemble des activit&eacute;s administratives RH, plus particuli&egrave;rement dans les grands groupes, permet de mutualiser les expertises RH, de r&eacute;duire les co&ucirc;ts mais &eacute;galement de valoriser le travail des &eacute;quipes RH et d&rsquo;offrir un meilleur service aux salari&eacute;s &raquo;, pr&eacute;cise H&eacute;l&egrave;ne Mouiche, charg&eacute;e d&rsquo;&eacute;tudes senior chez Markess International et responsable de l&rsquo;&eacute;tude. </font></p>\r\n<p><font face=\"Arial\">Une autre alternative peut &eacute;galement consister en l&rsquo;externalisation, partielle ou totale, de la gestion administrative des RH. 48% des organisations interrog&eacute;es ont ainsi choisi de confier &agrave; un prestataire tout ou partie des processus et/ou des solutions applicatives de gestion de la paie et de l&rsquo;administration du personnel.</font></p>\r\n<p><font face=\"Arial\"><strong>Acteurs de la gestion administrative des RH<br />\r\n</strong>Les &eacute;diteurs de logiciels RH ou d&rsquo;ERPs (Cegid, HR Access, Lefebvre Software, Meta4, Oracle, Sage ou SAP et les op&eacute;rateurs de services d&rsquo;externalisation (ADP, Cegedim SRH, Sopra) arrivent en t&ecirc;te parmi les prestataires jug&eacute;s aptes par les organisations interrog&eacute;es pour les accompagner dans leurs chantiers d&rsquo;optimisation de la gestion administrative des RH. Les attentes envers ces prestataires portent notamment sur des offres d&rsquo;archivage de documents d&eacute;mat&eacute;rialis&eacute;s (bulletins de salaires, contrats de travail&hellip;), des outils de reporting et d&rsquo;analyse (&eacute;laboration du bilan social&hellip;) et de la veille r&eacute;glementaire et l&eacute;gale.<br />\r\n</font><font face=\"Arial\">Markess International estime le march&eacute; des logiciels et services associ&eacute;s &agrave; la gestion administrative des RH &agrave; 1 090 millions d&rsquo;euros en 2009, soit pr&egrave;s de 46% du march&eacute; global des logiciels et services associ&eacute;s aux RH. Une march&eacute; qui devrait conna&icirc;tre une croissance annuelle moyenne de +4,5% et atteindre 1 190 millions d&rsquo;euros d&rsquo;ici 2011 selon Markess International. <br />\r\n</font></p>', '2009-09-28 15:05:31', 1, '', '', 'reduire-ses-coûts-pour-optimiser-la-gestion-administrative-de-ses-rh-publie-le-28-septembre-2009', '<font face=\"Arial\">Pour 57% des responsables d&rsquo;entreprises et administrations publiques interrog&eacute;s la r&eacute;duction des co&ucirc;ts (personnel, impression&hellip;) fait partie des enjeux majeurs associ&eacute;s &agrave; l&rsquo;optimisation de la gestion administrative des ressources humaines (RH). Tel est l&rsquo;un des principaux enseignements qui ressort de l&rsquo;&eacute;tude consacr&eacute;e en 2009 &agrave; la fonction RH et r&eacute;alis&eacute;e par le cabinet Markess International. </font>'),
(30, 6, 'Renault décerne ses trophées \"Qualité Fournisseurs\". Publié le 30 septembre 2009', '<p><font face=\"Arial\">Ces troph&eacute;es entendent r&eacute;compenser la performance de ces fournisseurs en termes de qualit&eacute;, ind&eacute;pendamment de leur taille, de leur pays d&rsquo;origine ou de leur secteur d&rsquo;activit&eacute;. Pour le constructeur, il s\'agit &eacute;galement de renforcer la motivation de l&rsquo;ensemble de ses fournisseurs pour atteindre les r&eacute;sultats attendus.</font></p>\r\n<p><font face=\"Arial\"><strong>Les laur&eacute;ats des Renault Supplier Quality Awards 2008 sont :</strong></font></p>\r\n<p><font face=\"Arial\"><strong><u>Au niveau r&eacute;gional</u></strong></font></p>\r\n<p><font face=\"Arial\"><strong>Delta Invest</strong> (pi&egrave;ces d&rsquo;injection plastique) pour sa capacit&eacute; &agrave; r&eacute;pondre &agrave; des cahiers des charges tr&egrave;s exigeants dans la fabrication de pi&egrave;ces en plastique hautement complexes ;<br />\r\n<strong>NGK do Brasil</strong> (bougies d&rsquo;allumage) pour ses r&eacute;sultats en qualit&eacute; totale et sa r&eacute;activit&eacute; ;<br />\r\n<strong>Samsong Industries</strong> (ceintures de si&egrave;ge arri&egrave;re) pour son syst&egrave;me d&rsquo;assurance qualit&eacute; exemplaire.<br />\r\n</font><font face=\"Arial\"></font></p>\r\n<p><font face=\"Arial\"><strong><u>Au niveau mondial</u></strong></font></p>\r\n<p><font face=\"Arial\"><strong>Gresin</strong> (presse d&rsquo;emboutissage) pour ses performances en termes de qualit&eacute;-co&ucirc;t-d&eacute;lai et son expertise pointue en ing&eacute;nierie m&eacute;canique ;<br />\r\n<strong>Hewlett Packard</strong> (assistance informatique) pour avoir &eacute;t&eacute; au-del&agrave; de ses engagements en termes de<br />\r\nperformance de services ;<br />\r\n<strong>Lagermax AED</strong> (logistique) pour une approche proactive et dynamique dans l&rsquo;optimisation des flux</font><font face=\"Arial\">logistiques ;<br />\r\n<strong>Perrotton</strong> (pi&egrave;ces de d&eacute;colletage) en reconnaissance des am&eacute;liorations constantes qui en ont fait le</font><font face=\"Arial\">num&eacute;ro un en qualit&eacute; de son secteur ;<br />\r\n<strong>SNOP</strong> (caisses en blanc) pour ses processus de production efficaces et ses programmes qualit&eacute; qui lui ont permis de maintenir durablement un tr&egrave;s haut niveau de qualit&eacute;.<br />\r\nCes troph&eacute;es ont &eacute;t&eacute; remis par Jean-Pierre Vallaude, directeur de la Qualit&eacute;, et Christian Vandenhende,</font></p>\r\n<p><font face=\"Arial\">directeur achats.</font></p>\r\n<p><font face=\"Arial\">Les achats de l\'alliance Renault Nissan, d\'un montant estim&eacute; &agrave; 60 milliards d\'euros, sont g&eacute;r&eacute;s par une filiale commune aux deux constructeurs, baptis&eacute;e Renault Nissan Purchasing Organisation (RNPO). Depuis avril 2009, cette derni&egrave;re couvre 100% des achats de l\'alliance.<br />\r\n</font></p>', '2009-09-30 16:23:06', 1, '', '', 'renault-decerne-ses-trophees-qualite-fournisseurs-publie-le-30-septembre-2009', '<font face=\"Arial\">&Agrave; l&rsquo;occasion du salon automobile de Francfort, le 14 septembre dernier, Renault a remis les &quot;Renault Supplier Quality Awards&quot; &agrave; huit fournisseurs de pi&egrave;ces et de services.</font>'),
(31, 14, 'Latécoère : 25 % de baisse pour les achats en 2009. Publié le 13 septembre 2009.', '<p><font face=\"Arial\">En 2009, Serge Angevin, le directeur des achats de Lat&eacute;co&egrave;re, table sur une enveloppe d&rsquo;achats de 160 millions d&rsquo;euros, au lieu de plus de 200 millions en 2008. Premi&egrave;re cons&eacute;quence : &laquo; Nous avons d&ucirc; recaler nos carnets de commandes et demander &agrave; nos fournisseurs de repousser leurs dates de livraison &raquo;, explique-t-il.</font></p>\r\n<p><font face=\"Arial\">Environ 80 % du panel a accept&eacute; de jouer le jeu. Les plus touch&eacute;s par la baisse des carnets de commandes ont &eacute;t&eacute; audit&eacute;s au pr&eacute;alable. Certains ont &eacute;t&eacute; aid&eacute;s, avec la reprise par Lat&eacute;co&egrave;re d&rsquo;une partie de leur stock, ou des transferts de production rendus possibles par la r&eacute;duction de la base fournisseurs. &Agrave; l&rsquo;issue de cette d&eacute;marche actuellement en cours, le panel de fournisseurs d&rsquo;a&eacute;rostructures devrait passer de 180 &agrave; 100.</font></p>\r\n<p><font face=\"Arial\">Parall&egrave;lement, le directeur des achats s&rsquo;efforce de r&eacute;organiser son service. La supply chain a ainsi &eacute;t&eacute; divis&eacute;e en trois entit&eacute;s : approvisionnements (optimisation du couple d&eacute;lais-stocks), logistique contractuelle (&eacute;valuation qualit&eacute; et d&eacute;lai fournisseurs) et qualit&eacute; achats et approvisionnements (pass&eacute;e sous la responsabilit&eacute; op&eacute;rationnelle des achats).</font></p>\r\n<p><font face=\"Arial\">Pour les acheteurs, il s&rsquo;agit d&eacute;sormais de travailler par grandes familles de commodit&eacute;s, plut&ocirc;t que par programmes, afin de n&eacute;cier sur des volumes plus importants. De premiers r&eacute;sultats sont apparus, pour deux des dix familles identifi&eacute;es, avec des baisses de prix de l&rsquo;ordre de 10 % &agrave; la clef. L&rsquo;objectif est aussi de faire &eacute;merger des comp&eacute;tences techniques, en se contentant, pour l&rsquo;instant, de formations intra.</font></p>', '2009-10-13 10:19:08', 1, '', '', 'latecoere-25-de-baisse-pour-les-achats-en-2009-publie-le-13-septembre-2009', '<font face=\"Arial\">Le constructeur a&eacute;ronautique pr&eacute;voit un recul de son activit&eacute; de 25 % cette ann&eacute;e, ce qui signifie aussi une &eacute;rosion brutale du volume des achats. &Agrave; charge pour le service achats de s&rsquo;adapter, en accompagnant ses fournisseurs et en r&eacute;organisant ses comp&eacute;tences.</font>'),
(32, 6, 'Eurocopter lance un plan d’économies de 200 millions d’euros. Publié le 22 octobre 2009', '<p><font face=\"Arial\">Pour ce faire,&nbsp; le fabricant europ&eacute;en d\'h&eacute;licopt&egrave;res compte se r&eacute;organiser en profondeur, notamment au niveau des fonctions communication, RH ou juridiques selon un porte-parole de l\'entreprise interrog&eacute; par l\'AFP.</font></p>\r\n<p><font face=\"Arial\">&quot;Le programme Shape n\'est pas qu\'un simple programme de r&eacute;duction des co&ucirc;ts, a indiqu&eacute; Lutz Bertling, le p-dg d\'Eurocopter. Il repr&eacute;sente une r&eacute;elle opportunit&eacute; pour l\'entreprise de r&eacute;aliser des &eacute;conomies et de g&eacute;n&eacute;rer du cash, ce qui est indispensable pour investir dans le futur.&quot;</font></p>\r\n<p><font face=\"Arial\">Le chiffre d\'affaires annuel d\'Eurocopter est de 4,5 milliards d\'euros. Le volume d\'achats de l\'entreprise est estim&eacute; &agrave; 3 milliards d\'euros.</font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/10/22/30985/Eurocopter-lance-un-plan-d-economies-de-200-millions-d-euros/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/10/22/30985/Eurocopter-lance-un-plan-d-economies-de-200-millions-d-euros/?xtor=RSS-1</a></font></p>', '2009-10-22 18:16:14', 1, '', '', 'eurocopter-lance-un-plan-deconomies-de-200-millions-deuros-publie-le-22-octobre-2009', '<font face=\"Arial\">Eurocopter vient d\'annoncer la mise en oeuvre d\'un plan de r&eacute;duction des co&ucirc;ts baptis&eacute; Shape et dont l\'objectif est de r&eacute;aliser pr&egrave;s de 200 millions d\'euros d\'&eacute;conomies d\'ici &agrave; 2011.</font>'),
(33, 6, 'Air Liquide : 230 millions d\'euros d\'économies réalisées. Publié le 20 octobre 2009', '<p><font face=\"Arial\">&quot;La contribution du programme Alma aux r&eacute;sultats de l\'entreprise se poursuit. Elle se manifeste par des r&eacute;sultats en mati&egrave;re d&rsquo;efficacit&eacute; structurelle, de g&eacute;n&eacute;ration de tr&eacute;sorerie et de ma&icirc;trise de l&rsquo;endettement&quot;, a d&eacute;clar&eacute; Beno&icirc;t Potier, p-dg du groupe Air Liquide lors de l\'annonce des r&eacute;sultats de l\'entreprise pour le troisi&egrave;me trimestre 2009.</font></p>\r\n<p><font face=\"Arial\">Le fabricant de gaz industriels et m&eacute;dicaux enregistre toutefois une baisse de 8,2% de son chiffre de d\'affaires au troisi&egrave;me trimestre, &agrave; 2,98 milliards d\'euros.</font></p>\r\n<p><font face=\"Arial\">L\'objectif du programme Alma est de r&eacute;aliser 300 millions d\'euros d\'&eacute;conomies en 2009 sur toutes les cat&eacute;ries de d&eacute;penses. Le volume d\'achats annuel de l\'entreprise est estim&eacute; &agrave; 7 milliards d\'euros.<br />\r\nSource: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/10/22/30986/Air-Liquide-230-millions-d-euros-d-economies-realisees/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/10/22/30986/Air-Liquide-230-millions-d-euros-d-economies-realisees/?xtor=RSS-1</a></font></font></p>', '2009-10-22 18:19:54', 1, '', '', 'air-liquide-230-millions-deuros-deconomies-realisees-publie-le-20-octobre-2009', '<font face=\"Arial\">Le groupe Air Liquide a r&eacute;alis&eacute; pr&egrave;s de 230 millions d\'euros d\'&eacute;conomies sur les neuf premiers mois de l\'ann&eacute;e, conform&eacute;ment &agrave; son programme de r&eacute;duction des co&ucirc;ts baptis&eacute; Alma.</font>'),
(34, 6, 'Sacem réduit de 25% sa facture télécom grâce à la VoIP. Publié le 27 Octobre 2009', '<p><font face=\"Arial\">En effet, l&rsquo;entreprise souhaitait moderniser son infrastructure de communication. A la fin de l&rsquo;ann&eacute;e derni&egrave;re, celle-ci a donc d&eacute;cid&eacute; de migrer son infrastructure vers une technologie IP, ce qui au passage lui permettait de simplifier la gestion de ses communications et de r&eacute;aliser des &eacute;conomies.</font></p>\r\n<p><font face=\"Arial\">&nbsp;Pour ce faire, la Sacem a retenu Verizon Business et sa solution Voice-over-IP Trunking. &quot;Nous collaborons depuis longtemps avec ce fournisseur. Le fait de retenir sa solution nous a permis de migrer rapidement et en douceur vers des communications IP&quot;, explique Vincent Nortier, chef de projet &agrave; la Sacem.</font></p>\r\n<p><font face=\"Arial\"></font>&nbsp;<font face=\"Arial\">En effet, le d&eacute;ploiement de la nouvelle solution a dur&eacute; six mois, avec la cr&eacute;ation de 2800 lignes IP sur les diff&eacute;rents sites de l&rsquo;entreprise mais de seulement un PBX IP central.</font></p>\r\n<p><font face=\"Arial\"></font>&nbsp;<font face=\"Arial\">Mais le projet a surtout permis &agrave; la Sacem de r&eacute;aliser d&rsquo;importantes &eacute;conomies. &quot;Le co&ucirc;t de nos appels vers les t&eacute;l&eacute;phones fixes a en effet &eacute;t&eacute; divis&eacute; par quatre et celui de nos appels vers les t&eacute;l&eacute;phones portables par trois&quot;, se f&eacute;licite Vincent Nortier.</font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/10/27/31054/Sacem-reduit-de-25-sa-facture-telecom-grace-a-la-VoIP/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/10/27/31054/Sacem-reduit-de-25-sa-facture-telecom-grace-a-la-VoIP/?xtor=RSS-1</a></font></p>', '2009-10-27 12:43:01', 1, '', '', 'sacem-reduit-de-25-sa-facture-telecom-grace-a-la-voip-publie-le-27-octobre-2009', '<p><font face=\"Arial\">En d&eacute;ployant une solution de t&eacute;l&eacute;phonie sur IP dans ses bureaux fran&ccedil;ais, la Sacem* vient de r&eacute;aliser depuis le d&eacute;but de l&rsquo;ann&eacute;e une &eacute;conomie de 25 % sur sa facture t&eacute;l&eacute;com.</font></p>'),
(35, 6, '\"La renaissance de la fonction achats\" vue par Françoise Odolant. Publié le 27 Octobre 2009', '<p><font face=\"Arial\">Les textes d\'une vingtaine de contributeurs, d\'horizons tr&egrave;s diff&eacute;rents, sont ainsi repris dans ce livre vendu au prix de 20 euros sur le site internet www.lanouvellerenaissance.fr</font></p>\r\n<p><font face=\"Arial\">Lors de cette soir&eacute;e de lancement, Fran&ccedil;oise Odolant, membre de ce r&eacute;seau et fondatrice du cabinet de conseil achats AFM Performance Booster, est revenue sur l\'&eacute;volution de la fonction achats dans les entreprises. Une contribution ex nihilo o&ugrave; l\'ancienne directrice achats de la Caisse d\'Epargne s\'est attach&eacute;e &agrave; donner une image positive de la fonction, particuli&egrave;rement en temps de crise : &quot;2008 aurait pu replonger les acheteurs dans les ann&eacute;es noires de la n&eacute;ciation brutale, pour servir le sauve-qui-peut de leur propre entreprise. Loin de ce ph&eacute;nom&egrave;ne, c&rsquo;est avec une grande maturit&eacute; que le management des entreprises a reconnu le r&ocirc;le strat&eacute;gique de la fonction achats, en demandant aux acheteurs d&rsquo;observer la sant&eacute; financi&egrave;re de leurs petits fournisseurs et d&rsquo;&eacute;viter la cascade des faillites&quot;.</font></p>\r\n<p><font face=\"Arial\">Selon le r&eacute;seau Innovativity, 500 livres vendus permettent d\'op&eacute;rer un enfant dans le monde.</font></p>\r\n<p><font face=\"Arial\">Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/10/27/31058/La-renaissance-de-la-fonction-achats-vue-par-Fran-oise-Odolant/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/10/27/31058/La-renaissance-de-la-fonction-achats-vue-par-Fran-oise-Odolant/?xtor=RSS-1</a></font></font><font face=\"Arial\"><br />\r\n</font></p>', '2009-10-27 15:28:47', 1, '', '', 'la-renaissance-de-la-fonction-achats-vue-par-françoise-odolant-publie-le-27-octobre-2009', '<font face=\"Arial\">Le 13 octobre dernier, les membres du r&eacute;seau professionnel Innovativity ont pr&eacute;sent&eacute; un ouvrage collectif intitul&eacute; &quot;La nouvelle renaissance&quot;, dont l\'int&eacute;gralit&eacute; des b&eacute;n&eacute;fices est revers&eacute;e &agrave; l\'association M&eacute;c&eacute;nat Chirurgie Cardiaque Enfants du monde.</font>');
INSERT INTO `actualite` (`id`, `image_id`, `titre`, `description`, `created`, `is_active`, `keywords`, `source`, `slug`, `apercu`) VALUES
(36, 6, 'Un poste de travail revient en moyenne à 19210 euros HT selon l\'Arseg. Publié le 04 novembre 2009', '<p><font face=\"Arial\">Ainsi, en 2009, le co&ucirc;t moyen de l\'immobilier (loyer + assurance) est estim&eacute; &agrave; 5650 euros par poste de travail, auxquels il faut ajouter les frais d&rsquo;exploitation (d&eacute;penses &eacute;nerg&eacute;tiques, maintenance technique du b&acirc;timent&hellip;), les services (accueil, standard, restauration, gestion du courrier&hellip;), les moyens et &eacute;quipements (bureautique, reprographie, t&eacute;l&eacute;phonie&hellip;) et la masse salariale du personnel d&eacute;di&eacute; au fonctionnement de l&rsquo;immeuble.</font></p>\r\n<p><font face=\"Arial\">Les co&ucirc;ts &quot;moyens et &eacute;quipements&quot; (reprographie, t&eacute;l&eacute;phonie, bureautique, fournitures, documentation, flotte automobile et voyages d&rsquo;affaires) repr&eacute;sentent plus de 38% du co&ucirc;t total du poste de travail en 2009, soit 7343 euros par an moyenne. Le budget voyages d&rsquo;affaires p&egrave;se &agrave; lui seul 20% du co&ucirc;t du poste de travail, soit 3816 euros. Le budget flotte de v&eacute;hicules repr&eacute;sente 993 euros par poste, soit 5,2% du co&ucirc;t total d\'un poste de travail.</font></p>\r\n<p><font face=\"Arial\">Autres indicateurs communiqu&eacute;s par l\'Arseg :<br />\r\n<font face=\"Arial\"></font></font></p>\r\n<ul>\r\n    <li><font face=\"Arial\"><font face=\"Arial\">Co&ucirc;t de la consommation d\'&eacute;nergie : 437 euros par poste de travail, 19 euros par m2.</font></font></li>\r\n    <li><font face=\"Arial\"><font face=\"Arial\">Co&ucirc;t total de la s&ucirc;ret&eacute; et de la s&eacute;curit&eacute; : 474 euros par poste de travail, 21 euros par m2.</font></font></li>\r\n    <li><font face=\"Arial\"><font face=\"Arial\">Co&ucirc;t du courrier, des courses et des exp&eacute;ditions : 671 euros par poste de travail, 26 euros par m2.<br />\r\n    Frais de restauration &agrave; la charge de l\'entreprise : 434 euros par poste de travail, 20 euros par m2.</font></font></li>\r\n    <li><font face=\"Arial\"><font face=\"Arial\">Co&ucirc;t des fournitures : 165 euros par poste de travail, 7 euros par m2.</font></font></li>\r\n    <li><font face=\"Arial\"><font face=\"Arial\">Co&ucirc;t du loyer : 5570 euros par poste de travail, 286 euros par m2.</font></font></li>\r\n</ul>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/11/03/31188/Un-poste-de-travail-revient-en-moyenne-a-19210-euros-HT-selon-l-Arseg/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/11/03/31188/Un-poste-de-travail-revient-en-moyenne-a-19210-euros-HT-selon-l-Arseg/?xtor=RSS-1</a></font></p>', '2009-11-04 09:56:07', 1, '', '', 'un-poste-de-travail-revient-en-moyenne-a-19210-euros-ht-selon-larseg-publie-le-04-novembre-2009', '<p><font face=\"Arial\">Le co&ucirc;t moyen d\'un poste de travail dans les entreprises revient &agrave; 19210 euros HT.</font></p>\r\n<p><font face=\"Arial\">C\'est ce qui ressort de l\'agr&eacute;gation des Buzzy Ratios 2009 de l\'Arseg (Association des directeurs et des responsables des services g&eacute;n&eacute;raux, NDLR), 123 indicateurs sur les achats g&eacute;n&eacute;raux dans les entreprises.</font></p>'),
(37, 6, 'Veolia Environnement intensifie son plan de réduction des coûts. Publié le 09 novembre 2009', '<p><font face=\"Arial\">Le groupe de services n\'a toutefois pas pr&eacute;cis&eacute; le d&eacute;tail des mesures envisag&eacute;es.</font></p>\r\n<p><font face=\"Arial\">Sur les neufs premiers de l\'ann&eacute;e, Veolia Environnement a r&eacute;alis&eacute; un chiffre d\'affaires de 25,3 milliards d\'euros, en baisse de 2,8%.</font></p>\r\n<p><font face=\"Arial\">Le volume d\'achats annuel de Veolia Environnement est estim&eacute; &agrave; 14 milliards d\'euros.</font></p>\r\n<p><font face=\"Arial\">Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/11/09/31237/Veolia-Environnement-intensifie-son-plan-de-reduction-des-couts/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/11/09/31237/Veolia-Environnement-intensifie-son-plan-de-reduction-des-couts/?xtor=RSS-1</a></font></font><font face=\"Arial\"><br />\r\n</font></p>', '2009-11-09 11:23:10', 1, '', '', 'veolia-environnement-intensifie-son-plan-de-reduction-des-coûts-publie-le-09-novembre-2009', '<p><font face=\"Arial\">Les objectifs de son plan de r&eacute;duction des co&ucirc;ts, baptis&eacute; Efficacit&eacute; 2010, ayant d&eacute;j&agrave; &eacute;t&eacute; atteints au 30 septembre dernier, </font></p>\r\n<p><font face=\"Arial\">soit 180 millions d\'euros, Veolia Environnement a d&eacute;cid&eacute; de porter ce montant &agrave; 220 millions d\'euros d\'ici &agrave; la fin de l\'ann&eacute;e.</font></p>'),
(38, 6, 'Légère hausse du parc en LLD. Publié le 09 novembre 2009.', '<p><font face=\"Arial\">La location de longue dur&eacute;e (LLD)&nbsp; a enregistr&eacute; au cours du troisi&egrave;me trimestre de 2009 une l&eacute;g&egrave;re hausse de 0,21% de son parc total, selon le Syndicat national des loueurs de v&eacute;hicules en longue dur&eacute;e (SNLVLD). Depuis le d&eacute;but de l\'ann&eacute;e, cette croissance s\'&eacute;tablit &agrave; 0,1% et, en un an, le parc a grimp&eacute; de 1,18%. N&eacute;anmoins, la hausse se tasse de trimestres en trimestres : d&eacute;but 2009, elle &eacute;tait de 5,35% et, en milieu d\'ann&eacute;e, &agrave; 2,78%. Par ailleurs, Renault reste le constructeur pr&eacute;f&eacute;r&eacute; des flottes : la citadine Clio prend la t&ecirc;te des v&eacute;hicules les plus demand&eacute;s, devant la compacte M&eacute;gane et le monospace compact Sc&eacute;nic. La Volkswagen lf, 9e au classement, reste la seule &eacute;trang&egrave;re du top 10.</font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/11/09/31235/Legere-hausse-du-parc-en-LLD/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/11/09/31235/Legere-hausse-du-parc-en-LLD/?xtor=RSS-1</a></font></p>', '2009-11-09 11:26:42', 1, '', '', 'legere-hausse-du-parc-en-lld-publie-le-09-novembre-2009', '<font face=\"Arial\">Le troisi&egrave;me trimestre 2009 a enregistr&eacute; une hausse de 0,21% du parc en location de longue dur&eacute;e. Sur les 12 derniers mois, cette croissance s&rsquo;&eacute;tablit &agrave; 1,18%.</font>'),
(39, 14, 'FirstRand : Disséquer les dépenses pour optimiser les achats. Publié le 10 novembre 2009', '<p><font face=\"Arial\">FirstRand, qui a r&eacute;alis&eacute; 3,4 milliards d&rsquo;euros de chiffre d&rsquo;affaires sur l&rsquo;exercice 2009 et emploie 42 800 personnes, recherchait une solution lui permettant d&rsquo;abord de conna&icirc;tre pr&eacute;cis&eacute;ment la r&eacute;partition de ses achats entre ses diff&eacute;rentes filiales et divisions. Achats qui, au total, avoisinent 1,1 milliard de dollars (700 millions d&rsquo;euros) chaque ann&eacute;e. Le groupe attendait aussi de l&rsquo;outil qu&rsquo;il l&rsquo;aide &agrave; analyser les donn&eacute;es pour d&eacute;finir les axes de travail &agrave; suivre par ses &eacute;quipes achats, et &agrave; fixer des objectifs r&eacute;alisables.<br />\r\nEn plus de son progiciel d&rsquo;analyse des d&eacute;penses, Zycus apportera son exp&eacute;rience pour accompagner FirstRand dans la mise en place de la politique d&rsquo;&eacute;conomies qui aura &eacute;t&eacute; d&eacute;cid&eacute;e. Cela, aussi bien sur le plan de l&rsquo;organisation que des processus d&rsquo;achat.</font></p>\r\n<p><font face=\"Arial\">Source: <font face=\"Arial\"><a href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/41/C2/document_article_web.phtml?IdTis=XTC-BPA-V4D72-DD-OE8XA-F3G9\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/41/C2/document_article_web.phtml?IdTis=XTC-BPA-V4D72-DD-OE8XA-F3G9</a></font></font><font face=\"Arial\"><br />\r\n</font></p>', '2009-11-10 08:42:56', 1, '', '', 'firstrand-dissequer-les-depenses-pour-optimiser-les-achats-publie-le-10-novembre-2009', '<font face=\"Arial\">Pour am&eacute;liorer la visibilit&eacute; sur ses d&eacute;penses et identifier des pistes d&rsquo;&eacute;conomies, le groupe financier sud-africain vient de retenir la solution d&rsquo;analyse de l&rsquo;&eacute;diteur indien Zycus.</font>'),
(40, 6, 'PSA table sur plus de 1,8 milliard d\'euros de réduction de coûts entre 2010 et 2012. Publié le 12 septembre 2009', '<p><font face=\"Arial\">Ces r&eacute;ductions de co&ucirc;ts se traduiront notamment par une augmentation du taux d\'utilisation des capacit&eacute;s de production (ce taux &eacute;tait de 81% en 2008), par une am&eacute;lioration de 20% de la productivit&eacute; industrielle et de la productivit&eacute;, encore par la r&eacute;alisation de 400 millions d\'euros d\'&eacute;conomies sur les frais g&eacute;n&eacute;raux de l\'entreprise.</font></p>\r\n<p><font face=\"Arial\">&quot;Notre effort accru de productivit&eacute; et d&rsquo;am&eacute;lioration de la performance nous permettra de rattraper notre retard en termes de rentabilit&eacute; et de retrouver la croissance. Avec l&rsquo;am&eacute;lioration significative de la situation financi&egrave;re du Groupe au second semestre 2009, ce plan nous donne les marges de man&oelig;uvre n&eacute;cessaires pour r&eacute;aliser nos ambitions&quot;, a notamment d&eacute;clar&eacute; Philippe Varin, le pr&eacute;sident du directoire du groupe PSA Peugeot Citro&euml;n.</font></p>\r\n<p><font face=\"Arial\">Ce Plan de performance pour la p&eacute;riode 2010-2012 pr&eacute;voit &eacute;galement une am&eacute;lioration de la dynamique commerciale de l\'entreprise (pr&eacute;sence plus forte dans le B to B, nouvelle identit&eacute; pour Peugeot en janvier 2010, enrichissement de l\'offre de services aux clients, augmentation de la p&eacute;n&eacute;tration du groupe en Chine, en Am&eacute;rique latine et en Russie, etc.).</font></p>\r\n<p><font face=\"Arial\">&quot;Nous faisons face &agrave; une nouvelle donne de l&rsquo;industrie automobile : croissance acc&eacute;l&eacute;r&eacute;e des march&eacute;s asiatiques, vieillissement dans les pays d&eacute;velopp&eacute;s, urbanisation croissante, pr&eacute;occupation environnementale de plus en plus forte. Pour r&eacute;pondre &agrave; ces nouvelles tendances, PSA Peugeot Citro&euml;n s&rsquo;est fix&eacute; trois ambitions : devenir un groupe plus global, avec un coup d&rsquo;avance en mati&egrave;re de produits et services, tout en &eacute;tant une r&eacute;f&eacute;rence en efficacit&eacute; op&eacute;rationnelle, ces trois ambitions s&rsquo;appuyant sur une culture du d&eacute;veloppement responsable&quot;, conclut Philippe Varin.</font></p>\r\n<p>Source: <font face=\"Arial\"><a href=\"http://www.decision-achats.fr/xml/Breves/2009/11/12/31294/PSA-table-sur-plus-de-1-8-milliard-d-euros-de-reduction-de-couts-entre-2010-et-2012/?xtor=RSS-1\">http://www.decision-achats.fr/xml/Breves/2009/11/12/31294/PSA-table-sur-plus-de-1-8-milliard-d-euros-de-reduction-de-couts-entre-2010-et-2012/?xtor=RSS-1</a></font></p>', '2009-11-12 18:26:09', 1, '', '', 'psa-table-sur-plus-de-18-milliard-deuros-de-reduction-de-coûts-entre-2010-et-2012-publie-le-12-septembre-2009', '<font face=\"Arial\">Dans son nouveau Plan de performance pour la p&eacute;riode 2010-2012, PSA Peugeot Citro&euml;n table sur 1,815 milliard d\'euros de r&eacute;duction de co&ucirc;ts.</font>'),
(41, 6, 'Canon rachète Océ pour 730 miilions d\'euros. Publié le 16 novembre 2009', '<p _counted=\"undefined\">La firme&nbsp; japonaise Canon a annonc&eacute; ce jour le lancement d\'une offre publique d\'achat (OPA) sur le constructeur n&eacute;erlandais Oc&eacute; pour 730 millions d\'euros.</p>\r\n<p _counted=\"undefined\">Selon Canon, ce rachat, qui a &eacute;t&eacute; accept&eacute; ce jour par Oc&eacute;, a pour objectif de faire de Canon le num&eacute;ro un mondial notamment dans le domaine de l\'impression.&nbsp;</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/xml/Breves/2009/11/16/31320/Canon-rachete-Oce-pour-730-miilions-d-euros/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/xml/Breves/2009/11/16/31320/Canon-rachete-Oce-pour-730-miilions-d-euros/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2009-11-16 15:11:36', 1, '', '', 'canon-rachete-oce-pour-730-miilions-deuros-publie-le-16-novembre-2009', '<div>Canon a annonc&eacute; ce jour le lancement d&rsquo;une offre publique d&rsquo;achat (OPA) sur le constructeur Oc&eacute; pour 730 millions d&rsquo;euros.</div>'),
(42, 6, 'Objectif : réduction des coûts indirects. Publié le 30 novembre 2009.', '<p><font face=\"Arial\">La relation entre les entreprises et fournisseurs est un des &eacute;l&eacute;ments-cl&eacute; dans l\'optique de la r&eacute;duction des co&ucirc;ts, selon les derniers r&eacute;sultats du rapport de recherche Cost of Control*, r&eacute;alis&eacute; par la soci&eacute;t&eacute; de recherche ind&eacute;pendante Loudhouse en octobre 2009, pour le compte de Basware, sp&eacute;cialiste de l&rsquo;optimisation des process achats et de l\'&eacute;cole de commerce IESE de Barcelone. &laquo; Les grandes entreprises cherchent notamment &agrave; mieux g&eacute;rer leur risque fournisseurs en s&rsquo;assurant de la stabilit&eacute; &eacute;conomique de ces derniers &raquo;, analyse Bertrand Aumoite, directeur g&eacute;n&eacute;ral de Basware.</font></p>\r\n<font face=\"Arial\">\r\n<p>Plus encore, selon l&rsquo;&eacute;tude, la ma&icirc;trise des co&ucirc;ts pourrait m&ecirc;me devenir &laquo; la nouvelle norme &raquo; pour 2010. &laquo; En effet, cette enqu&ecirc;te montre que les entreprises, frapp&eacute;es par la crise, font d&eacute;sormais de l&rsquo;optimisation des co&ucirc;ts indirects leur nouveau cheval de bataille &raquo;, souligne Bertrand Aumoite.</p>\r\n<p>Un manque de collaboration entre les finances et les achats</p>\r\n<p>Ceci &eacute;tant, l\'analyse d&eacute;montre que dans un contexte de r&eacute;cession, les relations entre les d&eacute;partements de la finance et des achats seraient de plus en plus tendus. &laquo; Un manque de collaboration subsiste entre les deux fonctions, bien que les directeurs financiers comme les directeurs achats s&rsquo;accordent &agrave; penser qu\'une meilleure relation entre eux rendrait plus efficaces les plans de r&eacute;duction de co&ucirc;ts &raquo;, rench&eacute;rit le directeur g&eacute;n&eacute;ral.</p>\r\n<p>Enfin, dernier enseignement qui ressort de l&rsquo;&eacute;tude : les actions men&eacute;es par les achats pourraient avoir plus d&rsquo;impact sur la rentabilit&eacute; de l&rsquo;entreprise si des hauts niveaux d\'automatisation et d\'int&eacute;gration des processus financiers &eacute;taient mis en place.</p>\r\n<p>*Cette &eacute;tude a &eacute;t&eacute; r&eacute;alis&eacute;e aupr&egrave;s d\'un panel d&rsquo;une vingtaine de grandes entreprises du monde entier, tous les r&eacute;pondants occupant des postes de directeur des finances, directeur des acquisitions, ou poste de niveau &eacute;quivalent.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/xml/Breves/2009/11/30/31507/Objectif-reduction-des-couts-indirects/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/xml/Breves/2009/11/30/31507/Objectif-reduction-des-couts-indirects/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font><br />\r\n</p>\r\n</font>', '2009-11-30 11:25:17', 1, '', '', 'objectif-reduction-des-coûts-indirects-publie-le-30-novembre-2009', '<font face=\"Arial\">Une &eacute;tude mondiale, r&eacute;alis&eacute;e en octobre 2009, identifie le contr&ocirc;le et la r&eacute;duction des co&ucirc;ts comme &laquo; la nouvelle norme&raquo;.</font>'),
(43, 6, 'Une solution pour diminuer et recycler ses déchets. publié le 01 Décembre 2009', '<p><font face=\"Arial\">Afin de valoriser les 75 tonnes de d&eacute;chets alimentaires du si&egrave;ge de Bouygues Construction, qui repr&eacute;sentent 30 tonnes de CO2 par an, Challenger Services, marque d&rsquo;Exprimm sp&eacute;cialis&eacute;e dans le facility management, a mis en place un &quot;digesteur&quot;. Cet appareil prend la forme d&rsquo;une cuve et utilise un proc&eacute;d&eacute; de fermentation acc&eacute;l&eacute;r&eacute; qui ne produit pas de m&eacute;thane. Ce syst&egrave;me est capable de traiter 200 kg de nourriture par jour. En 24 heures, 100 kg de d&eacute;chets sont transform&eacute;s en 3 kg de poudre &agrave; compost.</font></p>\r\n<p><font face=\"Arial\">Les points forts de ce proc&eacute;d&eacute; : recyclage des d&eacute;chets alimentaires &agrave; la source, &eacute;limination des r&eacute;sidus en 3 &agrave; 24 heures et transformation des d&eacute;chets en engrais biologique. Plus avantageux encore, ce syst&egrave;me, simple &agrave; mettre en place, &eacute;vite l&rsquo;adjonction d\'eau. Il ne rejette aucun liquide ou &eacute;mission de gaz nocifs et ne d&eacute;gage pas d&rsquo;odeur d&eacute;sagr&eacute;able. Au final, il permet de r&eacute;duire les d&eacute;chets de 97 %.</font></p>\r\n<p><font face=\"Arial\">Rappelons que cette solution innovante a retenu l\'attention de l\'Arseg (Association des responsables des services g&eacute;n&eacute;raux) qui lui a d&eacute;cern&eacute; une mention dans la cat&eacute;rie &quot;Services g&eacute;n&eacute;raux et d&eacute;veloppement durable&quot; lors des Troph&eacute;es 2008 de l\'association.</font></p>', '2009-12-01 09:57:44', 1, '', '', 'une-solution-pour-diminuer-et-recycler-ses-dechets-publie-le-01-decembre-2009', '<font color=\"#0000ff\" face=\"Arial\"><u>Au sein du restaurant d&rsquo;entreprise du si&egrave;ge social de Bouygues Construction, Challenger Services, marque d&rsquo;Exprimm, transforme les d&eacute;chets alimentaires en poudre &agrave; compost.</u></font>'),
(44, 6, 'Motiver ses équipes achats. Publié le 02 Décembre 2009.', '<p><font face=\"Arial\">Dans le langage courant, la performance se d&eacute;finit comme un excellent r&eacute;sultat voire un exploit. Dans le langage manag&eacute;rial, elle recouvre la r&eacute;alisation d\'un ou plusieurs objectifs, pr&eacute;d&eacute;finis, r&eacute;alistes et partag&eacute;s entre le manager et son collaborateur. La mesure de la performance achats, sous- entendu celle des acheteurs, a toujours g&eacute;n&eacute;r&eacute; beaucoup de litt&eacute;rature. Dans leur livre intitul&eacute; Fonction: Acheteur (Ed. Dunod), Brigitte de Faultrier et Fran&ccedil;oise Roussieu listent par exemple les questions que les organisations et leurs responsables se posent souvent. Que mesure-t-on r&eacute;ellement? Mesure-t-on ce qui doit l\'&ecirc;tre? Evalue-t-on la performance des achats ou celle des acheteurs? Selon les auteurs, &laquo;la notion de r&eacute;sultat en achats est complexe. Le bon r&eacute;sultat pourrait s\'apparenter &agrave; l\'obtention d\'un meilleur prix, d\'un budget respect&eacute;, voire am&eacute;lior&eacute;. Mais n\'est-il pas totalement r&eacute;ducteur d\'aborder l\'&eacute;valuation de l\'acheteur uniquement au travers d\'une meilleure n&eacute;ciation ou d\'un meilleur service?&raquo; </font></p>\r\n<p><font face=\"Arial\"><font face=\"Arial\">Pour les experts de la fonction, la performance d\'un acheteur ne peut se r&eacute;sumer en effet aux &eacute;conomies r&eacute;alis&eacute;es. Au contraire. Quid de la qualit&eacute;, de l\'innovation, de la recherche de partenariat avec des fournisseurs-cl&eacute;s, des achats durables, etc.? Mais pour beaucoup d\'organisations achats, mesurer la performance sur des crit&egrave;res qualitatifs, et plus uniquement quantitatifs, devient compliqu&eacute;. De plus, la crise est-elle le meilleur moment pour &eacute;laborer un syst&egrave;me de mesure de la performance des acheteurs? Dans les autres fonctions de l\'entreprise, certains collaborateurs se d&eacute;clarent d&eacute;motiv&eacute;s, compliquant le travail des managers. Au sein de la fonction achats, c\'est semble-t-il le contraire. Les difficult&eacute;s sur la plupart des march&eacute;s renforcent le r&ocirc;le des acheteurs dans les organisations et les encouragent &agrave; devenir plus performants. Une bonne occasion pour mesurer le travail fourni et, pourquoi pas, mettre en place un syst&egrave;me de r&eacute;mun&eacute;ration variable bas&eacute; sur l\'atteinte des objectifs.</font></font></p>\r\n<p><font face=\"Arial\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Magazines/ConsultArticle.asp?xtor=RSS-7&amp;ID_Article=34505\">http://www.decision-achats.fr/Magazines/ConsultArticle.asp?xtor=RSS-7&amp;ID_Article=34505</a></font></font><font face=\"Arial\"><br />\r\n</font></p>', '2009-12-02 14:46:33', 1, '', '', 'motiver-ses-equipes-achats-publie-le-02-decembre-2009', '<font color=\"#0000ff\" face=\"Arial\"><u>Alors que le r&ocirc;le des acheteurs se renforce pendant la crise, la mesure de leur performance s\'ouvre aux crit&egrave;res qualitatifs. Pour les motiver, les directions achats adoptent peu &agrave; peu des m&eacute;thodes issues d\'autres fonctions, &agrave; commencer par l\'introduction d\'une part variable dans les r&eacute;mun&eacute;rations.</u></font>'),
(45, 14, 'Ferraz Shawmut : Acheter au plus près de la production. Publié le 08 décembre 2009', '<p><font face=\"Arial\">Sur les 55 millions d&rsquo;euros d&rsquo;achats de Ferraz Shawmut en Europe, la Tunisie repr&eacute;sente d&eacute;sormais un montant d&rsquo;environ 3 millions d&rsquo;euros et la Hongrie de 5 millions. Pour la premi&egrave;re, il s&rsquo;agit d&rsquo;une augmentation de 10 % par rapport &agrave; 2008 ; pour la seconde, le chiffre est beaucoup plus &eacute;lev&eacute;, avec en 2008 un montant des achats quasi nul.<br />\r\n&laquo; Notre premier axe de travail est d&rsquo;avoir une approche globale de la supply chain, prenant en compte le cash mobilis&eacute;, les stocks ou encore les d&eacute;lais de mise &agrave; disposition des mati&egrave;res &raquo;, analyse Christophe Ravaz, directeur des achats Europe en poste depuis un an. Cette approche a n&eacute;cessit&eacute; de pousser la collaboration avec la logistique, le contr&ocirc;le de gestion et la finance sans oublier les &eacute;quipes locales. Un relais supply chain a &eacute;t&eacute; d&eacute;sign&eacute; au sein des achats, pour participer aux r&eacute;unions &agrave; caract&egrave;re industriel ou commercial. Il indique aux fournisseurs les grands changements d&rsquo;orientation.<br />\r\nCette politique de recentrage sur des fournisseurs capables d&rsquo;accompagner Ferraz Shawmut dans sa strat&eacute;gie internationale s&rsquo;accompagne du lancement de projets de redesign to cost et d&rsquo;un accent mis sur la qualit&eacute;. Un r&eacute;f&eacute;rent qualit&eacute; a aussi &eacute;t&eacute; nomm&eacute; parmi les acheteurs. En parall&egrave;le, le panel fournisseurs a &eacute;t&eacute; r&eacute;duit de 25 % entre 2008 et 2010 (de 400 &agrave; moins de 300).<br />\r\nSource: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/42/48/document_article_web.phtml?IdTis=XTC-BPA-YP00X-DD-OB1C8-FBPM\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/42/48/document_article_web.phtml?IdTis=XTC-BPA-YP00X-DD-OB1C8-FBPM</a></font></font></p>', '2009-12-08 13:38:45', 1, '', '', 'ferraz-shawmut-acheter-au-plus-pres-de-la-production-publie-le-08-decembre-2009', '<font color=\"#0000ff\" face=\"Arial\"><u>Cette division de Carbone Lorraine, sp&eacute;cialis&eacute;e dans les &eacute;quipements de protection &eacute;lectrique, orchestre la mont&eacute;e en puissance du sourcing en Tunisie et en Hongrie, &agrave; proximit&eacute; de sites de production du groupe.</u></font>'),
(46, 6, 'Achats : Réduction des coûts. Les opérateurs de téléphonie mobile misent sur la réduction des coûts. Publié le 10 Décembre 2009', '<p><font face=\"Arial\"><strong>Marge op&eacute;rationnelle &agrave; 33 %</strong></font></p>\r\n<p><font face=\"Arial\">Selon l&rsquo;&eacute;tude, la r&eacute;duction des co&ucirc;ts a permis de pr&eacute;server la rentabilit&eacute; des acteurs, avec une marge op&eacute;rationnelle stable, &agrave; 33 % du chiffre d\'affaires. &quot;Des r&eacute;ductions de co&ucirc;ts suppl&eacute;mentaires ont &eacute;t&eacute; op&eacute;r&eacute;es en diminuant les co&ucirc;ts structurels, en rationalisant la gamme de t&eacute;l&eacute;phones mobiles et leurs subventions, et en baissant les d&eacute;penses marketing et de publicit&eacute;&quot;, note Wireless Intelligence. Ce qui a permis de d&eacute;gager un niveau de liquidit&eacute;s (cash flow) de 22 % du chiffre d\'affaires, contre 20 % un an plus t&ocirc;t.</font></p>\r\n<p><font face=\"Arial\"><strong>Baisse des revenus de 4,3 %</strong></font></p>\r\n<p><font face=\"Arial\">Selon Wireless Intelligence, l\'industrie europ&eacute;enne du mobile est la plus fortement touch&eacute;e par la crise, l\'institut pr&eacute;disant une baisse des revenus de 4,3% en 2009, &agrave; 36,5 milliards d\'euros.En Grande-Bretagne, en Espagne, au Portugal, en Irlande, en Gr&egrave;ce et en Autriche, le recul sera de 5 % tandis qu\'en Pologne et en R&eacute;publique tch&egrave;que, les op&eacute;rateurs mobiles conna&icirc;tront une baisse de leurs revenus sup&eacute;rieure &agrave; 10 %. En comparaison, les op&eacute;rateurs am&eacute;ricains et canadiens sont plus r&eacute;sistants, avec des chiffres d\'affaires attendus en hausse de 4,3 % &agrave; 135 milliards d\'euros.</font></p>\r\n<p><font face=\"Arial\">Rappelons que les revenus des op&eacute;rateurs mobiles de l\'OCDE devraient avoisiner les 408 milliards d\'euros sur l\'ensemble de l\'ann&eacute;e 2009, contre 411 milliards en 2008.</font></p>\r\n<p><font face=\"Arial\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/xml/Breves/2009/12/09/31647/Les-operateurs-de-telephonie-mobile-misent-sur-la-reduction-des-couts/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/xml/Breves/2009/12/09/31647/Les-operateurs-de-telephonie-mobile-misent-sur-la-reduction-des-couts/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></font><font face=\"Arial\"><br />\r\n</font></p>', '2009-12-10 09:36:58', 1, '', '', 'achats-reduction-des-coûts-les-operateurs-de-telephonie-mobile-misent-sur-la-reduction-des-coûts-publie-le-10-decembre-2009', '<font color=\"#000000\" face=\"Arial\">Pour surmonter la crise &eacute;conomique, les op&eacute;rateurs de t&eacute;l&eacute;phonie mobile des pays de l\'OCDE ont baiss&eacute; leurs d&eacute;penses op&eacute;rationnelles durant ces douze derniers mois, selon une r&eacute;cente &eacute;tude de l\'institut am&eacute;ricain Wireless Intelligence. Au troisi&egrave;me trimestre 2009, les d&eacute;penses op&eacute;rationnelles (Opex) repr&eacute;sentaient en moyenne 60 % du chiffre d\'affaires des op&eacute;rateurs des 30 pays de l\'OCDE, contre 63 % un an plus t&ocirc;t.</font>'),
(47, 6, 'Les achats du groupe Accor directement rattachés au p-dg de l\'entreprise. Publié le 16 Décembre 2009', '<p _counted=\"undefined\">Jusqu\'&agrave; pr&eacute;sent, les achats d&eacute;pendaient de <strong _counted=\"undefined\">Jacques Stern</strong>, directeur g&eacute;n&eacute;ral d&eacute;l&eacute;gu&eacute; du groupe, ce dernier &eacute;tant pressenti pour diriger la future entit&eacute; en charge des services pr&eacute;pay&eacute;s.</p>\r\n<p _counted=\"undefined\">&nbsp;Le volume d\'achats du groupe Accor est estim&eacute; &agrave; 3,4 milliards d\'euros, avec <strong _counted=\"undefined\">Isabelle Lauzon</strong> &agrave; la t&ecirc;te de la direction achats.</p>\r\n<p _counted=\"undefined\">&nbsp;Depuis le d&eacute;but de l\'ann&eacute;e, le groupe Accor a mis en place toute <strong _counted=\"undefined\"><a target=\"_blank\" _counted=\"undefined\" href=\"http://www.decision-achats.fr/xml/Breves/2009/05/13/29410/Le-groupe-Accor-detaille-ses-mesures-d-economies/?iPageNum=1&amp;TrierPar=0_DESC&amp;RechAvance=&amp;FldRech=Accor&amp;RadioExpression=&amp;RadioTitreArticle=&amp;DateDebMois=&amp;DateDebAnnee=&amp;DateFinMois=&amp;DateFinAnnee=&amp;ListeMag=ACTU&amp;ListeMag=DA\">une s&eacute;rie de mesures</a></strong> pour r&eacute;duire ses co&ucirc;ts. Ce dernier entend ainsi r&eacute;aliser&nbsp;150 millions d\'euros d\'&eacute;conomies en 2009 sur les co&ucirc;ts fixes de ses &eacute;tablissements. Ces r&eacute;ductions de co&ucirc;ts op&eacute;rationnels passent par une optimisation des structures d\'exploitation, une r&eacute;vision de la politique d\'achats et par une adaptation de l\'offre de services &agrave; l\'occupation des h&ocirc;tels.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\"\r\nhref=\"http://www.decision-achats.fr/xml/Breves/2009/12/16/31695/Les-achats-du-groupe-Accor-directement-rattaches-au-p-dg-de-l-entreprise/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/xml/Breves/2009/12/16/31695/Les-achats-du-groupe-Accor-directement-rattaches-au-p-dg-de-l-entreprise/?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2009-12-16 11:06:53', 1, '', '', 'les-achats-du-groupe-accor-directement-rattaches-au-p-dg-de-lentreprise-publie-le-16-decembre-2009', '<strong _counted=\"undefined\">Gilles P&eacute;lisson</strong>, le p-dg du <strong _counted=\"undefined\">groupe Accor</strong>, reprend sous son aile les achats de l\'entreprise. Cette d&eacute;cision intervient alors que le groupe envisage de s&eacute;parer ses deux grands m&eacute;tiers, &agrave; savoir l\'h&ocirc;tellerie d\'une part, et les services pr&eacute;pay&eacute;s d\'autre part.'),
(49, 6, 'Le directeur achats de Renault intègre le comité de direction du groupe. Publié le 30 Décembre 2009', '<p _counted=\"undefined\">RNPO est la filiale commune aux deux constructeurs d&eacute;di&eacute;e aux achats. Depuis avril 2009, cette derni&egrave;re couvre 100% des achats de l\'alliance, soit pr&egrave;s de 60 milliards d\'euros.</p>\r\n<p _counted=\"undefined\">Christian Vandenhende, 48 ans, est ing&eacute;nieur, dipl&ocirc;m&eacute; de l&rsquo;universit&eacute; catholique de Louvain (Belgique). Il a d&eacute;but&eacute; sa carri&egrave;re en tant que chercheur dans cette m&ecirc;me facult&eacute;, puis est entr&eacute; en 1985 dans le groupe Saint bain. Il a rejoint en 1989 le groupe Valeo comme ing&eacute;nieur produit/process, puis occup&eacute; diff&eacute;rents postes dans la fonction achats avant d&rsquo;&ecirc;tre nomm&eacute;, en 1996, directeur achats de la division embrayages &agrave; Amiens.</p>\r\n<p _counted=\"undefined\">Christian Vandenhende est entr&eacute; chez Renault en 1999, comme chef de service analyse performance fournisseurs, puis a &eacute;t&eacute; nomm&eacute; directeur des prix de revient en 2003. En 2005, il pilote l\'&eacute;quipe transverse &ldquo;int&eacute;gration locale comp&eacute;titive et sourcing global&rdquo;. En mars 2008, Christian Vandenhende est nomm&eacute; directeur Renault-Nissan Purchasing Organization ch&acirc;ssis. Il est pr&eacute;sident de RNPO depuis mars 2009.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr///Breves/Le-directeur-achats-de-Renault-integre-le-comite-de-direction-du-groupe-31737.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr///Breves/Le-directeur-achats-de-Renault-integre-le-comite-de-direction-du-groupe-31737.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2009-12-30 09:43:20', 1, '', '', 'le-directeur-achats-de-renault-integre-le-comite-de-direction-du-groupe-publie-le-30-decembre-2009', '&Agrave; compter du 4 janvier 2010, <strong _counted=\"undefined\">Christian Vandenhende</strong>, le pr&eacute;sident de <strong _counted=\"undefined\">RNPO</strong> (Renault Nissan Purchasing Organization), int&egrave;grera le comit&eacute; de direction de Renault.'),
(50, 6, 'Prestations d\'avocats : les acheteurs cherchent encore à s\'imposer. Publié le 07 Janvier 2010', '<p _counted=\"undefined\"><strong _counted=\"undefined\">89 % des directeurs juridiques</strong> pensent que les services achats ne devraient pas jouer un r&ocirc;le plus grand dans le <strong _counted=\"undefined\">processus de s&eacute;lection des avocats</strong>.</p>\r\n<p _counted=\"undefined\">Tel est le r&eacute;sultat d&rsquo;une &eacute;tude* r&eacute;alis&eacute;e par <strong _counted=\"undefined\">Equiteam</strong>, cabinet de conseil en recrutement, et Profit &amp; Law, cabinet de conseil en management.De m&ecirc;me, seulement 6 % des sond&eacute;s voient la pression des acheteurs comme un sujet de pr&eacute;occupation, signe de l&rsquo;absence de synergie entre les deux fonctions.</p>\r\n<p _counted=\"undefined\">Mais pourquoi une telle mise &agrave; distance des services achats ? &quot;La qualit&eacute; de la relation entre un directeur juridique et un avocat repose notamment sur leur personnalit&eacute;, leur qualit&eacute; d&rsquo;&eacute;coute ou encore leur niveau d&rsquo;expertise, explique Xavier Linel, consultant chez Equiteam. Il s&rsquo;agit donc d&rsquo;une relation de proximit&eacute; et de confiance dans laquelle l&rsquo;acheteur ne parvient pas toujours &agrave; trouver sa place&quot;. Et d&rsquo;ajouter : &quot;Si les services achats imposent traditionnellement leurs comp&eacute;tences lors de la n&eacute;ciation de prestations physiques, ils n&rsquo;ont pas toujours la marge de man&oelig;uvre ou les connaissances n&eacute;cessaires pour n&eacute;cier l&rsquo;achat de prestations intellectuelles telles que les services juridiques&quot;.</p>\r\n<p _counted=\"undefined\"><strong _counted=\"undefined\">Des budgets juridiques en baisse</strong></p>\r\n<p _counted=\"undefined\">Pourtant, l&rsquo;&eacute;tude rappelle qu&rsquo;en p&eacute;riode de crise, la <strong _counted=\"undefined\">ma&icirc;trise des co&ucirc;ts</strong>, grande sp&eacute;cialit&eacute; des services achats, a constitu&eacute; la <strong _counted=\"undefined\">priorit&eacute; num&eacute;ro un des directions juridiques</strong>. En effet, pr&egrave;s de la moiti&eacute; des entreprises interrog&eacute;es ont vu leur budget juridique baisser en 2009, les r&eacute;ductions ayant port&eacute; tr&egrave;s majoritairement sur les honoraires des avocats (80 %) et les frais de d&eacute;placement des juristes (77 %).</p>\r\n<p _counted=\"undefined\">Par ailleurs, parmi les m&eacute;thodes envisag&eacute;es par les directeurs juridiques pour ma&icirc;triser les honoraires, le r&eacute;f&eacute;rencement des cabinets d&rsquo;avocats caracole en t&ecirc;te. La preuve : 74 % des sond&eacute;s comptent miser jusqu&rsquo;&agrave; fin 2010 sur la constitution d&rsquo;un panel de cabinets d&rsquo;avocats pour r&eacute;duire les co&ucirc;ts. Une action qui fait pourtant partie int&eacute;grante du domaine d&rsquo;expertise des achats.</p>\r\n<p _counted=\"undefined\">&nbsp;Alors pourquoi ces derniers semblent encore exclus du process de s&eacute;lection des cabinets ? &quot;Nombre de directions juridiques pensent qu&rsquo;elles peuvent s&eacute;lectionner leurs avocats sans l&rsquo;aide des services achats, consid&eacute;r&eacute;s comme peu l&eacute;gitimes pour choisir les prestataires &agrave; leur place. Ceci &eacute;tant, lorsque le top management de l&rsquo;entreprise souhaite faire intervenir les achats dans le processus de r&eacute;f&eacute;rencement, les directions juridiques s&rsquo;accordent &agrave; favoriser une vraie relation de partenariat et de coop&eacute;ration avec les acheteurs&quot;. Un travail main dans la main qui permettra d&rsquo;optimiser les co&ucirc;ts de fa&ccedil;on plus constructive.</p>\r\n<p _counted=\"undefined\">Pour aller plus loin, retrouvez l\' <a target=\"_blank\" _counted=\"undefined\" href=\"http://www.decision-achats.fr/Decision-Achats/Article/-Les-cabinets-d-avocats-sont-des-prestataires-comme-les-autres--30363-1.htm?iPageNum=1&amp;TrierPar=0_DESC&amp;RechAvance=&amp;FldRech=Soci%E9t%E9+G%E9n%E9rale&amp;RadioExpression=&amp;RadioTitreArticle=&amp;DateDebMois=&amp;DateDebAnnee=&amp;DateFinMois=&amp;DateFinAnnee=&amp;ListeMag=ACTU&amp;ListeMag=DA\">interview d\'Andr&eacute; S&eacute;paniak</a>, directeur achats de la Soci&eacute;t&eacute; G&eacute;n&eacute;rale, sur l\'achat de prestations d\'avocats.</p>\r\n<p _counted=\"undefined\">*Cette enqu&ecirc;te a &eacute;t&eacute; r&eacute;alis&eacute;e en septembre 2009 aupr&egrave;s de plus de 300 directeurs juridiques (&agrave; partir d&rsquo;un taux de r&eacute;ponses de 26 %).</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Article-A-La-Une/Prestations-d-avocats-les-acheteurs-cherchent-encore-a-s-imposer-1261.htm?XType=XTM&amp;xtor=EPR-3\">http://www.decision-achats.fr/Article-A-La-Une/Prestations-d-avocats-les-acheteurs-cherchent-encore-a-s-imposer-1261.htm?XType=XTM&amp;xtor=EPR-3</a></font></p>\r\n<p _counted=\"undefined\">&nbsp;</p>', '2010-01-07 16:13:10', 1, '', '', 'prestations-davocats-les-acheteurs-cherchent-encore-a-simposer-publie-le-07-janvier-2010', 'Selon une &eacute;tude r&eacute;alis&eacute;e fin 2009, les <strong>directeurs juridiques</strong> consid&egrave;rent que <strong>les achats</strong> ne doivent pas occuper de r&ocirc;le sp&eacute;cifique dans le processus de s&eacute;lection des avocats.'),
(51, 6, 'L\'École Centrale Paris crée un nouveau mastère spécialisé achats. Publié le 13 janvier 2010', '<p _counted=\"undefined\">Ce 3<sup _counted=\"undefined\">e</sup> cycle, accr&eacute;dit&eacute; par la Conf&eacute;rence des Grandes Ecoles, s\'adresse &agrave; des dipl&ocirc;m&eacute;s (niveau Bac+5) issus d&rsquo;&eacute;coles d\'ing&eacute;nieurs et d&rsquo;universit&eacute;s scientifiques du monde entier, ainsi qu&rsquo;&agrave; de jeunes professionnels d&eacute;j&agrave; en poste.<br _counted=\"undefined\" />\r\nLe recrutement des futurs candidats est d&rsquo;ores et d&eacute;j&agrave; lanc&eacute; aupr&egrave;s d&rsquo;entreprises et d&rsquo;universit&eacute;s en France et &agrave; l&rsquo;international, notamment en Chine, en Inde et en Am&eacute;rique du Sud.</p>\r\n<p _counted=\"undefined\">L&rsquo;&eacute;quipe p&eacute;dagique sera constitu&eacute;e du corps professoral de l&rsquo;&Eacute;cole Centrale Paris, en s&rsquo;appuyant notamment sur les &eacute;quipes du laboratoire de G&eacute;nie Industriel, et de directeurs ou managers achats reconnus dans leur domaine. Le programme, compos&eacute; de 15 modules &agrave; temps plein dispens&eacute;s exclusivement en anglais, se d&eacute;roule sur 12 mois (7 mois de cours et 3 &agrave; 6 mois de stage).&nbsp;</p>\r\n<p _counted=\"undefined\"><strong _counted=\"undefined\">&Ecirc;tre op&eacute;rationnel dans des situations d\'achats complexes</strong>&nbsp;</p>\r\n<p _counted=\"undefined\">Au-del&agrave; de l&rsquo;enseignement des fondamentaux des achats, la formation abordera des th&eacute;matiques aussi pointues que l&rsquo;innovation et la veille technologique, l&rsquo;analyse du cycle de vie du produit, la gestion d&rsquo;affaires et de projets industriels, l&rsquo;implication des achats dans la conception des produits et de la supply chain, le global sourcing, le d&eacute;veloppement fournisseurs, les alliances strat&eacute;giques, la gestion des risques et l&rsquo;ing&eacute;nierie financi&egrave;re.&nbsp;</p>\r\n<p _counted=\"undefined\">Le contenu p&eacute;dagique sera d&eacute;clin&eacute; sous forme de cours magistraux, de projets d&rsquo;entreprises, d&rsquo;&eacute;tudes de cas et de conf&eacute;rences. Les &eacute;tudiants d&eacute;velopperont ainsi des comp&eacute;tences relationnelles, manag&eacute;riales, et sauront &ecirc;tre op&eacute;rationnels dans des situations d&rsquo;achats complexes.&nbsp;</p>\r\n<p _counted=\"undefined\">Cr&eacute;&eacute; &agrave; la demande de nombreuses directions achats, ce mast&egrave;re sp&eacute;cialis&eacute; a pour parrains fondateurs <strong _counted=\"undefined\">Claire Brabec-Lagrange</strong>, directrice achats du groupe Thales, et <strong _counted=\"undefined\">Jacques Barrailler</strong>, directeur du Service des Achats de l&rsquo;&Eacute;tat (SEA) et ancien directeur achats du groupe Alcan.<br _counted=\"undefined\" />\r\nDe nombreuses entreprises ont apport&eacute; leur soutien &agrave; la cr&eacute;ation de ce programme, parmi lesquelles Bouygues Construction, Danone, DCNS, Michelin, Orange-France T&eacute;l&eacute;com, Renault, Safran, Schneider Electric et Valeo.</p>\r\n<p _counted=\"undefined\"><font face=\"Arial\">Source: <a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/L-Ecole-Centrale-Paris-cree-un-nouveau-mastere-specialise-achats-31936.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/L-Ecole-Centrale-Paris-cree-un-nouveau-mastere-specialise-achats-31936.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font><font face=\"Arial\"><br />\r\n</font></p>', '2010-01-13 09:46:07', 1, '', '', 'lecole-centrale-paris-cree-un-nouveau-mastere-specialise-achats-publie-le-13-janvier-2010', 'L\'<strong _counted=\"undefined\">&Eacute;cole Centrale Paris</strong> annonce la cr&eacute;ation d\'un nouveau <strong _counted=\"undefined\">mast&egrave;re sp&eacute;cialis&eacute; achats</strong> intitul&eacute; &quot;Purchasing Manager in Technology &amp; Industry.'),
(53, 6, 'La réduction des coûts, levier anticrise des PME. Publié le 14 janvier 2010', '<p _counted=\"undefined\">Plus de 89% des entreprises ont mis en place fin 2009 une d&eacute;marche d&rsquo;optimisation des co&ucirc;ts. Tel est le r&eacute;sultat d&rsquo;une &eacute;tude r&eacute;alis&eacute;e en novembre 2009 par le cabinet <strong _counted=\"undefined\">Costalis</strong> aupr&egrave;s de 150 PME/PMI*. Leurs principales motivations: am&eacute;liorer la rentabilit&eacute; de l\'entreprise (67%), g&eacute;n&eacute;rer de la tr&eacute;sorerie suppl&eacute;mentaire (52%) ou encore faire face &agrave; un contexte &eacute;conomique morose (48%).</p>\r\n<p _counted=\"undefined\">La volont&eacute; d\'optimiser les co&ucirc;ts a d&rsquo;ailleurs connu une acc&eacute;l&eacute;ration car, la crise aidant, les entreprises ont &eacute;t&eacute; plus nombreuses en 2009 (+88 points, par rapport &agrave; l\'enqu&ecirc;te 2008) &agrave; r&eacute;aliser des &eacute;conomies en moins d&rsquo;un an. Cependant, seules 31% ont fait appel &agrave; un cabinet ext&eacute;rieur, pr&eacute;f&eacute;rant mettre en place des actions internes comme le contr&ocirc;le budg&eacute;taire ou le benchmarking des co&ucirc;ts. M&ecirc;me si, selon Costalis, 78% estiment que le volume d&rsquo;&eacute;conomies g&eacute;n&eacute;r&eacute;es seulement en interne pourrait &ecirc;tre am&eacute;lior&eacute;.</p>\r\n<p _counted=\"undefined\"><strong _counted=\"undefined\">Priorit&eacute; aux frais de fonctionnement</strong></p>\r\n<p _counted=\"undefined\">Autre constat de l&rsquo;&eacute;tude: en 2009, les entreprises ont multipli&eacute; les axes d&rsquo;&eacute;conomies alors qu&rsquo;elles avaient tendance, en 2008, &agrave; privil&eacute;gier une seule piste d&rsquo;action. Ainsi, les principaux leviers d&rsquo;&eacute;conomies ont &eacute;t&eacute; l&rsquo;<strong _counted=\"undefined\">optimisation des frais de fonctionnement</strong>, c&rsquo;est-&agrave;-dire des achats hors production (72%), la recherche de subvention et l&rsquo;obtention de cr&eacute;dits d&rsquo;imp&ocirc;ts (43%), puis l&rsquo;optimisation des frais financiers-cr&eacute;ances cr&eacute;dits bancaires (40%).</p>\r\n<p _counted=\"undefined\">&quot;A la diff&eacute;rence des grandes entreprises, les PME ont besoin de cash &agrave; tr&egrave;s court terme pour financer leurs investissements. Elles ont donc davantage privil&eacute;gi&eacute; en 2009 la piste des subventions et cr&eacute;dits d&rsquo;imp&ocirc;ts, ralliant 43% des entreprises utilisatrices contre seulement 13% en 2008&quot;, indique Luigi Masala, directeur de Costalis. Et d&rsquo;ajouter: &quot;Les PME semblent avoir saisi l&rsquo;importance de ces leviers et ont identifi&eacute; ces nouvelles ressources accord&eacute;es par l&rsquo;Etat comme essentielles dans le financement de leurs investissements.&quot;</p>\r\n<p _counted=\"undefined\"><strong _counted=\"undefined\">Modernisation de l&rsquo;outil de travail</strong></p>\r\n<p _counted=\"undefined\">A la question &quot;Que feriez-vous si vous aviez &eacute;conomis&eacute; 20.000 euros dans votre entreprise?&quot;, les entreprises ont globalement donn&eacute; les m&ecirc;mes r&eacute;ponses qu&rsquo;en 2008: 40% des PME interrog&eacute;es investiraient dans la modernisation de l&rsquo;outil de travail, 28% en marketing et 22% redistribueraient les &eacute;conomies r&eacute;alis&eacute;es en primes ou seraient encourag&eacute;es &agrave; recruter. &quot;Quand une PME met en &oelig;uvre une d&eacute;marche d&rsquo;optimisation, celle-ci est toujours globale. Le cash g&eacute;n&eacute;r&eacute; vient alimenter directement les investissements selon les besoins de la PME qu&rsquo;ils soient pour moderniser les outils ou pour encourager les ressources humaines&quot;, conclut Luigi Masala.</p>\r\n<p _counted=\"undefined\">*Les entreprises interrog&eacute;es sont r&eacute;parties comme suit: 39% de moins de 50 salari&eacute;s, 48% entre 50 et 200 salari&eacute;s, 13% de plus de 200 salari&eacute;s. 39% des PME sont issues du secteur de l&rsquo;industrie et 61% des services. 52% des personnes interrog&eacute;es font partie de direction g&eacute;n&eacute;rale, 22% de la direction financi&egrave;re et 26% d&rsquo;autres directions (ressources humaines, direction commerciale, achat, technique&hellip;).</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Article-A-La-Une/La-reduction-des-couts-levier-anticrise-des-PME-1282.htm?XType=XTM&amp;xtor=EPR-3\">http://www.decision-achats.fr/Article-A-La-Une/La-reduction-des-couts-levier-anticrise-des-PME-1282.htm?XType=XTM&amp;xtor=EPR-3</a></font></p>', '2010-01-14 17:07:25', 1, '', '', 'la-reduction-des-coûts-levier-anticrise-des-pme-publie-le-14-janvier-2010', 'Selon une &eacute;tude r&eacute;alis&eacute;e par Costalis, la majorit&eacute; des PME ont mis&eacute; en 2009 sur la r&eacute;duction des co&ucirc;ts pour faire face &agrave; la crise &eacute;conomique. L\'optimisation des achats hors production est consid&eacute;r&eacute;e comme le premier levier d\'&eacute;conomies.');
INSERT INTO `actualite` (`id`, `image_id`, `titre`, `description`, `created`, `is_active`, `keywords`, `source`, `slug`, `apercu`) VALUES
(54, 6, 'Achats : Automobile. Publié le 20 janvier 2010', '<p _counted=\"undefined\">Alors que la possible production de la future Clio 4 en Turquie suscite la pol&eacute;mique, y compris au plus haut sommet de l\'Etat, <strong _counted=\"undefined\">Renault</strong> a tenu &agrave; rappeler que &quot;la France est, de loin, la principale localisation du constructeur automobile&quot;.</p>\r\n<p _counted=\"undefined\">&nbsp;Chiffres &agrave; l\'appui, le groupe de <strong _counted=\"undefined\">Carlos Ghosn</strong> a ainsi indiqu&eacute; que, l\'an dernier, 42% des achats de l\'entreprise avaient &eacute;t&eacute; effectu&eacute;s aupr&egrave;s de fournisseurs bas&eacute;s en France. Autre exemple cit&eacute; : 86% des d&eacute;penses d\'ing&eacute;nierie ont &eacute;t&eacute; &eacute;galement r&eacute;alis&eacute;es dans l\'Hexane.</p>\r\n<p _counted=\"undefined\">Le volume d\'achats de Renault repr&eacute;sente plus de 22 milliards d\'euros. Avec Nissan, l\'alliance entre les deux constructeurs aboutit &agrave; un volume d\'achats de plus de 60 milliards d\'euros, g&eacute;r&eacute; par une filiale commune baptis&eacute;e <strong _counted=\"undefined\">RNPO</strong> (pour Renault Nissan Purchasing Organisation). Cette derni&egrave;re est pr&eacute;sid&eacute;e par <a target=\"_blank\" _counted=\"undefined\" href=\"http://www.decision-achats.fr/Breves/Le-directeur-achats-de-Renault-integre-le-comite-de-direction-du-groupe-31737.htm?iPageNum=1&amp;TrierPar=0_DESC&amp;RechAvance=&amp;FldRech=Renault&amp;RadioExpression=&amp;RadioTitreArticle=&amp;DateDebMois=&amp;DateDebAnnee=&amp;DateFinMois=&amp;DateFinAnnee=&amp;ListeMag=ACTU&amp;ListeMag=DA\"><strong _counted=\"undefined\">Christian Vandenhende</strong></a>, qui est membre du comit&eacute; de direction de Renault depuis le 4 janvier 2010.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/Face-a-la-polemique-Renault-rappelle-qu-une-large-partie-de-ses-achats-est-realisee-en-France-31987.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/Face-a-la-polemique-Renault-rappelle-qu-une-large-partie-de-ses-achats-est-realisee-en-France-31987.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2010-01-20 09:42:38', 1, '', '', 'achats-automobile-publie-le-20-janvier-2010', 'Face &agrave; la pol&eacute;mique, Renault rappelle qu\'une large partie de ses achats est r&eacute;alis&eacute;e en France'),
(55, 6, 'Donneurs d\'ordres : portrait type du mauvais payeur. Publié le 21 janvier 2010', '<p _counted=\"undefined\">Les <strong _counted=\"undefined\">&quot;sp&eacute;cialistes&quot;</strong> du non-paiement repr&eacute;sentent un quart des soci&eacute;t&eacute;s d&eacute;bitrices: elles ne paient pas par habitude, se jouent des relances, se retranchent derri&egrave;re des litiges imaginaires, et parient sur l&rsquo;&eacute;loignement pour se faire oublier de leurs cr&eacute;anciers. Derri&egrave;re elles, les <strong _counted=\"undefined\">&quot;s&eacute;lectives&quot;</strong> (23%), ces entreprises qui r&egrave;glent leurs fournisseurs selon leurs priorit&eacute;s. Nombreux aussi sont les acteurs &eacute;conomiques qui jouent de leur situation de sup&eacute;riorit&eacute;: ces <strong _counted=\"undefined\">&quot;dominants&quot;</strong> (15%) paient syst&eacute;matiquement leurs fournisseurs en retard. Une fa&ccedil;on pour eux d&rsquo;imposer leur loi &agrave; des PME qu&rsquo;ils fragilisent d&rsquo;autant plus que le contexte &eacute;conomique est tourment&eacute;.</p>\r\n<p _counted=\"undefined\">Rien &agrave; voir avec toutes les entreprises qui paieraient bien si elles n&rsquo;avaient pas, soit des probl&egrave;mes financiers (9% d&rsquo;<strong _counted=\"undefined\">&quot;insolvables&quot;</strong>), soit un litige commercial, technique ou comptable en cours (les <strong _counted=\"undefined\">&quot;sinc&egrave;res&quot;</strong> repr&eacute;sentent 13% des d&eacute;biteurs).<br _counted=\"undefined\" />\r\nEt, entre ceux qui ne paient pas parce qu&rsquo;ils ne veulent pas et ceux qui ne paient pas parce qu&rsquo;ils ne peuvent pas, restent les clients <strong _counted=\"undefined\">&quot;d&eacute;sorganis&eacute;s&quot;</strong> (7%), qui oublient, perdent les documents et se noient dans leur d&eacute;sordre. Sans oublier ceux chez qui la lourdeur des proc&eacute;dures tue le paiement dans les temps: les <strong _counted=\"undefined\">&quot;sur-contr&ocirc;l&eacute;s&quot;</strong> (8%).</p>\r\n<p _counted=\"undefined\">Rappelons que les retards de paiement placent toujours les acteurs &eacute;conomiques dans une situation critique puisqu&rsquo;ils malm&egrave;nent leur tr&eacute;sorerie: chaque ann&eacute;e, 36 milliards d&rsquo;euros sont ainsi pass&eacute;s en pertes et les entreprises d&eacute;pensent 4 milliards d&rsquo;euros pour financer ces retards.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/Donneurs-d-ordres-portrait-type-du-mauvais-payeur-32036.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/Donneurs-d-ordres-portrait-type-du-mauvais-payeur-32036.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2010-01-21 09:07:35', 1, '', '', 'donneurs-dordres-portrait-type-du-mauvais-payeur-publie-le-21-janvier-2010', '<p>Une entreprise francilienne, entre cinq et huit ans d&rsquo;exercice, &oelig;uvrant dans les secteurs du commerce ou des services, employant moins de 15 salari&eacute;s et r&eacute;alisant moins de 5 millions d&rsquo;euros de chiffre d&rsquo;affaires. Tel est le portrait type du <strong _counted=\"undefined\">mauvais payeur</strong>, &agrave; en croire une &eacute;tude r&eacute;cente r&eacute;alis&eacute;e par <strong _counted=\"undefined\">Intrum Justitia</strong>, sp&eacute;cialiste de la gestion du poste client.</p>\r\n<p>&nbsp;</p>'),
(56, 13, 'La SNTL : futur champion national de la logistique? Publié le 25 janvier 2010.', '<p>C&rsquo;est le cas de la Soci&eacute;t&eacute; nationale des transports et de la logistique (SNTL) &ndash;ex-Office national des transports&ndash; qui ouvrira son premier centre logistique &agrave; Mohamm&eacute;dia avant fin 2010. La premi&egrave;re tranche de ce centre qui sera op&eacute;rationnelle s&rsquo;&eacute;tendra sur 28 hectares. La SNTL annonce d&rsquo;autres plateformes similaires &agrave; Tanger, Agadir, F&egrave;s et Marrakech. Selon des op&eacute;rateurs priv&eacute;s, la SNTL a tout pour &ecirc;tre le futur champion national du transport et de la logistique pour les ann&eacute;es &agrave; venir. </p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lavieeco.com/echos/15629-la-sntl-futur-champion-national-de-la-logistique.html\">http://www.lavieeco.com/echos/15629-la-sntl-futur-champion-national-de-la-logistique.html</a></font></p>', '2010-01-25 09:14:27', 1, '', '', 'la-sntl-futur-champion-national-de-la-logistique?-publie-le-25-janvier-2010', 'Au moment o&ugrave; la strat&eacute;gie nationale de la logistique est sur le point de voir le jour, les op&eacute;rateurs nationaux prennent d&eacute;j&agrave; des positions.'),
(57, 6, 'Gestion de la relation fournisseurs. Publié le 02 Février 2010.', '<p _counted=\"undefined\">Recruter des fournisseurs innovants et &agrave; forte valeur ajout&eacute;e. Tel est l&rsquo;objectif que s&rsquo;est fix&eacute; la direction des achats et de la logistique du Club M&eacute;diterran&eacute;e en mettant en ligne courant janvier le site www.suppliers.clubmed.com. &laquo; Ce site Internet met en avant les valeurs de notre entreprise, notre politique achats, nos besoins, nos processus de r&eacute;f&eacute;rencement, etc. Il va donc permettre aux fournisseurs potentiels de mieux nous conna&icirc;tre&raquo;, explique Marie H&eacute;l&egrave;ne Blanch&eacute;, en charge des process, de la communication et de l&rsquo;organisation au sein de la direction des achats et de la logistique du Club M&eacute;diterran&eacute;e. </p>\r\n<p _counted=\"undefined\"><strong _counted=\"undefined\">Base de donn&eacute;es fournisseurs</strong></p>\r\n<p _counted=\"undefined\">Plus encore, le site va surtout aider le groupe &agrave; mieux entrer en contact avec ses partenaires en structurant v&eacute;ritablement la relation avec eux. &laquo; En effet, le site homog&eacute;n&eacute;ise et centralise toutes les donn&eacute;es strat&eacute;giques concernant les fournisseurs, qui se font conna&icirc;tre en remplissant un formulaire en ligne &raquo;. Les questionnaires sont class&eacute;s par pays, par famille et sous famille d&rsquo;achats. &laquo; Ils sont envoy&eacute;s automatiquement, selon le secteur d&rsquo;activit&eacute; et la localisation de l&rsquo;entreprise, vers un des quarante acheteurs de nos onze bureaux d&rsquo;achats internationaux&raquo;. Un process bien cadr&eacute; qui permettra au groupe de se constituer une base de donn&eacute;es fournisseurs internationale. &laquo; Seuls les fournisseurs g&eacute;n&eacute;rateurs de valeur pour l&rsquo;entreprise et r&eacute;pondant &agrave; nos pr&eacute;-requis figureront dans ce fichier &raquo;, rappelle Marie H&eacute;l&egrave;ne Blanch&eacute;. Exit donc les pertes de temps &agrave; chaque consultation de march&eacute;, les acheteurs pourront lancer leurs appels d&rsquo;offres bien plus simplement en allant chercher les contacts n&eacute;cessaires dans la base. </p>\r\n<p _counted=\"undefined\"><strong _counted=\"undefined\">Professionnalisation de la direction achats</strong></p>\r\n<p _counted=\"undefined\">Une solution qui participe &agrave; la professionnalisation de la direction achats du Club M&eacute;diterran&eacute;e. &laquo; Gr&acirc;ce &agrave; la mise en place de ce site internet, tous nos services achats &agrave; travers le monde g&egrave;rent et structurent de la m&ecirc;me fa&ccedil;on les informations fournisseurs. R&eacute;sultat : gr&acirc;ce &agrave; ce formidable outil de sourcing nous gagnons non seulement en visibilit&eacute;, mais aussi en tra&ccedil;abilit&eacute; et productivit&eacute; &raquo;. </p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/Club-Mediterranee-un-nouveau-site-pour-optimiser-la-gestion-de-la-relation-fournisseurs-32201.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/Club-Mediterranee-un-nouveau-site-pour-optimiser-la-gestion-de-la-relation-fournisseurs-32201.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font><br _counted=\"undefined\" />\r\n</p>', '2010-02-02 12:01:14', 1, '', '', 'gestion-de-la-relation-fournisseurs-publie-le-02-fevrier-2010', 'Club M&eacute;diterran&eacute;e: un nouveau site pour optimiser la gestion de la relation fournisseurs'),
(58, 6, 'Les achats, à la recherche d\'un nouveau modèle. Publié le 04 février 2010.', '<p>&Agrave; l&rsquo;heure de la crise, les achats tendent-ils vers un nouveau mod&egrave;le? Comment &eacute;voluent les relations vis-&agrave;-vis des clients internes? Quels changements dans la gestion des fournisseurs? Autant de questions auxquelles a essay&eacute; de r&eacute;pondre une &eacute;tude r&eacute;alis&eacute;e par Bearing Point, Microsoft, l&rsquo;Essec et Novam&eacute;trie dans le cadre de la cinqui&egrave;me &eacute;dition de l&rsquo;observatoire des achats*. Des r&eacute;sultats qui ont &eacute;t&eacute; pr&eacute;sent&eacute;s et analys&eacute;s lors d&rsquo;une table ronde organis&eacute;e la semaine derni&egrave;re, &agrave; Paris, et &agrave; laquelle ont notamment particip&eacute; Pierre Pelouzet, pr&eacute;sident de la CDAF et directeur des achats de la SNCF, et Jean Bouverot, responsable minist&eacute;riel des achats au minist&egrave;re de la D&eacute;fense.<br _counted=\"undefined\" />\r\nPremi&egrave;re tendance, plut&ocirc;t peu surprenante, d&eacute;crypt&eacute;e par l&rsquo;&eacute;tude: la r&eacute;duction des co&ucirc;ts constitue, en cette p&eacute;riode &eacute;conomique difficile, la priorit&eacute; num&eacute;ro un des directions achats, ralliant 34% des sond&eacute;s. Suivent les objectifs d&rsquo;int&eacute;gration (15%) et le changement d&rsquo;organisation (13%). &Agrave; noter que le d&eacute;veloppement durable arrive en queue de peloton, n&rsquo;&eacute;tant cit&eacute; que par 2% des sond&eacute;s. </p>\r\n<p><strong _counted=\"undefined\">La fonction achats &eacute;tend son p&eacute;rim&egrave;tre d&rsquo;actions</strong></p>\r\n<p>Autre constat: l&rsquo;effet &ldquo;crise&rdquo; est nettement visible dans la baisse des budgets de fonctionnement. Alors que 54% du panel d&eacute;claraient en 2008 une baisse ou une stagnation du budget de fonctionnement, 75% des entreprises consult&eacute;es d&eacute;clarent &ecirc;tre dans cette situation en 2009. Pourtant, malgr&eacute; cette baisse de moyens, la couverture des d&eacute;penses support&eacute;es par les achats fait un bon quantitatif: 78% des entreprises couvrent plus de 60% des d&eacute;penses, contre 64% du panel en 2008. Manifestement, le degr&eacute; d&rsquo;urgence dans la recherche d&rsquo;&eacute;conomies a fait &ldquo;sauter des verrous&rdquo; donnant l&rsquo;opportunit&eacute; &agrave; la fonction achats d&rsquo;&eacute;tendre son p&eacute;rim&egrave;tre d&rsquo;actions.</p>\r\n<p><strong _counted=\"undefined\">Une plus grande professionnalisation du m&eacute;tier</strong></p>\r\n<p>Autre enseignement tir&eacute; par l&rsquo;enqu&ecirc;te: la fonction achats continue de se professionnaliser. En effet, 60% de profils interrog&eacute;s ont plus de cinq ans d&rsquo;exp&eacute;rience. De plus, 70% des ressources achats sont compos&eacute;es de sp&eacute;cialistes, ayant un solide bagage acad&eacute;mique (quatre &agrave; cinq ann&eacute;es d&rsquo;&eacute;tudes sup&eacute;rieures dans le domaine des achats). <br _counted=\"undefined\" />\r\nCes &eacute;volutions ne r&egrave;glent pas pour autant l&rsquo;un des probl&egrave;mes structurels de la fonction: une ouverture encore insuffisante sur l&rsquo;ext&eacute;rieur. Les achats fonctionnent encore trop en &ldquo;circuit ferm&eacute;&rdquo;. En effet, seuls 28% des effectifs achats proviennent d&rsquo;autres fonctions et uniquement 8% des effectifs (sur deux ans) ont quitt&eacute; cette fonction pour d&rsquo;autres. Autrement dit, les achats sont encore peu consid&eacute;r&eacute;s comme une fonction &ldquo;tremplin&rdquo; permettant d&rsquo;acc&eacute;der &agrave; d&rsquo;autres responsabilit&eacute;s au sein de l&rsquo;entreprise.</p>\r\n<p><strong _counted=\"undefined\">Changement en profondeur</strong></p>\r\n<p>Par ailleurs, un tiers des entreprises interrog&eacute;es consid&egrave;re qu&rsquo;un besoin en profondeur de la fonction s&rsquo;impose. L&rsquo;&eacute;volution rapide des march&eacute;s fournisseurs en est le principal &eacute;l&eacute;ment d&eacute;clencheur, car la sant&eacute; financi&egrave;re pr&eacute;caire de ces derniers constitue d&eacute;sormais un sujet de pr&eacute;occupation majeure des services achats. <br _counted=\"undefined\" />\r\nPar ailleurs, l&rsquo;exigence accrue des clients internes, amplifi&eacute;e par le contexte de crise, constitue le deuxi&egrave;me &eacute;l&eacute;ment d&eacute;clencheur de ce besoin de changement.</p>\r\n<p><strong _counted=\"undefined\">Vers plus de valeur ajout&eacute;e</strong></p>\r\n<p>Bonne nouvelle apport&eacute;e par l&rsquo;enqu&ecirc;te: la fonction achats acc&eacute;l&egrave;rerait sa mutation. Elle quitte d&eacute;sormais sa posture &ldquo;traditionnelle&rdquo; de justification de sa valeur ajout&eacute;e pour occuper celle d&rsquo;apporteur de solutions. 40% des entreprises du panel identifient l&rsquo;apport de solutions comme l&rsquo;action la plus efficace, alors que 34% penchent davantage pour une meilleure explication de la valeur ajout&eacute;e. <br _counted=\"undefined\" />\r\nPour Pierre Pelouzet (SNCF), les r&eacute;sultats de cette &eacute;tude sont globalement positifs: &laquo;Ils montrent que les acheteurs sont pass&eacute;s d&rsquo;un r&ocirc;le per&ccedil;u comme administratif &agrave; une fonction de n&eacute;ciateur dot&eacute;e d&rsquo;une capacit&eacute; d&rsquo;influence de plus en plus grande. De ce fait, les services achats auront &agrave; l\'avenir pour objectif d\'acqu&eacute;rir des comp&eacute;tences nouvelles tout en conservant leur expertise de base sur les sujets fondamentaux.&raquo; Position plus nuanc&eacute;e pour Jean Bouverot (minist&egrave;re de la D&eacute;fense) qui rappelle un hiatus de taille: &laquo;L&rsquo;&eacute;tude montre &eacute;galement que les achats durables sont rel&eacute;gu&eacute;s au second plan. Or, si nous voulons gagner en performance, nous devrons absolument nous illustrer sur ces sujets strat&eacute;giques o&ugrave; l\'expertise des acheteurs est plus que jamais attendue.&raquo; <br _counted=\"undefined\" />\r\n<br _counted=\"undefined\" />\r\n<br _counted=\"undefined\" />\r\n* Cette &eacute;tude a &eacute;t&eacute; r&eacute;alis&eacute;e aupr&egrave;s de plus de 200 directeurs achats dont 35 interview&eacute;s lors d&rsquo;entretiens en face-&agrave;-face. 60% des entreprises r&eacute;alisent plus d&rsquo;un milliard d&rsquo;euros de chiffre d&rsquo;affaires. Le secteur industriel repr&eacute;sente 44% des soci&eacute;t&eacute;s sond&eacute;es.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Article-A-La-Une/Les-achats-a-la-recherche-d-un-nouveau-modele--1322.htm?XType=XTA&amp;xtor=EPR-3\">http://www.decision-achats.fr/Article-A-La-Une/Les-achats-a-la-recherche-d-un-nouveau-modele--1322.htm?XType=XTA&amp;xtor=EPR-3</a></font></p>', '2010-02-04 14:25:20', 1, '', '', 'les-achats-a-la-recherche-dun-nouveau-modele-publie-le-04-fevrier-2010', 'R&eacute;alis&eacute;e par Bearing Point, Microsoft, l\'Essec et Novam&eacute;trie, la cinqui&egrave;me &eacute;dition de l\'observatoire des achats met en avant la volont&eacute; des acheteurs de changer de mod&egrave;le en faisant &eacute;voluer leurs relations avec leurs clients internes comme avec leurs fournisseurs. M&ecirc;me si la r&eacute;duction des co&ucirc;ts constitue toujours leur priorit&eacute; num&eacute;ro un.'),
(59, 6, 'Alcatel-Lucent dépasse largement son objectif de réduction des coûts. Publié le 12 février 2010.', 'Une partie de ces &eacute;conomies ont &eacute;t&eacute; r&eacute;alis&eacute;es au niveau des achats, inclus dans ce que l\'entreprise appelle &quot;ses co&ucirc;ts de ventes&quot; (40% des &eacute;conomies r&eacute;alis&eacute;es en 2009). Les autres mesures de r&eacute;duction de co&ucirc;ts ont concern&eacute;es la R&amp;D (25% des &eacute;conomies r&eacute;alis&eacute;es) et les charges administratives et financi&egrave;res (35% des &eacute;conomies r&eacute;alis&eacute;es).\r\n<p _counted=\"undefined\">L\'objectif initial de l\'&eacute;quipementier t&eacute;l&eacute;coms &eacute;tait de r&eacute;aliser 750 millions d\'euros d\'&eacute;conomies l\'ann&eacute;e derni&egrave;re. Celui-ci a donc &eacute;t&eacute; largement d&eacute;pass&eacute;.</p>\r\n<p _counted=\"undefined\">Le volume d\'achats d\'Alcatel-Lucent est estim&eacute; &agrave; 9,5 milliards d\'euros par an.</p>\r\n<p _counted=\"undefined\">En 2009, Alcatel-Lucent a r&eacute;alis&eacute; un chiffre d\'affaires de 15,157 milliards d\'euros, en baisse de 10,8%. La marge brute ajust&eacute;e s\'&eacute;l&egrave;ve &agrave; 5,112 milliards d\'euros, soit 33,7% des revenus.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/Alcatel-Lucent-depasse-largement-son-objectif-de-reduction-des-couts-32351.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/Alcatel-Lucent-depasse-largement-son-objectif-de-reduction-des-couts-32351.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2010-02-12 14:36:43', 1, '', '', 'alcatel-lucent-depasse-largement-son-objectif-de-reduction-des-coûts-publie-le-12-fevrier-2010', '<div>En 2009, Alcatel-Lucent annonce avoir r&eacute;duit ses co&ucirc;ts d&rsquo;environ 950 millions d&rsquo;euros. L&rsquo;objectif initial de 750 millions d&rsquo;euros d&rsquo;&eacute;conomies a donc &eacute;t&eacute; largement d&eacute;pass&eacute;.</div>'),
(60, 6, 'La fonction achats se professionnalise dans le secteur des assurances. Publié le 19 février 2010.', '<p _counted=\"undefined\">Dans le secteur des assurances, <strong _counted=\"undefined\">un service achat sur deux affiche un taux de couverture des d&eacute;penses de 60 % &agrave; 80 %</strong>. Tel est le r&eacute;sultat d&rsquo;une &eacute;tude r&eacute;alis&eacute;e d&eacute;but 2010 par les cabinets R&amp;B Partners et CKS Consulting aupr&egrave;s de mutuelles, organismes de pr&eacute;voyances et compagnies d&rsquo;assurances. M&ecirc;me si ce taux reste plus faible que dans d&rsquo;autres secteurs, il serait en progression depuis deux ans dans trois quarts des directions achats sond&eacute;es.</p>\r\n<p _counted=\"undefined\">Signe de la professionnalisation de la fonction achats dans ce secteur, 60 % des structures interrog&eacute;es ont mis en place un cursus de formation d&eacute;di&eacute; &agrave; la mont&eacute;e en comp&eacute;tence des acheteurs. Du point de vue technique, les besoins de formation concernent, la gestion de la relation fournisseurs, le marketing achats (mise en place de strat&eacute;gie familles) et la gestion des consultations.<br _counted=\"undefined\" />\r\nSans surprise, <strong _counted=\"undefined\">les priorit&eacute;s achats dans le secteur des assurances concernent avant tout la r&eacute;duction des co&ucirc;ts (63 %</strong>), suivie de l&rsquo;augmentation du taux de couverture (44 %) ou encore la hausse des synergies achats entre secteurs (44 %).</p>\r\n<p _counted=\"undefined\">Si 64 % des acheteurs interrog&eacute;s consid&egrave;rent que leurs risques fournisseurs sont ma&icirc;tris&eacute;s, seules 18 % des entreprises souhaitent d&eacute;velopper de nouveaux modes de relation avec leurs partenaires strat&eacute;giques. Enfin, seules 15 % des entreprises interrog&eacute;es pr&eacute;voient de mettre en place des outils e-achats (e-sourcing, e-procurement) ou une politique d&rsquo;achats responsables.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/La-fonction-achats-se-professionnalise-dans-le-secteur-des-assurances-32441.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/La-fonction-achats-se-professionnalise-dans-le-secteur-des-assurances-32441.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2010-02-19 09:47:04', 1, '', '', 'la-fonction-achats-se-professionnalise-dans-le-secteur-des-assurances-publie-le-19-fevrier-2010', '<div>Selon une &eacute;tude des cabinets R&amp;B Partners et CKS Consulting, 75 % des directions achats d&rsquo;entreprises du secteur des assurances voient leur taux de couverture augmenter depuis deux ans.</div>'),
(61, 14, 'Les acheteurs industriels reviennent en force. Publié le 23 février 2010.', '<p class=\"MsoBodyText\">Avec 197&nbsp;annonces r&eacute;f&eacute;renc&eacute;es en f&eacute;vrier, notre barom&egrave;tre emploi confirme un redressement entam&eacute; en novembre dernier avec 144&nbsp;offres, apr&egrave;s une ann&eacute;e 2009 particuli&egrave;rement difficile. Il se rapproche peu &agrave; peu du niveau de f&eacute;vrier 2008 o&ugrave; nous avions enregistr&eacute; 232 annonces, contre 168 en f&eacute;vrier 2009. Mais si la courbe de l&rsquo;emploi aux achats para&icirc;t bien orient&eacute;e, il est encore un peu t&ocirc;t pour parler de rebond.</p>\r\n<p class=\"MsoBodyText\"><span>&Agrave;</span> noter&nbsp;: la place croissante de l&rsquo;industrie, avec 72&nbsp;% des annonces, ce que nous avions d&rsquo;ailleurs d&eacute;j&agrave; constat&eacute; le mois pr&eacute;c&eacute;dent. Un changement qui se fait au d&eacute;triment des responsables des achats, qui glissent de 24 &agrave; 18&nbsp;% des annonces de janvier &agrave; f&eacute;vrier. Autre &eacute;volution&nbsp;: la part des offres visant les acheteurs progresse, &agrave; 72&nbsp;% ce mois-ci, contre 65&nbsp;% en janvier. Enfin, les annonces destin&eacute;es aux consultants achats se font beaucoup moins pr&eacute;sentes&nbsp;: apr&egrave;s 46&nbsp;% en moyenne en 2009, leur proportion est descendue &agrave; 14&nbsp;% en janvier 2010, puis &agrave; 10,66&nbsp;% en f&eacute;vrier.</p>\r\n<p class=\"MsoBodyText\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/43/83/document_article_web.phtml\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/43/83/document_article_web.phtml</a></font></p>', '2010-02-23 14:30:38', 1, '', '', 'les-acheteurs-industriels-reviennent-en-force-publie-le-23-fevrier-2010', 'Depuis quelques mois, la fonction achats semble reprendre des couleurs, mais dans un contexte encore incertain. Une reprise qui concerne avant tout l&rsquo;industrie et les acheteurs.<!-- article_web chapeau fin-->'),
(62, 6, 'Rhodia réduit ses coûts de 114 millions d’euros en 2009. Publié le 24 février 2010', '<p>En 2010, l\'entreprise souhaite r&eacute;aliser 130 millions d\'euros d\'&eacute;conomies. &quot;Si les conditions &eacute;conomiques se sont globalement am&eacute;lior&eacute;es, la croissance en Europe reste incertaine. Dans ce contexte, discipline op&eacute;rationnelle et g&eacute;n&eacute;ration de cash demeurent nos priorit&eacute;s, au m&ecirc;me titre qu&rsquo;une am&eacute;lioration significative de notre rentabilit&eacute;&quot;, a notamment d&eacute;clar&eacute; Jean-Pierre Clamadieu, p-dg de Rhodia.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/Rhodia-reduit-ses-couts-de-114-millions-d-euros-en-2009-32503.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/Rhodia-reduit-ses-couts-de-114-millions-d-euros-en-2009-32503.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2010-02-24 16:51:07', 1, '', '', 'rhodia-reduit-ses-coûts-de-114-millions-deuros-en-2009-publie-le-24-fevrier-2010', '<span style=\"FONT-FAMILY: \'Calibri\',\'sans-serif\'; FONT-SIZE: 12pt; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-ansi-language: FR; mso-fareast-language: FR; mso-bidi-language: AR-SA\">Le groupe Rhodia annonce avoir r&eacute;alis&eacute; en 2009 pr&egrave;s de 114 millions d&rsquo;euros d&rsquo;&eacute;conomies sur ses frais fixes. </span>'),
(63, 6, 'Valeo réalise 336 millions d\'euros d\'économies en 2009. Publié le 25 février 2010.', 'Ainsi, en un peu moins d\'un an, l\'&eacute;quipementier automobile a r&eacute;alis&eacute; pr&egrave;s de 480 millions d\'euros d\'&eacute;conomies (144 millions d\'euros le 4&egrave;me trimestre 2008 et surtout 336 millions d\'euros en 2009). &quot;Je souhaite remercier les collaborateurs de Valeo pour leur mobilisation au cours de l\'ann&eacute;e 2009 qui a permis au groupe de r&eacute;aliser une r&eacute;duction importante de ses co&ucirc;ts et d\'obtenir au quatri&egrave;me trimestre un niveau de rentabilit&eacute; encourageant&quot;, a notamment d&eacute;clar&eacute; Jacques Aschenbroich, le directeur g&eacute;n&eacute;ral de l\'entreprise.\r\n<p _counted=\"undefined\">&nbsp;Comme pour toute l\'industrie automobile, le contexte reste tr&egrave;s difficile pour Valeo. En 2009, l\'&eacute;quipementier a enregistr&eacute; une baisse de son chiffre d\'affaires de 14%, &agrave; 7,499 milliards d\'euros. Idem pour la marge brute (-14%, &agrave; 1,138 million d\'euros). La marge op&eacute;rationnelle chute quant &agrave; elle de pr&egrave;s de 42%, &agrave; 133 millions d\'euros. En revanche, la Cash Flow libre augmente de 31%, &agrave; 155 millions d\'euros.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/Valeo-realise-336-millions-d-euros-d-economies-en-2009-32520.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/Valeo-realise-336-millions-d-euros-d-economies-en-2009-32520.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2010-02-25 12:27:23', 1, '', '', 'valeo-realise-336-millions-deuros-deconomies-en-2009-publie-le-25-fevrier-2010', 'Lors de publication de ses r&eacute;sultats pour l\'ann&eacute;e 2009, le groupe Valeo a annonc&eacute; que son plan de r&eacute;duction des co&ucirc;ts avait permis de pr&eacute;server le Cash Flow libre de l\'entreprise.'),
(64, 6, 'Saint bain va poursuivre son programme de réduction des coûts. publié le 01 mars 2010.', 'Dans ce cadre, il entend poursuivre ses r&eacute;ductions de co&ucirc;ts. Environ 600 millions d\'euros d\'&eacute;conomies sont programm&eacute;s en 2010 apr&egrave;s 1,1 milliard d\'euros d\'&eacute;conomies l\'an pass&eacute;.\r\n<p _counted=\"undefined\">Rappelons que Saint bain a r&eacute;alis&eacute; en 2009 un r&eacute;sultat net courant de 617 millions d\'euros, en baisse de 67,8%. Le r&eacute;sultat d\'exploitation s\'est, quant &agrave; lui, &eacute;lev&eacute; &agrave; 2,216 milliards d\'euros, en recul de 39,3%.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/Breves/Saint-bain-va-poursuivre-son-programme-de-reduction-des-couts-32541.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29\">http://www.decision-achats.fr/Breves/Saint-bain-va-poursuivre-son-programme-de-reduction-des-couts-32541.htm?xtor=RSS-1&amp;utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+DecisionAchats-Actus+%28Decision+Achats+-+Actualit%C3%A9s%29</a></font></p>', '2010-03-01 16:40:20', 1, '', '', 'saint-bain-va-poursuivre-son-programme-de-reduction-des-coûts-publie-le-01-mars-2010', 'Apr&egrave;s une ann&eacute;e 2009 difficile, Saint bain pr&eacute;voit en 2010, un environnement &eacute;conomique meilleur qu\'en 2009.'),
(65, 14, 'Crédit Agricole SA : Les achats étendent leur autorité sur les filiales. Publié le 02 mars 2010.', '<p>&laquo;&nbsp;Nous devons d&eacute;finir la strat&eacute;gie et la politique achats du groupe Cr&eacute;dit Agricole, y compris pour ses filiales, LCL, Amundi, Predica, etc., hors caisses r&eacute;gionales&nbsp;&raquo;, r&eacute;sume Christian Laurenceau, directeur des achats et de la logistique du groupe. &laquo;&nbsp;Cela comprend la d&eacute;finition d&rsquo;une politique achats &agrave; trois ans, avec des pratiques, des processus et des outils communs&nbsp;&raquo;, compl&egrave;te-t-il.</p>\r\n<p>Pour le Cr&eacute;dit Agricole et sa vingtaine de filiales, le montant des achats s&rsquo;&eacute;l&egrave;ve &agrave; 5&nbsp;milliards d&rsquo;euros. Un p&eacute;rim&egrave;tre g&eacute;r&eacute; par une &eacute;quipe de 45&nbsp;acheteurs Cr&eacute;dit Agricole et, pour les filiales, par une quarantaine d&rsquo;acheteurs en France, plus une quinzaine &agrave; l&rsquo;&eacute;tranger. Les filiales sont tr&egrave;s h&eacute;t&eacute;rog&egrave;nes, allant de LCL et sa vingtaine d&rsquo;acheteurs, &agrave; la Banque de gestion priv&eacute;e Indosuez, qui dispose simplement d&rsquo;un correspondant achats.</p>\r\n<p>Jusqu&rsquo;ici responsable des achats non technologiques, &Eacute;velyne Austruy devra faire le tri entre les besoins mutualisables et les besoins particuliers, en tant que responsable des relations avec les clients internes. Son ancien adjoint, Yannick Labb&eacute;, prend le poste cr&eacute;&eacute; de responsable des achats. Son p&eacute;rim&egrave;tre couvre la strat&eacute;gie achats du groupe, les relations fournisseurs, les outils et le d&eacute;veloppement durable. Il mutualise tous les achats transverses, en particulier dans les portefeuilles strat&eacute;giques&nbsp;: IT, t&eacute;l&eacute;coms, &eacute;ditique, immobilier, bases de donn&eacute;es financi&egrave;res, communication et marketing.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lettredesachats.fr\">LA LETTRE DES ACHATS</a></font> </p>', '2010-03-02 12:38:21', 1, '', '', 'credit-agricole-sa-les-achats-etendent-leur-autorite-sur-les-filiales-publie-le-02-mars-2010', 'Une r&eacute;organisation du service achats de la banque vient d&rsquo;aboutir, pour marquer l&rsquo;extension de sa responsabilit&eacute; aux filiales en France et &agrave; l&rsquo;&eacute;tranger. Deux postes distincts sont cr&eacute;&eacute;s pour g&eacute;rer les relations avec les clients internes et les achats transverses.<!-- article_web chapeau fin-->'),
(66, 6, 'Un milliard d\'euros d\'économies en 2013 pour le groupe BPCE. Publié le 04 février 2010.', '<p _counted=\"undefined\">Lors de la publication de ses r&eacute;sultats annuels, le groupe BPCE a indiqu&eacute; que les synergies de co&ucirc;ts, du fait de la fusion entre les groupes Caisses d\'Epargne et Banque Populaire, permettraient de r&eacute;aliser pr&egrave;s d\'un milliard d&rsquo;euros d\'&eacute;conomies en 2013. L\'&eacute;tablissement bancaire pr&eacute;cise que ces gains seront issus en particulier de la fusion des organes centraux, de la consolidation des volumes d&rsquo;achats et de la mutualisation des infrastructures.</p>\r\n<p _counted=\"undefined\">Le volume d\'achats du groupe BPCE est estim&eacute; &agrave; l\'heure actuelle &agrave; plus de 4 milliards d\'euros.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr/\">Decision achats/</a></font></p>', '2010-03-04 19:27:21', 1, '', '', 'un-milliard-deuros-deconomies-en-2013-pour-le-groupe-bpce-publie-le-04-fevrier-2010', '<div>Ces &eacute;conomies seront issues en particulier de la fusion des organes centraux, de la consolidation des volumes d&rsquo;achats et de la mutualisation des infrastructures.</div>'),
(67, 6, 'Areva dépasse ses objectifs de réduction de coûts. Publié le 05 février 2010.', '570 millions d\'euros au titre de la performance et des achats (pour un objectif de d&eacute;part de 500 millions d\'euros) et 130 millions d\'euros sur les frais g&eacute;n&eacute;raux (pour un objectif de d&eacute;part de 100 millions d\'euros). D\'ici &agrave; 2012, le groupe entend r&eacute;duire de nouveau ses frais g&eacute;n&eacute;raux de 20%, soit de 270 millions d\'euros.\r\n<p _counted=\"undefined\">&nbsp;En 2009, Areva a r&eacute;alis&eacute; un chiffre d\'affaires de 14 milliards d\'euros, en hausse de 6,4%. Le r&eacute;sultat op&eacute;rationnel est de 501 millions d\'euros, en hausse de plus de 20%.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr\">Decision achats</a></font></p>\r\n<p _counted=\"undefined\">&nbsp;</p>', '2010-03-05 15:53:35', 1, '', '', 'areva-depasse-ses-objectifs-de-reduction-de-coûts-publie-le-05-fevrier-2010', 'Lors de la publication des r&eacute;sultats annuels du groupe Areva, la p-dg de l\'entreprise Anne Lauvergeon s\'est f&eacute;licit&eacute; des &eacute;conomies r&eacute;alis&eacute;es en 2009 :'),
(68, 14, 'Tisséo : L’implication amont après la réduction des coûts. Publié le 10 mars 2010.', '<p>D&eacute;but 2008, le service comprenait un p&ocirc;le commande publique, regroupant des juristes r&eacute;dacteurs de march&eacute;s. &laquo; Depuis, nous l&rsquo;avons compl&eacute;t&eacute; en cr&eacute;ant un p&ocirc;le achats. &Agrave; terme, nous visons une &eacute;quipe de six acheteurs sp&eacute;cialis&eacute;s par cat&eacute;rie &raquo;, explique le responsable des achats et de la commande publique de Tiss&eacute;o (166 millions d&rsquo;euros de budget).</p>\r\n<p>Apr&egrave;s un travail de d&eacute;finition et de r&eacute;daction de la politique achats, les premiers r&eacute;sultats ne se sont pas fait attendre : &laquo; En 2008 et 2009, nous avons travaill&eacute; les segments strat&eacute;giques &agrave; fort enjeu et les principales &eacute;conomies ont &eacute;t&eacute; g&eacute;n&eacute;r&eacute;es sur des march&eacute;s r&eacute;currents : maintenance des rames et des installations fixes du m&eacute;tro (contrats sur trois ans), fournitures de pi&egrave;ces d&eacute;tach&eacute;es pour les bus, carburant, r&eacute;gie publicitaire. En 2009, nous avons g&eacute;n&eacute;r&eacute; 800 000 euros d&rsquo;&eacute;conomies, sur 60 millions d&rsquo;achats &raquo;, d&eacute;taille Richard Gabry. Des objectifs qui seront accrus en 2010, avec un taux de couverture du p&eacute;rim&egrave;tre des d&eacute;penses de 90 %.</p>\r\n<p>Autre d&eacute;fi : l&rsquo;ouverture d&rsquo;une ligne de tramway. &laquo; Nous accompagnons la direction op&eacute;rationnelle tramway pour la conclusion des futurs contrats de maintenance des &eacute;quipements et des installations fixes. Notre grande force tient d&rsquo;ailleurs &agrave; cette &eacute;volutivit&eacute; du r&eacute;seau : deux autres lignes de tramway sont en projet, ce qui va augmenter notre puissance d&rsquo;achats &raquo;, conclut le responsable.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lettredesachats.fr\">Lettre des achats</a></font></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '2010-03-10 10:15:19', 1, '', '', 'tisseo-limplication-amont-apres-la-reduction-des-coûts-publie-le-10-mars-2010', 'Issu du secteur priv&eacute; et arriv&eacute; &agrave; la t&ecirc;te des achats de Tiss&eacute;o il y a deux ans, Richard Gabry a organis&eacute; les achats du r&eacute;seau toulousain de transports en commun. Outre la r&eacute;duction des co&ucirc;ts, il cherche &agrave; positionner les achats au plus pr&egrave;s des clients internes.<!-- article_web chapeau fin-->'),
(70, 6, '200 millions d’euros d’économies en 2009 pour Plastic Omnium. Publié le 19 mars 2010.', '&nbsp;Ce plan permet au sp&eacute;cialiste des &eacute;quipements pour l\'automobile et des produits et services pour les collectivit&eacute;s territoriales de compenser la baisse de son chiffre d\'affaires (-8,8% en 2009, &agrave; 2,46 milliards d\'euros) et surtout d\'am&eacute;liorer consid&eacute;rablement sa marge op&eacute;rationnelle (+44%, &agrave; 102 millions d\'euros, soit 4,2% du chiffre d\'affaires).\r\n<p _counted=\"undefined\">Le volume d\'achats annuel du groupe Plastic Omnium est estim&eacute; &agrave; 900 millioons d\'euros.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr\">Decision Achats</a></font></p>\r\n<p _counted=\"undefined\">&nbsp;</p>', '2010-03-19 12:00:20', 1, '', '', '200-millions-deuros-deconomies-en-2009-pour-plastic-omnium-publie-le-19-mars-2010', 'Le plan d\'&eacute;conomies baptis&eacute; &quot;PO 2009&quot;, lanc&eacute; en mars 2008, a permis au groupe Plastic Omnium de r&eacute;duire ses co&ucirc;ts de 19% et de r&eacute;aliser pr&egrave;s de 200 millions d\'euros d\'&eacute;conomies en 2009.'),
(71, 14, 'Vanatome : Des achats industriels face au défi de la croissance. Publié le 23 mars 2010.', '<p>Depuis d&eacute;but 2009, Vanatome a port&eacute; son effectif de 45 &agrave; 72&nbsp;personnes. Deux approvisionneurs ont &eacute;t&eacute; recrut&eacute;s et un acheteur. Cette ann&eacute;e, deux autres acheteurs sont recherch&eacute;s, avec des profils d&rsquo;ing&eacute;nieurs exp&eacute;riment&eacute;s. Le service achats compte actuellement sept personnes&nbsp;: un responsable des achats avec un acheteur dans un p&ocirc;le sous-traitance, ainsi que quatre approvisionneurs et un planificateur. Le montant des achats s&rsquo;est &eacute;lev&eacute; &agrave; 3,8&nbsp;millions d&rsquo;euros en 2009, pour 8,6&nbsp;millions de chiffre d&rsquo;affaires. En 2010, il devrait &ecirc;tre de 7&nbsp;millions d&rsquo;euros pour 17&nbsp;millions de chiffre d&rsquo;affaires.</p>\r\n<p>La progression de l&rsquo;activit&eacute; implique la recherche de nouveaux sous-traitants, les capacit&eacute;s de production de l&rsquo;entreprise devant &ecirc;tre accrues d&rsquo;environ 30&nbsp;%. &laquo;&nbsp;Le renouvellement du panel r&eacute;pond aussi &agrave; la n&eacute;cessit&eacute; de se remettre en cause, pour trouver des solutions permettant de r&eacute;duire les co&ucirc;ts&nbsp;&raquo;, note le directeur industriel de Vanatome, Patrick Artru. L&rsquo;implication du p&ocirc;le sous-traitance sert cet objectif aupr&egrave;s de la fabrication chez les fournisseurs, d&rsquo;une part, et en interface du bureau d&rsquo;&eacute;tudes de Vanatome, d&rsquo;autre part.</p>\r\n<p>Le processus de qualification de nouveaux sous-traitants prend environ six mois, ceux-ci devant &ecirc;tre eux-m&ecirc;mes qualifi&eacute;s par les clients&nbsp;: EDF, Areva ou DCNS par exemple. Vanatome a fait le choix de sourcer &agrave; 100&nbsp;% en Europe de l&rsquo;Ouest. &laquo;&nbsp;Nous n&rsquo;avons pas voulu aller dans les pays &Prime;low cost&Prime; pour des raisons de qualit&eacute;&nbsp;&raquo;, explique Patrick Artru. Pour s&eacute;curiser le poste de sous-traitance de soudure, Vanatome a par ailleurs pris la d&eacute;cision de r&eacute;aliser une op&eacute;ration de croissance externe. Elle devrait &ecirc;tre finalis&eacute;e d&rsquo;ici mi-mai.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lettredesachats.fr/\">La lettre des achats</a></font></p>\r\n<p>&nbsp;</p>', '2010-03-23 11:35:22', 1, '', '', 'vanatome-des-achats-industriels-face-au-defi-de-la-croissance-publie-le-23-mars-2010', 'Tr&egrave;s orient&eacute;s vers la sous-traitance, les achats de ce robinetier sp&eacute;cialiste du nucl&eacute;aire vont devoir r&eacute;pondre au doublement du chiffre d&rsquo;affaires attendu en 2010. Des embauches sont notamment pr&eacute;vues.<!-- article_web chapeau fin-->'),
(72, 6, 'Le groupe Fiat choisit Xerox pour optimiser ses impressions au niveau mondial. Publié le 31 mars 2010.', 'D&rsquo;une dur&eacute;e de 5 ans, ce contrat pr&eacute;voit &eacute;galement de r&eacute;pondre aux besoins d&rsquo;impression &eacute;ventuels d&rsquo;autres pays dans lesquels le constructeur est implant&eacute;. Objectif : r&eacute;duire de 30% les co&ucirc;ts op&eacute;rationnels de Fiat en mati&egrave;re d\'impression.\r\n<p _counted=\"undefined\">En collaboration avec Xerox, le groupe Fiat va ainsi mettre en place un service de gestion d&eacute;l&eacute;gu&eacute;e des impressions, lui permettant de g&eacute;rer l&rsquo;ensemble de ses d&eacute;penses d&rsquo;impression et de contr&ocirc;ler les co&ucirc;ts de son infrastructure informatique &agrave; l&rsquo;&eacute;chelle mondiale. Le groupe Fiat pourra analyser r&eacute;guli&egrave;rement ses performances via un tableau de bord ou des rapports d&rsquo;activit&eacute;, avec une vue compl&egrave;te sur ses co&ucirc;ts d&rsquo;impression. Xerox soutiendra &eacute;galement l&rsquo;engagement de Fiat dans le domaine du d&eacute;veloppement durable en utilisant des outils tels que son &quot;Sustainability calculator&quot; qui permet de r&eacute;duire de 50% les d&eacute;penses &eacute;nerg&eacute;tiques selon le fabricant de syst&egrave;mes d\'impression.</p>\r\n<p _counted=\"undefined\">Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr\">Decision achats</a></font></p>', '2010-03-31 11:31:06', 1, '', '', 'le-groupe-fiat-choisit-xerox-pour-optimiser-ses-impressions-au-niveau-mondial-publie-le-31-mars-2010', 'Le groupe <strong _counted=\"undefined\">Fiat</strong> vient de retenir <strong _counted=\"undefined\">Xerox Global Services</strong> pour g&eacute;rer les besoins en termes d\'impressions du constructeur automobile en Europe (Allemagne, France et Italie) et aux Etats-Unis.'),
(73, 14, 'La RATP teste avec succès un nouveau système d\'information achats. Publié le 06 avril 2010.', '<p>Mettre en production un projet SI-HA (syst&egrave;me d&rsquo;information achat) pour le compte de sa direction informatique, tel est le parti adopt&eacute; par la RATP. Une initiative de grande envergure qui r&eacute;pondait &agrave; deux besoins forts, mis en lumi&egrave;re &agrave; la suite d&rsquo;audits r&eacute;alis&eacute;s en 2005 et 2006 : d&rsquo;une part, la n&eacute;cessit&eacute; d&rsquo;outiller le sourcing fournisseur et le processus d\'achat en fonction des enjeux et du volume achat r&eacute;alis&eacute; par ce d&eacute;partement et d&rsquo;autre part, d&eacute;velopper des outils locaux plus performants dans les autres d&eacute;partements afin de les adapter &agrave; l&rsquo;organisation de la direction informatique.</p>\r\n<p>Aussi pour mettre en place ce nouveau syst&egrave;me d&rsquo;information achats, la direction informatique a r&eacute;dig&eacute; un cahier des charges, puis lanc&eacute; un appel &agrave; candidatures. Une comp&eacute;tition qui a &eacute;t&eacute; particuli&egrave;rement rude car c&rsquo;est par le biais d&rsquo;un appel d&rsquo;offres europ&eacute;en que la consultation a &eacute;t&eacute; lanc&eacute;e.</p>\r\n<p><strong>Cr&eacute;ation d&rsquo;une maquette</strong></p>\r\n<p>&laquo;D&egrave;s cette &eacute;tape, le client a manifest&eacute; clairement ses exigences comme la r&eacute;alisation d&rsquo;une maquette qui a constitu&eacute; un jalon important du processus de s&eacute;lection&raquo;, explique Jean-Philippe Nowakowski, directeur produits d&rsquo;Oalia, l&rsquo;&eacute;diteur qui a remport&eacute; le march&eacute;. &laquo;Si la r&eacute;alisation d&rsquo;une maquette sophistiqu&eacute;e a nfl&eacute; les co&ucirc;ts de gestion de l&rsquo;appel d&rsquo;offres, elle a constitu&eacute; le meilleur moyen pour prouver notre savoir-faire tout en offrant au client l&rsquo;opportunit&eacute; de se rapprocher le plus possible du r&eacute;sultat final&raquo;, ajoute Rapha&euml;l Robillard, directeur commercial d&rsquo;Oalia.</p>\r\n<p>Pour Antoine Prevost, responsable achat du d&eacute;partement informatique de la RATP, &laquo;le dossier d&rsquo;Oalia a pr&eacute;sent&eacute; les meilleures garanties de succ&egrave;s pour un prix comp&eacute;titif &raquo;. Et apr&egrave;s la mise en production du projet, la RATP s&rsquo;est d&eacute;clar&eacute;e largement satisfaite du r&eacute;sultat : &laquo;Oalia dispose d&rsquo;un v&eacute;ritable savoir-faire en ce qui concerne la mod&eacute;lisation de processus d&rsquo;achat complexes et cela avec un haut degr&eacute; de finition. Techniquement, il a su aussi se fondre dans le syst&egrave;me d&rsquo;information de la RATP, que ce soit en mati&egrave;re d&rsquo;interfa&ccedil;age avec notre ERP ou de respect d&rsquo;imp&eacute;ratifs techniques, comme par exemple le support de la base de donn&eacute;es open source PostgreSQL&raquo;, d&eacute;taille Antoine Prevost.</p>\r\n<p><strong>Un outil exploit&eacute; par 700 utilisateurs</strong></p>\r\n<p>Pour favoriser un pilotage optimum du projet, Oalia a opt&eacute; pour une d&eacute;marche bien &eacute;tudi&eacute;e : &laquo;Lorsque nous devons r&eacute;aliser un projet d&rsquo;envergure comme celui de la RATP, nous examinons la possibilit&eacute; de faire &eacute;voluer simultan&eacute;ment notre logiciel standard pour coller au plus pr&egrave;s du besoin client. Pour ce dernier, cela signifie moins de d&eacute;veloppement sp&eacute;cifique et un param&eacute;trage plus rapide du progiciel&raquo; explique Jean-Philippe Nowakowski.</p>\r\n<p>Dans un premier temps, ce sont plus de 700 utilisateurs qui sont amen&eacute;s &agrave; utiliser l&rsquo;application.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr\">Decision achats</a></font></p>\r\n<p>&nbsp;</p>', '2010-04-06 15:19:40', 1, '', '', 'la-ratp-teste-avec-succes-un-nouveau-systeme-dinformation-achats-publie-le-06-avril-2010', '<strong>La direction informatique de la RATP a fait appel &agrave; Oalia pour mettre en place un nouveau syst&egrave;me d\'information achats. Le r&eacute;sultat s\'av&egrave;re au final concluant.</strong>');
INSERT INTO `actualite` (`id`, `image_id`, `titre`, `description`, `created`, `is_active`, `keywords`, `source`, `slug`, `apercu`) VALUES
(75, 6, 'DHL renforce son service DHL Import Express. Publié le 21 mai 2010.', '<p>DHL affine son offre DHL Import Express. D&eacute;sormais, les entreprises fran&ccedil;aises ont la possibilit&eacute; de recevoir leurs marchandises avant 9h pour 90 pays (contre 55 pays auparavant) et avant 12h pour 135 pays dans le monde (contre 77 pays auparavant).&nbsp;&quot;Avec ce service, la gestion des achats &agrave; l&rsquo;&eacute;tranger est facilit&eacute;e. Id&eacute;al dans le cadre d&rsquo;importations r&eacute;guli&egrave;res, DHL Import Express permet aux entreprises de ma&icirc;triser leurs co&ucirc;ts et leurs d&eacute;lais et d&rsquo;agir en tout point de leur cha&icirc;ne d&rsquo;approvisionnement&quot;, se f&eacute;licite Christophe Dem&ecirc;me, directeur commercial et marketing de DHL International Express.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.decision-achats.fr\">Decision achats</a></font></p>', '2010-05-21 10:40:18', 1, '', '', 'dhl-renforce-son-service-dhl-import-express-publie-le-21-mai-2010', '<strong>D&eacute;sormais, les entreprises fran&ccedil;aises ont la possibilit&eacute; de recevoir leurs marchandises avant 9h pour 90 pays (contre 55 pays auparavant) et avant 12h pour 135 pays (contre 77 pays auparavant). </strong>'),
(76, 14, 'Achats hospitaliers : Important marché de formation en vue. le 25 mai 2010.', '<p>L&rsquo;Association nationale pour la formation permanente du personnel hospitalier (ANFH) vient de reconduire son partenariat avec le R&eacute;seau des acheteurs hospitaliers d&rsquo;Ile-de-France (Resah-Idf) pour lancer un appel d&rsquo;offres en mati&egrave;re de formation professionnelle.</p>\r\n<p>Cet appel d&rsquo;offres, organis&eacute; en deux cat&eacute;ries de prestations comprenant un total de 125 lots, permettra d&rsquo;attribuer des accords-cadres de trois ans &agrave; plusieurs prestataires. Concernant la cat&eacute;rie &laquo;&nbsp;formation en intra&nbsp;&raquo;, plus de 50 &eacute;tablissements publics se sont r&eacute;unis au sein d&rsquo;un groupement de commande r&eacute;gional pour s&eacute;lectionner des attributaires pour chacun des 60 lots, l&rsquo;ANFH agissant comme coordonnateur du groupement. L&rsquo;organisation du processus d&rsquo;achat est l&eacute;g&egrave;rement diff&eacute;rente pour la seconde cat&eacute;rie, celle de la formation inter&eacute;tablissement. Le Resah-Idf agira, dans ce cas, comme centrale d&rsquo;achats, et chacun des 65 lots n&rsquo;ira qu&rsquo;&agrave; un seul attributaire. La date limite de d&eacute;p&ocirc;t des offres est fix&eacute;e au 30&nbsp;juin 2010 pour une s&eacute;lection d&eacute;finitive des prestataires en janvier 2011.</p>\r\n<p>L&rsquo;un des objectifs affich&eacute;s par le Resah-Idf, GIE membre du Pacte PME qui regroupe pr&egrave;s de 120 &eacute;tablissements, pour un potentiel annuel d&rsquo;achats de plus d&rsquo;un milliard d&rsquo;euros, est d&rsquo;obtenir des r&eacute;ductions de prix par le biais de l&rsquo;effet volume.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lettredesachats.fr\">La lettre des achats</a></font></p>\r\n<p>&nbsp;</p>', '2010-05-25 09:11:31', 1, '', '', 'achats-hospitaliers-important-marche-de-formation-en-vue-le-25-mai-2010', 'Sans formation, point de salut ; et sans les achats, point d&rsquo;&eacute;mulation entre les formateurs. C&rsquo;est sans doute ce que se sont dits le Resah-Idf et l&rsquo;ANFH lorsqu&rsquo;ils ont nou&eacute;, d&eacute;but 2009, leur partenariat achats. Attention, appel d&rsquo;offres.<!-- article_web chapeau fin-->'),
(77, 14, 'Schneider Electric : Encore peu d\'achats globaux depuis la Chine, Publié le 08/06/2010', '<p>Entre 25 et 30&nbsp;% de l&rsquo;effectif achats total du groupe Schneider Electric (1&nbsp;300&nbsp;personnes) est actuellement pr&eacute;sent sur la r&eacute;gion Asie-Pacifique. &laquo;&nbsp;Cette zone est h&eacute;t&eacute;rog&egrave;ne&nbsp;: une partie est mature, le Japon et le Pacifique&nbsp;; une autre est en d&eacute;veloppement, elle comprend le Sud-Est asiatique, l&rsquo;Inde et la Chine&nbsp;&raquo;, explique le directeur des achats Ren&eacute; Orlandi. &laquo;&nbsp;Notre pr&eacute;sence achats en Chine a accompagn&eacute; le rythme soutenu de nos implantations industrielles depuis le milieu des ann&eacute;es 1990&nbsp;&raquo; pr&eacute;cise-t-il. Cette croissance ne devrait pas se d&eacute;mentir puisque le groupe a annonc&eacute; derni&egrave;rement son ambition d&rsquo;y doubler son chiffre d&rsquo;affaires.</p>\r\n<p>Pour l&rsquo;instant, les acheteurs y sont essentiellement tourn&eacute;s vers les vingt-deux&nbsp;usines et les six&nbsp;centres de distribution locaux. &laquo;&nbsp;Nos acheteurs en Chine ach&egrave;tent essentiellement pour les besoins locaux, confirme Ren&eacute; Orlandi. Nous avons encore tr&egrave;s peu de fournisseurs globaux sourc&eacute;s &agrave; partir de la Chine. Seuls certains composants en sont import&eacute;s, mais en faible proportion.&nbsp;&raquo;</p>\r\n<p>La croissance de l&rsquo;activit&eacute; dans l&rsquo;empire du Milieu ouvre des perspectives aux achats, mais pour le directeur des achats, qui souhaite &laquo;&nbsp;verticaliser la fonction&nbsp;&raquo;, elle repr&eacute;sente aussi un d&eacute;fi en termes de coh&eacute;sion. &laquo;&nbsp;Le nombre d&rsquo;expatri&eacute;s est aujourd&rsquo;hui tr&egrave;s r&eacute;duit. Nous privil&eacute;gions les ressources locales &agrave; tous les niveaux de responsabilit&eacute;&nbsp;&raquo;, indique-t-il.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"&quot;http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/45/58/document_article_web.phtml&quot;&quot;\" href=\"&quot;http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/45/58/document_article_web.phtml&quot;&quot;\">http://www.lettredesachats.fr/services/lda_web/derniere_heure/e-docs/00/00/45/58/document_article_web.phtml</a></font></p>', '2010-06-08 10:14:06', 1, '', '', 'schneider-electric-encore-peu-dachats-globaux-depuis-la-chine-publie-le-08/06/2010', 'Le groupe fran&ccedil;ais, qui vient de relocaliser &agrave; P&eacute;kin son si&egrave;ge Asie-Pacifique, dispose dans cette zone d&rsquo;importantes ressources achats. Leur activit&eacute; est encore tr&egrave;s tourn&eacute;e vers les besoins locaux.<!-- article_web chapeau fin-->'),
(78, 14, 'Renault-Nissan : un guide RSE pour les fournisseurs de l’alliance', '<p>Ce document a &eacute;t&eacute; pr&eacute;sent&eacute; le 4&nbsp;juin, au Japon, lors d&rsquo;une convention devant 900&nbsp;fournisseurs, et est actuellement adress&eacute; par mail aux 200 principaux fournisseursde l&rsquo;alliance Renault-Nissan. Il est aussi disponible sur les sites Internet du groupe. Plus qu&rsquo;une charte, il s&rsquo;agit d&rsquo;un guide RSE (responsabilit&eacute; soci&eacute;tale de l&rsquo;entreprise)&nbsp;: droits fondamentaux des salari&eacute;s, respect de l&rsquo;environnement, confidentialit&eacute; et &eacute;thique. &laquo;&nbsp;Nous avons jug&eacute; essentiel de d&eacute;ployer un r&eacute;f&eacute;rentiel pour l&rsquo;ensemble des fournisseurs de l&rsquo;alliance, qui d&eacute;finisse des principes communs aux deux marques. C&rsquo;est un document de synth&egrave;se. Il ne se substitue pas &agrave; la d&eacute;claration des droits sociaux environnementaux que l&rsquo;ensemble des fournisseurs de Renault ont d&eacute;j&agrave; sign&eacute;&nbsp;&raquo;, explique Fran&ccedil;oise Le Poulichet, chef de service co-innovation et d&eacute;veloppement durable &agrave; la direction des achats de Renault.</p>\r\n<p>Dans le guide RSE qu&rsquo;elle a pr&eacute;par&eacute; avec son homologue chez Nissan figurent d&rsquo;ailleurs de nouveaux engagements. Notamment l&rsquo;exigence de fournir aux constructeurs une information compl&egrave;te sur ces produits et services. Cette exigence d&rsquo;information concerne bien s&ucirc;r les produits potentiellement polluants r&eacute;f&eacute;renc&eacute;s Reach, mais les fournisseurs sont incit&eacute;s &agrave; aller au-del&agrave; en adoptant une attitude proactive.</p>\r\n<p>La suite du projet est une d&eacute;marche d&rsquo;auto&eacute;valuation demand&eacute;e aux fournisseurs de RNPO. Elle devra se faire sur la base de r&eacute;f&eacute;rentiels cibl&eacute;s par familles d&rsquo;achats et par r&eacute;gions, &eacute;labor&eacute;s par Ecovadis. Une version pilote est actuellement test&eacute;e aupr&egrave;s de certains fournisseurs.</p>\r\n<p>Source: <font face=\"Arial\"><a target=\"_blank\" href=\"http://www.lettredesachats.fr\">La lettre des achats</a></font></p>', '2010-06-15 18:08:15', 1, '', '', 'renault-nissan-un-guide-rse-pour-les-fournisseurs-de-lalliance', 'Les deux constructeurs ont &eacute;tabli, via RNPO (Renault Nissan Purchasing Organisation), une charte RSE commune &agrave; destination de leurs fournisseurs. Elle fixe des principes plus ambitieux en termes de qualit&eacute; et de communication de l&rsquo;information.<!-- article_web chapeau fin-->'),
(80, NULL, 'GEFCO ANNONCE L\'ACQUISITION DE GLT, ACTEUR MAJEUR DES LIAISONS ENTRE L\'EUROPE ET LE MAROC', 'Courbevoie, le 11 janvier 2018 – Le Groupe GEFCO, acteur mondial de la logistique industrielle et leader européen de la logistique automobile, annonce aujourd\'hui l\'acquisition de l\'entreprise espagnole GLT, spécialiste des transports entre l\'Europe et le Maroc. Cette acquisition est très stratégique pour GEFCO, qui renforce ainsi sa présence dans la région alors même que le commerce entre l\'Europe et le Maroc est en plein essor dans les secteurs de l\'automobile, de la grande distribution et de la mode. L\'accord entre GLT et GEFCO est soumis à l’approbation des autorités réglementaires concernées. ', '2018-01-18 18:12:30', 1, NULL, 'https://www.gefco.net/fr/actualite/gefco-annonce-lacquisition-glt-acteur-majeur-liaisons-entre-leurope-maroc', 'gefco-annonce-lacquisition-de-glt-acteur-majeur-des-liaisons-entre-leurope-et-le-maroc', ''),
(81, 6, 'Sourcing industriel : Quelles tendances et conditions pour réussir un sourcing efficace ?  ', 'Quelles sont les motivations qui guident les directions achats dans leur stratégie de sourcing? Quels sont les freins et les contraintes auxquels elles sont confrontées? Et comment composer avec ces éléments pour apporter plus de valeur ajoutée à l\'entreprise ?\r\n\r\n', '2018-01-18 18:14:43', 1, NULL, 'http://www.decision-achats.fr/Thematique/tendances-achats-1039/Breves/Sourcing-industriel-Quelles-tendances-conditions-reussir-sourcing-efficace-326556.htm?recherche=sourcing#HMf2VvKzmRyTxsK7.97', 'sourcing-industriel-quelles-tendances-et-conditions-pour-reussir-un-sourcing-efficace-?-', ''),
(82, 6, 'Les tendances et priorités des départements achats pour 2018 ', 'Les départements achats, moins centrés sur leur objectifs de réduction des coûts, veulent chouchouter leurs fournisseurs et s\'investir d\'avantage en termes de RSE. C\'est ce que révèle notamment la 8e édition de l\'étude \"Tendances et priorités des départements achats\". Leur cote d\'amour va grimper!', '2018-01-23 09:35:51', 1, NULL, 'http://www.decision-achats.fr/Thematique/tendances-achats-1039/Breves/Les-tendances-priorites-departements-achats-2018-326315.htm#bcMTIIs4w6jRP1Sz.97', 'les-tendances-et-priorites-des-departements-achats-pour-2018-', ''),
(83, 6, 'Visibilité sur les dépenses et les habitudes achats de votre entreprise: leur donner du sens et comm', 'Le service achats doit avoir la visibilité sur les dépenses et les habitudes achats de son entreprise. Il est important qu’il se souvienne qu’il n’améliore pas la visibilité pour son seul intérêt mais bien pour améliorer la compréhension de tous les décideurs de l’organisation.', '2018-01-24 15:30:38', 1, NULL, 'http://www.decision-achats.fr/Thematique/process-outils-1037/breve/visibilite-sur-les-depenses-et-les-habitudes-achats-de-votre-entreprise-leur-donner-du-sens-et-communiquer-326374.htm#ik6xw7f5ovUI8BBl.97', 'visibilite-sur-les-depenses-et-les-habitudes-achats-de-votre-entreprise-leur-donner-du-sens-et-comm', ''),
(84, 7, 'GLOBAL INDUSTRIE', 'Les pouvoirs publics ont milité pour la création en France d’un Grand événement Européen tourné vers l’Industrie du Futur.\r\nLe groupe GL events, animateur des communautés concernées, a saisi l’opportunité de réunir tous ces acteurs du 27 au 30 mars 2018 sur le Parc des Expositions de Paris Nord Villepinte...', '2018-01-25 10:26:18', 1, NULL, 'http://www.tolexpo.com/global-industrie', 'global-industrie', 'UNE DÉMARCHE OFFENSIVE AU SERVICE DE L\'INDUSTRIE'),
(85, 12, 'Pièces de rechange Kramp France booste sa logistique', 'La filiale française du groupe néerlandais Kramp, spécialiste de la distribution de pièces détachées et de rechange pour le monde agricole européen, a accueilli ce mois-ci ses principaux clients sur son centre logistique de Poitiers (24.000 m2). Les quelques 140 personnes qui y travaillent en 2x8 préparent en moyenne 5.000 colis/jour, et 10.000 en pleine saison, avec des pics pouvant atteindre les 20.000 colis/jour. L\'un des buts de l\'opération, renouvelée tous les quatre ans, était de montrer aux clients comment la logistique de Kramp France lui permet de tenir la promesse de livraison en J+1 sur toute la France avant 13h de toute commande passée la veille avant 17h30. En tout cas pour les 127.500 références en stock, les quelque 350.000 autres références accessibles via le web étant livrées en J+2, via un réseau de crossdock reliant ses principaux sites européens. Cet avantage logistique de celui qui se veut l\'Amazon du monde agricole a sans aucun doute contribué à son succès, avec un CA France multiplié par 3,5 en 8 ans (+15% en 2017, à 84 M€) et un objectif de dépasser les 100 M€ en 2019. C\'est pour cette raison que Kramp France met régulièrement à niveau son centre logistique de Poitiers. Les investissements de 2017 (environ 6 M€), ont porté sur la construction d\'une quatrième cellule de 6000 m2 équipée de racks en allées étroites avec 2 et bientôt quatre chariots tridirectionnels filoguidés Jungheinrich (il y en avait déjà 4 dans le bâtiment 1). Le bâtiment 2, dédié au picking sur étagère avec trois niveaux de mezzanines et 24 gares, s\'est également enrichi de 50.000 emplacements supplémentaires (sur un total de 150.000). A cela s\'ajoute également des machines de formage et de fermeture automatique de cartons fournis par la société française e3neo, rachetée par Ranpack en mars dernier (voir NL n°2463). « Nous avons décidé de l\'agrandissement en 2016, alors que notre CA connaissait une croissance de 20% depuis plusieurs années, car nous commencions à ne plus avoir de place en espace de stockage » nous a confié Aurélie Mattmann, Directrice logistique pour la France et l\'Espagne, qui a d\'ailleurs travaillé plusieurs années comme responsable logistique chez Amazon. Le CA de Kramp France continuant sa progression à deux chiffres, il y a des chances pour que le centre de Poitiers n\'ait pas fini sa croissance. « Nous avons la possibilité de faire sept bâtiments au total » indique Aurélie Mattmann, qui réfléchit déjà avec ses équipes à l\'éventualité d\'investir à moyen terme dans des systèmes à navettes (comme l\'ont fait les entrepôts de Kramp aux Pays-Bas et en Allemagne, voir NL n°2631). JLR\r\nPhoto : Aurélie Mattmann, Directrice logistique \r\nde Kramp France', '2018-01-26 14:37:20', 1, NULL, 'http://www.supplychainmagazine.fr/NL/2018/2642/', 'pieces-de-rechange-kramp-france-booste-sa-logistique', 'La filiale française du groupe néerlandais Kramp, spécialiste de la distribution de pièces détachées et de rechange pour le monde agricole européen, a accueilli ce mois-ci ses principaux clients sur son centre logistique de Poitiers (24.000 m2). '),
(86, 12, 'Parier sur le digital pour conserver le leadership', 'La semaine dernière, Carrefour dévoilait son plan de transformation visant d\'une part à réduire ses coûts d\'exploitation, et d\'autre part à renforcer ses positions dans différents domaines comme l\'e-commerce et les produits bio (voir NL n°2640). Pour atteindre ces objectifs, l\'enseigne investit dans le digital et accélère la mise en œuvre de l\'automatisation sur ses plates-formes logistiques. Lors de cette annonce, certains commentateurs ont surtout retenu le volet social (la suppression de 2.400 postes) et la recherche d\'économies laissant entendre que le géant de la distribution pouvait connaître une période difficile. Il n\'en n\'est rien. Même si certains magasins faiblissent et que les pure players du e-commerce grignotent chaque année des parts de marché, force est de constater que Carrefour reste solide. Ce qui se passe aujourd\'hui relève davantage d\'une réorganisation en prévision des grandes batailles à venir, que d\'une crise aigüe pour laquelle il faudrait trouver des remèdes. ', '2018-01-29 15:31:04', 1, NULL, 'http://www.supplychainmagazine.fr/NL/2018/2643/', 'parier-sur-le-digital-pour-conserver-le-leadership', 'La semaine dernière, Carrefour dévoilait son plan de transformation visant d\'une part à réduire ses coûts d\'exploitation, et d\'autre part à renforcer ses positions dans différents domaines comme l\'e-commerce et les produits bio (voir NL n°2640). Pour atteindre ces objectifs....'),
(87, 6, 'Synchronisation des processus achats et comptables: quels enjeux ? quels bénéfices ?', 'La synchronisation des processus achats et comptables…entre réduction des coûts et visibilité accrue Comme le souligne le rapport PayStream, presque toutes les entreprises doivent désormais faire plus dans un laps de temps de plus en plus reduit. Sans augmentation des effectifs, l’efficacité reste le seul levier à actionner pour parvenir aux gains souhaités. La synchronisation des processus achats et comptable est synonyme d’efficacité. Avec des processus unifiés et rationalisés, \r\n', '2018-01-30 11:06:06', 1, NULL, 'http://www.decision-achats.fr/Thematique/process-outils-1037/breve/synchronisation-des-processus-achats-et-comptables-quels-enjeux-quels-benefices-327156.htm#MsTtHdvts7qryIGT.97', 'synchronisation-des-processus-achats-et-comptables-quels-enjeux-?-quels-benefices-?', 'Intégrer, optimiser, partager…Determine consacre un grand nombre de ses contenus et ressources à ce sujet majeur : comment faire en sorte que tous les services de mon entreprise soient sur la même longueur d’onde, partagent les informations et collaborent?'),
(88, 9, ' Le Groupe allemand PRETTL investit 8 millions d’euros dans une nouvelle usine à Tanger', 'Selon les données présentées lors de la cérémonie de pose de la première pierre, cette usine, qui prévoit la création de 800 postes d’emploi, aura une capacité de production globale estimée à 30 millions de pièces à long termes. La première tranche de cette usine, qui s’étalera sur une superficie dépassant les 26.000 m2, devra être achevée l’année prochaine avec une capacité de production atteignant les 15 millions de pièces, alors que l’exploitation de la deuxième tranche devra débuter en 2021 avec une capacité de production similaire...', '2018-02-01 09:06:26', 1, NULL, 'http://maroc-diplomatique.net/industrie-automobile-groupe-allemand-prettl-investit-8-millions-deuros-nouvelle-usine-tanger/', 'le-groupe-allemand-prettl-investit-8-millions-deuros-dans-une-nouvelle-usine-a-tanger', 'Le Groupe allemand PRETTL spécialisé dans la fabrication de pièces automobiles a annoncé, mardi à Tanger, la construction d’un nouveau site industriel à Tanger  »Automotive City » pour un investissement de 8 millions d’euros.'),
(89, 11, 'Gefco sort du silence et change de marque', 'En 2012 le Groupe PSA Peugeot Citroën annonçait qu’il cédait pour 800M€, 75% de sa filiale logistique Gefco à la compagnie des chemins de fer Russe RZD. Depuis, le groupe ne s’est pratiquement jamais exprimé, sur les conséquences de ce nouvel actionnariat sur la stratégie du groupe notamment à l’international.\r\n\r\nPendant cette période, le nom du groupe a surtout été associé aux plans de sauvegarde de l’emploi qui ont émaillé la réorganisation douloureuse de la filiale française. En sortant du silence pour la première fois depuis 5 ans Luc Nadal président du directoire et Emmanuel Arnaud , Vice-président exécutif Commerce & Marketing, veulent porter une marque nouvelle emblématique d’un changement profond... qu’il n’est pas si simple d’identifier...', '2018-02-01 09:44:40', 1, NULL, 'http://www.strategieslogistique.com/Gefco-sort-du-silence-et-change-de,7601', 'gefco-sort-du-silence-et-change-de-marque', 'Luc Nadal, président du directoire de Gefco a dévoilé le 30 janvier la nouvelle identité du groupe. Ce sera désormais « Gefco Partners unlimited ». Cette annonce prend un sens particulier pour l’ancienne filiale de PSA Peugeot Citroën, car elle signe la fin d’un « silence radio » de 5 ans décrété au moment de la prise de participation majoritaire des chemins de fer Russes RZD dans Gefco et du lancement d’une importante transformation de l’entreprise.'),
(90, 8, 'Aéronautique : Thyssenkrupp ouvrira un nouveau site à Casablanca', 'Le groupe allemand Thyssenkrupp Aerospace a annoncé jeudi l’ouverture d’un nouveau site de production à Casablanca. \"La nouvelle usine offrira des services de stockage et de traitement des matériaux, explique la société. L’unité aérospatiale de Thyssenkrupp Materials Services entretient déjà des relations d’affaires fructueuses avec de nombreuses sociétés aérospatiales basées en Afrique du Nord par le biais de leurs autres unités opérationnelles internationales, ajoute la société. L’ouverture de ce site permettra à un grand nombre de fabricants implantés dans la région de déléguer leur gestion de la chaîne d’approvisionnement en matières premières à Thyssenkrupp Aerospace. Cela permettra notamment d’optimiser le processus de livraison.', '2018-02-01 18:49:34', 1, NULL, 'http://www.leconomiste.com/flash-infos/aeronautique-thyssenkrupp-ouvrira-un-nouveau-site-casablanca?utm_source=Base+active&utm_campaign=36e59758ed-EMAIL_CAMPAIGN_2018_02_01&utm_medium=email&utm_term=0_cea1eb8aa6-36e59758ed-34254199', 'aeronautique-thyssenkrupp-ouvrira-un-nouveau-site-a-casablanca', 'Le groupe allemand Thyssenkrupp Aerospace a annoncé jeudi l’ouverture d’un nouveau site de production à Casablanca...'),
(91, 12, 'Supports de manutention Mc Cain reprend le contrôle de la gestion de ses palettes Europe', 'Il y a encore un an, Mc Cain France, la filiale du géant canadien des frites surgelées, gérait l\'échange de ses palettes Europe par extraction de données de son ERP (en l\'occurrence SAP) vers Excel, puis envoi à chacun de ses 50 transporteurs, du décompte du nombre de palettes chargées et rendues (à confronter avec leurs propres données). Le dispositif était chronophage et entraînait un décalage de 1 à 3 mois entre le moment où les transporteurs prenaient en charge la marchandise et la réception de leurs décomptes de palettes. C\'est pour cette raison que Mc Cain France a choisi fin 2016 de se faire accompagner par la start-up lilloise Opalean, qui a développé une plate-forme commune de partage d\'informations en temps réel pour optimiser la gestion de leurs supports de manutention. Les transporteurs peuvent ainsi valider ou émettre immédiatement une alerte en cas de désaccord sur le décompte palettes.', '2018-02-08 14:20:56', 1, NULL, 'http://www.supplychainmagazine.fr/NL/2018/2651/', 'supports-de-manutention-mc-cain-reprend-le-controle-de-la-gestion-de-ses-palettes-europe', 'Il y a encore un an, Mc Cain France, la filiale du géant canadien des frites surgelées, gérait l\'échange de ses palettes Europe par extraction de données de son ERP '),
(92, 5, 'L’espagnol SAISA arrive au Maroc', 'En effet, ce spécialiste de la fabrication et distribution des produits chimiques solides à usage industriel vient de créer SAISA Maroc, une entité basée à Casablanca et qui aura pour mission d’écouler les produits de sa maison mère sur le territoire marocain.\r\n\r\nCette première implantation du groupe SAISA en dehors de la péninsule ibérique en 31 ans d’existence vise principalement les industriels opérant au Maroc dans les acteurs de l’agroalimentaire, des détergents et des produits chimiques sachant qu’il s’agit des principaux usages professionnels du bicarbonate de sodium et du carbonate de sodium où SAISA dispose d’une part de marché importante sur son marché domestique. D’autres produits seront introduits graduellement par SAISA Maroc y compris ceux destinés au domaine de la santé et de l’industrie pharmaceutique...', '2018-02-16 13:04:52', 1, NULL, 'http://www.challenge.ma/lespagnol-saisa-arrive-au-maroc-93377/', 'lespagnol-saisa-arrive-au-maroc', 'Le groupe espagnol Suministros Agropecuarios Internacionales SA (SAISA) pose son baluchon au Maroc.'),
(93, 12, 'Supports de manutention Réajustement en vue du prix de la palette bois', 'Signe tangible de reprise économique, le marché de \r\nla palette en France et dans les principaux pays européens se porte bien : 115,8 millions de palettes EUR / EPAL fabriquées et réparées de palettes, c\'est un record en 2017, avec une croissance de +10%. Mais dans un contexte de forte demande en bois et en sciages, la Commission Palettes Sypal de la FNB (Fédération Nationale du Bois) rappelle que les hausses des prix des sciages à palettes qui avaient été annoncées à l\'automne 2017 se sont confirmées et que l\'augmentation du prix du bois se poursuivant (il pèse pour 70% du prix de vente d\'une palette)...', '2018-02-20 12:56:39', 1, NULL, 'http://www.supplychainmagazine.fr/NL/2018/2659/', 'supports-de-manutention-reajustement-en-vue-du-prix-de-la-palette-bois', 'Supports de\r\nmanutention\r\nRéajustement\r\nen vue du prix\r\nde la palette\r\nbois'),
(94, 6, 'Isagri : une révolution (achats) à tous les étages ', 'L\'éditeur de logiciels Isagri opère actuellement un virage à 180°. Objectif : donner aux achats un rôle beaucoup plus stratégique, harmoniser l\'ensemble des processus à l\'échelle du groupe pour optimiser les tâches et gagner en efficacité.', '2018-02-22 10:08:02', 1, NULL, 'http://www.decision-achats.fr/Thematique/decideurs-achats-1035/Breves/Retour-experiences-chez-Isagri-revolution-tous-etages-327835.htm', 'isagri-une-revolution-(achats)-a-tous-les-etages-', 'L\'éditeur de logiciels Isagri opère actuellement un virage à 180°. '),
(96, 6, 'Management : se changer soi-même pour changer ses équipes', 'Alors que le monde du travail évolue très vite, que les techniques changent, que l\'aspect collaboratif prend de plus en plus d\'importance, les managers doivent adapter leurs pratiques s\'ils veulent rester légitimes. Mais faut-il pour autant révolutionner le management et changer tous les process de son entreprise ?\r\n\r\nOutre la difficulté d\'une telle mission, encore plus dans un grand groupe, Frédéric Rey-Millet, dirigeant d\'EthiKonsulting, qui organise le Hackathon du Management, souligne qu\'avant de \"hacker\" leur entreprise, les managers doivent d\'abord concevoir des outils concrets, qui les concernent directement : \"Avant de changer le système, la culture, les autres... il faut commencer par se changer soi-même. Sinon, les outils conçus ne seront pas mis en oeuvre\", explique-t-il.\r\n\r\nCécil Dijoux, coach lean et agile, souligne également que c\'est souvent en améliorant les méthodes de production qu\'on améliore le relationnel, là où beaucoup d\'entreprises cherchent à améliorer les relations entre leurs équipes dans l\'espoir d\'améliorer la production. D\'ailleurs, \"beaucoup d\'entreprises pensent qu\'il faut changer la culture pour changer les pratiques. Or, le lean management et l\'agilité montrent l\'inverse : il faut changer les pratiques pour changer la culture\", affirme-t-elle.\r\n\r\nAinsi, quand un manager veut entraîner ses équipes sur la voie du changement, il doit lui-même se remettre en question. Face à des personnes réticentes, il vaut mieux privilégier une attitude ouverte, demander à \"tester\", à avoir le \"bénéfice du doute\" plutôt que de chercher à tout prix une adhésion totale a priori. Surtout, il faut accepter que tout le monde ne suive pas : \"il faut éviter la bêtise d\'aller chercher les réfractaires à tout prix, c\'est chronophage et peu efficace \", assure Cécil Dijoux.....', '2019-11-05 18:27:14', 1, NULL, 'https://www.decision-achats.fr/Thematique/rh-1234/Breves/Management-changer-soi-meme-changer-ses-equipes-343744.htm', 'management-se-changer-soi-meme-pour-changer-ses-equipes', 'Peut-on changer une organisation, un système ou une culture d\'entreprise sans, au préalable, changer sa façon de manager ? C\'est à cette question qu\'a tenté de répondre la 3e édition du Hackathon du Management, organisé par EthiKonsulting.'),
(97, 6, 'Achats innovants : le tremplin des marketplaces', 'En septembre 2018, la centrale d\'achat du groupe hôtelier NH Hotel lance sa propre marketplace aux côtés de Mirakl, le spécialiste des solutions digitales pour ce type de projets. C\'est avec cet exemple que s\'est ouvert le 26 novembre dernier l\'édition 2019 des Enjeux de l\'Innovation BtoB, largement consacré à la transformation digitale et à l\'explosion des places de marché.\r\n\r\n\"Sur de très nombreux marchés, on assiste actuellement à une démultiplication des acteurs en présence concernant un même produit ou service. Les canaux d\'achats se diversifient, et la technologie joue un rôle prépondérant dans cette évolution, notamment parce que les jeunes générations de travailleurs veulent reproduire leurs habitudes personnelles dans la sphère professionnelle\", constate Magali Testard, senior partner au sein du cabinet de conseil en stratégie Roland Berger.\r\n\r\nLes directions achats sont souvent décrites comme des gestionnaires de coûts et de risques. Mais désormais, elles sont également amenées à chercher des relais de croissance. \"Elles se positionnent sur de la création de valeur, de la génération de nouveaux revenus\", poursuit-elle. Concrètement, le développement des marketplaces s\'inscrit dans cette logique. Il s\'agit d\'en faire des plateformes de création de services pour les utilisateurs....', '2019-12-05 18:11:14', 1, NULL, 'https://www.decision-achats.fr/Thematique/strategie-achats-1236/Breves/Achats-innovants-tremplin-marketplaces-344594.htm', 'achats-innovants-le-tremplin-des-marketplaces', 'Dans de nombreuses filières, le développement de places de marché bouleverse le paysage concurrentiel. Plus qu\'une simple digitalisation des offres, il s\'agit d\'un levier de création de valeur, associé à de nouveaux services, permettant parfois des collaborations jusque là impossibles.');

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
(5, 'G_Challenge.png'),
(6, 'G_da-logo-2015.png'),
(7, 'G_GlobalIndustrie2.jpg'),
(8, 'G_LECONOMISTE.png'),
(9, 'G_Logmd-e1497348216810.png'),
(10, 'G_logoGefco.png'),
(11, 'G_siteon0-dc90f.gif'),
(12, 'G_SupplyChainMagasine.jpg'),
(13, 'LAVIEECO-GT.gif'),
(14, 'LDA-G.gif'),
(15, 'logima_G.gif');

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
(1);

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
(1, '5ece49383adab522796908.png', 30820, 'image/png'),
(3, '5eda5ac97d09d106594679.jpg', 8864, 'image/jpeg'),
(4, '5eda5dc86ec78367745550.png', 30820, 'image/png'),
(5, '5eda624843b40770153304.png', 38731, 'image/png'),
(6, '5eea21c40aa8b142962746.xls', 595968, 'application/vnd.ms-excel'),
(7, '5ef48139deac9547540490.jpg', 9054, 'image/jpeg'),
(8, '5ef4c4d4d0948551382013.png', 30820, 'image/png'),
(9, '5ef4c6f14017f876263864.png', 30820, 'image/png'),
(10, '5ef4c7186809f486421122.png', 30820, 'image/png'),
(11, '5ef4c73ad88ce011988557.png', 30820, 'image/png'),
(12, '5ef4c758731ab837041991.png', 38731, 'image/png'),
(13, '5ef4c7b1687ef979772294.jpg', 8864, 'image/jpeg'),
(14, '5ef4c7de2f1d0504904794.jpg', 8864, 'image/jpeg'),
(15, '5ef4c80123f3d354978010.jpg', 108235, 'image/jpeg'),
(16, '5ef4c83c09d4d328229935.png', 30820, 'image/png'),
(17, '5ef4c85002292563675589.png', 30820, 'image/png'),
(18, '5ef4c88d946d7725558691.PNG', 95656, 'image/png'),
(19, '5ef4c8a83f036690791098.jpg', 8864, 'image/jpeg');

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
(1, '5eda4f418aba8704646613.jpg');

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
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `name`, `del`, `slug`) VALUES
(1, 'Acier Inoxydable', 0, 'acier-inoxydable'),
(2, 'Aciers spéciaux', 0, 'aciers-speciaux'),
(3, 'Aluminium en barre', 0, 'aluminium-en-barre'),
(4, 'Bois en panneau et dérivé', 0, 'bois-en-panneau-et-derive'),
(5, 'Profilé aluminium', 0, 'profile-aluminium'),
(6, 'Tôles ondulées', 0, 'toles-ondulees'),
(7, 'Materiels pour l\'Agro-Industrie', 0, 'materiels-pour-lagro-industrie'),
(8, 'Additifs alimentaires\n', 0, 'additifs-alimentaires\n'),
(9, 'Alimentation animale\n', 0, 'alimentation-animale\n'),
(10, 'Aliments pour bébés', 0, 'aliments-pour-bebes'),
(11, 'Fabrication Alimentation générale', 0, 'fabrication-alimentation-generale'),
(12, 'Huile et graisse alimentaires', 0, 'huile-et-graisse-alimentaires'),
(13, 'Fabrication de chocolats\n', 0, 'fabrication-de-chocolats\n'),
(14, 'Fabrication de Confiseries\n', 0, 'fabrication-de-confiseries\n'),
(15, 'Fabrication de Glaces et sorbets\n', 0, 'fabrication-de-glaces-et-sorbets\n'),
(16, 'Fabrication de Sucres\n', 0, 'fabrication-de-sucres\n'),
(17, 'Fabrication de pâtes alimentaires', 0, 'fabrication-de-pates-alimentaires'),
(18, 'Fourniture de minerais et minéraux\n', 0, 'fourniture-de-minerais-et-mineraux\n'),
(19, 'Fours pour boulangeries et pâtisseries\n', 0, 'fours-pour-boulangeries-et-patisseries\n'),
(20, 'Graisses alimentaires\n', 0, 'graisses-alimentaires\n'),
(21, 'Lait médical et alimentation pour bébés\n', 0, 'lait-medical-et-alimentation-pour-bebes\n'),
(22, 'Mobilier pour magasins, cafés\n', 0, 'mobilier-pour-magasins-cafes\n'),
(23, 'Produits alimentaires de luxe\n', 0, 'produits-alimentaires-de-luxe\n'),
(24, 'Machines à  café\n', 0, 'machines-a-cafe\r\n'),
(25, 'Matériel et fournitures pour boucheries', 0, 'materiel-et-fournitures-pour-boucheries'),
(26, 'Matériel et fournitures pour charcuterie\n', 0, 'materiel-et-fournitures-pour-charcuterie\n'),
(27, 'Matériel et fournitures pour boulangeries', 0, 'materiel-et-fournitures-pour-boulangeries'),
(28, 'Matériel et fournitures pour pâtisserie\n', 0, 'materiel-et-fournitures-pour-patisserie\n'),
(29, 'Matériel et fournitures pour café', 0, 'materiel-et-fournitures-pour-cafe'),
(30, 'Matériel et fournitures pour restaurant\n', 0, 'materiel-et-fournitures-pour-restaurant\n'),
(31, 'Matériel et fournitures pour Glaciers\n', 0, 'materiel-et-fournitures-pour-glaciers\n'),
(32, 'Fourniture Industrie Alimentatire\n', 0, 'fourniture-industrie-alimentatire\n'),
(33, 'Matériel pour l\'industrie Alimentataire\n', 0, 'materiel-pour-lindustrie-alimentataire\n'),
(34, 'Matériel pour pâtisserie, confiserie\n', 0, 'materiel-pour-patisserie-confiserie\n'),
(35, 'Produits surgelés\n', 0, 'produits-surgeles\n'),
(36, 'Materiel pour Ascenseurs', 0, 'materiel-pour-ascenseurs'),
(37, 'Materiel pour Monte charge', 0, 'materiel-pour-monte-charge'),
(38, 'Vehicule utilitaire', 0, 'vehicule-utilitaire'),
(39, 'Camion Citerne', 0, 'camion-citerne'),
(40, 'Camion', 0, 'camion'),
(41, 'Fourgonette', 0, 'fourgonette'),
(42, 'Minibus Transport Léger', 0, 'minibus-transport-leger'),
(43, 'MINIBUS Transport Lourd', 0, 'minibus-transport-lourd'),
(44, 'Fourgonnettes', 0, 'fourgonnettes'),
(45, 'Pièces & Accessoires', 0, 'pieces-accessoires'),
(46, 'Balances\n', 0, 'balances\n'),
(47, 'Plates-formes de pesage\n', 0, 'plates-formes-de-pesage\n'),
(48, 'Pesage aéronautique\n', 0, 'pesage-aeronautique\n'),
(49, 'Pesage sur chargeuse\n', 0, 'pesage-sur-chargeuse\n'),
(50, 'Peseuses de contrôle\n', 0, 'peseuses-de-controle\n'),
(51, 'Fourches peseuses\n', 0, 'fourches-peseuses\n'),
(52, 'Accessoires pour le pesage\n', 0, 'accessoires-pour-le-pesage\n'),
(53, 'Broyeur', 0, 'broyeur'),
(54, 'Chauffage Bois', 0, 'chauffage-bois'),
(55, 'Compresseur\n', 0, 'compresseur\n'),
(56, 'Extrudeuse\n', 0, 'extrudeuse\n'),
(57, 'Froid industriel\n', 0, 'froid-industriel\n'),
(58, 'Machine d\'injection plastique\n', 0, 'machine-dinjection-plastique\n'),
(59, 'Machine divers\n', 0, 'machine-divers\n'),
(60, 'Machine-outil\n', 0, 'machine-outil\n'),
(61, 'Souffleuse\n', 0, 'souffleuse\n'),
(62, 'Materiel pour le traitement des eaux\n', 0, 'materiel-pour-le-traitement-des-eaux\n'),
(63, 'Matériel et fourniture pour blanchisserie', 0, 'materiel-et-fourniture-pour-blanchisserie'),
(64, 'Matériel et fourniture pour laverie\n', 0, 'materiel-et-fourniture-pour-laverie\n'),
(65, 'Materiel pour Mines', 0, 'materiel-pour-mines'),
(66, 'Chargeuses sur pneus compactes\n', 0, 'chargeuses-sur-pneus-compactes\n'),
(67, 'Chargeuses sur pneus\n', 0, 'chargeuses-sur-pneus\n'),
(68, 'Chargeuses - pelleteuses\n', 0, 'chargeuses--pelleteuses\n'),
(69, 'Pelles compactes\n', 0, 'pelles-compactes\n'),
(70, 'Pelles sur pneus\n', 0, 'pelles-sur-pneus\n'),
(71, 'Pelles sur chenilles\n', 0, 'pelles-sur-chenilles\n'),
(72, 'Pelles buttes\n', 0, 'pelles-buttes\n'),
(73, 'Pelles pour manutention\n', 0, 'pelles-pour-manutention\n'),
(74, 'Tombereaux articulés\n', 0, 'tombereaux-articules\n'),
(75, 'Tombereaux de chantier\n', 0, 'tombereaux-de-chantier\n'),
(76, 'Tombereaux pour applications minières\n', 0, 'tombereaux-pour-applications-minieres\n'),
(77, 'Niveleuses\n', 0, 'niveleuses\n'),
(78, 'Niveleuses pour applications minières\n', 0, 'niveleuses-pour-applications-minieres\n'),
(79, 'ABG sur chenilles\n', 0, 'abg-sur-chenilles\n'),
(80, 'ABG sur pneus\n', 0, 'abg-sur-pneus\n'),
(81, 'Tables de finisseur ABG manuelles\n', 0, 'tables-de-finisseur-abg-manuelles\n'),
(82, 'Tables de finisseur ABG variomatic\n', 0, 'tables-de-finisseur-abg-variomatic\n'),
(83, 'Raboteuses sur chenilles\n', 0, 'raboteuses-sur-chenilles\n'),
(84, 'Raboteuses sur pneus\n', 0, 'raboteuses-sur-pneus\n'),
(85, 'Asphalte, petite dimension\n', 0, 'asphalte-petite-dimension\n'),
(86, 'Asphalte, grande dimension\n', 0, 'asphalte-grande-dimension\n'),
(87, 'Terrassement, petite dimension\n', 0, 'terrassement-petite-dimension\n'),
(88, 'Terrassement, grande dimension\n', 0, 'terrassement-grande-dimension\n'),
(89, 'Compacteurs pour décharges sanitaires\n', 0, 'compacteurs-pour-decharges-sanitaires\n'),
(90, 'Compacteurs de sol vibrants\n', 0, 'compacteurs-de-sol-vibrants\n'),
(91, 'Compacteurs tandem vibrants\n', 0, 'compacteurs-tandem-vibrants\n'),
(92, 'Compacteurs à pneumatiques\n', 0, 'compacteurs-a-pneumatiques\n'),
(93, 'Conseil en Etude', 0, 'conseil-en-etude'),
(94, 'Caisse enregistreuse\n', 0, 'caisse-enregistreuse\n'),
(95, 'Papier\n', 0, 'papier\n'),
(96, 'Photocopieurs\n', 0, 'photocopieurs\n'),
(97, 'Projecteurs\n', 0, 'projecteurs\n'),
(98, 'Télécopieurs\n', 0, 'telecopieurs\n'),
(100, 'Coffre-fort\n', 0, 'coffre-fort\n'),
(101, 'Distributeur de confiseries, snacks et tabac\n', 0, 'distributeur-de-confiseries-snacks-et-tabac\n'),
(102, 'Distributeurs de boissons froides\n', 0, 'distributeurs-de-boissons-froides\n'),
(103, 'Distributeurs de café et boissons chaudes\n', 0, 'distributeurs-de-cafe-et-boissons-chaudes\n'),
(104, 'Fontaines à eau', 0, 'fontaines-a-eau'),
(105, 'Mobilier de bureau\n', 0, 'mobilier-de-bureau\n'),
(106, 'Produits Chimique', 0, 'produits-chimique'),
(107, 'Produits Parachimique', 0, 'produits-parachimique'),
(108, 'Mobilier pour la Pharmacie', 0, 'mobilier-pour-la-pharmacie'),
(109, 'Conception et réalisation de brochures', 0, 'conception-et-realisation-de-brochures'),
(110, 'Création de Logo', 0, 'creation-de-logo'),
(111, 'Charte graphique', 0, 'charte-graphique'),
(112, 'Conception et réalisation de catalogues', 0, 'conception-et-realisation-de-catalogues'),
(113, 'Conception et réalisation de support publicitaire', 0, 'conception-et-realisation-de-support-publicitaire'),
(114, 'Comptabilité et Expertise financière\n', 0, 'comptabilite-et-expertise-financiere\n'),
(115, 'Conseil opérationnel et industriel\n', 0, 'conseil-operationnel-et-industriel\n'),
(116, 'Conseil stratégique et Etudes\n', 0, 'conseil-strategique-et-etudes\n'),
(117, 'Recouvrement de créances\n', 0, 'recouvrement-de-creances\n'),
(118, 'Boulonnerie', 0, 'boulonnerie'),
(119, 'Visserie', 0, 'visserie'),
(120, 'Articles de fixation', 0, 'articles-de-fixation'),
(121, 'Carburant', 0, 'carburant'),
(122, 'Fuel', 0, 'fuel'),
(123, 'Consommable de soudage', 0, 'consommable-de-soudage'),
(124, 'Droguerie', 0, 'droguerie'),
(125, 'Quincaillerie', 0, 'quincaillerie'),
(126, 'Vêtement de sécurité', 0, 'vetement-de-securite'),
(127, 'Vêtement de travail', 0, 'vetement-de-travail'),
(128, 'Outillages', 0, 'outillages'),
(129, 'Armoire et coffret\n', 0, 'armoire-et-coffret\n'),
(130, 'Appareils de mesure et de contrôle électrique', 0, 'appareils-de-mesure-et-de-controle-electrique'),
(131, 'Automate programmable\n', 0, 'automate-programmable\n'),
(132, 'Bobinage pour moteur électrique\n', 0, 'bobinage-pour-moteur-electrique\n'),
(133, 'Câble et fil électrique\n', 0, 'cable-et-fil-electrique\n'),
(134, 'Carte électronique\n', 0, 'carte-electronique\n'),
(135, 'Composant d\'automatisme pneumatique\n', 0, 'composant-dautomatisme-pneumatique\n'),
(136, 'Composant électronique\n', 0, 'composant-electronique\n'),
(137, 'Composant et article hydraulique\n', 0, 'composant-et-article-hydraulique\n'),
(138, 'Conception et installation d\'automatisme\n', 0, 'conception-et-installation-dautomatisme\n'),
(139, 'Disjoncteur, relais électrique\n', 0, 'disjoncteur-relais-electrique\n'),
(140, 'Transformateur électrique\n', 0, 'transformateur-electrique\n'),
(141, 'Emballage', 0, 'emballage'),
(142, 'Emballage et conditionnement', 0, 'emballage-et-conditionnement'),
(143, 'Banderoleuse', 0, 'banderoleuse'),
(144, 'Produit d\'entretien', 0, 'produit-dentretien'),
(145, 'Produit de Nettoyage', 0, 'produit-de-nettoyage'),
(147, 'Carton Ondulé', 0, 'carton-ondule'),
(148, 'Design emballage', 0, 'design-emballage'),
(149, 'Etiquettes', 0, 'etiquettes'),
(150, 'Ensachageuse', 0, 'ensachageuse'),
(151, 'Paletiseur', 0, 'paletiseur'),
(152, 'STATION DE REMPLISSAGE', 0, 'station-de-remplissage'),
(153, 'Energie Solaire', 0, 'energie-solaire'),
(154, 'Biocarburant', 0, 'biocarburant'),
(155, 'Materiel pour l\'energie Solaire', 0, 'materiel-pour-lenergie-solaire'),
(156, 'Materiel pour l\'Electricité', 0, 'materiel-pour-lelectricite'),
(157, 'Materiel pour l\'Electronique', 0, 'materiel-pour-lelectronique'),
(158, 'Enseignes pour stand d\'exposition', 0, 'enseignes-pour-stand-dexposition'),
(159, 'Hôtesses', 0, 'hotesses'),
(160, 'Location de salles pour mariage', 0, 'location-de-salles-pour-mariage'),
(161, 'Location de salles pour fête', 0, 'location-de-salles-pour-fete'),
(162, 'Location de salles pour séminaire', 0, 'location-de-salles-pour-seminaire'),
(163, 'Location de salles pour réunion', 0, 'location-de-salles-pour-reunion'),
(164, 'Location matériel et tentes', 0, 'location-materiel-et-tentes'),
(165, 'Serices pour Salons Conférances', 0, 'serices-pour-salons-conferances'),
(166, 'Espace pour exébition et foires', 0, 'espace-pour-exebition-et-foires'),
(167, 'Son', 0, 'son'),
(168, 'Lumière', 0, 'lumiere'),
(169, 'Formation continue', 0, 'formation-continue'),
(170, 'Formation du soir', 0, 'formation-du-soir'),
(171, 'Formation extra-entreprise', 0, 'formation-extra-entreprise'),
(172, 'Formation intra-entreprise', 0, 'formation-intra-entreprise'),
(173, 'Formation langue', 0, 'formation-langue'),
(174, 'Formation logiciel', 0, 'formation-logiciel'),
(175, 'Formation vente et marketing', 0, 'formation-vente-et-marketing'),
(176, 'Armoires/Monoblocs\n', 0, 'armoires/monoblocs\n'),
(177, 'Cassettes\n', 0, 'cassettes\n'),
(178, 'Condenseurs à Eau & Centrifuges\n', 0, 'condenseurs-a-eau--centrifuges\n'),
(179, 'Gainables\n', 0, 'gainables\n'),
(180, 'Mobiles/Monoblocs\n', 0, 'mobiles/monoblocs\n'),
(181, 'Multisplits\n', 0, 'multisplits\n'),
(182, 'Plafonniers\n', 0, 'plafonniers\n'),
(183, 'Pompes à Chaleur/Groupes d\'Eau Glacée\n', 0, 'pompes-a-chaleur/groupes-deau-glacee\n'),
(184, 'Terminaux Eau Glacée\n', 0, 'terminaux-eau-glacee\n'),
(185, 'Climatiseurs', 0, 'climatiseurs'),
(186, 'Conseil et assistance en Construction', 0, 'conseil-et-assistance-en-construction'),
(187, 'Décoration intérieure\n', 0, 'decoration-interieure\n'),
(188, 'Climatisation\n', 0, 'climatisation\n'),
(189, 'Installation électrique\n', 0, 'installation-electrique\n'),
(190, 'Installations spéciales\n', 0, 'installations-speciales\n'),
(191, 'Peinture et rafraîchissement\n', 0, 'peinture-et-rafraîchissement\n'),
(192, 'Rénovation bâtiment\n', 0, 'renovation-batiment\n'),
(193, 'Sol et fondation\n', 0, 'sol-et-fondation\n'),
(194, 'Toit et isolation\n', 0, 'toit-et-isolation\n'),
(195, 'Tuyauterie et sanitaire\n', 0, 'tuyauterie-et-sanitaire\n'),
(196, 'Bois', 0, 'bois'),
(197, 'Bâtiment préfabriqué', 0, 'batiment-prefabrique'),
(198, 'Métallique', 0, 'metallique'),
(199, 'Aluminium', 0, 'aluminium'),
(200, 'Materiel pour le travail du bois', 0, 'materiel-pour-le-travail-du-bois'),
(201, 'Piscine', 0, 'piscine'),
(202, 'Porte', 0, 'porte'),
(203, 'Cloison amovible', 0, 'cloison-amovible'),
(204, 'Terrassement', 0, 'terrassement'),
(205, 'Travaux tout corps d\'état', 0, 'travaux-tout-corps-detat'),
(206, 'Aciers de construction', 0, 'aciers-de-construction'),
(207, 'Agencement', 0, 'agencement'),
(208, 'Construction de bâtiment', 0, 'construction-de-batiment'),
(209, 'Gros-oeuvre', 0, 'gros-oeuvre'),
(210, 'Aspirateur et cireuse\n', 0, 'aspirateur-et-cireuse\n'),
(211, 'Lave Linge', 0, 'lave-linge'),
(212, 'Sèche Linge', 0, 'seche-linge'),
(213, 'Lave linge séchant', 0, 'lave-linge-sechant'),
(214, 'Fers à Repasser\n', 0, 'fers-a-repasser\n'),
(215, 'Machines à coudre\n', 0, 'machines-a-coudre\n'),
(216, 'Chauffages Electriques\n', 0, 'chauffages-electriques\n'),
(217, 'Climatiseurs et Appareils Humidité\n', 0, 'climatiseurs-et-appareils-humidite\n'),
(218, 'Ventilateurs\n', 0, 'ventilateurs\n'),
(219, 'Réfrigérateurs\n', 0, 'refrigerateurs\n'),
(220, 'Congélateurs\n', 0, 'congelateurs\n'),
(221, 'Caves à Vin\n', 0, 'caves-a-vin\n'),
(222, 'Lave Vaisselle\n', 0, 'lave-vaisselle\n'),
(223, 'Cuisinières\n', 0, 'cuisinieres\n'),
(224, 'Micro Ondes\n', 0, 'micro-ondes\n'),
(225, 'Hottes aspirantes\n', 0, 'hottes-aspirantes\n'),
(226, 'Fours\n', 0, 'fours\n'),
(227, 'Accessoires de cuisine\n', 0, 'accessoires-de-cuisine\n'),
(228, 'TV couleur\n', 0, 'tv-couleur\n'),
(229, 'TV LCD\n', 0, 'tv-lcd\n'),
(230, 'TV LED\n', 0, 'tv-led\n'),
(231, 'TV Plasma\n', 0, 'tv-plasma\n'),
(232, 'Rétroprojecteurs\n', 0, 'retroprojecteurs\n'),
(233, 'TV Combi Magnétoscope ou DVD\n', 0, 'tv-combi-magnetoscope-ou-dvd\n'),
(234, 'Lecteurs DVD\n', 0, 'lecteurs-dvd\n'),
(235, 'Enregistreurs DVD\n', 0, 'enregistreurs-dvd\n'),
(236, 'Lecteurs Blu-ray\n', 0, 'lecteurs-blu-ray\n'),
(237, 'Systèmes Home Cinema\n', 0, 'systemes-home-cinema\n'),
(238, 'Adaptateurs Secteur', 0, 'adaptateurs-secteur'),
(239, 'Câbles Audio Video\n', 0, 'cables-audio-video\n'),
(240, 'Accessoires Hi-fi\n', 0, 'accessoires-hi-fi\n'),
(241, 'Literie, draps\n', 0, 'literie-draps\n'),
(242, 'Sonorisation et effet lumineux\n', 0, 'sonorisation-et-effet-lumineux\n'),
(243, 'Ustensiles\n', 0, 'ustensiles\n'),
(244, 'Tables et chaises\n', 0, 'tables-et-chaises\n'),
(245, 'Accessoires HCR\n', 0, 'accessoires-hcr\n'),
(246, 'Brochures et catalogues', 0, 'brochures-et-catalogues'),
(247, 'Impression cartes de visite', 0, 'impression-cartes-de-visite'),
(248, 'Papier à lettres', 0, 'papier-a-lettres'),
(249, 'Impression classeurs', 0, 'impression-classeurs'),
(250, 'Boîtes de rangement', 0, 'boites-de-rangement'),
(251, 'Impression factures', 0, 'impression-factures'),
(252, 'Formulaires', 0, 'formulaires'),
(253, 'Feuillets', 0, 'feuillets'),
(254, 'Dépliants', 0, 'depliants'),
(255, 'Affiches', 0, 'affiches'),
(256, 'Magazines', 0, 'magazines'),
(257, 'Livres', 0, 'livres'),
(258, 'Journaux', 0, 'journaux'),
(259, 'Materiel pour Industries de transformation Plastique et PVC', 0, 'materiel-pour-industries-de-transformation-plastique-et-pvc'),
(260, 'Machine pour l\'industrie Mécanique', 0, 'machine-pour-lindustrie-mecanique'),
(261, 'Conseil informatique', 0, 'conseil-informatique'),
(262, 'Développement, intégration, Programmation', 0, 'developpement-integration-programmation'),
(263, 'Progiciel de gestion intégré (ERP)', 0, 'progiciel-de-gestion-integre-erp'),
(264, 'Logiciel Gestion CRM - SRM', 0, 'logiciel-gestion-crm-srm'),
(265, 'Logiciel Gestion documents', 0, 'logiciel-gestion-documents'),
(266, 'Service de sécurité informatique', 0, 'service-de-securite-informatique'),
(267, 'Imprimante Laser', 0, 'imprimante-laser'),
(268, 'Imprimante à Jet d\'encre', 0, 'imprimante-a-jet-dencre'),
(269, 'Imprimante Couleur', 0, 'imprimante-couleur'),
(270, 'Ecrans LCD', 0, 'ecrans-lcd'),
(271, 'Mini PC', 0, 'mini-pc'),
(272, 'Serveurs', 0, 'serveurs'),
(273, 'Support Hardware', 0, 'support-hardware'),
(274, 'Clavier', 0, 'clavier'),
(275, 'WebCam', 0, 'webcam'),
(276, 'Cle USB', 0, 'cle-usb'),
(277, 'HDD Disk Dur', 0, 'hdd-disk-dur'),
(278, 'Lecteurs et Graveurs ', 0, 'lecteurs-et-graveurs '),
(279, 'Modules de mémoire', 0, 'modules-de-memoire'),
(280, 'Appareils de stockage ', 0, 'appareils-de-stockage '),
(281, 'Support de stockage ', 0, 'support-de-stockage '),
(282, 'Cartes mères', 0, 'cartes-meres'),
(283, 'Accessoires moniteurs ', 0, 'accessoires-moniteurs '),
(284, 'Accessoires ordinateurs portables', 0, 'accessoires-ordinateurs-portables'),
(285, 'Imprimantes & Accessoires', 0, 'imprimantes -accessoires'),
(286, 'Cartouches pour Imprimantes ', 0, 'cartouches-pour-imprimantes '),
(287, 'Accessoires scanners', 0, 'accessoires-scanners'),
(288, 'Moniteurs LCD', 0, 'moniteurs-lcd'),
(289, 'Moniteurs CRT', 0, 'moniteurs-crt'),
(290, 'Scanners', 0, 'scanners'),
(291, 'Ordinateurs & Accessoires', 0, 'ordinateurs-accessoires'),
(292, 'Mac Book', 0, 'mac-book'),
(293, 'Mac Book PRO', 0, 'mac-book-pro'),
(294, 'Mac', 0, 'mac'),
(295, 'Entretien et réparation', 0, 'entretien-et-reparation'),
(296, 'Création et géstion de site web', 0, 'creation-et-gestion-de-site-web'),
(297, 'Création de site e-commerce\n', 0, 'creation-de-site-e-commerce\n'),
(298, 'Graphisme et animations web\n', 0, 'graphisme-et-animations-web\n'),
(299, 'Hébergement sites web\n', 0, 'hebergement-sites-web\n'),
(300, 'Marketing Digital', 0, 'marketing-digital'),
(301, 'Transpalette', 0, 'transpalette'),
(302, 'Transpalette Electrique & Gerbeur', 0, 'transpalette-electrique-gerbeur'),
(303, 'Systèmes de stockage WMS', 0, 'systemes-de-stockage-wms'),
(304, 'Gerbeurs manuel', 0, 'gerbeurs-manuel'),
(305, 'Chariots élévateurs', 0, 'chariots-elevateurs'),
(306, 'Grue', 0, 'grue'),
(307, 'Palettes', 0, 'palettes'),
(308, 'Entreposage', 0, 'entreposage'),
(309, 'Plate-forme de stockage', 0, 'plate-forme-de-stockage'),
(310, 'Rayonnages charges longues', 0, 'rayonnages-charges-longues'),
(311, 'Rayonnages charges légères', 0, 'rayonnages-charges-legeres'),
(312, 'Rayonnages charges mi-lourdes', 0, 'rayonnages-charges-mi-lourdes'),
(313, 'Rayonnages charges lourdes', 0, 'rayonnages-charges-lourdes'),
(314, 'Rayonnages mobiles', 0, 'rayonnages-mobiles'),
(315, 'Stockage dynamique', 0, 'stockage-dynamique'),
(316, 'Stockage à tiroirs', 0, 'stockage-a-tiroirs'),
(317, 'Rayonnage Radio Shuttle', 0, 'rayonnage-radio-shuttle'),
(318, 'Transport National\n', 0, 'transport-national\n'),
(319, 'Transport International\n', 0, 'transport-international\n'),
(320, 'Messagerie', 0, 'messagerie'),
(321, 'Services de coursiers', 0, 'services-de-coursiers'),
(322, 'Déménagement', 0, 'demenagement'),
(323, 'Achat / location de bases de données', 0, 'achat-/-location-de-bases-de-donnees'),
(324, 'Agence de marketing direct', 0, 'agence-de-marketing-direct'),
(325, 'Agence de publicité', 0, 'agence-de-publicite'),
(326, 'Conseil vente et marketing', 0, 'conseil-vente-et-marketing'),
(327, 'Enseignes lumineuses et signalétique', 0, 'enseignes-lumineuses-et-signaletique'),
(328, 'Mailing direct', 0, 'mailing-direct'),
(329, 'Relations presse', 0, 'relations-presse'),
(330, 'Télémarketing', 0, 'telemarketing'),
(331, 'Centres d\'appels', 0, 'centres-dappels'),
(338, 'Peinture Epoxy', 0, 'peinture-epoxy'),
(339, 'Produit pour le sol', 0, 'produit-pour-le-sol'),
(340, 'Materiel pour l\'industrie Pétrolire', 0, 'materiel-pour-lindustrie-petrolire'),
(341, 'Materiel pour l\'industrie du Gaz', 0, 'materiel-pour-lindustrie-du-gaz'),
(342, 'Concepteur de reportage vidéo\n', 0, 'concepteur-de-reportage-video\n'),
(343, 'Photographie\n', 0, 'photographie\n'),
(344, 'Production spot radio\n', 0, 'production-spot-radio\n'),
(345, 'Production vidéo présentation d\'entreprise\n', 0, 'production-video-presentation-dentreprise\n'),
(346, 'Production vidéo publicitaire\n', 0, 'production-video-publicitaire\n'),
(347, 'Streaming vidéo\n', 0, 'streaming-video\n'),
(348, 'PLV\n', 0, 'plv\n'),
(349, 'Affichage\n', 0, 'affichage\n'),
(350, 'Matières Plastiques', 0, 'matieres-plastiques'),
(351, 'Materiel pour le travail du plastique', 0, 'materiel-pour-le-travail-du-plastique'),
(352, 'Colorant pour matière plastique\n', 0, 'colorant-pour-matiere-plastique\n'),
(353, 'Articles promotionnels\n', 0, 'articles-promotionnels\n'),
(354, 'Cadeaux d\'affaires\n', 0, 'cadeaux-daffaires\n'),
(355, 'Intérim\n', 0, 'interim\n'),
(356, 'Gardiennage\n', 0, 'gardiennage\n'),
(357, 'Recrutement\n', 0, 'recrutement\n'),
(358, 'Alarmes', 0, 'alarmes'),
(359, 'Appareils de surveillance', 0, 'appareils-de-surveillance'),
(360, 'Antivol', 0, 'antivol'),
(361, 'Contrôle d\'accès', 0, 'controle-dacces'),
(362, 'Détection d\'incendie', 0, 'detection-dincendie'),
(363, 'Gardiennage', 0, 'gardiennage'),
(364, 'Prévention contre le feu', 0, 'prevention-contre-le-feu'),
(365, 'Surveillance vidéo', 0, 'surveillance-video'),
(366, 'Materiel pour la sidérurgie', 0, 'materiel-pour-la-siderurgie'),
(367, 'Materiel pour la Métallurgie', 0, 'materiel-pour-la-metallurgie'),
(368, 'Centrales téléphoniques\n', 0, 'centrales-telephoniques\n'),
(369, 'Câblage et réseaux\n', 0, 'cablage-et-reseaux\n'),
(370, 'Téléphonie VOIP\n', 0, 'telephonie-voip\n'),
(371, 'Téléphonie mobile\n', 0, 'telephonie-mobile\n'),
(372, 'Téléphonie Fixe\n', 0, 'telephonie-fixe\n'),
(373, 'Menuiserie métallique', 0, 'menuiserie-metallique'),
(374, 'Construction métallique', 0, 'construction-metallique'),
(375, 'Billets d\'avion', 0, 'billets-davion'),
(376, 'Location de voiture', 0, 'location-de-voiture'),
(377, 'Location d\'autocars', 0, 'location-dautocars');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_sous_secteur`
--

CREATE TABLE `categorie_sous_secteur` (
  `categorie_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie_sous_secteur`
--

INSERT INTO `categorie_sous_secteur` (`categorie_id`, `sous_secteur_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 4),
(25, 5),
(26, 5),
(27, 7),
(28, 7),
(29, 4),
(30, 4),
(31, 4),
(32, 9),
(33, 9),
(34, 10),
(35, 11),
(36, 12),
(37, 13),
(38, 14),
(39, 14),
(40, 14),
(41, 14),
(42, 14),
(43, 14),
(44, 14),
(45, 15),
(46, 16),
(47, 16),
(48, 16),
(49, 16),
(50, 16),
(51, 16),
(52, 16),
(53, 17),
(54, 17),
(55, 17),
(56, 17),
(57, 17),
(58, 17),
(59, 17),
(60, 17),
(61, 17),
(62, 17),
(63, 18),
(64, 18),
(65, 19),
(66, 19),
(67, 19),
(68, 19),
(69, 19),
(70, 19),
(71, 19),
(72, 19),
(73, 19),
(74, 19),
(75, 19),
(76, 19),
(77, 19),
(78, 19),
(79, 19),
(80, 19),
(81, 19),
(82, 19),
(83, 19),
(84, 19),
(85, 19),
(86, 19),
(87, 19),
(88, 19),
(89, 19),
(90, 19),
(91, 19),
(92, 19),
(93, 20),
(94, 21),
(95, 21),
(96, 21),
(97, 21),
(98, 21),
(100, 22),
(101, 22),
(102, 22),
(103, 22),
(104, 22),
(105, 22),
(106, 23),
(107, 24),
(108, 96),
(109, 25),
(110, 25),
(111, 25),
(112, 25),
(113, 26),
(114, 27),
(115, 28),
(116, 29),
(117, 30),
(118, 31),
(119, 31),
(120, 31),
(121, 31),
(122, 31),
(123, 31),
(124, 31),
(125, 31),
(126, 31),
(127, 31),
(128, 31),
(129, 31),
(130, 31),
(131, 31),
(132, 31),
(133, 31),
(134, 31),
(135, 31),
(136, 31),
(137, 31),
(138, 31),
(139, 31),
(140, 31),
(141, 32),
(142, 32),
(143, 32),
(144, 33),
(145, 33),
(147, 35),
(148, 36),
(149, 36),
(150, 37),
(151, 37),
(152, 37),
(153, 38),
(154, 39),
(155, 38),
(156, 41),
(157, 42),
(158, 43),
(159, 44),
(160, 45),
(161, 45),
(162, 45),
(163, 45),
(164, 46),
(165, 47),
(166, 48),
(167, 49),
(168, 49),
(169, 50),
(170, 50),
(171, 50),
(172, 50),
(173, 50),
(174, 50),
(175, 50),
(176, 51),
(177, 51),
(178, 51),
(179, 51),
(180, 51),
(181, 51),
(182, 51),
(183, 51),
(184, 51),
(185, 51),
(186, 52),
(187, 52),
(188, 53),
(189, 53),
(190, 53),
(191, 53),
(192, 53),
(193, 53),
(194, 53),
(195, 53),
(196, 53),
(197, 53),
(198, 53),
(199, 53),
(200, 53),
(201, 53),
(202, 53),
(203, 53),
(204, 53),
(205, 53),
(206, 54),
(207, 55),
(208, 56),
(209, 56),
(210, 57),
(211, 58),
(212, 58),
(213, 58),
(214, 58),
(215, 58),
(216, 58),
(217, 58),
(218, 58),
(219, 58),
(220, 58),
(221, 58),
(222, 58),
(223, 58),
(224, 58),
(225, 58),
(226, 58),
(227, 59),
(228, 59),
(229, 59),
(230, 59),
(231, 59),
(232, 59),
(233, 59),
(234, 59),
(235, 59),
(236, 59),
(237, 59),
(238, 59),
(239, 59),
(240, 59),
(241, 59),
(242, 59),
(243, 59),
(244, 59),
(245, 59),
(246, 60),
(247, 60),
(248, 60),
(249, 60),
(250, 60),
(251, 60),
(252, 60),
(253, 60),
(254, 60),
(255, 60),
(256, 60),
(257, 60),
(258, 60),
(259, 61),
(260, 62),
(261, 63),
(262, 64),
(263, 64),
(264, 65),
(265, 65),
(266, 66),
(267, 67),
(268, 67),
(269, 67),
(270, 67),
(271, 67),
(272, 67),
(273, 67),
(274, 67),
(275, 67),
(276, 67),
(277, 67),
(278, 67),
(279, 67),
(280, 67),
(281, 67),
(282, 67),
(283, 67),
(284, 67),
(285, 67),
(286, 67),
(287, 67),
(288, 67),
(289, 67),
(290, 67),
(291, 67),
(292, 67),
(293, 67),
(294, 67),
(295, 68),
(296, 69),
(297, 69),
(298, 69),
(299, 69),
(300, 69),
(301, 70),
(302, 70),
(303, 70),
(304, 70),
(305, 70),
(306, 70),
(307, 70),
(308, 71),
(309, 71),
(310, 72),
(311, 72),
(312, 72),
(313, 72),
(314, 72),
(315, 72),
(316, 72),
(317, 72),
(318, 73),
(319, 73),
(320, 73),
(321, 73),
(322, 73),
(323, 74),
(324, 74),
(325, 74),
(326, 74),
(327, 75),
(328, 75),
(329, 75),
(330, 76),
(331, 76),
(338, 79),
(339, 79),
(340, 80),
(341, 81),
(342, 82),
(343, 82),
(344, 82),
(345, 82),
(346, 82),
(347, 82),
(348, 82),
(349, 82),
(350, 83),
(351, 83),
(352, 83),
(353, 84),
(354, 84),
(355, 85),
(356, 85),
(357, 85),
(358, 86),
(359, 86),
(360, 86),
(361, 86),
(362, 86),
(363, 86),
(364, 86),
(365, 86),
(366, 87),
(367, 88),
(368, 89),
(369, 89),
(370, 90),
(371, 90),
(372, 90),
(373, 91),
(374, 92),
(375, 93),
(376, 94),
(377, 94);

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE `commercial` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commercial_ville`
--

CREATE TABLE `commercial_ville` (
  `commercial_id` int(11) NOT NULL,
  `ville_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `condition_generale`
--

CREATE TABLE `condition_generale` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `condition_generale`
--

INSERT INTO `condition_generale` (`id`, `titre`, `contenu`, `slug`) VALUES
(1, 'Conditions générales', '<p><strong>***Conditions Générales d\'Utilisation du site&nbsp;lesachatsindustriels&nbsp;***</strong></p><p>&nbsp;</p><p>Les présentes conditions générales d’utilisation du site Internet&nbsp;lesachatsindustriels&nbsp;(ci-après le « Site ») ont pour objet de régir les droits et obligations de la Société&nbsp;\"7e-sky\"&nbsp;éditrice et propriétaire du site (ci-après «&nbsp;lesachatsindustriels&nbsp;») et de l’utilisateur (ci-après l’« Utilisateur ») du Site dans le cadre des prestations de services fournies par le site&nbsp;www.lesachatsindustriels.com. Par conséquence, toute utilisation, consultation du Site ou inscription sur le Site implique l’adhésion pleine et entière de l’Utilisateur aux présentes conditions générales d’utilisation.</p><p>&nbsp;</p><p><strong>***ARTICLE 1 – Le concept***</strong></p><p>&nbsp;</p><p>1.1. Le Site a pour objet principal la mise en relation de sociétés (les Acheteurs) préalablement inscrites sur le site souhaitant trouver des fournisseurs de leurs produits ou services, ces derniers (Les Fournisseurs) qui sont eux aussi préalablement inscrits sur le Site se disent capable de fournir le produit ou service demandé par l’acheteur dans les meilleures conditions. Les Acheteurs, les fournisseurs (Produit / service) ainsi que les sous-traitants sont ci- après dénommés les Utilisateurs ou individuellement l’Utilisateur.<br>1.2. L\'enregistrement sur&nbsp;lesachatsindustriels&nbsp;en tant que Fournisseur engage ce dernier une fois qu’il décide de participer à un Appel d’offre, à fournir le produit ou service pour lequel il s’est inscrit comme fournisseur.<br>1.3. L\'enregistrement sur&nbsp;lesachatsindustriels&nbsp;en tant qu’Acheteur engage ce dernier à ne pas lancer de fausse demande de prix, il s’engage à ce que ses demandes soient fondées sur un besoin réel et réalisable.</p><p>&nbsp;</p><p><strong>***ARTICLE 2 – Du côté de l’utilisation du Site par les Acheteurs***</strong></p><p>&nbsp;</p><p>2.1. Les Acheteurs sont obligés de créer un compte utilisateur contenant ses données d’identification, telles que demandées sur le Site (ci-après l’Identification).<br>2.2. Tout Acheteur est tenu de fournir, lors de son inscription sur le Site une Identification exacte, complète et à jour permettant de le contacter.<br>2.3.&nbsp;\"7e-sky\"&nbsp;ne possède pas les moyens de contrôler l’exactitude des informations fournies par l’Acheteur lors de son inscription ni les autres informations éventuellement communiquées ultérieurement par l’Acheteur et disponibles sur le Site.<br>2.4.&nbsp;\"7e-sky\"&nbsp;se réserve le droit de rendre \"Invalide\" tous compte d’acheteur s’il s’avère en non-conformité avec la déontologie du site web www.lesachatsindustriels.com. Tout plan ou dessins accompagnant les appels d\'offre des acheteurs, sera automatiquement modifier voir supprimé s’ils dissimulent ou mentionnent en quoique ce soit une indication ou un signe pouvant permettre d\'identifier la provenance de l\'appel d\'offre.<br>2.5. L’Acheteur s’engage à mettre à jour l’Identification le concernant en cas de modification de cette dernière.<br>2.6.&nbsp;\"7e-sky\"&nbsp;à travers son site web&nbsp;lesachatsindustriels&nbsp;se réserve le droit de diffuser les coordonnées de tout utilisateur de ce site ceux des Acheteurs au divers Fournisseurs, et ceux des Fournisseurs aux divers Acheteurs ou à d’autres utilisateurs<br>2.7&nbsp;\"7e-sky\"&nbsp;ne saurait en conséquence être tenue pour responsable des inconvénients et des inexactitudes qui pourraient être transmises de façon délibérée ou par erreur par les utilisateurs (Acheteur / Fournisseur).<br>2.8. L’acheteur s’engage à diffuser ses Appels d’Offres avec comme but de réaliser des transactions d\'achat potentielles, et à ne pas soumettre des Appels d\'Offres avec comme objectif de consulter et/ou comparer les prix ou propositions de ses propres concurrents.</p><p><br><br><strong>***ARTICLE 3 - Du côté de l’utilisation du Site par les Fournisseurs***</strong></p><p>&nbsp;</p><p>3.1. L’accès au Site et son utilisation par le fournisseur est totalement gratuite sauf quand ce dernier est intéressé par un appel d’offre et veux voir les coordonnées de celui qui l’a lancé, néanmoins ce dernier est obligé de créer un compte utilisateur contenant ses données d’identification, telles que demandées sur le Site (ci-après l’Identification).<br>3.2. Tout Fournisseur est tenu de fournir, lors de son inscription sur le Site, une Identification exacte, complète et à jour permettant de le contacter.<br>3.3.&nbsp;\"7e-sky\"&nbsp;ne possède pas les moyens de contrôler l’exactitude des informations fournies par le Fournisseur lors de son inscription ni les autres informations éventuellement communiquées ultérieurement par le Fournisseur et disponibles sur le Site.<br>3.4. Si lors de la consultation ou de l’utilisation du Site, le Fournisseur constate que l’Identification fournie par un autre Utilisateur est inexacte, le Fournisseur pourra le signaler en adressant un email à administrateur@lesachatsindustriels.com<br>3.5.&nbsp;\"7e-sky\"&nbsp;à travers son site web&nbsp;lesachatsindustriels&nbsp;se réserve le droit de diffuser les coordonnées de tout utilisateur de ce site, ceux des Acheteurs au divers Fournisseurs, et ceux des Fournisseurs au divers Acheteurs ou à d’autres utilisateurs<br>3.6.&nbsp;\"7e-sky\"&nbsp;ne saurait en conséquence être tenue pour responsable des inconvénients et des inexactitudes qui pourraient être transmise de façon délibérée ou par erreur par les utilisateurs (Acheteur / Fournisseur).</p><p>&nbsp;</p><p><strong>***ARTICLE 4 – Règles de Paiement***</strong></p><p>&nbsp;</p><p>4.1. Les jetons, packs, les bannières publicitaires et les campagnes publicitaires peuvent être vendues séparément, ou ensemble cela dépendra des clients et de leurs souhaits.<br>4.2.&nbsp;\"7e-sky\"&nbsp;se réserve le droit de modifier à tout moment ses tarifs.<br>4.3. Le règlement n’est pris en compte qu’une fois que notre compte bancaire soit crédité du montant figurant dans la facture correspondant à cet achat. Le paiement ne peut en aucun cas et sous aucune condition être remboursé. Les Packs Crédits ne sont pas transférables entre Fournisseur ou d’un Utilisateur à un autre.</p><p><br><br><strong>***ARTICLE 5 - Confidentialité des Données***</strong></p><p>&nbsp;</p><p>5.1. L’Utilisateur s’engage à respecter les droits de propriété intellectuelle liés à toutes informations auxquelles il aura accès dans le cadre de l\'utilisation du site&nbsp;lesachatsindustriels<br>5.2. Tout Fournisseur s’engage à conserver confidentielles et à faire conserver confidentielles par son personnel, toutes les données auxquelles il a accès dans le cadre de l’utilisation du Site, sauf accord écrit de l’Acheteur pour divulguer ces données.<br>5.3. Le Fournisseur s’interdit, sauf accord préalable de&nbsp;\"7e-sky\", et quel que soit le résultat de la mise en relation effectuée par l’intermédiaire du site&nbsp;lesachatsindustriels&nbsp;de :<br>- reproduire les données à d’autres fins que l’étude de l’offre de l’Acheteur,<br>- vendre les données directement ou indirectement.</p><p><br><br><strong>***ARTICLE 6 - Blocage ou suppression du compte de l’Utilisateur***</strong></p><p>&nbsp;</p><p>6.&nbsp;\"7e-sky\"&nbsp;se réserve le droit de bloquer ou de supprimer, à tout moment et sans préavis, le compte d’un Utilisateur, Acheteur, Fournisseur ou Société de service, sans avoir à s’en justifier, en cas de violation de tout ou partie des présentes conditions générales et/ou en cas d’inactivité du compte de l’Utilisateur pendant une durée de 12 mois.<br><br><br>&nbsp;</p><p><strong>***ARTICLE 7 – Garanties***</strong></p><p>&nbsp;</p><p>7.1. Les données figurant dans la base de données de&nbsp;www.lesachatsindustriels.com&nbsp;sont déclaratives et fournies par les Utilisateurs, tiers par rapport à&nbsp;\"7e-sky\". Dès lors&nbsp;\"7e-sky\"&nbsp;ne garantit ni l’exactitude, ni la fiabilité des données communiquées par les Utilisateurs ni la solvabilité de ces derniers et ne peut en aucun cas en être tenue pour responsable.<br>7.2.&nbsp;\"7e-sky\"&nbsp;ne pourra encourir une quelconque responsabilité en cas d’utilisation des Identifications non conformes à l’objet du service ou du fait des résultats qui pourraient être obtenus par l\'usage des Identifications.<br>7.3.&nbsp;\"7e-sky\"&nbsp;est, et demeure, un tiers par rapport aux Utilisateurs. Dès lors, la responsabilité de son site&nbsp;www.lesachatsindustriels.com&nbsp;ne pourra pas être engagée du fait d’inexécutions contractuelles ou de mauvaise exécution des contrats conclus entre Utilisateurs.<br>7.4. La communication des plans du produit qu’il souhaite faire fabriquer est exposée aux risques et périls de l’Acheteur.<br>7.5. Lors de la consultation du Site, l’Utilisateur peut, par l’usage des liens hypertextes mis en place par www.lesachatsindustriels, accéder à d’autres sites Internet ou serveurs partenaires sur lesquels&nbsp;www.lesachatsindustriels.com&nbsp;n’exerce aucun contrôle.<br>Les sites Internet cibles étant susceptibles d’évoluer librement sans l’intervention ou l’autorisation de&nbsp;\"7e-sky\", l’Utilisateur reconnaît expressément que la responsabilité de&nbsp;\"7e-sky\"&nbsp;résultant du contenu des sites Internet cibles est exclue.<br>7.6. Tout accord conclu par un Utilisateur avec des partenaires sur le site web www.lesachatsindustriels se fait sous sa seule responsabilité, sans que la responsabilité de&nbsp;\"7e-sky\"&nbsp;ne puisse être engagée pour des raisons quelconques.</p><p><br><br><strong>***Article 8 - Droits de propriété intellectuelle***</strong></p><p>&nbsp;</p><p>8.1. La marque&nbsp;«LESACHATSINDUSTRIELS»&nbsp;et les noms de domaine&nbsp;lesachatsindustriels.com, lesachatsindustriels.fr, lesachatsindustriels.ma,&nbsp;sont la propriété de&nbsp;\"7e-sky\".&nbsp;Toute utilisation du nom&nbsp;LESACHATSINDUSTRIELS&nbsp;est interdite sans l’autorisation préalable et écrite de&nbsp;\"7e-sky\".<br>8.2. Ce site et son contenu sont protégés, au sens du Code de la propriété intellectuelle, en particulier par les droits d\'auteur et de marques.<br>8.3. En application du Code de la Propriété Intellectuelle et, plus généralement, des traités et accords internationaux comportant des dispositions relatives à la protection des droits d\'auteurs, l’Utilisateur s’interdit de reproduire même partiellement, vendre, distribuer, émettre, diffuser, adapter, modifier, publier, communiquer intégralement ou partiellement, sous quelque forme que ce soit la présentation ou l\'organisation du Site sans autorisation préalable et écrite de&nbsp;\"7e-sky\"</p><p><br>8.4. Toute violation des droits et obligations ci-dessus énumérés constituerait une contrefaçon des droits de propriété intellectuelle de&nbsp;\"7e-sky\".</p><p><br><br><strong>***ARTICLE 9 - Accès au Site et modifications sur&nbsp;lesachatsindustriels***</strong></p><p>&nbsp;</p><p>9.1. L\'accès à tout ou partie du Site pourra être suspendu ou supprimé sur simple décision de&nbsp;\"7e-sky\"&nbsp;en cas de force majeure, de difficultés informatiques ou techniques, de difficultés liées à la structure des réseaux de télécommunications, de blocage des réseaux de télécommunications, de grève, d’état d’urgence national ou local, d’intempéries sans que cette liste ne soit exhaustive.<br>9.2. De même, l\'accès au Site pourra être interrompu pour des raisons de maintenance.<br>9.3.&nbsp;\"7e-sky\"&nbsp;se réserve le droit de modifier ou de faire évoluer à tout moment, les fenêtres du Site&nbsp;lesachatsindustriels, ses fonctionnalités, les services, leur prix ou les conditions d\'utilisation qui lui sont applicables, et cela sans notification préalable d\'aucune sorte et sans que l’Utilisateur puisse invoquer un quelconque préjudice.</p><p><br><br><strong>***ARTICLE 10 - Données personnelles***</strong></p><p>&nbsp;</p><p>10.1. Données personnelles<br>10.1.1.&nbsp;\"7e-sky\"&nbsp;peut collecter et enregistrer des informations relatives à l’Utilisateur, personne physique ou morale, constituant des données à caractère personnel. Ces données sont enregistrées dans une base de données internes.<br>10.1.2.&nbsp;\"7e-sky\"&nbsp;à travers son site web&nbsp;www.lesachatsindustriels.com&nbsp;se réserve le droit de commercialiser les coordonnées téléphoniques, postales et/ou électroniques collectées auprès des Utilisateurs dans le cadre de ses services pour des opérations de mailing ciblées et d’envoi d’Alerte. Toutefois,&nbsp;\"7e-sky\"&nbsp;ne garantit pas la fiabilité et l’exactitude des données recueillies et ne peut dès lors engager une quelconque responsabilité en cas de non délivrance des envois adressés.<br>10.1.3. Lors de son inscription, l’Utilisateur pourra s’opposer à la communication à des tiers et à l’utilisation par&nbsp;\"7e-sky\"&nbsp;de ses coordonnées.<br>10.2. Les cookies<br>10.2.1. Dans le cadre de la consultation ou de l’utilisation du Site,&nbsp;www.lesachatsindustriels.com&nbsp;peut conserver certaines données concernant l’Utilisateur, pour les besoins du bon fonctionnement des services proposés ainsi qu’à des fins statistiques.<br>10.2.2. L\'activation de cette fonction n\'est pas nécessaire pour visiter le Site.<br>10.3. Autres données de connexion Lors de toute consultation du Site,&nbsp;www.lesachatsindustriels.com&nbsp;collecte certaines données concernant l’Utilisateur, à savoir l’adresse IP, la date et la durée de sa visite et le matériel technique utilisé (système d\'exploitation, navigateur…). Ces informations qui sont rendues anonymes, ne sont collectées sur le serveur de&nbsp;www.lesachatsindustriels.com&nbsp;et utilisées qu’à des fins statistiques.</p><p><br><strong>***ARTICLE 11 - Défauts de paiements***</strong></p><p>&nbsp;</p><p>11. En cas de défaut ou de litige nés du paiement par un Utilisateur des services proposés par&nbsp;Lesachatsindustriels, avec l’aide de ses partenaires financiers,&nbsp;\"7e-sky\"&nbsp;se réserve le droit à effectuer toutes démarches ou enquêtes nécessaires à la récupération de sa créance.</p><p>&nbsp;</p><p><strong>***ARTICLE 12 - Loi applicable et compétence***</strong></p><p>&nbsp;</p><p>12.1. Les présentes conditions générales d’utilisation et tout contrat conclu en vertu des présentes sont soumis au droit Marocain.<br>12.2. Tout litige relatif à la validité, à l’interprétation et/ou exécution des présentes et de tout contrat est soumis à la compétence des Tribunaux de Commerce de Casablanca – Maroc.<br>12.3. Malgré les traductions des présentes conditions générales en anglais, allemand, et autres langues qui pourraient être proposées ultérieurement, l’Utilisateur reconnaît que seule la version en langue française fera foi entre lui et&nbsp;\"7e-sky\".</p><p>&nbsp;</p>', 'conditions-generales'),
(2, 'Facturation', '<p>Contactez le département financier à propos de la facturation.<br><br><strong>Téléphone</strong> : +212-522.36.57.97.<br><strong>Fax</strong> : +212-522.36.57.94.<br><strong>Email</strong>: <a href=\"mailto:adherent@lesachatsindustriels.com\">adherent@lesachatsindustriels.com</a></p><p><strong>Coordonnées bancaires pour régler vos factures</strong><br><br><br><strong>Par virement bancaire Au :</strong><br><br>3F industrie<br>ATTIJARIWAFA BANK<br>CENTRE D\'AFFAIRE CASA PORTE D\'ANFA<br>Casablanca, Maroc<br><br><strong>Numéro du compte Bancaire</strong> : 007 780 000 4095 00000 254 292</p>', 'facturation');

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
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `date_validation` datetime DEFAULT NULL,
  `statut` tinyint(1) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `del` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(11, 'MAD', 0),
(12, 'Autre', 0);

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
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `demande_abonnement_sous_secteur`
--

CREATE TABLE `demande_abonnement_sous_secteur` (
  `demande_abonnement_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
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
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localisation` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_achat`
--

INSERT INTO `demande_achat` (`id`, `acheteur_id`, `statut`, `reference`, `description`, `date_expiration`, `is_public`, `nbr_visite`, `nbr_share`, `created`, `date_modification`, `is_alerted`, `is_anonyme`, `budget`, `del`, `motif_rejet_id`, `currency_id`, `titre`, `pays`, `ville`, `slug`, `localisation`) VALUES
(89, 40, 1, '2009-89', 'Achat de materiel informatique', '2016-12-06 00:00:00', 1, 0, NULL, '2009-04-02 17:11:51', '2009-12-06 13:26:09', 1, 0, 0, 0, NULL, 11, 'Demande de devis #89', 'Maroc', 'Casablanca', 'demande-devis-89', 1),
(100, 3, 1, '2009-100', 'ACHATS D\'ASSENCEUR TYPE 450 KG 5 NIVEAUX 1 M/S', '2016-12-09 00:00:00', 1, 0, NULL, '2009-05-26 10:30:51', '2017-12-08 16:28:54', 1, 0, 0, 0, NULL, 11, 'Demande de devis #100', 'Maroc', 'Casablanca', 'demande-devis-100', 1),
(101, 53, 1, '2009-101', 'BESOIN DE SURVEILLANCE ET GARDIENAGE', '2016-06-30 00:00:00', 1, 0, NULL, '2009-06-01 19:50:58', '2009-06-01 19:52:58', 1, 0, 0, 0, NULL, 11, 'Demande de devis #101', 'Maroc', 'Rabat', 'demande-devis-101', 1),
(102, 3, 1, '2009-102', 'ACHATS DE MATIERE PREMIERE PLASTIQUE PPE, QTE 10T/3MOIS', '2016-06-24 00:00:00', 1, 0, NULL, '2009-06-03 00:27:48', '2009-07-14 19:54:19', 1, 0, 0, 0, NULL, 11, 'Demande de devis #102', 'Maroc', 'Casablanca', 'demande-devis-102', 1),
(103, 3, 1, '2009-103', 'BESOIN EN RAYONNAGE CONVENTIONNEL POUR 2000 PALETTES.', '2016-06-29 00:00:00', 1, 0, NULL, '2009-06-28 16:35:43', '2009-06-28 16:36:12', 1, 0, 0, 0, NULL, 11, 'Demande de devis #103', 'Maroc', 'Casablanca', 'demande-devis-103', 1),
(104, 3, 1, '2009-104', 'BESOIN EN NIVELEUR DE QUAI POUR NOTRE CLIENT BASE A TANGER, POUR UNE QUANTITE DE 5 NIVELEURS.', '2016-02-11 00:00:00', 1, 0, NULL, '2009-06-28 16:38:39', '2010-02-19 11:51:33', 1, 0, 0, 0, NULL, 11, 'Demande de devis #104', 'Maroc', 'Casablanca', 'demande-devis-104', 1),
(105, 3, 1, '2009-105', 'Location ou Achat de conteneur 20 pieds climatisé pour stockage\r\ndes produits chimique pendant 3 mois.', '2016-08-10 00:00:00', 1, 0, NULL, '2009-06-28 16:48:29', '2010-03-25 10:33:04', 1, 0, 0, 0, NULL, 11, 'Demande de devis #105', 'Maroc', 'Casablanca', 'demande-devis-105', 1),
(106, 3, 1, '2009-106', 'Tanger Free Zone: Chapiteaux de 888m2 sol 74metre longueur et 12 mètre\r\nlargeur pour prestation RAMADAN 2009.\r\n120 Tables rondes.\r\n1200 Chaises pour tables.\r\nClient Basé Sur Tanger, Votre Offre HT, HD.', '2016-07-30 00:00:00', 1, 0, NULL, '2009-06-30 13:34:25', '2009-07-14 19:55:06', 1, 0, 0, 0, NULL, 11, 'Demande de devis #106', 'Maroc', 'Casablanca', 'demande-devis-106', 1),
(107, 58, 1, '2009-107', 'location  des chapitaux de 888m2 sol 74m longeur et 12 m de largeur pour prestation RAMADAN 2009 ( 1 mois) avec 120 tables rondes et 1200 chaises.\r\n\r\nMerci de noter que nous somme un groupe multinationale, installer dans la zone franche d\'exportation de Tanger.', '2016-07-10 00:00:00', 1, 0, NULL, '2009-07-01 08:56:06', '2009-07-07 13:34:37', 1, 0, 0, 0, NULL, 11, 'Demande de devis #107', 'Maroc', 'Kenitra', 'demande-devis-107', 1),
(108, 68, 1, '2009-108', 'PERCEUSE PNEUMATIQUE \r\nB33\r\nFACOM QUANTITE 02', '2016-07-01 00:00:00', 1, 0, NULL, '2009-07-02 15:37:37', '2009-07-02 15:48:03', 1, 0, 0, 0, NULL, 11, 'Demande de devis #108', 'Maroc', 'Casablanca', 'demande-devis-108', 1),
(113, 78, 1, '2009-113', 'APPEL D’OFFRE LOCATION CAMION LONGUE DUREE\r\nNous vous prions de nous faire parvenir votre meilleure offre de prix pour location d\'un camion avec cabine en bon état de 14t sous les conditions suivantes :\r\n\r\nPayement: 60 jours après date facture\r\nLivraison : A domicile\r\nService : 24/24 - 6/7 = Le service doit être assure par 2 chauffeur (24/24) qui doivent être instruit\r\nTravail dimanche : nous aurons éventuellement besoin du camion le dimanche (merci de préciser le cout sup. Jour/nuit.)\r\nGasoil : inclus\r\nPanne : en cas de panne du camion dépasse 2h, il fait faire un remplacement immédiat du camion, \r\nPermanence : les deux chauffeurs doivent être permanents sur notre site pour assurer les mouvements.\r\nIl faut tabler l\'offre sur  2500 km/mois. Et confirmer le cout des km sup.\r\nAssurance obligatoire : RC+ AT+Assurance marchandise couvrant 300.000dhs de dommage.\r\n\r\n\r\nNB : ce camion va travailler essentiellement dans la zone franche et éventuellement il fera des déplacements vers TAZA, Casa.', '2016-07-15 00:00:00', 1, 0, NULL, '2009-07-10 12:30:26', '2009-07-10 12:44:27', 1, 0, 0, 0, NULL, 11, 'Demande de devis #113', 'Maroc', 'Tanger', 'demande-devis-113', 1),
(114, 83, 1, '2009-114', 'Ponts de chargement en aluminium avec une charge utile de 1200 kg.', '2016-09-14 00:00:00', 1, 0, NULL, '2009-07-14 17:19:09', '2009-08-18 17:33:05', 1, 0, 0, 0, NULL, 11, 'Demande de devis #114', 'Maroc', 'Casablanca', 'demande-devis-114', 1),
(115, 102, 1, '2009-115', 'Bache d\'eau pour secourir l\'eau de l\'ONEP de cap.5m3 en inox 316 L avec système de chloration et déchloration , système de surpression , filtres....', '2016-09-18 00:00:00', 1, 0, NULL, '2009-08-11 09:51:59', '2009-09-11 10:35:45', 1, 0, 0, 0, NULL, 11, 'Demande de devis #115', 'Maroc', 'Casablanca', 'demande-devis-115', 1),
(116, 102, 1, '2009-116', 'Deux aspirateurs de dimensions 50 cm * 50 cm , robuste pour aspirer l\'air chaud d\'une salle de 100 m2', '2016-10-29 00:00:00', 1, 0, NULL, '2009-08-11 09:54:43', '2009-10-29 11:42:37', 1, 0, 0, 0, NULL, 11, 'Demande de devis #116', 'Maroc', 'Casablanca', 'demande-devis-116', 1),
(117, 102, 1, '2009-117', 'Bac de lavage en inox 304 L divisé trois compartiments pour usage agro-alimentaire de longeur2500 mm , largeur 400 mm , hauteur 850 mm.', '2016-10-29 00:00:00', 1, 0, NULL, '2009-08-11 09:58:17', '2009-10-29 11:42:03', 1, 0, 0, 0, NULL, 11, 'Demande de devis #117', 'Maroc', 'Casablanca', 'demande-devis-117', 1),
(118, 102, 1, '2009-118', 'Porte métallique de 4.3 * 5 m avec moteur et bouton marche arrêt.', '2016-10-29 00:00:00', 1, 0, NULL, '2009-08-13 15:51:37', '2009-10-29 11:41:12', 1, 0, 0, 0, NULL, 11, 'Demande de devis #118', 'Maroc', 'Casablanca', 'demande-devis-118', 1),
(119, 102, 1, '2009-119', '01 Gerbeur 1500 kg , température d\'utilisation =-25°C , rayon de braquage : le minimum possible , fourche : 1200mm , hauteur à atteindre :4500 mm', '2016-10-29 00:00:00', 1, 0, NULL, '2009-08-13 15:59:03', '2010-03-29 15:19:21', 1, 0, 0, 0, NULL, 11, 'Demande de devis #119', 'Maroc', 'Casablanca', 'demande-devis-119', 1),
(120, 102, 1, '2009-120', '01 Gerbeur 1500 kg , température d\'utilisation =  T ambiante , hauteur à atteidre 4.5 metres , Rayon de braquage: le moins encombrant possible. ', '2016-10-29 00:00:00', 1, 0, NULL, '2009-08-13 16:02:21', '2010-03-29 15:18:48', 1, 0, 0, 0, NULL, 11, 'Demande de devis #120', 'Maroc', 'Casablanca', 'demande-devis-120', 1),
(121, 102, 1, '2009-121', '06 transpalettes galvanisées , capacité en kg : 2500 kg , descente : par poigné , longeur des fourches : 1150 mm', '2016-10-29 00:00:00', 1, 0, NULL, '2009-08-13 16:06:58', '2009-10-29 11:39:24', 1, 0, 0, 0, NULL, 11, 'Demande de devis #121', 'Maroc', 'Casablanca', 'demande-devis-121', 1),
(122, 143, 1, '2009-122', 'cable de skipe metalique 22MM', '2016-08-25 00:00:00', 1, 0, NULL, '2009-08-24 11:00:19', '2009-08-24 11:38:45', 1, 0, 0, 0, NULL, 11, 'Demande de devis #122', 'Maroc', 'Marrakech', 'demande-devis-122', 1),
(123, 143, 1, '2009-123', '05 CAMIONS  3,5T-7T-8T \r\nETAT NEUF', '2016-09-15 00:00:00', 1, 0, NULL, '2009-08-25 11:00:30', '2009-09-12 14:04:57', 1, 0, 0, 0, NULL, 11, 'Demande de devis #123', 'Maroc', 'Marrakech', 'demande-devis-123', 1),
(124, 143, 1, '2009-124', '01 ONDULEUR POUR PC MGE 600VA', '2016-08-27 00:00:00', 1, 0, NULL, '2009-08-25 11:02:37', '2009-09-11 10:31:12', 1, 0, 0, 0, NULL, 11, 'Demande de devis #124', 'Maroc', 'Marrakech', 'demande-devis-124', 1),
(125, 146, 1, '2009-125', 'Nous recherchons 10 rallonges 4 poste+terre (long:5m)\r\nmarque LEGRAND 3500W', '2016-09-10 00:00:00', 1, 0, NULL, '2009-08-25 12:23:19', '2009-09-17 21:31:33', 1, 0, 0, 0, NULL, 11, 'Demande de devis #125', 'Maroc', 'Casablanca', 'demande-devis-125', 1),
(126, 143, 1, '2009-126', '01 PICK UP NEUVE', '2016-09-10 00:00:00', 1, 0, NULL, '2009-09-01 14:27:45', '2009-09-11 10:34:25', 1, 0, 0, 0, NULL, 11, 'Demande de devis #126', 'Maroc', 'Marrakech', 'demande-devis-126', 1),
(127, 143, 1, '2009-127', '20 VOITURES UTILITAIRES EQUIVALENT A BERLIN ESPACE OU DACIA ', '2016-09-15 00:00:00', 1, 0, NULL, '2009-09-01 14:29:40', '2009-09-12 14:04:42', 1, 0, 0, 0, NULL, 11, 'Demande de devis #127', 'Maroc', 'Marrakech', 'demande-devis-127', 1),
(128, 166, 1, '2009-128', 'Besoin de matériel informatique et électrique suivant:\r\n\r\n> Cordons informatiques de 10ML (prix pour les CAT6 et les CAT5).....................   Qté 30.\r\n> Câble électrique (courbe C, section 6mm2, constitué de deux files intérieur en rouge (-)  et bleu(+) ) ................................Qté 300ML.\r\n> Disjoncteur unipolaire 10A avec embouts 6mm2.....................................Qté 30.\r\n> Prix des Jarretières optiques d\'environ 10M avec connecteurs. \r\n\r\n> Switch 24ports, similaire au Switch Cisco Catalyst 3750 ME avec module d\'alimentation en 48V DC.\r\n\r\nUne demande directe et officielle sera envoyée après consultation des réponses.', '2016-09-08 00:00:00', 1, 0, NULL, '2009-09-02 11:56:54', '2009-09-11 10:30:25', 1, 0, 0, 0, NULL, 11, 'Demande de devis #128', 'Maroc', 'Casablanca', 'demande-devis-128', 1),
(129, 143, 1, '2009-129', 'Besoin en :\r\n\r\n01UN : CARTE POUR PILOTE BOSCH 324A2871837001390 \r\n01UN : CARTE POUR PILOTE BOSCH 4176A1911837001391\r\n01UN : CARTE POUR PILOTE BOSCH 1435A3831837001378\r\n', '2016-09-07 00:00:00', 1, 0, NULL, '2009-09-03 09:40:56', '2009-09-03 09:49:35', 1, 0, 0, 0, NULL, 11, 'Demande de devis #129', 'Maroc', 'Marrakech', 'demande-devis-129', 1),
(130, 89, 1, '2009-130', ' besoin d’une unité moderne de trituration des olives (système continu): fourniture, installation et mise en marche et avoir une capacité de production de 350 Kg d’olives par heure et travaillant sous une tension de service de 380 volts à trois fil ', '2016-09-30 00:00:00', 1, 0, NULL, '2009-09-09 01:57:45', '2009-09-09 09:32:32', 1, 0, 0, 0, NULL, 11, 'Demande de devis #130', 'Maroc', 'Ouezzane', 'demande-devis-130', 1),
(131, 179, 1, '2009-131', 'Veuillez trouver ci-dessous la liste de notre besoin en matériels informatiques pour notre  nouvelle filière qui sera basée sur  BENI MELLAL.\r\n\r\n04- UC DX2400 CORE 2 DUO 2,8/3G/250G SANS ECRAN\r\n\r\n06- DX2390MT 2,5/1G/160 + TFT 19\"\r\n\r\n01- Imp couleur A3 officejet7103	\r\n01- Imp laser couleur A4 1515N	\r\n02- Imp matricielle EPSON LQ300+	\r\n04- Imp laser Mono chrome A4 3010	\r\n10- Support de l\'unité centrale en metal\r\n	\r\n03- Onduleur 1000v MGE NOVA 1250	\r\n\r\n01- Fax brother 2820	\r\n\r\n02- Swtch 8 port 3COM	\r\n', '2016-09-15 00:00:00', 1, 0, NULL, '2009-09-09 11:11:00', '2009-09-14 15:08:19', 1, 0, 0, 0, NULL, 11, 'Demande de devis #131', 'Maroc', 'Marrakech', 'demande-devis-131', 1),
(135, 185, 1, '2009-135', 'Besoin en belets pour boisson chaude et froide, taille moyenne, à utilisation fréquente. \r\n1ère Quantité à livrer: 450 Unité.', '2016-09-26 00:00:00', 1, 0, NULL, '2009-09-23 17:45:53', '2009-09-25 12:10:50', 1, 0, 0, 0, NULL, 11, 'Demande de devis #135', 'Maroc', 'Tanger', 'demande-devis-135', 1),
(136, 58, 1, '2009-136', 'Besoin en Audit par un organisme externe ( certifié HACCP) vis à vis  notre sous-traitant de gestion de notre cantine .', '2016-09-30 00:00:00', 1, 0, NULL, '2009-09-24 15:59:32', '2009-09-25 14:23:45', 1, 0, 0, 0, NULL, 11, 'Demande de devis #136', 'Maroc', 'Kenitra', 'demande-devis-136', 1),
(137, 185, 1, '2009-137', 'NOUS AVONS BESOIN DE PRODUITS DE LA MARQUE PARKER:\r\nGARNITURE SM 551472/1AX \r\nGARNITURE WRM 472519\r\nANNEAU DE GUIDE I/DRW 60\r\nGarniture code E/GR 0850\r\nGarniture code E/GR 0900\r\nAnneau de guidage type I/DWR 40/2\r\nAnneau de guidage type I/DWR 55\r\nAnneau de guidage type I/DWR 60\r\nAnneau de guidage type E/DWR 30/2\r\nGarniture \r\nGarniture type WRM 118 149\r\nGarniture type MU/P 4230\r\nGarniture type I/DWR 30/2\r\nGarniture type DBM 216 153\r\nRACLEUR WRM 314346  \r\nQTE 1 DE CHAQUE PRODUIT', '2016-10-05 00:00:00', 1, 0, NULL, '2009-09-25 10:59:35', '2009-09-25 11:26:21', 1, 0, 0, 0, NULL, 11, 'Demande de devis #137', 'Maroc', 'Tanger', 'demande-devis-137', 1),
(138, 185, 1, '2009-138', 'Nous avons besoin de:\r\nCourroie transport dentée 985H30M.M B30mm L2501,9mm\r\nLA MARQUE BANDO POUR EQUIPEMENT ETIREUSE DE LA PRESSE', '2016-10-05 00:00:00', 1, 0, NULL, '2009-09-25 11:02:37', '2009-09-25 11:27:12', 1, 0, 0, 0, NULL, 11, 'Demande de devis #138', 'Maroc', 'Tanger', 'demande-devis-138', 1),
(139, 77, 1, '2009-139', 'BESOIN EN PIGNONS VOIR FICHE JOINTE', '2016-09-25 00:00:00', 1, 0, NULL, '2009-09-26 17:19:23', '2009-09-26 17:21:48', 1, 0, 0, 0, NULL, 11, 'Demande de devis #139', 'Maroc', 'Mohammadia', 'demande-devis-139', 1),
(140, 77, 1, '2009-140', 'Besoin en Rayonnage métallique type léger selon plan ci-joint.', '2016-10-10 00:00:00', 1, 0, NULL, '2009-09-28 14:56:10', '2009-09-28 14:56:42', 1, 0, 0, 0, NULL, 11, 'Demande de devis #140', 'Maroc', 'Mohammadia', 'demande-devis-140', 1),
(141, 143, 1, '2009-141', '01 tendeuse pour jardin type T.51 XP MARQUE WOLF OU EQUIVALENTE', '2016-10-07 00:00:00', 1, 0, NULL, '2009-09-28 14:56:18', '2009-09-30 15:46:41', 1, 0, 0, 0, NULL, 11, 'Demande de devis #141', 'Maroc', 'Marrakech', 'demande-devis-141', 1),
(143, 77, 1, '2009-143', 'Besoin en 100 Vestiaires métalliques à 02 portes/ 02 cases – 198x30x50 CM. EP 7/10.', '2016-10-13 00:00:00', 1, 0, NULL, '2009-10-02 23:16:32', '2009-10-08 16:50:05', 1, 0, 0, 0, NULL, 11, 'Demande de devis #143', 'Maroc', 'Mohammadia', 'demande-devis-143', 1),
(144, 185, 1, '2009-144', 'Besoin en Prestation de nettoyage au sein de notre administration.\r\nCette demande est réservée aux sociétés basées sur la ville de Tanger.', '2016-10-12 00:00:00', 1, 0, NULL, '2009-10-06 11:52:18', '2009-10-06 19:13:59', 1, 0, 0, 0, NULL, 11, 'Demande de devis #144', 'Maroc', 'Tanger', 'demande-devis-144', 1),
(145, 208, 1, '2009-145', 'Merci de nous faire votre proposition pour la construction d\'un hangar avec les dimensions suivantes:\r\nLargeur: 13.24m\r\nLongueur:24m avec travées de 6m\r\nHauteur 5 a 6m\r\nToit de préférence en charpente', '2016-10-31 00:00:00', 1, 0, NULL, '2009-10-17 06:42:45', '2009-10-17 12:38:01', 1, 0, 0, 0, NULL, 11, 'Demande de devis #145', 'Maroc', 'Casablanca', 'demande-devis-145', 1),
(146, 185, 1, '2009-146', 'Je vous mets ci-joint une liste des pièces de rechange  dont je vous demande de bien vouloir nous faire une offre commerciale complète comprenant vos délais de livraison de chaque produit.', '2016-10-23 00:00:00', 1, 0, NULL, '2009-10-19 15:10:40', '2009-10-19 15:56:16', 1, 0, 0, 0, NULL, 11, 'Demande de devis #146', 'Maroc', 'Tanger', 'demande-devis-146', 1),
(147, 211, 1, '2009-147', 'TAPIS RHINO-BAND D\r\nlisières bouclage DG\r\nMatière : acier doux ecroui\r\n1 tapis de 40mx2.30m', '2016-10-30 00:00:00', 1, 0, NULL, '2009-10-20 10:17:26', '2009-10-21 12:28:58', 1, 0, 0, 0, NULL, 11, 'Demande de devis #147', 'Maroc', 'Casablanca', 'demande-devis-147', 1),
(148, 211, 1, '2009-148', 'Duplex souple imprimé 2 à 5 couleurs différentes laizes de 90 à 525mm.\r\n20T/3mois', '2016-10-30 00:00:00', 1, 0, NULL, '2009-10-20 10:24:05', '2009-10-21 14:15:44', 1, 0, 0, 0, NULL, 11, 'Demande de devis #148', 'Maroc', 'Casablanca', 'demande-devis-148', 1),
(149, 212, 1, '2009-149', 'Cherchons prestataire pour réaliser des travaux d\'éclairage (diagnostic des causes de dysfonctionnement + réparation) dans un entrepot de  10 000 m2 en activité, hauteur sous plafond de environ 11 m. \r\nLe prestataire qui nous contactera devra étre assuré et montrer ses habilitations électrique, intervention sur site certifé ISO...', '2016-10-31 00:00:00', 1, 0, NULL, '2009-10-20 17:05:48', '2009-10-30 11:53:36', 1, 0, 0, 0, NULL, 11, 'Demande de devis #149', 'Maroc', 'Casablanca', 'demande-devis-149', 1),
(150, 213, 1, '2009-150', 'Nous souhaitons réaliser 2 installations racking : une de 2500 EPR en rack à accumulation et l’autre de 2.000 EPR en rack conventionnel. Détail des plans et gabarit palette en pièce jointe.', '2016-10-23 00:00:00', 1, 0, NULL, '2009-10-20 17:34:25', '2009-10-20 22:56:40', 1, 0, 0, 0, NULL, 11, 'Demande de devis #150', 'Maroc', 'Casablanca', 'demande-devis-150', 1),
(151, 214, 1, '2009-151', 'Achat du Logiciel Autocad 2009 avec licence mono poste', '2016-10-23 00:00:00', 1, 0, NULL, '2009-10-21 13:19:14', '2009-10-21 13:40:14', 1, 0, 0, 0, NULL, 11, 'Demande de devis #151', 'Maroc', 'Casablanca', 'demande-devis-151', 1),
(152, 185, 1, '2009-152', 'Equipement pour dépoussierage des sols en 50mm\r\nBesoin Urgent', '2016-10-23 00:00:00', 1, 0, NULL, '2009-10-22 09:15:18', '2009-10-22 10:49:10', 1, 0, 0, 0, NULL, 11, 'Demande de devis #152', 'Maroc', 'Tanger', 'demande-devis-152', 1),
(153, 77, 1, '2009-153', 'Nous cherchons des fabricants de palettes fumigées ( anti-feux) pour export par avion Dim palette 800x1000. EN ADMISSION TEMPORAIRE.\r\nQté mensuelle environ 100 \r\n\r\n', '2016-11-03 00:00:00', 1, 0, NULL, '2009-10-24 16:44:03', '2009-10-27 11:48:49', 1, 0, 0, 0, NULL, 11, 'Demande de devis #153', 'Maroc', 'Mohammadia', 'demande-devis-153', 1),
(154, 207, 1, '2009-154', 'Merci de nos communiquer votre offre de prix pour la fourniture des motoréducteur  arbre creux suivantes en respectant le type indiquer sur la photo ci jointe:\r\n          2- Motoréducteurs à train parallèle (voir photo ci jointe)  Puissance:1 CV Vitesse de sortie 10 tr/min.\r\n          2- Motoréducteurs à train parallèle (voir photo ci jointe)  Puissance:2 CV Vitesse de sortie 40à50 tr/min.\r\n          1- Motoréducteurs à train parallèle (voir photo ci jointe)  Puissance:3 CV Vitesse de sortie 40à50 tr/min.\r\n* Moto réducteur à 2 ou 3 trains. \r\n* Moteur triphasé accouplé.', '2016-11-10 00:00:00', 1, 0, NULL, '2009-10-28 10:39:01', '2009-10-28 16:13:28', 1, 0, 0, 0, NULL, 11, 'Demande de devis #154', 'Maroc', 'Casablanca', 'demande-devis-154', 1),
(155, 185, 1, '2009-155', 'Nous Cherchons un fournisseur sur la zone de Tanger, qui peut nous fournir des flexibles et des composants pneumatiques pour un budget d’achat annuel de plus de 300 000,00 Dhs.\r\nNous consommons des composants tels que :\r\nLes raccords, les limiteurs de débits les flexibles, les pompes à graisses …\r\nNous exigeant la disponibilité de stock, le respect des délais de livraisons ainsi que la bonne santé financière du fournisseur.', '2016-11-10 00:00:00', 1, 0, NULL, '2009-10-29 12:36:13', '2009-11-09 08:57:34', 1, 0, 0, 0, NULL, 11, 'Demande de devis #155', 'Maroc', 'Tanger', 'demande-devis-155', 1),
(156, 234, 1, '2009-156', 'Besoin en rayonnage selon plan ci-joint.\r\nLe nombre de traves ainsi que le détail du besoin est sur le plan.\r\nMeilleures salutations.\r\n', '2016-11-21 00:00:00', 1, 0, NULL, '2009-11-05 10:26:29', '2009-11-12 12:39:29', 1, 0, 0, 0, NULL, 11, 'Demande de devis #156', 'Maroc', 'Casablanca', 'demande-devis-156', 1),
(157, 58, 1, '2009-157', 'BESOIN EN USTENSILES DE CUISINE SELON LISTE CI-JOINTE SUR LE LIEN SUIVANT: \r\nhttp://www.lesachatsindustriels.com/ImageDemande/AC_8620Q274_DP_UC.pdf\r\n', '2016-11-19 00:00:00', 1, 0, NULL, '2009-11-13 11:33:39', '2009-11-16 15:24:11', 1, 0, 0, 0, NULL, 11, 'Demande de devis #157', 'Maroc', 'Kenitra', 'demande-devis-157', 1),
(158, 185, 1, '2009-158', 'Besoin en Matériel informatique : Le prestataire devra faire un diagnostique et audit du parc existant, et la proposition selon état du matériel du remplacement. Ceci comprend nos deux sites une cinquantaine sur Tanger ainsi qu’une cinquantaine sur nos agences sur Casablanca.\r\nAU TOTAL 100 MACHINES ENTRE PC PORTABLE ET PC FIXE.', '2016-11-25 00:00:00', 1, 0, NULL, '2009-11-13 16:15:35', '2009-11-23 11:26:47', 1, 0, 0, 0, NULL, 11, 'Demande de devis #158', 'Maroc', 'Tanger', 'demande-devis-158', 1),
(159, 242, 1, '2009-159', 'Cherche organisme de formation  pour thèmes: Cariste - Secouriste au travail - Equipiers de premières intervention ', '2016-11-30 00:00:00', 1, 0, NULL, '2009-11-23 15:07:59', '2009-11-25 10:07:45', 1, 0, 0, 0, NULL, 11, 'Demande de devis #159', 'Maroc', 'Casablanca', 'demande-devis-159', 1),
(160, 242, 1, '2009-160', 'Besoin organisme pour réalisation de l\'ingénierie de formation conformément aux exigences de l\'OFPPT ', '2016-11-30 00:00:00', 1, 0, NULL, '2009-11-23 17:42:07', '2009-11-24 11:59:19', 1, 0, 0, 0, NULL, 11, 'Demande de devis #160', 'Maroc', 'Casablanca', 'demande-devis-160', 1),
(161, 77, 1, '2009-161', 'Travaux mécaniques sur une grosse machine.\r\n(Voir liste des travaux en fichier ci-joint)', '2016-12-08 00:00:00', 1, 0, NULL, '2009-11-26 11:16:38', '2009-11-26 11:17:29', 1, 0, 0, 0, NULL, 11, 'Demande de devis #161', 'Maroc', 'Mohammadia', 'demande-devis-161', 1),
(162, 251, 1, '2009-162', 'AMENAGEMENT D\'UN ESPACE D\'ACCUEIL\r\nACHATS DE MEUBLES : \r\n-	Nombre de Chaises : 1200 (plusieurs gammes)\r\n-	Nombre de Tables : 180 (1,5 m de diamètre, prévue pour un service à table pour 10 personnes assises)\r\n\r\n', '2016-12-16 00:00:00', 1, 0, NULL, '2009-12-02 12:54:41', '2009-12-09 17:54:16', 1, 0, 0, 0, NULL, 11, 'Demande de devis #162', 'Maroc', 'Marrakech', 'demande-devis-162', 1),
(163, 264, 1, '2009-163', 'Nous avons besoin d’une presse à comprimés de  préférence de marque \"Courtoy\", fonctionnant en euronormes BB avec un  minimum de 30 stations et pouvant atteindre une capacité de 300.000 cph d\'âge  <= à 17 ans.\r\n Si vous avez des offres correspondant de manière + ou - exacte à  ce besoin, je vous prie de bien vouloir me contacter dès que possible avec vos  meilleures offres de prix, délais, services et transport.\r\nMerci d\'avance', '2017-02-01 00:00:00', 1, 0, NULL, '2009-12-14 10:43:00', '2009-12-14 10:54:20', 1, 0, 0, 0, NULL, 11, 'Demande de devis #163', 'Maroc', 'Bouskoura', 'demande-devis-163', 1),
(164, 264, 1, '2009-164', 'Nous avons besoin de 25 paires de potelets de séparation en inox avec ruban pour délimiter des zones au sein de notre ligne de production.\r\nHauteur: entre 100 et 130 cm\r\nTaille ruban: 200 cm', '2017-01-29 00:00:00', 1, 0, NULL, '2009-12-14 14:37:41', '2009-12-17 16:52:48', 1, 0, 0, 0, NULL, 11, 'Demande de devis #164', 'Maroc', 'Bouskoura', 'demande-devis-164', 1),
(165, 264, 1, '2009-165', 'Nous avons besoin d\'une solution  complète pour l\'équipement d’une blanchisserie industrielle (calendre de repassage, machine à laver 30 kg, séchoir à linge, table à repasser, pressoir à vapeur...). Ce qu\'il faudrait pour constituer une blanchisserie industrielle en interne pour une entreprise de 350 ouvriers et techniciens.\r\nNous somme Ouvert à toute proposition en lots égalant ou dépassant ce besoin.', '2017-02-12 00:00:00', 1, 0, NULL, '2009-12-15 14:31:00', '2009-12-17 14:58:56', 1, 0, 0, 0, NULL, 11, 'Demande de devis #165', 'Maroc', 'Bouskoura', 'demande-devis-165', 1),
(166, 58, 1, '2009-166', 'Nous avons besoin de 85m2 de Film antireflet blanc à coller sur nos vitres et portes vitrés.', '2016-12-25 00:00:00', 1, 0, NULL, '2009-12-22 11:27:09', '2009-12-22 11:59:39', 1, 0, 0, 0, NULL, 11, 'Demande de devis #166', 'Maroc', 'Kenitra', 'demande-devis-166', 1),
(167, 58, 1, '2009-167', 'Nous avons besoin de faire la numérotation de nos 25 transpalettes manuels par agrafage.', '2016-12-28 00:00:00', 1, 0, NULL, '2009-12-22 18:57:30', '2009-12-24 15:02:01', 1, 0, 0, 0, NULL, 11, 'Demande de devis #167', 'Maroc', 'Kenitra', 'demande-devis-167', 1),
(168, 287, 1, '2009-168', '* Vidéo enregistreur avec et sans connectivité ;\r\n\r\n* Caméra à usage extérieur, Portée 25 m IR 24 Led et plus \r\n\r\n* Caméra dôme Portée 25 m IR 24 Led et plus ', '2016-12-09 00:00:00', 1, 0, NULL, '2009-12-30 12:55:17', '2010-02-15 18:33:50', 1, 0, 0, 0, NULL, 11, 'Demande de devis #168', 'Maroc', 'Casablanca', 'demande-devis-168', 1),
(169, 77, 1, '2010-169', 'Nous avons besoin de :\r\n08 Molettes selon plans, photos et le descriptif des textes à graver.\r\n\r\nNB : Les textes en noir  doivent être gravés sur la molette par contre nous aurons besoin d’un  module de chiffre interchangeable (texte en rouge) : 2010 pour l’année.\r\n', '2017-01-20 00:00:00', 1, 0, NULL, '2010-01-04 10:32:50', '2010-03-25 15:47:58', 1, 0, 0, 0, NULL, 11, 'Demande de devis #169', 'Maroc', 'Mohammadia', 'demande-devis-169', 1),
(170, 293, 1, '2010-170', 'Nous souhaitons recevoir les meilleures offres pour la fourniture suivante:\r\nProfilés UAP130 : 120ml.\r\nPlat 50x5mm : 24ml.\r\nTôle ép. 2.5mm : 630m2.\r\nCornière 30x30x3 : 60ml.\r\n1260m2 de laine de roche ép 50mm, B353 ROCLAINE (température limite 650 °C)\r\nMerci d’avance.', '2017-01-17 00:00:00', 1, 0, NULL, '2010-01-08 09:55:32', '2010-01-08 10:02:36', 1, 0, 0, 0, NULL, 11, 'Demande de devis #170', 'Maroc', 'Casablanca', 'demande-devis-170', 1),
(171, 272, 1, '2010-171', 'Nous avons besoin de deux nacelles suspendues motorisées au moyen de treuils électriques, la vitesse d’élévation est en moyenne de 9 m/min. Chaque plateforme devra être constituée  de deux modules en aluminium de 3 mètres chacune. \r\nLes systèmes de suspension doivent être adaptés à un accrochage sur des supports chariots installés sur les toitures du bâtiment.\r\nLes treuils doivent avoir une capacité de 2000 Kg et doivent être alimentés par du 220 Volts en monophasé et 380 Volts en triphasé.\r\nLes câbles des treuils auront une longueur de 100 m par treuil.\r\nTous les équipements doivent être conformes à la réglementation en vigueur, les échafaudages volants et les plateformes suspendues motorisées doivent être  reconnus par les professionnels des contrôles techniques et les organismes de prévention comme la référence en matière de sécurité pour l\'élévation du personnel effectuant des travaux légers.\r\n', '2017-03-10 00:00:00', 1, 0, NULL, '2010-01-08 11:12:26', '2010-02-23 17:07:31', 1, 0, 0, 0, NULL, 11, 'Demande de devis #171', 'Maroc', 'Casablanca', 'demande-devis-171', 1),
(172, 58, 1, '2010-172', 'Bonjour,\r\n\r\nNous avons besoin de faire un diagnostiquer de l’état du matériel de notre cuisine.\r\n\r\nDe plus  nous comptons sur vous de nous fournir votre offre de prix de maintenance dont le cadre d’un contrat annuel.\r\n	\r\nDans l’attente de confirmation de  votre visite début de la semaine prochaine.', '2017-01-27 00:00:00', 1, 0, NULL, '2010-01-19 12:44:41', '2010-01-20 10:07:39', 1, 0, 0, 0, NULL, 11, 'Demande de devis #172', 'Maroc', 'Kenitra', 'demande-devis-172', 1),
(176, 264, 1, '2010-176', 'Nous avons besoin de 2 générateurs de courant Diesel 600-800 kVA.\r\nDELAI PROROGE (VOIR NOUVELLE DATE)', '2017-02-20 00:00:00', 1, 0, NULL, '2010-02-03 15:50:59', '2010-02-15 14:32:32', 1, 0, 0, 0, NULL, 11, 'Demande de devis #176', 'Maroc', 'Bouskoura', 'demande-devis-176', 1),
(177, 264, 1, '2010-177', 'Nous avons besoin d\'un calibreur tamiseur de marque Frewitt à tamis oscillant modèle MF-6.\r\n\r\nDélai prorogé (Voir nouvelle date)', '2017-02-20 00:00:00', 1, 0, NULL, '2010-02-04 08:47:45', '2010-03-11 17:25:30', 1, 0, 0, 0, NULL, 11, 'Demande de devis #177', 'Maroc', 'Bouskoura', 'demande-devis-177', 1),
(187, 77, 1, '2010-187', 'Le présent marché a pour objet la réalisation d’une machine de roulage de contreplaqués pour nos besoins en fûts de Diamètre 200 mm, Largeur 500 mm, Épaisseur 3 mm.\r\nLa feuille du contreplaqué est trempée dans de l’eau chaude et passe ensuite à la machine de roulage cylindrique.\r\nLa jonction des extrémités du fût se fait à l’aide d’une languette placée en dessous de la jointure et le maintien est assuré par des agrafes (Voir photos).\r\nLa présente demande doit être réalisée suivant nos données (Description ; Photos … ) et dans les règles de l’art.\r\nL’Entrepreneur devra présenter à notre société un plan de réalisation de la machine établi suivant nos données et ne pourra  être mis en exécution qu’après acceptation  par ordre de service délivré par nos soins. \r\nL’Entrepreneur devra respecter le délai de réalisation sur lequel nous nous mettrons d’accord.\r\n\r\n(Voir pièdes jointes).', '2017-03-10 00:00:00', 1, 0, NULL, '2010-02-23 15:34:24', '2010-03-04 15:46:09', 1, 0, 0, 0, NULL, 11, 'Demande de devis #187', 'Maroc', 'Mohammadia', 'demande-devis-187', 1),
(191, 318, 1, '2010-191', 'Nous avons besoin d’une entreprise spécialisée dans la sécurité (Matériels et services) qui peut nous accompagner pour élaborer un plan de sécurité (plan d’évacuation, formation 1er secours…) et pouvoir l’exécuter dans les règles de l’art.\r\nL’entreprise intéressée devra être conventionnée et certifiée auprès des compagnies d’assurances et disposera de tout agrément nécessaire délivré par les administrations et fédérations compétentes.', '2017-03-11 00:00:00', 1, 0, NULL, '2010-02-24 11:46:05', '2010-04-01 17:56:12', 1, 0, 0, 0, NULL, 11, 'Demande de devis #191', 'Maroc', 'Casablanca', 'demande-devis-191', 1),
(192, 320, 1, '2010-192', '*****DATE PROROGER*****\r\n\r\nCloutier d’encadrement de Ciol : \r\nPoids : corps 3.67kgs (8.07Ibs) en aluminium\r\nCorps du magnésium 3.38kgs (7.43Ibs)\r\nCapacité du magasin : 225-300 Clous\r\nDiamètre de jambe : 2.3-2.9mm (0.092 \" - 0.113 \")\r\nLongueur des clous : 45mm-70mm (1-3/4 \"--2-3/4 \")\r\nOpération : 5-7kgs/cm2 (70-100psi) \r\n\r\nQuantité = 05 unité\r\n\r\n(Voir photo ci-jointe) ', '2017-03-31 00:00:00', 1, 0, NULL, '2010-02-24 12:28:52', '2010-03-25 08:58:25', 1, 0, 0, 0, NULL, 11, 'Demande de devis #192', 'Maroc', 'Meknes', 'demande-devis-192', 1),
(194, 306, 1, '2010-194', 'Sachet Biodégradable \r\n(Voir détail sur le PDF ci-joint)', '2017-03-26 00:00:00', 1, 0, NULL, '2010-02-25 14:13:23', '2010-02-25 17:32:07', 1, 0, 0, 0, NULL, 11, 'Demande de devis #194', 'Maroc', 'Casablanca', 'demande-devis-194', 1),
(195, 335, 1, '2010-195', '>>>>>  DELAI PROLONGE  <<<<<\r\nNous avons besoin de deux (02) GERBEURS équivalant au model en fichier ci-joint fonctionnant en \r\nHauteur mât abaissé Inférieur à 2,20m.\r\nCharge à porter = 1,5 T.\r\nHauteur mât déployé= 3 m.\r\nTempérature Négative -18°C.\r\n\r\nQuantité= 02.\r\n\r\n\r\n(Voir fichier attaché)', '2017-04-24 00:00:00', 1, 0, NULL, '2010-03-12 17:03:30', '2010-04-14 10:24:49', 1, 0, 0, 0, NULL, 11, 'Demande de devis #195', 'Maroc', 'Rabat', 'demande-devis-195', 1),
(196, 351, 1, '2010-196', 'PEINTURE resistant à l\'eau, avec sechage rapide, non inflammable, couleur noir (finition peu intense) Pour marquage exterieure des pipes sous marins', '2017-03-30 00:00:00', 1, 0, NULL, '2010-03-25 11:29:12', '2010-03-29 09:55:42', 1, 0, 0, 0, NULL, 11, 'Demande de devis #196', 'France', 'Caissargues', 'demande-devis-196', 1),
(197, 355, 1, '2010-197', 'Nous avons besoin d\'une solution de rayonnage mixte Accumulation et conventionnel selon plan ci-joint.\r\nDim palette 800x1200x1600 poids 1000Kg.', '2017-04-09 00:00:00', 1, 0, NULL, '2010-03-25 17:18:40', '2010-03-31 17:29:45', 1, 0, 0, 0, NULL, 11, 'Demande de devis #197', 'Maroc', 'Casablanca', 'demande-devis-197', 1),
(201, 335, 1, '2010-201', 'Nous aurons besoin de thermomètre à sonde pour contrôler la température à la réception des produits congelés. \r\nNombre demandé : 3 thermomètres à sonde pour mesurer la température à cœur des produits congelés à la réception.', '2017-04-10 00:00:00', 1, 0, NULL, '2010-03-26 11:48:58', '2010-03-26 11:54:00', 1, 0, 0, 0, NULL, 11, 'Demande de devis #201', 'Maroc', 'Rabat', 'demande-devis-201', 1),
(204, 358, 1, '2010-204', 'Produit de nettoyage industriel des pièces mécaniques.\r\nNon nocif aux intervenants ni à l\'environnement\r\nAgrée par la CEE, certifié ISO ou DIN.\r\nA joindre une notice en français ou en anglais', '2017-05-01 00:00:00', 1, 0, NULL, '2010-03-27 09:43:09', '2010-03-29 09:52:42', 1, 0, 0, 0, NULL, 11, 'Demande de devis #204', 'Maroc', 'Temara', 'demande-devis-204', 1),
(208, 3, 1, '2010-208', 'Je recherche des fournisseurs capables de me réaliser les 3 pièces selon plans ci-joint.\r\nLa technologie pressentie est : MOULAGE CONTACT (sinon moulage basse pression)', '2017-04-24 00:00:00', 1, 0, NULL, '2010-04-09 15:34:41', '2010-04-23 11:39:55', 1, 0, 0, 0, NULL, 11, 'Demande de devis #208', 'Maroc', 'Casablanca', 'demande-devis-208', 1),
(216, 335, 1, '2010-216', 'Extincteur CO² 5 kg. Quantité 08.\r\nRIA. Quantité 04.\r\nCentrale d’alarme. Quantité 01.\r\nBatterie rechargeable 12V, 7,2 Ah. Quantité 01.\r\nBatterie 12V, 2,2 Ah. Quantité 01.\r\nDétecteur IR de mouvement. Quantité 04.\r\nSirène extérieure. Quantité 01.', '2017-04-25 00:00:00', 1, 0, NULL, '2010-04-15 17:10:26', '2010-04-23 11:40:14', 1, 0, 0, 0, NULL, 11, 'Demande de devis #216', 'Maroc', 'Rabat', 'demande-devis-216', 1),
(217, 58, 1, '2010-217', 'Nous avons besoin de tourniquet et pointeuse voir demande ci-jointe\r\n\r\nAchats du Matériel en DDP /CIF/EX WORK.', '2017-05-11 00:00:00', 1, 0, NULL, '2010-04-21 10:01:12', '2010-05-03 09:47:18', 1, 0, 0, 0, NULL, 11, 'Demande de devis #217', 'Maroc', 'Kenitra', 'demande-devis-217', 1),
(219, 58, 1, '2010-219', 'MATERIEL INFORMATIQUE ( VOIR DETAIL CI-JOINT)', '2017-05-11 00:00:00', 1, 0, NULL, '2010-04-22 08:47:59', '2010-05-03 09:48:31', 1, 0, 0, 0, NULL, 11, 'Demande de devis #219', 'Maroc', 'Kenitra', 'demande-devis-219', 1),
(221, 58, 1, '2010-221', 'PC industriels. PC core duo 1,66 MHZ, 1 GB Ram sans Disque dur mais avec Mémoire Compact FLASH (Windows ou Linux) écran tactile.', '2017-05-11 00:00:00', 1, 0, NULL, '2010-04-23 17:53:14', '2010-05-03 09:47:52', 1, 0, 0, 0, NULL, 11, 'Demande de devis #221', 'Maroc', 'Kenitra', 'demande-devis-221', 1),
(222, 77, 1, '2010-222', 'Bonjour,\r\nje vous prie de bien vouloir me faire votre meilleure offre de prix et délai pour la fourniture de une station mobile de carburant d’une capacité de 10 T équivalent au model ci-joint', '2017-05-08 00:00:00', 1, 0, NULL, '2010-04-26 17:46:53', '2010-04-26 17:47:59', 1, 0, 0, 0, NULL, 11, 'Demande de devis #222', 'Maroc', 'Mohammadia', 'demande-devis-222', 1),
(223, 391, 1, '2010-223', ' Pierre de bien vouloir nous communiquer votre meilleure offre concernant le rayonnage lourd a palette ainsi que la note de calcule correspondante .\r\n10 éléments des dimensions suivante:\r\n\r\n    DIM: L 20 x H 6 m\r\n\r\n   nombre de niveau : quatre \r\n\r\n   capacité totale de stockage : 700 palettes\r\n-- ', '2017-05-05 00:00:00', 1, 0, NULL, '2010-04-27 10:36:54', '2010-05-06 10:53:46', 1, 0, 0, 0, NULL, 11, 'Demande de devis #223', 'Maroc', 'Agadir', 'demande-devis-223', 1),
(226, 402, 1, '2010-226', 'Nous cherchons une société étrangère pour nous fournir les contreplaqués selon le cahier des charges en fichier ci-joint.\r\nMeilleures salutations.', '2017-05-31 00:00:00', 1, 0, NULL, '2010-05-18 19:57:55', '2010-05-19 11:37:28', 1, 0, 0, 0, NULL, 11, 'Demande de devis #226', 'Maroc', 'Oujda', 'demande-devis-226', 1),
(228, 422, 1, '2010-228', 'Prière de me communiquer votre meilleure offre de prix pour les articles cités en pièce jointe.\r\n\r\nLa Quantité : 100 pour chaque article. Autrement dit :\r\n* 100 Automatisme pour portes battantes.\r\n\r\n* 100 Sélecteur \r\n\r\n* 100 Bouton poussoir \r\n\r\n* 100 Télécommande \r\n\r\n* 100 Serrure pêne piston \r\n\r\nN\'hésitez pas à nous contacter pour plus d\'informations.', '2017-06-15 00:00:00', 1, 0, NULL, '2010-06-09 10:15:27', '2010-06-09 10:59:26', 1, 0, 0, 0, NULL, 11, 'Demande de devis #228', 'Maroc', 'Casablanca', 'demande-devis-228', 1),
(237, 428, 1, '2010-237', 'ROUE DN200 MM PIVOTANTE AVEC FRIEN (EN CAOUTCHOUC OU EN PEHD)\r\nQté : 08 Uté\r\nPJ : Photo descriptive de l\'utilisation des dites roues.', '2017-06-25 00:00:00', 1, 0, NULL, '2010-06-22 17:34:37', '2010-06-22 17:34:37', 1, 0, 0, 0, NULL, 11, 'Demande de devis #237', 'Maroc', 'Casablanca', 'demande-devis-237', 1),
(238, 58, 1, '2010-238', 'Conteneur pour utiliser comme atelier de maintenance. Dimension min 5m*2.5m.\r\nEquipé de climatiseur, fenêtre, et table pour 4 techniciens.', '2017-07-24 00:00:00', 1, 0, NULL, '2010-07-14 11:07:56', '2010-07-22 17:08:16', 1, 0, 0, 0, NULL, 11, 'Demande de devis #238', 'Maroc', 'Kenitra', 'demande-devis-238', 1),
(240, 452, 1, '2010-240', 'Recherchons d\'urgence la location du matériel ci-dessous:\r\n- Chariot télescopique tout terrain rotatif à fort tonnage \"5,5t\" hauteur non spécifiée, de marque Manitou (de préférence).\r\nDurée de location: 1 mois\r\nFull Service.\r\nConducteur(s) compris 7j/7\r\n30 à 40 Km /j.', '2017-07-20 00:00:00', 1, 0, NULL, '2010-07-15 09:54:42', '2010-07-20 15:59:03', 1, 0, 0, 0, NULL, 11, 'Demande de devis #240', 'Maroc', 'Tanger', 'demande-devis-240', 1),
(241, 452, 1, '2010-241', 'Recherchons d\'urgence la location du matériel ci-dessous:\r\n- Camion plateau 13m. En Option avec ridelle.\r\nDurée de location: 1 mois\r\nFull Service.\r\nConducteur(s) compris 7j/7\r\n30 à 40 Km /j.', '2017-07-20 00:00:00', 1, 0, NULL, '2010-07-15 12:28:30', '2010-07-20 15:58:08', 1, 0, 0, 0, NULL, 11, 'Demande de devis #241', 'Maroc', 'Tanger', 'demande-devis-241', 1),
(242, 452, 1, '2010-242', 'Recherchons d\'urgence la location du matériel ci-dessous :\r\nChariot élévateur: avec conducteur à charge\r\n- Capacité de charge nominale : 4 tonnes\r\n- tablier à déplacement latéral,\r\n- type: diesel \" carburant à votre charge\",\r\n- Hauteur de levée : 3 à 4 mètres,\r\n- Mât triplex grande visibilité,\r\n- Horaire de travail: 24h/24h , 7j/7j\r\n- Durée de location: un mois avec possibilité de prolongation', '2017-07-20 00:00:00', 1, 0, NULL, '2010-07-16 11:53:55', '2010-07-20 15:58:43', 1, 0, 0, 0, NULL, 11, 'Demande de devis #242', 'Maroc', 'Tanger', 'demande-devis-242', 1),
(243, 385, 1, '2010-243', 'Bande Modulaire Blanche UNI-228 mm x 100 (ml) pour convoyeur transportant du poisson.\r\n(Voir photos ci-jointe)', '2017-08-07 00:00:00', 1, 0, NULL, '2010-07-22 16:35:40', '2010-08-02 13:36:18', 1, 0, 0, 0, NULL, 11, 'Demande de devis #243', 'Maroc', 'Agadir', 'demande-devis-243', 1),
(244, 385, 1, '2010-244', '1 - Eléctropompe de GRUNDFOSS 5.5 KW 2900 tr/min CR 16', '2017-08-04 00:00:00', 1, 0, NULL, '2010-07-27 18:12:26', '2010-07-28 11:57:36', 1, 0, 0, 0, NULL, 11, 'Demande de devis #244', 'Maroc', 'Agadir', 'demande-devis-244', 1),
(245, 385, 1, '2010-245', '25 l huile shell CASSIDA FLUIDE G 150', '2017-08-04 00:00:00', 1, 0, NULL, '2010-07-27 18:18:22', '2010-07-28 11:57:49', 1, 0, 0, 0, NULL, 11, 'Demande de devis #245', 'Maroc', 'Agadir', 'demande-devis-245', 1),
(246, 460, 1, '2010-246', 'Recherche fournisseur huile végétale ', '2017-09-03 00:00:00', 1, 0, NULL, '2010-08-25 12:56:37', '2010-08-27 12:29:34', 1, 0, 0, 0, NULL, 11, 'Demande de devis #246', 'France', 'Sainte-Florence', 'demande-devis-246', 1),
(247, 460, 1, '2010-247', 'Recherche fournisseurs pour étudie la mise en place étiquettes RFID', '2017-10-10 00:00:00', 1, 0, NULL, '2010-08-25 12:57:31', '2010-08-25 17:29:04', 1, 0, 0, 0, NULL, 11, 'Demande de devis #247', 'France', 'Sainte-Florence', 'demande-devis-247', 1),
(248, 473, 1, '2011-248', '10.000 GRILLES DE CUISSON DIMENSION EXT : L600-P400-H90 mm \r\nCouleur : Gris .\r\nCaisse : Fond & Parois ajourés.\r\nCes grilles sont utilisées dans les bac de cuisson : cuisson en Saumure ( Eau + sel à 4 ° baumé ) chauffée à 90 °C, et le temps peut varier de 20 à 30 minutes. \r\ngrilles  nettoyées à la soude caustique dans une eau chauffée à 60° C.\r\n( photo ci-joint)\r\n', '2017-04-13 00:00:00', 1, 0, NULL, '2011-04-05 14:46:02', '2011-04-05 16:10:34', 1, 0, 0, 0, NULL, 11, 'Demande de devis #248', 'Maroc', 'Agadir', 'demande-devis-248', 1),
(250, 478, 1, '2011-250', 'Besoin de Pate de Paprika pour production de sauce! Ci dessous spécification:\r\nMatière première: paprika rouge fraiche et naturelle\r\nTransformation: concentre sous vide ou réfrigéré\r\nSans additif, ni colorant\r\nBrix: 13 a 15°\r\nDensité: 1,02GR/CM3 8,5° DE BRIX\r\nQuantité: 2 TONNES', '2017-12-02 00:00:00', 1, 0, NULL, '2011-06-17 10:22:41', '2011-06-17 15:03:01', 1, 0, 0, 0, NULL, 11, 'Demande de devis #250', 'Maroc', 'Berrechid', 'demande-devis-250', 1),
(251, 480, 1, '2011-251', 'Je vous remercie de bien nous faire parvenir une meilleur offre de prix de la référence ci-dessous :\r\n \r\n\r\n8034102:  Bd 0.5x12 DIN 1791- CuFe 0.1P F44                  \r\n\r\nQT : 1000kg\r\n\r\n', '2017-08-21 00:00:00', 1, 0, NULL, '2011-08-10 15:46:42', '2011-08-10 16:04:17', 1, 0, 0, 0, NULL, 11, 'Demande de devis #251', 'Maroc', 'Tanger', 'demande-devis-251', 1),
(302, 3, 1, '2018-302', 'Bonjour\r\nje vous remercie de bien nous faire parvenir une meilleur offre de prix pour la demande ci_joint ', '2018-01-31 00:00:00', 1, 0, NULL, '2018-01-15 16:25:25', '2018-01-25 16:24:24', 1, 0, 0, 0, NULL, 11, 'Demande de devis #302', 'Maroc', 'Casablanca', 'demande-devis-302', 1),
(308, 571, 1, '2018-308', 'bonjour;\r\nmerci de nous faire parvenir votre meilleur offre de prix pour les articles en pièces jointe:', '2018-02-02 00:00:00', 1, 0, NULL, '2018-01-29 15:30:29', '2018-02-01 17:22:38', 1, 0, 0, 0, NULL, 11, 'Demande de devis #308', 'Maroc', 'Casablanca', 'demande-devis-308', 1),
(314, 3, 1, '2019-314', 'j ia besoin d un rayonnage  2 m de hauteur ', '2019-06-01 00:00:00', 1, 0, NULL, '2019-05-29 16:34:45', '2019-07-08 17:47:43', 1, 0, 0, 0, NULL, 11, 'Demande de devis #314', 'Maroc', 'Casablanca', 'demande-devis-314', 1),
(323, 621, 1, '2019-323', '2 panneaux de brassage \r\n24 prises informatique murale \r\n2 passe câbles \r\nArmoire informatique \r\n1 collier de serrage 300 blanche ', '2019-10-30 00:00:00', 1, 0, NULL, '2019-10-22 20:47:23', '2019-10-25 10:27:25', 1, 0, 0, 0, NULL, 11, 'Demande de devis #323', 'Maroc', 'Sale', 'demande-devis-323', 1),
(324, 630, 1, '2019-324', 'Je cherche des fournisseurs pour la location d\'un chariot élévateur de 3T semaine prochaine pour 1 jour et la semaine d\'après aussi 1 jour', '2019-11-11 00:00:00', 1, 0, NULL, '2019-10-24 11:23:56', '2019-10-24 11:35:04', 1, 0, 0, 0, NULL, 11, 'Demande de devis #324', 'Maroc', 'Casablanca', 'demande-devis-324', 1),
(325, 628, 1, '2019-325', 'besoin d\'un pyromètre optique type IGAR 6 advanced ', '2019-11-06 00:00:00', 1, 0, NULL, '2019-10-25 10:50:53', '2019-11-04 10:43:25', 1, 0, 0, 0, NULL, 11, 'Demande de devis #325', 'Maroc', 'Casablanca', 'demande-devis-325', 1),
(326, 622, 1, '2019-326', 'demande de prix 2 tôles noires\r\nDimensions ; 2000*1000*12 mm', '2019-11-03 00:00:00', 1, 0, NULL, '2019-10-25 11:22:16', '2019-10-25 15:52:51', 1, 0, 0, 0, NULL, 11, 'Demande de devis #326', 'Maroc', 'Kenitra', 'demande-devis-326', 1),
(327, 632, 1, '2019-327', 'Besoin 8 casques de protection casco petzl vertex Best\r\n', '2019-11-05 00:00:00', 1, 0, NULL, '2019-10-28 19:36:55', '2019-11-05 12:53:55', 1, 0, 0, 0, NULL, 11, 'Demande de devis #327', 'Maroc', 'Khenifra', 'demande-devis-327', 1),
(331, 629, 1, '2019-331', 'Bonjour,\r\nJe cherche des fournisseurs pour 5 pince de mesure de terre numérique modele 4200 de marque KYORITSU.', '2019-11-08 00:00:00', 1, 0, NULL, '2019-10-29 19:09:20', '2019-11-05 10:16:25', 1, 0, 0, 0, NULL, 11, 'Demande de devis #331', 'Maroc', 'Casablanca', 'demande-devis-331', 1),
(332, 629, 1, '2019-332', 'bonjour,\r\n\r\nJe cherche ce ventilateur en urgence :\r\nVENTILATEUR HÉLICOÏDE 630mm et 220v', '2019-11-06 00:00:00', 1, 0, NULL, '2019-10-30 22:00:19', '2019-11-05 11:52:36', 1, 0, 0, 0, NULL, 11, 'Demande de devis #332', 'Maroc', 'Casablanca', 'demande-devis-332', 1),
(333, 643, 1, '2019-333', 'Nous vous demandons de bien vouloir nous faire parvenir, vos meilleures conditions de prix et délai concernant les articles ci-dessous en pièce jointe', '2019-11-05 00:00:00', 1, 0, NULL, '2019-11-01 20:01:01', '2019-11-07 11:09:58', 1, 0, 0, 0, NULL, 11, 'Demande de devis #333', 'Maroc', 'El jadida', 'demande-devis-333', 1),
(334, 646, 1, '2019-334', ' \r\n\r\n1. Hepc20 push fit male adaptor  x12pcs\r\n\r\n2.Hepc2o push fit female adaptor x 4pcs\r\n\r\n3.Hepc2o pipe inserts  all in 12mm diameter x 85pcs', '2019-11-18 00:00:00', 1, 0, NULL, '2019-11-12 17:04:55', '2019-11-18 15:41:22', 1, 0, 0, 0, NULL, 11, 'Demande de devis #334', 'Maroc', 'El jadida', 'demande-devis-334', 1),
(335, 653, 1, '2019-335', 'Bonjour,\r\nMerci de me parvenir le prix REVENDEUR pour :\r\n* 1000 Graisseur en acier inoxydable M10 45° et 90° \r\nCordialement.', '2020-01-01 00:00:00', 1, 0, NULL, '2019-12-03 12:26:07', '2019-12-04 11:22:04', 1, 0, 0, 0, NULL, 11, 'Demande de devis #335', 'Maroc', 'Laâyoune', 'demande-devis-335', 1),
(336, 653, 1, '2019-336', 'Bonjour,\r\n\r\nMerci de me parvenir votre meilleur offre de prix revendeur Pour :\r\n* 1 - Appareil junction courroie 12 cm. \r\n\r\nCordialement. \r\n ', '2020-01-01 00:00:00', 1, 0, NULL, '2019-12-19 11:11:00', '2019-12-20 15:26:33', 1, 0, 0, 0, NULL, 11, 'Demande de devis #336', 'Maroc', 'Laâyoune', 'demande-devis-336', 1),
(337, 663, 1, '2020-337', 'Bonjour \r\nNous aurons besoin Des Barres de seuil à visser, en acier inox brossé type DINAC 4.5 cm de largeur (Au niveau des transitions d\'un type de revêtement à un autre) Quantité: 170ml\r\nNez de marche de profils antidérapants de type Passage (Profilé angle L45x1.5 aluminium stair nosing 6060 T5 20 microns anodisée avec insert minéral hautement\r\nantidérapant épousant parfaitement le nez de marche ) Quantité: 80ml\r\nCordialement', '2020-02-18 00:00:00', 1, 0, NULL, '2020-02-04 09:34:53', '2020-02-04 15:19:28', 1, 0, 0, 0, NULL, 11, 'Demande de devis #337', 'Maroc', 'Casablanca', 'demande-devis-337', 1),
(338, 663, 1, '2020-338', 'Bonjour,\r\nMerci de m\'envoyer votre meilleures offre de prix, pour un profilé U ( U Channels) en Aluminium, DIM:20*50mm ép:10/10 ou bien 20/10mm, selon la disponibilité des profilés\r\nQuantité: 2000ml', '2020-02-11 00:00:00', 1, 0, NULL, '2020-02-04 09:52:08', '2020-02-04 15:18:49', 1, 0, 0, 0, NULL, 11, 'Demande de devis #338', 'Maroc', 'Casablanca', 'demande-devis-338', 1),
(340, 663, 1, '2020-340', 'Bonjour,\r\nMerci de m\'envoyer votre meilleures offre de prix, pour des Boîtes d\'attente pour le béton armé de type GAMMBOX 2 , Fiche technique en pièce joint\r\nQuantité: 6500ml', '2020-02-10 00:00:00', 1, 0, NULL, '2020-02-04 12:17:55', '2020-02-04 15:18:01', 1, 0, 0, 0, NULL, 11, 'Demande de devis #340', 'Maroc', 'Casablanca', 'demande-devis-340', 1);

-- --------------------------------------------------------

--
-- Structure de la table `demande_achat_attachement`
--

CREATE TABLE `demande_achat_attachement` (
  `demande_achat_id` int(11) NOT NULL,
  `attachement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `demande_ha_categories`
--

CREATE TABLE `demande_ha_categories` (
  `demande_achat_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Structure de la table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reponse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `faq`
--

INSERT INTO `faq` (`id`, `question`, `reponse`, `categorie_id`) VALUES
(1, 'Qu’est ce que Les Achats Industriels?', 'Les Achats Industriels est une place de marché qui permet aux Acheteurs et aux Fournisseurs de se rencontrer dans une même plate-forme (électronique).\nNous nous positionnons en tant qu\'intermédiaire entre les deux parties afin de faciliter aux uns et aux autres de vendre ou/et d’acheter de manière fluide, économique, rapide, sans limites géographique .\n', 2),
(2, 'Comment fonctionne Les Achats Industriels?', 'L’Acheteur remplit un champ dans le questionnaire RFQ en précisant ses besoins d\'achat, il peut éventuellement joindre des fichiers (seul le format jpeg, jpg, doc, excel ou pdf sont permis à condition que la taille totale des fichiers ne dépasse pas 1 Méga Octet).\nTout fichier qui contient des éléments qui peuvent faire identifier son émetteur sera rectifié si  possible par l’administrateur ou simplement bloqué, l’expéditeur sera dans ce cas prévenue par e-mail afin qu’il produise un autre fichier valable.\nEnsuite, et après validation de l’administrateur, la demande de devis sera automatiquement envoyée aux Fournisseurs produisant le service ou produit recherché par l’Acheteur.\nEnfin, l’Acheteur sera contacté directement par plusieurs Fournisseurs et n’aura qu’à choisir celui qu’il jugera le plus adéquat.\nEn tant qu\'Acheteur, il vous suffit donc de saisir votre demande de devis sur le formulaire RFQ, et le reste se fait de façon automatique jusqu\'à la réception des contacts Fournisseurs.\n', 2),
(5, 'Qu’est ce qu’un acheteur pour Les Achats Industriels ?', 'S’identifier en tant qu’Acheteur pour Les Achats Industriels c’est pouvoir lancer des demandes de devis et se faire repérer par les Fournisseurs sans difficulté. On peut s’enregistrer Acheteur pour un simple besoin comme pour un besoin important, il suffit de remplir un formulaire Acheteur et faire passer des demandes de devis. Vous recevrez des offres de Fournisseurs dont vous ignorez peut-être l’existence  ou même de vos propres Fournisseurs en découvrant qu’ils proposent de nouveaux produits très demandés dans votre activité, ces offres vous pouvez les comparer pour choisir le Fournisseur qui vous convient.\nToute société peut s’identifier dans notre site en tant qu’Acheteur et Fournisseur en même temps, il faut juste fournir un email différent pour chaque profil.\n', 3),
(6, ' Je suis ACHETEUR, et je suis aussi FOURNISSEUR puis-je m’identifier en tant que FOURNISSEUR ?', 'C’est tout à fait possible, il suffit de se réenregistrer en tant que Fournisseur et suivre les étapes de l’enregistrement.\nToute société peut s’identifier dans notre site en tant qu’Acheteur et Fournisseur en même temps, il faut juste fournir un email différent pour chaque profil.  \n', 3),
(7, 'Comment lancer une demande de devis ?', 'L’Acheteur remplit un champ dans le questionnaire RFQ en précisant ses besoins d\'achat, il peut éventuellement joindre des fichiers (seul le format jpeg, jpg, doc, excel ou pdf qui sont permis sans que la taille totale des fichiers ne dépasse pas 1 Méga Octet) Tout fichier qui contient des éléments qui peuvent faire identifier son émetteur sera rectifié si  possible par l’administrateur ou simplement bloqué, l’expéditeur sera dans ce cas prévenue par e-mail afin qu’il produise un autre fichier valable.\nEnsuite, et après validation par l’administrateur du site Les Achats Industriels, la demande de devis sera automatiquement envoyée aux Fournisseurs produisant le service ou produit recherché par l’Acheteur Enfin, l’Acheteur sera contacté directement par plusieurs Fournisseurs et n’aura qu’à choisir celui qu’il jugera le plus adéquat.\nEn tant qu\'Acheteur, il vous suffit donc de saisir votre demande de devis sur le formulaire RFQ, et le reste se fait de façon automatique jusqu\'à la réception des contacts Fournisseurs.\n', 3),
(8, 'Quelles sont les étapes pour s\'enregistrer en tant qu\'acheteur ?', 'Pour s\'enregistrer dans le site en tant qu’Acheteur, il suffit de remplir le formulaire Acheteur avec ses rubriques Information générale et Information utilisateur, ce sont des questions qui vous identifient en tant qu’Acheteur (les questions en (*) sont des champs obligatoires à remplir), vous devez indiquer une adresse e-mail valable qui sera prise comme identifiant et choisir un mot de passe. Les conditions d’utilisation doivent être lues et acceptées pour valider l’enregistrement. Vous recevrez un message avec un lien sur l’adresse e-mail que vous avez communiquée, vous devez cliquer dessus pour confirmer votre demande d’enregistrement. Une fois confirmée, vous pouvez lancer des demandes de devis et gérer votre compte Acheteur.\nEn cas de problème ou de difficultés liés à l’enregistrement veuillez nous contacter au :\nTel: +212.522.36.57.97\nE-mail : Administrateur@lesachatsindustriels.com\n', 3),
(9, ' Comment ma demande de devis arrivera-t-elle aux fournisseurs ?', 'Une fois que vous avez un besoin, et que vous voulez lancer votre demande de prix, il faudra bien choisir l’activité à laquelle votre produit ou service appartient sur la fiche RFQ, si votre produit / service fait partie d’une famille de produit / service sélectionnez la afin d’élargir le nombre de Fournisseurs qui peuvent être intéressés  par votre demande. Dans le cas où vous ne trouvez pas de correspondant à votre demande, envoyez-nous un e-mail à Administrateur@lesachatsindutriels.com expliquant le produit / service que vous cherchez, vous pouvez joindre des fichiers (seul le format jpeg, jpg, doc, excel ou pdf sont permis sans que la taille totale des fichiers ne dépasse pas 1 Méga Octet) sans se faire identifier par le Fournisseur. Une fois que votre demande est envoyée, elle sera validée par l’administrateur du site Les Achats Industriels est aussitôt envoyée aux Fournisseurs qui sont enregistrés dans notre base de donnée.', 3),
(10, 'Qu’est ce qu’un Fournisseur pour Les Achats Industriels ?', 'S’identifier en tant que Fournisseur pour Les Achats Industriels c’est être capable de répondre à un besoin qui peut être demandé par un Acheteur et de le lui fournir dans les meilleures conditions. S’identifier en tant que Fournisseur permet de recevoir des demandes de devis précises dans le domaine de compétence choisi par ce dernier lors de l’enregistrement, ce choix peut être modifié par l’utilisateur soit en ajoutant ou en retirant des domaines d’activités. Etre Fournisseur  sur Les Achats Industriels c’est se donner la possibilité de répondre à des demandes de devis et de booster les consultations clients.', 4),
(11, 'Je suis Fournisseur, et je suis aussi des Acheteur puis-je m’identifier en tant que Acheteur?', 'c\'est tout à fait possible, il suffit de se réenregistrer en tant que Acheteur et suivre les étapes de l’enregistrement.', 4),
(12, 'Comment recevoir une demande de devis ?', 'En vous identifiant en tant que Fournisseur  vous devez choisir avec précision le ou les domaines d’activités où vous êtes compétent et vous ne recevrez que des demandes de devis relatives à votre domaine d’activité. Une fois que vous vous êtes identifié en tant que Fournisseur, vous recevrez un e-mail qui vous renseigne sur la demande lancée par l’Acheteur  en vous indiquant le libellé, les quantités demandées ou même des images ou plans relatifs au produit demandé GRATUITEMENT.\nUne fois que vous décidez de répondre à la demande de prix vous devez payer un droit fixe qui ne change pas quelque soit l’enjeu du projet, ce qui vous donnera accès aux coordonnées de l’Acheteur, et c’est à vous de convaincre votre prospect pour décrocher le bon de commande.\n', 4),
(13, 'Quelle est la différence entre un acheteur et un fournisseur?', 'Les membres de la communauté «  Les Achats Industriels » sont constitués de Fournisseurs et d\'Acheteurs. En tant qu\'Acheteur, vous avez la possibilité d\'envoyer une demande de prix, de comparer les différentes offres des différents Fournisseurs et (si vous trouvez chaussure à votre pied) de désigner un vainqueur pour finaliser votre achat. Ceci constitue les droits afférents à l\'Acheteur.\nEn tant que prestataire de services, vous êtes considéré comme un Fournisseur. Ce dernier peut répondre à toute demande de prix, mais seulement dans son domaine d\'expertise. Les Fournisseurs auront également la possibilité, comme les Acheteurs, de faire des demandes de prix.\n', 4),
(14, 'Je dispose de (un) ou plusieurs produit(s) est ce que je dois m’inscrire plusieurs fois ?', 'Si vous avez plusieurs produits ou plusieurs services, il vous suffit de vous enregistrer qu’une seule fois, dans ce cas, il faudra cocher les cases correspondant aux divers produits ou service que vous êtes capable de fournir dans les meilleures conditions, aussi il ne faut pas oublier que vous serez évalué par les Acheteurs sur la qualité de votre produit ou service.\nVous pouvez modifier ou changer en ajoutant ou en vous retirant des activités que vous désirez.\n', 4),
(15, 'Si je suis intéressé par une demande de devis, comment je peux participer ?', 'Pour répondre à la demande de devis qui vous intéresse, c’est très facile et rapide.\nUne fois que vous décidez de participer à cet appel d’offre vous devez payer un droit fixe qui ne change pas quelque soit l’enjeu du projet, ensuite vous recevrez les coordonnées du demandeur, et c’est à vous de convaincre votre prospect pour décrocher le bon de commande.\nPour que vous soyez plus réactif vis-à-vis de vos prospect et répondre dans les plus brefs délais, nous vous conseillons d’acquérir des Jetons Virtuels prépayés \"JvP\" pour avoir accès rapide aux coordonnées de l’Acheteur, et avoir une longueur d’avance sur les autres Fournisseurs.\nLes jetons virtuels Jv, n’ont pas de durée limitée, au contraire, il faut garder des jetons en réserve et en quantité suffisante pour les utiliser par les commerciaux, surtout que souvent la procédure administrative (en interne) pour les acquérir prend du temps.', 4),
(16, 'Est-ce que le temps de réponse peut être maitrisé ?', 'Toute demande de devis à une durée de validité (date de clôture), seul l’Acheteur peut la fixer, la modifier ou simplement la bloquer. Le temps de réponse dépend de la réactivité des Fournisseurs.', 3),
(17, 'Peut-on changer les détails de ma demande de devis ?', 'Toute demande de devis peut être modifiée par l’acheteur il peut aussi la bloquer pour qu’elle ne soit plus en cours.', 3),
(18, 'Comment se fera le contact avec le fournisseur ?', 'Une fois que votre demande de devis arrive au Fournisseur ce dernier vous contactera directement sans intermédiaire, est c’est ça notre objectif.', 3),
(19, 'Suis-je libre de choisir mes fournisseurs ?', 'Vous devez respecter la durée de validité avant de clôturer votre demande afin de permettre à un grand nombre de Fournisseurs  le temps de réponse. Si vous avez choisi un Fournisseur avant la date de clôture, Il faudra bloquer la demande de devis en question, cette action témoignera de votre sérieux et sera un des critères de qualification et d’évaluation de l’Acheteur.', 3),
(20, 'Est-ce que mes informations personnelles serons vues par les fournisseurs ?', 'En toute évidence, les informations des demandeurs de devis seront mises à disposition des Fournisseurs  pour que ces derniers puissent les contacter.', 3),
(21, 'Puis-je modifier mes informations personnelles ?', 'Vous êtes libre de modifier vos informations personnelles à tout moment, seul votre identifiant (adresse e-mail) reste inchangé.\n', 3),
(22, 'Est-ce que je resterai dépendant de Les Achats Industriels ?', 'Les Achats Industriels est une place de marché  qui a comme rôle de mettre en contact les Acheteurs et les Fournisseurs.  La durée de vie d’une demande de devis commence lors de sa validation par l’administrateur et se termine soit à la clôture de la demande soit par l’Acheteur lui-même, ensuite elle reste archivée et visible dans notre site Les Achats Industriels.\nSi l’Acheteur décide de ne plus passer par notre site web il est libre de le faire à tout moment.\n', 3),
(23, 'Est-ce que je peux répondre à des demandes de devis en étant un ACHETEUR ?', 'Non, pour répondre à une demande de prix il faut que vous vous identifiez en tant que Fournisseur  du produit ou service recherché par l’Acheteur.', 3),
(24, 'Comment puis-je communiquer avec un ACHETEUR ?', 'Une fois que vous vous identifiez en tant que Fournisseur, vous serez considérez Fournisseur et vous bénéficierez  des mêmes avantages que tout Fournisseur.', 3),
(25, 'Est-ce que je dispose suffisamment de temps pour répondre aux demandes de devis ?', 'Les demandes de devis sont générées par les Acheteurs, chaque demande dispose d’un délai qui peut être différent de celui des autres demandes de devis. C’est le degré d’urgence à effectuer l’achat qui défini le délai fixé par l’Acheteur dans sa demande de prix.\nDans le cas où vous souhaitez une prolongation de temps de réponse, vous devez envoyer une demande par e-mail à l’Acheteur et nous mettre en copie afin de suivre les modifications avec vous.\n', 4),
(26, 'Ai-je la possibilité de répondre à plusieurs demandes de devis ?', 'C’est tout à fait possible, nous vous conseillons d’acquérir des jetons virtuels prépayés pour que vous ayez sur le champ les coordonnées des Acheteurs qui ont lancé les demandes qui vous intéressent.', 4),
(27, 'Combien coûtent les Jetons virtuels \"Jv\" ?', 'Les Jv\"P\" ou Jetons virtuels Prépayés, sont vendus en pack de 10 Jv au prix de 5000,00 Dhs HT soit 500 €, le paiement peut se faire par chèque, virement ou carte bancaire, un paiement n’est valide qu’une fois que notre compte bancaire soit crédité.\nLes Jv\"S\" ou Jetons virtuels Spontanés, sont vendus en unité au prix de 800 Dhs HT soit 80 €, le paiement peut se faire par chèque, virement ou carte bancaire, un paiement n’est valide qu’une fois que notre compte bancaire soit crédité.\n', 4),
(28, 'Quelles sont les modalités de paiement ?', 'Le paiement peut se faire soit par chèque, virement ou carte bancaire, un paiement n’est valide qu’une fois que notre compte bancaire soit crédité.', 4),
(29, 'Si je veux répondre à une nouvelle demande de devis comment je serais averti ?', 'La réception de demandes de devis (sans les coordonnées des demandeurs) se fait automatiquement une fois que vous vous identifiez comme Fournisseur pour une activité. De ce fait, pour un Fournisseur qui dispose de plusieurs activités et services il doit s’identifier pour toutes les activités et services qu’il est capable de fournir.', 4),
(30, 'Puis-je modifier mes informations personnelles ?', 'Bien évidement, à tout moment vous pouvez changer vos informations personnelles.', 4),
(31, 'Est-ce que je peux lancer des demandes de devis en étant un fournisseur ?', 'Tout Fournisseur peut s’identifier en tant que Acheteur  puisque chaque Fournisseur est lui même Acheteur pour d’autres Fournisseurs.', 4),
(32, 'Comment puis-je communiquer avec un Acheteur ?', 'Une fois que vous vous connectez en tant que Acheteur, vous serez considéré Acheteur et vous bénéficierez des mêmes avantages que tout Acheteur, même si vous êtes déjà inscrit comme Fournisseur.', 4);

-- --------------------------------------------------------

--
-- Structure de la table `faq_categorie`
--

CREATE TABLE `faq_categorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `faq_categorie`
--

INSERT INTO `faq_categorie` (`id`, `name`) VALUES
(2, 'Général'),
(3, 'Acheteurs'),
(4, 'Fournisseurs');

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
(5, 'PANNEAU SOLAIRE FREE WATER_FREEWATER-FICHETECHNIQUE-ODA280W.pdf', 0, NULL),
(7, 'Neant_PresentationPROTECTIONUNIT.pdf', 0, NULL),
(8, '5ed8fff998df8339062544.pdf', 142995, 'application/pdf'),
(9, '5ed90057b3cfc549317303.pdf', 142995, 'application/pdf'),
(10, '5ed900dbcf63a325620144.pdf', 142995, 'application/pdf'),
(11, '5edb99bec338c349901378.pdf', 97055, 'application/pdf'),
(12, '5ee8e5c1cd51b764595979.pdf', 142995, 'application/pdf');

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
  `phone_vu` int(11) NOT NULL,
  `visite` int(11) NOT NULL,
  `societe_lower` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step` int(11) NOT NULL,
  `is_complet` tinyint(1) NOT NULL,
  `code_client` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autre_ville` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autre_categories` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autre_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `pays_id`, `ville_id`, `societe`, `civilite`, `ice`, `fix`, `website`, `description`, `currency_id`, `slug`, `phone_vu`, `visite`, `societe_lower`, `step`, `is_complet`, `code_client`, `autre_ville`, `autre_categories`, `autre_currency`) VALUES
(2, 144, 1, '3F Industrie', 'M.', '001531606000066', '0522365797', 'http://www.3finudstrie.com', '3F Industrie a choisi de se positionner sur le secteur de la logistique en mettant à la disposition de ce dernier les meilleures fournisseurs tout en respectant les normes les plus sévères et les plus demandées par les donneurs d’ordres les plus exigeants. Notre objectif est d’offrir à nos clients une qualité de service qui s’inscrit dans une amélioration continue.\n\nRayonnage et système de stockage : Rayonnage à palettes : Conventionnel, Accumulation, Mobile, Dynamique. Rayonnage pour archive, charge légère et lourde plateforme sur deux ou trois niveaux pour une optimisation maximale rayonnage cantilever pour des charges longues, lourdes et volumineuses.\n\nRayonnage mobile pour archive documents et œuvres d’art. Intervention sur tout type de rayonnage pour démontage remontage et divers modifications de niveaux ou d’implantation. Notre savoir-faire nous a permis d’avoir la confiance de nombreuses entreprises dans différents secteurs d’activité : Alimentaire, Industriel, Logistique, Distribution…', 1, '3f-industrie', 3, 165, '3f industrie', 0, 0, NULL, NULL, NULL, NULL),
(49, 144, 1, 'thyssenkrupp elevator maroc', '', NULL, '212522204505', '', NULL, 11, 'thyssenkrupp-elevator-maroc', 0, 0, 'thyssenkrupp elevator maroc', 0, 0, NULL, NULL, NULL, NULL),
(55, 144, 1, 'Le Carton', '', NULL, '212522204505', '', NULL, 11, 'le-carton', 0, 0, 'le carton', 0, 0, NULL, NULL, NULL, NULL),
(56, 144, 1, 'Imprimerie Sabri', '', NULL, '212522902037', '', NULL, 11, 'imprimerie-sabri', 0, 0, 'imprimerie sabri', 0, 0, NULL, NULL, NULL, NULL),
(64, 75, 93, 'EURODOCK', '', NULL, '0033474095757', 'www.eurodock.com', NULL, 11, 'eurodock', 0, 0, 'eurodock', 0, 0, NULL, NULL, NULL, NULL),
(67, 144, 1, 'LEAN Consulting', '', NULL, '00212661671868', 'http://www.lean-consulting.ma', NULL, 11, 'lean-consulting', 0, 0, 'lean consulting', 0, 0, NULL, NULL, NULL, NULL),
(72, 144, 9, 'arrahala choukri', '', NULL, '0537376687', '', NULL, 11, 'arrahala-choukri', 0, 0, 'arrahala choukri', 0, 0, NULL, NULL, NULL, NULL),
(75, 144, 1, 'STE EURO-PNEUS SARL', '', NULL, '0522811306', '', NULL, 11, 'ste-euro-pneus-sarl', 0, 0, 'ste euro-pneus sarl', 0, 0, NULL, NULL, NULL, NULL),
(79, 144, 1, 'SMTR CARRE', '', NULL, '022408458', 'www.carre.ma', NULL, 11, 'smtr-carre', 0, 0, 'smtr carre', 0, 0, NULL, NULL, NULL, NULL),
(82, 144, 1, 'SUN SHIPPING MAROC ', '', NULL, '0522444484', '', NULL, 11, 'sun-shipping-maroc', 0, 0, 'sun shipping maroc ', 0, 0, NULL, NULL, NULL, NULL),
(86, 144, 1, 'SJL Maroc', '', NULL, '0522674000', '', NULL, 11, 'sjl-maroc', 0, 0, 'sjl maroc', 0, 0, NULL, NULL, NULL, NULL),
(87, 144, 13, 'DPS', '', NULL, '00212528236435', 'www.dps-ma.com', NULL, 11, 'dps', 0, 0, 'dps', 0, 0, NULL, NULL, NULL, NULL),
(88, 144, 1, 'CD INDEX', '', NULL, '0522983499', 'www.cddoc.fr', NULL, 11, 'cd-index', 0, 0, 'cd index', 0, 0, NULL, NULL, NULL, NULL),
(91, 175, 92, 'Lusaustri', '', NULL, '00351253520200', 'lusaustri.pt', NULL, 1, 'lusaustri', 0, 0, 'lusaustri', 0, 0, NULL, NULL, NULL, NULL),
(92, 144, 1, 'ELECTRO PROTECT', '', NULL, '0522992970', '', NULL, 11, 'electro-protect', 0, 0, 'electro protect', 0, 0, NULL, NULL, NULL, NULL),
(93, 144, 2, 'MEDIXANA', '', NULL, '0537631490', 'www.medisana.ma', NULL, 11, 'medixana', 0, 0, 'medixana', 0, 0, NULL, NULL, NULL, NULL),
(95, 144, 2, 'FI LAMANE Assurances', '', NULL, '0537799833', 'www.filamane.com', NULL, 11, 'fi-lamane-assurances', 0, 0, 'fi lamane assurances', 0, 0, NULL, NULL, NULL, NULL),
(97, 75, 43, 'EXPRESSO France', '', NULL, '0388042030', 'expresso-france.com', NULL, 1, 'expresso-france', 0, 0, 'expresso france', 0, 0, NULL, NULL, NULL, NULL),
(98, 144, 1, 'S2AI INDUSTRIES', '', NULL, '212661266856', '', NULL, 11, 's2ai-industries', 0, 0, 's2ai industries', 0, 0, NULL, NULL, NULL, NULL),
(100, 144, 1, 'france-technics', '', NULL, '0522996632', '', NULL, 11, 'france-technics', 0, 0, 'france-technics', 0, 0, NULL, NULL, NULL, NULL),
(106, 18, 44, 'JUCAMI', '', NULL, '0032477315169', '', NULL, 11, 'jucami', 0, 0, 'jucami', 0, 0, NULL, NULL, NULL, NULL),
(109, 144, 1, 'Recoli-sarl', '', NULL, '0669770616', 'www.recoli-monde.fr.gd', NULL, 11, 'recoli-sarl', 0, 0, 'recoli-sarl', 0, 0, NULL, NULL, NULL, NULL),
(110, 144, 7, 'NET PROPRETE sarl', '', NULL, '0679044155', 'www.yassini-netproprete.eu.ma', NULL, 11, 'net-proprete-sarl', 0, 0, 'net proprete sarl', 0, 0, NULL, NULL, NULL, NULL),
(111, 144, 31, 'Meca ingineering', '', NULL, '00212661065982', '', NULL, 11, 'meca-ingineering', 0, 0, 'meca ingineering', 0, 0, NULL, NULL, NULL, NULL),
(112, 144, 1, 'marché central', '', NULL, '0527814446', '', NULL, 11, 'marche-central', 0, 0, 'marché central', 0, 0, NULL, NULL, NULL, NULL),
(113, 144, 5, 'Your PC', '', NULL, '0535 643 352', 'www.yourpc.ma', NULL, 11, 'your-pc', 0, 0, 'your pc', 0, 0, NULL, NULL, NULL, NULL),
(115, 144, 1, 'Convergence Telecom', '', NULL, '00212677896835', 'www.convergence-tele.com', NULL, 11, 'convergence-telecom', 0, 0, 'convergence telecom', 0, 0, NULL, NULL, NULL, NULL),
(117, 144, 1, 'Somapromac', '', NULL, '+212661395203', 'www.somapromac.on.ma', NULL, 11, 'somapromac', 0, 0, 'somapromac', 0, 0, NULL, NULL, NULL, NULL),
(118, 144, 31, 'Health & Beauty forever ', '', NULL, '00212663372398', '', NULL, 11, 'health-beauty-forever', 0, 0, 'health & beauty forever ', 0, 0, NULL, NULL, NULL, NULL),
(120, 144, 1, 'Chantiers et ateliers du maroc', '', NULL, '0522 319 030', 'www.cam-industries.com', NULL, 11, 'chantiers-et-ateliers-du-maroc', 0, 0, 'chantiers et ateliers du maroc', 0, 0, NULL, NULL, NULL, NULL),
(121, 144, 1, 'ATLADIS', '', NULL, '00212522992062', 'www.atladis.ma', NULL, 11, 'atladis', 0, 0, 'atladis', 0, 0, NULL, NULL, NULL, NULL),
(124, 144, 7, 'LBA Consulting', '', NULL, '0661706647', '', NULL, 11, 'lba-consulting', 0, 0, 'lba consulting', 0, 0, NULL, NULL, NULL, NULL),
(126, 144, 1, 'QUINCAILLERIE NASRALLAH', '', NULL, '0522300361', '', NULL, 11, 'quincaillerie-nasrallah', 0, 0, 'quincaillerie nasrallah', 0, 0, NULL, NULL, NULL, NULL),
(128, 144, 1, 'gm equipements', '', NULL, '0522592220', 'www.gm-equipements.com', NULL, 11, 'gm-equipements', 0, 0, 'gm equipements', 0, 0, NULL, NULL, NULL, NULL),
(132, 144, 1, 'SRM', '', NULL, '0522633700', 'www.groupe-premium.com', NULL, 11, 'srm', 0, 0, 'srm', 0, 0, NULL, NULL, NULL, NULL),
(133, 144, 31, 'SCORTEN', '', NULL, '0661343502', NULL, NULL, 11, 'scorten', 0, 0, 'scorten', 0, 0, NULL, NULL, NULL, NULL),
(137, 75, 89, 'BAOBAG', '', NULL, '00212660618223', 'www.baobag.eu', NULL, 11, 'baobag', 0, 0, 'baobag', 0, 0, NULL, NULL, NULL, NULL),
(139, 144, 1, 'Ultimate Computer', '', NULL, '0522 86 42 04', 'www.uc-maroc.ma', NULL, 11, 'ultimate-computer', 0, 0, 'ultimate computer', 0, 0, NULL, NULL, NULL, NULL),
(140, 110, 63, 'coursier', '', NULL, '0022506419633', '', NULL, 11, 'coursier', 0, 0, 'coursier', 0, 0, NULL, NULL, NULL, NULL),
(142, 144, 1, 'LES 5 CONINENTS', '', NULL, '0522265209', NULL, NULL, 11, 'les-5-coninents', 0, 0, 'les 5 coninents', 0, 0, NULL, NULL, NULL, NULL),
(148, 144, 2, 'ECO-IMPRESS', '', NULL, '0537752676', 'wwweco-impress.ma', NULL, 11, 'eco-impress', 0, 0, 'eco-impress', 0, 0, NULL, NULL, NULL, NULL),
(149, 144, 1, 'madiva ', '', NULL, '0661912561', '', NULL, 11, 'madiva', 0, 0, 'madiva ', 0, 0, NULL, NULL, NULL, NULL),
(154, 144, 1, 'ASIAN HALL MAROC', '', NULL, '0522341461', 'www.asianhallmaroc.com', NULL, 11, 'asian-hall-maroc', 0, 0, 'asian hall maroc', 0, 0, NULL, NULL, NULL, NULL),
(155, 144, 1, 'UNIFORCE INFORMATIQUE', '', NULL, '0522297240', 'www.uniforce.ma', NULL, 11, 'uniforce-informatique', 0, 0, 'uniforce informatique', 0, 0, NULL, NULL, NULL, NULL),
(157, 144, 12, 'Univers Engins', '', NULL, '0524355555', '', NULL, 11, 'univers-engins', 0, 0, 'univers engins', 0, 0, NULL, NULL, NULL, NULL),
(158, 144, 31, 'GE3M', '', NULL, '0663428925', 'www.sous-traiter.ma', NULL, 11, 'ge3m', 0, 0, 'ge3m', 0, 0, NULL, NULL, NULL, NULL),
(159, 75, 86, '8.3D', '', NULL, '0674792901', '8point3d.com', NULL, 11, '8.3d', 0, 0, '8.3d', 0, 0, NULL, NULL, NULL, NULL),
(161, 144, 1, 'logipro', '', NULL, '212522987175', '', NULL, 11, 'logipro', 0, 0, 'logipro', 0, 0, NULL, NULL, NULL, NULL),
(163, 144, 12, 'GROUPE MENARA HOLDING/ Les Lumières de Menara', '', NULL, '+212(0)524345387/97', 'http://www.2lm-maroc.com/', NULL, 11, 'groupe-menara-holding-les-lumieres-de-menara', 0, 0, 'groupe menara holding/ les lumières de menara', 0, 0, NULL, NULL, NULL, NULL),
(165, 109, 83, 'PLASTIMARK S.p.A.', '', NULL, '00390171618630', 'www.plastimark.com', NULL, 11, 'plastimark-s-p-a', 0, 0, 'plastimark s.p.a.', 0, 0, NULL, NULL, NULL, NULL),
(168, 144, 12, 'GROUPE AUTO HALL', '', NULL, '0524448422', 'www.autohall.ma', NULL, 11, 'groupe-auto-hall', 0, 0, 'groupe auto hall', 0, 0, NULL, NULL, NULL, NULL),
(169, 144, 1, 'TELEDYNE', '', NULL, '0522307664 ', 'teledyne.blogspot.com', NULL, 11, 'teledyne', 0, 0, 'teledyne', 0, 0, NULL, NULL, NULL, NULL),
(171, 75, 82, 'TRADER PARTNER', '', NULL, '0616803821', '', NULL, 1, 'trader-partner', 0, 0, 'trader partner', 0, 0, NULL, NULL, NULL, NULL),
(172, 144, 1, 'HOME EVENT DECO', '', NULL, '0661050715', '', NULL, 11, 'home-event-deco', 0, 0, 'home event deco', 0, 0, NULL, NULL, NULL, NULL),
(173, 144, 1, 'HOME EVENT COMMUNICATION', '', NULL, '0661050715', '', NULL, 11, 'home-event-communication', 0, 0, 'home event communication', 0, 0, NULL, NULL, NULL, NULL),
(174, 144, 31, 'AGCONSULTING', '', NULL, '0649017957', 'www.agconsulting.ma', NULL, 11, 'agconsulting', 0, 0, 'agconsulting', 0, 0, NULL, NULL, NULL, NULL),
(177, 144, 1, 'ESPACE MANUTENTION', '', NULL, '0522403950', '', NULL, 11, 'espace-manutention', 0, 0, 'espace manutention', 0, 0, NULL, NULL, NULL, NULL),
(178, 75, 81, 'SSL 247', '', NULL, '0320288602', 'www.ssl247.fr', NULL, 1, 'ssl-247', 0, 0, 'ssl 247', 0, 0, NULL, NULL, NULL, NULL),
(180, 144, 1, 'SOPRIAM', '', NULL, '0522464900', '', NULL, 11, 'sopriam', 0, 0, 'sopriam', 0, 0, NULL, NULL, NULL, NULL),
(181, 144, 80, 'Maromania', '', NULL, '0610111215', 'www.maromania.com', NULL, 11, 'maromania', 0, 0, 'maromania', 0, 0, NULL, NULL, NULL, NULL),
(188, 144, 1, 'QUALITAS', '', NULL, '0522444038', 'www.qualitas.ma', NULL, 11, 'qualitas', 0, 0, 'qualitas', 0, 0, NULL, NULL, NULL, NULL),
(189, 144, 1, 'HAMA', '', NULL, '34567', '', NULL, 11, 'hama', 0, 0, 'hama', 0, 0, NULL, NULL, NULL, NULL),
(190, 144, 1, 'CAP GIBRALTAR', '', NULL, '0522357128', 'http://www.capgibraltar.com', NULL, 11, 'cap-gibraltar', 0, 0, 'cap gibraltar', 0, 0, NULL, NULL, NULL, NULL),
(192, 144, 1, 'L\'APPROVISIONNEUR TECHNIQUE', '', NULL, '0522440884/956', 'www.appro-tech.com', NULL, 11, 'lapprovisionneur-technique', 0, 0, 'l\'approvisionneur technique', 0, 0, NULL, NULL, NULL, NULL),
(194, 144, 1, 'CONSOCENTER', '', NULL, '0522982592', 'WWW.CONSOCENTER.MA', NULL, 11, 'consocenter', 0, 0, 'consocenter', 0, 0, NULL, NULL, NULL, NULL),
(195, 144, 1, 'INTERVARIA', '', NULL, '0522523838', 'WWW.INTERVARIA.MA', NULL, 11, 'intervaria', 0, 0, 'intervaria', 0, 0, NULL, NULL, NULL, NULL),
(196, 144, 2, 'WIDECOM', '', NULL, '0666987522', 'www.widecom.ma', NULL, 11, 'widecom', 0, 0, 'widecom', 0, 0, NULL, NULL, NULL, NULL),
(197, 203, 79, 'ESTINDEL', '', NULL, '0034954693830', 'http://www.estindel.com', NULL, 1, 'estindel', 0, 0, 'estindel', 0, 0, NULL, NULL, NULL, NULL),
(198, 144, 1, 'TECNY MAROC', '', NULL, '212522986800', '', NULL, 11, 'tecny-maroc', 0, 0, 'tecny maroc', 0, 0, NULL, NULL, NULL, NULL),
(199, 144, 12, 'SUD TRANSMISSION', '', NULL, '0524432169', '', NULL, 11, 'sud-transmission', 0, 0, 'sud transmission', 0, 0, NULL, NULL, NULL, NULL),
(200, 197, 97, 'CADEO CONSULTING', '', NULL, '0033607492815', 'cadeo-consulting.over-blog.com', NULL, 1, 'cadeo-consulting', 0, 0, 'cadeo consulting', 0, 0, NULL, NULL, NULL, NULL),
(202, 144, 1, 'MAROC BUREAU', '', NULL, '0522353755', '', NULL, 11, 'maroc-bureau', 0, 0, 'maroc bureau', 0, 0, NULL, NULL, NULL, NULL),
(203, 144, 1, 'METALLOG', '', NULL, '0661495958', 'www.metallog.com', NULL, 11, 'metallog', 0, 0, 'metallog', 0, 0, NULL, NULL, NULL, NULL),
(204, 144, 1, 'INSTALLATOR ', '', NULL, '0522404201', 'www.installator.com', NULL, 11, 'installator', 0, 0, 'installator ', 0, 0, NULL, NULL, NULL, NULL),
(206, 203, 78, 'admjuver, sl', '', NULL, '0034679968321', '', NULL, 1, 'admjuver-sl', 0, 0, 'admjuver, sl', 0, 0, NULL, NULL, NULL, NULL),
(209, 75, 77, 'STRALFORS', '', NULL, '0633330184', 'www.stralfors.com', NULL, 1, 'stralfors', 0, 0, 'stralfors', 0, 0, NULL, NULL, NULL, NULL),
(210, 75, 76, 'KLB Group', '', NULL, '0149443500', 'www.klb-group.com', NULL, 11, 'klb-group', 0, 0, 'klb group', 0, 0, NULL, NULL, NULL, NULL),
(215, 144, 1, 'INEGMA', '', NULL, '00212522865832', 'www.groupe-inegma.com', NULL, 11, 'inegma', 0, 0, 'inegma', 0, 0, NULL, NULL, NULL, NULL),
(218, 144, 1, 'METALLIC DESIGN', '', NULL, '0522970320', '', NULL, 11, 'metallic-design', 0, 0, 'metallic design', 0, 0, NULL, NULL, NULL, NULL),
(220, 144, 1, 'SOTRANSE SARL', '', NULL, '0522244268', 'www.sotranse.com', NULL, 11, 'sotranse-sarl', 0, 0, 'sotranse sarl', 0, 0, NULL, NULL, NULL, NULL),
(221, 144, 1, 'b2a-pro services sarl', '', NULL, '0668046613', '', NULL, 11, 'b2a-pro-services-sarl', 0, 0, 'b2a-pro services sarl', 0, 0, NULL, NULL, NULL, NULL),
(223, 144, 1, 'F C Industriel', '', NULL, '0661298827', NULL, NULL, 11, 'f-c-industriel', 0, 0, 'f c industriel', 0, 0, NULL, NULL, NULL, NULL),
(224, 144, 1, 'ELEXPERT', '', NULL, '0522249171', 'www.elexpert.ma', NULL, 11, 'elexpert', 0, 0, 'elexpert', 0, 0, NULL, NULL, NULL, NULL),
(225, 144, 31, 'AMP', '', NULL, '0523314020', 'www.amp-ge.ma', NULL, 11, 'amp', 0, 0, 'amp', 0, 0, NULL, NULL, NULL, NULL),
(226, 220, 75, 'AKDEMIR S.A.', '', NULL, '00902244111100', 'www.akdemirmetal.com', NULL, 1, 'akdemir-s.a.', 0, 0, 'akdemir s.a.', 0, 0, NULL, NULL, NULL, NULL),
(227, 144, 2, 'independant', '', NULL, '0530303099', '', NULL, 11, 'independant', 0, 0, 'independant', 0, 0, NULL, NULL, NULL, NULL),
(228, 144, 1, 'R2i Consult', '', NULL, '+212 (0) 522 986 960', '', NULL, 11, 'r2i-consult', 0, 0, 'r2i consult', 0, 0, NULL, NULL, NULL, NULL),
(229, 144, 1, 'FAST INDUSTRIE', '', NULL, '0522638143', NULL, NULL, 11, 'fast-industrie', 0, 0, 'fast industrie', 0, 0, NULL, NULL, NULL, NULL),
(231, 144, 1, 'AFRIC ROULEMENT', '', NULL, '0522407009', '', NULL, 11, 'afric-roulement', 0, 0, 'afric roulement', 0, 0, NULL, NULL, NULL, NULL),
(232, 144, 7, 'ORSA', '', NULL, '0539351152', '', NULL, 11, 'orsa', 0, 0, 'orsa', 0, 0, NULL, NULL, NULL, NULL),
(233, 144, 1, 'Helio rif', '', NULL, '00212522932814', '', NULL, 11, 'helio-rif', 0, 0, 'helio rif', 0, 0, NULL, NULL, NULL, NULL),
(235, 144, 1, 'ODIMATIC', '', NULL, '0522301515', '', NULL, 11, 'odimatic', 0, 0, 'odimatic', 0, 0, NULL, NULL, NULL, NULL),
(236, 144, 7, 'coflaga', '', NULL, '0539943662', '', NULL, 11, 'coflaga', 0, 0, 'coflaga', 0, 0, NULL, NULL, NULL, NULL),
(237, 144, 1, 'GLM', '', NULL, '0522669977', '', NULL, 11, 'glm', 0, 0, 'glm', 0, 0, NULL, NULL, NULL, NULL),
(238, 144, 1, 'CASA TECHNIQUE AUTO S.A.R.L', '', NULL, '00212661400572', '', NULL, 11, 'casa-technique-auto-sarl', 0, 0, 'casa technique auto s.a.r.l', 0, 0, NULL, NULL, NULL, NULL),
(239, 144, 1, 'EUROPE COMPUTER SYSTEMES INTERNATIONAL MAROC', '', NULL, '0522789030', 'www.ecs-group.com', NULL, 11, 'europe-computer-systemes-international-maroc', 0, 0, 'europe computer systemes international maroc', 0, 0, NULL, NULL, NULL, NULL),
(240, 144, 1, 'International Equipment Company', '', NULL, '0522369900', '', NULL, 11, 'international-equipment-company', 0, 0, 'international equipment company', 0, 0, NULL, NULL, NULL, NULL),
(241, 144, 1, 'PROFESSIONNEL COMPUTER ', '', NULL, '0522393956', '', NULL, 11, 'professionnel-computer', 0, 0, 'professionnel computer ', 0, 0, NULL, NULL, NULL, NULL),
(243, 144, 1, 'SCOLARIUM', '', NULL, '0522874401', 'www.microstore.ma', NULL, 11, 'scolarium', 0, 0, 'scolarium', 0, 0, NULL, NULL, NULL, NULL),
(244, 144, 31, 'CCELOG', '', NULL, '0661155154', 'www.ccelog.com', NULL, 11, 'ccelog', 0, 0, 'ccelog', 0, 0, NULL, NULL, NULL, NULL),
(246, 144, 1, 'AVENIR FORMATION', '', NULL, '0522203664', '', NULL, 11, 'avenir-formation', 0, 0, 'avenir formation', 0, 0, NULL, NULL, NULL, NULL),
(248, 144, 32, 'Excelsa Techniques Composites', '', NULL, '00212 522592053', 'www.excelsa-maroc.com', NULL, 11, 'excelsa-techniques-composites', 0, 0, 'excelsa techniques composites', 0, 0, NULL, NULL, NULL, NULL),
(250, 144, 1, 'ELOUAHIDI SOME INDUSTRIE', '', NULL, '0522353349', 'www.someindustrie.ma', NULL, 11, 'elouahidi-some-industrie', 0, 0, 'elouahidi some industrie', 0, 0, NULL, NULL, NULL, NULL),
(252, 144, 31, 'MASIFE', '', NULL, '0661116047', NULL, NULL, 11, 'masife', 0, 0, 'masife', 0, 0, NULL, NULL, NULL, NULL),
(253, 144, 31, 'N\'ka industrie', '', NULL, '05233310145', 'nkaindustrie.com', NULL, 11, 'nka-industrie', 0, 0, 'n\'ka industrie', 0, 0, NULL, NULL, NULL, NULL),
(254, 144, 1, 'Optim Achat', '', NULL, '0522362281', 'www.optim-achat.com', NULL, 11, 'optim-achat', 0, 0, 'optim achat', 0, 0, NULL, NULL, NULL, NULL),
(255, 144, 1, 'FROXY', '', NULL, '212522313167', '', NULL, 11, 'froxy', 0, 0, 'froxy', 0, 0, NULL, NULL, NULL, NULL),
(258, 144, 10, 'GLOBAL ACCESS', '', NULL, '21237863596', 'www.globalaccess.ma', NULL, 11, 'global-access', 0, 0, 'global access', 0, 0, NULL, NULL, NULL, NULL),
(262, 144, 1, 'ALDIS', '', NULL, '0522476340', 'www.lachaisequidecore.com', NULL, 11, 'aldis', 0, 0, 'aldis', 0, 0, NULL, NULL, NULL, NULL),
(265, 144, 7, 'International cabinet of consulting and brokerage', '', NULL, '00212667226854', NULL, NULL, 11, 'international-cabinet-of-consulting-and-brokerage', 0, 0, 'international cabinet of consulting and brokerage', 0, 0, NULL, NULL, NULL, NULL),
(267, 144, 1, '3S MORCCO', '', NULL, '0522992222', 'www.3smorocco.com', NULL, 11, '3s-morcco', 0, 0, '3s morcco', 0, 0, NULL, NULL, NULL, NULL),
(270, 144, 1, 'SORENMI', '', NULL, '0522 40 02 92', '', NULL, 11, 'sorenmi', 0, 0, 'sorenmi', 0, 0, NULL, NULL, NULL, NULL),
(273, 144, 1, 'Total Protection', '', NULL, '0522252632', '', NULL, 11, 'total-protection', 0, 0, 'total protection', 0, 0, NULL, NULL, NULL, NULL),
(276, 144, 1, 'almajd protection sarl', '', NULL, '21222730829', '', NULL, 11, 'almajd-protection-sarl', 0, 0, 'almajd protection sarl', 0, 0, NULL, NULL, NULL, NULL),
(279, 144, 1, 'INDUSTRIE EXPO', '', NULL, '2126 63428925', '', NULL, 11, 'industrie-expo', 0, 0, 'industrie expo', 0, 0, NULL, NULL, NULL, NULL),
(280, 144, 1, 'GLOBAL IT', '', NULL, '00212529011066', '', NULL, 11, 'global-it', 0, 0, 'global it', 0, 0, NULL, NULL, NULL, NULL),
(281, 144, 1, 'SMBS', '', NULL, '00212522487518', 'www.smbs.ma', NULL, 11, 'smbs', 0, 0, 'smbs', 0, 0, NULL, NULL, NULL, NULL),
(282, 144, 1, 'GOOD TEC', '', NULL, '0522765052', '', NULL, 11, 'good-tec', 0, 0, 'good tec', 0, 0, NULL, NULL, NULL, NULL),
(285, 144, 1, 'equindus', '', NULL, '0522209719', '', NULL, 11, 'equindus', 0, 0, 'equindus', 0, 0, NULL, NULL, NULL, NULL),
(286, 210, 46, 'morimport', '', NULL, '0041765668998', '', NULL, 11, 'morimport', 0, 0, 'morimport', 0, 0, NULL, NULL, NULL, NULL),
(288, 144, 2, 'RJ CONSULTING', '', NULL, '0658991131', '', NULL, 11, 'rj-consulting', 0, 0, 'rj consulting', 0, 0, NULL, NULL, NULL, NULL),
(289, 144, 12, 'marbeco ', '', NULL, '0674918260', NULL, NULL, 11, 'marbeco', 0, 0, 'marbeco ', 0, 0, NULL, NULL, NULL, NULL),
(290, 144, 34, 'high maintenance sarl', '', NULL, '0665211117', '', NULL, 11, 'high-maintenance-sarl', 0, 0, 'high maintenance sarl', 0, 0, NULL, NULL, NULL, NULL),
(291, 144, 9, 'ENATCOM', '', NULL, '0537378361', '', NULL, 11, 'enatcom', 0, 0, 'enatcom', 0, 0, NULL, NULL, NULL, NULL),
(295, 144, 1, 'ELEVATEK', '', NULL, '+212522610270', 'www.elevatek.ma', NULL, 11, 'elevatek', 0, 0, 'elevatek', 0, 0, NULL, NULL, NULL, NULL),
(296, 144, 1, 'LONGOMETAL', '', NULL, '0522402060', '', NULL, 11, 'longometal', 0, 0, 'longometal', 0, 0, NULL, NULL, NULL, NULL),
(298, 144, 1, 'pop', '', NULL, '0522447719', NULL, NULL, 11, 'pop', 0, 0, 'pop', 0, 0, NULL, NULL, NULL, NULL),
(300, 144, 1, 'W2A', '', NULL, '0640261431', 'http://www.lesachatsindustriel', 'Société de developpement informatique', 11, 'w2a', 0, 0, 'w2a', 0, 0, NULL, NULL, NULL, NULL),
(303, 144, 1, 'conseil assisatance pour les industries', '', NULL, '0522862214', '', NULL, 11, 'conseil-assisatance-pour-les-industries', 0, 0, 'conseil assisatance pour les industries', 0, 0, NULL, NULL, NULL, NULL),
(307, 144, 72, 'MAROC TRANSFO', '', NULL, '0522 96 41 12', '', NULL, 11, 'maroc-transfo', 0, 0, 'maroc transfo', 0, 0, NULL, NULL, NULL, NULL),
(308, 144, 1, 'FENIE BROSSETTE', '', NULL, '0522639173', 'www.feniebrossette.ma', NULL, 11, 'fenie-brossette', 0, 0, 'fenie brossette', 0, 0, NULL, NULL, NULL, NULL),
(309, 144, 1, 'AB INDUSTRIE', '', NULL, '0522 944 411', 'www.abindustrie.net', NULL, 11, 'ab-industrie', 0, 0, 'ab industrie', 0, 0, NULL, NULL, NULL, NULL),
(310, 144, 1, 'FIRST MATERIEL', '', NULL, '0522677070', 'www.firstmateriel.ma', NULL, 11, 'first-materiel', 0, 0, 'first materiel', 0, 0, NULL, NULL, NULL, NULL),
(311, 144, 1, 'technipower', '', NULL, '00212522253113', 'http://www.technipower-maroc.c', NULL, 11, 'technipower', 0, 0, 'technipower', 0, 0, NULL, NULL, NULL, NULL),
(312, 75, 71, 'GENELEC S.A.S.', '', NULL, '0474626505', 'genelec.tm.fr', NULL, 1, 'genelec-sas', 0, 0, 'genelec s.a.s.', 0, 0, NULL, NULL, NULL, NULL),
(314, 75, 70, 'PHARM-ALLIANCE', '', NULL, '0169078405', 'pharm-alliance.com', NULL, 1, 'pharm-alliance', 0, 0, 'pharm-alliance', 0, 0, NULL, NULL, NULL, NULL),
(315, 144, 13, 'JLM', '', NULL, '0528 24 10 50', 'http://www.jlm-maroc.com', NULL, 11, 'jlm', 0, 0, 'jlm', 0, 0, NULL, NULL, NULL, NULL),
(316, 144, 1, 'TC MAROC', '', NULL, '0522593530', 'www.tcmaroc.com', NULL, 11, 'tc-maroc', 0, 0, 'tc maroc', 0, 0, NULL, NULL, NULL, NULL),
(317, 144, 1, 'LAWAZIME INDUSTRIELLES', '', NULL, '0522714448', '', NULL, 11, 'lawazime-industrielles', 0, 0, 'lawazime industrielles', 0, 0, NULL, NULL, NULL, NULL),
(319, 144, 1, 'AFRIM', '', NULL, '0522358267', 'www.afrim.ma', NULL, 11, 'afrim', 0, 0, 'afrim', 0, 0, NULL, NULL, NULL, NULL),
(323, 144, 1, 'CAP SECURITE', '', NULL, '00212522247078', '', NULL, 11, 'cap-securite', 0, 0, 'cap securite', 0, 0, NULL, NULL, NULL, NULL),
(325, 75, 69, 'GESIPA', '', NULL, '0033243399050', 'http://www.gesipa.fr', NULL, 1, 'gesipa', 0, 0, 'gesipa', 0, 0, NULL, NULL, NULL, NULL),
(326, 144, 1, 'HIERRO SARL', '', NULL, '0522334802', 'www.hierro.ma', NULL, 11, 'hierro-sarl', 0, 0, 'hierro sarl', 0, 0, NULL, NULL, NULL, NULL),
(327, 144, 1, 'Ader Technique', '', NULL, '0522249871', 'www.adertechnique.ma', NULL, 11, 'ader-technique', 0, 0, 'ader technique', 0, 0, NULL, NULL, NULL, NULL),
(328, 144, 31, 'a2me', '', NULL, '212523303117', 'www.a2me.ma', NULL, 11, 'a2me', 0, 0, 'a2me', 0, 0, NULL, NULL, NULL, NULL),
(329, 144, 10, 'BENSAK SECURITE', '', NULL, '0661284287', '', NULL, 11, 'bensak-securite', 0, 0, 'bensak securite', 0, 0, NULL, NULL, NULL, NULL),
(330, 144, 1, 'YOUSRA GADGET  SARL', '', NULL, '0661136453', '', NULL, 11, 'yousra-gadget-sarl', 0, 0, 'yousra gadget sarl', 0, 0, NULL, NULL, NULL, NULL),
(331, 144, 10, 'atsafety prive', '', NULL, '0661284287', NULL, NULL, 11, 'atsafety-prive', 0, 0, 'atsafety prive', 0, 0, NULL, NULL, NULL, NULL),
(332, 144, 31, 'Sofie consulting europe maroc', '', NULL, '0523321053', 'www.sofiec-international.com', NULL, 11, 'sofie-consulting-europe-maroc', 0, 0, 'sofie consulting europe maroc', 0, 0, NULL, NULL, NULL, NULL),
(333, 144, 1, 'Cleric Maroc ', '', NULL, '0522247129', '', NULL, 11, 'cleric-maroc', 0, 0, 'cleric maroc ', 0, 0, NULL, NULL, NULL, NULL),
(334, 75, 68, 'Guichon Valves', '', NULL, '00 334 79 44 59 00', 'www.guichon.com', NULL, 11, 'guichon-valves', 0, 0, 'guichon valves', 0, 0, NULL, NULL, NULL, NULL),
(338, 144, 6, 'jazira', '', NULL, '0641642682', '', NULL, 11, 'jazira', 0, 0, 'jazira', 0, 0, NULL, NULL, NULL, NULL),
(339, 144, 12, 'elementerre', '', NULL, '+212.524.42.13.11', 'www.elementerre.net', NULL, 11, 'elementerre', 0, 0, 'elementerre', 0, 0, NULL, NULL, NULL, NULL),
(340, 144, 1, 'STE. PLASTIBAG', '', NULL, '0522618153', '', NULL, 11, 'ste-plastibag', 0, 0, 'ste. plastibag', 0, 0, NULL, NULL, NULL, NULL),
(342, 75, 66, 'CPS INTERNATIONAL', '', NULL, '+33.1.83.64.04.40 ', 'www.cps-international.fr', NULL, 2, 'cps-international', 0, 0, 'cps international', 0, 0, NULL, NULL, NULL, NULL),
(344, 75, 65, 'FEMMECUP', '', NULL, '0490058509', 'www.femmecup.fr', NULL, 11, 'femmecup', 0, 0, 'femmecup', 0, 0, NULL, NULL, NULL, NULL),
(346, 144, 1, 'ciea', '', NULL, '00212522672825', 'ciea.fr', NULL, 1, 'ciea', 0, 0, 'ciea', 0, 0, NULL, NULL, NULL, NULL),
(348, 144, 1, 'LOGICOLD', '', NULL, '0522536620', 'www.logicold.com', NULL, 11, 'logicold', 0, 0, 'logicold', 0, 0, NULL, NULL, NULL, NULL),
(349, 134, 103, 'kaye Gold Miner', '', NULL, '0022320777795', '', NULL, 11, 'kaye-gold-miner', 0, 0, 'kaye gold miner', 0, 0, NULL, NULL, NULL, NULL),
(350, 144, 1, 'drem', '', NULL, '0522275664', '', NULL, 11, 'drem', 0, 0, 'drem', 0, 0, NULL, NULL, NULL, NULL),
(352, 110, 63, 'SEMAPHORE WORLD SERVICES', '', NULL, '22521245622', '', NULL, 1, 'semaphore-world-services', 0, 0, 'semaphore world services', 0, 0, NULL, NULL, NULL, NULL),
(353, 144, 2, 'n.design', '', NULL, '0661290284', '', NULL, 11, 'ndesign', 0, 0, 'n.design', 0, 0, NULL, NULL, NULL, NULL),
(354, 144, 1, 'S.K.A.M', '', NULL, '0522728962', '', NULL, 11, 'skam', 0, 0, 's.k.a.m', 0, 0, NULL, NULL, NULL, NULL),
(356, 144, 1, 'B2B TRADING', '', NULL, '0522948008', '', NULL, 11, 'b2b-trading', 0, 0, 'b2b trading', 0, 0, NULL, NULL, NULL, NULL),
(359, 144, 12, 'PROTEMAX', '', NULL, '0524432143', 'www.protemax-maroc.com', NULL, 11, 'protemax', 0, 0, 'protemax', 0, 0, NULL, NULL, NULL, NULL),
(363, 144, 1, 'MAGINOX', '', NULL, '0522357239', '', NULL, 11, 'maginox', 0, 0, 'maginox', 0, 0, NULL, NULL, NULL, NULL),
(364, 75, 60, 'CEETRANS', '', NULL, '0472218334', '', NULL, 1, 'ceetrans', 0, 0, 'ceetrans', 0, 0, NULL, NULL, NULL, NULL),
(365, 144, 1, 'omatrac', '', NULL, '0522661544', '', NULL, 11, 'omatrac', 0, 0, 'omatrac', 0, 0, NULL, NULL, NULL, NULL),
(367, 144, 1, 'idmar industry', '', NULL, '0522401118', '', NULL, 11, 'idmar-industry', 0, 0, 'idmar industry', 0, 0, NULL, NULL, NULL, NULL),
(369, 144, 1, 'ADVANCED AUTOMATION', '', NULL, '0522861929', '', NULL, 11, 'advanced-automation', 0, 0, 'advanced automation', 0, 0, NULL, NULL, NULL, NULL),
(372, 144, 1, 'Top Rayonnages SARL', '', NULL, '0649438405', '', NULL, 11, 'top-rayonnages-sarl', 0, 0, 'top rayonnages sarl', 0, 0, NULL, NULL, NULL, NULL),
(373, 75, 102, 'AJANA', '', NULL, '0033617692310', '', NULL, 11, 'ajana', 0, 0, 'ajana', 0, 0, NULL, NULL, NULL, NULL),
(375, 144, 6, 'entreprise libre', '', NULL, '069916343', 'leretourauxsources.blog4ever.c', NULL, 11, 'entreprise-libre', 0, 0, 'entreprise libre', 0, 0, NULL, NULL, NULL, NULL),
(378, 203, 53, 'Estanterías Record', '', NULL, '0034958466888', 'www.estanteriasrecord.com', NULL, 11, 'estanterías-record', 0, 0, 'estanterías record', 0, 0, NULL, NULL, NULL, NULL),
(386, 144, 1, 'MANUAFRIC', '', NULL, '0522249140', 'www.manuafric.ma', NULL, 11, 'manuafric', 0, 0, 'manuafric', 0, 0, NULL, NULL, NULL, NULL),
(387, 144, 1, 'communication system', '', NULL, '0522995550', 'www.comsys.ma', NULL, 11, 'communication-system', 0, 0, 'communication system', 0, 0, NULL, NULL, NULL, NULL),
(388, 144, 31, 'Masbahi Group Informatique', '', NULL, '0523327617', '', NULL, 11, 'masbahi-group-informatique', 0, 0, 'masbahi group informatique', 0, 0, NULL, NULL, NULL, NULL),
(389, 144, 1, 'Aaron & Babel', '', NULL, '212661060901', 'www.aaron-babel.com', NULL, 11, 'aaron-babel', 0, 0, 'aaron & babel', 0, 0, NULL, NULL, NULL, NULL),
(392, 144, 13, 'ste PERFECT DECOR (perdeco)', '', NULL, '00212528333720', 'www.per-deco.com', NULL, 11, 'ste-perfect-decor-perdeco', 0, 0, 'ste perfect decor (perdeco)', 0, 0, NULL, NULL, NULL, NULL),
(393, 144, 1, 'MN TECHNOLOGY', '', NULL, '0661470807', '', NULL, 11, 'mn-technology', 0, 0, 'mn technology', 0, 0, NULL, NULL, NULL, NULL),
(394, 144, 1, 'Process Réparation Métallurgique', '', NULL, '0023799417940', '', NULL, 1, 'process-reparation-metallurgique', 0, 0, 'process réparation métallurgique', 0, 0, NULL, NULL, NULL, NULL),
(396, 144, 1, 'FIRST INVESTMENT FINANCE', '', NULL, '0674108464', '', NULL, 11, 'first-investment-finance', 0, 0, 'first investment finance', 0, 0, NULL, NULL, NULL, NULL),
(398, 75, 52, 'PALMAT SYSTEMS', '', NULL, '33 555 234 607', 'www.palmat-systems.com', NULL, 11, 'palmat-systems', 0, 0, 'palmat systems', 0, 0, NULL, NULL, NULL, NULL),
(403, 144, 1, 'groupelogistiqueinvest', '', NULL, '0661266980', '', NULL, 11, 'groupelogistiqueinvest', 0, 0, 'groupelogistiqueinvest', 0, 0, NULL, NULL, NULL, NULL),
(405, 144, 1, 'SOCOMIS', '', NULL, '522 22 95 36 ', '', NULL, 11, 'socomis', 0, 0, 'socomis', 0, 0, NULL, NULL, NULL, NULL),
(406, 144, 13, 'Cabinplant', '', NULL, '0537642878', 'www.cabinplant.net', NULL, 11, 'cabinplant', 0, 0, 'cabinplant', 0, 0, NULL, NULL, NULL, NULL),
(407, 144, 1, 'ACTION SERVICES', '', NULL, '0522662003', '', NULL, 11, 'action-services', 0, 0, 'action services', 0, 0, NULL, NULL, NULL, NULL),
(408, 144, 1, 'info tech', '', NULL, '0670454545', '', NULL, 11, 'info-tech', 0, 0, 'info tech', 0, 0, NULL, NULL, NULL, NULL),
(409, 203, 51, 'Presitec ', '', NULL, '0034656952936', 'www.presitec.com', NULL, 1, 'presitec', 0, 0, 'presitec ', 0, 0, NULL, NULL, NULL, NULL),
(410, 144, 1, 'fournipro.ma', '', NULL, '0522 21 80 05', 'www.fournipro.ma', NULL, 11, 'fourniproma', 0, 0, 'fournipro.ma', 0, 0, NULL, NULL, NULL, NULL),
(418, 144, 1, 'SONEFI', '', NULL, '+212522661389', 'www.sonefi.ma', NULL, 11, 'sonefi', 0, 0, 'sonefi', 0, 0, NULL, NULL, NULL, NULL),
(420, 144, 1, 'TCE PARTNERS', '', NULL, '00212674027932', '', NULL, 11, 'tce-partners', 0, 0, 'tce partners', 0, 0, NULL, NULL, NULL, NULL),
(421, 144, 1, 'international security business', '', NULL, '0522204937', 'www.internationalsecuritybusin', NULL, 11, 'international-security-business', 0, 0, 'international security business', 0, 0, NULL, NULL, NULL, NULL),
(424, 144, 31, 'ACTIVE-ID', '', NULL, '00212523305400', '', NULL, 11, 'active-id', 0, 0, 'active-id', 0, 0, NULL, NULL, NULL, NULL),
(425, 144, 1, 'ingeniatis', '', NULL, '0662014287', 'www.ingeniatis.com', NULL, 11, 'ingeniatis', 0, 0, 'ingeniatis', 0, 0, NULL, NULL, NULL, NULL),
(427, 144, 1, 'agence711', '', NULL, '0661355218', 'www.multiservice', NULL, 11, 'agence711', 0, 0, 'agence711', 0, 0, NULL, NULL, NULL, NULL),
(446, 144, 1, 'GAMAI S.A.R.L', '', NULL, '212522665523', '', 'Société spécialisé en Automatisme Industriel, Intégrateur et distributeur officiel des Produits de marque Siemens.', 11, 'gamai-s.a.r.l', 0, 0, 'gamai s.a.r.l', 0, 0, NULL, NULL, NULL, NULL),
(447, 144, 1, 'Makity', '', NULL, '0640261431', '', 'Nous sommes une societe de developpement informatique', 11, 'makity', 0, 0, 'makity', 0, 0, NULL, NULL, NULL, NULL),
(448, 144, 1, 'EcoNeed', '', NULL, '966092714', 'www.econeed.es', 'Econeed enterprise emporter de produits exclusive de calite', 1, 'econeed', 0, 0, 'econeed', 0, 0, NULL, NULL, NULL, NULL),
(449, 144, 1, 'abs protection', '', NULL, '0522850101', '', 'Importateur et distributeur du matériel de sécurité et protection, vêtement de travail, accessoire de protection contre l\'incendie porte automatique,caméra, alarme, télésurveillance.', 11, 'abs-protection', 0, 0, 'abs protection', 0, 0, NULL, NULL, NULL, NULL),
(450, 144, 1, 'CASAPACKING', '', NULL, '0522 44 44 23/24/25', '', 'CASAPACKING est le spécialiste des machines et matériels pour l’emballage et le conditionnement: banderoleuses, fardeleuses, cercleuses… Tous type de film, feuillard, adhésif, élastique... ', 11, 'casapacking', 0, 0, 'casapacking', 0, 0, NULL, NULL, NULL, NULL),
(453, 144, 1, 'RAYOMAG sarl', '', NULL, '0667210100', '', '- Construction métallique.\r\n- Structure de Rayonnage.\r\n- Aménagement métallique.\r\n- Mobilier de bureau et agencement', 11, 'rayomag-sarl', 0, 0, 'rayomag sarl', 0, 0, NULL, NULL, NULL, NULL),
(454, 144, 2, 'Eco-Sakane', '', NULL, '0537 75 68 67  ', 'www.ecosakane.com', 'Construction en bois, charpente traditionnel, lamellé collé, specialiste des golfs, club de tir, HARAS, amenagement urbain, villa et bungamow', 11, 'eco-sakane', 0, 0, 'eco-sakane', 0, 0, NULL, NULL, NULL, NULL),
(456, 144, 1, 'univers caoutchouc', '', NULL, '212522244232', '', 'importateur distributeur bande transporteuse en caoutchouc et en PVC tout article en caoutchouc courroie trapez et de transmission rouleaux de convoyeur pieces en caoutchouc moulé', 11, 'univers-caoutchouc', 0, 0, 'univers caoutchouc', 0, 0, NULL, NULL, NULL, NULL),
(458, 203, 48, 'AFHER EUROBELT, S.A.', '', NULL, '0034983217480', 'www.eurobelt.com', 'FABRICANTS DE TAPIS MODULAIRES PLASTIQUES', 11, 'afher-eurobelt-sa', 0, 0, 'afher eurobelt, s.a.', 0, 0, NULL, NULL, NULL, NULL),
(462, 144, 1, 'TAP', '', NULL, '06 61 36 02 42 ', 'www.tap-france.com', 'fabriquant et installateurs de matériels de stockage et manutention appareil et équipements de quaietc....', 11, 'tap', 0, 0, 'tap', 0, 0, NULL, NULL, NULL, NULL),
(463, 44, 47, 'Novasol-Energy', '', NULL, '008613761869719', 'novasol-energy.com.hk', 'Novasol-Energy International est une entreprise spécialisée dans le sourcing en Chine de produits en énergies renouvelables. Nous sommes en position d\'intermédiaire entre vous et les fournisseurs.', 1, 'novasol-energy', 0, 0, 'novasol-energy', 0, 0, NULL, NULL, NULL, NULL),
(464, 144, 1, 'FIXAVI sarl', '', NULL, '0522240421', '', 'Nous sommes une société spécialisée dans la vente du matériel industriel et quincaillerie, nous commercialisons entre autre les articles ci-après :\r\n', 11, 'fixavi-sarl', 0, 0, 'fixavi sarl', 0, 0, NULL, NULL, NULL, NULL),
(465, 144, 1, 'Grues d\'Hercules Maroc - GHM', '', NULL, '05 22 34 16 60', 'gruesdherculesmaroc.com', 'Depuis 2004, l´entreprise s´est spécialisée dans la location de grues mobiles télescopiques et grues treillis de 18t a 200t, de nacelles élévatrices et de plateformes automotrices d´une hauteur de 6 à 43 mètres. ', 11, 'grues-dhercules-maroc-ghm', 0, 0, 'grues d\'hercules maroc - ghm', 0, 0, NULL, NULL, NULL, NULL),
(469, 144, 1, 'ELITE AMENAGEMENT', '', NULL, '0614233888', 'WWW.ELITEAGENCEMENT.COM', 'AMENAGEMENT EN CLOISON .PEINTURE.\r\nREVETEMENT DU SOL EN CARLAGE PARQUET ET FAUX PLAFOND', 11, 'elite-amenagement', 0, 0, 'elite amenagement', 0, 0, NULL, NULL, NULL, NULL),
(470, 144, 1, 'MAUREPAS TECHNIQUES', '', NULL, '0685285275', 'MAUREPAS-TECHNIQUES.FR', 'USINAGE\r\nINTEGRATION AERO + PETROLE', 1, 'maurepas-techniques', 0, 0, 'maurepas techniques', 0, 0, NULL, NULL, NULL, NULL),
(476, 144, 1, '1NEWLOG', '', NULL, '0662637305', '', 'sffdsf', 11, '1newlog', 0, 0, '1newlog', 0, 0, NULL, NULL, NULL, NULL),
(477, 144, 12, 'meya buisness', '', NULL, '0661112699', '', 'ste meya buisness vente et installe les climatisation partout au maroc avec des prix imbattable et plus 2ans de garantie 0661112699/0600624627', 11, 'meya-buisness', 0, 0, 'meya buisness', 0, 0, NULL, NULL, NULL, NULL),
(479, 196, 107, 'SLESCA Pte Ltd', '', NULL, '006568488067', 'www.slesca.com', 'Slesca est une société de Trading avec des « Bureau de Sourcing et d’Achats » de produits industriels qui sont basés a Singapour/Chine/Inde, ', 2, 'slesca-pte-ltd', 0, 0, 'slesca pte ltd', 0, 0, NULL, NULL, NULL, NULL),
(481, 144, 1, 'GEST\' ASSISTANCE', '', NULL, '0522874934', '', 'Nous sommes un cabinet de conseil en gestion, nous proposons aux entreprises des services en matière de comptabilité et système d\'information', 11, 'gest-assistance', 0, 0, 'gest\' assistance', 0, 0, NULL, NULL, NULL, NULL),
(482, 144, 1, 'ALLIANSIS', '', NULL, '05 22 201370', '', 'Audit, Consulting, Conseil \r\nEngineering & Re-Engineering des SI \r\nDéploiement & Sécurisation des SI \r\nSolutions de Sauvegarde et de sécurité\r\nCâblage électrique, Informatique…, réfection & Interconnexion Réseaux \r\nMaintenance \r\nInfogérance', 11, 'alliansis', 0, 0, 'alliansis', 0, 0, NULL, NULL, NULL, NULL),
(484, 144, 1, 'Thalès Informatique', '', NULL, '0522548780', 'www.thales.ma', 'intégrateur des logiciels de gestion Sage, solutions d\'infrastructure matérielle et réseau', 11, 'thales-informatique', 0, 0, 'thalès informatique', 0, 0, NULL, NULL, NULL, NULL),
(485, 144, 1, 'MATINVEST SARL', '', NULL, '0661133783', '', 'MATINVEST SARL , société d\'import/export de matériaux de constructions portes (logements économiques et hauts de gamme) cuisnes , parquet ,marbre etc... , ainsi que d\'ameublement  , négoce international .', 11, 'matinvest-sarl', 0, 0, 'matinvest sarl', 0, 0, NULL, NULL, NULL, NULL),
(487, 144, 1, 'GCTI', '', NULL, '0666442753', '', 'EPI, protection, vêtements de travail \r\nPetit outillage\r\nconsommable et fourniture industrielle\r\nPalettes en bois norme NIMP15 avec traitement sanitaire\r\nPalettes en plastique\r\nSignalisation, affichage d’intercours et d’extérieur\r\n\r\nn’hésiter pas a nous consulter pour autres produit\r\n', 11, 'gcti', 0, 0, 'gcti', 0, 0, NULL, NULL, NULL, NULL),
(488, 144, 35, 'PARANUR', '', NULL, '0661189392', '', 'Société spécialisée dans la vente de matériaux.', 11, 'paranur', 0, 0, 'paranur', 0, 0, NULL, NULL, NULL, NULL),
(489, 144, 1, 'Renov Plast', '', NULL, '0661405240', '', 'Socièté de transformation des matières plastiques par injection, fabrication et réparation des moules, matrices et toute autre fabrication mécanique', 11, 'renov-plast', 0, 0, 'renov plast', 0, 0, NULL, NULL, NULL, NULL),
(491, 144, 58, 'Irri ElJanoub SARL', '', NULL, '212528520704', '', 'ETUDE ET REALISATION DES PROJETS D\'IRRIGATION\r\nVENTE ET COMMERCIALISATION DES PRODUITS ET MATERIELS AGRICOLE ET INDUSTRIEL - NEGOCE\r\n\r\nLa technologie moderne d\'irrigation par goutte à goutte ;', 11, 'irri-eljanoub-sarl', 0, 0, 'irri eljanoub sarl', 0, 0, NULL, NULL, NULL, NULL),
(510, 228, 101, 'global advance tachnology', '', NULL, '+212654348713', 'www.gatechnology.co.uk', 'all spare parts and machine', 4, 'global-advance-tachnology', 0, 0, 'global advance tachnology', 0, 0, NULL, NULL, NULL, NULL),
(562, 144, 9, 'GHM MESSTECHNIK MAROC', '', NULL, '+212537360330', 'www.messtechnik.ma', 'GHM MESSTECHNIK MAROC située à kenitra  travaille dans le secteur  industriels  ( métrologie , lean manufacture', 11, 'ghm-messtechnik-maroc', 0, 0, 'ghm messtechnik maroc', 0, 0, NULL, NULL, NULL, NULL),
(566, 109, 108, 'Zallys Srl', '', NULL, '390445366785', 'www.zallys.com', 'Merci à des décennies d\'expérience dans la conception et la fabrication de véhicules électriques professionnels, Zallys a toujours été une société de reference de son secteur, offrant des solutions logistiques pour toute exigence liée à la manutention de charges sur roue.', 11, 'zallys-srl', 0, 0, 'zallys srl', 0, 0, NULL, NULL, NULL, NULL),
(567, 144, 1, 'ATLAS', '', NULL, '0637320163', '', 'ingénierie de conditionnement et emballage', 11, 'atlas', 0, 0, 'atlas', 0, 0, NULL, NULL, NULL, NULL),
(568, 103, 109, 'Eastman Impex', '', NULL, '+91-161-3044092 ', 'www.eastmanimpex.com', 'We are Manufacturer and Exporters of Fabrication Items ', 7, 'eastman-impex', 0, 0, 'eastman impex', 0, 0, NULL, NULL, NULL, NULL),
(572, 144, 1, '2SID TECH', '', NULL, '0663070404', '2SID.MA', '2SID TECH étant un acteur majeur sur le marché de l’identification et Traçabilité', 11, '2sid-tech', 0, 0, '2sid tech', 0, 0, NULL, NULL, NULL, NULL),
(575, 144, 1, 'vibra motor maroc', '', NULL, '0619911703', 'facebook.com/vibramaroc', 'équilibrage des rotors,ventilateur/ analyse vibratoire/ diagnostic roulement/ alignement laser/ usinage mécanique/thermographie.', 11, 'vibra-motor-maroc', 0, 0, 'vibra motor maroc', 0, 0, NULL, NULL, NULL, NULL),
(576, 144, 1, 'STF CONSULTING', '', NULL, ' +212 522 986 960', 'stfconsulting.e-monsite.com/', 'Electricité, électronique, automobile\r\nPneumatique, Électropneumatique\r\nCapteurs\r\nAutomatismes, API, bus de terrain', 11, 'stf-consulting', 0, 0, 'stf consulting', 0, 0, NULL, NULL, NULL, NULL),
(577, 144, 1, 'NT2E', '', NULL, '0700110111', 'www.nt2e.com', 'NT2E Environnement est une société spécialisée dans la commercialisation et l’intégration des solutions sur mesure de traitement & recyclage des eaux domestiques;agricole et industrielles.', 11, 'nt2e', 0, 0, 'nt2e', 0, 0, NULL, NULL, NULL, NULL),
(579, 144, 1, 'Ryme Bensbih', '', NULL, '0661932282', 'www.allobricole.ma', 'Allobricole comble les besoins de nettoyage, jardinage, traitement d’hygiène et bricolage et ainsi que les prestations de maintenance et installations techniques : Electricité, plomberie, Climatisation, Système de vidéo-surveillance, de détection d’incendie et de contrôle d’accès', 11, 'ryme-bensbih', 0, 0, 'ryme bensbih', 0, 0, NULL, NULL, NULL, NULL),
(580, 144, 23, 'société de services et revente', '', NULL, '0661623916', 'www.soserev.ma', 'SSR,  vous propose  Rayonnage\r\net système de stockage, chariot de servie, caisses\r\nnavettes, établies de travail, Intervention sur tout\r\ntype d’atelier et magasin pour démontage remontage\r\net Divers Modifications ou D\'implantation.', 11, 'societe-de-services-et-revente', 0, 0, 'société de services et revente', 0, 0, NULL, NULL, NULL, NULL),
(582, 144, 98, 'F.t.FRERESLAAYOUNE', '', NULL, '0604075903', '', 'Vente et acheter tous les articles EPI', 11, 'ftfrereslaayoune', 0, 0, 'f.t.frereslaayoune', 0, 0, NULL, NULL, NULL, NULL),
(586, 144, 1, 'ATLAS AGENCEMENT', '', NULL, '0522523838', '', 'Société d’équipement et d’aménagement de bureau, vente rayonnage, manutention.', 11, 'atlas-agencement', 0, 0, 'atlas agencement', 0, 0, NULL, NULL, NULL, NULL),
(587, 144, 1, 'DALGO INDUSTRIE', '', NULL, '0661417140', 'www.facebook.com/dalgoindustri', 'Notre métier est le rayonnage dans ses différents systèmes, fonctionnel, modulable , robuste et économique ainsi que les rayonnage dans tous ses types.', 11, 'dalgo-industrie', 0, 0, 'dalgo industrie', 0, 0, NULL, NULL, NULL, NULL),
(588, 144, 1, 'GC SWISS TRADING ', '', NULL, '00212694636583', 'www.astarlubricants.com', 'Nous sommes une usine avec plus de 30 ans d\'expérience dans la production de lubrifiants. \r\nNous produisons le lubrifiant standard pour le lubrifiant compétitif dans les voitures, les motocyclettes, les camions, l\'hydraulique, la transmission, agricole, marine, e', 11, 'gc-swiss-trading-', 0, 0, 'gc swiss trading ', 0, 0, NULL, NULL, NULL, NULL),
(590, 144, 1, 'Alsace Equipement', '', NULL, '06 96 66 66 47', 'alsace-equipement-sarl.busines', 'Nous sommes des fabricants de vétements professionnels et d\'image et EPI depuis 1997,de la création de vos propres modèles le choix des matières la prise des mesures et l\'accompagnement pour un vetement de travail qui vous donne plus de visibilité et de confort.', 11, 'alsace-equipement', 0, 0, 'alsace equipement', 0, 0, NULL, NULL, NULL, NULL),
(591, 144, 1, 'yazi industrie', '', NULL, '0652598954', 'www.yazindustrie.com', 'Entreprise de vente des fourniture industrielles et technique de type : mécanique, pneumatique hydraulique électrique et matériel de sécurité , nous fabriquons des flow rack et postes de travail et nous possédons un département de filtration domestique et industrielle', 11, 'yazi-industrie', 0, 0, 'yazi industrie', 0, 0, NULL, NULL, NULL, NULL),
(592, 144, 1, 'Sigmatecasa ', '', NULL, '0660896422 ', 'www.facebook.com/domotiquee/', 'SIGMATECASA est une société d\'ingénierie spécialisée dans la conception et la gestion de projet de domotique, GTC et l\'intégration des systèmes audiovisuels', 11, 'sigmatecasa-', 0, 0, 'sigmatecasa ', 0, 0, NULL, NULL, NULL, NULL),
(609, 144, 1, 'CONSO EXPRESS', '', NULL, '0619555862', 'www.consoexpress.com', 'fourniture de bureau matériels et consommable de bureau  ', 11, 'conso-express', 0, 0, 'conso express', 0, 0, NULL, NULL, NULL, NULL),
(610, 144, 2, 'GNS-ELEC', '', NULL, '+212602314191', '', 'TRAVAUX ELECTRIQUE\r\nFOURNITURE DES MATÉRIELS ET EQUIPEMENTS ÉLECTRIQUES', 11, 'gns-elec', 0, 1, 'gns-elec', 0, 0, NULL, NULL, NULL, NULL),
(612, 144, 9, 'HIBAPOWER', '', NULL, '0537329090', 'hibapower.com/', 'HIBAPOWER est une société spécialisée en Énergie \r\n (Énergie solaire : pompage solaire, ON Grid, OFF Grid et systèmes hybrides. Groupes électrogènes : Etude, Fourniture, Installation, Maintenance et Location).\r\n', 11, 'hibapower', 0, 0, 'hibapower', 0, 0, NULL, NULL, NULL, NULL),
(613, 144, 1, 'santoimmo', '', NULL, '0619969062', '', 'Notre entreprise vous propose ses services de ponçage,traitement et cristallisation de marbre ;fourniture et pose de gerflex ,parquet papier peint à casablanca, CONT T2L 0619969062', 11, 'santoimmo', 0, 0, 'santoimmo', 0, 0, NULL, NULL, NULL, NULL),
(614, 144, 12, 'AFRICAROME', '', NULL, '00212658668379', 'africarome.com', 'Spécialiste des relations producteurs au Maroc. Produits naturels (Huiles végétales comme l\'huile de Figue de Barbarie et Argan, savons noirs, huiles essentielles, épices, arômes, etc...) ', 11, 'africarome', 0, 0, 'africarome', 0, 0, NULL, NULL, NULL, NULL),
(615, 144, 1, 'EMANUS', '', NULL, '00212638251210', '', 'Vente de Fournitures de bureau, Matériel et Consommables Informatiques ', 11, 'emanus', 0, 0, 'emanus', 0, 0, NULL, NULL, NULL, NULL),
(618, 144, 31, 'Quadritech', '', NULL, '0523335355', 'www.quadritech.ma', 'Quadritech spécialiste dans l\'installation et la maintenance des fermetures industrielles et équipements de quai au Maroc. Disposant de plusieurs d\'années d\'expérience, l\'équipe Quadritech s\'engage à vous présenter la solution la plus adéquate.', 11, 'quadritech', 0, 0, 'quadritech', 0, 0, NULL, NULL, NULL, NULL),
(619, 144, 1, 'PROTECTION UNIT', '', NULL, '0522766526', 'www.protectionunit.ma', 'Afin de répondre à chaque besoin, PROTECTION UNIT propose un éventail de services professionnels. Grâce à son expérience et à un savoir-faire reconnus, \r\n', 11, 'protection-unit', 0, 0, 'protection unit', 0, 0, NULL, NULL, NULL, NULL),
(620, 144, 1, 'L\'ART DU TEXTILE', '', NULL, '212522521078', 'lartdutextile.com', 'VÊTEMENTS PROFESSIONNELS ET HOTELIERS', 11, 'lart-du-textile', 0, 0, 'l\'art du textile', 0, 0, NULL, NULL, NULL, NULL),
(623, 144, 2, 'GHAF CAR', '', NULL, '0619438618', 'Www.ghafcar.ma', 'LOCATION DES VOITURES ', 11, 'ghaf-car', 0, 0, 'ghaf car', 0, 0, NULL, NULL, NULL, NULL),
(624, 144, 98, 'SAHARA NAVALS', '', NULL, '0672682909', '', 'reparation et maintenance des bateaux et navires, reparation et maintenance de coque de navires, reparation et maintenance de chaudiere et tuyauterie', 11, 'sahara-navals', 0, 0, 'sahara navals', 0, 0, NULL, NULL, NULL, NULL),
(627, 144, 1, 'AL ASSIL VOYAGES', '', NULL, '0611308874', '', 'AGENCE DE VOYAGE', 11, 'al-assil-voyages', 0, 0, 'al assil voyages', 0, 0, NULL, NULL, NULL, NULL),
(633, 144, 2, 'SAMT de coordination et de construction', '', NULL, '0600441142', '', 'entrepreneur de travaux divers pilotage et coordination des projets prestation de service divers.', 11, 'samt-de-coordination-et-de-construction', 0, 0, 'samt de coordination et de construction', 0, 0, NULL, NULL, NULL, NULL),
(634, 144, 1, 'BE PREMIUM', '', NULL, '0634770754', 'be-premium.ma/', 'CONSULTING & CONSEIL\r\nFORMATION\r\nINGÉNIERIE\r\nSOUS-TRAITANCE et fabriquant des remorques routiers', 11, 'be-premium', 0, 0, 'be premium', 0, 0, NULL, NULL, NULL, NULL),
(637, 144, 1, 'Company of Industrial Multiservices', '', NULL, '0667255318', '', 'C.I.M vous accompagne dans votre manutention,nous mettons à votre disposition \r\nune ensemble de matériels et de compétences qui vous aide à bien vivre votre manutention.\r\n', 11, 'company-of-industrial-multiservices', 0, 2, 'company of industrial multiservices', 0, 0, NULL, NULL, NULL, NULL),
(638, 144, 31, 'IMOPAC MAROC', '', NULL, '0662190170', '', 'Composants pneumatiques ou hydrauliques\r\n', 11, 'imopac-maroc', 0, 0, 'imopac maroc', 0, 0, NULL, NULL, NULL, NULL),
(640, 144, 1, 'STE BB LUX DECOR', '', NULL, '0663810285', '', 'travaux de tapisseries et ses drives. décorations et ameublement', 11, 'ste-bb-lux-decor', 0, 0, 'ste bb lux decor', 0, 0, NULL, NULL, NULL, NULL),
(641, 144, 1, 'VDV Electro', '', NULL, '0522204321', 'www.ccinv.be', 'Importateur de matériel électrotechnique (interphone, test et mesure, vidéosurveillance)', 11, 'vdv-electro', 0, 0, 'vdv electro', 0, 0, NULL, NULL, NULL, NULL),
(644, 144, 1, 'SEVEN TRADE', '', NULL, '0661429279', 'www.seventrade.ma', 'VENTILATEURS INDUSTRIELS, MOBILIER URBAIN, MATERIEL DE MANUTENTION', 11, 'seven-trade', 0, 0, 'seven trade', 0, 0, NULL, NULL, NULL, NULL),
(645, 144, 1, 'GTSI(Groupe technique de système incendie)', '', NULL, '0650842874', '', 'Spécialisé  en système sécurité notamment dans les domaines de (Détection et protection incendie, anti-intrusion, contrôle d\'accès, désenfumage, Extinction automatique, vidéosurveillance, courant faible.\r\n', 11, 'gtsi', 0, 3, 'gtsi(groupe technique de système incendie)', 0, 0, NULL, NULL, NULL, NULL),
(647, 144, 25, 'logigard', '', NULL, '0661765758', '', 'Bonjour pour tous vos besoins des prestations gardiennage/nettoyage et vidéosurveillance avec des prix intéressants contactez-nous\r\nSociété LOGIGARD SERVICES\r\n0661765758\r\n0537406917\r\nZouhir Elbekkali\r\nGérant', 11, 'logigard', 0, 0, 'logigard', 0, 0, NULL, NULL, NULL, NULL),
(648, 144, 1, 'Airclimelectro', '', NULL, '0661982871', '', 'climatisation,froid,plomberie,extraction,travaux  divers ', 11, 'airclimelectro', 0, 0, 'airclimelectro', 0, 0, NULL, NULL, NULL, NULL),
(649, 144, 1, 'Trans Fuso', '', NULL, '0662798719', '', 'transport marchandises, distribution...', 11, 'trans-fuso', 0, 0, 'trans fuso', 0, 0, NULL, NULL, NULL, NULL),
(652, 144, 31, 'Igor', '', NULL, '0673840138', '', 'Construction et charpente métallique tuyauteries \r\nSablage et peinture industrielle ', 11, 'igor', 0, 0, 'igor', 0, 0, NULL, NULL, NULL, NULL),
(654, 144, 1, 'industry development company', '', NULL, '0664200809', '', 'Industry Development company, est une centrale d\'achat 100% marocaine, qui s\'occupe de vos fournitures industrielles et services.\r\n', 11, 'industry-development-company', 0, 0, 'industry development company', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `fournisseur` (`id`, `pays_id`, `ville_id`, `societe`, `civilite`, `ice`, `fix`, `website`, `description`, `currency_id`, `slug`, `phone_vu`, `visite`, `societe_lower`, `step`, `is_complet`, `code_client`, `autre_ville`, `autre_categories`, `autre_currency`) VALUES
(655, 144, 7, 'Afrique polysystemes technology', '', NULL, '0661050338', 'www.afriquepst.com', '***AFRIQUE POLY SYSTEMES TECHNOLOGY***\r\nis a purchasing and logistics center specializing in the industries that are present in Africa and europe. \r\nFor all your supply and supply chain projects, we have the solution adapted to their needs.', 11, 'afrique-polysystemes-technology', 0, 0, 'afrique polysystemes technology', 0, 0, NULL, NULL, NULL, NULL),
(659, 144, 29, 'BLUE IT', '', NULL, '0661995430', 'blueit.ma', 'SERVICE INFORMATIQUE,\r\nPORTE AUTOMATIQUE ( RIDEAUX, PORTE SECTIONNELLE , BARRIERE ..)\r\nVIDEO SURVEILLANCE\r\nALARME INCENDIE / INTRUSION\r\n', 11, 'blue-it', 0, 3, 'blue it', 0, 0, NULL, NULL, NULL, NULL),
(660, 219, 112, 'iNFOGERANCE', '', NULL, '0021625432777', 'www.onfo-gerance.com', 'développement des produits de connectivité  qui servent à la supervision de réseau d\'éclairage public, monitoring du vehicule et elock pour la sécurisation des remorques, des conteneurs et des camions frigo', 1, 'infogerance', 0, 0, 'infogerance', 0, 0, NULL, NULL, NULL, NULL),
(661, 144, 1, 'SOFIM', '', NULL, '+212522450061', 'www.sofim.ma', 'SOFIM (Société de fournitures d’industries et mines) est crée en 2001; son activité principale est la fourniture, l’installation et l’entretien du matériel industriel (hydraulique, pneumatique, mécanique, électricité, électronique et automatique).', 11, 'sofim', 1, 1, 'sofim', 0, 0, NULL, NULL, NULL, NULL),
(664, 144, 1, 'Koumen négoce', 'M.', NULL, '0663240208', '', 'Koumen négoce société de négoce en matière de lubrifiants moteur et industriels', 11, 'koumen-negoce', 0, 0, 'koumen négoce', 0, 0, NULL, NULL, NULL, NULL),
(684, 75, 33, 'Fournisseur 3', 'M.', NULL, '', 'https://www.lesachatsindustrie', '', 1, 'fournisseur-3', 0, 3, 'fournisseur 3', 3, 1, 'F-6845f24', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur_categories`
--

CREATE TABLE `fournisseur_categories` (
  `fournisseur_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, 'Ligne_Boul_Indu_kl100_0266.JPG'),
(15, 'PRO H DM _machine-a-projeter-pour-mortiers-enduits-4021471.jpg'),
(16, 'CEE_chariot-elevateur-electrique-2077362.jpg'),
(17, 'iMac_imac-computer.jpg'),
(18, 'CED_chariot-elevateur-diesel-gpl-30801.jpg'),
(19, 'S132_materiel-securite-obligatoire.jpg'),
(20, 'METAPACE T1 AVEC INTERFACE_METAPACET1.jpg'),
(21, 'COSO _Coso_image.JPG'),
(22, 'Imprimante_imprimante.jpg'),
(23, 'Mac Pc_imagesCADCI1SO.jpg'),
(24, 'ordinateur hp_pchp.jpg'),
(25, 'Pc Mac_mac.jpg'),
(26, 'CE_imagesCADTUHY5.jpg'),
(27, 'Lvu_images.jpg'),
(28, 'Ray_Mob_rayonnage-a-palette.jpg'),
(29, 'Ray_Comp_rayonnage-a-palette-compact-40483.jpg'),
(30, 'GS55_GS55GT40_2.JPG'),
(31, 'SYNTH_SYNTH.JPG'),
(32, 'Rayonnage conventionnel_IMG_0959.JPG'),
(33, 'Palettiseur_perfilFr.jpg'),
(34, 'SPEED_bk_wms_logo_large1.jpg'),
(35, 'Rayonnage conventionnel_sl9000_clasicas_2.jpg'),
(36, 'Rack Mob_carros_moviles_7.jpg'),
(37, 'SL 3000_sl3000.jpg'),
(38, 'SL 3000_sl3000_1.jpg'),
(39, 'SL 3000_sl3000_2.jpg'),
(40, 'Dynamique_dinamicas_3.jpg'),
(41, 'Dynamique_dinamicas_9.jpg'),
(42, 'Banderoleuse_392_fr-6.jpg'),
(43, 'ILERBIG _386_fr-43.jpg'),
(44, 'ILERFIL ABG ABT_388_fr-2.jpg'),
(45, 'ILERFIL ABG ABSD_386_fr-66.jpg'),
(46, 'ILERFIL ABG ABT_386_fr-62.jpg'),
(47, 'ILERBAG V_perfilFr-14.jpg'),
(48, 'ILERBAG H_perfilFr-13.jpg'),
(49, 'ROBOSAC 800_perfilFr-6.jpg'),
(50, 'ROBOSAC P4_perfilFr-7.jpg'),
(51, 'ROBOT PALLETISEUR_390_fr-18.jpg'),
(52, 'ILERPAL BRICKPAL_Palettiseur_ILERPAL.jpg'),
(53, 'PORTES MDF NID D\'ABEILLES_IMG_20110219_122842.jpg'),
(54, 'centrale_a_beton_DSCF1398.JPG'),
(55, 'equilibrage_centrifugpouliecorr.jpg'),
(56, 'PANNEAU SOLAIRE FREE WATER_panneausolaire280W.jpg'),
(57, 'Huile de Figue de Barbarie_figue.jpg'),
(58, 'neant_Sans-titre-1.jpg'),
(59, '5ed8ffef4fbff435818301.png'),
(60, '5ed9005050f01168369131.png'),
(61, '5ed900d5cc623610167196.png'),
(62, '5edb90d7ebe8e716632113.jpg'),
(63, '5edb9192606c6081110533.jpg'),
(64, '5edb99b804358277105556.png'),
(65, '5ee8e5b5e460c143823819.png');

-- --------------------------------------------------------

--
-- Structure de la table `image_secteur`
--

CREATE TABLE `image_secteur` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('20200622084549', '2020-06-22 08:45:56'),
('20200625092940', '2020-06-25 09:29:46'),
('20200625103952', '2020-06-25 10:39:58');

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
(4, 'Description incorrecte ');

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
(1, 'Pack Classic', 100, 10, 'string', 5, 'Jusqu\'à 5 activités à choisir'),
(2, 'Pack Business', 200, 20, 'string', 10, 'Jusqu\'à 10 activités à choisir'),
(3, 'Pack Gold', 300, 30, 'string', 20, 'Jusqu\'à 20 activités à choisir');

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
(1, 'Afghanistan', 0, 'afghanistan'),
(2, 'Albanie', 0, 'albanie'),
(3, 'Antarctique', 0, 'antarctique'),
(4, 'Algérie', 0, 'algerie'),
(5, 'Samoa Américaines', 0, 'samoa-americaines'),
(6, 'Andorre', 0, 'andorre'),
(7, 'Angola', 0, 'angola'),
(8, 'Antigua-et-Barbuda', 0, 'antigua-et-barbuda'),
(9, 'Azerbaïdjan', 0, 'azerbaïdjan'),
(10, 'Argentine', 0, 'argentine'),
(11, 'Australie', 0, 'australie'),
(12, 'Autriche', 0, 'autriche'),
(13, 'Bahamas', 0, 'bahamas'),
(14, 'Bahreïn', 0, 'bahreïn'),
(15, 'Bangladesh', 0, 'bangladesh'),
(16, 'Arménie', 0, 'armenie'),
(17, 'Barbade', 0, 'barbade'),
(18, 'Belgique', 0, 'belgique'),
(19, 'Bermudes', 0, 'bermudes'),
(20, 'Bhoutan', 0, 'bhoutan'),
(21, 'Bolivie', 0, 'bolivie'),
(22, 'Bosnie-Herzégovine', 0, 'bosnie-herzegovine'),
(23, 'Botswana', 0, 'botswana'),
(24, 'Île Bouvet', 0, 'ile-bouvet'),
(25, 'Brésil', 0, 'bresil'),
(26, 'Belize', 0, 'belize'),
(27, 'Territoire Britannique de l\'Océan Indien', 0, 'territoire-britannique-de-l\'ocean-indien'),
(28, 'Îles Salomon', 0, 'iles-salomon'),
(29, 'Îles Vierges Britanniques', 0, 'iles-vierges-britanniques'),
(30, 'Brunéi Darussalam', 0, 'brunei-darussalam'),
(31, 'Bulgarie', 0, 'bulgarie'),
(32, 'Myanmar', 0, 'myanmar'),
(33, 'Burundi', 0, 'burundi'),
(34, 'Bélarus', 0, 'belarus'),
(35, 'Cambodge', 0, 'cambodge'),
(36, 'Cameroun', 0, 'cameroun'),
(37, 'Canada', 0, 'canada'),
(38, 'Cap-vert', 0, 'cap-vert'),
(39, 'Îles Caïmanes', 0, 'iles-caïmanes'),
(40, 'République Centrafricaine', 0, 'republique-centrafricaine'),
(41, 'Sri Lanka', 0, 'sri-lanka'),
(42, 'Tchad', 0, 'tchad'),
(43, 'Chili', 0, 'chili'),
(44, 'Chine', 0, 'chine'),
(45, 'Taïwan', 0, 'taïwan'),
(46, 'Île Christmas', 0, 'ile-christmas'),
(47, 'Îles Cocos (Keeling)', 0, 'iles-cocos'),
(48, 'Colombie', 0, 'colombie'),
(49, 'Comores', 0, 'comores'),
(50, 'Mayotte', 0, 'mayotte'),
(51, 'République du Congo', 0, 'republique-du-congo'),
(52, 'République Démocratique du Congo', 0, 'republique-democratique-du-congo'),
(53, 'Îles Cook', 0, 'iles-cook'),
(54, 'Costa Rica', 0, 'costa-rica'),
(55, 'Croatie', 0, 'croatie'),
(56, 'Cuba', 0, 'cuba'),
(57, 'Chypre', 0, 'chypre'),
(58, 'République Tchèque', 0, 'republique-tcheque'),
(59, 'Bénin', 0, 'benin'),
(60, 'Danemark', 0, 'danemark'),
(61, 'Dominique', 0, 'dominique'),
(62, 'République Dominicaine', 0, 'republique-dominicaine'),
(63, 'Équateur', 0, 'equateur'),
(64, 'El Salvador', 0, 'el-salvador'),
(65, 'Guinée Équatoriale', 0, 'guinee-equatoriale'),
(66, 'Éthiopie', 0, 'ethiopie'),
(67, 'Érythrée', 0, 'erythree'),
(68, 'Estonie', 0, 'estonie'),
(69, 'Îles Féroé', 0, 'iles-feroe'),
(70, 'Îles (malvinas) Falkland', 0, 'iles-falkland'),
(71, 'Géorgie du Sud et les Îles Sandwich du Sud', 0, 'georgie-du-sud-et-les-iles-sandwich-du-sud'),
(72, 'Fidji', 0, 'fidji'),
(73, 'Finlande', 0, 'finlande'),
(74, 'Îles Åland', 0, 'iles-aland'),
(75, 'France', 0, 'france'),
(76, 'Guyane Française', 0, 'guyane-française'),
(77, 'Polynésie Française', 0, 'polynesie-française'),
(78, 'Terres Australes Françaises', 0, 'terres-australes-françaises'),
(79, 'Djibouti', 0, 'djibouti'),
(80, 'Gabon', 0, 'gabon'),
(81, 'Géorgie', 0, 'georgie'),
(82, 'Gambie', 0, 'gambie'),
(83, 'Territoire Palestinien Occupé', 0, 'territoire-palestinien-occupe'),
(84, 'Allemagne', 0, 'allemagne'),
(85, 'Ghana', 0, 'ghana'),
(86, 'Gibraltar', 0, 'gibraltar'),
(87, 'Kiribati', 0, 'kiribati'),
(88, 'Grèce', 0, 'grece'),
(89, 'Groenland', 0, 'groenland'),
(90, 'Grenade', 0, 'grenade'),
(91, 'Guadeloupe', 0, 'guadeloupe'),
(92, 'Guam', 0, 'guam'),
(93, 'Guatemala', 0, 'guatemala'),
(94, 'Guinée', 0, 'guinee'),
(95, 'Guyana', 0, 'guyana'),
(96, 'Haïti', 0, 'haïti'),
(97, 'Îles Heard et Mcdonald', 0, 'iles-heard-et-mcdonald'),
(98, 'Saint-Siège (état de la Cité du Vatican)', 0, 'saint-siege'),
(99, 'Honduras', 0, 'honduras'),
(100, 'Hong-Kong', 0, 'hong-kong'),
(101, 'Hongrie', 0, 'hongrie'),
(102, 'Islande', 0, 'islande'),
(103, 'Inde', 0, 'inde'),
(104, 'Indonésie', 0, 'indonesie'),
(105, 'République Islamique d\'Iran', 0, 'republique-islamique-iran'),
(106, 'Iraq', 0, 'iraq'),
(107, 'Irlande', 0, 'irlande'),
(108, 'Israël', 0, 'israël'),
(109, 'Italie', 0, 'italie'),
(110, 'Côte d\'Ivoire', 0, 'cote-d-ivoire'),
(111, 'Jamaïque', 0, 'jamaïque'),
(112, 'Japon', 0, 'japon'),
(113, 'Kazakhstan', 0, 'kazakhstan'),
(114, 'Jordanie', 0, 'jordanie'),
(115, 'Kenya', 0, 'kenya'),
(116, 'République Populaire Démocratique de Corée', 0, 'republique-populaire-democratique-de-coree'),
(117, 'République de Corée', 0, 'republique-de-coree'),
(118, 'Koweït', 0, 'koweït'),
(119, 'Kirghizistan', 0, 'kirghizistan'),
(120, 'République Démocratique Populaire Lao', 0, 'republique-democratique-populaire-lao'),
(121, 'Liban', 0, 'liban'),
(122, 'Lesotho', 0, 'lesotho'),
(123, 'Lettonie', 0, 'lettonie'),
(124, 'Libéria', 0, 'liberia'),
(125, 'Jamahiriya Arabe Libyenne', 0, 'jamahiriya-arabe-libyenne'),
(126, 'Liechtenstein', 0, 'liechtenstein'),
(127, 'Lituanie', 0, 'lituanie'),
(128, 'Luxembourg', 0, 'luxembourg'),
(129, 'Macao', 0, 'macao'),
(130, 'Madagascar', 0, 'madagascar'),
(131, 'Malawi', 0, 'malawi'),
(132, 'Malaisie', 0, 'malaisie'),
(133, 'Maldives', 0, 'maldives'),
(134, 'Mali', 0, 'mali'),
(135, 'Malte', 0, 'malte'),
(136, 'Martinique', 0, 'martinique'),
(137, 'Mauritanie', 0, 'mauritanie'),
(138, 'Maurice', 0, 'maurice'),
(139, 'Mexique', 0, 'mexique'),
(140, 'Monaco', 0, 'monaco'),
(141, 'Mongolie', 0, 'mongolie'),
(142, 'République de Moldova', 0, 'republique-de-moldova'),
(143, 'Montserrat', 0, 'montserrat'),
(144, 'Maroc', 0, 'maroc'),
(145, 'Mozambique', 0, 'mozambique'),
(146, 'Oman', 0, 'oman'),
(147, 'Namibie', 0, 'namibie'),
(148, 'Nauru', 0, 'nauru'),
(149, 'Népal', 0, 'nepal'),
(150, 'Pays-Bas', 0, 'pays-bas'),
(151, 'Antilles Néerlandaises', 0, 'antilles-neerlandaises'),
(152, 'Aruba', 0, 'aruba'),
(153, 'Nouvelle-Calédonie', 0, 'nouvelle-caledonie'),
(154, 'Vanuatu', 0, 'vanuatu'),
(155, 'Nouvelle-Zélande', 0, 'nouvelle-zelande'),
(156, 'Nicaragua', 0, 'nicaragua'),
(157, 'Niger', 0, 'niger'),
(158, 'Nigéria', 0, 'nigeria'),
(159, 'Niué', 0, 'niue'),
(160, 'Île Norfolk', 0, 'ile-norfolk'),
(161, 'Norvège', 0, 'norvege'),
(162, 'Îles Mariannes du Nord', 0, 'iles-mariannes-du-nord'),
(163, 'Îles Mineures Éloignées des États-Unis', 0, 'iles-mineures-eloignees-des-etats-unis'),
(164, 'États Fédérés de Micronésie', 0, 'etats-federes-de-micronesie'),
(165, 'Îles Marshall', 0, 'iles-marshall'),
(166, 'Palaos', 0, 'palaos'),
(167, 'Pakistan', 0, 'pakistan'),
(168, 'Panama', 0, 'panama'),
(169, 'Papouasie-Nouvelle-Guinée', 0, 'papouasie-nouvelle-guinee'),
(170, 'Paraguay', 0, 'paraguay'),
(171, 'Pérou', 0, 'perou'),
(172, 'Philippines', 0, 'philippines'),
(173, 'Pitcairn', 0, 'pitcairn'),
(174, 'Pologne', 0, 'pologne'),
(175, 'Portugal', 0, 'portugal'),
(176, 'Guinée-Bissau', 0, 'guinee-bissau'),
(177, 'Timor-Leste', 0, 'timor-leste'),
(178, 'Porto Rico', 0, 'porto-rico'),
(179, 'Qatar', 0, 'qatar'),
(180, 'Réunion', 0, 'reunion'),
(181, 'Roumanie', 0, 'roumanie'),
(182, 'Fédération de Russie', 0, 'federation-de-russie'),
(183, 'Rwanda', 0, 'rwanda'),
(184, 'Sainte-Hélène', 0, 'sainte-helene'),
(185, 'Saint-Kitts-et-Nevis', 0, 'saint-kitts-et-nevis'),
(186, 'Anguilla', 0, 'anguilla'),
(187, 'Sainte-Lucie', 0, 'sainte-lucie'),
(188, 'Saint-Pierre-et-Miquelon', 0, 'saint-pierre-et-miquelon'),
(189, 'Saint-Vincent-et-les Grenadines', 0, 'saint-vincent-et-les-grenadines'),
(190, 'Saint-Marin', 0, 'saint-marin'),
(191, 'Sao Tomé-et-Principe', 0, 'sao-tome-et-principe'),
(192, 'Arabie Saoudite', 0, 'arabie-saoudite'),
(193, 'Sénégal', 0, 'senegal'),
(194, 'Seychelles', 0, 'seychelles'),
(195, 'Sierra Leone', 0, 'sierra-leone'),
(196, 'Singapour', 0, 'singapour'),
(197, 'Slovaquie', 0, 'slovaquie'),
(198, 'Viet Nam', 0, 'viet-nam'),
(199, 'Slovénie', 0, 'slovenie'),
(200, 'Somalie', 0, 'somalie'),
(201, 'Afrique du Sud', 0, 'afrique-du-sud'),
(202, 'Zimbabwe', 0, 'zimbabwe'),
(203, 'Espagne', 0, 'espagne'),
(204, 'Sahara Occidental', 0, 'sahara-occidental'),
(205, 'Soudan', 0, 'soudan'),
(206, 'Suriname', 0, 'suriname'),
(207, 'Svalbard etÎle Jan Mayen', 0, 'svalbard-etile-jan-mayen'),
(208, 'Swaziland', 0, 'swaziland'),
(209, 'Suède', 0, 'suede'),
(210, 'Suisse', 0, 'suisse'),
(211, 'République Arabe Syrienne', 0, 'republique-arabe-syrienne'),
(212, 'Tadjikistan', 0, 'tadjikistan'),
(213, 'Thaïlande', 0, 'thaïlande'),
(214, 'Togo', 0, 'togo'),
(215, 'Tokelau', 0, 'tokelau'),
(216, 'Tonga', 0, 'tonga'),
(217, 'Trinité-et-Tobago', 0, 'trinite-et-tobago'),
(218, 'Émirats Arabes Unis', 0, 'emirats-arabes-unis'),
(219, 'Tunisie', 0, 'tunisie'),
(220, 'Turquie', 0, 'turquie'),
(221, 'Turkménistan', 0, 'turkmenistan'),
(222, 'Îles Turks et Caïques', 0, 'iles-turks-et-caïques'),
(223, 'Tuvalu', 0, 'tuvalu'),
(224, 'Ouganda', 0, 'ouganda'),
(225, 'Ukraine', 0, 'ukraine'),
(226, 'L\'ex-République Yougoslave de Macédoine', 0, 'ex-republique-yougoslave-de-macedoine'),
(227, 'Égypte', 0, 'egypte'),
(228, 'Royaume-Uni', 0, 'royaume-uni'),
(229, 'Île de Man', 0, 'ile-de-man'),
(230, 'République-Unie de Tanzanie', 0, 'republique-unie-de-tanzanie'),
(231, 'États-Unis', 0, 'etats-unis'),
(232, 'Îles Vierges des États-Unis', 0, 'iles-vierges-des-etats-unis'),
(233, 'Burkina Faso', 0, 'burkina-faso'),
(234, 'Uruguay', 0, 'uruguay'),
(235, 'Ouzbékistan', 0, 'ouzbekistan'),
(236, 'Venezuela', 0, 'venezuela'),
(237, 'Wallis et Futuna', 0, 'wallis-et-futuna'),
(238, 'Samoa', 0, 'samoa'),
(239, 'Yémen', 0, 'yemen'),
(240, 'Serbie-et-Monténégro', 0, 'serbie-et-montenegro'),
(241, 'Zambie', 0, 'zambie');

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
  `date_validation` datetime DEFAULT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_vu` int(11) NOT NULL,
  `titre_lower` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `free` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `secteur_id`, `sous_secteurs_id`, `fournisseur_id`, `fiche_technique_id`, `reference`, `description`, `pu`, `del`, `is_select`, `is_valid`, `created`, `videos`, `categorie_id`, `featured_image_id_id`, `titre`, `currency_id`, `date_validation`, `pays_id`, `slug`, `phone_vu`, `titre_lower`, `ville_id`, `free`) VALUES
(47, 2, 9, 2, NULL, 'Ligne Boul Indu', 'ligne de boulangerie de très bonne occasion.', 0, 0, 1, 1, '2010-06-06 16:15:45', '', 34, 14, 'Ligne Boul Indu', 12, '2010-06-06 16:15:45', 144, 'ligne-boul-indu', 0, 'ligne boul indu', 1, 1),
(49, 5, 17, 2, NULL, 'PRO H DM ', 'PRO H DM - MACHINE A PROJETER AVEC POMPE A VIS ET FONCTIONNEMENT HYDRAULIQUE \r\nLe meilleur de l’hydraulique et de l’électromécanique pour une machine unique de par sa conception. \r\nElle garantit le meilleur avantage technico-économique durant toutes les phases de travail. Elle est équipée d’un circuit hydraulique innovateur Hydrotronic qui garantit des prestations maximales avec des consommations réduites. \r\nLa technologie Turbosol la plus évoluée pour les professionnels de l’enduit. ', 0, 0, 1, 1, '2010-06-06 16:46:28', '', 59, 15, 'PRO H DM ', 12, '2010-06-06 16:46:28', 144, 'pro-h-dm', 0, 'pro hdm ', 1, 0),
(50, 25, 70, 2, NULL, 'CEE', 'Avec le GenEX, les accélérations, la capacité en rampes et la stabilité sont remarquables. La bi-motorisation, permet une meilleute traction, particulièrement sur sols inégaux et humides. La vitesse de chaque moteur est adaptée proportionnellement en fonction de l\'angle de braquage. Le braquage des roues arríère est supérieur de 101° aux autres chariots et s\'inscrit dans une épure parfaite. Les freins à disques à bain d\'huile, complètement étanches, garantissent un freinage parfait et constant, ', 0, 0, 1, 1, '2010-06-06 16:54:49', '', 305, 16, 'CEE', 12, '2010-06-06 16:54:49', 144, 'cee', 0, 'cee', 1, 0),
(52, 23, 67, 2, NULL, 'iMac', 'iMac 24\" - Core 2 Duo 2,8 GHz : 2  de mémoire vive - 500  de disque dur - Graveur DVD Superdrive 8X double couche - carte graphique ATI Radeon HD 2600 Pro 256 Mo ', 0, 0, 1, 1, '2010-06-06 17:15:17', '', 294, 17, 'iMac', 12, '2010-06-06 17:15:17', 144, 'imac', 0, 'imac', 1, 0),
(53, 25, 70, 2, NULL, 'CED', 'Les séries H2.0-3.5FT sont les solutions pour vos applications exigentes. Une large gamme de chariots, de transmissions et d’options sont disponibles, ainsi vous pouvez facilement configurer le chariot correspondant à vos besoins spécifiques. \r\n\r\nCette série est disponible avec les configurations Fortens, Fortens Advance et Fortens Advance Plus. Plusieurs choix de moteurs sont possibles : 2.6L & 3.3L Diesel ou 2.0L, 2.2L &2.4L Gaz, combiné avec les transmissions powershift ou Duramatch™, et avec', 0, 0, 1, 1, '2010-06-06 17:22:31', '', 305, 18, 'CED', 12, '2010-06-06 17:22:31', 144, 'ced', 0, 'ced', 1, 0),
(54, 34, 86, 2, NULL, 'S132', 'MATERIEL DE SECURITE CONTRE LE FEU', 0, 0, 0, 1, '2010-06-09 15:24:11', '', 364, 19, 'S132', 12, '2010-06-09 15:24:11', 144, 's132', 0, 's132', 1, 0),
(81, 25, 72, 2, NULL, 'Rayonnage mobile', 'Cette solution de rayonnage mobile vous permet d\'optimiser au maximum votre espace de stockage.\r\nCette solution est idéale pour tous ceux qui veulent accéder à n\'importe quelle palette à tout moment.', 0, 0, 0, 1, '2010-06-25 11:44:44', '', 314, 28, 'Rayonnage mobile', 12, '2010-06-25 11:44:44', 144, 'rayonnage-mobile', 0, 'rayonnage mobile', 1, 0),
(82, 25, 72, 2, NULL, 'Rayonnage compact', 'Idéal pour stocker des produits du même type. Cette solution vous permet de réduire au maximum les allées de circulation.', 0, 0, 0, 1, '2010-06-25 11:48:14', '', 313, 29, 'Rayonnage compact', 12, '2010-06-25 11:48:14', 144, 'rayonnage-compact', 0, 'rayonnage compact', 1, 0),
(87, 25, 72, 2, NULL, 'Rayonnage conventionnel', 'Rayonnage conventionnel, ce type vous permet l\'accés directe à n\'importe quelle palette.', 0, 0, 0, 1, '2011-04-11 16:16:15', '', 313, 32, 'Rayonnage conventionnel', 12, '2011-04-11 16:16:15', 144, 'rayonnage-conventionnel', 0, 'rayonnage conventionnel', 1, 0),
(88, 13, 32, 2, NULL, 'Palettiseur', 'PALLETISEUR AUTOMATIQUE DE SACS D\'HAUTE PRODUCTION\r\nLes palettiseurs ILERPAL à couches à niveau d’entrée élevé et avec plateforme mobile sont conçus pour fournir le maximum d\'avantages pendant beaucoup d’années avec une maintenance minimale.\r\n\r\nLa série ILERPAL permet palettiser une large gamme de produits en plusieurs formats et aussi en différents niveaux de production. \r\n\r\nLa douceur de l\'opération élimine les démarrages et les arrêts brusques, élargissant ainsi la vie des parties mécanique', 0, 0, 0, 1, '2011-04-11 16:27:19', '', 142, 33, 'Palettiseur', 12, '2011-04-11 16:27:19', 144, 'palettiseur', 0, 'palettiseur', 1, 0),
(89, 25, 70, 2, NULL, 'SPEED', 'Speed WMS est un progiciel de gestion d’entrepôt (Warehouse Management System) permettant de rationaliser les processus de fonctionnement de l\'entrepôt. \r\nLe système permet de faire des gains de productivité sur des axes multiples. Le logiciel de gestion de stock devient un facteur de différenciation..', 0, 0, 0, 1, '2011-04-11 17:26:43', '', 303, 34, 'SPEED', 12, '2011-04-11 17:26:43', 144, 'speed', 0, 'speed', 1, 0),
(90, 25, 72, 2, NULL, 'Rayonnage conventionnel', 'Ce système a été conçu pour le stockage de charges palettisées et s\'adapte à toutes charges et hauteurs. Il offre de multiples applications : classique, mobile, accumulation, dynamique, desservis par transstockeurs, chariots bi et tridirectionnels, etc....', 0, 0, 0, 1, '2011-04-11 19:31:01', '', 313, 35, 'Rayonnage conventionnel ', 12, '2011-04-11 19:31:01', 144, 'rayonnage-conventionnel-1', 0, 'rayonnage conventionnel', 1, 0),
(91, 25, 72, 2, NULL, 'Rack mobile', 'Ces rayonnages mobiles se déplacent sur des rails et permettent ainsi de profiter au maximum de l\'espace disponible. Indépendamment de leur emplacement, ce système permet d\'accéder à l’ensemble des documents ou produits par un seul couloir de service. Un système modulaire et évolutif.', 0, 0, 0, 1, '2011-04-11 19:33:51', '', 314, 36, 'Rack mobile', 12, '2011-04-11 19:33:51', 144, 'rack-mobile', 0, 'rack mobile', 1, 0),
(92, 25, 72, 2, NULL, 'Rayonnages charges légères', 'Système modulaire, esthétique, universel, fonctionnel, résistant, garantissant une qualité et une sécurité d’utilisation optimales. Ses caractéristiques et sa conception lui permettent d’offrir tout une gamme d’alternatives pour bureaux, bibliothèques, musées, hôpitaux, établissements scolaires et autres institutions.', 0, 0, 0, 1, '2011-04-11 19:58:07', '', 311, 37, 'Rayonnages charges légères', 12, '2011-04-11 19:58:07', 144, 'rayonnages-charges-legeres', 0, 'rayonnages charges légères', 1, 0),
(95, 25, 72, 2, NULL, 'Dynamique', 'Ce système repose sur le principe de la gravité. Les palettes chargées au point le plus haut de la ligne descendent mécaniquement sur des rouleaux vers le point le plus bas. La vitesse est contrôlée par des rouleaux freineurs à chaque place palette. Système P.E.-P.S. : premier entré, premier sorti.', 0, 0, 0, 1, '2011-04-11 20:03:59', '', 315, 40, 'Dynamique', 12, '2011-04-11 20:03:59', 144, 'dynamique', 0, 'dynamique', 1, 0),
(97, 13, 32, 2, NULL, 'Banderoleuse', 'BANDEROLEUSE À PLATEAU TOURNANT \r\n•	Modules principaux:\r\n•	Table tournante : loge le système de découpe et de soudage du film. Le convoyeur à rouleaux est placé sur la table.\r\n•	Colonne verticale supportant la bobine de film. Incorpore l’armoire de commande et l’interface opérateur par écran tactile.', 0, 0, 0, 1, '2011-04-11 22:40:08', '', 142, 42, 'Banderoleuse', 12, '2011-04-11 22:40:08', 144, 'banderoleuse', 0, 'banderoleuse', 1, 0),
(98, 13, 37, 2, NULL, 'ILERBIG ', 'Station de remplissage de BIG BAGS, avec alimentation palette vide automatique.', 0, 0, 0, 1, '2011-04-27 18:07:56', '', 152, 43, 'ILERBIG ', 12, '2011-04-27 18:07:56', 144, 'ilerbig', 0, 'ilerbig ', 1, 0),
(99, 13, 37, 2, NULL, 'ILERFIL ABG ABT', 'Les ensacheuses ILERFIL ABG/ABT sont conçues pour les industries nécessitant un ensachage précis et rapide, avec une installation compacte et un investissement réduit.\r\n\r\nLes différentes problématiques existant sur les lignes d\'ensachage industriel ont été prises en compte lors de la conception de nos machines.', 0, 0, 0, 1, '2011-04-27 18:15:04', '', 150, 44, 'ILERFIL ABG ABT', 12, '2011-04-27 18:15:04', 144, 'ilerfil-abg-abt', 0, 'ilerfil abg abt', 1, 0),
(100, 13, 37, 2, NULL, 'ILERFIL ABG ABSD', 'Ligne d’ensachage semi-automatique, idéale pour l’industrie agroalimentaire, la chimie fine ou toute application requérant un pesage de haute précision et un nettoyage aisé lors des changements de produits.', 0, 0, 0, 1, '2011-04-27 18:16:50', '', 150, 45, 'ILERFIL ABG ABSD', 12, '2011-04-27 18:16:50', 144, 'ilerfil-abg-absd', 0, 'ilerfil abg absd', 1, 0),
(101, 13, 37, 2, NULL, 'ILERFIL ABG ABT2', 'ENSACHEUSE POIDS BRUT POUR SACS DE GUEULE OUVERTE\r\nLes ensacheuses ILERFIL ABG/ABT sont conçues pour les industries nécessitant un ensachage précis et rapide, avec une installation compacte et un investissement réduit.', 0, 0, 0, 1, '2011-04-27 18:19:35', '', 150, 46, 'ILERFIL ABG ABT', 12, '2011-04-27 18:19:35', 144, 'ilerfil-abg-abt2', 0, 'ilerfil abg abt', 1, 0),
(102, 13, 37, 2, NULL, 'ILERBAG V', 'ENSACHEUSE FFS VERTICALE POUR FILM PE\r\nSolution pour les industries à la recherche d’une fiabilité accrue, de polyvalence, d’un niveau d’automatisation élevé et d’autonomie pour les process d’ensachage, le tout assorti d’une baisse significative des coûts d’ensachage.', 0, 0, 0, 1, '2011-04-27 18:24:05', '', 150, 47, 'ILERBAG V', 12, '2011-04-27 18:24:05', 144, 'ilerbag-v', 0, 'ilerbag v', 1, 0),
(103, 13, 37, 2, NULL, 'ILERBAG H', 'ENSACHEUSE FFS HORIZONTALE À BOBINE TUBULAIRE\r\nSolution pour les industries à la recherche d’une fiabilité accrue, de polyvalence, d’un niveau d’automatisation élevé et d’autonomie pour les process d’ensachage, le tout assorti d’une baisse significative des coûts d’ensachage', 0, 0, 0, 1, '2011-04-27 18:26:30', '', 150, 48, 'ILERBAG H', 12, '2011-04-27 18:26:30', 144, 'ilerbag-h', 1, 'ilerbag h', 1, 0),
(104, 13, 37, 2, NULL, 'ROBOSAC 800', 'PALETTISEUR À NIVEAU D’ENTRÉE ÉLEVÉ AVEC GRAPPIN ROBOTISÉ\r\nLes palettiseurs ROBOSAC 800, à niveau d’entrée élevé avec grappin motorisé, sont conçus pour assurer un service optimal pendant de longues années et avec un entretien minimal.\r\nLes équipements de TMI permettent de palettiser une gamme étendue de produits dans plusieurs formats et à différents niveaux de production. Ils sont conçus pour assurer un service optimal pendant de longues années et avec un entretien minimal.\r\n\r\nLe fonctionnemen', 0, 0, 0, 1, '2011-04-27 18:29:36', '', 151, 49, 'ROBOSAC 800', 12, '2011-04-27 18:29:36', 144, 'robosac-800', 0, 'robosac 800', 1, 0),
(105, 13, 37, 2, NULL, 'ROBOSAC P4', 'ROBOSAC P4 permet la palettisation d\'une large gamme de produits sous différents formats. Sa conception prévoit des configurations allant de la simple palettisation au sol à la ligne de palettisation entièrement automatisée. Design compact, optimisation de l’encombrement et retour rapide sur investissement. Précis, silencieux, robuste et sans entretien, le palettiseur ROBOSAC P4 est conçu pour assurer un service optimal pendant de longues années en milieu industriel.\r\nPour les industries qui req', 0, 0, 0, 1, '2011-04-27 18:32:20', '', 151, 50, 'ROBOSAC P4', 12, '2011-04-27 18:32:20', 144, 'robosac-p4', 0, 'robosac p4', 1, 0),
(106, 13, 37, 2, NULL, 'ROBOT PALLETISEUR', 'CARACTÉRISTIQUES\r\nCellules flexibles de palettisation au moyen de robots industriels. Polyvalent pour la palettisation de sacs, cartons, bidons et la manutention de palettes.\r\nPossibilité d\'assister à plusieurs stations de manipulation simultanément.\r\nDépôt des sacs par grappin de type central ou latéral selon le sac et les mosaïques à palettiser.\r\nAdaptabilité pour la manutention de différents types d’emballages.\r\nFlexibilité pour conduire diverses lignes d’emballages en formant plusieurs palet', 0, 0, 0, 1, '2011-04-27 18:37:24', '', 151, 51, 'ROBOT PALLETISEUR', 12, '2011-04-27 18:37:24', 144, 'robot-palletiseur', 0, 'robot palletiseur', 1, 0),
(107, 13, 37, 2, NULL, 'ILERPAL BRICKPAL', 'PALLETISEUR AUTOMATIQUE DE SACS D\'HAUTE PRODUCTION\r\nLes palettiseurs ILERPAL à couches à niveau d’entrée élevé et avec plateforme mobile sont conçus pour fournir le maximum d\'avantages pendant beaucoup d’années avec une maintenance minimale.\r\n\r\nLa série ILERPAL permet palettiser une large gamme de produits en plusieurs formats et aussi en différents niveaux de production. \r\n\r\nLa douceur de l\'opération élimine les démarrages et les arrêts brusques, élargissant ainsi la vie des parties mécaniques.', 0, 0, 0, 1, '2011-04-27 19:03:17', '', 151, 52, 'ILERPAL BRICKPAL', 12, '2011-04-27 19:03:17', 144, 'ilerpal-brickpal', 0, 'ilerpal brickpal', 1, 0);

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
(47, 14),
(49, 15),
(50, 16),
(52, 17),
(53, 18),
(54, 19),
(81, 28),
(82, 29),
(87, 32),
(88, 33),
(89, 34),
(90, 35),
(91, 36),
(92, 37),
(95, 40),
(97, 42),
(98, 43),
(99, 44),
(100, 45),
(101, 46),
(102, 47),
(103, 48),
(104, 49),
(105, 50),
(106, 51),
(107, 52);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`id`, `image_id`, `name`, `del`, `slug`) VALUES
(1, NULL, 'Acier, Bois et Tôle', 0, 'acier-bois-et-tole'),
(2, NULL, 'Agro-Alimentaire', 0, 'agro-alimentaire'),
(3, NULL, 'Ascenseurs et montes charges', 0, 'ascenseurs-et-montes-charges'),
(4, NULL, 'Automobiles', 0, 'automobiles'),
(5, NULL, 'Bien d´équipement industriel', 0, 'bien-dequipement-industriel'),
(6, NULL, 'BTP', 0, 'btp'),
(7, NULL, 'Bureau d´étude', 0, 'bureau-detude'),
(8, NULL, 'Bureautique & Mobilier', 0, 'bureautique-mobilier'),
(9, NULL, 'Chimie, parachimie, pharmacie', 0, 'chimie-parachimie-pharmacie'),
(10, NULL, 'Conception & Graphismes', 0, 'conception-graphismes'),
(11, NULL, 'Conseil en Finance', 0, 'conseil-en-finance'),
(12, NULL, 'Consommable industriel', 0, 'consommable-industriel'),
(13, NULL, 'Emballage', 0, 'emballage'),
(14, NULL, 'Energie', 0, 'energie'),
(15, NULL, 'Evénements', 0, 'evenements'),
(16, NULL, 'Formations', 0, 'formations'),
(17, NULL, 'Froid et Climatisation', 0, 'froid-et-climatisation'),
(18, NULL, 'Génie civil', 0, 'genie-civil'),
(19, NULL, 'Hotel Café et Restaurant HCR', 0, 'hotel-cafe-et-restaurant-hcr'),
(20, NULL, 'Impression', 0, 'impression'),
(21, NULL, 'Industrie de transformation', 0, 'industrie-de-transformation'),
(22, NULL, 'Industries mécaniques et manufacturières', 0, 'industries-mecaniques-et-manufacturieres'),
(23, NULL, 'Informatique', 0, 'informatique'),
(24, NULL, 'Internet & Webdesign', 0, 'internet-webdesign'),
(25, NULL, 'Logistique', 0, 'logistique'),
(26, NULL, 'Marketing & Communication', 0, 'marketing-communication'),
(28, NULL, 'Peinture', 0, 'peinture'),
(29, NULL, 'Pétrole et Gaz', 0, 'petrole-et-gaz'),
(30, NULL, 'Photo, Vidéo & Présentations', 0, 'photo-video-presentations'),
(31, NULL, 'Plastique Caoutchouc et dérivé', 0, 'plastique-caoutchouc-et-derive'),
(32, NULL, 'Promo & Cadeaux d\'affaires', 0, 'promo-cadeaux-daffaires'),
(33, NULL, 'Ressources Humaines', 0, 'ressources-humaines'),
(34, NULL, 'Sécurité & Surveillance', 0, 'securite-surveillance'),
(35, NULL, 'Sidérurgie, métallurgie', 0, 'siderurgie-metallurgie'),
(36, NULL, 'Télécom & Réseaux', 0, 'telecom-reseaux'),
(37, NULL, 'Travail du métal', 0, 'travail-du-metal'),
(38, NULL, 'Voyages et loisirs', 0, 'voyages-et-loisirs');

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
(4, 87, '2020-04-11 01:40:54'),
(5, 90, '2020-04-11 01:41:26'),
(6, 91, '2020-04-11 01:41:59'),
(7, 95, '2020-04-11 01:42:28'),
(8, NULL, '2020-05-15 14:25:38'),
(9, NULL, '0000-00-00 00:00:00'),
(10, NULL, '0000-00-00 00:00:00'),
(11, NULL, '0000-00-00 00:00:00'),
(12, NULL, '0000-00-00 00:00:00'),
(13, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `sous_secteur`
--

CREATE TABLE `sous_secteur` (
  `id` int(11) NOT NULL,
  `secteur_id` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_lower` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_secteur`
--

INSERT INTO `sous_secteur` (`id`, `secteur_id`, `name`, `name_lower`, `del`, `slug`) VALUES
(1, 1, 'Métaux', 'métaux', 0, 'metaux'),
(2, 2, 'Agro-industrie', 'agro-industrie', 0, 'agro-industrie'),
(3, 2, 'Agro-Alimentaire', 'agro-alimentaire', 0, 'agro-alimentaire'),
(4, 2, 'Matériel et fournitures pour café et restaurant', 'matériel et fournitures pour café et restaurant', 0, 'materiel-et-fournitures-pour-cafe-et-restaurant'),
(5, 2, 'Matériel et fournitures boucheries et charcuterie', 'matériel et fournitures boucheries et charcuterie', 0, 'materiel-et-fournitures-boucheries-et-charcuterie'),
(7, 2, 'Matériel et fournitures pour Boulangeries et pâtis', 'matériel et fournitures pour boulangeries et pâtis', 0, 'materiel-et-fournitures-pour-boulangeries-et-patis'),
(9, 2, 'Matériel et fournitures Industrie Alimentaire', 'matériel et fournitures industrie alimentaire', 0, 'materiel-et-fournitures-industrie-alimentaire'),
(10, 2, 'Matériel et fournitures Pâtisseries confiserie', 'matériel et fournitures pâtisseries confiserie', 0, 'materiel-et-fournitures-patisseries-confiserie'),
(11, 2, 'Produits alimentaires Congelé', 'produits alimentaires congelé', 0, 'produits-alimentaires-congele'),
(12, 3, 'Ascenseurs', 'ascenseurs', 0, 'ascenseurs'),
(13, 3, 'Montes charges', 'montes charges', 0, 'montes-charges'),
(14, 4, 'Vehicule Professionnel', 'vehicule professionnel', 0, 'vehicule-professionnel'),
(15, 4, 'PDR', 'pdr', 0, 'pdr'),
(16, 5, 'Balance et bascule', 'balance et bascule', 0, 'balance-et-bascule'),
(17, 5, 'Equipements Industriels', 'equipements industriels', 0, 'equipements-industriels'),
(18, 5, 'Matériel et fourniture pour blanchisserie et laver', 'matériel et fourniture pour blanchisserie et laver', 0, 'materiel-et-fourniture-pour-blanchisserie-et-laver'),
(19, 6, 'Materiel BTP', 'materiel btp', 0, 'materiel-btp'),
(20, 7, 'Bureau d\'étude', 'bureau d\'étude', 0, 'bureau-detude'),
(21, 8, 'Bureautique', 'bureautique', 0, 'bureautique'),
(22, 8, 'Equipements pour Bureau', 'equipements pour bureau', 0, 'equipements-pour-bureau'),
(23, 9, 'Chimie', 'chimie', 0, 'chimie'),
(24, 9, 'Parachimie', 'parachimie', 0, 'parachimie'),
(25, 10, 'Conception et réalisation', 'conception et réalisation', 0, 'conception-et-realisation'),
(26, 10, 'Support publicitaire', 'support publicitaire', 0, 'support-publicitaire'),
(27, 11, 'Expert financier', 'expert financier', 0, 'expert-financier'),
(28, 11, 'Conseil opérationnel et industriel', 'conseil opérationnel et industriel', 0, 'conseil-operationnel-et-industriel'),
(29, 11, 'Conseil stratégique et études', 'conseil stratégique et études', 0, 'conseil-strategique-et-etudes'),
(30, 11, 'Recouvrement de créances', 'recouvrement de créances', 0, 'recouvrement-de-creances'),
(31, 12, 'Fourniture industrielle', 'fourniture industrielle', 0, 'fourniture-industrielle'),
(32, 12, 'Emballage et conditionnement', 'emballage et conditionnement', 0, 'emballage-et-conditionnement'),
(33, 12, 'Produit d´entretien et de nettoyage', 'produit d´entretien et de nettoyage', 0, 'produit-dentretien-et-de-nettoyage'),
(35, 13, 'Carton', 'carton', 0, 'carton'),
(36, 13, 'Design emballage et étiquettes', 'design emballage et étiquettes', 0, 'design-emballage-et-etiquettes'),
(37, 13, 'Machine et Equipement', 'machine et equipement', 0, 'machine-et-equipement'),
(38, 14, 'Energie Solaire', 'energie solaire', 0, 'energie-solaire'),
(39, 14, 'Biocarburant', 'biocarburant', 0, 'biocarburant'),
(41, 14, 'Electricité', 'electricité', 0, 'electricite'),
(42, 14, 'Electronique', 'electronique', 0, 'electronique'),
(43, 15, 'Stand d\'exposition', 'stand d\'exposition', 0, 'stand-dexposition'),
(44, 15, 'Service au Entreprises', 'service au entreprises', 0, 'service-au-entreprises'),
(45, 15, 'Location de salles', 'location de salles', 0, 'location-de-salles'),
(46, 15, 'Location mobilier d\'exposition', 'location mobilier d\'exposition', 0, 'location-mobilier-dexposition'),
(47, 15, 'Organisation d\'événements', 'organisation d\'événements', 0, 'organisation-devenements'),
(48, 15, 'Salons et Expositions', 'salons et expositions', 0, 'salons-et-expositions'),
(49, 15, 'Son et lumière', 'son et lumière', 0, 'son-et-lumiere'),
(50, 16, 'Formations', 'formations', 0, 'formations'),
(51, 17, 'Froid et climatisation', 'froid et climatisation', 0, 'froid-et-climatisation'),
(52, 18, 'Architectes', 'architectes', 0, 'architectes'),
(53, 18, 'Construction générale', 'construction générale', 0, 'construction-generale'),
(54, 18, 'Matériaux de construction', 'matériaux de construction', 0, 'materiaux-de-construction'),
(55, 18, 'Agencement, décoration', 'agencement, décoration', 0, 'agencement-decoration'),
(56, 18, 'Bâtiment', 'bâtiment', 0, 'batiment'),
(57, 19, 'Nettoyage', 'nettoyage', 0, 'nettoyage'),
(58, 19, 'Electroménager', 'electroménager', 0, 'electromenager'),
(59, 19, 'Fournisture Pour HCR', 'fournisture pour hcr', 0, 'fournisture-pour-hcr'),
(60, 20, 'Impression', 'impression', 0, 'impression'),
(61, 21, 'Industries de transformation Plastique et PVC', 'industries de transformation plastique et pvc', 0, 'industries-de-transformation-plastique-et-pvc'),
(62, 22, 'Industrie Mécanique', 'industrie mécanique', 0, 'industrie-mecanique'),
(63, 23, 'Expert informatique', 'expert informatique', 0, 'expert-informatique'),
(64, 23, 'Développement, programmation logiciel', 'développement, programmation logiciel', 0, 'developpement-programmation-logiciel'),
(65, 23, 'Logiciel', 'logiciel', 0, 'logiciel'),
(66, 23, 'Sécurité informatique', 'sécurité informatique', 0, 'securite-informatique'),
(67, 23, 'Materiel Informatique', 'materiel informatique', 0, 'materiel-informatique'),
(68, 23, 'Maintenance Informatique', 'maintenance informatique', 0, 'maintenance-informatique'),
(69, 24, 'Création site web', 'création site web', 0, 'creation-site-web'),
(70, 25, 'Manutention', 'manutention', 0, 'manutention'),
(71, 25, 'Entreposage', 'entreposage', 0, 'entreposage'),
(72, 25, 'Rayonnage', 'rayonnage', 0, 'rayonnage'),
(73, 25, 'Transport de marchandise', 'transport de marchandise', 0, 'transport-de-marchandise'),
(74, 26, 'Marketing', 'marketing', 0, 'marketing'),
(75, 26, 'Communication', 'communication', 0, 'communication'),
(76, 26, 'Télémarketing et Centres d\'appels', 'télémarketing et centres d\'appels', 0, 'telemarketing-et-centres-dappels'),
(79, 28, 'Peinture industrielle', 'peinture industrielle', 0, 'peinture-industrielle'),
(80, 29, 'Pétrole', 'pétrole', 0, 'petrole'),
(81, 29, 'Gaz', 'gaz', 0, 'gaz'),
(82, 30, 'Présentations', 'présentations', 0, 'presentations'),
(83, 31, 'Plastiques', 'plastiques', 0, 'plastiques'),
(84, 32, 'Cadeaux d\'affaires', 'cadeaux d\'affaires', 0, 'cadeaux-daffaires'),
(85, 33, 'Ressources Humaines', 'ressources humaines', 0, 'ressources-humaines'),
(86, 34, 'Sécurité', 'sécurité', 0, 'securite'),
(87, 35, 'Sidérurgie', 'sidérurgie', 0, 'siderurgie'),
(88, 35, 'Métallurgie', 'métallurgie', 0, 'metallurgie'),
(89, 36, 'Réseau', 'réseau', 0, 'reseau'),
(90, 36, 'Télécom', 'télécom', 0, 'telecom'),
(91, 37, 'Chaudronnerie', 'chaudronnerie', 0, 'chaudronnerie'),
(92, 37, 'Charpente', 'charpente', 0, 'charpente'),
(93, 38, 'Billetterie', 'billetterie', 0, 'billetterie'),
(94, 38, 'Location véhicules', 'location véhicules', 0, 'location-vehicules'),
(96, 9, 'Pharmacie', 'pharmacie', 0, 'pharmacie');

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
  `redirect` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_date` datetime DEFAULT NULL,
  `forgot_token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `adresse1`, `adresse2`, `codepostal`, `phone`, `email`, `password`, `del`, `isactif`, `created`, `first_name`, `last_name`, `username`, `discr`, `roles`, `password_change_date`, `parent1`, `confirmation_token`, `avatar_id`, `redirect`, `password_reset_date`, `forgot_token`) VALUES
(1, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'youness.arbouh55@gmail.com', '$2y$13$H./PWBuS/z5G4Zb2vnhUUeecSGafd4WpT6HOKJdB2aLajgV2sV57q', 0, 1, '2019-08-06 10:59:17', 'YOUNESS', 'ARBOUH', 'unessami1253', 'Admin', 'ROLE_ADMIN', 1569857840, NULL, 'lcL6@PnSmZRYWhJ0iWbX8cygti4tnj', NULL, '/dashboard', NULL, NULL),
(2, '36, rue imam al boukhari maarif', '', 27000, '0661355218', '3findustrie@gmail.com', '$2y$13$KNOAsj3DxNN2nyx6Pad1yOQ7h7GGyBN/FLp1yeoeG8svFByBjDhxa', 0, 1, '2020-04-09 16:55:02', 'Younes', 'HALOUI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, 'vfi0q1qzwSDjLM701p6NdGwZfVjYDy', NULL, '/dashboard', '2020-05-14 10:12:08', NULL),
(3, '36, rue imam al boukhari maarif', '', NULL, '0661355218', 'achats@lesachatsindustriels.com', '$2y$13$jdyfrXnAVHfMYrAvrGbF4OIfYdfKel/qLRWhxth8mvQuLx59Geuhu', 0, 1, '2020-04-09 17:21:23', 'YOUNESS', 'HALOUI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, 'gd4sUnPLZo6nn4S9iuc.WfkQ.LaNla', NULL, '/dashboard_ac', NULL, NULL),
(40, '248 Bd Med 5', '', 20000, '0522898977', 'mounsif.brahim@gmail.com', '', 0, 0, '2009-04-02 11:55:54', 'Ibrahim', 'Mounsif', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(49, '16 rue Al bouhtouri', '', 20500, '212661685117', 'abderrahim.chtouane@thyssenkrupp.ma', '', 0, 0, '2009-05-26 10:22:35', 'ABDERRAHIM', 'CHTOUANE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(53, 'Rabat rue agadir', '', 23000, '099999', 'b.mounsif@casanet.ma', '', 0, 0, '2009-06-01 18:19:39', 'Test', 'Test', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(55, '43, Bd Zerktouni', '', 20200, '212661355218', 'contact@lesachatsindustriels.com', '', 0, 0, '2009-06-03 00:00:35', 'FRS', 'Fournisseur', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(56, '46, Rue 13 lot opération lissasfa', '', 20380, '212661633443', 'imp.sabri@gmail.com', '', 0, 0, '2009-06-03 17:46:14', 'OMAR', 'SABRI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(58, 'lot12 zone industrielle bir rami kenitra', '', 14000, '212537369055', 'souad.aabiza@yazaki-europe.com', '', 0, 0, '2009-06-25 08:14:12', 'Souad', 'Aabiza', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(59, '281 LOT LINA SIDI MAAROUF', '', 21000, '0522974749', 'm.laraki@sigmatel.ma', '', 0, 0, '2009-06-25 17:19:22', 'MERIEM', 'LARAKI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(60, 'BP 89 & 101 - Route Cotière - Mohammedia', '', 0, '212523319407', 'n.bennani@samir.ma', '', 0, 0, '2009-06-29 15:46:29', 'Nizar', 'BENNANI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(64, 'ZA du Pardy', '', 1480, '00336709361032', 'o.kmb@eurodock.com', '', 0, 0, '2009-07-01 13:00:34', 'olivier', 'kollmannsberger', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(66, 'zone industrielle settat BP 563', '', 26000, '0523404442', 'jalilajaziri@gmail.com', '', 0, 0, '2009-07-01 15:38:17', 'jalila', 'jaziri', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(67, '147 Apprt 9 Quartier Annasim Sidi Maarouf ', 'Residence Al khalil Appart C6 Quartier Alaimoun ', 2, '00212674720007', 'abdellatif.abid@gmail.com', '', 0, 0, '2009-07-02 11:02:39', 'Abdellatif', 'Abid ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(68, 'Mâarif', '', 20000, '0669778016', 'harbaz1@yahoo.fr', '', 0, 0, '2009-07-02 15:19:58', 'Ahmed', 'HARBAZ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(70, 'Zone Industrielle Ouled Saleh', 'Espace porte d\'Anfa Imm C', 20000, '0522363926', 'afaf.capital@menara.ma', '', 0, 0, '2009-07-06 15:14:55', 'Afaf', 'KSIMI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(72, '91 zone industrielle municipalle ', '', 14100, '0661216032', 'arrhala_choukri@menara.ma', '', 0, 0, '2009-07-06 18:28:12', 'mostafa', 'choukri', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(73, '123 RUE ARCACHON', '123 RUE DES ALLIES', 20100, '0522252055', 'hamidou2005@hotmail.com', '', 0, 0, '2009-07-06 22:47:53', 'Mohamed', 'MOHAMED', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(74, '123 RUE ARCACHON', '123 RUE DES ALLIES', 20100, '0522252055', 'hamidou2005@hotmail.fr', '', 0, 0, '2009-07-06 22:49:53', 'Mohamed', 'MOHAMED', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(75, '958-960, BD EL FIDA', 'HAY CHIFFA 1 (PROLONGE)', 20540, '0661321006', 'europneus_sl@msn.com', '', 0, 0, '2009-07-07 09:56:37', 'Samir', 'LAKHDIM', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(76, 'HAY EL FARAH', 'RUE 89 N° 40', 20550, '0661324297', 'noureddine_benabderrazak@msn.com', '', 0, 0, '2009-07-07 10:05:52', 'Noureddine', 'BENABDERRAZAK', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(77, 'rue fatima zohra', '', 20650, '052319032', 'abdelhadi.adil@nexans.co.ma', '', 0, 0, '2009-07-08 15:18:21', 'abdelhadi', 'adil', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(78, 'ILOT101, TFZ', '', 90000, '0021239399044', 'soumaya.khayi@yazaki-europe.com', '', 0, 0, '2009-07-09 08:53:16', 'KHAYI', 'SOUMAYA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(79, 'Rue Emir abdelkader en face de Centrale Laitière-Casa-voyageur Casablanca', '', 20000, '0661044090', 'a.damoun@carre.ma', '', 0, 0, '2009-07-10 15:34:56', 'Abdellah', 'Damou', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(80, '3 rue jules guesdes', '', 91, '0033160911156', 'reda.elhamoudy@fivesgroup.com', '', 0, 0, '2009-07-10 18:17:27', 'Réd', 'El Hamoudy', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(81, 'Residence Ezzohour, Bloc G, Appt 108, Ainsebaa', '', 20250, '0661318698', 'benamerabdelkrim@yahoo.fr', '', 0, 0, '2009-07-12 02:34:30', 'Abdelkrim', 'BENAMER', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(82, 'Immeuble 95, rue Azilal étage n° 4', '', 20110, '0522444484', 'sunshipping.ma@gmail.com', '', 0, 0, '2009-07-13 09:57:59', 'Abdellah', 'Moustaquim', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(83, 'twin center, tour B, 3 eme etage', '', 20000, '0522777862', 'sderdek@centralelaitiere.com', '', 0, 0, '2009-07-13 14:59:35', 'Samed Ennour', 'Derdek', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(84, '43,Bd My Slimane ', '', 20290, '0522401216', 'Sadqui@trarem.ma', '', 0, 0, '2009-07-13 18:00:34', 'Brahim', 'Ailane', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(86, 'Parc d’Activité Oukacha1, 2Bd Mly Slimane', '', 20580, '0646111103', 'a.faris@sjlmaroc.ma', '', 0, 0, '2009-07-14 16:54:59', 'abd el hamid', 'Faris', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(87, '55, avenue du 11 janvier - Quartier Dakhla', '', 80000, '00212668174355', 'dbinitiatives@menara.ma', '', 0, 0, '2009-07-16 09:44:59', 'Bernard', 'DESCHAMPS', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(88, '227 BD GHANDI ETAGE 2 APPT 4', 'MAARIF EXTENSION', 20000, '0522983499', 's.daouk@cddoc.fr', '', 0, 0, '2009-07-16 09:59:23', 'SOUAD', 'DAOUK', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(89, '9rue safi ', '', 16200, '0611670692', 'moustage1@yahoo.fr', '', 0, 0, '2009-07-16 21:23:43', 'med cherif', 'el johri', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(90, '154 Bd Bir Anzarane', '', 20100, '0664236524', 'aziz@benkiran.com', '', 0, 0, '2009-07-20 13:12:46', 'Aziz', 'MAOS', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(91, 'Guimarães', 'Fafe', 4610, '00351965263618', 'elsadeportugal@hotmail.com', '', 0, 0, '2009-07-27 13:19:00', 'Maria', 'Elsa', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(92, '42 RUE IMAM AL BOUKHARI', 'MAARIF', 20730, '0522992972', 'electroprotect@menara.ma', '', 0, 0, '2009-07-27 15:22:57', 'NABIL', 'LAHLOU', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(93, 'Résidence Bismillah Imm. B10, appt 14', 'Rue Al Bouziri - Mabella', 10180, '0661173607', 'zouhir@menara.ma', '', 0, 0, '2009-07-28 11:20:25', 'Zouhir', 'TOUZANI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(94, '92 BD MOUKAOUAMA', '', 20000, '00212661326740', 'charaf@stockpralim.ma', '', 0, 0, '2009-07-29 09:17:37', 'CHARAF', 'DAFER', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(95, '1083, Av. Al Massira, Amal 5, CYM', '', 10000, '0537799833', 'info@filamane.com', '', 0, 0, '2009-08-02 19:45:04', 'Karim', 'BOUCHAKOR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(96, 'Technopolis', '', 11100, '00212661269098', 'adaskouhanane@yahoo.fr', '', 0, 0, '2009-08-04 09:16:29', 'HANANE', 'ADASKOU', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(97, 'ZA les côteaux de la Mossig', '6, rue Frédéric Bartholdi', 67310, '0388042030', 'ckaetzel@expresso-france.com', '', 0, 0, '2009-08-06 07:18:32', 'Christian', 'KAETZEL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(98, '9, Lot El hamra, Rue 12 immeuble 22.', '', 20450, '212661266856', 'hbourijate@yahoo.fr', '', 0, 0, '2009-08-06 12:05:47', 'HAMID', 'BOURIJATE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(99, 'ZONE TECHNOPOLE AEROPORT MED V', 'NOUACEUR', 20400, '0665280616', 'b.lazrak@marotrans.ma', '', 0, 0, '2009-08-08 22:39:55', 'BOUCHAIB', 'LAZRAK', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(100, 'bld  abdelmoumen', '', 20100, '0676419935', 'france-technics@laposte.net', '', 0, 0, '2009-08-10 10:20:25', 'philippe', 'pouyfaucon', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(101, '03 impasse Jules Gros Oasis', '', 20500, '00212661258467', 'institution.balzac@gmail.com', '', 0, 0, '2009-08-10 11:38:01', 'Réda', 'AMor', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(102, 'km 18,Rte Eljadida,km6 Rte Laassilate Gare-Berrchid', '2,Boulevard Zerktouni-Casablanca', 20, '0661878674', 'h.gatri@carven.ma', '', 0, 0, '2009-08-11 08:14:46', 'Houcine', 'Gatri', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(103, 'Immeuble Horizon, Mandarona 300, Lot n°9, Sidi Maârouf', '', 21000, '00212661295975', 'tarik.zaghloul@dhl.com', '', 0, 0, '2009-08-11 11:33:56', 'tarik', 'zaghloul', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(104, '25 bis, rue jbel bouiblane, n°9,Agdal', '', 10000, '0537673767', 'neo.immobilier@gmail.com', '', 0, 0, '2009-08-11 15:58:27', 'J', 'SALIM', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(105, '7 jorf lihoudi BP 501 Safi', '', 46000, '0674049219', 'ismail.idrissi@gmail.com', '', 0, 0, '2009-08-13 08:33:49', 'ismail', 'idrissi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(106, 'misonne avenue,29', '', 6000, '0032477315169', 'jucami@brutele.be', '', 0, 0, '2009-08-13 10:20:39', 'Michel', 'Gerard', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(107, '207, Bd Zerktouni', '', 20100, '0642061914', 'vandesko@gmail.com', '', 0, 0, '2009-08-13 10:44:28', 'Stefan', 'Vandecasteele', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(108, 'Ag avenue abdelkarim khattabi et yacoub el mansour', '', 40400, '00212661588178', 'iqbalbenjelloun@hotmail.com', '', 0, 0, '2009-08-13 16:14:55', 'MOHAMED IQBAL', 'BENJELLOUN', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(109, '100,bd med 6,rue 320', 'hay mly abdellah', 20150, '0669770616', 'hadanitoo@gmail.com', '', 0, 0, '2009-08-13 23:57:57', 'mohamed', 'hadani', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(110, 'Oued dahab,31 appart 11', '', 90000, '0032479637242', 'y.netproprete@hotmail.com', '', 0, 0, '2009-08-14 14:44:18', 'MOHAMED', 'YASSINI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(111, 'Mohamedia principal BP 174 ', '', 20800, '0661065982', 'abdesslemb@hotmail.com', '', 0, 0, '2009-08-14 17:06:49', 'abdesslem', 'Bouasria', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(112, 'bd mohamed 5 casablanca', '', 20000, '0527814446', 'alami_joe@live.fr', '', 0, 0, '2009-08-14 19:39:07', 'youssef', 'cherif alami', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(113, '13, rue Tanger - Atlas', '', 30000, '0665 300 867', 'hichamih@yourpc.ma', '', 0, 0, '2009-08-14 19:39:24', 'Hicham', 'Iraqi Houssaini', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(114, '42 rue des FAR', '', 20000, '0661052050', 'a.khartit@petrom.ma', '', 0, 0, '2009-08-15 00:14:53', 'anas', 'khartit', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(115, '3 Rue de Rethel', '', 20100, '0677896835', 'rachid@convergence-tele.com', '', 0, 0, '2009-08-15 01:02:58', 'Rachid', 'Harrando', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(116, '12rue bouselham ', '12 rue sidi daoui', 24000, '0665211117', 'higmaint@hotmail.fr', '', 0, 0, '2009-08-15 09:57:06', 'soulaimane', 'noceir', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(117, 'Adresse Showroom , Casablanca: 235, Résidence Al-Anfale ( Bd Yacoub el Mansour).', 'Adresse Showroom ,Salé : Avenue Abdelkhalek Torres Sehb Elcaïd ', 16002, '+212661395206', 'majidaouad@hotmail.com', '', 0, 0, '2009-08-15 12:31:03', 'Abdelmajid', 'Aouad', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(118, 'n 134 hay el farh', '', 20810, '0021266372398', 'nounou_ever@hotmail.com', '', 0, 0, '2009-08-15 12:42:51', 'Noureddine', 'Loukili', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(120, '2, bd des Almohades', '', 20000, '0669153894', 'benhmidaj@hotmail.com', '', 0, 0, '2009-08-16 18:45:21', 'Jawad', 'Benhmida', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(121, 'BP 70898 CASACOMPLEXE MED V', '', 20008, '00212522405556', 'atladis@menara.ma', '', 0, 0, '2009-08-16 21:50:36', 'ABDERRAHIM', 'NOURY', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(122, 'CHAFCHAOUNI', '', 20000, '0522345315', 'R.ELKHALOUI@BIMO.MA', '', 0, 0, '2009-08-17 09:53:33', 'RACHID', 'ELKHELOUI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(123, 'aaraj@hotmail.fr', 'kelaaraj@bmcebank.co.ma', 20000, '0522498799', 'aaraj@hotmail.fr', '', 0, 0, '2009-08-17 10:30:31', 'Karim', 'EL AARAJ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(124, 'BP: 1630, Tanger principale', '', 90000, '0661706647', 'consultinglba@gmail.com', '', 0, 0, '2009-08-17 10:38:04', 'Yassine', 'LOUKILI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(125, 'omarsarghini@gmail.com', '', 20000, '0662384686', 'omarsarghini@gmail.com', '', 0, 0, '2009-08-17 11:08:42', 'Omar', 'SARGHINI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(126, '92 rue bacir al ibrahimi - la gironde', '', 20500, '0522304130', 'nasrallah.q@menara.ma', '', 0, 0, '2009-08-17 11:13:52', 'said', 'daoussi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(127, '20 boulevard Rachidi', '', 20000, '0661083396', 'guillaume.querol@minds.ma', '', 0, 0, '2009-08-18 08:30:33', 'Guillaume', 'QUEROL', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(128, 'parc industriel de bouskoura lot N° 43', '', 304, '0522592220', 'imane.taoussi@gmequipements.com', '', 0, 0, '2009-08-18 08:41:03', 'imane', 'taoussi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(129, 'Route 111 bd B quartier industriel Est ain sebaa', '', 25200, '0522343535', 'z.belakoul@stcr.ma', '', 0, 0, '2009-08-18 09:17:45', 'zakaria', 'BELAKOUL', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(132, '5 RUE EMIR ABDELKADER ', 'RUE RAPHAEL MARISCAL', 20300, '0522633730', 'souaad.loubane@premium.net.ma', '', 0, 0, '2009-08-19 16:18:35', 'SOUAAD', 'LOUBANE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(133, '1,Résidence Porte du golf, Lotissement WAFA', NULL, 28810, '0661343502', 'scortendg@gmail.com', '', 0, 0, '2009-08-19 17:20:21', 'SCORTEN', 'SCORTEN', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(134, '100,bd med 6,rue 320', 'hay mly abdellah-casablanca -maroc', 20150, '0669770616', 'mohamed.hadani@yahoo.fr', '', 0, 0, '2009-08-19 22:59:32', 'mohamed', 'hadani', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(135, '135 rue de l\'Epeule', '', 59100, '0320112763', 's.berten@laposte.net', '', 0, 0, '2009-08-20 01:15:46', 'Stéphane', 'Berten', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(136, 'Hi,i am from Guangzhou,China ', '', 510400, '13926031779', 'c8jm@yahoo.com.cn', '', 0, 0, '2009-08-20 02:12:23', 'chen', 'junmin', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(137, 'P.A Jean Zay, 3 rue Haroun Tazieff', 'en cours de création à Casablanca', 33150, '00212660618223', 'c.puech@baobag.eu', '', 0, 0, '2009-08-20 07:51:13', 'Christophe', 'Puech', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(138, 'créteil', '', 95000, '01421478596', 'high.loog@gmail.com', '', 0, 0, '2009-08-20 10:09:50', 'oprha', 'brahim', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(139, 'bd Alexandrie, Angle rue parthenow, résidence Lena 2 n° 13 bis ', '2 mars 20502', 20502, '0664374717', 'makdad@uc-maroc.ma', '', 0, 0, '2009-08-21 19:20:25', 'Zakaria', 'Makdad', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(140, '23 bp 1193 Abidjan 23 Cote d\'ivoire', '', 225, '0022506519633', 'titidekoua@hotmail.fr', '', 0, 0, '2009-08-22 09:13:17', 'kouassi faustin', 'koua ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(141, 'Lot 26, 27, nouvelle zone industrielle, Mohammedia', '', 21000, '0523313333', 'o.bzioui@lamanufacture.ma', '', 0, 0, '2009-08-23 11:21:04', 'Omar', 'BZIOUI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(142, '2 RUE HASSAN EL ACHAARI BD ANFA', NULL, 20000, '0661787507', 'rismymohamed@gmail.com', '', 0, 0, '2009-08-23 14:10:23', 'MOHAMED', 'RISMY ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(143, 'KM 0.500 ROUTE D\'AGADIR ', '', 40000, '0524499900', 'S.ACHATS@GROUPE-MENARA.COM', '', 0, 0, '2009-08-24 09:44:19', 'WIDAD', 'ER-RAFAY', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(144, 'KM0.500 ROUTE D\'AGADIR', '', 40005, '0524499915', 's.nanou@menara-prefa.com', '', 0, 0, '2009-08-24 13:41:33', 'NANOU', 'SOUAD', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(145, 'km 0.500 route d\'Agadir', '', 40000, '0524499900', 'f.essalmy@menara-transport.com', '', 0, 0, '2009-08-25 08:59:38', 'Fatiha', 'ES-SALMY', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(146, 'Bd Anfa Rue Ibnou Yaala n°13 Imm 11', '', 20100, '0522944411', 'ab.industrie@gmail.com', '', 0, 0, '2009-08-25 12:08:36', 'NAWAL', 'NEHROU', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(147, 'Sidi Maârouf', '', 20000, '06 65 55 17 29', 'karima.eddib@meditel.ma', '', 0, 0, '2009-08-25 15:47:43', 'karima', 'eddib', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(148, '32 bis, rue Ouled Fref - Birkacem', '5, rue Dayet Erroumi - Agdal', 10000, '0675433433', 'herve.tible@mtds.com', '', 0, 0, '2009-08-25 18:15:49', 'Hervé', 'TIBLE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(149, '110 124 boulevard moulay slimane ain sebaa casa ', '', 20000, '0661912561', 'soufiane.akarramou@gmail.com', '', 0, 0, '2009-08-26 10:59:42', 'soufiane', 'akarramou', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(150, 'TWIN CENTER TOUR A 18EME ETAGE', '', 20650, '0021222954100', 'A.BOUKHRISS@SONASID.MA', '', 0, 0, '2009-08-26 11:44:52', 'AMAL', 'BOUKHRISS', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(151, 'ZONE INDUSTRIELLE B.P 532', '', 80150, '212528247300', 'tebelec@menara.ma', '', 0, 0, '2009-08-26 13:17:41', 'MOHAMED', 'BOURICH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(152, '77, Q.I Sidi Ghanem', '', 43000, '0524356588', 'lboulaich@triatlasmotors.com', '', 0, 0, '2009-08-27 12:50:03', 'Leila', 'BOULAICH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(153, '47, Rue Allal Ben Abdellah, 7ème Etage Bureau 45', '', 20000, '+ 212 522 43 06 81', 'ABDELAADIMK@CMS.MA', '', 0, 0, '2009-08-27 14:51:31', 'ABDELAADIM', 'KHOUILI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(154, 'KM 11? ROUTE 111 SIDI BARNOUSSI', '', 20100, '0021261351856', 'athayfi@cfao.com', '', 0, 0, '2009-08-27 15:15:37', 'Abderrahman', 'THAYFI ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(155, '320 BD, ZERKTOUNI', '', 20000, '0522297249', 'bensaz@yahoo.fr', '', 0, 0, '2009-08-28 13:53:53', 'Aziz', 'Benslimane', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(156, '21, bd. ibrahim erroudani', '', 20000, '0000000000', 'clairedubois90@yahoo.fr', '', 0, 0, '2009-08-28 14:23:49', 'dubois', 'claire', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(157, 'Aboubaker seddik, Guéliz', 'Route de Safi, Q.I 3 N° 5 Sidi Ghanem', 40000, '0661163565', 'universengins2@menara.ma', '', 0, 0, '2009-08-28 16:01:19', 'MOHAMED', 'EL METIOUI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(158, 'Lot N°1, ZI Sud Ouest ', '', 20, '0663428925', 'bouyaacoub@menara.ma', '', 0, 0, '2009-08-28 21:51:49', 'Nourdine', 'BOUYAKOUB', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(159, '38 fouques', '', 85610, '0674792901', 's.damart@orange.fr', '', 0, 0, '2009-08-29 15:05:46', 'SYLVAIN', 'DAMART', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(160, 'route coutiere casablanca-mohamemdia  ain sebaa', '', 20564, '00212661846782', 'ynna.aswakassalam.holding@gmail.com', '', 0, 0, '2009-08-31 10:03:49', 'FOUAD', 'KHADIR', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(161, '17. rue ishak ibnou hanine', '', 20000, '2125987175', 'logipro@menara.ma', '', 0, 0, '2009-08-31 10:58:09', 'nasreddine', 'yahyaoui', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(162, 'ZI SAPINO', '', 20500, '0522536310', 'l.chabab@oge-maroc.com', '', 0, 0, '2009-08-31 11:19:38', 'LAILA', 'CHABAB', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(163, '33, Q I Azli', '', 40000, '+212(0)660154301', 'k.hajjaj@2lm-maroc.com', '', 0, 0, '2009-08-31 13:32:16', 'Khalid', 'HAJJAJ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(164, '1 RUE NUNGESSER', '', 59121, '0327434500', 'minouche.demory@rottendorf.fr', '', 0, 0, '2009-08-31 13:34:47', 'Minouche', 'DEMORY', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(165, 'VIA BERNEZZO 47', '', 12023, '00390171618631', 'gbrugna@plastimark.com', '', 0, 0, '2009-09-01 10:03:18', 'brugna', 'giulia', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(166, 'Sidi Maarouf ', '', 20000, '0674401281', 'y.sabir1@gmail.com', '', 0, 0, '2009-09-01 14:17:55', 'Yassine', 'SABIR', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(167, '2a route d\'Eseblon appt 43 L9706 ', '', 0, '0033561517257', 'a.jbari@ev-orient.com', '', 0, 0, '2009-09-01 16:21:47', 'Abdelilah', 'JBARI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(168, 'RUE YOUGOSELAVIE GUELIZ MARRAKECH', '', 40000, '0661949637', 'elidrissi_formation@yahoo.fr', '', 0, 0, '2009-09-01 17:11:08', 'ESSAID', 'EL IDRISSI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(169, '2, Rue Abdelouhab Azzakkak', 'Roches Noires', 20310, '0522307664', 'marimo687@yahoo.fr', '', 0, 0, '2009-09-01 17:58:10', 'Nizar', 'Benslimane', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(170, 'BP 2311', 'Guéliz', 40000, '0670222411', 'ateliergraindesel@yahoo.fr', '', 0, 0, '2009-09-02 18:21:15', 'Valérie', 'VERCRUYSSE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(171, '176 AVENUE CHARLES DE GAULLE', '', 92200, '0616803821', 'jonathan@trader-partner.com', '', 0, 0, '2009-09-03 09:37:27', 'JONATHAN', 'CURIEL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(172, 'Bd biranzaran, residence la paix, 1er etage ', '', 20000, '0661050715', 'm.deco@homevent.ma', '', 0, 0, '2009-09-03 14:49:14', 'MEHDI', 'TAHRI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(173, 'Bd biranzaran, residence la paix, 1er etage ', '', 20000, '0661050715', 'm.com@homevent.ma', '', 0, 0, '2009-09-03 15:09:03', 'MEHDI', 'TAHRI ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(174, 'bd hassan II', NULL, 28800, '0649017957', 'contact@agconsulting.ma', '', 0, 0, '2009-09-03 15:53:00', 'Fleur', 'AIME', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(177, '10,Bd.de Boured', '', 20300, '0661857794', 'm.a.clay2@gmail.com', '', 0, 0, '2009-09-07 10:05:20', 'Mohammed Ali', 'HCINE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(178, '139 RUE DES ARTS ', '', 59000, '0320288602', 'jnombo@ssl247.fr', '', 0, 0, '2009-09-07 12:00:22', 'jocy', 'Nombo', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(179, '0.5 ROUTE AGADIR.', '', 40008, '06 65 87 00 93', 'r.kharbouch@menara-prefa.com', '', 0, 0, '2009-09-08 14:58:01', 'Rachid', 'KHARBOUCH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(180, '197 AV DES FAR', '', 20000, '0522464901', 'douami@sopriam-ona.com', '', 0, 0, '2009-09-08 15:07:46', 'mohamed', 'DOUAMI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(181, '36 Lot Alwahda', '', 71000, '0610111215', 'support@maromania.com', '', 0, 0, '2009-09-14 21:28:36', 'Achraf', 'Baznani', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(182, '8, Rue Dayt Roumi ', '', 10119, '0670999940', 'ramch.kawtar@gmail.com', '', 0, 0, '2009-09-16 12:39:02', 'Kawtar', 'RAMCH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(183, 'Route Zenata, ain sbaa', '', 20000, '0610932090', 'a.barahim@yahoo.fr', '', 0, 0, '2009-09-18 10:00:44', 'Asmaâ', 'BARAHIM', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(184, 'Rabat', '', 11000, '0663359078', 'asbusiness08@gmail.com', '', 0, 0, '2009-09-22 12:12:36', 'hicham', 'EL MAAROUFI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(185, 'ZONE INDUSTRIELLE ROUTE DE TETOUAN BP 324', '', 90000, '0021239329950', 'm.oulkadi@aluminiumdumaroc.com', '', 0, 0, '2009-09-23 12:42:41', 'MANAL', 'OULKADI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(186, 'TWIN CENTER 18ème étage ', 'Angle Bd Massira et Bd Zerktouni', 20000, '00212529060129', 'a.salbi@sonasid.ma', '', 0, 0, '2009-09-23 16:43:37', 'ANASS', 'SALBI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(188, '179 Rue Omar Riffi', '', 20500, '0522444038', 'qualitas@qualitas.ma', '', 0, 0, '2009-09-25 14:38:37', 'Khadija', 'HOUSSAM', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(189, 'kh', '', 23456, '234567', 'HAMA@LESACHATSINDUSTRIELS.COM', '', 0, 0, '2009-09-25 20:48:19', 'HAMA', 'HAMA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(190, 'Bd med J. EDOURA, Im. A/BR2, Beausite, AIN SEBAA ', '', 20400, '0661463223', 'capgibraltar@menara.ma', '', 0, 0, '2009-09-25 21:06:26', 'Driss', 'AADNAN', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(191, '44 avenue des plans', '', 6700, '0661749613', 'veronique.eychenne@wanadoo.fr', '', 0, 0, '2009-09-26 18:27:09', 'bernard', 'peyretti', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(192, '59,Bd Emile Zola', NULL, 20310, '0661050569', 'contact@appro-tech.com', '', 0, 0, '2009-09-28 07:55:03', 'MED', 'RGUITI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(193, '2 rue Brahim bnou adham maarif', '', 20000, '0522982593', 'CONSOCENTER@MENARA.MA', '', 0, 0, '2009-09-28 17:24:52', 'mohammed', 'BENJELLOUN', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(194, '2 rue Brahim bnou adham maarif', '', 20000, '0522982593', 'CONTACT-CONSOCENTER@MENARA.MA', '', 0, 0, '2009-09-29 10:04:22', 'mohammed', 'BENJELLOUN', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(195, 'BD? EL KHALIL  RUE 62 N° 4 HAY MY ABDELLAH AIN CHOK ', '', 20150, '0664071499', 'd.intervaria@hotmail.fr', '', 0, 0, '2009-09-30 12:03:38', 'DRISS', 'IDRISSI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(196, '19 RUE MY RACHID APPT 10 HASSAN', '', 10000, '0666987522', 'abdallah.aggad@gmail.com', '', 0, 0, '2009-09-30 16:42:00', 'aggad', 'abdallah', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(197, 'Pol. Ind. Ctra. La Isla C/ Mosaico n°20', '', 41703, '0034660476757', 'export@estindel.com', '', 0, 0, '2009-09-30 17:42:09', 'NOAMAN', 'MALIK', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(198, 'B175, Lot zone villa Nouasseur', '', 20370, '212661479331', 'tecnymaroc@yahoo.fr', '', 0, 0, '2009-10-02 19:34:51', 'BENAISSA', 'QOBAA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(199, 'RUE ABOU BAKER ESSADIK', '', 40000, '0662356390', 'SUDTRANSMISSION03@HOTMAIL.FR', '', 0, 0, '2009-10-03 10:06:10', 'SOUFIANE', 'BOUDYA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(200, 'Bajzova 20 - Haniska', '', 80, '+33607492815', 'cadeo@cadeo.eu', '', 0, 0, '2009-10-04 16:14:03', 'Alain', 'PITHOIS', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(202, 'KM 11;ROUTE DE RABAT', '', 20000, '0661053464', 'b.kench@maroc-bureau.com', '', 0, 0, '2009-10-05 14:35:43', 'bouazza', 'kanche', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(203, '52, Rue Al fourate Quartier Mâarif', '', 20373, '0661495958', 'metallog@menara.ma', '', 0, 0, '2009-10-05 18:14:40', 'Mohamed', 'EL KELLALI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(204, '5, rue de l\'ocean roches noires ', '', 20290, '0522404202', 'contact@installator.com', '', 0, 0, '2009-10-08 14:28:40', 'navarro', 'richard', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(205, '1ER ETAGE HAY QODS LOT BATL BD FOUARAT SIDI BERNOUSSI  N° 24', NULL, 20, '0522765052', 'sirk_sa@gmail.com', '', 0, 0, '2009-10-08 16:04:00', 'SAIDA', 'SALHI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(206, 'cresta del gallo 5', '', 30151, '0034679968321', 'admjuver@gmail.com', '', 0, 0, '2009-10-10 07:37:56', 'A. Manuel', 'padilla', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(207, '110 Route de zenata Km 10 Ain sebaa ', '', 20250, '0522345072', 'abdelhak.aouni@unilever.com', '', 0, 0, '2009-10-12 11:58:11', 'Abdelhak', 'Aouni', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(208, 'TECHNOPARK CASABLANCA', '', 20000, '0648311537', 'INFO@SEMACONSEIL.COM', '', 0, 0, '2009-10-17 06:37:54', 'RACHID', 'ECHOUAH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(209, '74 AVENUE MARECHAL HAIG', '', 78000, '0633330184', 'rachid.ourkhou.sqy@hotmail.fr', '', 0, 0, '2009-10-19 10:04:13', 'Rachid', 'OURKHOU', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(210, '2 RUE PAUL CEZANNE', '', 93360, '0149443500', 'chtibeber@msn.com', '', 0, 0, '2009-10-19 10:34:15', 'GROUP', 'KLB', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(211, '174, route des ouled ziane', '', 20190, '0522859346', 'r.ghourry@aiguebelle.ma', '', 0, 0, '2009-10-20 10:09:59', 'RACHIDA', 'GHOURRY', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(212, 'Oukacha', '', 20000, '0661817033', 'imad.dridi@geodis.com', '', 0, 0, '2009-10-20 16:48:26', 'imad', 'dridi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(213, 'Bd Moulay Slimane - Parc Oukacha', '', 20000, '0661857559', 'edern.lalanne@geodis.com', '', 0, 0, '2009-10-20 17:21:04', 'Edern', 'Lalanne', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(214, 'bd massira-casablanca', '', 20000, '0669588582', 'r.hatim@akwagroup.com', '', 0, 0, '2009-10-21 10:21:13', 'HATIM', 'RAJAA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(215, '293, bd abdelmoumen', '', 20000, '00212522865832', 'inegma@menara.ma', '', 0, 0, '2009-10-21 15:45:56', 'Houda', 'Benkaddour', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(217, 'N°69 rue 8 Ksar Labhar 2  CD', '', 20150, '0675388854', 'maroquip@gmail.com', '', 0, 0, '2009-10-22 12:19:38', 'SAID', 'BENTAHER', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(218, '3 Rue Calavon, Angle Bd Adbelmoumen', '', 20000, '0661325805', 'metallicdesign@menara.ma', '', 0, 0, '2009-10-22 14:42:25', 'ABDELALI', 'BELGARCH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(219, '44 bd Said Abou Jomaa My Rachid 1', '', 72000, '0522710260', 'cofremi@menara.ma', '', 0, 0, '2009-10-22 15:11:24', 'said', 'Chbaly', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(220, '10 Angle bd emile zola et rue planquette belvedere ', '', 20300, '0664900699', 'sotransesarl@menara.ma', '', 0, 0, '2009-10-22 15:16:26', 'Adnane', 'AICHFAKIR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(221, 'lot sycab résidence riad apt 4 imm1 rdc zoubeir', 'lot sycab résidence riad apt 4 imm 1 rdc zoubeir casa', 20190, '0668046613', 'b2aproservices@gmail.com', '', 0, 0, '2009-10-27 23:05:04', 'abdesslam', 'boukentar', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(223, 'Siege Bloc 18 N°63 Av Nile Sidi OTHMANE', NULL, 20700, '0661298827', 'fcindustriel@gmail.com', '', 0, 0, '2009-10-28 16:11:28', 'rachid', 'HAMAL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(224, '7, RUE ALKAMIT ALASSADI, BELVEDERE', '', 20300, '0661248841', 'f.elkohen@elexpert.ma', '', 0, 0, '2009-10-28 19:29:33', 'FOUAD', 'ELKOHEN', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(225, '28 zi sd ouest 28810', '', 28810, '0523314020', 's.chakraoui@amp-ge.ma', '', 0, 0, '2009-10-29 12:26:25', 'chakraoui', 'samir', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(226, 'NILUFER ORGANIZE SANAYI BOLGESI', '315. SOKAK NO 1', 16140, '00902244111100-146', 'sercan@akdemirmetal.com', '', 0, 0, '2009-10-30 14:31:56', 'SERCAN', 'ALABAY', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(227, '88 rabat maroc', '', 50000, '0655 55 55 55', 'omarb@hotmail.com', '', 0, 0, '2009-11-01 14:35:41', 'omar', 'benomar ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(228, '109, rue Montaigne, Val Fleuri ,Maârif', '', 20000, '0661458715', 'yhabiballah@gmail.com', '', 0, 0, '2009-11-02 17:26:17', 'Youssef', 'HABIBALLAH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(229, '57, BD grand ceinture Saada2 Rue30 H.M ', NULL, 20350, '0522638143', 'fastindustrie@gmail.com', '', 0, 0, '2009-11-02 21:45:07', 'Jamal', 'ELGHRIB', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(230, '57, BD grand ceinture Saada2 Rue30 H.M ', '', 20350, '0522638143', 'jamal.elghrib@gmail.com', '', 0, 0, '2009-11-02 21:53:33', 'Jamal', 'ELGHRIB', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(231, '129, Bd Ibn Tachefine', '', 20000, '0660618731', 'sanaa.africroulement@gmail.com', '', 0, 0, '2009-11-03 11:04:26', 'SANAA', 'CHIKHAOUI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(232, '2 Rue barcilana bani makada', '', 90000, '0661842585', 'orsasarl@hotmail.com', '', 0, 0, '2009-11-03 11:24:16', 'temsamani', 'mohammed', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(233, '469.Z.I Ennasim ', '', 20100, '00212522932814', 'fch@cartonnagesdurif.com', '', 0, 0, '2009-11-03 16:35:25', 'faycal', 'chbarte', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(234, '92 RUE CAID ACHTAR MAARIF ', '', 20000, '0021260400102', 'chakhilti@yahoo.fr', '', 0, 0, '2009-11-04 11:21:36', 'NOUREDDINE', 'CHAKROUN', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(235, '24 BD Emile Zola ', '', 20300, '0660213599', 'najib.zahour@odimatic.net', '', 0, 0, '2009-11-05 09:03:17', 'Najib ', 'ZAHOUR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(236, 'hay salamrye iben hamdoun ben hadj n°72b', '', 90000, '0661306846', 'nabil_bettah@hotmail.com', '', 0, 0, '2009-11-05 17:03:44', 'BETTAH', 'nabiL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(237, 'PARC OUKACHA ', '', 21000, '0522669977', 'boutaina.belhakim@geodis-logistics.ma', '', 0, 0, '2009-11-11 15:10:07', 'BOUTAINA', 'BELHAKIM', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(238, 'RUE 10 482 LOT HAJ FATEH EL OULFA', '', 20026, '00212661400572', 'mhamanis@gmail.com', '', 0, 0, '2009-11-13 00:48:38', 'MHAMED', 'AMANIS', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(239, 'Immeuble Casablanca Business Center', 'Lot 2 - Lotissement mandarouna - sidi maarouf', 20000, '0522789030', 'nicolas.belleteste@ecs-group.com', '', 0, 0, '2009-11-16 11:21:31', 'Nicolas', 'BELLETESTE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(240, '5,rue jallal eddine essayouti', '', 20100, '0522369900', 'commercial@groupepacini.com', '', 0, 0, '2009-11-16 12:02:22', 'nadia', 'karame', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(241, 'BD. ABDELLATIF BEN KADDOUR', 'IMPASSE RIF', 20050, '0522393956', 'pc-computer@menara.ma', '', 0, 0, '2009-11-16 16:55:48', 'MOUJIB', 'EL MERNISSI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(242, 'CASA BLANCA ', '', 21000, '0522669977', 'boutaina.belhakim@geodis.com', '', 0, 0, '2009-11-23 10:23:58', 'BOUTAINA', 'BELHAKIM', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(243, 'TECHNOPARK', 'ROUTE DE NOUACER', 20150, '0670330686', 'contact@microstore.ma', '', 0, 0, '2009-11-24 15:27:11', 'FAOUZI', 'MAGHILI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(244, '150, monica', '', 20800, '0661155154', 'laurent.majerus@ccelog.com', '', 0, 0, '2009-11-24 19:06:11', 'laurent', 'majerus', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(245, '15 rue lahcen basri Appt 17', '', 20040, '0642050347', 'drissherrati@gmail.com', '', 0, 0, '2009-11-26 14:38:29', 'DRISS', 'HERRATI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(246, '15 rue lahcen basri Appt 17', '', 20, '0642050347', 'herrati@avenirformation.ma', '', 0, 0, '2009-11-26 14:43:57', 'DRISS', 'HERRATI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(247, 'Zone Franche Tanger', '', 90000, '0606060606', 'ittofleury@hotmail.fr', '', 0, 0, '2009-12-01 14:57:08', 'Nono', 'Nono', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(248, 'Lot 82, Parc Industriel Bouskoura', '', 27182, '00212522592053', 'contact@excelsa-maroc.com', '', 0, 0, '2009-12-01 17:16:07', 'Noureddine', 'SAMI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(249, 'Lot 82, Parc Industriel Bouskoura', '', 2, '00212522592053', 'excelsa-1@menara.ma', '', 0, 0, '2009-12-01 17:18:59', 'Noureddine', 'SAMI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(250, 'ANGLE BD MOULAY SLIMANE ET RUE CASCADE OUZOUDE', 'QI OUKACHA', 20250, '0522353349', 't.elouahidi@menara.ma', '', 0, 0, '2009-12-01 18:55:27', 'thami', 'elouahidi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(251, 'N° 47, Avenue Med V - Guéliz', '', 40000, '05 24 45 84 08', 'achats@marrakechgrandprix.com', '', 0, 0, '2009-12-02 10:53:18', 'NAJOUA', 'DRIBINE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(252, '491, Essâada, El alia', NULL, 20650, '0661116047', 'masifepro@gmail.com', '', 0, 0, '2009-12-03 18:49:10', 'Mounir', 'DAIF', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(253, '143  zone industrielle Sud Ouest', '', 22800, '0661217970', 'nka@menara.ma', '', 0, 0, '2009-12-04 08:26:27', 'Abdelmajid', 'Skim', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(254, '207, Bd Zerktouni', '', 20100, '0618531704', 's.vdc@optim-achat.com', '', 0, 0, '2009-12-04 09:28:25', 'Stefan', 'Vandecasteele', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(255, '27,BD ABELLAH BNOU YASSINE', 'BUREAU N°30 2EME ETAGE', 20310, '212522313167', 'froxyagencement@gmail.com', '', 0, 0, '2009-12-04 09:36:47', 'MOUHSSINE', 'BERRADA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(256, '207 bvd Zerktouni', NULL, 20000, '0618531706', 'a.mazoyer@optim-achat.com', '', 0, 0, '2009-12-04 09:41:02', 'Alain', 'Mazoyer', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(258, 'IMM 6 ET 7 LOT MORVAN SALE TABRIQUET', '', 11000, '0661179066', 'globalaccess@menara.ma', '', 0, 0, '2009-12-04 20:19:06', 'Chafiq', 'EL MERNISSI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(259, 'ALLEE DES ORCHIDEES AIN SEBAA CASA', '', 21600, '0522667800', 'latifa.mouri@prodec.ma', '', 0, 0, '2009-12-07 14:52:21', 'LATIFA ', 'MOURI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(260, 'Z.I ', 'nrjmecanique@gmail.com', 24000, '06 61 17 07 32', 'wihamid@gmail.com', '', 0, 0, '2009-12-10 14:21:57', 'hamid', 'mahmoudi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(261, '02BP1605 GBEGAMEY', 'C/626', 229, '22996302261', 'saiemsarl72@yahoo.fr', '', 0, 0, '2009-12-10 14:44:26', 'AZIZ', 'SANI  ASSOUMA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(262, '31, rue de Sebta', 'Quartier des Hôpitaux', 20100, '0661448411', 'younes.aldis@gmail.com', '', 0, 0, '2009-12-11 10:37:01', 'younes', 'Mellouk', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(263, '26 Bd de la Résista,ce', '2e ét.', 20000, '05224327778', 'ismediah@yahoo.fr', '', 0, 0, '2009-12-12 14:12:12', 'Lahcen', 'Asbayo', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(264, 'Z.I Ouled Saleh G5 N°13', '', 20180, '212522859900', 'h.benabdallah@galenica.ma', '', 0, 0, '2009-12-14 10:31:03', 'Hicham', 'Benabdellah', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(265, 'Route de ziatene.BOX:1238.Tanger90000.Maroc', NULL, 90000, '00212667226854', 'ibccabinet@yahoo.fr', '', 0, 0, '2009-12-14 20:16:47', 'Mohammed', 'younous', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(266, 'Route de ziatene.BOX:1238.Tanger90000.Maroc', '', 90000, '00212667226854', 'ibccabinet@hotmail.com', '', 0, 0, '2009-12-14 20:52:07', 'Mohammed', 'younous', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(267, '5 Qrue de la pie oasis', '', 20410, '0661226255', 'khadra@3smorocco.com', '', 0, 0, '2009-12-15 11:43:53', 'khadra', 'el antari', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(270, '164 BD AMBASSADEUR BEN AICHA 4 EME ETAGE N° 30 ROCHES NOIRES', '', 20303, '06 63 39 59 56', 'sorenmi@menara.ma', '', 0, 0, '2009-12-16 09:24:18', 'el mechkouri', 'fatima', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(271, 'ZI Ouled Saleh', '', 20000, '0640199452', 'mounir.bouazar@mfc.ma', '', 0, 0, '2009-12-17 09:15:54', 'Mounir', 'BOUAZAR', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(272, 'route de Nouacer', '', 20100, '212522507871', 'm.chelli@technopark.ma', '', 0, 0, '2009-12-17 14:33:50', 'marouane', 'chelli', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(273, '31, Bd Yacoub El Mansour Mâarif ', '', 21000, '0522252633', 'total_protection@menara.ma', '', 0, 0, '2009-12-17 15:53:36', 'Messaoud', 'Machaou', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(276, 'zi ahl loghlam m2p1 lot baidae 20550', '', 20550, '212660915977', 'almajd.protec@gmail.com', '', 0, 0, '2009-12-19 13:25:58', 'omar', 'achtouk', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(277, 'BP 89', '', 74156, '0624327269', 'cgenton@tefal.fr', '', 0, 0, '2009-12-21 23:51:34', 'Christian', 'GENTON', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(278, 'Technopark casablanca, route de nouacer, angle RS ', '114 et CT 1029 ', 20150, '0661727557', 'l.benmakhlouf@technopark.ma', '', 0, 0, '2009-12-22 09:31:54', 'LAMIAE', 'BENMAKHLOUF', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(279, 'BD MED V VAL ROSE A', '', 20400, '212663428925', 'Bourseaffaires@gmail.com', '', 0, 0, '2009-12-22 10:26:44', 'NOURDINE', 'BOUYAKOUB', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(280, '356 , TECHNOPARK , ROUTE DE NOUACER', '', 20153, '00212661319749', 'said.elbiyadi@global-it.ma', '', 0, 0, '2009-12-22 15:12:49', 'SAID', 'ELBIYADI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL);
INSERT INTO `user` (`id`, `adresse1`, `adresse2`, `codepostal`, `phone`, `email`, `password`, `del`, `isactif`, `created`, `first_name`, `last_name`, `username`, `discr`, `roles`, `password_change_date`, `parent1`, `confirmation_token`, `avatar_id`, `redirect`, `password_reset_date`, `forgot_token`) VALUES
(281, '5, AV DES FAR  7è ét', '', 20000, '0661196435', 'jaidi@smbs.ma', '', 0, 0, '2009-12-23 18:14:41', 'ABDOU', 'JAIDI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(282, 'LOT BATL HAY QODS BD FOUARAT N° 24 SIDI BERNOUSSI', '', 21600, '0640550140', 'wafigoodtec@gmail.com', '', 0, 0, '2009-12-25 11:21:18', 'SAIDA', 'SALHI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(283, '97 av de l\'europe', '', 84330, '0650696536', 'azizdaoudi@sfr.fr', '', 0, 0, '2009-12-27 00:23:15', 'aziz', 'daoudi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(284, '47, Rue Ait Ourir', '', 19000, '0522209721', 'equindus@menara.ma', '', 0, 0, '2009-12-28 11:33:47', 'DRISS', 'AMOR', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(285, '47, rue ait ourir', '', 19000, '0522209721', 'khadija.r@hotmail.fr', '', 0, 0, '2009-12-28 15:30:07', 'IDRISS', 'AMOR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(286, 'grand-rue 14', '', 1700, '0041765668998', 'morimport@hotmail.fr', '', 0, 0, '2009-12-29 07:37:12', 'Mourad', 'Ziyani', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(287, '66, Rue la gare Ain sebaa', '', 20100, '0672123818', 'audiovisuel.systeme@menara.ma', '', 0, 0, '2009-12-30 09:34:54', 'Siham', 'KHALDOUN', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(288, 'agdal rabat', '', 10100, '0658991131', 'rjconsulting@hotmail.fr', '', 0, 0, '2009-12-31 09:40:00', 'touria', 'STOTI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(289, 'lot ennakhil1 bloc 9 N° 222          S.Y.B.A ', NULL, 40050, '0674918260', 'bounaceur.mustapha@gmail.com', '', 0, 0, '2010-01-04 09:51:52', 'mustapha', 'bounaceur', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(290, '22 rue bouselham el jadida ', '', 24000, '0665211117', 'noceirs@hotmail.com', '', 0, 0, '2010-01-04 12:53:11', 'soulaimane', 'noceir', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(291, 'LOT26,ZONE INDUSTRIELLE BIRRAMI', '', 14000, '0613760379', 'ENATCOMSARL@GMAIL.COM', '', 0, 0, '2010-01-06 16:05:10', 'FATIHA', 'GRICH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(292, 'LOT26 ZI BIR RAMI', '', 14000, '0613760379', 'ENATCOMSARL@MENARA.MA', '', 0, 0, '2010-01-06 16:10:11', 'FATIHA', 'GRICH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(293, '4 RUE DES TABORS', '', 20000, '0610519676', 'o.haie@stroc.ma', '', 0, 0, '2010-01-08 09:50:34', 'OTHMANE', 'HAIE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(294, '621 Bd Panoramique 20150 Casablanca', '621 Bd Panoramique 20150 Casablanca', 20150, '0522859501', 'r.majidate@cimar.co.ma', '', 0, 0, '2010-01-11 14:25:31', 'Redouane', 'MAJIDATE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(295, 'KHALIL 2 RUE 2 N° 27 LAVILLETTE', '', 20300, '+212661495225', 'elevatek@gmail.com', '', 0, 0, '2010-01-13 16:16:41', 'MOSTAFA', 'AASSI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(296, 'RUE OUKAT BADIS AIN SEBAA', '', 22000, '0522402060', 'abkhalid1x@hotmail.com', '', 0, 0, '2010-01-15 14:54:38', 'KHALID', 'AIT BOUBKER', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(297, '4rue des tabours , oasis , casablanca', NULL, 20000, '0671275430', 'abdellatif_msammet@yahoo.fr', '', 0, 0, '2010-01-18 17:00:39', 'abdellatif', 'msammet', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(298, 'hay molay chrif', NULL, 20700, '0661174469', 'marry2000@hotmail.com', '', 0, 0, '2010-01-19 08:34:04', 'kamal', 'bouhyass', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(299, 'Agdal, Avenue OQBA', '', 33000, '0640261431', 'thiol20@hotmail.com', '', 0, 0, '2010-01-25 09:16:32', 'Thierno Amadou', 'DIALLO', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(300, 'Casablanca Technopark', '', 3300, '0640261431', 'tadmdck@yahoo.fr', '', 0, 0, '2010-01-25 09:37:34', 'Thierno Amadou', 'DIALLO', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(302, 'Route de Rabat RP1 Ain Sebaa', '', 20250, '0522669173', 'mehdi.bensghir@sanofi-aventis.com', '', 0, 0, '2010-01-27 10:17:12', 'Mehdi', 'Bensghir', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(303, '58 BLD ANOUAL APPART 5', '', 20000, '0619138700', 'ihsanebelgnaoui@gmail.com', '', 0, 0, '2010-01-27 11:00:41', 'IHSANE', 'BELGNAOUI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(304, 'RTE MEKKA', '', 20000, '0668247345', 'e.elmenyani@capep.ma', '', 0, 0, '2010-01-31 23:55:04', 'EL HASSAN', 'EL MENYANI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(305, 'KM 9 ROUTE DE MEDIOUNA HAY INARA ', '', 20000, '0675495626', 'b.elhajji@capep.ma', '', 0, 0, '2010-02-01 10:32:45', 'BRAHIM', 'EL HAJJI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(306, 'KM 10.5 ROUTE D\'ELJADIA LISSASFA', '', 20000, '0522651447', 'saberhasnaa@hotmail.fr', '', 0, 0, '2010-02-01 15:38:45', 'HASNAA', 'SABER', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(307, 'ZONE INDUSTRIELLE DU SAHEL BP:88 HAD SOUALEM', '', 26400, '0661 19 26 04', 'b.yezrour@gmail.com', '', 0, 0, '2010-02-04 17:11:04', 'BOUCHRA', 'YEZROUR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(308, '650 bd Mohammed V', '', 2199, '0664844449', 'communication@fenie-brossette.ma', '', 0, 0, '2010-02-05 12:10:41', 'Assiya', 'LAMQADDEM', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(309, '11,Rue ibnou yaala ifrani appt 23-quartier racine', '', 20100, '0533 944 411', 'abindus.nawal@gmail.com', '', 0, 0, '2010-02-08 11:51:44', 'NAWAL', 'NEHROU', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(310, 'Km 11 - Route cotiere 111 ', 'Casa Mohammedia', 22000, '0522677070', 'fouza69@hotmail.com', '', 0, 0, '2010-02-08 18:05:51', 'FOUAD', 'ZNAIDI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(311, 'Carrefour Ghandi et Abdelmoumen Angle route OASIS et rue Salins OASIS', '', 20103, '0661797666', 't.ouchari@technipower-maroc.com', '', 0, 0, '2010-02-09 15:12:15', 'TARIK', 'OUCHARI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(312, '62 rue du Nizerand ', '', 69400, '0474626569', 'agrigorian@genelec.tm.fr', '', 0, 0, '2010-02-11 11:38:26', 'Arthur', 'Grigorian', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(313, '25 rue du commerce ', '', 75015, '0033654776987', 'admin.mpt@gmail.com', '', 0, 0, '2010-02-12 21:45:15', 'alex', 'Andreani', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(314, '4 rue du Vallon', '', 91940, '0680258422', 'p.beaucamp@pharm-alliance.com', '', 0, 0, '2010-02-15 09:28:18', 'Pascal', 'BEAUCAMP', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(315, 'Route de Biougra ZI BP 81', 'AIT MELLOUL', 80150, '0528 24 10 50', 'jlm@iam.net.ma', '', 0, 0, '2010-02-15 10:19:20', 'Christophe', 'DA COSTA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(316, 'ZI Bouskoura. BP 402 ', '', 20300, '0660213599', 'najib.zahour@tcmaroc.com', '', 0, 0, '2010-02-15 17:11:27', 'Najib ', 'ZAHOUR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(317, 'LOT JAWHARA RUE 1 N° 35', '', 20630, '0661324113', 'LAWAZIME@MENARA.MA', '', 0, 0, '2010-02-23 16:53:40', 'ABDERRAHIM', 'CHAMKHA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(318, '174, Route Ouled Ziane.', '', 20000, '212522803983', 'i.faiz@aiguebelle.ma', '', 0, 0, '2010-02-23 17:43:18', 'Izza', 'FAIZ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(319, 'Bd Chefchaouni, Km 11,5 QI ain sebaa', '', 20595, '0679798225', 'afrim@menara.ma', '', 0, 0, '2010-02-24 09:51:38', 'Mustapha', 'FARIS', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(320, '158 Rue Asfi Hay Nasr Ouislane ', '', 50000, '05 35 54 86 81', 'mepotrav_zaina@hotmail.fr', '', 0, 0, '2010-02-24 11:40:51', 'Brahim', 'Zaina', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(323, '80, Rue Allal Ben Ahmed Amkik', 'Belvedere ', 20300, '00212522247078', 'capsecurite@menara.ma', '', 0, 0, '2010-02-25 18:05:35', 'Baaddi', 'Ahmed', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(324, '95,BD LA GOTHA LOT JAWHARA SIDI MOUMEN', '', 20630, '0522728900', 'vispro@menara.ma', '', 0, 0, '2010-03-01 12:48:12', 'ABDELFATTAH', 'ANDALOUSSI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(325, '6, rue Hector Berlioz', '', 72000, '0243399050', 'info@gesipa.fr', '', 0, 0, '2010-03-01 13:15:19', 'Benoît', 'BERNARD', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(326, 'DOUAR OULAD SIDI MASSOUD RMEL EL HLAL BOUSKOURA', '56 RUE EL FOURAT MAARIF', 20100, '0661134168', 'jl.hierro@hierrosarl.ma', '', 0, 0, '2010-03-03 09:36:04', 'JEAN LOUIS', 'HIERRO', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(327, '1, rue du Docteur Roux et Rue Gergovie Roches Noires', '', 20303, '0612015699', 'redasost@yahoo.fr', '', 0, 0, '2010-03-03 09:40:10', 'Med Réda', 'Samlal', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(328, 'lot 254 ZI sud-ouest', '', 28810, '212523303118', 'contact@a2me.ma', '', 0, 0, '2010-03-04 19:57:55', 'Khalis', 'Bennis', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(329, '25 lot idris el azhar av lalla asmae tabriquet', '', 11000, '0661284287', 'bensaksecurite@menara.ma', '', 0, 0, '2010-03-06 08:50:37', 'abderrazak', 'atib', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(330, '105,RUE AIT YAFELMAN', 'EL FIDA ', 20500, '0661136453', 'yousragadget@menara.ma', '', 0, 0, '2010-03-09 10:16:40', 'ADNANE', 'BENYAHIA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(331, '25lot idris el azhar av lalla asmae tabriquet ', NULL, 11000, '0661284287', 'atsafetyprive@gmail.com', '', 0, 0, '2010-03-09 21:32:58', 'abderrazak', 'atib', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(332, '91 lotissement la siesta', '', 20800, '0523321053', 'lvsofiec@gmail.com', '', 0, 0, '2010-03-12 10:29:14', 'laurent', 'willaime', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(333, '99, rue Augustin Sourzac, résid. Ismaïlia', '', 20300, '0665962486', 'clericmaroc@yahoo.fr', '', 0, 0, '2010-03-12 11:39:30', 'Marcel ', 'Jonville', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(334, '26 rue Paul Girod Zone Industrielle de Bissy ', '', 73000, '00 33 (0) 4 79 44 59', 'info@guichon.com', '', 0, 0, '2010-03-12 11:56:29', 'Marcel', 'Jonville', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(335, 'RESIDENCE MECA1, RUE HACHIMI KOSTALI', 'OCEAN', 100000, '0661057999', 'bcifood@gmail.com', '', 0, 0, '2010-03-12 15:34:09', 'Lahoussaine', 'IDDER ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(336, 'espace cormontaigne', '2 boulevard henri becquerel', 57970, '0637137745', 'sapbertrand@yahoo.fr', '', 0, 0, '2010-03-12 16:08:04', 'OLIVIER', 'BERTRAND', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(337, 'Km11.7 Autoroute Casa-Rabat', '', 21800, '0522754888', 'mmouline@richbond.ma', '', 0, 0, '2010-03-17 08:57:03', 'Mohammed Hounain', 'Mouline', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(338, 'ZI meknes', '', 50000, '0641642682', 'commercial02@gmail.com', '', 0, 0, '2010-03-17 11:11:08', 'hakim', 'nafiss', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(339, '182,Av. A. Khattabi, appt.12, 3ème étage, Guéliz', '', 40010, '+212.524.42.13.11', 'elementerre.archi@gmail.com', '', 0, 0, '2010-03-18 04:18:45', 'hicham', 'ECH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(340, '18 RUE SIDI BENOUR- AIN BORJA', '', 20300, '0661900511', 'plastibag@menara.ma', '', 0, 0, '2010-03-18 10:24:08', 'MOUNIR', 'MR BENHAYOUNE ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(342, 'Z.A. COURTABOEUF N°3', '32 avenue de l\'Océanie - Bât B1 ', 91140, '0645372059', 'j.fournials@cps-international.fr', '', 0, 0, '2010-03-23 16:45:54', 'Jérémy', 'FOURNIALS', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(344, '14 RUE DE LA CERISAIE', '', 84400, '0490058509', 'laptitesauterelle2@orange.fr', '', 0, 0, '2010-03-23 21:59:23', 'mireille', 'franceschetti', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(345, '3, rue Chella (ex. Avignon)', '', 20000, '0522393900', 'rbencheikh@assalafchaabi.ma', '', 0, 0, '2010-03-24 12:09:52', 'RACHID', 'BENCHEIKH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(346, 'zenata casablanca maroc', '', 11000, '00212522672825', 'barnoussi@ciea.ma', '', 0, 0, '2010-03-24 15:46:50', 'said', 'barnoussi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(348, 'AIROPOLE ONDA NOUACEUR', '', 10000, '0646719710', 'f.aboutajeddine@gmail.com', '', 0, 0, '2010-03-24 22:07:49', 'Fayçal', 'ABOUTAJEDDINE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(349, 'hippodrome rue 32 porte 220', 'kaye rue cheikh aidara porte5', 2366, '0022366075889', 'diallomina@gmail.com', '', 0, 0, '2010-03-24 23:16:14', 'Aminata', 'Diallo', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(350, 'bd mly youssef n°15 rue nadaud 2éme etage', '', 20150, '0661712739', 'drem.com@gmail.com', '', 0, 0, '2010-03-25 10:39:32', 'med salim', 'sadouk', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(351, 'Zone Euro 2000 - rue de la dame', '', 30132, '0659800462', 'guillaume.poulat@grouptfe.com', '', 0, 0, '2010-03-25 11:20:46', 'Guillaume', 'Poulat', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(352, 'BP. 764 Abidjan 18 ', '', 225, '22505446263', 'herbinserge@yahoo.fr', '', 0, 0, '2010-03-25 11:35:52', 'HERBIN SERGE', 'Bouazo', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(353, 'B7 CC el mamoun Av Abdelmoumen hassan', '', 10000, '0661290284', 'naji61@hotmail.com', '', 0, 0, '2010-03-25 14:54:23', 'mohammed', 'naji', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(354, 'BD MLY YOUSSEF ,15 RUE NADAUD, bourgogne,  2 ETAGE N°4 ', 'LOT AL HOUDA, RESIDENCE NADIA 6, N°15 SIDI MOUMEN ', 20400, '0662462513', 'sk2aluminium@gmail.com', '', 0, 0, '2010-03-25 16:06:27', 'MOHAMMED', 'KARMA ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(355, '20, RUE BAIT LAHM - PALMIER', '', 20000, '212522251059', 'easydis@easydis.net', '', 0, 0, '2010-03-25 17:14:17', 'SAMIRA', 'EASY DIS', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(356, '7 BD ABDELATIF BEN KADOUR', '', 20000, '0522948008', 'b2btrading@ymail.com', '', 0, 0, '2010-03-25 21:17:13', 'Othmane', 'RAIS', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(357, '23 rue LEDRU ROLLIN', '', 13600, '00330612681850', 'gerardteyssier@gmail.com', '', 0, 0, '2010-03-27 09:27:11', 'Gérard', 'TEYSSIER', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(358, 'route de casa Ain attigTemara', '', 21000, '212668186126', 'medhaouch@yahoo.com', '', 0, 0, '2010-03-27 09:33:41', 'HAOUCH', 'Mohammed', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(359, 'RESIDENCE ISIS N°6 APPT 11 AVENUE TARGA GUELIZ', '', 40000, '0661239091', 'driouich@protemax-maroc.com', '', 0, 0, '2010-03-27 22:57:27', 'ahmed', 'd ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(360, '49 RUE DE PALMYRE', '', 20160, '0664367174', 'tkhelloud@msn.com', '', 0, 0, '2010-03-28 22:19:53', 'TARIK', 'KHELLOUD', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(361, '19, Bld Zercktouni', '', 20100, '0679082824', 'mpeslacroixphilippe@gmail.com', '', 0, 0, '2010-03-29 11:18:11', 'Philippe', 'Lacroix', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(362, 'route110km 14 ain harouda ', 'route 110 km 14.6 ain harouda', 11000, '0661290034', 'aazizi_idmar@yahoo.fr', '', 0, 0, '2010-03-29 12:09:06', 'brahime', 'alazizi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(363, 'ROUTE110 KM 14.8', 'AIN HAROUDA', 11000, '0661290031', 'MAGINOX_HASSANE@YAHOO.FR', '', 0, 0, '2010-03-29 12:18:19', 'HASSANE', 'ALAZIZI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(364, '5/7 RUE DU TRAITE DE ROME', '', 69780, '0686860295', 'g.briand@ceetrans.fr', '', 0, 0, '2010-03-29 12:22:22', 'GUILLAUME', 'BRIAND', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(365, 'route110km 14 ain harouda ', 'route 110 km 14.6 ain harouda', 11000, '0661290034', 'omatrac@yahoo.fr', '', 0, 0, '2010-03-29 12:26:37', 'brahime', 'alazizi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(366, '5/7 RUE DU TRAITE DE ROME', '', 69580, '0686860295', 'Guillaume@ceetrans.fr', '', 0, 0, '2010-03-29 12:27:57', 'GUILLAUME', 'BRIAND', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(367, 'imm nakhile n 41 ain sebaa', '', 12000, '0661884268', 'stpp@yahoo.fr', '', 0, 0, '2010-03-29 12:32:45', 'SAIDE', 'TALHI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(368, '6 Route de la Ferté Sous Jouarre', '', 77440, '0160374772', 'virginie.coll@circleprinters.fr', '', 0, 0, '2010-03-30 07:03:15', 'Virginie', 'COLL', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(369, '130 Rue Med Eraggab Quartier des Hôpitaux', '', 20100, '0522861929', 'advanced_automation@menara.ma', '', 0, 0, '2010-03-30 11:07:57', 'Saîd', 'BOUNICHANE', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(370, 'Jorf Lasfar', '', 30900, '05 23 34 53 13', 'm.harcha@ocpgroup.ma', '', 0, 0, '2010-03-30 21:18:13', 'Poste 3652', 'HARCHA Mohamed', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(371, 'ZI de Flourens - BP73103', '26, route de Lasbordes', 31130, '0561836035', 't.de-kergunic@ahg.fr', '', 0, 0, '2010-03-31 06:32:51', 'Thomas', 'SIMON de KERGUNIC', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(372, 'Rue Al Mobarrid apt 1', 'Cité plateau Val Fleuri', 20100, '0649438405', 'top.rayonnages@gmail.com', '', 0, 0, '2010-03-31 18:40:03', 'Ali', 'Armut', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(373, '17 Av Alfred de Vigny', '', 95230, '0033617692310', 'amineaja@gmail.com', '', 0, 0, '2010-04-01 09:14:29', 'Amine', 'AJANA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(374, 'Bp 35 Sidi addi par Azrou', '', 53100, '0033617692310', 'amineaja@hotmail.com', '', 0, 0, '2010-04-01 09:28:01', 'AJA', 'AMINE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(375, '5 bloc 4 hay el mourabitine erac', '', 30080, '0699166343', 'flp.hassan.batoul@gmail.com', '', 0, 0, '2010-04-01 19:54:22', 'hassan', 'batoul', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(376, 'BP 185 FERHAT BOUSSAD ALGER', '', 16005, '00213669350585', 'smcm.ciment@gmail.com', '', 0, 0, '2010-04-03 09:37:39', 'Djamal eddine', 'Moualek', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(377, '6 rue de la camille', '', 69600, '000000000', 'info.gesticiel@gmail.com', '', 0, 0, '2010-04-04 20:01:18', 'NORDINE', 'NORDINE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(378, 'Pol. Juncaril - C/ Trevélez - Parc. R1', '', 18220, '0034958466888', 'sule.douhri@estanteriasrecord.com', '', 0, 0, '2010-04-08 07:32:49', 'Soulaiman', 'Douhri', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(384, 'Parc Industril de Bouskoura - Lot N° 77 Route Secondaire 109 ', '', 20180, '0522592152', 'msakaly@gaches.com', '', 0, 0, '2010-04-12 16:17:05', 'MARIA', 'SAKALY', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(385, 'B.P 117 AGADIR', 'Z.I AIT MELLOUL', 80150, '0669291432', 'achats.aveiro@aveiro-maroc.com', '', 0, 0, '2010-04-13 17:31:44', 'ali', 'ahlaou', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(386, 'BD BAHMAD ANG RUE DINANT CASA MAROC', '', 20500, '0661442077', 't.lazreq@manuafric.ma', '', 0, 0, '2010-04-14 15:45:54', 'TARIQ', 'LAZREQ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(387, 'Pue des papillon Villa Afifi lotis Anis', '', 20100, '0611064570', 's.bellamine@gmail.com', '', 0, 0, '2010-04-19 16:03:24', 'salma', 'bellamine', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(388, '82, BD EL JADIDA App n°1, 1er Etage ELALIA Mohammedia-Maroc', '', 28820, '0523327617', 'mgi.maryam@gmail.com', '', 0, 0, '2010-04-22 09:45:06', 'maryam', 'tarfaoui', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(389, 'N°2, Rés 49 Lot Yasmina 2, Route Taddart, Californie', '', 20000, '212663124134', 'mbenyoussef.moonhere@aaron-babel.com', '', 0, 0, '2010-04-26 17:54:24', 'Mounir', 'Benyoussef', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(391, 'AV . DES FAR KM 10 DCHEIRA INEZGANE', '', 80360, '00212528333720', 'perdeco@gmail.com', '', 0, 0, '2010-04-27 10:06:05', 'mohamed', 'fiqi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(392, 'AV . DES FAR KM 10 DCHEIRA INEZGANE', '', 86350, '00212650060191', 'fafati88@gmail.com', '', 0, 0, '2010-04-28 16:48:04', 'mohamed', 'fiqi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(393, 'Gallerie Famillia, Bur 40 1er Etage angle rue oussama Ibnou Zaid et Rure d\'Auvergne', '', 20330, '0661470807', 'mntechnology@menara.ma', '', 0, 0, '2010-05-03 09:41:50', 'Atika', 'IMEL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(394, 'Casablanca', 'Douala / Cameroun siège social', 2129, '0023799417940', 'prmcam@yahoo.fr', '', 0, 0, '2010-05-03 09:50:17', 'Vincent', 'MAS', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(396, '39 RUE 12 METRES BOURGOGNE CASA', '', 25000, '0674108464', 'mansourisouad62005@yahoo.fr', '', 0, 0, '2010-05-04 19:52:43', 'SOUAD', 'MANSOURI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(397, '55, RUE OUED EDDAHAB QUARTIER AZIB DERAI', '', 46000, '0664051419', 'ysf_911@msn.com', '', 0, 0, '2010-05-04 20:45:16', 'YOUSSEF', 'MANSOURI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(398, '4 rue Paul Valery', '', 19100, '33 616 959 059', 'b.villain@palmat-systems.com', '', 0, 0, '2010-05-06 22:48:48', 'Bertrand', 'VILLAIN', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(399, '57/59 Calle Lorente', '', 50005, '697459737', 'bornex2004@yahoo.fr', '', 0, 0, '2010-05-08 09:51:56', 'Omar', 'NGADI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(400, '1,boulevard hassan II Mohammadia', '', 20500, '0523319206', 'ZAKARIA.ELKHATTABI@GMAIL.COM', '', 0, 0, '2010-05-10 14:36:13', 'ZAKARIA', 'EL KHATTABI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(401, 'Agadir', '', 80000, '0661784950', 'groupeprimeurs@gmail.Com', '', 0, 0, '2010-05-11 15:03:25', 'Zakaria', 'Kartoubi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(402, 'RESIDENCE EL BARAKA, AVENUE MED V N15', '', 60000, '212672337890', 'everdico@gmail.com', '', 0, 0, '2010-05-13 12:43:21', 'ABDELHAK', 'JABARI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(403, 'sidi maarouf', '', 20150, '0661266980', 'groupelogistiqueinvest@gmail.com', '', 0, 0, '2010-05-17 00:33:59', 'souheil', 'souheil', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(404, 'Bd HASSAN II - INTERIEUR EX-MADISON', '', 20800, '0666280398', 'h.rima@silamaroc.com', '', 0, 0, '2010-05-22 14:11:40', 'HIND', 'RIMA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(405, '17 Place Charle Nicole, Etage 7 N° 2', '', 20450, '0661834614', 'a.socomis@gmail.com', '', 0, 0, '2010-05-24 23:41:55', 'OUBOUKDIR', 'Abderrahman', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(406, 'N°43 Imm TIFAOUINE AV AL Mouquaouama', '', 80000, '0661104194', 'ach@cabinplant.net', '', 0, 0, '2010-05-31 17:01:40', 'Aboubaker', 'Chajia', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(407, 'S-ADIL@HOTMAIL.FR', '', 15000, '0522662003', 'S-ADIL@HOTMAIL.FR', '', 0, 0, '2010-06-01 11:32:03', 'BOUTALEB', 'BOUTALEB', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(408, '33 waafe', '', 92000, '0670454545', 'achraf_al@yahoo.fr', '', 0, 0, '2010-06-03 16:48:56', 'alharraki', 'ACHRAF', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(409, 'Apdo. 706', '', 43800, '0034656952936', 'anouar@presitec.com', '', 0, 0, '2010-06-04 11:29:26', 'Anouar', 'Haloui', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(410, 'TECHNOPARK N°307', '', 16150, '0661437758', 'abdou@fournipro.ma', '', 0, 0, '2010-06-04 13:18:30', 'YAHYAOUI', 'Abdou', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(418, 'LOT JAWHARA N°57 SIDI MOUMEN', '', 20630, '+212522661389', 'sonefimaroc@gmail.com', '', 0, 0, '2010-06-08 02:04:54', 'ABDELILAH', 'BENMOUSSA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(419, '2 Rue de Guise Roches Noires ', '', 20000, '00212674027932', 'tcecasa@gmail.com', '', 0, 0, '2010-06-08 11:10:21', 'Abdelghani', 'ENNACIRI ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(420, '2 Rue de Guise Roches Noires ', '', 20000, '00212674027932', 'tcepartners.net@gmail.com', '', 0, 0, '2010-06-08 11:17:27', 'Abdelghani', 'ENNACIRI ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(421, '8, rue ouled said-bourgogne ', '', 20040, '0669032512', 'marketing@securitybusiness.ma', '', 0, 0, '2010-06-09 09:59:35', 'Sanaa', 'BERRAMOU', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(422, '8, rue ouled said-bourgogne ', '', 20040, '0669032512', 'marketing@internationalsecuritybusiness.com', '', 0, 0, '2010-06-09 10:07:45', 'Sanaa', 'BERRAMOU', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(424, '3, BD Mohamed V Mohammedia', '', 28800, '00212660427243', 'agmour_19@yahoo.fr', '', 0, 0, '2010-06-09 11:52:57', 'MOHAMED', 'AGMOUR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(425, 'Résidence Shehrazade3, Rue Soumaya 5éme étage, N°22 Palmiers ', '', 20100, '0662014287', 'contact@ingeniatis.com', '', 0, 0, '2010-06-09 17:11:22', 'OUBRIK', 'Karim', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(427, '1 Rue de Guise Roches Noires ', '1 Rue de Guise Roches Noires ', 2700, '0661355218', 'support@lesachatsindustriels.com', '', 0, 0, '2010-06-11 16:44:38', 'kamal', 'mourad', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(428, 'K9, ROUTE MEDIOUNA', '', 20000, '0669281310', 'elmenyani@gmail.com', '', 0, 0, '2010-06-22 16:23:26', 'EL HASSAN', 'EL MENYANI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(439, '4 rue catalogne ', 'anfa', 20000, '0675466600', 'smci.sales@gmail.com', '', 0, 0, '2010-06-23 20:03:16', 'smcimaroc', 'smcicontact', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(446, 'Bd Chefchaouni, Lot. Asta, Imm. A - 3ème étage - N° 9 - Km 8,5 ', '', 20590, '212522665523', 'contact@gamai.ma', '', 0, 0, '2010-06-30 13:54:42', 'SABAH', 'ENNOUISSI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(447, 'Guinée, Ckry', '', 2260, '0640261431', 'aminadiop88@hotmail.fr', '', 0, 0, '2010-06-30 14:33:36', 'T.A.', 'DIALLO', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(448, 'Marques D`Asprella', '', 3201, '617561272', 'econeed@gmail.com', '', 0, 0, '2010-07-07 18:03:12', 'El Ouadi', 'Mohamed', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(449, '115 avenus 2 mars', '', 18200, '077616131-061594674', 'imane.absprotection@gmail.com', '', 0, 0, '2010-07-10 09:24:13', 'imane', 'watii', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(450, '100 Bd ABDELLAH IBN YACINE', '', 20300, '0522444423', 'casapacking@hotmail.com', '', 0, 0, '2010-07-14 08:43:17', 'HIND', 'RACHIDI HAFIDI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(452, 'OUED RMALL KSER SGHIR ', NULL, 90000, '0539337035', 'y_boulaid@hotmail.com', '', 0, 0, '2010-07-15 09:18:36', 'YOUNES', 'BOULAID', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(453, 'Rue Soumaya, Résidence Chahrazad 3, 5 ème étg, n°22- Palmier', '', 20000, '0667210100', 'rayomag@gmail.com', '', 0, 0, '2010-07-16 12:09:24', 'ABDELMAJID', 'MOUKDAD', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(454, '223, Groupe Al Ahd Hay Nahda 1', '', 10210, '0661339006', 'zmetougui@ecosakane.com', '', 0, 0, '2010-07-19 13:19:07', 'ZOUHAIR', 'METOUGUI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(455, 'LES ENTREPOTS MLY SLIMANE, 73 BD MLY SLIMANE', 'ATELIER N° 22. AIN SEBAA.', 20580, '00212522341578', 'ste.madibat@menara.ma', '', 0, 0, '2010-07-22 10:37:52', 'ABDERRAHIM', 'BENJELLOUN', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(456, '5 rue charleville belvedere', '', 20300, '0661200231', 'info.unindustries@gmail.com', '', 0, 0, '2010-07-23 19:11:32', 'Rachid ', 'Hassanain', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(457, '38,rue Ibnou Nafiss Maarif', '38, Av Mly Hassan 1er,2ème ét', 20100, '0640005540', 'othmani2@hotmail.com', '', 0, 0, '2010-07-29 12:39:57', 'Mohamed', 'OTHMANI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(458, 'TOPACIO, 41', '', 47012, '0034983217480', 'javier@eurobelt.com', '', 0, 0, '2010-08-02 13:08:50', 'JAVIER', 'SAN MIGUEL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(459, '50.AV DES FAR TOUR DES HABOUS 5éme étage', '', 20000, '0666900313', 'm_terrada@yahoo.com', '', 0, 0, '2010-08-05 12:22:16', 'MAROUANE', 'TERRADA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(460, 'LA VALLEE', '', 85140, '0628465193', 'stephane.perrocheau@piveteau.com', '', 0, 0, '2010-08-25 12:45:12', 'STEPHANE', 'PERROCHEAU', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(461, '1,BOULEVARD HASSAN II 20800', '', 20800, '0523319206', 'student_boy2004@hotmail.com', '', 0, 0, '2010-09-02 11:16:15', 'zakaria', 'Elkhattabi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(462, 'chez ICBM ', '174 blv ZERKTOUNI', 20100, '0522472479', 'pierre.herisson@tap-nordafrique.com', '', 0, 0, '2010-09-18 08:43:46', 'Pierre', 'HERISSON', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(463, '7/F, Kin On, Commercial Building,', '49-51 Jevois Street', 200047, '008613761869719', 'michael@novasol-energy.com.hk', '', 0, 0, '2010-10-09 08:30:00', 'Michael', 'Gonzalez', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(464, '64;rue planquette-Belvédere', '79,rue de peronne-Belvédére', 20300, '0662092976', 'azert.szad1980@hotmail.com', '', 0, 0, '2010-10-18 10:23:21', 'EL HAIMOUDY', 'SAID', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(465, 'Avenue Prince Héritier Al MADINA. Résidence Dar El Farah 3 2ème étage appartement 64 ', 'Km 14, Route secondaire 111 les ZENATAS ', 20800, '06 69 06 77 87', 'sellami.othman@gmail.com', '', 0, 0, '2010-11-03 17:02:38', 'Othman', 'Sellami', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(466, 'Rue 801, lot82, quartier industriel sidi brahim II', '', 30000, '0661461726', 'saad.faraj@triumph.com', '', 0, 0, '2010-11-23 10:09:47', 'SAAD', 'FARAJ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(467, 'angle Bd Roudani & Bd Ghandi, n°798 bd Ghandi', '', 20300, '0661952910', 'k.ramch@albaridbank.ma', '', 0, 0, '2010-12-14 09:27:29', 'kawtar', 'ramch', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(469, '80 BD MY SLIMANE', 'EN FACE DU PARK MY SLIMANE', 30000, '0614233888', 'eliteagencement@GMAIL.COM', '', 0, 0, '2011-02-20 21:26:17', 'MOUHSSINE', 'SAIGH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(470, '8 RUE MALMEDONNE', '', 78310, '0685285275', 'kacem.tababi@maurepas-techniques.fr', '', 0, 0, '2011-03-08 14:19:40', 'KACEM', 'TABABI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(471, '41 AVENUE DES PLIEADES HERMITAGE', '', 20500, '0522862082', 'laila@ns.ma', '', 0, 0, '2011-03-08 16:35:49', 'laila', 'mourhfir', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(472, '41 AVENUE DES PLIEADES HERMITAGE', '41 AVENUE DES PLEIADES HERMITAGE', 20360, '0522862082', 'losa05_5@hotmail.com', '', 0, 0, '2011-03-15 17:28:56', 'mourhfir', 'laila', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(473, 'Zone Industrielle Ait Melloul, BP 117,', NULL, 80000, '0662422087', 'zahra.achat@aveiro-maroc.com', '', 0, 0, '2011-04-02 09:16:44', 'Zahra', 'AIT ALHAJ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(475, '7, Bd moulay youssef', '', 20100, '0662637305', 'contact@dakir-immo.com', '', 0, 0, '2011-04-18 12:58:00', 'abderrahmane', 'dakir', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(476, '7, Bd moulay youssef', '', 20100, '0522203213', 'contact@1newlog.com', '', 0, 0, '2011-04-19 15:49:56', 'abderrahmane', 'dakir', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(477, 'marrakech medina', '', 40300, '0661112699', 'meyabuisness@gmail.com', '', 0, 0, '2011-05-16 20:25:10', 'mohamed', 'moulay', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(478, 'RTE N7, ZI BERRECHID, RTE CASABLANCA MARRAKESH', '', 26100, '00212522354741', 'k.nahya@sodalmu.ma', '', 0, 0, '2011-05-26 17:03:44', 'KARIMA', 'NAHYA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(479, '10 Ubi Crescent #07-76 Lobby D Ubi Techpark', '', 408564, '006568488067', 'san.ly@slesca.com', '', 0, 0, '2011-06-29 07:24:49', 'San', 'LY', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(480, 'ZI GZENAYA LOT 161 A 168 ROUTE DE RABAT', '', 90000, '0539393434', 'saabiza@simon.ma', '', 0, 0, '2011-08-10 14:53:01', 'SOUAD', 'AABIZA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(481, '13 rue 3 Inara, Hay Chrifa', '', 20460, '0663461190', 'contact@gestassistance.ma', '', 0, 0, '2011-08-14 11:36:07', 'Moulay Mahmoud', 'Ouchen', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(482, '147, Bd Med Smiha', '', 20000, '05 22 201370', 'alliansis@alliansis.ma', '', 0, 0, '2011-08-17 13:26:03', 'Kenza', 'AZAKRAOUI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(483, 'Immeuble Espace Sans Pareil 20-22 Lot Attaoufik', 'sidi maârouf', 20190, '0522976095', 'y.bennaghmouch@aviacom.co.ma', '', 0, 0, '2011-08-21 13:42:55', 'Youssef', 'BENNAGHMOUCH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(484, '310, rue Omar Riffi', '', 20100, '0522548780', 'areda@thales.ma', '', 0, 0, '2011-09-05 13:10:39', 'Abdellah', 'Reda', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(485, '37 rue tata', '', 20000, '0661133783', 'sekkat.matinvest@gmail.com', '', 0, 0, '2011-10-03 11:31:15', 'hicham', 'sekkat', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(486, 'CENTRE COMMERCIAL ERAC BOULVARD MOHAMED 6  IMMEUBLE F 2 APPT N° 4  1erETAGE - CASABLANCA', '', 20000, '0666442753', 'logistique.responsable@gmail.com', '', 0, 0, '2011-10-03 13:17:18', 'Mohammed', 'BAHI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(487, 'CENTRE COMMERCIAL ERAC BOULVARD MOHAMED 6  IMMEUBLE F 2 APPT N° 4  1erETAGE - CASABLANCA', '', 20000, '0666442753', 'dgc.gcti@gmail.com', '', 0, 0, '2011-10-03 13:36:40', 'Mohammed', 'BAHI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(488, 'Rue IbnZiyad', '', 91000, '0661189392', 'oss.rac@gmail.com', '', 0, 0, '2011-10-17 10:45:46', 'Mohammed', 'Ait El Djoudi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(489, 'Route 107, Km 22, Tit Mellil, n°10', '99 rue abou alwaqt résidence arrajaa n°24 bourgogne', 20160, '0661405240', 'renovplast@gmail.com', '', 0, 0, '2011-11-28 16:15:21', 'Fath Allah', 'Bennani', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(491, 'Lot. Essabah N°2, Rue Elfidae - Route du Souk - Ouled Teîma, Taroudannt', '', 83350, '212671450682', 'imfadlollah@gmail.com', '', 0, 0, '2012-04-27 17:52:40', 'Fadlo Allah', 'MRABT', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(510, '20-22Wenlock Road LONDON  N17GU UNITED K', '', 0, '0661050338', 'm.l@gatechnology.co.uk', '', 0, 1, '2017-10-14 02:01:24', 'lahouel', 'LAHOUEL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(562, '30.avenue istiqlal mag 9.10', '', 14000, '+212537360330', 'b.brahim@messtechnik.ma', '', 0, 1, '2018-01-18 11:57:25', 'Brahim', 'Manti', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(566, 'via Palazzina 1 - Sarcedo', '', 36030, '390445366785', 'sales2@zallys.com', '', 0, 1, '2018-01-18 13:37:02', 'Duriavig', 'Patrizia', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(567, 'casablanca', '', 20000, '0637320163', 'contactatlassarl@gmail.com', '', 0, 1, '2018-01-22 15:50:22', 'brahim', 'ouyhya', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(568, 'Sua Road, Dhandari Kalan, Industrial Area C, Ludhiana – 141010', '', 141010, '+91-8283800898', 'sfexports@eastmanimpex.com', '', 0, 0, '2018-01-25 12:26:27', 'Deepak', 'DeepakKumar', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(569, 'AV mehdi ben barka à coté de lapharmacie ZINA', '', 10000, '0662775614', 'soukaina.zitouni@bison-square.com', '', 0, 1, '2018-01-25 12:33:24', 'soukaina', 'zitouni', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(571, 'riad ben chaib II IMM05 APP84 BERRECHID', '', 26100, '0661487553', 'faquihifatna@gmail.com', '', 0, 1, '2018-01-29 14:50:04', 'faquihi', 'fatna', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(572, '10, Rue Liberté 3éme étage, Appt 6 Casablanca', '', 20070, '0663070404', 'AMHAOUER@2SID.MA', '', 0, 1, '2018-01-30 16:33:45', 'ABDELMOTALEB', 'MHAOUER', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(573, 'Zone Franche Ksar Al Majaz Oued R\'mel Commune Anjra Route De Fenideq Bp 216 - Fahs-Anjra', '', 94125, '0531061125', 'meriem.aissi@apmterminals.com', '', 0, 1, '2018-02-08 12:18:32', 'Meriem', 'Aissi', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(574, 'Zone Franche d’exportation de Tanger Automotive City, ilot 186 Commune Jouamaa Province Fahs-Anjra -Tanger-Maroc', '', 90000, '0669698317', 'mohamed-yassine.sbai@valeo.com', '', 0, 1, '2018-02-09 07:40:31', 'MohamedYassine', 'Sbai', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(575, 'bp 618 hay hassani berrechid', '', 26100, '0637818314', 'vibra2m@gmail.com', '', 0, 1, '2018-02-16 14:19:52', 'motor', 'vibra', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(576, '2 rue Melouia - ex Lapébie 20150 Casablanca - Maroc', '', 20150, '00212641047574', 'abdeddaim@gmail.com', '', 0, 1, '2018-02-16 14:54:10', 'mohamed', 'abdeddaim', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(577, 'Bd Abdelkader Sahraoui, Res Al Manzah, GH 7, Rue 10, Imm 42, N°2 ', '', 20250, '0707100101', 'commercial@nt2e.com', '', 0, 1, '2018-02-22 17:13:31', 'arhnaje', 'mostafa', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(579, '64, rue Ennoussour, apt.11, casablanca', '', 20130, '+212641058794', 'bensbih.ryme@gmail.com', '', 0, 0, '2018-02-23 15:56:55', 'Ryme', 'Bensbih', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(580, '96 Rue mohamed zefzaf lot sidi amar berrechid', '', 26100, '0661623916', 'commercial1@soserev.ma', '', 0, 1, '2018-03-04 15:52:26', 'Mostafa', 'MOJAHID', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(581, 'En face du lycee Kountya, Conakry', '', 2150, '00224625288609', 'amara.camara@obs4you.com', '', 0, 1, '2018-03-06 14:24:30', 'Amara', 'CAMARA', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(582, 'BP 308 ELMARSA LAAYOUNE', 'Bp308 le marsa  laayoune', 70000, '0604075903', 'f.t.frereslaayoune@gmail.com', '', 0, 1, '2018-03-08 19:03:17', 'Elfoukhari', 'Mahdi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(583, 'ROUTE MLY THAMI ZI DAR BOUAZZA', 'CASABLANCA', 35200, '00212660113021', 'rotmani@pid.ma', '', 0, 1, '2018-03-28 19:23:55', 'RACHIDA', 'OTMANY', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(584, ' Atlantic Free Zone, RN4, Commune D\'amer Safia, Lots / I1.123I1.126, CE1, CE2, CE3, CE4.,', '', 14000, '0664176485', 'kaoutar.raissi@mta.it', '', 0, 0, '2018-04-09 12:59:53', 'KAOUTAR', 'RAISSI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(586, 'BD BAGHDAD RESIDENCE KOUTOUBIA IMMEUBLE 10 APPT 04 ,2EME ETAGE ', '', 20070, '0522523838', 'commercial15@intervaria.co.ma', '', 0, 1, '2018-04-14 13:12:24', 'JIHANE', 'ELmoutaouakkel', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(587, ': Gr Attakkadoum Gh 2 - 17 Etage 2 Sidi Bernoussi - Casablanca', '', 20610, '0661417140', 'dalgoindustrie@gmail.com', '', 0, 1, '2018-05-04 14:06:22', 'ABDELLAH', 'AGOUZOUL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(588, '49 RUE JEAN JAURES ', '', 20000, '00212694636583', 'info@gcswisstrading.com', '', 0, 0, '2018-05-30 20:01:46', 'CHRISTOPHE', 'CHAHID', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(589, '265, Bd Zerktouni', '', 20050, '0661857812', 'fkassocier@gmail.com', '', 0, 0, '2018-07-12 13:13:23', 'ADILE', 'FERJANE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(590, 'N°8,Rue El Balabil', 'mersultan', 20120, '06 96 66 66 47', 'alsaceequipement@gmail.com', '', 0, 1, '2018-09-09 11:45:37', 'badreddine', 'sadawi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(591, '27, rue de Bapaume', '', 20500, '+212652598954', 'abdelilah.habti@yazindustrie.com', '', 0, 0, '2018-11-23 20:42:20', 'ABDELILAH', 'HABTI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(592, '17 rue Abou Abbas El Jiraoui , n° 5 Q. la Gare', '', 20250, '0660896422 ', 'Sigmatecasa@gmail.com', '', 0, 0, '2019-03-02 15:27:52', 'Abdelmounim ', 'Bennouh ', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(593, 'Lot rina', '', 26202, '212653243216', 'Marouanebertami4@gmail.com', '', 0, 0, '2019-03-30 15:34:23', 'Marouane', 'Bertami', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(607, 'lot koutoubia rc koutoubia n 3 sale', '', 11100, '0661705592', 'thm.messagerie@gmail.com', '', 0, 1, '2019-06-13 18:04:06', 'driss', 'hilal', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(608, '23 , rue Brahim lemtouni l\'oasis', '', 2000, '0698755772', 'A.rahmouni@espaciomaroc.ma', '', 0, 1, '2019-06-17 12:05:39', 'Amina', 'Rahmouni', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(609, '71.bd baghdad   ain chok', '', 20300, '0619555862', 'h.consoexpress@gmail.com', '', 0, 1, '2019-06-21 12:13:23', 'Hassan', 'AAKIRICH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(610, '30, APP. N°8,RUE MOULAY AHMED LOUKILI HASSAN', 'HASSAN', 10000, '+212602314191', 'gnselec.maroc@gmail.com', '', 0, 1, '2019-06-21 23:47:15', 'Abdessamad', 'ELAZZOUZI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(611, 'N 38 B HAY ACHBAROU ENNASIM', '', 54000, '0678595335', 'nkoulilich@gmail.com', '', 0, 0, '2019-06-22 00:58:49', 'nizar', 'koulilich', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(612, '30 ZI BIR RAMI', '', 14090, '0662037806', 'bousseta@hibapower.com', '', 0, 1, '2019-06-24 18:40:32', 'YOUSSEF', 'BOUSSETA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(613, 'place charle nicol maarif', '', 20050, '0619969062', 'santoimmo79@gmail.com', '', 0, 0, '2019-06-24 18:41:56', 'redouane', 'reda', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(614, '109 avenue Abdelkrim El Khattabi, résidence Jawad', '', 40000, '00212658668379', 'contact@africarome.com', '', 0, 1, '2019-06-26 15:47:15', 'guillaume', 'dollinger', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(615, 'Hay moulay rachid group 4 rue 16 number 4 bis ER REGGAB Casablanca morocco', '', 20660, '+212654564945', 'a.erreggab@gmail.com', '', 0, 1, '2019-07-04 15:55:13', 'ABDELKRIM', 'ERREGGAB', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(616, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'youness.arbouh1@gmail.com', '', 0, 1, '2019-07-08 15:13:37', 'ARBOUH', 'Youness', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL);
INSERT INTO `user` (`id`, `adresse1`, `adresse2`, `codepostal`, `phone`, `email`, `password`, `del`, `isactif`, `created`, `first_name`, `last_name`, `username`, `discr`, `roles`, `password_change_date`, `parent1`, `confirmation_token`, `avatar_id`, `redirect`, `password_reset_date`, `forgot_token`) VALUES
(618, 'Ben Yakhlef', '', 28815, '0523335355', 'contact@quadritech.ma', '', 0, 1, '2019-07-12 12:23:16', 'Commercial', 'Quadritech', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(619, 'Centre El Qods 2 Bd Imam Lait Bnou Saad, Étage 01, N° 58 Imm C, Sidi Bernoussi ', '', 20380, '0661513825', 'm.elhattab@protectionunit.ma', '', 0, 1, '2019-09-25 12:51:12', 'MOHAMED', 'EL HATTAB', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(620, 'Lot 106, Ard El Kheir rue 4 n°5 Aïn Chok', '', 20470, '00212661533858', 'moncef.nasri@lartdutextile.com', '', 0, 1, '2019-10-17 17:24:49', 'MONCEF', 'NASRI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(621, 'Tabriquet Salé ', '', 11010, '0611738945', 'saaderrami@gmail.com', '', 0, 1, '2019-10-19 23:28:04', 'ERRAMI ', 'Saad ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(622, 'TEST', '', 0, '0664568444', 'a.laouz@gmail.com', '', 0, 1, '2019-10-21 10:39:28', 'ABDELLAH', 'LAOUZ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(623, 'Hay nahda 1 groupe PTT N°36 rabat (85,66 km)', '', 1060, '0619438618', 'ghafcar@gmail.com', '', 0, 1, '2019-10-21 13:06:29', 'ADIL', 'GHAFFOUR', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(624, '2, av. Abderahim Bouaabid, El Marsa 70000 Laayoune', '', 0, '0672682909', 'service@saharanavals.net', '', 0, 1, '2019-10-21 13:57:48', 'MBAREK', 'FERGHALI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(625, '2, av. Abderahim Bouaabid, El Marsa 70000 Laayoune', '', 0, '0672682909', 'saharanavals@gmail.com', '', 0, 1, '2019-10-21 14:03:49', 'MBAREK', 'FERGHALI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(626, 'dior 70 N 197 massira, TEMARA', '', 0, '0694743111', 'bader.korchiyne@gmail.com', '', 0, 1, '2019-10-21 16:22:29', 'KORCHIYNE', 'BADER', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(627, '33 Boulevard Hassan Seghir, Casablanca ', '', 0, '0611308874', 'asmaa.mitre@gmail.com', '', 0, 0, '2019-10-22 13:33:05', 'MITRE', 'ASMAA', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(628, 'LOCAL D CIB ZI DE BOUZNIKA', '', 13100, '0668124714', 'mourad.haouam@decayeuxstm.com', '', 0, 1, '2019-10-22 15:28:49', 'MOURAD', 'HAOUAM', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(629, 'Route El Jadida (par Lissasfa) KM 13,5 PK374 Maroc', '', 22000, '0661696356', 'amine.mejnaoui@engie.com', '', 0, 1, '2019-10-22 20:59:58', 'AMINE', 'MEJNAOUI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(630, 'Route 1029 Local 14 Sidi Maârouf Casablanca - Maroc', '', 0, '0664579868', 'siham.ghalem@groupe-devisu.com', '', 0, 1, '2019-10-24 11:13:35', 'siham', 'ghalem', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(631, 'Tour Hassan ', '', 10200, '0697118511 ', 'l.touil@stemarita.com', '', 0, 0, '2019-10-25 15:08:46', 'Touil', 'Loubna', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(632, '70,LOT D\'ATIVITÉ ÉCONOMIQUE ,MIDELT', '', 54350, '0648975475', 'centraleautotrucks@gmail.com', '', 0, 1, '2019-10-26 21:51:19', 'AZIZ', 'CHAKRI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(633, 'Rue Al Irfane 1ere Etage N 28 Residence El Koumir Tabriquet - Tabriquet (AR)', '', 0, '0600441142', 'samt2co@gmail.com', '', 0, 1, '2019-10-27 16:01:38', 'nabil', 'sami', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(634, '265, Bd Zerktouni N°92 Etg9-Casablanca - Maroc', '', 0, '0634770754', 'taoufik.amil@be-premium.ma', '', 0, 0, '2019-10-27 18:24:49', 'TAOUFIK', 'AMIL', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(635, ' Boulevard Moulay Youssef, La Corniche, Mohammédia', '', 0, '0661548609', 'salim.eladil@avantimohammedia.com', '', 0, 1, '2019-10-27 19:18:42', 'Salim', 'Eladil', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(636, '46,Bd ZERKTOUNI ,Bureau 15-16 Etage 6', '', 20020, '06 61 33 66 74', 'softequipement@gmail.com', '', 0, 0, '2019-10-28 21:36:39', 'Mohamed', 'EL GRAOUI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(637, ' 4 Hay Maiouna Bloc 2 ', 'Atelier Tit Mellil ', 23000, '0667255318', 'c.industrial.multiservices@gmail.com', '', 0, 1, '2019-10-29 12:59:01', 'Marouane', 'BOURCHI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(638, 'Bd Sebta, propriété Rachid 1, rés. Zineb- rte Bni Yakhlaf', '', 28800, '0662190170', 'asmaeagarmoud20@gmail.com', '', 0, 1, '2019-10-30 10:23:48', 'ASMAE', 'AGARMOUD', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(639, 'Groupe Attakkaddoum Gh2 -17, 2ème Etg Sidi Bernoussi - Sidi Bernoussi (AR)', '', 0, '0663810285', 'bbluxedecor@gmail.com', '', 0, 0, '2019-10-30 15:15:36', 'Belaid', 'DAMMOUCHE', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(640, 'Groupe Attakkaddoum Gh2 -17, 2ème Etg Sidi Bernoussi - Sidi Bernoussi (AR)', '', 28800, '0663810285', 'dammouchebelaid@gmail.com', '', 0, 0, '2019-10-30 17:18:28', 'DAMMOUCHE', 'BELAID', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(641, '6 Rue Ouled Said', 'Quartier Bourgogne', 20040, '0661492055', 'vdvelectro1@gmail.com', '', 0, 1, '2019-10-31 18:35:12', 'Amzairi', 'Zouhair', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(642, 'zone industrielle azit,allée 2,lot 43 A 90000 Tanger', 'mghogha', 90000, '0638816580', 'elfakhkhari.khadija@gmail.com', '', 0, 1, '2019-11-01 11:53:05', 'khadija', 'fakhkhari', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(643, '9, rue Al Amal , hay Annakhil EL JADIDA', '', 0, '0661408111', 'setrel.technique@gmail.com', '', 0, 1, '2019-11-01 19:52:15', 'ZOUHAIR', 'BELFARJI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(644, 'KM 17 AIN HARROUDA', '', 28630, '0661429279', 'lahlali.seventrade@gmail.com', '', 0, 1, '2019-11-05 11:30:13', 'FATIMA ZOHRA', 'LAHLALI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(645, '76, boulevard Nador.casablanca', '', 20480, '0650842874', 'gtsi.maroc@gmail.com', '', 0, 1, '2019-11-08 17:07:39', 'fatimazahra', 'hachidi', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(646, '306 tickni zone industriel', '', 24000, '0660303330', 'picostelec@gmail.com', '', 0, 1, '2019-11-12 13:10:26', 'Mouhaddane ', 'Karim', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(647, 'hay oued eddhab n 36 temara', '', 12010, '0661765758', 'logigard@gmail.com', '', 0, 1, '2019-11-12 14:58:52', 'elbekkali', 'zouhir', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(648, 'salam 1 rue 16 n3 complexe residentiel sidi bernoussi casablanca', '', 20600, '0661982871', 'airclimelectro@gmail.com', '', 0, 1, '2019-11-13 10:32:02', 'laaziri', 'mustapha', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(649, 'RES AL BADRE GH7 IMM 64 ', 'N°01 AIN SEBAA', 20000, '0662798719', 'trans.fuso18@gmail.com', '', 0, 1, '2019-11-15 17:44:54', 'JAWAD', 'ELMETTICHI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(650, 'Hay baraka 2 rue 12 n 15 lot 113 sidi moumen casablanca', '', 20240, '0669-977-977 ', 'casaunivers.services@gmail.com', '', 0, 1, '2019-11-19 10:31:02', 'Ahmed', 'Bassry ', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(651, '127 bloc A Ouled Oujih', '', 14000, '0662067229', 'pmil.nekach@gmail.com', '', 0, 1, '2019-11-19 12:39:06', 'Mustapha', 'Nekach', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(652, 'Kamala n55 ainsi harrouda', '', 20630, '0673840138', 'igortravaux@gmail.com', '', 0, 0, '2019-11-19 17:02:31', 'Mohamed ', 'Taki', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(653, 'Madinat El Wahda bloc H n° 191 Laayoune', '', 70000, '0604319895', 'neip.maroc@gmail.com', '', 0, 1, '2019-11-19 22:32:11', 'Lahcen', 'IGHARM', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(654, '59, bd zerktouni; 3ème étage. N 8', '', 20000, '0664200809', 'khitam.elyoubi@idevcom.com', '', 0, 1, '2019-11-20 11:45:33', 'KHITAM', 'ELYOUBI', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(655, '114 av mohamed5 appt 12', '', 90000, '+212661050338', 'm.l@afriquepst.com', '', 0, 1, '2019-11-22 00:46:14', 'mohamed', 'lahouel', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(656, 'RUE IBN TOUMART', '3', 10000, '0659828735', 'amts.sarl@gmail.com', '', 0, 1, '2019-11-25 12:24:22', 'fouad', 'zeroual', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(657, 'Route secondaire 111 Zenata Ain sebaa', '', 20250, '0522672983', 'adelma.schain@gmail.com', '', 0, 1, '2019-11-26 14:56:09', 'SANAA', 'FARAH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(658, 'Zone Franche d\'exploitation de Tanger', 'llot nº15, Lot Nº8 - Km 13, Route de Rabat', 90000, '0539 309 213 ', 'ikram.salih@coficab.com', '', 0, 1, '2019-11-28 08:35:37', 'Ikram', 'SALIH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(659, 'AV FAR CENTRE COMMERICAL OPERA N°17', '', 39040, '0661995430', 'Bensaid@blueit.ma', '', 0, 1, '2019-12-05 04:42:02', 'MOHAMED', 'BEN SAID', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(660, 'golden tower B1/5 centre urbain nord tunis', '', 1002, '0021671906901', 'aida.kallel@planet.tn', '', 0, 1, '2019-12-18 23:22:15', 'mohamed', 'frikha', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(661, '28, rue de Provins, appt. n°10 Bélvédère ', '', 20300, '00212660234005', 'z.ouhra@sofim.ma', '', 0, 1, '2020-01-22 19:25:39', 'ZOUHRA', 'SOFIM', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(663, '4, Rue de l\'Imam Mouslim, Oasis', '', 20100, '0669528175', 'najwa.bellali@tgcc.ma', '', 0, 1, '2020-01-29 10:29:12', 'Najwa', 'BELLALI', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(664, 'Résidence fal attissir imm 115apt14 benmsick', '', 20000, '0663240208', 'koumennegoce@gmail.com', '', 0, 1, '2020-02-12 10:22:37', 'Abderrahim', 'Mendour', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(665, '116 Lot Salam 1 Ext, El Jadida.', '', 24030, '+212 619 200 256', 'sgiea.maroc@gmail.com', '', 0, 1, '2020-03-18 10:37:17', 'Mustapha', 'Belaziri', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL),
(682, '36, rue imam al boukhari maarif', '', NULL, '+212696318051', 'ha1@3findustrie.com', '$2y$13$wDlkV0UN8hct4MdEkk38FeFq7WFkkgW921uolU/s53/OgJeHHYwMi', 0, 1, '2020-06-05 16:19:56', 'Compte', 'Acheteur', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard_ac', NULL, NULL),
(684, '36, rue imam al boukhari maarif', '', NULL, '+212696318051', 'frs2@3findustrie.com', '$2y$13$ilKL3UXu8qGlb1cJqo/VhecGWg.3M0/pd4/vttddnvv.h/ruSO9vC', 0, 1, '2020-06-05 16:26:57', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `del` tinyint(1) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `name`, `pays_id`, `del`, `slug`) VALUES
(1, 'Casablanca', 144, 0, 'casablanca'),
(2, 'Rabat', 144, 0, 'rabat'),
(5, 'Fès', 144, 0, 'fes'),
(6, 'Meknes', 144, 0, 'meknes'),
(7, 'Tanger', 144, 0, 'tanger'),
(8, 'Oujda', 144, 0, 'oujda'),
(9, 'Kenitra', 144, 0, 'kenitra'),
(10, 'Sale', 144, 0, 'sale'),
(11, 'Ifrane', 144, 0, 'ifrane'),
(12, 'Marrakech', 144, 0, 'marrakech'),
(13, 'Agadir', 144, 0, 'agadir'),
(14, 'Safi', 144, 0, 'safi'),
(15, 'Settat', 144, 0, 'settat'),
(17, 'Dakhla', 144, 0, 'dakhla'),
(19, 'Azilal', 144, 0, 'azilal'),
(20, 'Berkane', 144, 0, 'berkane'),
(21, 'Nador', 144, 0, 'nador'),
(22, 'Hoceïma', 144, 0, 'hoceïma'),
(23, 'Berrechid', 144, 0, 'berrechid'),
(25, 'Temara', 144, 0, 'temara'),
(26, 'Khouribga', 144, 0, 'khouribga'),
(27, 'Beni Mellal', 144, 0, 'beni-mellal'),
(28, 'Guelmim', 144, 0, 'guelmim'),
(29, 'Tétouan', 144, 0, 'tetouan'),
(30, 'Assila', 144, 0, 'assila'),
(31, 'Mohammadia', 144, 0, 'mohammadia'),
(32, 'Bouskoura', 144, 0, 'bouskoura'),
(33, 'Paris', 75, 0, 'paris'),
(34, 'El jadida', 144, 0, 'el-jadida'),
(35, 'Chefchaouen', 144, 0, 'chefchaouen'),
(40, 'California', 231, 0, 'california'),
(41, 'Ouezzane', 144, 0, 'ouezzane'),
(42, 'Ris-Orangis', 75, 0, 'ris-orangis'),
(43, 'Wasselonne', 75, 0, 'wasselonne'),
(44, 'Charleroi', 18, 0, 'charleroi'),
(46, 'Berne', 210, 0, 'berne'),
(47, 'Shanghai', 44, 0, 'shanghai'),
(48, 'Valladolid', 203, 0, 'valladolid'),
(49, 'Sarasse', 203, 0, 'sarasse'),
(50, 'Sainte-Florence', 75, 0, 'sainte-florence'),
(51, 'Valls', 203, 0, 'valls'),
(52, 'Brive-la-Gaillarde', 75, 0, 'brive-la-gaillarde'),
(53, 'Albolote', 203, 0, 'albolote'),
(54, 'Oullins', 75, 0, 'oullins'),
(55, 'Alger', 4, 0, 'alger'),
(56, 'Sidi Addi', 144, 0, 'sidi-addi'),
(57, 'Balma', 75, 0, 'balma'),
(58, 'Oulad Teïma', 144, 0, 'oulad-teïma'),
(59, 'Mary-sur-Marne', 75, 0, 'mary-sur-marne'),
(60, 'Mions', 75, 0, 'mions'),
(62, 'La Ciotat', 75, 0, 'la-ciotat'),
(63, 'Abidjan', 110, 0, 'abidjan'),
(64, 'Caissargues', 75, 0, 'caissargues'),
(65, 'Gargas', 75, 0, 'gargas'),
(66, 'Villejust', 75, 0, 'villejust'),
(67, 'Yutz', 75, 0, 'yutz'),
(68, 'Chambéry', 75, 0, 'chambery'),
(69, 'Le Mans', 75, 0, 'le-mans'),
(70, 'Gif-sur-Yvette', 75, 0, 'gif-sur-yvette'),
(71, 'Arnas', 75, 0, 'arnas'),
(72, 'Had Soualem', 144, 0, 'had-soualem'),
(73, 'Caromb', 75, 0, 'caromb'),
(74, 'Rumilly', 75, 0, 'rumilly'),
(75, 'Bursa', 220, 0, 'bursa'),
(76, 'Neuilly-Plaisance', 75, 0, 'neuilly-plaisance'),
(77, 'Versailles', 75, 0, 'versailles'),
(78, 'Santo Ángel', 203, 0, 'santo-ángel'),
(79, 'Séville', 203, 0, 'seville'),
(80, 'Boujdour', 144, 0, 'boujdour'),
(81, 'Roubaix', 75, 0, 'roubaix'),
(82, 'Neuilly-sur-Seine', 75, 0, 'neuilly-sur-seine'),
(83, 'Caraglio', 109, 0, 'caraglio'),
(84, 'Prouvy', 75, 0, 'prouvy'),
(85, 'Nouaceur', 144, 0, 'nouaceur'),
(86, 'Cugand', 75, 0, 'cugand'),
(87, 'Aït Melloul', 144, 0, 'aït-melloul'),
(89, 'Cenon', 75, 0, 'cenon'),
(90, 'Canton', 44, 0, 'canton'),
(92, 'Guimarães', 175, 0, 'guimarães'),
(93, 'Frans', 75, 0, 'frans'),
(97, 'Prešov', 197, 0, 'prešov'),
(98, 'Laâyoune', 144, 0, 'laayoune'),
(101, 'Londres', 228, 0, 'londres'),
(102, 'Soisy-sous-Montmoren', 75, 0, 'soisy-sous-montmoren'),
(103, 'Bamako', 134, 0, 'bamako'),
(104, 'Cotonou', 59, 0, 'cotonou'),
(105, 'Saint-Laurent-du-Var', 75, 0, 'saint-laurent-du-var'),
(106, 'Clervaux', 128, 0, 'clervaux'),
(107, 'Suntec', 196, 0, 'suntec'),
(108, 'Sarcedo', 109, 0, 'sarcedo'),
(109, 'Ludhiana', 103, 0, 'ludhiana'),
(110, 'Conakry', 94, 0, 'conakry'),
(111, 'Khenifra', 144, 0, 'khenifra'),
(112, 'Tunis', 219, 0, 'tunis'),
(113, 'Autre', NULL, 0, 'autre'),
(114, 'azai', 1, 0, 'azai'),
(115, 'OutData', 2, 0, 'outdata');

-- --------------------------------------------------------

--
-- Structure de la table `zone_commercial`
--

CREATE TABLE `zone_commercial` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `zone_commercial_pays`
--

CREATE TABLE `zone_commercial_pays` (
  `zone_commercial_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_497DD634989D9B62` (`slug`),
  ADD KEY `indexes_categorie` (`name`),
  ADD KEY `indexes_categorie2` (`del`);

--
-- Index pour la table `categorie_sous_secteur`
--
ALTER TABLE `categorie_sous_secteur`
  ADD PRIMARY KEY (`categorie_id`,`sous_secteur_id`),
  ADD KEY `IDX_DA4F1BD0BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_DA4F1BD0790611EF` (`sous_secteur_id`);

--
-- Index pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commercial_ville`
--
ALTER TABLE `commercial_ville`
  ADD PRIMARY KEY (`commercial_id`,`ville_id`),
  ADD KEY `IDX_6CBDDBE27854071C` (`commercial_id`),
  ADD KEY `IDX_6CBDDBE2A73F0036` (`ville_id`);

--
-- Index pour la table `condition_generale`
--
ALTER TABLE `condition_generale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5E5B29FB989D9B62` (`slug`);

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
-- Index pour la table `demande_abonnement_sous_secteur`
--
ALTER TABLE `demande_abonnement_sous_secteur`
  ADD PRIMARY KEY (`demande_abonnement_id`,`sous_secteur_id`),
  ADD KEY `IDX_7D877B8F415015A3` (`demande_abonnement_id`),
  ADD KEY `IDX_7D877B8F790611EF` (`sous_secteur_id`);

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
-- Index pour la table `demande_ha_categories`
--
ALTER TABLE `demande_ha_categories`
  ADD PRIMARY KEY (`demande_achat_id`,`categorie_id`),
  ADD KEY `IDX_6ACB399AB8CC98D5` (`demande_achat_id`),
  ADD KEY `IDX_6ACB399ABCF5E72D` (`categorie_id`);

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
-- Index pour la table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E8FF75CCBCF5E72D` (`categorie_id`);

--
-- Index pour la table `faq_categorie`
--
ALTER TABLE `faq_categorie`
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
  ADD KEY `indexe_societe` (`societe_lower`(191)),
  ADD KEY `indexe_fournisseur` (`societe`(191));

--
-- Index pour la table `fournisseur_categories`
--
ALTER TABLE `fournisseur_categories`
  ADD PRIMARY KEY (`fournisseur_id`,`categorie_id`),
  ADD KEY `IDX_7D619F3670C757F` (`fournisseur_id`),
  ADD KEY `IDX_7D619F3BCF5E72D` (`categorie_id`);

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
-- Index pour la table `image_secteur`
--
ALTER TABLE `image_secteur`
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
  ADD KEY `IDX_29A5EC27A6E44244` (`pays_id`),
  ADD KEY `indexes_produit` (`titre`),
  ADD KEY `indexes_produit2` (`is_valid`),
  ADD KEY `indexes_produit3` (`del`),
  ADD KEY `indexes_p_title` (`titre_lower`),
  ADD KEY `IDX_29A5EC27A73F0036` (`ville_id`);

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
  ADD UNIQUE KEY `UNIQ_8045251F989D9B62` (`slug`),
  ADD KEY `IDX_8045251F3DA5256D` (`image_id`);

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
  ADD KEY `indexe_ss_name` (`name_lower`),
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
  ADD KEY `indexes_user` (`del`),
  ADD KEY `indexes_user2` (`isactif`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_43C3D9C3989D9B62` (`slug`),
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
  ADD PRIMARY KEY (`zone_commercial_id`,`pays_id`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT pour la table `actualite_image`
--
ALTER TABLE `actualite_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `attachement`
--
ALTER TABLE `attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `black_listes`
--
ALTER TABLE `black_listes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=379;

--
-- AUTO_INCREMENT pour la table `condition_generale`
--
ALTER TABLE `condition_generale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `contact_fournisseur`
--
ALTER TABLE `contact_fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `demande_abonnement`
--
ALTER TABLE `demande_abonnement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT pour la table `demande_devis`
--
ALTER TABLE `demande_devis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande_jeton`
--
ALTER TABLE `demande_jeton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `detail_visite`
--
ALTER TABLE `detail_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT pour la table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `faq_categorie`
--
ALTER TABLE `faq_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `fiche`
--
ALTER TABLE `fiche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `historique_visite`
--
ALTER TABLE `historique_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `image_produit`
--
ALTER TABLE `image_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `image_secteur`
--
ALTER TABLE `image_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeton`
--
ALTER TABLE `jeton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `select_produit`
--
ALTER TABLE `select_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT pour la table `suggestion_secteur`
--
ALTER TABLE `suggestion_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=708;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

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
-- Contraintes pour la table `categorie_sous_secteur`
--
ALTER TABLE `categorie_sous_secteur`
  ADD CONSTRAINT `FK_DA4F1BD0790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DA4F1BD0BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE;

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
-- Contraintes pour la table `demande_abonnement_sous_secteur`
--
ALTER TABLE `demande_abonnement_sous_secteur`
  ADD CONSTRAINT `FK_7D877B8F415015A3` FOREIGN KEY (`demande_abonnement_id`) REFERENCES `demande_abonnement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7D877B8F790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE;

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
-- Contraintes pour la table `demande_ha_categories`
--
ALTER TABLE `demande_ha_categories`
  ADD CONSTRAINT `FK_6ACB399AB8CC98D5` FOREIGN KEY (`demande_achat_id`) REFERENCES `demande_achat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6ACB399ABCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE;

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
-- Contraintes pour la table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `FK_E8FF75CCBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `faq_categorie` (`id`);

--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `FK_369ECA3238248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_369ECA32A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_369ECA32A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_369ECA32BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fournisseur_categories`
--
ALTER TABLE `fournisseur_categories`
  ADD CONSTRAINT `FK_7D619F3670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7D619F3BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `FK_29A5EC27A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_29A5EC27D7BD44DD` FOREIGN KEY (`sous_secteurs_id`) REFERENCES `sous_secteur` (`id`);

--
-- Contraintes pour la table `produit_image_produit`
--
ALTER TABLE `produit_image_produit`
  ADD CONSTRAINT `FK_92EB1D2563EA69CD` FOREIGN KEY (`image_produit_id`) REFERENCES `image_produit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_92EB1D25F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD CONSTRAINT `FK_8045251F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image_secteur` (`id`);

--
-- Contraintes pour la table `select_produit`
--
ALTER TABLE `select_produit`
  ADD CONSTRAINT `FK_F7E2627EF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
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

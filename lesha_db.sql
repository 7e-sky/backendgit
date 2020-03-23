-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 23 mars 2020 à 15:21
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

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`id`, `offre_id`, `demande_id`, `fournisseur_id`, `zone_id`, `commercial_id`, `mode_id`, `reference`, `statut`, `prix`, `created`, `expired`, `date_peiment`, `duree_id`, `remise`, `currency_id`, `commentaire`) VALUES
(1, 1, 1, 82, NULL, NULL, 1, 'A-2020-1', 1, 1440, '2020-03-18 18:19:41', '2021-03-18 18:19:41', '2020-03-18 18:19:41', 1, 0, 11, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `abonnement_sous_secteur`
--

CREATE TABLE `abonnement_sous_secteur` (
  `abonnement_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abonnement_sous_secteur`
--

INSERT INTO `abonnement_sous_secteur` (`abonnement_id`, `sous_secteur_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(2, 6),
(2, 9),
(3, 6),
(3, 9),
(4, 6),
(4, 9),
(5, 6),
(5, 9),
(6, 6),
(6, 7),
(6, 9),
(7, 6),
(7, 7),
(8, 6),
(8, 7),
(9, 8),
(9, 270),
(10, 6),
(10, 8),
(11, 7),
(11, 270),
(12, 7),
(12, 8),
(12, 18),
(13, 6),
(13, 7),
(14, 7),
(15, 6),
(15, 7),
(16, 6),
(16, 7),
(16, 9),
(17, 6),
(17, 8),
(17, 9),
(17, 11),
(19, 6),
(19, 7),
(20, 6),
(21, 6),
(21, 7),
(22, 6),
(23, 6),
(24, 6),
(25, 6),
(26, 6),
(27, 6),
(28, 6);

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
(80, 2, 33, '7e-sky', NULL, 'M.', '123456789123456', '', '', '', 1, 1),
(87, 1, 1, 'Nulla mollit eos ea', NULL, 'M.', '123456789954412', '+212522963180', 'http://www.3fi.com', '', 1, 11);

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
(1, 1, 'Familliarisation moteur / Propulseur', '<p><strong>3F Industrie</strong> a choisi de se positionner sur le secteur de la logistique en mettant à la disposition de ce dernier les meilleures fournisseurs tout en respectant les normes les plus sévères et les plus demandées par les donneurs d’ordres les plus exigeants. Notre objectif est d’offrir à nos clients une qualité de service qui s’inscrit dans une amélioration continue.</p><p>Rayonnage et système de stockage : Rayonnage à palettes : Conventionnel, Accumulation, Mobile, Dynamique. Rayonnage pour archive, charge légère et lourde plateforme sur deux ou trois niveaux pour une optimisation maximale rayonnage cantilever pour des charges longues, lourdes et volumineuses.</p><p>Rayonnage mobile pour archive documents et œuvres d’art. Intervention sur tout type de rayonnage pour démontage remontage et divers modifications de niveaux ou d’implantation. Notre savoir-faire nous a permis d’avoir la confiance de nombreuses entreprises dans différents secteurs d’activité : Alimentaire, Industriel, Logistique, Distribution…</p>', '2020-03-10 14:39:39', 0, NULL, 'http://www.exemple.com', 'familliarisation-moteur-propulseur'),
(2, 2, 'Familliarisation moteur / Propulseur', '<figure class=\"image\"><img src=\"/userfiles/images/icon.png\"><figcaption>dddddd</figcaption></figure>', '2020-03-11 15:38:01', 1, NULL, 'http://www.exemple.com', 'familliarisation-moteur-propulseur-1'),
(3, 3, 'SILEX : COMMENT LE COVID-19 GAGNE LE MONDE DU SOURCING', '<p>&nbsp;</p><figure class=\"image image-style-side\"><img src=\"http://localhost:8000/userfiles/images/carac_vignette_1(1).png\"></figure><h4><strong>Silex, cette dynamique petite startup leader du sourcing cognitif, a fait une petite découverte qu’elle partage aujourd’hui avec les lecteurs de la Lettre des Achats : une hausse exceptionnelle de l’activité liée aux recherches de masques respiratoires et de solutions virucides sur son site. Résultat : une liste en exclusivité de fournisseurs potentiels !</strong></h4><p>&nbsp;</p><p>&nbsp;</p><p>Les lecteurs réguliers de La Lettre des Achats connaissent bien <a href=\"https://www.silex-france.com/silex/\">Silex</a> dont le savoir-faire technologique (IA et Data) fait de cette petite équipe un leader… du sourcing cognitif. Pour faire simple&nbsp;: vous tapez votre recherche en langage naturel, vous récupérez une liste de fournisseurs à partager (workflow) avec vos correspondants dans l’entreprise. Chaque mois, leurs équipes produisent pour nous un état des recherches exprimés sur leur site selon la catégorie d’achats visée (rubrique Marchés).</p><p>Le Covid-19 touche autant les acteurs publics que les entreprises du privé. Les spécialistes datas de Silex ont pensé utile cette fois de rendre public une petite étude sectorielle sur un segment Achats&nbsp;bien particulier&nbsp;: &nbsp;masques respiratoires et autres solutions virucides. Résultat&nbsp;: une liste exhaustive de fournisseurs français issus de leurs panels qu’ils partagent ici. Près de 80 en tout avec leurs coordonnées. Un sacré gain de temps s’il fallait une démonstration &nbsp;(Pdf en Pj). A lire et conserver…</p><p>Les lecteurs réguliers de La Lettre des Achats connaissent bien <a href=\"https://www.silex-france.com/silex/\">Silex</a> dont le savoir-faire technologique (IA et Data) fait de cette petite équipe un leader… du sourcing cognitif. Pour faire simple&nbsp;: vous tapez votre recherche en langage naturel, vous récupérez une liste de fournisseurs à partager (workflow) avec vos correspondants dans l’entreprise. Chaque mois, leurs équipes produisent pour nous un état des recherches exprimés sur leur site selon la catégorie d’achats visée (rubrique Marchés).</p><p>Le Covid-19 touche autant les acteurs publics que les entreprises du privé. Les spécialistes datas de Silex ont pensé utile cette fois de rendre public une petite étude sectorielle sur un segment Achats&nbsp;bien particulier&nbsp;: &nbsp;masques respiratoires et autres solutions virucides. Résultat&nbsp;: une liste exhaustive de fournisseurs français issus de leurs panels qu’ils partagent ici. Près de 80 en tout avec leurs coordonnées. Un sacré gain de temps s’il fallait une démonstration &nbsp;(Pdf en Pj). A lire et conserver…</p>', '2020-03-11 16:23:53', 1, NULL, 'https://www.lettredesachats.com/e-docs/silex_comment_le_covid_19_gagne_le_monde_du_sourcing_26441/document_article_web.phtml', 'silex-comment-le-covid-19-gagne-le-monde-du-sourcing'),
(4, 4, 'Familliarisation moteur / Propulseur', '<h4><strong>Silex, cette dynamique petite startup leader du sourcing cognitif, a fait une petite découverte qu’elle partage aujourd’hui avec les lecteurs de la Lettre des Achats : une hausse exceptionnelle de l’activité liée aux recherches de masques respiratoires et de solutions virucides sur son site. Résultat : une liste en exclusivité de fournisseurs potentiels</strong></h4><p>&nbsp;</p><figure class=\"image image-style-side\"><img src=\"http://localhost:8000/userfiles/images/carac_vignette_1(3).png\"><figcaption>TEST</figcaption></figure><blockquote><p><strong>L</strong>es lecteurs réguliers de La Lettre des Achats connaissent bien <a href=\"https://www.silex-france.com/silex/\">Silex</a> dont le savoir-faire technologique (IA et Data) fait de cette petite équipe un leader… du sourcing cognitif. Pour faire simple&nbsp;: vous tapez votre recherche en langage naturel, vous récupérez une liste de fournisseurs à partager (workflow) avec vos correspondants dans l’entreprise. Chaque mois, leurs équipes produisent pour nous un état des recherches exprimés sur leur site selon la catégorie d’achats visée (rubrique Marchés).</p></blockquote><p>Le Covid-19 touche autant les acteurs publics que les entreprises du privé. Les spécialistes datas de Silex ont pensé utile cette fois de rendre public une petite étude sectorielle sur un segment Achats&nbsp;bien particulier&nbsp;: &nbsp;masques respiratoires et autres solutions virucides. Résultat&nbsp;: une liste exhaustive de fournisseurs français issus de leurs panels qu’ils partagent ici. Près de 80 en tout avec leurs coordonnées. Un sacré gain de temps s’il fallait une démonstration &nbsp;(Pdf en Pj). A lire et conserver…</p><p>Les lecteurs réguliers de La Lettre des Achats connaissent bien <a href=\"https://www.silex-france.com/silex/\">Silex</a> dont le savoir-faire technologique (IA et Data) fait de cette petite équipe un leader… du sourcing cognitif. Pour faire simple&nbsp;: vous tapez votre recherche en langage naturel, vous récupérez une liste de fournisseurs à partager (workflow) avec vos correspondants dans l’entreprise. Chaque mois, leurs équipes produisent pour nous un état des recherches exprimés sur leur site selon la catégorie d’achats visée (rubrique Marchés).</p><p>Le Covid-19 touche autant les acteurs publics que les entreprises du privé. Les spécialistes datas de Silex ont pensé utile cette fois de rendre public une petite étude sectorielle sur un segment Achats&nbsp;bien particulier&nbsp;: &nbsp;masques respiratoires et autres solutions virucides. Résultat&nbsp;: une liste exhaustive de fournisseurs français issus de leurs panels qu’ils partagent ici. Près de 80 en tout avec leurs coordonnées. Un sacré gain de temps s’il fallait une démonstration &nbsp;(Pdf en Pj). A lire et conserver…</p>', '2020-03-11 18:35:42', 1, NULL, 'http://www.exemple.com', 'familliarisation-moteur-propulseur-2');

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
(1, '5e67988e4415e312365451.jpg'),
(2, '5e68f7a4e64e2531032195.png'),
(3, '5e690280d0a25530542989.png'),
(4, '5e69216813bca303054820.png');

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
(100, '5e6234a9386e8996546384.jpg', 96731, 'image/jpeg');

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
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `sous_secteur_id` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `sous_secteur_id`, `name`, `del`, `slug`) VALUES
(1, 2, 'Catégorie2', 0, 'categorie2'),
(2, 1, 'Catégorie1', 0, 'categorie1'),
(3, 1, 'Catégorie3', 0, 'categorie3'),
(4, 1, 'Catégorie4', 0, 'categorie4'),
(6, 1, 'Catégorie5', 0, 'categorie5'),
(7, 1, 'Catégorie6', 0, 'categorie6'),
(8, 2, 'Catégorie7', 0, 'categorie7'),
(9, 2, 'Catégorie8', 0, 'categorie8'),
(10, 2, 'Catégorie9', 0, 'categorie9'),
(11, 2, 'Catégorie10', 0, 'categorie10'),
(13, 14, 'Catégorie100', 0, 'categorie100'),
(14, 14, 'Catégorie101', 0, 'categorie101'),
(15, 2, 'Catégorie102', 0, 'categorie102'),
(16, 14, 'Catégorie103', 0, 'categorie103'),
(17, 14, 'Catégorie104', 0, 'categorie104'),
(18, 14, 'Catégorie105', 0, 'categorie105'),
(19, 14, 'Catégorie106', 0, 'categorie106'),
(20, 14, 'Catégorie107', 0, 'categorie107'),
(21, 13, 'Catégorie108', 0, 'categorie108'),
(22, 13, 'Catégorie109', 0, 'categorie109'),
(23, 13, 'Catégorie110', 0, 'categorie110'),
(24, 13, 'Catégorie111', 0, 'categorie111'),
(25, 13, 'Catégorie112', 0, 'categorie112');

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

--
-- Déchargement des données de la table `demande_abonnement`
--

INSERT INTO `demande_abonnement` (`id`, `offre_id`, `fournisseur_id`, `zone_id`, `commercial_id`, `reference`, `statut`, `created`, `mode_id`, `duree_id`, `prix`, `currency`) VALUES
(1, 1, 82, NULL, NULL, 'D-2020-1', 1, '2020-03-18 18:15:48', 1, 1, 1440, 'DHS');

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
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande_achat`
--

INSERT INTO `demande_achat` (`id`, `acheteur_id`, `statut`, `reference`, `description`, `date_expiration`, `is_public`, `nbr_visite`, `nbr_share`, `created`, `date_modification`, `is_alerted`, `is_anonyme`, `budget`, `del`, `motif_rejet_id`, `currency_id`, `titre`, `pays`, `ville`, `slug`) VALUES
(19, 87, 1, '2020-1', 'Bonjour, \r\nMerci de m\'envoyer votre meilleures offre de prix, pour des Boîtes d\'attente pour le béton armé de type GAMMBOX 2 , Fiche technique en pièce joint \r\nQuantité: 6500ml', '2020-03-06 22:50:00', 1, 0, 0, '2020-03-06 12:32:01', '2020-03-06 15:22:45', 0, 0, 76, 0, NULL, 11, 'Quis esse praesentiu', 'Maroc', 'Casablanca', 'quis-esse-praesentiu'),
(20, 80, 1, '2020-12', 'AAAAAA\r\n\r\nS\r\nS\r\n\r\n\r\nSSSSSSSS', '2020-03-17 00:00:00', 1, 0, 0, '2020-03-10 00:00:00', '2020-03-11 00:00:00', 0, 0, 9000, 0, NULL, 8, 'Titre One', 'France', 'Paris', 'titre-one');

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
(19, 94),
(19, 99),
(19, 100);

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
(1, 1),
(1, 2),
(1, 3);

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
(1, 19),
(2, 19),
(3, 19),
(4, 19);

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
(1, '5e734dd8da310314331334.pdf', 97055, 'application/pdf');

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
(82, 1, 1, '3f industrie', 'M.', '123456789954412', '', '', '3F Industrie a choisi de se positionner sur le secteur de la logistique en mettant à la disposition de ce dernier les meilleures fournisseurs tout en respectant les normes les plus sévères et les plus demandées par les donneurs d’ordres les plus exigeants. Notre objectif est d’offrir à nos clients une qualité de service qui s’inscrit dans une amélioration continue.\r\n\r\nRayonnage et système de stockage : Rayonnage à palettes : Conventionnel, Accumulation, Mobile, Dynamique. Rayonnage pour archive, charge légère et lourde plateforme sur deux ou trois niveaux pour une optimisation maximale rayonnage cantilever pour des charges longues, lourdes et volumineuses.\r\n\r\nRayonnage mobile pour archive documents et œuvres d’art. Intervention sur tout type de rayonnage pour démontage remontage et divers modifications de niveaux ou d’implantation. Notre savoir-faire nous a permis d’avoir la confiance de nombreuses entreprises dans différents secteurs d’activité : Alimentaire, Industriel, Logistique, Distribution…', 11, '3f-industrie', 1),
(83, 1, 1, '3f industrie', 'M.', '123456789954412', '', 'http://www.3fi.com', 'azazaza az a zda', 11, '3f-industrie-1', 0),
(84, NULL, NULL, '3f industrie', 'M.', NULL, NULL, NULL, NULL, NULL, '3f-industrie-2', 0),
(85, 1, 1, '3f industrie', 'M.', '123456789954412', '', '', '', 1, '3f-industrie-3', 0),
(86, 1, 1, '3f industrie', 'M.', '123456789954412', '', 'http://www.3fi.com', '', 11, '3f-industrie-4', 0);

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
(82, 1),
(82, 2),
(82, 3);

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
(1, '5e734dd011df7625102629.png');

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
('20200309165056', '2020-03-09 16:51:08'),
('20200318152902', '2020-03-18 15:29:14'),
('20200318173643', '2020-03-18 17:36:54');

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
(2, 'France', 0, 'france');

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
  `phone_vu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `secteur_id`, `sous_secteurs_id`, `fournisseur_id`, `fiche_technique_id`, `reference`, `description`, `pu`, `del`, `is_select`, `is_valid`, `created`, `videos`, `categorie_id`, `featured_image_id_id`, `titre`, `currency_id`, `date_validation`, `pays_id`, `slug`, `phone_vu`) VALUES
(1, 1, 2, 82, 1, 'Sit perspiciatis n', 'Eu eveniet aut impe', 23, 0, 0, 1, '2020-03-19 11:48:25', 'TblwGcIbZnM', 1, 1, 'Modi sed dolores sit', 11, '2020-03-19 11:49:54', NULL, 'modi-sed-dolores-sit', 1);

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
(1, 1);

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
(1, 'Secteur X', 0, 'secteur-x'),
(2, 'Secteur Y', 0, 'secteur-y');

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
(1, 1, '2020-03-19 11:53:33');

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
(1, 'Sous-secteur x1', 0, 1, NULL, 'sous-secteur-x1'),
(2, 'Sous-secteur x2', 0, 1, NULL, 'sous-secteur-x2'),
(3, 'Sous-secteur y1', 0, 2, NULL, 'sous-secteur-y1'),
(4, 'Sous-secteur y2', 0, 2, NULL, 'sous-secteur-y2'),
(5, 'Catégorie 1 x1', 0, 1, 1, 'categorie-1-x1'),
(6, 'Catégorie 2 x1', 0, 1, 1, 'categorie-2-x1'),
(7, 'Catégorie 1 x2', 0, 1, 2, 'categorie-1-x2'),
(8, 'Catégorie 2 x2', 0, 1, 2, 'categorie-2-x2'),
(9, 'Catégorie 1 y1', 0, 2, 3, 'categorie-1-y1'),
(10, 'Catégorie 2 y2', 0, 2, 3, 'categorie-2-y1'),
(11, 'Catégorie 1 y2', 0, 2, 4, 'categorie-1-y2'),
(12, 'Catégorie 2 y2', 0, 2, 4, 'categorie-é-y2'),
(13, 'Sous-secteur x3', 0, 1, NULL, 'sous-secteur-x3'),
(14, 'Sous-secteur x4', 0, 1, NULL, 'sous-secteur-x4'),
(15, 'Sous-secteur x5', 0, 1, NULL, 'sous-secteur-x5');

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
  `redirect` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `adresse1`, `adresse2`, `codepostal`, `phone`, `email`, `password`, `del`, `isactif`, `created`, `first_name`, `last_name`, `username`, `discr`, `roles`, `password_change_date`, `parent1`, `confirmation_token`, `avatar_id`, `redirect`) VALUES
(1, '36, rue imam al boukhari maarif', 'HAY EL KHAIR_2', 20370, '+212696318051', 'webmasster@3findustrie.com', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 1, 1, '2019-08-05 17:01:48', 'YOUNESS', 'ARBOUH', 'unessami', 'Admin', 'ROLE_ADMIN', 1565020062, NULL, 'ljmRxc&Jmrgox3ZYugIYQiSzqheC4N', 1, '/dashboard'),
(2, 'HAY EL KHAIRàà', 'HAY EL KHAIR', 26000, '+212696318051', 'youness.arbouh1s@gmail.com', '$2y$13$uXkilBRFzlnwOFN7VHPkXucJ1Iz3R1IoLSvAsec3pnJlitBXcpYee', 0, 1, '2019-08-05 17:16:12', 'firstAcheteur', 'lastAcheteur', 'acheteur', 'Acheteur', 'ROLE_ACHETEUR', 1565020457, NULL, 'E.4rYgkSwxyIdaEBZpeXHmS&WON44t', 1, '/dashboard_ac'),
(4, 'HAY EL KHA22IR', 'cmrsoia cmrsoi2a', 2622820, '+212696318051', 'youness.arbouh4@gmail.com', '$2y$13$D5ucNPg0F4x3NASOS4VYgOPcbK.jT6aW4nmMn42ZBadntqFSZFM1W', 0, 1, '2019-08-05 17:30:47', 'cmrsoia2222', 'cmrsoi2a2223', 'cmrsoia22222d', 'ZoneCommercial', 'ROLE_ZONE', 1565078960, NULL, 'HnmaGHUOcAiIecY01yyGKTw@pDugWR', 1, ''),
(5, 'HAY EL 00', 'HAY EL 11', 26400, '+212696318051', 'youness.arbouh5@gmail.com_deleted-5', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 1, 0, '2019-08-05 17:32:07', 'Commerc_107', 'Commerciale_107', 'cmrciale_107_deleted-5', 'ZoneCommercial', 'ROLE_ZONE', 1565079056, 1, 'mZiQL@&239srr1aa95P&EuJwWCNZfP', 1, ''),
(6, 'HAY EL KHAIRqqq1', 'HAY EL qqqqqqqqq1', 26600, '+212696318051', 'youness.arbouh6@gmail.com', '$2y$13$.kjXEmyAnYvRpqhuqKC7te0B2PKlt7aCKkwgIt.IhJbUKnkXbIBHe', 0, 1, '2019-08-05 17:38:54', 'Commerc_2', 'Commerciale_2', 'cmrciale_2', 'Commercial', 'ROLE_COMMERCIAL', NULL, 1, 'MPsPbG9uMXgReM4P66K0zBgW7cxW&g', 31, ''),
(7, 'HAY EL KHAIRqsdfsdfsdfsdqq1', 'HAY EL qqqqqsdfqqqq1', 266100, '+212696318051', 'youness.arbouh7@gmail.com', '$2y$13$sRp0FwPwQD5Y6zCCp5IQjOQzOXvvrP5UgP8r4wfB2/cU8EXYiJfmW', 0, 0, '2019-08-05 17:40:05', 'Commerciale', 'Commerciale_ok', 'cmrciale_chaalali', 'Commercial', 'ROLE_COMMERCIAL', NULL, 1, 'Q8GJ@OVh@&7F.q5EjZ02Yp7wPb9HBp', 1, ''),
(9, 'HAY EL KHA22IR', 'cmrsoia cmrsoi2a', 2622820, '+212696318051', 'youness.arbouh81@gmail.com', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 0, 1, '2019-08-06 09:57:42', 'cmrsoia2222', 'cmrsoi2a2223', 'cmrsoia22222', 'Commercial', 'ROLE_COMMERCIAL', NULL, 5, 'cgmFMjrz4HE41YOihJyJgXWEp7Jh8w', 1, ''),
(10, '36, rue imam al boukhari maarif', '', 20370, '+212696318051', 'youness.arbouh55@gmail.com', '$2y$13$H./PWBuS/z5G4Zb2vnhUUeecSGafd4WpT6HOKJdB2aLajgV2sV57q', 0, 1, '2019-08-06 10:59:17', 'YOUNESS', 'ARBOUH', 'unessami1253', 'Admin', 'ROLE_ADMIN', 1569857840, NULL, 'lcL6@PnSmZRYWhJ0iWbX8cygti4tnj', 26, '/dashboard'),
(11, 'aaaaaa', NULL, 110055, '+212696318051', 'youness.aaaaa_deleted-11', '$2y$13$EZRR7o1ht29aWb3gr4L23ucEZ1HBcEeeTmm2zf9WayviOR/rVg4xa', 1, 0, '2019-08-06 17:06:31', 'aaaaaaaa', 'aaaaaa', 'aaaaaa_deleted-11', 'Admin', 'ROLE_ADMIN', NULL, NULL, 'iUXeb8wKsOdjYEcnnxQHOGWzexX4mt', NULL, ''),
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
(68, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhdf@gmail.com', '$2y$13$U86NTGZtfq708W56jTUF4O5p1BNRqBpZxRPRF29KMzBzqBIxaU.sG', 0, 1, '2019-11-05 10:03:35', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(69, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhgh@gmail.com', '$2y$13$tjXGiJD./0qq6aGSbBUiou8VfMfV5cO3PvbzYXPwo.wVxMZB9AfX.', 0, 1, '2019-11-05 10:42:39', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(70, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhcc@gmail.com', '$2y$13$L/7EhA8GTglr6gRniYhdA.SVZlozETjA5Fnllj5mBuhRTDbMxdq8W', 0, 1, '2019-11-05 10:46:13', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(71, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhsd@gmail.com', '$2y$13$14HI/1V4MUyTFoLxZn76iuOOkgHSYPIk6kv9G0TQjF1F4lnzLwiNK', 0, 1, '2019-11-05 11:04:11', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(72, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhdfg@gmail.com', '$2y$13$Rs/FDPO.vKtbYKE5gzNdl.R1ANygr/23DkGQuuLDIaUqhb5RibHVm', 0, 1, '2019-11-05 11:09:13', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(73, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arboullllllllllh@gmail.com', '$2y$13$uCucAmjImgBX7VNOVHBfWuXsAgDra9E7Spg2h.o0zjlSxlMUBXcke', 0, 1, '2019-11-05 11:11:44', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(74, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouhjikjlkl@gmail.com', '$2y$13$gG.Dj.Lpn/m9JPNKtUpcbeZDjA2HCecBOAJaRnqCNDoEaD0MLxAYe', 0, 1, '2019-11-05 12:40:28', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(76, '36, rue i25', 'adresse ee 2323', 26000, '0696318054', 'youness.arbouh@gmail.com', '$2y$13$T7KXkmI59DJgTD0yBavZq.z/1zBtMRSTTAP62O9XbXhrI4qczjJhm', 0, 1, '2019-11-07 09:30:02', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', 1574433080, NULL, NULL, 36, '/dashboard'),
(77, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'bounce@3findustrie.com', '$2y$13$e59DVr1U7h7OfEoFQXY/UeNuudwndof38YYM/bXpiSSlPos508ULC', 0, 1, '2019-12-17 09:08:46', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, 39, '/dashboard'),
(79, NULL, NULL, NULL, '0696318051', 'webmaster@7e-ky.ma', '$2y$13$J2npEYkTNYeArf8J4YPso.HH6BdZ4DK4ez0uGoLFC6a/YNwFXcknm', 0, 1, '2019-12-17 11:27:08', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR_PRE', NULL, NULL, NULL, NULL, '/register/fournisseur'),
(80, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'webmaster@7e-sky.ma', '$2y$13$COqDwD53EBeEpYbz.pajtO7UfBLX8w11QI02KVCsN0e0kKwEz0Hr2', 0, 1, '2019-12-17 11:31:32', 'YOUNESS', 'ARBOUH', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard_ac'),
(82, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouh1@gmail.com', '$2y$13$H./PWBuS/z5G4Zb2vnhUUeecSGafd4WpT6HOKJdB2aLajgV2sV57q', 0, 1, '2020-03-06 11:33:47', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(83, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'webmaster@lesachatsindustriels.com', '$2y$13$NmMcjUkNXFSLt2ZWtXuiZOqH/8OMXUDP7lrg1l9uO/ylF71ES1hem', 0, 1, '2020-03-06 12:12:58', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR_PRE', NULL, NULL, NULL, NULL, '/register/fournisseur2'),
(84, NULL, NULL, NULL, '0696318051', 'webmaster3@3findustrie.com', '$2y$13$m81q7SyjcmH7GfpMq9P3b.CLG53JxGhzyc47R5M3sQBttIvgNgX7W', 0, 1, '2020-03-06 12:17:17', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(85, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'youness.arbouha@gmail.com', '$2y$13$eqpHWgiPHl6PaGXbCpBjNOIFueJlt/IwejbJYqHEgPrVvET0ZEdIK', 0, 1, '2020-03-06 12:19:40', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(86, '36, rue imam al boukhari maarif', '', NULL, '0696318051', 'webmaster@3findustrie.com', '$2y$13$hEQ8pxUYk65G3K5SpfeK6eEsEZ5m6gze6MsbkK.n9YMBID04Dpp7y', 0, 1, '2020-03-06 12:24:50', 'YOUNESS', 'ARBOUH', NULL, 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, NULL, NULL, '/dashboard'),
(87, '36, rue imam al boukhari maarif', '', NULL, '0696318712', 'voti@mailinator.com', '$2y$13$RyL7jDalPCS6ASfBc8xbru1s6grJtEg2sW1mgSE9wKOkwys4b/WoK', 0, 1, '2020-03-06 12:29:36', 'Francis', 'Mathis', NULL, 'Acheteur', 'ROLE_ACHETEUR', NULL, NULL, NULL, NULL, '/dashboard_ac');

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
(1, 'Casablanca', 1, 0, 'casablanca'),
(2, 'Rabat', 1, 0, 'rabat'),
(5, 'Fès', 1, 0, 'fes'),
(6, 'Meknes', 1, 0, 'meknes'),
(7, 'Tanger', 1, 0, 'tanger'),
(8, 'Oujda', 1, 0, 'oujda'),
(9, 'Kenitra', 1, 0, 'kenitra'),
(10, 'Sale', 1, 0, 'sale'),
(11, 'Ifrane', 1, 0, 'ifrane'),
(12, 'Marrakech', 1, 0, 'marrakech'),
(13, 'Agadir', 1, 0, 'agadir'),
(14, 'Safi', 1, 0, 'safi'),
(15, 'Settat', 1, 0, 'settat'),
(16, 'Tetoua', 1, 0, 'tetoua'),
(17, 'Dakhla', 1, 0, 'dakhla'),
(19, 'Azilal', 1, 0, 'azilal'),
(20, 'Berkane', 1, 0, 'berkane'),
(21, 'Nador', 1, 0, 'nador'),
(22, 'Hoceïma', 1, 0, 'hoceïma'),
(23, 'Berrechid', 1, 0, 'berrechid'),
(25, 'Temara', 1, 0, 'temara'),
(26, 'Khouribga', 1, 0, 'khouribga'),
(27, 'Beni Mellal', 1, 0, 'beni-mellal'),
(28, 'Guelmim', 1, 0, 'guelmim'),
(29, 'Tétouan', 1, 0, 'tetouan'),
(30, 'Assila', 1, 0, 'assila'),
(31, 'Mohammadia', 1, 0, 'mohammadia'),
(32, 'Bouskoura', 1, 0, 'bouskoura'),
(33, 'Paris', 2, 0, 'paris'),
(34, 'El jadida', 1, 0, 'el-jadida'),
(35, 'Chefchaoue', 1, 0, 'chefchaoue'),
(40, 'California', 5, 0, 'california'),
(41, 'Ouezzane', 1, 0, 'ouezzane'),
(42, 'Ris-Orangis', 2, 0, 'ris-orangis'),
(43, 'Wasselonne', 2, 0, 'wasselonne'),
(44, 'Charleroi', 17, 0, 'charleroi'),
(46, 'Berne', 59, 0, 'berne'),
(47, 'Shanghai', 22, 0, 'shanghai'),
(48, 'Valladolid', 32, 0, 'valladolid'),
(49, 'Saragosse', 32, 0, 'saragosse'),
(50, 'Sainte-Florence', 2, 0, 'sainte-florence'),
(51, 'Valls', 32, 0, 'valls'),
(52, 'Brive-la-Gaillarde', 2, 0, 'brive-la-gaillarde'),
(53, 'Albolote', 32, 0, 'albolote'),
(54, 'Oullins', 2, 0, 'oullins'),
(55, 'Alger', 11, 0, 'alger'),
(56, 'Sidi Addi', 1, 0, 'sidi-addi'),
(57, 'Balma', 2, 0, 'balma'),
(58, 'Oulad Teïma', 1, 0, 'oulad-teïma'),
(59, 'Mary-sur-Marne', 2, 0, 'mary-sur-marne'),
(60, 'Mions', 2, 0, 'mions'),
(62, 'La Ciotat', 2, 0, 'la-ciotat'),
(63, 'Abidja', 66, 0, 'abidja'),
(64, 'Caissargues', 2, 0, 'caissargues'),
(65, 'Gargas', 2, 0, 'gargas'),
(66, 'Villejust', 2, 0, 'villejust'),
(67, 'Yutz', 2, 0, 'yutz'),
(68, 'Chambéry', 2, 0, 'chambéry'),
(69, 'Le Mans', 2, 0, 'le-mans'),
(70, 'Gif-sur-Yvette', 2, 0, 'gif-sur-yvette'),
(71, 'Arnas', 2, 0, 'arnas'),
(72, 'Had Soualem', 1, 0, 'had-soualem'),
(73, 'Caromb', 2, 0, 'caromb'),
(74, 'Rumilly', 2, 0, 'rumilly'),
(75, 'Bursa', 62, 0, 'bursa'),
(76, 'Neuilly-Plaisance', 2, 0, 'neuilly-plaisance'),
(77, 'Versailles', 2, 0, 'versailles'),
(78, 'Santo Ángel', 32, 0, 'santo-ángel'),
(79, 'Séville', 32, 0, 'seville'),
(80, 'Boujdour', 1, 0, 'boujdour'),
(81, 'Roubaix', 2, 0, 'roubaix'),
(82, 'Neuilly-sur-Seine', 2, 0, 'neuilly-sur-seine'),
(83, 'Caraglio', 3, 0, 'caraglio'),
(84, 'Prouvy', 2, 0, 'prouvy'),
(85, 'Nouaceur', 1, 0, 'nouaceur'),
(86, 'Cugand', 2, 0, 'cugand'),
(87, 'Aït Melloul', 1, 0, 'ait-melloul'),
(89, 'Ceno', 2, 0, 'ceno'),
(90, 'Canto', 22, 0, 'canto'),
(92, 'Guimarães', 52, 0, 'guimaraes'),
(93, 'Frans', 2, 0, 'frans'),
(97, 'Prešov', 84, 0, 'presov'),
(98, 'Laâyoune', 1, 0, 'laayoune'),
(101, 'Londres', 55, 0, 'londres'),
(102, 'Soisy-sous-Montmore', 2, 0, 'soisy-sous-montmore'),
(103, 'Bamako', 7, 0, 'bamako'),
(104, 'Cotonou', 88, 0, 'cotonou'),
(105, 'Saint-Laurent-du-Var', 2, 0, 'saint-laurent-du-var'),
(106, 'Clervaux', 90, 0, 'clervaux'),
(107, 'Suntec', 57, 0, 'suntec'),
(108, 'Sarcedo', 3, 0, 'sarcedo'),
(109, 'Ludhiana', 37, 0, 'ludhiana'),
(110, 'Conakry', 91, 0, 'conakry'),
(111, 'khenifra', 1, 0, 'khenifra');

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
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_497DD634989D9B62` (`slug`),
  ADD KEY `IDX_497DD634790611EF` (`sous_secteur_id`),
  ADD KEY `indexes_categorie` (`name`),
  ADD KEY `indexes_categorie2` (`del`);

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
  ADD KEY `IDX_29A5EC27A6E44244` (`pays_id`),
  ADD KEY `indexes_produit` (`titre`),
  ADD KEY `indexes_produit2` (`is_valid`),
  ADD KEY `indexes_produit3` (`del`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `actualite`
--
ALTER TABLE `actualite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `actualite_image`
--
ALTER TABLE `actualite_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `attachement`
--
ALTER TABLE `attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `contact_fournisseur`
--
ALTER TABLE `contact_fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `demande_abonnement`
--
ALTER TABLE `demande_abonnement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `historique_visite`
--
ALTER TABLE `historique_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `image_produit`
--
ALTER TABLE `image_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `select_produit`
--
ALTER TABLE `select_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `suggestion_secteur`
--
ALTER TABLE `suggestion_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

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
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `FK_497DD634790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`);

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
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
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

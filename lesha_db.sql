-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 24 oct. 2019 à 16:19
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
  `societe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `pays_id`, `ville_id`, `societe`) VALUES
(2, 1, 1, ''),
(18, 1, 1, 'ArasElect');

-- --------------------------------------------------------

--
-- Structure de la table `acheteur_sous_secteur`
--

CREATE TABLE `acheteur_sous_secteur` (
  `sous_secteur_id` int(11) NOT NULL,
  `acheteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(32, '5da9e5ad981db017469990.png');

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
(1, 17, 'not important', '2019-08-08 13:56:58', 18);

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
(6, 2),
(6, 6),
(7, 2),
(19, 1);

-- --------------------------------------------------------

--
-- Structure de la table `demande_achat`
--

CREATE TABLE `demande_achat` (
  `id` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_expiration` datetime NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `nbr_visite` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `date_modification` datetime NOT NULL,
  `is_alerted` tinyint(1) NOT NULL,
  `is_anonyme` tinyint(1) NOT NULL,
  `description_en` longtext COLLATE utf8mb4_unicode_ci,
  `description_es` longtext COLLATE utf8mb4_unicode_ci,
  `acheteur_id` int(11) DEFAULT NULL,
  `sous_secteur_id` int(11) DEFAULT NULL,
  `nbr_share` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `societe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `pays_id`, `ville_id`, `societe`) VALUES
(3, 2, 1, ''),
(8, 2, 2, ''),
(13, 1, 1, ''),
(17, 1, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur_sous_secteur`
--

CREATE TABLE `fournisseur_sous_secteur` (
  `fournisseur_id` int(11) NOT NULL,
  `sous_secteur_id` int(11) NOT NULL
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
('20190806102017', '2019-08-06 10:20:22'),
('20190806102110', '2019-08-06 10:21:17'),
('20190807083307', '2019-08-07 08:33:13'),
('20190807103330', '2019-08-07 10:33:44'),
('20190807111841', '2019-08-07 11:18:47'),
('20190807141020', '2019-08-07 14:10:31'),
('20190807141659', '2019-08-07 14:17:04'),
('20190807141844', '2019-08-07 14:18:48'),
('20190807154655', '2019-08-07 15:47:00'),
('20190807154800', '2019-08-07 15:48:11'),
('20190807161609', '2019-08-07 16:16:14'),
('20190808081420', '2019-08-08 08:14:30'),
('20190808104600', '2019-08-08 10:46:05'),
('20190808113735', '2019-08-08 11:37:40'),
('20190808115254', '2019-08-08 11:52:59'),
('20191003162344', '2019-10-03 16:23:53'),
('20191014162105', '2019-10-14 16:21:13'),
('20191022101913', '2019-10-22 10:19:35');

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
(2, 'Algerie', 0),
(21, 'ASIC_deleted-21', 1),
(22, 'aaaa_deleted-22', 1),
(23, 'ddddd_deleted-23', 1),
(24, 'aaaasqdsqqqqqq_deleted-24', 1),
(25, 'qdqsdqsdqqsdqdqsd_deleted-25', 1),
(26, 'Malaisie1_deleted-26', 1);

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
(421, 'Machine et Equipement', 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `adresse1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codepostal` int(11) NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `del` tinyint(1) NOT NULL,
  `isactif` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, '36, rue imam al boukhari maarif', 'HAY EL KHAIR_2', 20370, '0696318051', 'webmasster@3findustrie.com', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 1, 1, '2019-08-05 17:01:48', 'YOUNESS', 'ARBOUH', 'unessami', 'Admin', 'ROLE_ADMIN', 1565020062, NULL, 'ljmRxc&Jmrgox3ZYugIYQiSzqheC4N', 1, '/dashboard'),
(2, 'HAY EL KHAIRàà', 'HAY EL KHAIR', 26000, '0696318051', 'youness.arbouh1s@gmail.com', '$2y$13$uXkilBRFzlnwOFN7VHPkXucJ1Iz3R1IoLSvAsec3pnJlitBXcpYee', 0, 1, '2019-08-05 17:16:12', 'firstAcheteur', 'lastAcheteur', 'acheteur', 'Acheteur', 'ROLE_ACHETEUR', 1565020457, NULL, 'E.4rYgkSwxyIdaEBZpeXHmS&WON44t', 1, '/dashboard_ac'),
(3, 'HAY EL KHAIRoo', 'HAY EL KHAIRoo', 2600, '0696318055', 'youness.arbouh1@gmail.com', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 0, 1, '2019-08-05 17:21:18', 'firstFournisseur', 'lastfrns', 'frsnora', 'Fournisseur', 'ROLE_FOURNISSEUR', 1565021174, NULL, 'mpTGWY.Z9OjHTGSgCwV7apEqapombk', 1, '/dashboard_fr'),
(4, 'HAY EL KHA22IR', 'cmrsoia cmrsoi2a', 2622820, '0696318851', 'youness.arbouh4@gmail.com', '$2y$13$D5ucNPg0F4x3NASOS4VYgOPcbK.jT6aW4nmMn42ZBadntqFSZFM1W', 0, 0, '2019-08-05 17:30:47', 'cmrsoia2222', 'cmrsoi2a2223', 'cmrsoia22222d', 'ZoneCommercial', 'ROLE_ZONE', 1565078960, 1, 'HnmaGHUOcAiIecY01yyGKTw@pDugWR', 1, ''),
(5, 'HAY EL 00', 'HAY EL 11', 26400, '06963088001', 'youness.arbouh5@gmail.com_deleted-5', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 1, 0, '2019-08-05 17:32:07', 'Commerc_107', 'Commerciale_107', 'cmrciale_107_deleted-5', 'ZoneCommercial', 'ROLE_ZONE', 1565079056, 1, 'mZiQL@&239srr1aa95P&EuJwWCNZfP', 1, ''),
(6, 'HAY EL KHAIRqqq1', 'HAY EL qqqqqqqqq1', 26600, '0696318851', 'youness.arbouh6@gmail.com', '$2y$13$.kjXEmyAnYvRpqhuqKC7te0B2PKlt7aCKkwgIt.IhJbUKnkXbIBHe', 0, 1, '2019-08-05 17:38:54', 'Commerc_2', 'Commerciale_2', 'cmrciale_2', 'Commercial', 'ROLE_COMMERCIAL', NULL, 1, 'MPsPbG9uMXgReM4P66K0zBgW7cxW&g', 31, ''),
(7, 'HAY EL KHAIRqsdfsdfsdfsdqq1', 'HAY EL qqqqqsdfqqqq1', 266100, '069635418851', 'youness.arbouh7@gmail.com', '$2y$13$sRp0FwPwQD5Y6zCCp5IQjOQzOXvvrP5UgP8r4wfB2/cU8EXYiJfmW', 0, 0, '2019-08-05 17:40:05', 'Commerciale', 'Commerciale_ok', 'cmrciale_chaalali', 'Commercial', 'ROLE_COMMERCIAL', NULL, 1, 'Q8GJ@OVh@&7F.q5EjZ02Yp7wPb9HBp', 1, ''),
(8, 'HAY EL KHAIR1', 'kkkkkkkkkkkkkkk', 260500, '069631855051', 'youness.arbouh155@gmail.com', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 0, 1, '2019-08-05 18:09:07', '', 'Fournisseur31', '', 'Fournisseur', 'ROLE_FOURNISSEUR', 1565021584, NULL, 'P806FKQ4mSULMT3qhqwNdr8aomwqeV', 1, ''),
(9, 'HAY EL KHA22IR', 'cmrsoia cmrsoi2a', 2622820, '0696348051', 'youness.arbouh81@gmail.com', '$2y$13$MavlmpQGslmov1KUOE1kMejriI6dW9botMR2bPgmdXoF2aE14.S6S', 0, 1, '2019-08-06 09:57:42', 'cmrsoia2222', 'cmrsoi2a2223', 'cmrsoia22222', 'Commercial', 'ROLE_COMMERCIAL', NULL, 5, 'cgmFMjrz4HE41YOihJyJgXWEp7Jh8w', 1, ''),
(10, '36, rue imam al boukhari maarif', '', 20370, '0696318051', 'youness.arbouh55@gmail.com', '$2y$13$H./PWBuS/z5G4Zb2vnhUUeecSGafd4WpT6HOKJdB2aLajgV2sV57q', 0, 1, '2019-08-06 10:59:17', 'YOUNESS', 'ARBOUH', 'unessami1253', 'Admin', 'ROLE_ADMIN', 1569857840, NULL, 'lcL6@PnSmZRYWhJ0iWbX8cygti4tnj', 26, '/dashboard'),
(11, 'aaaaaa', NULL, 110055, '0696311145', 'youness.aaaaa_deleted-11', '$2y$13$EZRR7o1ht29aWb3gr4L23ucEZ1HBcEeeTmm2zf9WayviOR/rVg4xa', 1, 0, '2019-08-06 17:06:31', 'aaaaaaaa', 'aaaaaa', 'aaaaaa_deleted-11', 'Admin', 'ROLE_ADMIN', NULL, NULL, 'iUXeb8wKsOdjYEcnnxQHOGWzexX4mt', NULL, ''),
(13, 'aaaaaa', 'aaaafff', 110055, '0696311145', 'youness.arbouh@live.fr', '$2y$13$gUXUfjhomFDca0DFfLkD1eOiYBIYiaB8ld059Ci2SOFNWAfR4kjlS', 1, 1, '2019-08-06 17:15:05', 'aaaaaaa', 'aaaaaaa', 'aaaaaa', 'Fournisseur', 'ROLE_FOURNISSEUR', 1565104755, NULL, NULL, NULL, ''),
(17, 'aaaaaa', 'aaaafff', 110055, '0696311145', 'youness.arbouh@gmail.com', '$2y$13$uXkilBRFzlnwOFN7VHPkXucJ1Iz3R1IoLSvAsec3pnJlitBXcpYee', 0, 1, '2019-08-06 17:47:54', 'aaaaaaa', 'aaaaaaa', 'aaa4aaa', 'Fournisseur', 'ROLE_FOURNISSEUR', NULL, NULL, 'kwEdkaiENyv4UWckDWZrZWHi&RFvav', NULL, ''),
(18, 'aaaaaa', 'aaaafff', 110055, '0696311145', 'youness.arbouh2@live.fr', '$2y$13$uXkilBRFzlnwOFN7VHPkXucJ1Iz3R1IoLSvAsec3pnJlitBXcpYee', 0, 1, '2019-08-06 17:53:34', 'aaaaaaa', 'aaaaaaa', 'unessamgi14123', 'Acheteur', 'ROLE_ACHETEUR', 1565106931, NULL, NULL, NULL, ''),
(19, 'aaaaaa', 'aaaafff', 110055, '0696311145', 'youness.arbouh23@live.fr_deleted-19', '$2y$13$CVWGvj.HTHQ.LgONjkrRieX/cy4U4TV.4mCmX5PoiJ8lsVLoktP0.', 1, 1, '2019-08-06 18:02:19', 'aaaaaaa', 'aaaaaaa', 'unessami112253_deleted-19', 'Commercial', 'ROLE_COMMERCIAL', 1565107563, 5, '3jUhm.8ew9bTX9sfufis&F8QWFm0DA', NULL, ''),
(20, 'aaaaaa', 'aaaafff', 110055, '0696311145', 'youness.arbouh235@live.fr', '$2y$13$TB.uAeFymkMWG7EIuCHFPux4QPVDLgK5P9rEht59OjdraDWLi5Lju', 1, 0, '2019-08-06 18:10:06', 'aaaaaaa', 'aaaaaaa', 'unessami1123', 'ZoneCommercial', 'ROLE_ZONE', 1565108105, 10, 'OfGWTzltXV4ILr1uDMLHmiwu4.&VaS', NULL, ''),
(21, 'aaaaaa', 'aaaafff', 110055, '0696311145', 'youness.arbouh23s5@live.fr', '$2y$13$iLrMDSMDeyTQJwHFBzE.L.z1IzmscVY1U444ljNbFWvbeNIs/wLKK', 0, 0, '2019-08-06 18:16:42', 'aaaaaaa', 'aaaaaaa', 'unessamgi1123', 'Admin', 'ROLE_ADMIN', 1565108326, NULL, 'o.szT3OMtJbESI4JMcP1j0v0nXRI8U', 27, ''),
(22, 'string', 'string', 44774, '0699665547', 'yooooo.aaaaa@gggg.ccc', '$2y$13$liU0naR4WW2dCeykm0i8CudqR7oK2.NUN3VEt7Zlk8enWbaAJY52S', 0, 0, '2019-10-14 18:23:20', 'straaaaaing', 'ssssss', 'aaaassaa', 'Admin', 'ROLE_ADMIN', 1571070349, NULL, '0VsOPg2Vq4z6X5C.Ry0Z52x&sxnats', NULL, '/dashboard'),
(23, '36, rue imam al boukhari maarif', '', 20370, '0696318051', 'webmaster@3findustrie.com_deleted-23', '$2y$13$YzQdVbAs7qYZEGdi9OFaRO7GwIQJmtE2/VW7oOWmXJzDmUQ3.thi2', 1, 1, '2019-10-15 18:52:10', 'YOUNESS', 'ARBOUH', 'youness.arbouh55@gmail.com_deleted-23', 'Admin', 'ROLE_ADMIN', NULL, NULL, 'Az3Hg9qUqiKpMiBBA2AX&ps8CPczND', NULL, '/dashboard'),
(24, '36, rue imam al boukhari maarif', '', 20370, '0696318051', 'wejjster@3findustrie.com', '$2y$13$g3yC6CnuoIaq3RGCLNDjguCNwMUc/knmtgRIozNiannjlmS/gcQqq', 0, 1, '2019-10-16 16:03:29', 'YOUNESS', 'ARBOUH', 'youness.arbouh55', 'ZoneCommercial', 'ROLE_ZONE', NULL, NULL, 'f@NPKNRa9P2O0YBvbATeATAL958fuW', 19, '/dashboard_zc'),
(25, '36, rue imam al boukhari maarif', '', 20370, '0696318051', 'webmasterd@3findustrie.com', '$2y$13$e37Nvp/D2Apz9e39ZOgGCe7eKc5Plx3/F6mtTYsxhclhOptF0T1W2', 0, 1, '2019-10-17 16:10:07', 'YOUNESS', 'ARBOUH', 'youness.arbouh5', 'ZoneCommercial', 'ROLE_ZONE', NULL, NULL, 'IDUClPZHBdgIvY20KLZZYhxK@KLLw9', 25, '/dashboard_zc'),
(26, '36, rue imam al boukhari maarif', '', 20370, '0696318051', 'webmastder@3findustrie.com_deleted-26', '$2y$13$RYyEg0ynyszBfDpWS/0pW./OYeTPio/Oc2xC1hkU6e/BwGwn03jqu', 1, 1, '2019-10-17 17:08:35', 'YOUNESS', 'ARBOUH', 'youness.ard_deleted-26', 'Admin', 'ROLE_ADMIN', NULL, NULL, '68AhfRTqAzBXaTntSyZjiYeIAYjEU9', 29, '/dashboard'),
(27, '36, rue imam al boukhari maarif', '', 20370, '0696318051', 'webmastezzr@3findustrie.com_deleted-27', '$2y$13$MhdQRTZUeTh3dHgCpv3t3um40upICaxR5jauWSWmgZloE2e1h5Q3i', 1, 1, '2019-10-17 17:47:50', 'YOUNESS', 'ARBOUH', 'Youness.arzzzbo2_deleted-27', 'Admin', 'ROLE_ADMIN', NULL, NULL, 'f49VMWNa.YOKfVUItweIQaQup85hdi', 30, '/dashboard');

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
(2, 'Settat', 1, 0),
(4, 'Safi_deleted-4', 1, 1),
(5, 'Tanger_deleted-5', 2, 1),
(6, 'Rabat', 1, 0),
(7, 'ssssssssssssssssssd_deleted-7', 1, 1),
(8, 'qsdqsdqsdqsdsdsdsdsd_deleted-8', 2, 1);

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
(4, 2),
(5, 2),
(20, 1),
(24, 1),
(24, 2),
(25, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_304AFF9DA6E44244` (`pays_id`),
  ADD KEY `IDX_304AFF9DA73F0036` (`ville_id`);

--
-- Index pour la table `acheteur_sous_secteur`
--
ALTER TABLE `acheteur_sous_secteur`
  ADD PRIMARY KEY (`sous_secteur_id`,`acheteur_id`),
  ADD KEY `IDX_C05B6E7E790611EF` (`sous_secteur_id`),
  ADD KEY `IDX_C05B6E7E96A7BB5F` (`acheteur_id`);

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
  ADD PRIMARY KEY (`commercial_id`,`ville_id`),
  ADD KEY `IDX_6CBDDBE27854071C` (`commercial_id`),
  ADD KEY `IDX_6CBDDBE2A73F0036` (`ville_id`);

--
-- Index pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D077077F96A7BB5F` (`acheteur_id`),
  ADD KEY `IDX_D077077F790611EF` (`sous_secteur_id`);

--
-- Index pour la table `demande_achat_attachement`
--
ALTER TABLE `demande_achat_attachement`
  ADD PRIMARY KEY (`demande_achat_id`,`attachement_id`),
  ADD KEY `IDX_B1D67F41B8CC98D5` (`demande_achat_id`),
  ADD KEY `IDX_B1D67F41A05591E0` (`attachement_id`);

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
  ADD PRIMARY KEY (`zone_commercial_id`,`pays_id`),
  ADD KEY `IDX_723D3B09675444E0` (`zone_commercial_id`),
  ADD KEY `IDX_723D3B09A6E44244` (`pays_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `attachement`
--
ALTER TABLE `attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `black_listes`
--
ALTER TABLE `black_listes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `demande_achat`
--
ALTER TABLE `demande_achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `diffusion_demande`
--
ALTER TABLE `diffusion_demande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `sous_secteur`
--
ALTER TABLE `sous_secteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `FK_304AFF9DA6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_304AFF9DA73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_304AFF9DBF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `acheteur_sous_secteur`
--
ALTER TABLE `acheteur_sous_secteur`
  ADD CONSTRAINT `FK_C05B6E7E790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C05B6E7E96A7BB5F` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `FK_D077077F790611EF` FOREIGN KEY (`sous_secteur_id`) REFERENCES `sous_secteur` (`id`),
  ADD CONSTRAINT `FK_D077077F96A7BB5F` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`);

--
-- Contraintes pour la table `demande_achat_attachement`
--
ALTER TABLE `demande_achat_attachement`
  ADD CONSTRAINT `FK_B1D67F41A05591E0` FOREIGN KEY (`attachement_id`) REFERENCES `attachement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B1D67F41B8CC98D5` FOREIGN KEY (`demande_achat_id`) REFERENCES `demande_achat` (`id`) ON DELETE CASCADE;

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

-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 15 mars 2020 à 23:37
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

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_43C3D9C3989D9B62` (`slug`),
  ADD KEY `IDX_43C3D9C3A6E44244` (`pays_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `FK_43C3D9C3A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

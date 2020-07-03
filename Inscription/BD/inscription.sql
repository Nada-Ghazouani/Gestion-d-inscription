-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 02 Juillet 2020 à 17:47
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `inscription`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `numCpt` int(11) NOT NULL COMMENT 'numero du compte',
  `matEtud` varchar(10) NOT NULL COMMENT 'clé etrangere matricule etudiant',
  `sldCpt` int(20) NOT NULL COMMENT 'solde du copte',
  PRIMARY KEY (`numCpt`),
  UNIQUE KEY `numCpt` (`numCpt`),
  KEY `matEtud` (`matEtud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`numCpt`, `matEtud`, `sldCpt`) VALUES
(7419, '12345678', 600000);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `matEtud` varchar(10) NOT NULL COMMENT 'matricule de l''etudiant',
  `nomEtud` varchar(15) DEFAULT NULL COMMENT 'nom de l''etudiant',
  `prenomEtud` varchar(25) DEFAULT NULL COMMENT 'prenom de l''etudiant',
  `emailEtud` varchar(30) DEFAULT NULL COMMENT 'Email de l''etudiant',
  `telEtud` varchar(20) DEFAULT NULL COMMENT 'téléphone de l''étudiant',
  `sexeEtud` char(1) DEFAULT NULL COMMENT 'sexe de l''etudiant',
  `dateNaissEtud` date DEFAULT NULL COMMENT 'date de naissance de l''etudiant',
  `refSit` int(11) DEFAULT NULL COMMENT 'reference de la situation',
  `codeFil` int(11) DEFAULT NULL COMMENT 'code de la filiere',
  `codeNiv` int(11) DEFAULT NULL COMMENT 'Code du niveau',
  PRIMARY KEY (`matEtud`),
  KEY `refSit` (`refSit`),
  KEY `codeFil` (`codeFil`),
  KEY `codeNiv` (`codeNiv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`matEtud`, `nomEtud`, `prenomEtud`, `emailEtud`, `telEtud`, `sexeEtud`, `dateNaissEtud`, `refSit`, `codeFil`, `codeNiv`) VALUES
('12345678', 'ghazouani', 'nada', 'nada@gmail.com', '1235047', 'F', '2000-05-12', 1, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE IF NOT EXISTS `filiere` (
  `codeFil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Code filière',
  `libFil` varchar(15) NOT NULL COMMENT 'Libellé filière',
  PRIMARY KEY (`codeFil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `filiere`
--

INSERT INTO `filiere` (`codeFil`, `libFil`) VALUES
(1, 'Anglais'),
(2, 'Francais'),
(3, 'Developpement'),
(4, 'Reseau'),
(5, 'Marketing');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE IF NOT EXISTS `inscription` (
  `refIns` int(11) NOT NULL COMMENT 'reference inscription',
  `dateIns` date NOT NULL COMMENT 'date de l''inscription',
  `matEtud` varchar(10) NOT NULL COMMENT 'matricule de l''etudiant',
  PRIMARY KEY (`refIns`),
  KEY `matEtud` (`matEtud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `inscription`
--

INSERT INTO `inscription` (`refIns`, `dateIns`, `matEtud`) VALUES
(280, '2020-07-02', '12345678');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `codeNiv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Code du niveau',
  `libNiv` varchar(15) NOT NULL COMMENT 'Libéllé niveau',
  `montNiv` bigint(20) NOT NULL COMMENT 'Montant du niveau',
  PRIMARY KEY (`codeNiv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `niveau`
--

INSERT INTO `niveau` (`codeNiv`, `libNiv`, `montNiv`) VALUES
(1, 'LICENCE 1', 500000),
(2, 'LICENCE 2', 600000),
(3, 'LICENCE 3', 750000),
(4, 'MASTER 1', 900000),
(5, 'MASTER 2', 1000000);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE IF NOT EXISTS `paiement` (
  `numPaie` int(11) NOT NULL COMMENT 'numero de paiement',
  `montPaie` int(12) NOT NULL COMMENT 'montant du paiement',
  `datePaie` date NOT NULL COMMENT 'date de l''paiement',
  `numCpt` int(11) NOT NULL COMMENT 'numero du compte',
  `refIns` int(11) NOT NULL COMMENT 'reference inscription',
  PRIMARY KEY (`numPaie`),
  KEY `numCpt` (`numCpt`),
  KEY `refIns` (`refIns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `situation`
--

CREATE TABLE IF NOT EXISTS `situation` (
  `refSit` int(11) NOT NULL AUTO_INCREMENT COMMENT 'reference de la situation',
  `libSit` varchar(20) NOT NULL COMMENT 'libéllé de la situation',
  PRIMARY KEY (`refSit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `situation`
--

INSERT INTO `situation` (`refSit`, `libSit`) VALUES
(1, 'Orienté'),
(2, 'Non orienté');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`matEtud`) REFERENCES `etudiant` (`matEtud`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_7` FOREIGN KEY (`refSit`) REFERENCES `situation` (`refSit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_8` FOREIGN KEY (`codeFil`) REFERENCES `filiere` (`codeFil`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_9` FOREIGN KEY (`codeNiv`) REFERENCES `niveau` (`codeNiv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`matEtud`) REFERENCES `etudiant` (`matEtud`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`numCpt`) REFERENCES `compte` (`numCpt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paiement_ibfk_2` FOREIGN KEY (`refIns`) REFERENCES `inscription` (`refIns`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

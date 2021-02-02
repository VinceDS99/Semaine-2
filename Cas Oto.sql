SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



-- Base de données : `oto`


-- Structure de la table `véhicules`


DROP TABLE IF EXISTS `véhicules`;
CREATE TABLE IF NOT EXISTS `véhicules` (
  `Veh_id` int NOT NULL AUTO_INCREMENT,
  `Veh_marque` varchar(15) NOT NULL,
  `Veh_type` varchar(10) NOT NULL COMMENT 'Patriculiers/Utilitaires',
  `Veh_etat` varchar(10) NOT NULL COMMENT 'Occasion/Neuf',
  `Veh_prix` int NOT NULL,
  `Veh_couleur` varchar(10) NOT NULL,
  PRIMARY KEY (`Veh_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;



-- Structure de la table `client`


DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Cli_id` int NOT NULL AUTO_INCREMENT,
  `Cli_nom` varchar(15) NOT NULL,
  `Cli_prénom` varchar(15) NOT NULL,
  `Cli_num` int NOT NULL,
  `Cli_mail` varchar(30) NOT NULL,
  `Cli_age` int NOT NULL,
  `Cli_sexe` varchar(15) NOT NULL,
  `Cli_ville` varchar(25) NOT NULL,
  `Veh_id` int NOT NULL,
  PRIMARY KEY (`Cli_id`),
  KEY `Veh_id` (`Veh_id`),
  CONSTRAINT `veh_cli` FOREIGN KEY (`Veh_id`) REFERENCES `véhicules` (`Veh_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Structure de la table `employés`

DROP TABLE IF EXISTS `employés`;
CREATE TABLE IF NOT EXISTS `employés` (
  `Emp_id` int NOT NULL AUTO_INCREMENT,
  `Emp_nom` varchar(30) NOT NULL,
  `Emp_prénom` varchar(30) NOT NULL,
  `Emp_ville` varchar(20) NOT NULL,
  `Emp_numéro` int NOT NULL,
  `Emp_mail` varchar(30) NOT NULL,
  `Emp_sexe` varchar(15) NOT NULL,
  `Emp_age` int NOT NULL,
  `Veh_id` int NOT NULL,
  PRIMARY KEY (`Emp_id`),
  KEY `Veh_id` (`Veh_id`),
  CONSTRAINT `Veh_emp` FOREIGN KEY (`Veh_id`) REFERENCES `véhicules` (`Veh_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Structure de la table `rôle`


DROP TABLE IF EXISTS `rôle`;
CREATE TABLE IF NOT EXISTS `rôle` (
  `Role_nom` varchar(20) NOT NULL COMMENT 'Commerciaux/réparateurs/vendeurs',
  `Emp_id` int NOT NULL,
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `Emp_1` FOREIGN KEY (`Emp_id`) REFERENCES `employés` (`Emp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




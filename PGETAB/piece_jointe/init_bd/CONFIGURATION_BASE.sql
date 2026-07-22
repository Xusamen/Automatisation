-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pgetab
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `pgetab`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pgetab` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pgetab`;

--
-- Table structure for table `co_annul_transact`
--

DROP TABLE IF EXISTS `co_annul_transact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_annul_transact` (
  `ID_TRANSAC` int NOT NULL,
  `ID_DEPENSE` int DEFAULT NULL,
  `NUM_ORDR_PAIE_DEP` int DEFAULT NULL,
  `ID_RECETTE` int DEFAULT NULL,
  `NUM_ORDR_PAIE_REC` int DEFAULT NULL,
  `NO_RECU` varchar(64) DEFAULT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_TRANSAC_ANNUL` int DEFAULT NULL,
  `ID_PERS_USR_1` int NOT NULL,
  `ID_PERS_USR_2` int DEFAULT NULL,
  `DAT_ANNUL` datetime NOT NULL,
  `MT_ANNUL` decimal(10,2) NOT NULL,
  `MT_TOT_OPE_COMPTA` decimal(10,2) DEFAULT NULL,
  `MT_TOT_PAY_OPE_COMPTA` decimal(10,2) DEFAULT NULL,
  `ID_PA_MOTF_ANNUL` int NOT NULL,
  `ID_PA_STATU_ANNUL` int NOT NULL,
  `CO_TABLE_DEPENSE` varchar(64) NOT NULL,
  `DESC_DEPENSE_ANNUL` varchar(256) NOT NULL,
  `prev_num_ordr_paie_rec` int DEFAULT NULL,
  `prev_num_ordr_paie_dep` int DEFAULT NULL,
  `DAT_UPD_ANNUL` datetime DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSAC`),
  KEY `I_FK_CO_ANNUL_TRANSACT_CO_LST_ID_DEPENSE` (`ID_DEPENSE`),
  KEY `I_FK_CO_ANNUL_TRANSACT_PA_PARAM_GLOB` (`ID_PA_MOTF_ANNUL`),
  KEY `I_FK_CO_ANNUL_TRANSACT_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_CO_ANNUL_TRANSACT_SE_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `I_FK_CO_ANNUL_TRANSACT_CO_LIST_ID_RECETTE` (`ID_RECETTE`),
  KEY `I_FK_CO_ANNUL_TRANSACT_CO_TRANSACT` (`ID_TRANSAC`),
  KEY `I_FK_CO_ANNUL_TRANSACT_CO_TRANSACT_ANNULL` (`ID_TRANSAC_ANNUL`),
  KEY `FK_CO_ANNUL_TRANSACT_PE_PERSONNEL_1` (`ID_PERS_USR_1`),
  KEY `FK_CO_ANNUL_TRANSACT_PE_PERSONNEL_2` (`ID_PERS_USR_2`),
  KEY `FK_CO_ANNUL_TRANSACT_PA_PARAM_GLOB_STATU` (`ID_PA_STATU_ANNUL`),
  KEY `FK_SE_USERNAME_UPD_CO_ANNUL_TRANSACT` (`USERNAME_UPD`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_CO_LIST_ID_RECETTE` FOREIGN KEY (`ID_RECETTE`) REFERENCES `co_list_id_recette` (`ID_RECETTE`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_CO_LST_DEPENSE` FOREIGN KEY (`ID_DEPENSE`) REFERENCES `co_lst_depense` (`ID_DEPENSE`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_CO_TRANSACT` FOREIGN KEY (`ID_TRANSAC`) REFERENCES `co_transac_caisse` (`ID_TRANSAC`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_CO_TRANSACT_ANNUL` FOREIGN KEY (`ID_TRANSAC_ANNUL`) REFERENCES `co_transac_caisse` (`ID_TRANSAC`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_MOTF_ANNUL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_PA_PARAM_GLOB_STATU` FOREIGN KEY (`ID_PA_STATU_ANNUL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_PE_PERSONNEL_1` FOREIGN KEY (`ID_PERS_USR_1`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_CO_ANNUL_TRANSACT_PE_PERSONNEL_2` FOREIGN KEY (`ID_PERS_USR_2`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_UPD_CO_ANNUL_TRANSACT` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Transaction annulation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_annul_transact`
--

LOCK TABLES `co_annul_transact` WRITE;
/*!40000 ALTER TABLE `co_annul_transact` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_annul_transact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_autr_depense`
--

DROP TABLE IF EXISTS `co_autr_depense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_autr_depense` (
  `ID_DEPENSE` int NOT NULL,
  `NUM_ORDR_FACTUR` int NOT NULL,
  `ID_PA_UNIT_MESURE` int NOT NULL,
  `ID_SS_ARTICL` int DEFAULT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_ARTICLE` int NOT NULL,
  `DAT_DEPEN_AUTR` datetime NOT NULL,
  `QTE_DEPEN_AUTR` int NOT NULL,
  `PU_DEPEN` decimal(8,2) NOT NULL,
  `MT_DEPEN_AUTR` decimal(10,2) NOT NULL,
  `MT_DEPEN_PAY` decimal(10,2) NOT NULL,
  `MT_DEPEN_TOT_PAYE` decimal(10,2) NOT NULL,
  `INFO_FOURNISEUR` varchar(256) NOT NULL,
  `LIB_DEPENS` varchar(128) NOT NULL,
  `NO_RECU` varchar(255) DEFAULT NULL,
  `DESC_DEPENS` varchar(256) DEFAULT NULL,
  `DAT_UPD_DEPEN_AUTR` datetime DEFAULT NULL,
  `LN_FACTUR` varchar(1024) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENSE`,`NUM_ORDR_FACTUR`),
  KEY `I_FK_CO_AUTR_DEPENSE_PA_PARAM_GLOB` (`ID_PA_UNIT_MESURE`),
  KEY `I_FK_CO_AUTR_DEPENSESE_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `I_FK_CO_AUTR_DEPENSE_PA_SOUS_ARTICLE` (`ID_SS_ARTICL`),
  KEY `I_FK_CO_AUTR_DEPENSE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_CO_AUTR_DEPENSE_CO_LST_DEPENSE` (`ID_DEPENSE`),
  KEY `I_FK_CO_AUTR_DEPENSE_PA_ARTICLE` (`ID_ARTICLE`),
  KEY `I_FK_CO_AUTR_DEPENSE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  CONSTRAINT `FK_CO_AUTR_DEPENSE_CO_LST_DEPENSE` FOREIGN KEY (`ID_DEPENSE`) REFERENCES `co_lst_depense` (`ID_DEPENSE`),
  CONSTRAINT `FK_CO_AUTR_DEPENSE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_AUTR_DEPENSE_PA_ARTICLE` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `pa_article` (`ID_ARTICLE`),
  CONSTRAINT `FK_CO_AUTR_DEPENSE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_UNIT_MESURE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_AUTR_DEPENSE_PA_SOUS_ARTICLE` FOREIGN KEY (`ID_SS_ARTICL`) REFERENCES `pa_sous_article` (`ID_SS_ARTICL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_AUTR_DEPENSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Depense Autre';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_autr_depense`
--

LOCK TABLES `co_autr_depense` WRITE;
/*!40000 ALTER TABLE `co_autr_depense` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_autr_depense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_autr_recette`
--

DROP TABLE IF EXISTS `co_autr_recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_autr_recette` (
  `ID_RECETTE` int NOT NULL,
  `NUM_ORDR_PAIE` int NOT NULL,
  `ID_SS_ARTICL` int DEFAULT NULL,
  `ID_ARTICLE` int NOT NULL,
  `ID_PA_UNIT_MESURE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `NO_RECU` varchar(64) NOT NULL,
  `DAT_REC_AUTR` datetime NOT NULL,
  `QTE_REC_AUTR` int NOT NULL,
  `PU_REC` decimal(10,2) NOT NULL,
  `MT_REC_AUTR` decimal(10,2) NOT NULL,
  `MT_REC_TOT_PAYE` decimal(10,2) NOT NULL,
  `MT_REC_PAYE` decimal(10,2) NOT NULL,
  `LIB_REC_AUTR` varchar(128) NOT NULL,
  `DESC_REC_AUTR` varchar(256) DEFAULT NULL,
  `DAT_UPD_REC_AUTR` datetime DEFAULT NULL,
  `LN_REC_AUTRE` varchar(1024) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_RECETTE`,`NUM_ORDR_PAIE`),
  KEY `I_FK_CO_AUTR_RECETTE_PA_SOUS_ARTICLE` (`ID_SS_ARTICL`),
  KEY `I_FK_CO_AUTR_RECETTE_PA_ARTICLE` (`ID_ARTICLE`),
  KEY `I_FK_CO_AUTR_RECETTE_CO_LIST_ID_RECETTE` (`ID_RECETTE`),
  KEY `I_FK_CO_AUTR_RECETTE_PA_PARAM_GLOB` (`ID_PA_UNIT_MESURE`),
  KEY `I_FK_CO_AUTR_RECETTE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_CO_AUTR_RECETTE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  CONSTRAINT `FK_CO_AUTR_RECETTE_CO_LIST_ID_RECETTE` FOREIGN KEY (`ID_RECETTE`) REFERENCES `co_list_id_recette` (`ID_RECETTE`),
  CONSTRAINT `FK_CO_AUTR_RECETTE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_AUTR_RECETTE_PA_ARTICLE` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `pa_article` (`ID_ARTICLE`),
  CONSTRAINT `FK_CO_AUTR_RECETTE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_UNIT_MESURE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_AUTR_RECETTE_PA_SOUS_ARTICLE` FOREIGN KEY (`ID_SS_ARTICL`) REFERENCES `pa_sous_article` (`ID_SS_ARTICL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_AUTR_RECETTE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Recette Autre';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_autr_recette`
--

LOCK TABLES `co_autr_recette` WRITE;
/*!40000 ALTER TABLE `co_autr_recette` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_autr_recette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_autr_recette_eleve`
--

DROP TABLE IF EXISTS `co_autr_recette_eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_autr_recette_eleve` (
  `NUM_ORD_PAIE` int NOT NULL,
  `ID_RECETTE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `libelle` varchar(60) DEFAULT NULL,
  `desc_rec` varchar(60) DEFAULT NULL,
  `mt_rec_tot` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mt_rec_tot_paye` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mt_rec_paye` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ln_rec` varchar(250) DEFAULT NULL COMMENT 'lien du réçu',
  `no_recu` varchar(64) DEFAULT NULL COMMENT 'numero réçu',
  `date_rec` datetime DEFAULT NULL,
  `ts_crea` datetime DEFAULT NULL,
  `ts_maj` datetime DEFAULT NULL,
  `username_crea` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_RECETTE`,`NUM_ORD_PAIE`),
  KEY `fk_co_autr_rec_eleve_pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  KEY `fk_co_autr_rec_eleve_el_inscription` (`ID_INSCRIPTION`),
  KEY `fk_co_autr_rec_eleve_se_usera` (`username_crea`),
  CONSTRAINT `fk_co_autr_rec_eleve_co_list_id_recette` FOREIGN KEY (`ID_RECETTE`) REFERENCES `co_list_id_recette` (`ID_RECETTE`),
  CONSTRAINT `fk_co_autr_rec_eleve_el_inscription` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `fk_co_autr_rec_eleve_pa_annee_scolaire` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `fk_co_autr_rec_eleve_se_usera` FOREIGN KEY (`username_crea`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='autre recette eleve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_autr_recette_eleve`
--

LOCK TABLES `co_autr_recette_eleve` WRITE;
/*!40000 ALTER TABLE `co_autr_recette_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_autr_recette_eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_autr_recette_eleve_details`
--

DROP TABLE IF EXISTS `co_autr_recette_eleve_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_autr_recette_eleve_details` (
  `ID_RECETTE_DETAIL` int NOT NULL AUTO_INCREMENT,
  `NUM_ORD_PAIE` int NOT NULL,
  `ID_RECETTE` int DEFAULT NULL,
  `ID_SS_ARTICL` int DEFAULT NULL,
  `ID_ARTICLE` int DEFAULT NULL,
  `qte_rec` int NOT NULL DEFAULT '0',
  `pu_rec` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mt_rec` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID_RECETTE_DETAIL`),
  KEY `fk_co_autr_recette_eleve_details_pa_sous_article` (`ID_SS_ARTICL`),
  KEY `fk_co_autr_recette_eleve_details_co_autr_rec_eleve` (`ID_RECETTE`,`NUM_ORD_PAIE`),
  KEY `fk_co_autr_recette_eleve_details_pa_article` (`ID_ARTICLE`),
  CONSTRAINT `fk_co_autr_recette_eleve_details_co_autr_rec_eleve` FOREIGN KEY (`ID_RECETTE`, `NUM_ORD_PAIE`) REFERENCES `co_autr_recette_eleve` (`ID_RECETTE`, `NUM_ORD_PAIE`),
  CONSTRAINT `fk_co_autr_recette_eleve_details_pa_article` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `pa_article` (`ID_ARTICLE`),
  CONSTRAINT `fk_co_autr_recette_eleve_details_pa_sous_article` FOREIGN KEY (`ID_SS_ARTICL`) REFERENCES `pa_sous_article` (`ID_SS_ARTICL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='détail autre recette eleve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_autr_recette_eleve_details`
--

LOCK TABLES `co_autr_recette_eleve_details` WRITE;
/*!40000 ALTER TABLE `co_autr_recette_eleve_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_autr_recette_eleve_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_bultin_sal`
--

DROP TABLE IF EXISTS `co_bultin_sal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_bultin_sal` (
  `ID_BULTIN` int NOT NULL AUTO_INCREMENT,
  `ID_CNTRA` int DEFAULT NULL,
  `salaire_base` decimal(10,3) DEFAULT NULL,
  `salaire_net` decimal(10,3) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `volume_horaire` smallint DEFAULT NULL,
  `FL_VALIDE` char(1) NOT NULL DEFAULT 'N',
  `FL_PAYE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID_BULTIN`),
  KEY `I_FK_CO_BULTIN_SAL_CO_CNTRA` (`ID_CNTRA`),
  CONSTRAINT `fk_co_bultin_sal_co_cntra` FOREIGN KEY (`ID_CNTRA`) REFERENCES `co_cntra` (`ID_CNTRA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table bulletin de salaire';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_bultin_sal`
--

LOCK TABLES `co_bultin_sal` WRITE;
/*!40000 ALTER TABLE `co_bultin_sal` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_bultin_sal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_caisse`
--

DROP TABLE IF EXISTS `co_caisse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_caisse` (
  `ID_CAISSE` int NOT NULL AUTO_INCREMENT,
  `CODE_CAISSE` varchar(24) NOT NULL,
  `NOM_CAISSE` varchar(64) NOT NULL,
  `DESC_CAISSE` varchar(256) NOT NULL,
  `FLAG_CAISSE` char(1) NOT NULL DEFAULT 'N',
  `SOLD_CAISSE` decimal(12,2) NOT NULL,
  `DAT_CREAT` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_CAISSE`),
  UNIQUE KEY `PU_CODE_CAISSE` (`CODE_CAISSE`),
  CONSTRAINT `co_caisse_chk_1` CHECK ((`FLAG_CAISSE` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_caisse`
--

LOCK TABLES `co_caisse` WRITE;
/*!40000 ALTER TABLE `co_caisse` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_caisse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_cntra`
--

DROP TABLE IF EXISTS `co_cntra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_cntra` (
  `ID_CNTRA` int NOT NULL AUTO_INCREMENT,
  `ID_PERSONNEL` int NOT NULL,
  `SALAIRE_DE_BASE` decimal(10,3) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  `DATE_FIN` date NOT NULL,
  `DATE_FIN_REEL` date DEFAULT NULL,
  `MOTIF_FIN` varchar(256) DEFAULT '',
  `FL_VALIDE` char(1) DEFAULT 'N',
  `FL_FIN` char(1) DEFAULT 'N',
  `ID_PA_TYP_CNTRA` int NOT NULL,
  `ID_PA_MOTF_FIN` int DEFAULT NULL,
  PRIMARY KEY (`ID_CNTRA`),
  KEY `I_FK_CO_CNTRA_PE_PERSONNEL` (`ID_PERSONNEL`),
  KEY `I_FK_CO_CONTRA_PA_PARAM_GLOB` (`ID_PA_TYP_CNTRA`),
  KEY `FK_CO_CNTRA_PA_PARAM_GLOB` (`ID_PA_MOTF_FIN`),
  CONSTRAINT `FK_CO_CNTRA_FK_PA_PARAM` FOREIGN KEY (`ID_PA_TYP_CNTRA`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_CNTRA_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_MOTF_FIN`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_CNTRA_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='CONTRAT DU PERSONNEL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_cntra`
--

LOCK TABLES `co_cntra` WRITE;
/*!40000 ALTER TABLE `co_cntra` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_cntra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_cred_pers`
--

DROP TABLE IF EXISTS `co_cred_pers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_cred_pers` (
  `ID_CRED` int NOT NULL AUTO_INCREMENT,
  `ID_PERS_EMPL` int NOT NULL,
  `ID_DEPENS` int NOT NULL,
  `LIB_CRED` varchar(64) NOT NULL,
  `DESC_CRED` varchar(512) DEFAULT NULL,
  `ID_PA_ECHENCE` int NOT NULL,
  `DAT_CREDIT` varchar(10) NOT NULL,
  `DAT_DEB_PAY` varchar(10) NOT NULL,
  `DAT_FIN_PAY` varchar(10) NOT NULL,
  `NB_ECHEANCE` int NOT NULL,
  `MT_TOT_CRED` decimal(10,2) NOT NULL,
  `MT_PAY_CRED` decimal(10,2) DEFAULT '0.00',
  `MT_REST_PAY_CRED` decimal(10,2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `DAT_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `DAT_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CRED`),
  KEY `FK_PERS_EMPL` (`ID_PERS_EMPL`),
  KEY `FK_DEPENSE` (`ID_DEPENS`),
  KEY `FK_PA_ECHEANCE` (`ID_PA_ECHENCE`),
  KEY `FK_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `FK_USERNAME_UPD` (`USERNAME_UPD`),
  CONSTRAINT `FK_DEPENSE` FOREIGN KEY (`ID_DEPENS`) REFERENCES `co_lst_depense` (`ID_DEPENSE`),
  CONSTRAINT `FK_PA_ECHEANCE` FOREIGN KEY (`ID_PA_ECHENCE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PERS_EMPL` FOREIGN KEY (`ID_PERS_EMPL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_USERNAME_CREA` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_USERNAME_UPD` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Credit Personnel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_cred_pers`
--

LOCK TABLES `co_cred_pers` WRITE;
/*!40000 ALTER TABLE `co_cred_pers` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_cred_pers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_dernier_numero_recu`
--

DROP TABLE IF EXISTS `co_dernier_numero_recu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_dernier_numero_recu` (
  `ID_AN_SCOLAIRE` int NOT NULL,
  `COD_ELEM_RECU` varchar(7) NOT NULL,
  `NO_RECU` varchar(64) NOT NULL,
  `ID_RECU` int NOT NULL,
  PRIMARY KEY (`COD_ELEM_RECU`),
  KEY `I_FK_CO_DERNIER_NUMERO_RECU_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_DERNIER_NUMERO_RECU_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dernier numéro de reçu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_dernier_numero_recu`
--

LOCK TABLES `co_dernier_numero_recu` WRITE;
/*!40000 ALTER TABLE `co_dernier_numero_recu` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_dernier_numero_recu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_echeance`
--

DROP TABLE IF EXISTS `co_echeance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_echeance` (
  `ID_ECHEANCE` int NOT NULL AUTO_INCREMENT,
  `ID_CRED` int NOT NULL,
  `ID_PA_ECHENCE` int NOT NULL,
  `MT_ECHEANCE` decimal(10,2) NOT NULL,
  `DAT_ECHEANCE` date NOT NULL,
  `NUM_ORDR` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `DAT_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `DAT_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ECHEANCE`),
  KEY `FK_CRED_ECHEANCE` (`ID_CRED`),
  KEY `FK_PA_ECHEANCE1` (`ID_PA_ECHENCE`),
  KEY `FK_USERNAME_CO_ECHEANCE_CRO` (`USERNAME_CREA`),
  KEY `FK_USERNAME_CO_ECHEANCE_UPD` (`USERNAME_UPD`),
  CONSTRAINT `FK_CRED_ECHEANCE` FOREIGN KEY (`ID_CRED`) REFERENCES `co_cred_pers` (`ID_CRED`),
  CONSTRAINT `FK_PA_ECHEANCE1` FOREIGN KEY (`ID_PA_ECHENCE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_USERNAME_CO_ECHEANCE_CRO` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_USERNAME_CO_ECHEANCE_UPD` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Echeance credit Personnel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_echeance`
--

LOCK TABLES `co_echeance` WRITE;
/*!40000 ALTER TABLE `co_echeance` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_echeance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_elem_bultin`
--

DROP TABLE IF EXISTS `co_elem_bultin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_elem_bultin` (
  `ID_ELEM_BULTIN` int NOT NULL AUTO_INCREMENT,
  `ID_BULTIN` int DEFAULT NULL,
  `ID_SS_ARTICL` int DEFAULT NULL,
  `mt_elem_rec_base` decimal(10,2) DEFAULT NULL,
  `mt_elem_dep_base` decimal(10,2) DEFAULT NULL,
  `mt_elem_rec_reel` decimal(10,2) DEFAULT NULL,
  `mt_elem_dep_reel` decimal(10,2) DEFAULT NULL,
  `taux_recette` float DEFAULT '0',
  `taux_depense` float DEFAULT '0',
  `mt_base` decimal(10,2) DEFAULT NULL COMMENT 'le montant réel sur lequel les retenus ou primes seront calculés car ils ne se font pas forcement sur tout le salaire de base',
  `fl_cntra` char(1) DEFAULT 'O' COMMENT 'Flag permet de savoir si l''élément est lié ou non au contrat',
  PRIMARY KEY (`ID_ELEM_BULTIN`),
  KEY `I_FK_CO_ELEM_BULTIN_CO_BULTIN_SAL` (`ID_BULTIN`),
  KEY `I_FK_CO_ELEM_BULTIN_PA_SOUS_ARTICL` (`ID_SS_ARTICL`),
  CONSTRAINT `fk_co_elem_bultin_co_bultin` FOREIGN KEY (`ID_BULTIN`) REFERENCES `co_bultin_sal` (`ID_BULTIN`),
  CONSTRAINT `fk_co_elem_bultin_pa_sous_article` FOREIGN KEY (`ID_SS_ARTICL`) REFERENCES `pa_sous_article` (`ID_SS_ARTICL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_elem_bultin`
--

LOCK TABLES `co_elem_bultin` WRITE;
/*!40000 ALTER TABLE `co_elem_bultin` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_elem_bultin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_elem_sal`
--

DROP TABLE IF EXISTS `co_elem_sal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_elem_sal` (
  `ID_ELEM_SAL` int NOT NULL AUTO_INCREMENT,
  `ID_CNTRA` int DEFAULT NULL,
  `ID_SS_ARTICL` int DEFAULT NULL,
  `MT_ELEM_REC` decimal(10,2) DEFAULT NULL,
  `MT_ELEM_DEP` decimal(10,2) DEFAULT NULL,
  `TAUX_RECETTE` float DEFAULT NULL,
  `TAUX_DEPENSE` float DEFAULT NULL,
  `MT_BASE` decimal(10,2) DEFAULT NULL COMMENT 'LE MONTANT RÉEL SUR LEQUEL LES RETENUS OU PRIMES SERONT CALCULÉS CAR ILS NE SE FONT PAS FORCEMENT SUR TOUT LE SALAIRE DE BASE',
  PRIMARY KEY (`ID_ELEM_SAL`),
  UNIQUE KEY `ID_CNTRA` (`ID_CNTRA`,`ID_SS_ARTICL`),
  KEY `I_FK_CO_ELEM_SAL_CO_CNTRA` (`ID_CNTRA`),
  KEY `I_FK_CO_ELEM_SAL_PA_SOUS_ARTICLE` (`ID_SS_ARTICL`),
  CONSTRAINT `FK_CO_CNTRA_FK_CO_ELEM_SAL` FOREIGN KEY (`ID_CNTRA`) REFERENCES `co_cntra` (`ID_CNTRA`),
  CONSTRAINT `FK_CO_ELEM_SAL_PA_SOUS_ARTICLE` FOREIGN KEY (`ID_SS_ARTICL`) REFERENCES `pa_sous_article` (`ID_SS_ARTICL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_elem_sal`
--

LOCK TABLES `co_elem_sal` WRITE;
/*!40000 ALTER TABLE `co_elem_sal` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_elem_sal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_group_recette`
--

DROP TABLE IF EXISTS `co_group_recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_group_recette` (
  `id_group_rec` int NOT NULL AUTO_INCREMENT,
  `id_inscription` int DEFAULT NULL,
  `mt_rec_groupe` decimal(10,2) NOT NULL,
  `dat_crea` date NOT NULL,
  `lien_rec_group` varchar(255) DEFAULT NULL,
  `ln_recu_elv_autr_scol` varchar(128) DEFAULT NULL,
  `ln_rec_elv_scol` varchar(128) DEFAULT NULL,
  `mt_rec_group_scol` float DEFAULT NULL,
  `mt_rec_group_rest_scol` float DEFAULT NULL,
  `mt_rec_group_autr_scol` float DEFAULT NULL,
  `mt_rec_group_rest_autr_scol` float DEFAULT NULL,
  PRIMARY KEY (`id_group_rec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_group_recette`
--

LOCK TABLES `co_group_recette` WRITE;
/*!40000 ALTER TABLE `co_group_recette` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_group_recette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_histo_conxion_caisse`
--

DROP TABLE IF EXISTS `co_histo_conxion_caisse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_histo_conxion_caisse` (
  `ID_CONXION_CAISSE` int NOT NULL AUTO_INCREMENT,
  `ID_CAISSE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `MT_FINAL_CAISSE` decimal(12,2) NOT NULL,
  `MT_INIT_CAISSE` decimal(12,2) NOT NULL,
  `DAT_CONXION` datetime NOT NULL,
  `DAT_DECONXION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CONXION_CAISSE`),
  KEY `FK_CO_HISTO_CONXION_CAISSE_CO_CAISSE` (`ID_CAISSE`),
  KEY `FK_CO_HISTO_CONXION_CAISSE_PE_PERSONNELADD` (`ID_PERSONNEL`),
  KEY `FK_CO_HISTO_CONXION_CAISSE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_HISTO_CONXION_CAISSE_CO_CAISSE` FOREIGN KEY (`ID_CAISSE`) REFERENCES `co_caisse` (`ID_CAISSE`),
  CONSTRAINT `FK_CO_HISTO_CONXION_CAISSE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_HISTO_CONXION_CAISSE_PE_PERSONNELADD` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_histo_conxion_caisse`
--

LOCK TABLES `co_histo_conxion_caisse` WRITE;
/*!40000 ALTER TABLE `co_histo_conxion_caisse` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_histo_conxion_caisse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_inscription_cantine`
--

DROP TABLE IF EXISTS `co_inscription_cantine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_inscription_cantine` (
  `ID_INSCR_CANTINE` int NOT NULL AUTO_INCREMENT,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_PA_PLAT` int NOT NULL,
  `ID_RECETTE` int NOT NULL,
  `NUM_ORDR_PAIE` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `NB_PLAT` smallint NOT NULL,
  `DAT_INS_CANTINE` datetime NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_INSCR_CANTINE`),
  KEY `I_FK_CO_INSCRIPTION_CANTINE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_CO_INSCRIPTION_CANTINE_PA_PARAM_GLOB` (`ID_PA_PLAT`),
  KEY `I_FK_CO_INSCRIPTION_CANTINE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `I_FK_CO_INSCRIPTION_CANTINE_CO_AUTR_RECETTE` (`ID_RECETTE`,`NUM_ORDR_PAIE`),
  KEY `I_FK_CO_INSCRIPTION_CANTINE_PE_PERSONNEL` (`ID_PERSONNEL`),
  CONSTRAINT `FK_CO_INSCRIPTION_CANTINE_CO_AUTR_RECETTE` FOREIGN KEY (`ID_RECETTE`, `NUM_ORDR_PAIE`) REFERENCES `co_autr_recette` (`ID_RECETTE`, `NUM_ORDR_PAIE`),
  CONSTRAINT `FK_CO_INSCRIPTION_CANTINE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_CO_INSCRIPTION_CANTINE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_PLAT`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_INSCRIPTION_CANTINE_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_INSCRIPTION_CANTINE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inscription Cantine';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_inscription_cantine`
--

LOCK TABLES `co_inscription_cantine` WRITE;
/*!40000 ALTER TABLE `co_inscription_cantine` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_inscription_cantine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_list_id_recette`
--

DROP TABLE IF EXISTS `co_list_id_recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_list_id_recette` (
  `ID_RECETTE` int NOT NULL AUTO_INCREMENT,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_RECETTE`),
  KEY `I_FK_CO_LIST_ID_RECETTE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_LIST_ID_RECETTE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List Indentifiant Recette';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_list_id_recette`
--

LOCK TABLES `co_list_id_recette` WRITE;
/*!40000 ALTER TABLE `co_list_id_recette` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_list_id_recette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_lst_depense`
--

DROP TABLE IF EXISTS `co_lst_depense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_lst_depense` (
  `ID_DEPENSE` int NOT NULL AUTO_INCREMENT,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENSE`),
  KEY `I_FK_CO_LST_DEPENSE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_LST_DEPENSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Liste Identifiant Depense';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_lst_depense`
--

LOCK TABLES `co_lst_depense` WRITE;
/*!40000 ALTER TABLE `co_lst_depense` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_lst_depense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_paie_cred`
--

DROP TABLE IF EXISTS `co_paie_cred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_paie_cred` (
  `ID_REC` int NOT NULL,
  `ID_ECHEANCE` int NOT NULL,
  `ID_RECETTE` int NOT NULL,
  `DAT_PAY` date NOT NULL,
  `MT_PAY` decimal(10,2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `DAT_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `DAT_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_RECETTE`),
  KEY `FK_CRED_PAIE` (`ID_REC`),
  KEY `FK_ECHEANCE_PAIE` (`ID_ECHEANCE`),
  KEY `FK_USERNAME_CO_PAIE_CRED_CREA` (`USERNAME_CREA`),
  KEY `FK_USERNAME_CO_PAIE_CRED_UPD` (`USERNAME_UPD`),
  CONSTRAINT `FK_CRED_PAIE` FOREIGN KEY (`ID_REC`) REFERENCES `co_cred_pers` (`ID_CRED`),
  CONSTRAINT `FK_ECHEANCE_PAIE` FOREIGN KEY (`ID_ECHEANCE`) REFERENCES `co_echeance` (`ID_ECHEANCE`),
  CONSTRAINT `FK_USERNAME_CO_PAIE_CRED_CREA` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_USERNAME_CO_PAIE_CRED_UPD` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Paiement credit Personnel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_paie_cred`
--

LOCK TABLES `co_paie_cred` WRITE;
/*!40000 ALTER TABLE `co_paie_cred` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_paie_cred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_paiemen_bourse`
--

DROP TABLE IF EXISTS `co_paiemen_bourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_paiemen_bourse` (
  `ID_DEPENSE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_ARTICLE` int DEFAULT NULL,
  `NO_RECU` varchar(64) NOT NULL,
  `DAT_DEB_MOIS` date NOT NULL,
  `DAT_FIN_MOIS` date NOT NULL,
  `DAT_PAI_BOURSE` datetime NOT NULL,
  `MT_BOURS_PAYE` decimal(10,2) NOT NULL,
  `DOC_IDENTITE_BOURSE` varchar(256) NOT NULL,
  `DESC_PAI_BOURS` varchar(256) DEFAULT NULL,
  `LN_REC_BOURS` varchar(1024) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENSE`),
  KEY `I_FK_CO_PAIEMEN_BOURSE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_CO_PAIEMEN_BOURSE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `I_FK_CO_PAIEMEN_BOURSE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_CO_PAIEMEN_SALAIR_PA_ARTICLE` (`ID_ARTICLE`),
  CONSTRAINT `FK_CO_PAIEMEN_BOURSE_CO_LST_DEPENSE` FOREIGN KEY (`ID_DEPENSE`) REFERENCES `co_lst_depense` (`ID_DEPENSE`),
  CONSTRAINT `FK_CO_PAIEMEN_BOURSE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_CO_PAIEMEN_BOURSE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_PAIEMEN_SALAIR_PA_ARTICLE` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `pa_article` (`ID_ARTICLE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_PAIEMEN_BOURSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Paiement Bourse';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_paiemen_bourse`
--

LOCK TABLES `co_paiemen_bourse` WRITE;
/*!40000 ALTER TABLE `co_paiemen_bourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_paiemen_bourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_paiemen_salair`
--

DROP TABLE IF EXISTS `co_paiemen_salair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_paiemen_salair` (
  `ID_DEPENSE` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_ARTICLE` int DEFAULT NULL,
  `ID_BULTIN` int DEFAULT NULL,
  `NO_RECU` varchar(64) NOT NULL,
  `DT_DEB_MOIS` date NOT NULL,
  `DT_FIN_MOIS` date NOT NULL,
  `DATE_PAI_SALAIR` datetime NOT NULL,
  `TAU_HORAIR_ENSEIGN` decimal(8,2) NOT NULL,
  `NB_HEUR_ENSEIGN` int NOT NULL,
  `SALAIR_MENS` decimal(10,2) NOT NULL,
  `DOC_IDENTI_PERS` varchar(256) NOT NULL,
  `DESC_SALAIR` varchar(256) DEFAULT NULL,
  `LN_FICH_PAI` varchar(1024) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENSE`),
  KEY `I_FK_CO_PAIEMEN_SALAIR_PE_PERSONNEL` (`ID_PERSONNEL`),
  KEY `I_FK_CO_PAIEMEN_SALAIR_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_CO_PAIEMEN_SALAIR_SE_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `fk_co_paiemen_salair_co_bultin_sal` (`ID_BULTIN`),
  CONSTRAINT `fk_co_paiemen_salair_co_bultin_sal` FOREIGN KEY (`ID_BULTIN`) REFERENCES `co_bultin_sal` (`ID_BULTIN`),
  CONSTRAINT `FK_CO_PAIEMEN_SALAIR_CO_LST_DEPENSE` FOREIGN KEY (`ID_DEPENSE`) REFERENCES `co_lst_depense` (`ID_DEPENSE`),
  CONSTRAINT `FK_CO_PAIEMEN_SALAIR_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_PAIEMEN_SALAIR_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_PAIEMEN_SALAIR` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Paiement Salaire';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_paiemen_salair`
--

LOCK TABLES `co_paiemen_salair` WRITE;
/*!40000 ALTER TABLE `co_paiemen_salair` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_paiemen_salair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_param_scolarite`
--

DROP TABLE IF EXISTS `co_param_scolarite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_param_scolarite` (
  `ID_PARAM_SCOLARITE` int NOT NULL AUTO_INCREMENT,
  `ID_SS_ARTICL` int NOT NULL,
  `ID_PA_TYP_ELEV` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `FL_OBLIGATOIRE` char(1) NOT NULL DEFAULT 'N',
  `MONTANT_SCOLARITE` decimal(10,2) NOT NULL,
  `NB_MIN_SCOLARITE` int DEFAULT '0',
  `NB_MAX_SCOLARITE` int DEFAULT '0',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PARAM_SCOLARITE`),
  UNIQUE KEY `I_PU_CO_PARAM_SCOLARITE` (`ID_SS_ARTICL`,`ID_PA_TYP_ELEV`,`ID_NIV_ETU`),
  KEY `I_FK_CO_PARAM_SCOLARITE_PA_SOUS_ARTICLE` (`ID_SS_ARTICL`),
  KEY `I_FK_CO_PARAM_SCOLARITE_PA_PARAM_GLOB` (`ID_PA_TYP_ELEV`),
  KEY `I_FK_CO_PARAM_SCOLARITE_PA_NIV_ETUDE` (`ID_NIV_ETU`),
  KEY `I_FK_CO_PARAM_SCOLARITE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `I_FK_CO_PARAM_SCOLARITE_SE_USERNAME_UPD` (`USERNAME_UPD`),
  CONSTRAINT `FK_CO_PARAM_SCOLARITE_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_CO_PARAM_SCOLARITE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYP_ELEV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_PARAM_SCOLARITE_PA_SOUS_ARTICLE` FOREIGN KEY (`ID_SS_ARTICL`) REFERENCES `pa_sous_article` (`ID_SS_ARTICL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_PARAM_SCOLARITE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_CO_PARAM_SCOLARITE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `co_param_scolarite_chk_1` CHECK ((`FL_OBLIGATOIRE` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Parametre scolarite';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_param_scolarite`
--

LOCK TABLES `co_param_scolarite` WRITE;
/*!40000 ALTER TABLE `co_param_scolarite` DISABLE KEYS */;
INSERT INTO `co_param_scolarite` VALUES (1,3,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(2,3,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(3,3,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(4,3,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(5,3,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(6,3,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(7,3,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(8,3,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(9,3,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(10,3,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(11,3,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(12,3,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(13,7,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(14,7,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(15,7,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(16,7,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(17,7,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(18,7,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(19,7,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(20,7,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(21,7,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(22,7,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(23,7,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(24,7,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(25,8,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(26,8,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(27,8,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(28,8,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(29,8,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(30,8,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(31,8,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(32,8,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(33,8,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(34,8,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(35,8,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(36,8,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(37,9,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(38,9,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(39,9,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(40,9,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(41,9,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(42,9,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(43,9,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(44,9,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(45,9,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(46,9,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(47,9,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(48,9,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(49,26,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(50,26,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(51,26,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(52,26,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(53,26,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(54,26,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(55,26,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(56,26,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(57,26,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(58,26,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(59,26,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(60,26,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(61,27,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(62,27,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(63,27,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(64,27,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(65,27,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(66,27,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(67,27,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(68,27,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(69,27,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(70,27,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(71,27,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(72,27,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(73,24,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(74,24,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(75,24,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(76,24,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(77,24,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(78,24,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(79,24,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(80,24,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(81,24,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(82,24,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(83,24,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(84,24,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(85,15,3,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(86,15,3,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(87,15,3,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(88,15,3,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(89,15,2,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(90,15,2,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(91,15,2,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(92,15,2,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(93,15,1,1,'N',0.00,0,0,NULL,NULL,NULL,NULL),(94,15,1,2,'N',0.00,0,0,NULL,NULL,NULL,NULL),(95,15,1,3,'N',0.00,0,0,NULL,NULL,NULL,NULL),(96,15,1,4,'N',0.00,0,0,NULL,NULL,NULL,NULL),(128,4,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(129,4,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(130,4,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(131,4,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(132,4,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(133,4,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(134,4,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(135,4,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(136,4,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(137,7,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(138,7,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(139,7,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(140,7,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(141,7,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(142,7,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(143,7,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(144,7,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(145,7,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(146,8,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(147,8,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(148,8,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(149,8,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(150,8,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(151,8,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(152,8,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(153,8,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(154,8,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(155,9,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(156,9,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(157,9,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(158,9,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(159,9,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(160,9,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(161,9,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(162,9,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(163,9,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(164,26,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(165,26,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(166,26,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(167,26,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(168,26,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(169,26,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(170,26,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(171,26,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(172,26,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(173,27,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(174,27,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(175,27,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(176,27,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(177,27,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(178,27,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(179,27,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(180,27,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(181,27,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(182,25,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(183,25,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(184,25,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(185,25,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(186,25,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(187,25,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(188,25,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(189,25,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(190,25,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(191,16,3,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(192,16,3,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(193,16,3,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(194,16,2,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(195,16,2,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(196,16,2,13,'N',0.00,0,0,NULL,NULL,NULL,NULL),(197,16,1,7,'N',0.00,0,0,NULL,NULL,NULL,NULL),(198,16,1,10,'N',0.00,0,0,NULL,NULL,NULL,NULL),(199,16,1,13,'N',0.00,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `co_param_scolarite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_recette_eleve`
--

DROP TABLE IF EXISTS `co_recette_eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_recette_eleve` (
  `ID_RECETTE` int NOT NULL,
  `NUM_ORDR_PAI` int NOT NULL,
  `ID_PARAM_SCOLARITE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `NO_RECU` varchar(64) NOT NULL,
  `DAT_RECU` datetime NOT NULL,
  `MT_REC_ELEV` decimal(10,2) NOT NULL,
  `MT_REC_TOT_ELEV` decimal(10,2) NOT NULL,
  `MT_SCOL_TOT_PAY` decimal(10,2) NOT NULL DEFAULT '0.00',
  `MT_TOT_AUTR_FRAIS_PAY` decimal(10,2) NOT NULL DEFAULT '0.00',
  `DESC_REC_ELEV` varchar(256) DEFAULT NULL,
  `LN_REC_ELEVE` varchar(1024) NOT NULL,
  `NB_PARAM_SCOLARITE` int DEFAULT '0',
  `ID_GROUP_REC` int DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_RECETTE`,`NUM_ORDR_PAI`),
  KEY `I_FK_CO_RECETTE_ELEVE_CO_PARAM_SCOLARITE` (`ID_PARAM_SCOLARITE`),
  KEY `I_FK_CO_RECETTE_ELEVE_CO_LIST_ID_RECETTE` (`ID_RECETTE`),
  KEY `I_FK_CO_RECETTE_ELEVE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_CO_RECETTE_ELEVE_SE_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `I_FK_CO_RECETTE_ELEVE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_CO_RECETTE_ELEVE_CO_GROUP_RECETTE` (`ID_GROUP_REC`),
  CONSTRAINT `FK_CO_RECETTE_ELEVE_CO_GROUP_RECETTE` FOREIGN KEY (`ID_GROUP_REC`) REFERENCES `co_group_recette` (`id_group_rec`),
  CONSTRAINT `FK_CO_RECETTE_ELEVE_CO_LIST_ID_RECETTE` FOREIGN KEY (`ID_RECETTE`) REFERENCES `co_list_id_recette` (`ID_RECETTE`),
  CONSTRAINT `FK_CO_RECETTE_ELEVE_CO_PARAM_SCOLARITE` FOREIGN KEY (`ID_PARAM_SCOLARITE`) REFERENCES `co_param_scolarite` (`ID_PARAM_SCOLARITE`),
  CONSTRAINT `FK_CO_RECETTE_ELEVE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_CO_RECETTE_ELEVE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_RECETTE_ELEVE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Recette Eleve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_recette_eleve`
--

LOCK TABLES `co_recette_eleve` WRITE;
/*!40000 ALTER TABLE `co_recette_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_recette_eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_rel_caisse_access_personnel`
--

DROP TABLE IF EXISTS `co_rel_caisse_access_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_rel_caisse_access_personnel` (
  `ID_CAISSE` int NOT NULL,
  `ID_PERS` int NOT NULL,
  `FL_LIRE` char(1) NOT NULL DEFAULT 'N',
  `FL_MODIF` char(1) NOT NULL DEFAULT 'N',
  `FL_DROIT` char(1) NOT NULL DEFAULT 'N',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CAISSE`,`ID_PERS`),
  KEY `FK_CO_REL_CAISSE_ACCESS_PE_PERSONNEL` (`ID_PERS`),
  KEY `FK_SE_USERNAME_UPD_CO_REL_CAISSE_ACCESS_PERSONNEL` (`USERNAME_UPD`),
  KEY `FK_SE_USERNAME_CREA_CO_REL_CAISSE_ACCESS_PERSONNEL` (`USERNAME_CREA`),
  CONSTRAINT `FK_CO_REL_CAISSE_ACCESS_PE_PERSONNEL` FOREIGN KEY (`ID_PERS`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_CO_REL_CAISSE_ACCESS_PERSONNEL_CO_CAISSE` FOREIGN KEY (`ID_CAISSE`) REFERENCES `co_caisse` (`ID_CAISSE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_CO_REL_CAISSE_ACCESS_PERSONNEL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_CO_REL_CAISSE_ACCESS_PERSONNEL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `co_rel_caisse_access_personnel_chk_1` CHECK ((`FL_LIRE` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `co_rel_caisse_access_personnel_chk_2` CHECK ((`FL_MODIF` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `co_rel_caisse_access_personnel_chk_3` CHECK ((`FL_DROIT` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_rel_caisse_access_personnel`
--

LOCK TABLES `co_rel_caisse_access_personnel` WRITE;
/*!40000 ALTER TABLE `co_rel_caisse_access_personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_rel_caisse_access_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_scolarite_echeanc`
--

DROP TABLE IF EXISTS `co_scolarite_echeanc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_scolarite_echeanc` (
  `id_scolarite_echeanc` int NOT NULL AUTO_INCREMENT,
  `NUM_TRANCH` int NOT NULL,
  `NB_TRANCH` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_PA_TYP_ELEV` int NOT NULL,
  `POURCENT_SCOLARIT` decimal(5,2) NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `DATE_LIMITE` varchar(100) NOT NULL,
  `FL_DELETE` varchar(2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_scolarite_echeanc`),
  KEY `FK_CO_SCOLARITE_ECHEANC_ANNEE` (`ID_AN_SCOLAIRE`),
  KEY `FK_CO_SCOLARITE_ECHEANC_TYP_ELEV` (`ID_PA_TYP_ELEV`),
  KEY `FK_CO_SCOLARITE_ECHEANC_NIV_ETU` (`ID_NIV_ETU`),
  KEY `FK_CO_SCOLARITE_ECHEANC_USERNAME_CREA` (`USERNAME_CREA`),
  KEY `FK_CO_SCOLARITE_ECHEANC_USERNAME_UPD` (`USERNAME_UPD`),
  CONSTRAINT `FK_CO_SCOLARITE_ECHEANC_ANNEE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_SCOLARITE_ECHEANC_NIV_ETU` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_CO_SCOLARITE_ECHEANC_TYP_ELEV` FOREIGN KEY (`ID_PA_TYP_ELEV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_SCOLARITE_ECHEANC_USERNAME_CREA` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_CO_SCOLARITE_ECHEANC_USERNAME_UPD` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `co_scolarite_echeanc_chk_1` CHECK (((`POURCENT_SCOLARIT` >= 0) and (`POURCENT_SCOLARIT` <= 1))),
  CONSTRAINT `co_scolarite_echeanc_chk_2` CHECK ((`FL_DELETE` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_scolarite_echeanc`
--

LOCK TABLES `co_scolarite_echeanc` WRITE;
/*!40000 ALTER TABLE `co_scolarite_echeanc` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_scolarite_echeanc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_transac_caisse`
--

DROP TABLE IF EXISTS `co_transac_caisse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_transac_caisse` (
  `ID_TRANSAC` int NOT NULL AUTO_INCREMENT,
  `ID_RECETTE` int DEFAULT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `NUM_PAIE_REC` smallint DEFAULT NULL,
  `ID_DEPENSE` int DEFAULT NULL,
  `NUM_PAIE_DEP` smallint DEFAULT NULL,
  `ID_PA_TYP_TRANSAC` int NOT NULL,
  `ID_PA_MOY_PAIMEN` int NOT NULL,
  `ID_CONXION_CAISSE` int NOT NULL,
  `MT_PAIEMENT_DEP` decimal(10,2) NOT NULL DEFAULT '0.00',
  `MT_PAIEMENT_REC` decimal(10,2) NOT NULL DEFAULT '0.00',
  `MT_TOTAL_CAISSE` decimal(12,2) NOT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  `LB_TRANSAC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSAC`),
  KEY `FK_CO_TRANSAC_CAISSE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_CO_TRANSAC_CAISSE_CO_LST_DEPENSE` (`ID_DEPENSE`),
  KEY `FK_CO_TRANSAC_CAISSE_CO_LIST_ID_RECETTE` (`ID_RECETTE`),
  KEY `FK_CO_TRANSAC_CAISSE_PA_PARAM_GLOB` (`ID_PA_TYP_TRANSAC`),
  KEY `FK_CO_TRANSAC_CAISSE_PA_PARAM_GLOB_2` (`ID_PA_MOY_PAIMEN`),
  CONSTRAINT `FK_CO_TRANSAC_CAISSE_CO_LIST_ID_RECETTE` FOREIGN KEY (`ID_RECETTE`) REFERENCES `co_list_id_recette` (`ID_RECETTE`),
  CONSTRAINT `FK_CO_TRANSAC_CAISSE_CO_LST_DEPENSE` FOREIGN KEY (`ID_DEPENSE`) REFERENCES `co_lst_depense` (`ID_DEPENSE`),
  CONSTRAINT `FK_CO_TRANSAC_CAISSE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_TRANSAC_CAISSE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYP_TRANSAC`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_CO_TRANSAC_CAISSE_PA_PARAM_GLOB_2` FOREIGN KEY (`ID_PA_MOY_PAIMEN`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_transac_caisse`
--

LOCK TABLES `co_transac_caisse` WRITE;
/*!40000 ALTER TABLE `co_transac_caisse` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_transac_caisse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_transfert_fond`
--

DROP TABLE IF EXISTS `co_transfert_fond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_transfert_fond` (
  `ID_TRANSFER_FOND` int NOT NULL AUTO_INCREMENT,
  `ID_DEPENSE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `NUM_PAIE_DEP` smallint NOT NULL,
  `NUM_PAIE_REC` smallint NOT NULL,
  `ID_RECETTE` int NOT NULL,
  `ID_PERS_USR_1` int NOT NULL,
  `ID_PERS_USR_2` int NOT NULL,
  `DESC_TRANSFER` varchar(128) NOT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime DEFAULT NULL,
  `MT_TRANSFER` decimal(13,2) NOT NULL,
  PRIMARY KEY (`ID_TRANSFER_FOND`),
  KEY `FK_CO_TRANSFERT_FOND_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_CO_TRANSFERT_FOND_PE_PERSONNEL_1ADD` (`ID_PERS_USR_1`),
  KEY `FK_CO_TRANSFERT_FOND_PE_PERSONNEL_2ADD` (`ID_PERS_USR_2`),
  KEY `FK_CO_TRANSFERT_FOND_CO_LST_DEPENSE` (`ID_DEPENSE`),
  KEY `FK_CO_TRANSFERT_FOND_CO_LIST_ID_RECETTE` (`ID_RECETTE`),
  CONSTRAINT `FK_CO_TRANSFERT_FOND_CO_LIST_ID_RECETTE` FOREIGN KEY (`ID_RECETTE`) REFERENCES `co_list_id_recette` (`ID_RECETTE`),
  CONSTRAINT `FK_CO_TRANSFERT_FOND_CO_LST_DEPENSE` FOREIGN KEY (`ID_DEPENSE`) REFERENCES `co_lst_depense` (`ID_DEPENSE`),
  CONSTRAINT `FK_CO_TRANSFERT_FOND_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_CO_TRANSFERT_FOND_PE_PERSONNEL_1ADD` FOREIGN KEY (`ID_PERS_USR_1`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_CO_TRANSFERT_FOND_PE_PERSONNEL_2ADD` FOREIGN KEY (`ID_PERS_USR_2`) REFERENCES `pe_personnel` (`ID_PERSONNEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_transfert_fond`
--

LOCK TABLES `co_transfert_fond` WRITE;
/*!40000 ALTER TABLE `co_transfert_fond` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_transfert_fond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_absence_eleve`
--

DROP TABLE IF EXISTS `el_absence_eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_absence_eleve` (
  `ID_ABS_ELV` int NOT NULL AUTO_INCREMENT,
  `ID_INCIDENT` int DEFAULT NULL,
  `ID_PA_STATU_ABS_ELV` int NOT NULL,
  `ID_PA_PERIODE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_PA_MOTF_ABS_ELV` int NOT NULL,
  `DAT_DEB_ABS_ELV` datetime NOT NULL,
  `DAT_FIN_ABS_ELV` datetime DEFAULT NULL,
  `DESC_ABS_ELV` varchar(128) NOT NULL,
  `id_matiere` int DEFAULT NULL,
  `FL_DEL` char(1) NOT NULL DEFAULT 'N',
  `TS_DEL` varchar(64) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ABS_ELV`),
  KEY `I_FK_EL_ABSENCE_ELEVE_EL_INCIDENT` (`ID_INCIDENT`),
  KEY `I_FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB` (`ID_PA_STATU_ABS_ELV`),
  KEY `I_FK_EL_ABSENCE_ELEVE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB2` (`ID_PA_MOTF_ABS_ELV`),
  KEY `I_FK_EL_ABSENCE_ELEVE_PA_PERIOD_EVAL` (`ID_PA_PERIODE`),
  KEY `FK_SE_USERNAME_CREA_EL_ABSENCE_ELEVE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_ABSENCE_ELEVE` (`USERNAME_UPD`),
  KEY `FK_el_absence_eleve_pa_matiere` (`id_matiere`),
  CONSTRAINT `FK_EL_ABSENCE_ELEVE_EL_INCIDENT` FOREIGN KEY (`ID_INCIDENT`) REFERENCES `el_incident` (`ID_INCIDENT`),
  CONSTRAINT `FK_EL_ABSENCE_ELEVE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_el_absence_eleve_pa_matiere` FOREIGN KEY (`id_matiere`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_STATU_ABS_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_MOTF_ABS_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_ABSENCE_ELEVE_PA_PERIOD_EVAL` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_ABSENCE_ELEVE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_ABSENCE_ELEVE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `el_absence_eleve_chk_1` CHECK ((`FL_DEL` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Absence Eleve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_absence_eleve`
--

LOCK TABLES `el_absence_eleve` WRITE;
/*!40000 ALTER TABLE `el_absence_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_absence_eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_dern_numero_matricule`
--

DROP TABLE IF EXISTS `el_dern_numero_matricule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_dern_numero_matricule` (
  `ID_MATRICULE` int NOT NULL,
  `NO_MATRICULE` varchar(12) NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  PRIMARY KEY (`ID_AN_SCOLAIRE`),
  KEY `I_FK_el_dern_numero_matricule_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EL_DERN_NUMERO_MATRICULE_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dernier numéro';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_dern_numero_matricule`
--

LOCK TABLES `el_dern_numero_matricule` WRITE;
/*!40000 ALTER TABLE `el_dern_numero_matricule` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_dern_numero_matricule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_document_bourse`
--

DROP TABLE IF EXISTS `el_document_bourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_document_bourse` (
  `ID_DOC_BOURSE` int NOT NULL AUTO_INCREMENT,
  `ID_BOURSE` int NOT NULL,
  `ID_PA_DOC` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DOC_BOURSE`),
  KEY `I_FK_EL_DOCUMENT_BOURSE_EL_PARAM_BOURSE` (`ID_BOURSE`),
  KEY `I_FK_EL_DOCUMENT_BOURSE_PA_PARAM_GLOB` (`ID_PA_DOC`),
  KEY `FK_SE_USERNAME_CREA_EL_DOCUMENT_BOURSE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_DOCUMENT_BOURSE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_DOCUMENT_BOURSE_EL_PARAM_BOURSE` FOREIGN KEY (`ID_BOURSE`) REFERENCES `el_param_bourse` (`ID_BOURSE`),
  CONSTRAINT `FK_EL_DOCUMENT_BOURSE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_DOC`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_DOCUMENT_BOURSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_DOCUMENT_BOURSE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Document Bourse';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_document_bourse`
--

LOCK TABLES `el_document_bourse` WRITE;
/*!40000 ALTER TABLE `el_document_bourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_document_bourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_dossier_bourse`
--

DROP TABLE IF EXISTS `el_dossier_bourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_dossier_bourse` (
  `ID_DOS_BOURSE` int NOT NULL AUTO_INCREMENT,
  `ID_BOURSE` int NOT NULL,
  `ID_ELEVE` int NOT NULL,
  `DATE_DEPO_BOURSE` date NOT NULL,
  `DATE_ENV_DOS_BOURS` date DEFAULT NULL,
  `DATE_RSLT_DOS_BOURS` date DEFAULT NULL,
  `RESULT_BOUR` char(1) NOT NULL DEFAULT 'N',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DOS_BOURSE`),
  UNIQUE KEY `I_PU_EL_DOSSIER_BOURSE` (`ID_ELEVE`,`ID_BOURSE`),
  KEY `I_FK_EL_DOSSIER_BOURSE_EL_PARAM_BOURSE` (`ID_BOURSE`),
  KEY `I_FK_EL_DOSSIER_BOURSE_EL_ELEVE` (`ID_ELEVE`),
  KEY `FK_SE_USERNAME_CREA_EL_DOSSIER_BOURSE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_DOSSIER_BOURSE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_DOSSIER_BOURSE_EL_ELEVE` FOREIGN KEY (`ID_ELEVE`) REFERENCES `el_eleve` (`ID_ELEVE`),
  CONSTRAINT `FK_EL_DOSSIER_BOURSE_EL_PARAM_BOURSE` FOREIGN KEY (`ID_BOURSE`) REFERENCES `el_param_bourse` (`ID_BOURSE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_DOSSIER_BOURSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_DOSSIER_BOURSE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `el_dossier_bourse_chk_1` CHECK ((`RESULT_BOUR` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dossier Bourse';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_dossier_bourse`
--

LOCK TABLES `el_dossier_bourse` WRITE;
/*!40000 ALTER TABLE `el_dossier_bourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_dossier_bourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_eleve`
--

DROP TABLE IF EXISTS `el_eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_eleve` (
  `ID_ELEVE` int NOT NULL AUTO_INCREMENT,
  `ID_PAYS_NAIS_ELV` int NOT NULL,
  `ID_PAYS_NATIONNALITE_ELV` int NOT NULL,
  `ID_PA_RELIGION_PERE_ELV` int DEFAULT NULL,
  `ID_PA_RELIGION_MERE_ELV` int DEFAULT NULL,
  `ID_PA_SITUA_SOCIAL_ELV` int NOT NULL,
  `ID_PA_PROFES_PERE_ELV` int DEFAULT NULL,
  `ID_COM_NAIS_ELV` int DEFAULT NULL,
  `ID_PA_PROFES_MERE_ELV` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL1` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL2` int DEFAULT NULL,
  `ID_ETAB_ORIG` int DEFAULT NULL,
  `NUM_MATRI_ELV` varchar(12) NOT NULL,
  `NOM_ELV` varchar(64) NOT NULL,
  `PRENOM_ELV` varchar(64) NOT NULL,
  `TEL_ELV` varchar(32) NOT NULL,
  `DAT_NAIS_ELV` date NOT NULL,
  `LIEU_NAIS_ELV` varchar(64) NOT NULL,
  `NM_PERE_ELV` varchar(64) NOT NULL,
  `PRNM_PERE_ELV` varchar(64) NOT NULL,
  `NM_MERE_ELV` varchar(64) NOT NULL,
  `PRNM_MERE_ELV` varchar(64) NOT NULL,
  `NUM_TEL_PAREN_ELV` varchar(64) NOT NULL,
  `APT_SPOR_ELV` char(1) NOT NULL DEFAULT 'N',
  `LN_IMG_ELV` varchar(1024) NOT NULL,
  `SEX_ELV` char(1) NOT NULL DEFAULT 'F',
  `ANNEE_NAIS_EN` varchar(31) NOT NULL DEFAULT '',
  `NUM_PV` varchar(30) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ELEVE`),
  UNIQUE KEY `I_PU_ELEVE` (`NUM_MATRI_ELV`),
  KEY `I_FK_EL_ELEVE_PA_PAYS` (`ID_PAYS_NAIS_ELV`),
  KEY `I_FK_EL_ELEVE_PA_PAYS2` (`ID_PAYS_NATIONNALITE_ELV`),
  KEY `I_FK_EL_ELEVE_PA_PARAM_GLOB` (`ID_PA_RELIGION_PERE_ELV`),
  KEY `I_FK_EL_ELEVE_PA_PARAM_GLOB4` (`ID_PA_RELIGION_MERE_ELV`),
  KEY `I_FK_EL_ELEVE_PA_PARAM_GLOB5` (`ID_PA_SITUA_SOCIAL_ELV`),
  KEY `I_FK_EL_ELEVE_PA_PARAM_GLOB1` (`ID_PA_PROFES_PERE_ELV`),
  KEY `I_FK_EL_ELEVE_PA_COMMUNE` (`ID_COM_NAIS_ELV`),
  KEY `I_FK_EL_ELEVE_PA_PARAM_GLOB21` (`ID_PA_PROFES_MERE_ELV`),
  KEY `FK_EL_ELEVE_PA_NIV_ETUDE_REDOUBL1` (`ID_NIV_ETU_RDOUBL1`),
  KEY `FK_EL_ELEVE_PA_NIV_ETUDE_REDOUBL2` (`ID_NIV_ETU_RDOUBL2`),
  KEY `FK_EL_ELEVE_PA_LIST_ETABL` (`ID_ETAB_ORIG`),
  KEY `FK_SE_USERNAME_CREA_EL_ELEVE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_ELEVE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_ELEVE_PA_COMMUNE` FOREIGN KEY (`ID_COM_NAIS_ELV`) REFERENCES `pa_commune` (`ID_COM`),
  CONSTRAINT `FK_EL_ELEVE_PA_LIST_ETABL` FOREIGN KEY (`ID_ETAB_ORIG`) REFERENCES `pa_list_etabl` (`ID_ETAB`),
  CONSTRAINT `FK_EL_ELEVE_PA_NIV_ETUDE_REDOUBL1` FOREIGN KEY (`ID_NIV_ETU_RDOUBL1`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EL_ELEVE_PA_NIV_ETUDE_REDOUBL2` FOREIGN KEY (`ID_NIV_ETU_RDOUBL2`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EL_ELEVE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_RELIGION_PERE_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_ELEVE_PA_PARAM_GLOB1` FOREIGN KEY (`ID_PA_SITUA_SOCIAL_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_ELEVE_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_PROFES_PERE_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_ELEVE_PA_PARAM_GLOB3` FOREIGN KEY (`ID_PA_PROFES_MERE_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_ELEVE_PA_PARAM_GLOB5` FOREIGN KEY (`ID_PA_RELIGION_MERE_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_ELEVE_PA_PAYS` FOREIGN KEY (`ID_PAYS_NAIS_ELV`) REFERENCES `pa_pays` (`ID_PAYS`),
  CONSTRAINT `FK_EL_ELEVE_PA_PAYS2` FOREIGN KEY (`ID_PAYS_NATIONNALITE_ELV`) REFERENCES `pa_pays` (`ID_PAYS`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_ELEVE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_ELEVE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `el_eleve_chk_1` CHECK ((`APT_SPOR_ELV` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `el_eleve_chk_2` CHECK ((`SEX_ELV` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Eleve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_eleve`
--

LOCK TABLES `el_eleve` WRITE;
/*!40000 ALTER TABLE `el_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_incident`
--

DROP TABLE IF EXISTS `el_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_incident` (
  `ID_INCIDENT` int NOT NULL AUTO_INCREMENT,
  `ID_PA_EXCLUSION_ELV` int NOT NULL,
  `ID_PA_TYP_INCIDENT` int NOT NULL,
  `ID_PA_PERIODE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `DAT_INCIDENT` datetime NOT NULL,
  `DAT_DEB_INCIDENT` datetime DEFAULT NULL,
  `DAT_FIN_INCIDENT` datetime DEFAULT NULL,
  `PAREN_CONVOQ` char(1) DEFAULT NULL,
  `LIB_LNG_INCIDENT` varchar(128) NOT NULL,
  `NB_POIN_RETRAI` decimal(7,2) NOT NULL DEFAULT '0.00',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_INCIDENT`),
  KEY `I_FK_EL_INCIDENT_PA_PARAM_GLOB` (`ID_PA_EXCLUSION_ELV`),
  KEY `I_FK_EL_INCIDENT_PA_PARAM_GLOB1` (`ID_PA_TYP_INCIDENT`),
  KEY `I_FK_EL_INCIDENT_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_EL_INCIDENT_PA_PERIOD_EVAL` (`ID_PA_PERIODE`),
  KEY `FK_SE_USERNAME_CREA_EL_INCIDENT` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_INCIDENT` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_INCIDENT_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EL_INCIDENT_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_EXCLUSION_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_INCIDENT_PA_PARAM_GLOB1` FOREIGN KEY (`ID_PA_TYP_INCIDENT`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_INCIDENT_PA_PERIOD_EVAL` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_INCIDENT` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_INCIDENT` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `el_incident_chk_1` CHECK ((`PAREN_CONVOQ` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Incident';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_incident`
--

LOCK TABLES `el_incident` WRITE;
/*!40000 ALTER TABLE `el_incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_inscription`
--

DROP TABLE IF EXISTS `el_inscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_inscription` (
  `ID_INSCRIPTION` int NOT NULL AUTO_INCREMENT,
  `ID_ELEVE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_PA_RSLT_SCOL` int DEFAULT NULL,
  `ID_PA_OPTION` int DEFAULT NULL,
  `ID_CLASSE` int NOT NULL,
  `ID_PA_TYP_ELV` int NOT NULL,
  `ID_PA_PERIOD_DEL` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL1` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL2` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL3` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL4` int DEFAULT NULL,
  `MT_SCO_INSCRIP` decimal(13,2) DEFAULT NULL,
  `EST_BOURS_INSCRIP` char(1) NOT NULL DEFAULT 'N',
  `FL_PAY_SCOL` char(1) NOT NULL DEFAULT 'N',
  `MOY_GENRAL` decimal(4,2) DEFAULT NULL,
  `RANG_GNRAL` smallint DEFAULT NULL,
  `DAT_VAL_MOY_GNRAL` datetime DEFAULT NULL,
  `MT_BOURSE` decimal(7,2) DEFAULT NULL,
  `LN_BULETIN_MOY_GNRAL` varchar(1024) DEFAULT NULL,
  `DAT_CREAT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MOY_GENRAL_AV_RACHA` decimal(4,2) DEFAULT NULL,
  `MOTIF_DEL` varchar(64) DEFAULT NULL,
  `FL_DEL` char(1) NOT NULL DEFAULT 'N',
  `DATE_DEL` datetime DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_INSCRIPTION`),
  UNIQUE KEY `ID_PU_EL_INSCRIPTION` (`ID_ELEVE`,`ID_AN_SCOLAIRE`),
  KEY `I_FK_EL_INSCRIPTION_EL_ELEVE` (`ID_ELEVE`),
  KEY `I_FK_EL_INSCRIPTION_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_EL_INSCRIPTION_PA_PARAM_GLOB` (`ID_PA_RSLT_SCOL`),
  KEY `I_FK_EL_INSCRIPTION_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EL_INSCRIPTION_PA_PARAM_GLOB2` (`ID_PA_TYP_ELV`),
  KEY `FK_EL_INSCRIPTION_PA_PARAM_GLOB_OPTION` (`ID_PA_OPTION`),
  KEY `FK_EL_INSCRIPTION_PA_PERIOD` (`ID_PA_PERIOD_DEL`),
  KEY `FK_SE_USERNAME_CREA_EL_INSCRIPTION` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_INSCRIPTION` (`USERNAME_UPD`),
  KEY `fk_el_eleve_redoubl1` (`ID_NIV_ETU_RDOUBL1`),
  KEY `fk_el_eleve_redoubl2` (`ID_NIV_ETU_RDOUBL2`),
  KEY `fk_el_eleve_redoubl3` (`ID_NIV_ETU_RDOUBL3`),
  KEY `fk_el_eleve_redoubl4` (`ID_NIV_ETU_RDOUBL4`),
  CONSTRAINT `fk_el_eleve_redoubl1` FOREIGN KEY (`ID_NIV_ETU_RDOUBL1`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `fk_el_eleve_redoubl2` FOREIGN KEY (`ID_NIV_ETU_RDOUBL2`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `fk_el_eleve_redoubl3` FOREIGN KEY (`ID_NIV_ETU_RDOUBL3`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `fk_el_eleve_redoubl4` FOREIGN KEY (`ID_NIV_ETU_RDOUBL4`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EL_INSCRIPTION_EL_ELEVE` FOREIGN KEY (`ID_ELEVE`) REFERENCES `el_eleve` (`ID_ELEVE`),
  CONSTRAINT `FK_EL_INSCRIPTION_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EL_INSCRIPTION_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EL_INSCRIPTION_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_RSLT_SCOL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_INSCRIPTION_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_TYP_ELV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_INSCRIPTION_PA_PARAM_GLOB_OPTION` FOREIGN KEY (`ID_PA_OPTION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_INSCRIPTION_PA_PERIOD` FOREIGN KEY (`ID_PA_PERIOD_DEL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_INSCRIPTION` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_INSCRIPTION` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `el_inscription_chk_1` CHECK ((`EST_BOURS_INSCRIP` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `el_inscription_chk_2` CHECK ((`FL_PAY_SCOL` in (_utf8mb4'O',_utf8mb4'N',_utf8mb4'E'))),
  CONSTRAINT `el_inscription_chk_3` CHECK ((`FL_DEL` in (_utf8mb4'A',_utf8mb4'N',_utf8mb4'S')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Incription';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_inscription`
--

LOCK TABLES `el_inscription` WRITE;
/*!40000 ALTER TABLE `el_inscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_inscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_param_bourse`
--

DROP TABLE IF EXISTS `el_param_bourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_param_bourse` (
  `ID_BOURSE` int NOT NULL AUTO_INCREMENT,
  `ID_REG` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_PA_DIPLOME` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `AN_BOURSE` smallint NOT NULL,
  `NB_POIN_REQ_BOURSE` decimal(6,2) NOT NULL,
  `MOY_REQ_BOURSE` decimal(4,2) NOT NULL,
  `AGE_MAX` int NOT NULL,
  `MT_BOURSE` decimal(7,2) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_BOURSE`),
  UNIQUE KEY `I_PU_EL_PARAM_BOURSE` (`ID_REG`,`ID_AN_SCOLAIRE`,`ID_PA_DIPLOME`),
  KEY `I_FK_EL_PARAM_BOURSE_PA_REGION` (`ID_REG`),
  KEY `I_FK_EL_PARAM_BOURSE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_EL_PARAM_BOURSE_PA_PARAM_GLOB` (`ID_PA_DIPLOME`),
  KEY `I_FK_EL_PARAM_BOURSE_PA_NIV_ETUDE` (`ID_NIV_ETU`),
  KEY `FK_SE_USERNAME_CREA_EL_PARAM_BOURSE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_PARAM_BOURSE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_PARAM_BOURSE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EL_PARAM_BOURSE_PA_NIV_ETUD` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EL_PARAM_BOURSE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_DIPLOME`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EL_PARAM_BOURSE_PA_REGION` FOREIGN KEY (`ID_REG`) REFERENCES `pa_region` (`ID_REG`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_PARAM_BOURSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_PARAM_BOURSE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Param Bourse';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_param_bourse`
--

LOCK TABLES `el_param_bourse` WRITE;
/*!40000 ALTER TABLE `el_param_bourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_param_bourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_rel_chef_classe`
--

DROP TABLE IF EXISTS `el_rel_chef_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_rel_chef_classe` (
  `ID_CLASSE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_INSCRIPTION_CHEF` int NOT NULL,
  `ID_INSCRIPTION_SOU_CHEF` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CLASSE`,`ID_AN_SCOLAIRE`),
  KEY `I_FK_EL_REL_CHEF_CLASSE_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_CHEF` (`ID_INSCRIPTION_CHEF`),
  KEY `I_FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_SOU_CHEF` (`ID_INSCRIPTION_SOU_CHEF`),
  KEY `I_FK_EL_REL_CHEF_CLASSE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_EL_REL_CHEF_CLASSE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_REL_CHEF_CLASSE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_CHEF` FOREIGN KEY (`ID_INSCRIPTION_CHEF`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_SOU_CHEF` FOREIGN KEY (`ID_INSCRIPTION_SOU_CHEF`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EL_REL_CHEF_CLASSE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EL_REL_CHEF_CLASSE_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_REL_CHEF_CLASSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_REL_CHEF_CLASSE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_rel_chef_classe`
--

LOCK TABLES `el_rel_chef_classe` WRITE;
/*!40000 ALTER TABLE `el_rel_chef_classe` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_rel_chef_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_rel_depot_dossier_document`
--

DROP TABLE IF EXISTS `el_rel_depot_dossier_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_rel_depot_dossier_document` (
  `ID_DOC_BOURSE` int NOT NULL,
  `ID_DOS_BOURSE` int NOT NULL,
  `DATE_DOC_RECU` date NOT NULL,
  `DOC_RECU` char(1) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DOC_BOURSE`,`ID_DOS_BOURSE`),
  KEY `I_FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOCUMENT_BOURSE` (`ID_DOC_BOURSE`),
  KEY `I_FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOSSIER_BOURSE` (`ID_DOS_BOURSE`),
  KEY `FK_SE_USERNAME_CREA_EL_REL_DEPOT_DOSSIER_DOCUMENT` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_REL_DEPOT_DOSSIER_DOCUMENT` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOCUMENT_BOURSE` FOREIGN KEY (`ID_DOC_BOURSE`) REFERENCES `el_document_bourse` (`ID_DOC_BOURSE`),
  CONSTRAINT `FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOSSIER_BOURSE` FOREIGN KEY (`ID_DOS_BOURSE`) REFERENCES `el_dossier_bourse` (`ID_DOS_BOURSE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_REL_DEPOT_DOSSIER_DOCUMENT` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_REL_DEPOT_DOSSIER_DOCUMENT` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Document Depot Dossier';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_rel_depot_dossier_document`
--

LOCK TABLES `el_rel_depot_dossier_document` WRITE;
/*!40000 ALTER TABLE `el_rel_depot_dossier_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_rel_depot_dossier_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_rel_diplome`
--

DROP TABLE IF EXISTS `el_rel_diplome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_rel_diplome` (
  `ID_ELEVE` int NOT NULL,
  `ID_PA_DIPLOME` int NOT NULL,
  `ID_AN_SCOLAIRE` int DEFAULT NULL,
  `DATE_DIPLOME` date NOT NULL,
  `NB_POIN_DIPLOME` decimal(6,2) NOT NULL,
  `MOY_DIPLOME` decimal(4,2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ELEVE`,`ID_PA_DIPLOME`),
  KEY `I_FK_EL_REL_DIPLOME_EL_ELEVE` (`ID_ELEVE`),
  KEY `I_FK_EL_REL_DIPLOME_PA_PARAM_GLOB` (`ID_PA_DIPLOME`),
  KEY `FK_EL_REL_DIPLOME_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_EL_REL_DIPLOME` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_REL_DIPLOME` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_REL_DIPLOME_EL_ELEVE` FOREIGN KEY (`ID_ELEVE`) REFERENCES `el_eleve` (`ID_ELEVE`),
  CONSTRAINT `FK_EL_REL_DIPLOME_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EL_REL_DIPLOME_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_DIPLOME`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_REL_DIPLOME` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_REL_DIPLOME` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Diplome Eleve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_rel_diplome`
--

LOCK TABLES `el_rel_diplome` WRITE;
/*!40000 ALTER TABLE `el_rel_diplome` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_rel_diplome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `el_rel_doc_adminstr`
--

DROP TABLE IF EXISTS `el_rel_doc_adminstr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `el_rel_doc_adminstr` (
  `ID_DOC_ADMINSTR` int NOT NULL AUTO_INCREMENT,
  `ID_PA_TYP_DOC` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `DAT_DOC_ADMINSTR` datetime NOT NULL,
  `ETAT_DOC_ADMINSTR` char(1) NOT NULL,
  `DATE_ENTR` datetime DEFAULT NULL,
  `DATE_SORTIE` datetime DEFAULT NULL,
  `MOTIF_DOCUMENT` varchar(256) DEFAULT NULL,
  `LN_DOC_ADMINSTR` varchar(1024) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DOC_ADMINSTR`),
  KEY `I_FK_EL_REL_DOC_ADMINSTR_PA_PARAM_GLOB` (`ID_PA_TYP_DOC`),
  KEY `I_FK_EL_REL_DOC_ADMINSTR_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `FK_SE_USERNAME_CREA_EL_REL_DOC_ADMINSTR` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_REL_DOC_ADMINSTR` (`USERNAME_UPD`),
  CONSTRAINT `FK_EL_REL_DOC_ADMINSTR_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EL_REL_DOC_ADMINSTR_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYP_DOC`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_REL_DOC_ADMINSTR` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_REL_DOC_ADMINSTR` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Document administratif';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `el_rel_doc_adminstr`
--

LOCK TABLES `el_rel_doc_adminstr` WRITE;
/*!40000 ALTER TABLE `el_rel_doc_adminstr` DISABLE KEYS */;
/*!40000 ALTER TABLE `el_rel_doc_adminstr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_activite`
--

DROP TABLE IF EXISTS `em_activite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_activite` (
  `ID_ACTIVITE` int NOT NULL AUTO_INCREMENT,
  `ID_PERSONNEL` int NOT NULL,
  `ID_CLASSE` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `DUREE_ACTIVITE` smallint NOT NULL,
  `DT_MAJ_ACTIVITE` datetime NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ACTIVITE`),
  KEY `I_FK_EM_ACTIVITE_PE_PROFESSEUR` (`ID_PERSONNEL`),
  KEY `I_FK_EM_ACTIVITE_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EM_ACTIVITE_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EM_ACTIVITE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_EM_ACTIVITE` (`USERNAME_CREA`),
  CONSTRAINT `FK_EM_ACTIVITE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EM_ACTIVITE_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EM_ACTIVITE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EM_ACTIVITE_PE_PROFESSEUR` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_professeur` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_ACTIVITE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Activite Professeur Classe Matiere';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_activite`
--

LOCK TABLES `em_activite` WRITE;
/*!40000 ALTER TABLE `em_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_activite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_cahier_texte`
--

DROP TABLE IF EXISTS `em_cahier_texte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_cahier_texte` (
  `ID_CAHIER_TEXT` int NOT NULL AUTO_INCREMENT,
  `ID_CLASSE` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `DAT_CAH_TEXT` datetime NOT NULL,
  `DAT_HEUR_DEB_ACTIVI` datetime NOT NULL,
  `DAT_HEUR_FIN_ACTIVI` datetime NOT NULL,
  `DESC_ACTIVITE` varchar(512) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CAHIER_TEXT`),
  KEY `I_FK_EM_CAHIER_TEXTE_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EM_CAHIER_TEXTE_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EM_CAHIER_TEXTE_PE_PROFESSEUR` (`ID_PERSONNEL`),
  KEY `FK_EM_CAHIER_TEXTE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_EM_CAHIER_TEXTE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EM_CAHIER_TEXTE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EM_CAHIER_TEXTE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EM_CAHIER_TEXTE_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EM_CAHIER_TEXTE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EM_CAHIER_TEXTE_PE_PROFESSEUR` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_professeur` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_CAHIER_TEXTE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EM_CAHIER_TEXTE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cahier Texte';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_cahier_texte`
--

LOCK TABLES `em_cahier_texte` WRITE;
/*!40000 ALTER TABLE `em_cahier_texte` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_cahier_texte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_emploitemps`
--

DROP TABLE IF EXISTS `em_emploitemps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_emploitemps` (
  `ID_CLASSE` int NOT NULL,
  `ID_HORAIRE_HBDO` int NOT NULL,
  `ID_VERSION_EMPLOITEMPS` smallint NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CLASSE`,`ID_HORAIRE_HBDO`,`ID_VERSION_EMPLOITEMPS`),
  KEY `I_FK_EM_EMPLOITEMPS_PA_HORAIRE_SEMAINE` (`ID_HORAIRE_HBDO`),
  KEY `I_FK_EM_EMPLOITEMPS_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_EM_EMPLOITEMPS_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EM_EMPLOITEMPS_PE_PROFESSEUR` (`ID_PERSONNEL`),
  KEY `I_FK_EM_EMPLOITEMPS_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EM_EMPLOITEMPS_EM_VERSION_EMPLOITEMPS` (`ID_VERSION_EMPLOITEMPS`),
  KEY `FK_SE_USERNAME_CREA_EM_EMPLOITEMPS` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EM_EMPLOITEMPS` (`USERNAME_UPD`),
  CONSTRAINT `FK_EM_EMPLOITEMPS_EM_VERSION_EMPLOITEMPS` FOREIGN KEY (`ID_VERSION_EMPLOITEMPS`) REFERENCES `em_version_emploitemps` (`ID_VERSION_EMPLOITEMPS`),
  CONSTRAINT `FK_EM_EMPLOITEMPS_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EM_EMPLOITEMPS_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EM_EMPLOITEMPS_PA_HORAIRE_SEMAINE` FOREIGN KEY (`ID_HORAIRE_HBDO`) REFERENCES `pa_horaire_semaine` (`ID_HORAIRE_HBDO`),
  CONSTRAINT `FK_EM_EMPLOITEMPS_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EM_EMPLOITEMPS_PE_PROFESSEUR` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_professeur` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_EMPLOITEMPS` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EM_EMPLOITEMPS` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='EmploiTemps';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_emploitemps`
--

LOCK TABLES `em_emploitemps` WRITE;
/*!40000 ALTER TABLE `em_emploitemps` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_emploitemps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_rel_classe_prof`
--

DROP TABLE IF EXISTS `em_rel_classe_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_rel_classe_prof` (
  `ID_CLASSE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `FLAG_PROF_PRINCIP` char(1) NOT NULL DEFAULT 'N',
  `DT_MAJ_ACTIVITE` datetime NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CLASSE`,`ID_AN_SCOLAIRE`,`ID_MATIERE`),
  KEY `I_FK_EM_REL_CLASSE_PROF_PE_PROFESSEUR` (`ID_PERSONNEL`),
  KEY `I_FK_EM_REL_CLASSE_PROF_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EM_REL_CLASSE_PROF_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EM_REL_CLASSE_PROF_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_EM_REL_CLASSE_PROF` (`USERNAME_CREA`),
  CONSTRAINT `FK_EM_REL_CLASSE_PROF_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EM_REL_CLASSE_PROF_PA_CLASSEADD` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EM_REL_CLASSE_PROF_PE_PROFESSEUR` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_professeur` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_REL_CLASSE_PROF` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `I_FK_EM_REL_CLASSE_PROF_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `em_rel_classe_prof_chk_1` CHECK ((`FLAG_PROF_PRINCIP` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Activite Professeur Classe Matiere';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_rel_classe_prof`
--

LOCK TABLES `em_rel_classe_prof` WRITE;
/*!40000 ALTER TABLE `em_rel_classe_prof` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_rel_classe_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_rel_contraint_classe`
--

DROP TABLE IF EXISTS `em_rel_contraint_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_rel_contraint_classe` (
  `ID_PA_CTRNT_CLASSE` int NOT NULL,
  `ID_CLASSE` int NOT NULL,
  `VALEUR_CTRNT_CLASSE` tinyint NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_CTRNT_CLASSE`,`ID_CLASSE`),
  KEY `I_FK_EM_REL_CONTRAINT_CLASSE_PA_PARAM_GLOB` (`ID_PA_CTRNT_CLASSE`),
  KEY `I_FK_EM_REL_CONTRAINT_CLASSE_PA_CLASSE` (`ID_CLASSE`),
  KEY `FK_SE_USERNAME_CREA_EM_REL_CONTRAINT_CLASSE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EM_REL_CONTRAINT_CLASSE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EM_REL_CONTRAINT_CLASSE_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EM_REL_CONTRAINT_CLASSE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_CTRNT_CLASSE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_REL_CONTRAINT_CLASSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EM_REL_CONTRAINT_CLASSE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_rel_contraint_classe`
--

LOCK TABLES `em_rel_contraint_classe` WRITE;
/*!40000 ALTER TABLE `em_rel_contraint_classe` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_rel_contraint_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_rel_contraint_professeur`
--

DROP TABLE IF EXISTS `em_rel_contraint_professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_rel_contraint_professeur` (
  `ID_PA_CNTRT_PROF` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `VALEUR_CTRNT_PROF` tinyint NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_CNTRT_PROF`,`ID_PERSONNEL`),
  KEY `I_FK_EM_REL_CONTRAINT_PROFESSEUR_PA_PARAM_GLOB` (`ID_PA_CNTRT_PROF`),
  KEY `I_FK_EM_REL_CONTRAINT_PROFESSEUR_PE_PROFESSEUR` (`ID_PERSONNEL`),
  KEY `FK_SE_USERNAME_CREA_EM_REL_CONTRAINT_PROFESSEUR` (`USERNAME_CREA`),
  CONSTRAINT `FK_EM_REL_CONTRAINT_PROFESSEUR_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_CNTRT_PROF`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EM_REL_CONTRAINT_PROFESSEUR_PE_PROFESSEUR` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_professeur` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_REL_CONTRAINT_PROFESSEUR` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_rel_contraint_professeur`
--

LOCK TABLES `em_rel_contraint_professeur` WRITE;
/*!40000 ALTER TABLE `em_rel_contraint_professeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_rel_contraint_professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_rel_dispo_classe`
--

DROP TABLE IF EXISTS `em_rel_dispo_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_rel_dispo_classe` (
  `ID_HORAIRE_HBDO` int NOT NULL,
  `ID_CLASSE` int NOT NULL,
  `FL_DISPO_CLASSE` char(1) NOT NULL DEFAULT 'O',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_HORAIRE_HBDO`,`ID_CLASSE`),
  KEY `I_FK_EM_REL_DISPO_CLASSE_PA_HORAIRE_SEMAINE` (`ID_HORAIRE_HBDO`),
  KEY `I_FK_EM_REL_DISPO_CLASSE_PA_CLASSE` (`ID_CLASSE`),
  KEY `FK_SE_USERNAME_CREA_EM_REL_DISPO_CLASSE` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EM_REL_DISPO_CLASSE` (`USERNAME_UPD`),
  CONSTRAINT `FK_EM_REL_DISPO_CLASSE_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EM_REL_DISPO_CLASSE_PA_HORAIRE_SEMAINE` FOREIGN KEY (`ID_HORAIRE_HBDO`) REFERENCES `pa_horaire_semaine` (`ID_HORAIRE_HBDO`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_REL_DISPO_CLASSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EM_REL_DISPO_CLASSE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `em_rel_dispo_classe_chk_1` CHECK ((`FL_DISPO_CLASSE` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_rel_dispo_classe`
--

LOCK TABLES `em_rel_dispo_classe` WRITE;
/*!40000 ALTER TABLE `em_rel_dispo_classe` DISABLE KEYS */;
INSERT INTO `em_rel_dispo_classe` VALUES (1,1,'O',NULL,NULL,NULL,NULL),(1,2,'O',NULL,NULL,NULL,NULL),(1,3,'O',NULL,NULL,NULL,NULL),(1,4,'O',NULL,NULL,NULL,NULL),(1,5,'O',NULL,NULL,NULL,NULL),(1,6,'O',NULL,NULL,NULL,NULL),(1,7,'O',NULL,NULL,NULL,NULL),(1,8,'O',NULL,NULL,NULL,NULL),(1,9,'O',NULL,NULL,NULL,NULL),(1,10,'O',NULL,NULL,NULL,NULL),(1,11,'O',NULL,NULL,NULL,NULL),(1,12,'O',NULL,NULL,NULL,NULL),(2,1,'O',NULL,NULL,NULL,NULL),(2,2,'O',NULL,NULL,NULL,NULL),(2,3,'O',NULL,NULL,NULL,NULL),(2,4,'O',NULL,NULL,NULL,NULL),(2,5,'O',NULL,NULL,NULL,NULL),(2,6,'O',NULL,NULL,NULL,NULL),(2,7,'O',NULL,NULL,NULL,NULL),(2,8,'O',NULL,NULL,NULL,NULL),(2,9,'O',NULL,NULL,NULL,NULL),(2,10,'O',NULL,NULL,NULL,NULL),(2,11,'O',NULL,NULL,NULL,NULL),(2,12,'O',NULL,NULL,NULL,NULL),(3,1,'O',NULL,NULL,NULL,NULL),(3,2,'O',NULL,NULL,NULL,NULL),(3,3,'O',NULL,NULL,NULL,NULL),(3,4,'O',NULL,NULL,NULL,NULL),(3,5,'O',NULL,NULL,NULL,NULL),(3,6,'O',NULL,NULL,NULL,NULL),(3,7,'O',NULL,NULL,NULL,NULL),(3,8,'O',NULL,NULL,NULL,NULL),(3,9,'O',NULL,NULL,NULL,NULL),(3,10,'O',NULL,NULL,NULL,NULL),(3,11,'O',NULL,NULL,NULL,NULL),(3,12,'O',NULL,NULL,NULL,NULL),(4,1,'O',NULL,NULL,NULL,NULL),(4,2,'O',NULL,NULL,NULL,NULL),(4,3,'O',NULL,NULL,NULL,NULL),(4,4,'O',NULL,NULL,NULL,NULL),(4,5,'O',NULL,NULL,NULL,NULL),(4,6,'O',NULL,NULL,NULL,NULL),(4,7,'O',NULL,NULL,NULL,NULL),(4,8,'O',NULL,NULL,NULL,NULL),(4,9,'O',NULL,NULL,NULL,NULL),(4,10,'O',NULL,NULL,NULL,NULL),(4,11,'O',NULL,NULL,NULL,NULL),(4,12,'O',NULL,NULL,NULL,NULL),(5,1,'O',NULL,NULL,NULL,NULL),(5,2,'O',NULL,NULL,NULL,NULL),(5,3,'O',NULL,NULL,NULL,NULL),(5,4,'O',NULL,NULL,NULL,NULL),(5,5,'O',NULL,NULL,NULL,NULL),(5,6,'O',NULL,NULL,NULL,NULL),(5,7,'O',NULL,NULL,NULL,NULL),(5,8,'O',NULL,NULL,NULL,NULL),(5,9,'O',NULL,NULL,NULL,NULL),(5,10,'O',NULL,NULL,NULL,NULL),(5,11,'O',NULL,NULL,NULL,NULL),(5,12,'O',NULL,NULL,NULL,NULL),(6,1,'O',NULL,NULL,NULL,NULL),(6,2,'O',NULL,NULL,NULL,NULL),(6,3,'O',NULL,NULL,NULL,NULL),(6,4,'O',NULL,NULL,NULL,NULL),(6,5,'O',NULL,NULL,NULL,NULL),(6,6,'O',NULL,NULL,NULL,NULL),(6,7,'O',NULL,NULL,NULL,NULL),(6,8,'O',NULL,NULL,NULL,NULL),(6,9,'O',NULL,NULL,NULL,NULL),(6,10,'O',NULL,NULL,NULL,NULL),(6,11,'O',NULL,NULL,NULL,NULL),(6,12,'O',NULL,NULL,NULL,NULL),(7,1,'O',NULL,NULL,NULL,NULL),(7,2,'O',NULL,NULL,NULL,NULL),(7,3,'O',NULL,NULL,NULL,NULL),(7,4,'O',NULL,NULL,NULL,NULL),(7,5,'O',NULL,NULL,NULL,NULL),(7,6,'O',NULL,NULL,NULL,NULL),(7,7,'O',NULL,NULL,NULL,NULL),(7,8,'O',NULL,NULL,NULL,NULL),(7,9,'O',NULL,NULL,NULL,NULL),(7,10,'O',NULL,NULL,NULL,NULL),(7,11,'O',NULL,NULL,NULL,NULL),(7,12,'O',NULL,NULL,NULL,NULL),(8,1,'O',NULL,NULL,NULL,NULL),(8,2,'O',NULL,NULL,NULL,NULL),(8,3,'O',NULL,NULL,NULL,NULL),(8,4,'O',NULL,NULL,NULL,NULL),(8,5,'O',NULL,NULL,NULL,NULL),(8,6,'O',NULL,NULL,NULL,NULL),(8,7,'O',NULL,NULL,NULL,NULL),(8,8,'O',NULL,NULL,NULL,NULL),(8,9,'O',NULL,NULL,NULL,NULL),(8,10,'O',NULL,NULL,NULL,NULL),(8,11,'O',NULL,NULL,NULL,NULL),(8,12,'O',NULL,NULL,NULL,NULL),(9,1,'O',NULL,NULL,NULL,NULL),(9,2,'O',NULL,NULL,NULL,NULL),(9,3,'O',NULL,NULL,NULL,NULL),(9,4,'O',NULL,NULL,NULL,NULL),(9,5,'O',NULL,NULL,NULL,NULL),(9,6,'O',NULL,NULL,NULL,NULL),(9,7,'O',NULL,NULL,NULL,NULL),(9,8,'O',NULL,NULL,NULL,NULL),(9,9,'O',NULL,NULL,NULL,NULL),(9,10,'O',NULL,NULL,NULL,NULL),(9,11,'O',NULL,NULL,NULL,NULL),(9,12,'O',NULL,NULL,NULL,NULL),(10,1,'O',NULL,NULL,NULL,NULL),(10,2,'O',NULL,NULL,NULL,NULL),(10,3,'O',NULL,NULL,NULL,NULL),(10,4,'O',NULL,NULL,NULL,NULL),(10,5,'O',NULL,NULL,NULL,NULL),(10,6,'O',NULL,NULL,NULL,NULL),(10,7,'O',NULL,NULL,NULL,NULL),(10,8,'O',NULL,NULL,NULL,NULL),(10,9,'O',NULL,NULL,NULL,NULL),(10,10,'O',NULL,NULL,NULL,NULL),(10,11,'O',NULL,NULL,NULL,NULL),(10,12,'O',NULL,NULL,NULL,NULL),(11,1,'O',NULL,NULL,NULL,NULL),(11,2,'O',NULL,NULL,NULL,NULL),(11,3,'O',NULL,NULL,NULL,NULL),(11,4,'O',NULL,NULL,NULL,NULL),(11,5,'O',NULL,NULL,NULL,NULL),(11,6,'O',NULL,NULL,NULL,NULL),(11,7,'O',NULL,NULL,NULL,NULL),(11,8,'O',NULL,NULL,NULL,NULL),(11,9,'O',NULL,NULL,NULL,NULL),(11,10,'O',NULL,NULL,NULL,NULL),(11,11,'O',NULL,NULL,NULL,NULL),(11,12,'O',NULL,NULL,NULL,NULL),(12,1,'O',NULL,NULL,NULL,NULL),(12,2,'O',NULL,NULL,NULL,NULL),(12,3,'O',NULL,NULL,NULL,NULL),(12,4,'O',NULL,NULL,NULL,NULL),(12,5,'O',NULL,NULL,NULL,NULL),(12,6,'O',NULL,NULL,NULL,NULL),(12,7,'O',NULL,NULL,NULL,NULL),(12,8,'O',NULL,NULL,NULL,NULL),(12,9,'O',NULL,NULL,NULL,NULL),(12,10,'O',NULL,NULL,NULL,NULL),(12,11,'O',NULL,NULL,NULL,NULL),(12,12,'O',NULL,NULL,NULL,NULL),(13,1,'O',NULL,NULL,NULL,NULL),(13,2,'O',NULL,NULL,NULL,NULL),(13,3,'O',NULL,NULL,NULL,NULL),(13,4,'O',NULL,NULL,NULL,NULL),(13,5,'O',NULL,NULL,NULL,NULL),(13,6,'O',NULL,NULL,NULL,NULL),(13,7,'O',NULL,NULL,NULL,NULL),(13,8,'O',NULL,NULL,NULL,NULL),(13,9,'O',NULL,NULL,NULL,NULL),(13,10,'O',NULL,NULL,NULL,NULL),(13,11,'O',NULL,NULL,NULL,NULL),(13,12,'O',NULL,NULL,NULL,NULL),(14,1,'O',NULL,NULL,NULL,NULL),(14,2,'O',NULL,NULL,NULL,NULL),(14,3,'O',NULL,NULL,NULL,NULL),(14,4,'O',NULL,NULL,NULL,NULL),(14,5,'O',NULL,NULL,NULL,NULL),(14,6,'O',NULL,NULL,NULL,NULL),(14,7,'O',NULL,NULL,NULL,NULL),(14,8,'O',NULL,NULL,NULL,NULL),(14,9,'O',NULL,NULL,NULL,NULL),(14,10,'O',NULL,NULL,NULL,NULL),(14,11,'O',NULL,NULL,NULL,NULL),(14,12,'O',NULL,NULL,NULL,NULL),(15,1,'O',NULL,NULL,NULL,NULL),(15,2,'O',NULL,NULL,NULL,NULL),(15,3,'O',NULL,NULL,NULL,NULL),(15,4,'O',NULL,NULL,NULL,NULL),(15,5,'O',NULL,NULL,NULL,NULL),(15,6,'O',NULL,NULL,NULL,NULL),(15,7,'O',NULL,NULL,NULL,NULL),(15,8,'O',NULL,NULL,NULL,NULL),(15,9,'O',NULL,NULL,NULL,NULL),(15,10,'O',NULL,NULL,NULL,NULL),(15,11,'O',NULL,NULL,NULL,NULL),(15,12,'O',NULL,NULL,NULL,NULL),(16,1,'O',NULL,NULL,NULL,NULL),(16,2,'O',NULL,NULL,NULL,NULL),(16,3,'O',NULL,NULL,NULL,NULL),(16,4,'O',NULL,NULL,NULL,NULL),(16,5,'O',NULL,NULL,NULL,NULL),(16,6,'O',NULL,NULL,NULL,NULL),(16,7,'O',NULL,NULL,NULL,NULL),(16,8,'O',NULL,NULL,NULL,NULL),(16,9,'O',NULL,NULL,NULL,NULL),(16,10,'O',NULL,NULL,NULL,NULL),(16,11,'O',NULL,NULL,NULL,NULL),(16,12,'O',NULL,NULL,NULL,NULL),(17,1,'O',NULL,NULL,NULL,NULL),(17,2,'O',NULL,NULL,NULL,NULL),(17,3,'O',NULL,NULL,NULL,NULL),(17,4,'O',NULL,NULL,NULL,NULL),(17,5,'O',NULL,NULL,NULL,NULL),(17,6,'O',NULL,NULL,NULL,NULL),(17,7,'O',NULL,NULL,NULL,NULL),(17,8,'O',NULL,NULL,NULL,NULL),(17,9,'O',NULL,NULL,NULL,NULL),(17,10,'O',NULL,NULL,NULL,NULL),(17,11,'O',NULL,NULL,NULL,NULL),(17,12,'O',NULL,NULL,NULL,NULL),(18,1,'O',NULL,NULL,NULL,NULL),(18,2,'O',NULL,NULL,NULL,NULL),(18,3,'O',NULL,NULL,NULL,NULL),(18,4,'O',NULL,NULL,NULL,NULL),(18,5,'O',NULL,NULL,NULL,NULL),(18,6,'O',NULL,NULL,NULL,NULL),(18,7,'O',NULL,NULL,NULL,NULL),(18,8,'O',NULL,NULL,NULL,NULL),(18,9,'O',NULL,NULL,NULL,NULL),(18,10,'O',NULL,NULL,NULL,NULL),(18,11,'O',NULL,NULL,NULL,NULL),(18,12,'O',NULL,NULL,NULL,NULL),(19,1,'O',NULL,NULL,NULL,NULL),(19,2,'O',NULL,NULL,NULL,NULL),(19,3,'O',NULL,NULL,NULL,NULL),(19,4,'O',NULL,NULL,NULL,NULL),(19,5,'O',NULL,NULL,NULL,NULL),(19,6,'O',NULL,NULL,NULL,NULL),(19,7,'O',NULL,NULL,NULL,NULL),(19,8,'O',NULL,NULL,NULL,NULL),(19,9,'O',NULL,NULL,NULL,NULL),(19,10,'O',NULL,NULL,NULL,NULL),(19,11,'O',NULL,NULL,NULL,NULL),(19,12,'O',NULL,NULL,NULL,NULL),(20,1,'O',NULL,NULL,NULL,NULL),(20,2,'O',NULL,NULL,NULL,NULL),(20,3,'O',NULL,NULL,NULL,NULL),(20,4,'O',NULL,NULL,NULL,NULL),(20,5,'O',NULL,NULL,NULL,NULL),(20,6,'O',NULL,NULL,NULL,NULL),(20,7,'O',NULL,NULL,NULL,NULL),(20,8,'O',NULL,NULL,NULL,NULL),(20,9,'O',NULL,NULL,NULL,NULL),(20,10,'O',NULL,NULL,NULL,NULL),(20,11,'O',NULL,NULL,NULL,NULL),(20,12,'O',NULL,NULL,NULL,NULL),(21,1,'O',NULL,NULL,NULL,NULL),(21,2,'O',NULL,NULL,NULL,NULL),(21,3,'O',NULL,NULL,NULL,NULL),(21,4,'O',NULL,NULL,NULL,NULL),(21,5,'O',NULL,NULL,NULL,NULL),(21,6,'O',NULL,NULL,NULL,NULL),(21,7,'O',NULL,NULL,NULL,NULL),(21,8,'O',NULL,NULL,NULL,NULL),(21,9,'O',NULL,NULL,NULL,NULL),(21,10,'O',NULL,NULL,NULL,NULL),(21,11,'O',NULL,NULL,NULL,NULL),(21,12,'O',NULL,NULL,NULL,NULL),(22,1,'O',NULL,NULL,NULL,NULL),(22,2,'O',NULL,NULL,NULL,NULL),(22,3,'O',NULL,NULL,NULL,NULL),(22,4,'O',NULL,NULL,NULL,NULL),(22,5,'O',NULL,NULL,NULL,NULL),(22,6,'O',NULL,NULL,NULL,NULL),(22,7,'O',NULL,NULL,NULL,NULL),(22,8,'O',NULL,NULL,NULL,NULL),(22,9,'O',NULL,NULL,NULL,NULL),(22,10,'O',NULL,NULL,NULL,NULL),(22,11,'O',NULL,NULL,NULL,NULL),(22,12,'O',NULL,NULL,NULL,NULL),(23,1,'O',NULL,NULL,NULL,NULL),(23,2,'O',NULL,NULL,NULL,NULL),(23,3,'O',NULL,NULL,NULL,NULL),(23,4,'O',NULL,NULL,NULL,NULL),(23,5,'O',NULL,NULL,NULL,NULL),(23,6,'O',NULL,NULL,NULL,NULL),(23,7,'O',NULL,NULL,NULL,NULL),(23,8,'O',NULL,NULL,NULL,NULL),(23,9,'O',NULL,NULL,NULL,NULL),(23,10,'O',NULL,NULL,NULL,NULL),(23,11,'O',NULL,NULL,NULL,NULL),(23,12,'O',NULL,NULL,NULL,NULL),(24,1,'O',NULL,NULL,NULL,NULL),(24,2,'O',NULL,NULL,NULL,NULL),(24,3,'O',NULL,NULL,NULL,NULL),(24,4,'O',NULL,NULL,NULL,NULL),(24,5,'O',NULL,NULL,NULL,NULL),(24,6,'O',NULL,NULL,NULL,NULL),(24,7,'O',NULL,NULL,NULL,NULL),(24,8,'O',NULL,NULL,NULL,NULL),(24,9,'O',NULL,NULL,NULL,NULL),(24,10,'O',NULL,NULL,NULL,NULL),(24,11,'O',NULL,NULL,NULL,NULL),(24,12,'O',NULL,NULL,NULL,NULL),(25,1,'O',NULL,NULL,NULL,NULL),(25,2,'O',NULL,NULL,NULL,NULL),(25,3,'O',NULL,NULL,NULL,NULL),(25,4,'O',NULL,NULL,NULL,NULL),(25,5,'O',NULL,NULL,NULL,NULL),(25,6,'O',NULL,NULL,NULL,NULL),(25,7,'O',NULL,NULL,NULL,NULL),(25,8,'O',NULL,NULL,NULL,NULL),(25,9,'O',NULL,NULL,NULL,NULL),(25,10,'O',NULL,NULL,NULL,NULL),(25,11,'O',NULL,NULL,NULL,NULL),(25,12,'O',NULL,NULL,NULL,NULL),(26,1,'O',NULL,NULL,NULL,NULL),(26,2,'O',NULL,NULL,NULL,NULL),(26,3,'O',NULL,NULL,NULL,NULL),(26,4,'O',NULL,NULL,NULL,NULL),(26,5,'O',NULL,NULL,NULL,NULL),(26,6,'O',NULL,NULL,NULL,NULL),(26,7,'O',NULL,NULL,NULL,NULL),(26,8,'O',NULL,NULL,NULL,NULL),(26,9,'O',NULL,NULL,NULL,NULL),(26,10,'O',NULL,NULL,NULL,NULL),(26,11,'O',NULL,NULL,NULL,NULL),(26,12,'O',NULL,NULL,NULL,NULL),(27,1,'O',NULL,NULL,NULL,NULL),(27,2,'O',NULL,NULL,NULL,NULL),(27,3,'O',NULL,NULL,NULL,NULL),(27,4,'O',NULL,NULL,NULL,NULL),(27,5,'O',NULL,NULL,NULL,NULL),(27,6,'O',NULL,NULL,NULL,NULL),(27,7,'O',NULL,NULL,NULL,NULL),(27,8,'O',NULL,NULL,NULL,NULL),(27,9,'O',NULL,NULL,NULL,NULL),(27,10,'O',NULL,NULL,NULL,NULL),(27,11,'O',NULL,NULL,NULL,NULL),(27,12,'O',NULL,NULL,NULL,NULL),(28,1,'O',NULL,NULL,NULL,NULL),(28,2,'O',NULL,NULL,NULL,NULL),(28,3,'O',NULL,NULL,NULL,NULL),(28,4,'O',NULL,NULL,NULL,NULL),(28,5,'O',NULL,NULL,NULL,NULL),(28,6,'O',NULL,NULL,NULL,NULL),(28,7,'O',NULL,NULL,NULL,NULL),(28,8,'O',NULL,NULL,NULL,NULL),(28,9,'O',NULL,NULL,NULL,NULL),(28,10,'O',NULL,NULL,NULL,NULL),(28,11,'O',NULL,NULL,NULL,NULL),(28,12,'O',NULL,NULL,NULL,NULL),(29,1,'O',NULL,NULL,NULL,NULL),(29,2,'O',NULL,NULL,NULL,NULL),(29,3,'O',NULL,NULL,NULL,NULL),(29,4,'O',NULL,NULL,NULL,NULL),(29,5,'O',NULL,NULL,NULL,NULL),(29,6,'O',NULL,NULL,NULL,NULL),(29,7,'O',NULL,NULL,NULL,NULL),(29,8,'O',NULL,NULL,NULL,NULL),(29,9,'O',NULL,NULL,NULL,NULL),(29,10,'O',NULL,NULL,NULL,NULL),(29,11,'O',NULL,NULL,NULL,NULL),(29,12,'O',NULL,NULL,NULL,NULL),(30,1,'O',NULL,NULL,NULL,NULL),(30,2,'O',NULL,NULL,NULL,NULL),(30,3,'O',NULL,NULL,NULL,NULL),(30,4,'O',NULL,NULL,NULL,NULL),(30,5,'O',NULL,NULL,NULL,NULL),(30,6,'O',NULL,NULL,NULL,NULL),(30,7,'O',NULL,NULL,NULL,NULL),(30,8,'O',NULL,NULL,NULL,NULL),(30,9,'O',NULL,NULL,NULL,NULL),(30,10,'O',NULL,NULL,NULL,NULL),(30,11,'O',NULL,NULL,NULL,NULL),(30,12,'O',NULL,NULL,NULL,NULL),(31,1,'N',NULL,NULL,NULL,NULL),(31,2,'N',NULL,NULL,NULL,NULL),(31,3,'N',NULL,NULL,NULL,NULL),(31,4,'N',NULL,NULL,NULL,NULL),(31,5,'N',NULL,NULL,NULL,NULL),(31,6,'N',NULL,NULL,NULL,NULL),(31,7,'N',NULL,NULL,NULL,NULL),(31,8,'N',NULL,NULL,NULL,NULL),(31,9,'N',NULL,NULL,NULL,NULL),(31,10,'N',NULL,NULL,NULL,NULL),(31,11,'N',NULL,NULL,NULL,NULL),(31,12,'N',NULL,NULL,NULL,NULL),(32,1,'N',NULL,NULL,NULL,NULL),(32,2,'N',NULL,NULL,NULL,NULL),(32,3,'N',NULL,NULL,NULL,NULL),(32,4,'N',NULL,NULL,NULL,NULL),(32,5,'N',NULL,NULL,NULL,NULL),(32,6,'N',NULL,NULL,NULL,NULL),(32,7,'N',NULL,NULL,NULL,NULL),(32,8,'N',NULL,NULL,NULL,NULL),(32,9,'N',NULL,NULL,NULL,NULL),(32,10,'N',NULL,NULL,NULL,NULL),(32,11,'N',NULL,NULL,NULL,NULL),(32,12,'N',NULL,NULL,NULL,NULL),(33,1,'N',NULL,NULL,NULL,NULL),(33,2,'N',NULL,NULL,NULL,NULL),(33,3,'N',NULL,NULL,NULL,NULL),(33,4,'N',NULL,NULL,NULL,NULL),(33,5,'N',NULL,NULL,NULL,NULL),(33,6,'N',NULL,NULL,NULL,NULL),(33,7,'N',NULL,NULL,NULL,NULL),(33,8,'N',NULL,NULL,NULL,NULL),(33,9,'N',NULL,NULL,NULL,NULL),(33,10,'N',NULL,NULL,NULL,NULL),(33,11,'N',NULL,NULL,NULL,NULL),(33,12,'N',NULL,NULL,NULL,NULL),(34,1,'N',NULL,NULL,NULL,NULL),(34,2,'N',NULL,NULL,NULL,NULL),(34,3,'N',NULL,NULL,NULL,NULL),(34,4,'N',NULL,NULL,NULL,NULL),(34,5,'N',NULL,NULL,NULL,NULL),(34,6,'N',NULL,NULL,NULL,NULL),(34,7,'N',NULL,NULL,NULL,NULL),(34,8,'N',NULL,NULL,NULL,NULL),(34,9,'N',NULL,NULL,NULL,NULL),(34,10,'N',NULL,NULL,NULL,NULL),(34,11,'N',NULL,NULL,NULL,NULL),(34,12,'N',NULL,NULL,NULL,NULL),(35,1,'N',NULL,NULL,NULL,NULL),(35,2,'N',NULL,NULL,NULL,NULL),(35,3,'N',NULL,NULL,NULL,NULL),(35,4,'N',NULL,NULL,NULL,NULL),(35,5,'N',NULL,NULL,NULL,NULL),(35,6,'N',NULL,NULL,NULL,NULL),(35,7,'N',NULL,NULL,NULL,NULL),(35,8,'N',NULL,NULL,NULL,NULL),(35,9,'N',NULL,NULL,NULL,NULL),(35,10,'N',NULL,NULL,NULL,NULL),(35,11,'N',NULL,NULL,NULL,NULL),(35,12,'N',NULL,NULL,NULL,NULL),(36,1,'N',NULL,NULL,NULL,NULL),(36,2,'N',NULL,NULL,NULL,NULL),(36,3,'N',NULL,NULL,NULL,NULL),(36,4,'N',NULL,NULL,NULL,NULL),(36,5,'N',NULL,NULL,NULL,NULL),(36,6,'N',NULL,NULL,NULL,NULL),(36,7,'N',NULL,NULL,NULL,NULL),(36,8,'N',NULL,NULL,NULL,NULL),(36,9,'N',NULL,NULL,NULL,NULL),(36,10,'N',NULL,NULL,NULL,NULL),(36,11,'N',NULL,NULL,NULL,NULL),(36,12,'N',NULL,NULL,NULL,NULL),(37,1,'N',NULL,NULL,NULL,NULL),(37,2,'N',NULL,NULL,NULL,NULL),(37,3,'N',NULL,NULL,NULL,NULL),(37,4,'N',NULL,NULL,NULL,NULL),(37,5,'N',NULL,NULL,NULL,NULL),(37,6,'N',NULL,NULL,NULL,NULL),(37,7,'N',NULL,NULL,NULL,NULL),(37,8,'N',NULL,NULL,NULL,NULL),(37,9,'N',NULL,NULL,NULL,NULL),(37,10,'N',NULL,NULL,NULL,NULL),(37,11,'N',NULL,NULL,NULL,NULL),(37,12,'N',NULL,NULL,NULL,NULL),(38,1,'N',NULL,NULL,NULL,NULL),(38,2,'N',NULL,NULL,NULL,NULL),(38,3,'N',NULL,NULL,NULL,NULL),(38,4,'N',NULL,NULL,NULL,NULL),(38,5,'N',NULL,NULL,NULL,NULL),(38,6,'N',NULL,NULL,NULL,NULL),(38,7,'N',NULL,NULL,NULL,NULL),(38,8,'N',NULL,NULL,NULL,NULL),(38,9,'N',NULL,NULL,NULL,NULL),(38,10,'N',NULL,NULL,NULL,NULL),(38,11,'N',NULL,NULL,NULL,NULL),(38,12,'N',NULL,NULL,NULL,NULL),(39,1,'N',NULL,NULL,NULL,NULL),(39,2,'N',NULL,NULL,NULL,NULL),(39,3,'N',NULL,NULL,NULL,NULL),(39,4,'N',NULL,NULL,NULL,NULL),(39,5,'N',NULL,NULL,NULL,NULL),(39,6,'N',NULL,NULL,NULL,NULL),(39,7,'N',NULL,NULL,NULL,NULL),(39,8,'N',NULL,NULL,NULL,NULL),(39,9,'N',NULL,NULL,NULL,NULL),(39,10,'N',NULL,NULL,NULL,NULL),(39,11,'N',NULL,NULL,NULL,NULL),(39,12,'N',NULL,NULL,NULL,NULL),(40,1,'N',NULL,NULL,NULL,NULL),(40,2,'N',NULL,NULL,NULL,NULL),(40,3,'N',NULL,NULL,NULL,NULL),(40,4,'N',NULL,NULL,NULL,NULL),(40,5,'N',NULL,NULL,NULL,NULL),(40,6,'N',NULL,NULL,NULL,NULL),(40,7,'N',NULL,NULL,NULL,NULL),(40,8,'N',NULL,NULL,NULL,NULL),(40,9,'N',NULL,NULL,NULL,NULL),(40,10,'N',NULL,NULL,NULL,NULL),(40,11,'N',NULL,NULL,NULL,NULL),(40,12,'N',NULL,NULL,NULL,NULL),(41,1,'N',NULL,NULL,NULL,NULL),(41,2,'N',NULL,NULL,NULL,NULL),(41,3,'N',NULL,NULL,NULL,NULL),(41,4,'N',NULL,NULL,NULL,NULL),(41,5,'N',NULL,NULL,NULL,NULL),(41,6,'N',NULL,NULL,NULL,NULL),(41,7,'N',NULL,NULL,NULL,NULL),(41,8,'N',NULL,NULL,NULL,NULL),(41,9,'N',NULL,NULL,NULL,NULL),(41,10,'N',NULL,NULL,NULL,NULL),(41,11,'N',NULL,NULL,NULL,NULL),(41,12,'N',NULL,NULL,NULL,NULL),(42,1,'N',NULL,NULL,NULL,NULL),(42,2,'N',NULL,NULL,NULL,NULL),(42,3,'N',NULL,NULL,NULL,NULL),(42,4,'N',NULL,NULL,NULL,NULL),(42,5,'N',NULL,NULL,NULL,NULL),(42,6,'N',NULL,NULL,NULL,NULL),(42,7,'N',NULL,NULL,NULL,NULL),(42,8,'N',NULL,NULL,NULL,NULL),(42,9,'N',NULL,NULL,NULL,NULL),(42,10,'N',NULL,NULL,NULL,NULL),(42,11,'N',NULL,NULL,NULL,NULL),(42,12,'N',NULL,NULL,NULL,NULL),(43,1,'N',NULL,NULL,NULL,NULL),(43,2,'N',NULL,NULL,NULL,NULL),(43,3,'N',NULL,NULL,NULL,NULL),(43,4,'N',NULL,NULL,NULL,NULL),(43,5,'N',NULL,NULL,NULL,NULL),(43,6,'N',NULL,NULL,NULL,NULL),(43,7,'N',NULL,NULL,NULL,NULL),(43,8,'N',NULL,NULL,NULL,NULL),(43,9,'N',NULL,NULL,NULL,NULL),(43,10,'N',NULL,NULL,NULL,NULL),(43,11,'N',NULL,NULL,NULL,NULL),(43,12,'N',NULL,NULL,NULL,NULL),(44,1,'N',NULL,NULL,NULL,NULL),(44,2,'N',NULL,NULL,NULL,NULL),(44,3,'N',NULL,NULL,NULL,NULL),(44,4,'N',NULL,NULL,NULL,NULL),(44,5,'N',NULL,NULL,NULL,NULL),(44,6,'N',NULL,NULL,NULL,NULL),(44,7,'N',NULL,NULL,NULL,NULL),(44,8,'N',NULL,NULL,NULL,NULL),(44,9,'N',NULL,NULL,NULL,NULL),(44,10,'N',NULL,NULL,NULL,NULL),(44,11,'N',NULL,NULL,NULL,NULL),(44,12,'N',NULL,NULL,NULL,NULL),(45,1,'N',NULL,NULL,NULL,NULL),(45,2,'N',NULL,NULL,NULL,NULL),(45,3,'N',NULL,NULL,NULL,NULL),(45,4,'N',NULL,NULL,NULL,NULL),(45,5,'N',NULL,NULL,NULL,NULL),(45,6,'N',NULL,NULL,NULL,NULL),(45,7,'N',NULL,NULL,NULL,NULL),(45,8,'N',NULL,NULL,NULL,NULL),(45,9,'N',NULL,NULL,NULL,NULL),(45,10,'N',NULL,NULL,NULL,NULL),(45,11,'N',NULL,NULL,NULL,NULL),(45,12,'N',NULL,NULL,NULL,NULL),(46,1,'N',NULL,NULL,NULL,NULL),(46,2,'N',NULL,NULL,NULL,NULL),(46,3,'N',NULL,NULL,NULL,NULL),(46,4,'N',NULL,NULL,NULL,NULL),(46,5,'N',NULL,NULL,NULL,NULL),(46,6,'N',NULL,NULL,NULL,NULL),(46,7,'N',NULL,NULL,NULL,NULL),(46,8,'N',NULL,NULL,NULL,NULL),(46,9,'N',NULL,NULL,NULL,NULL),(46,10,'N',NULL,NULL,NULL,NULL),(46,11,'N',NULL,NULL,NULL,NULL),(46,12,'N',NULL,NULL,NULL,NULL),(47,1,'N',NULL,NULL,NULL,NULL),(47,2,'N',NULL,NULL,NULL,NULL),(47,3,'N',NULL,NULL,NULL,NULL),(47,4,'N',NULL,NULL,NULL,NULL),(47,5,'N',NULL,NULL,NULL,NULL),(47,6,'N',NULL,NULL,NULL,NULL),(47,7,'N',NULL,NULL,NULL,NULL),(47,8,'N',NULL,NULL,NULL,NULL),(47,9,'N',NULL,NULL,NULL,NULL),(47,10,'N',NULL,NULL,NULL,NULL),(47,11,'N',NULL,NULL,NULL,NULL),(47,12,'N',NULL,NULL,NULL,NULL),(48,1,'N',NULL,NULL,NULL,NULL),(48,2,'N',NULL,NULL,NULL,NULL),(48,3,'N',NULL,NULL,NULL,NULL),(48,4,'N',NULL,NULL,NULL,NULL),(48,5,'N',NULL,NULL,NULL,NULL),(48,6,'N',NULL,NULL,NULL,NULL),(48,7,'N',NULL,NULL,NULL,NULL),(48,8,'N',NULL,NULL,NULL,NULL),(48,9,'N',NULL,NULL,NULL,NULL),(48,10,'N',NULL,NULL,NULL,NULL),(48,11,'N',NULL,NULL,NULL,NULL),(48,12,'N',NULL,NULL,NULL,NULL),(49,1,'N',NULL,NULL,NULL,NULL),(49,2,'N',NULL,NULL,NULL,NULL),(49,3,'N',NULL,NULL,NULL,NULL),(49,4,'N',NULL,NULL,NULL,NULL),(49,5,'N',NULL,NULL,NULL,NULL),(49,6,'N',NULL,NULL,NULL,NULL),(49,7,'N',NULL,NULL,NULL,NULL),(49,8,'N',NULL,NULL,NULL,NULL),(49,9,'N',NULL,NULL,NULL,NULL),(49,10,'N',NULL,NULL,NULL,NULL),(49,11,'N',NULL,NULL,NULL,NULL),(49,12,'N',NULL,NULL,NULL,NULL),(50,1,'O',NULL,NULL,NULL,NULL),(50,2,'O',NULL,NULL,NULL,NULL),(50,3,'O',NULL,NULL,NULL,NULL),(50,4,'O',NULL,NULL,NULL,NULL),(50,5,'O',NULL,NULL,NULL,NULL),(50,6,'O',NULL,NULL,NULL,NULL),(50,7,'O',NULL,NULL,NULL,NULL),(50,8,'O',NULL,NULL,NULL,NULL),(50,9,'O',NULL,NULL,NULL,NULL),(50,10,'O',NULL,NULL,NULL,NULL),(50,11,'O',NULL,NULL,NULL,NULL),(50,12,'O',NULL,NULL,NULL,NULL),(51,1,'N',NULL,NULL,NULL,NULL),(51,2,'N',NULL,NULL,NULL,NULL),(51,3,'N',NULL,NULL,NULL,NULL),(51,4,'N',NULL,NULL,NULL,NULL),(51,5,'N',NULL,NULL,NULL,NULL),(51,6,'N',NULL,NULL,NULL,NULL),(51,7,'N',NULL,NULL,NULL,NULL),(51,8,'N',NULL,NULL,NULL,NULL),(51,9,'N',NULL,NULL,NULL,NULL),(51,10,'N',NULL,NULL,NULL,NULL),(51,11,'N',NULL,NULL,NULL,NULL),(51,12,'N',NULL,NULL,NULL,NULL),(52,1,'O',NULL,NULL,NULL,NULL),(52,2,'O',NULL,NULL,NULL,NULL),(52,3,'O',NULL,NULL,NULL,NULL),(52,4,'O',NULL,NULL,NULL,NULL),(52,5,'O',NULL,NULL,NULL,NULL),(52,6,'O',NULL,NULL,NULL,NULL),(52,7,'O',NULL,NULL,NULL,NULL),(52,8,'O',NULL,NULL,NULL,NULL),(52,9,'O',NULL,NULL,NULL,NULL),(52,10,'O',NULL,NULL,NULL,NULL),(52,11,'O',NULL,NULL,NULL,NULL),(52,12,'O',NULL,NULL,NULL,NULL),(53,1,'O',NULL,NULL,NULL,NULL),(53,2,'O',NULL,NULL,NULL,NULL),(53,3,'O',NULL,NULL,NULL,NULL),(53,4,'O',NULL,NULL,NULL,NULL),(53,5,'O',NULL,NULL,NULL,NULL),(53,6,'O',NULL,NULL,NULL,NULL),(53,7,'O',NULL,NULL,NULL,NULL),(53,8,'O',NULL,NULL,NULL,NULL),(53,9,'O',NULL,NULL,NULL,NULL),(53,10,'O',NULL,NULL,NULL,NULL),(53,11,'O',NULL,NULL,NULL,NULL),(53,12,'O',NULL,NULL,NULL,NULL),(54,1,'O',NULL,NULL,NULL,NULL),(54,2,'O',NULL,NULL,NULL,NULL),(54,3,'O',NULL,NULL,NULL,NULL),(54,4,'O',NULL,NULL,NULL,NULL),(54,5,'O',NULL,NULL,NULL,NULL),(54,6,'O',NULL,NULL,NULL,NULL),(54,7,'O',NULL,NULL,NULL,NULL),(54,8,'O',NULL,NULL,NULL,NULL),(54,9,'O',NULL,NULL,NULL,NULL),(54,10,'O',NULL,NULL,NULL,NULL),(54,11,'O',NULL,NULL,NULL,NULL),(54,12,'O',NULL,NULL,NULL,NULL),(55,1,'N',NULL,NULL,NULL,NULL),(55,2,'N',NULL,NULL,NULL,NULL),(55,3,'N',NULL,NULL,NULL,NULL),(55,4,'N',NULL,NULL,NULL,NULL),(55,5,'N',NULL,NULL,NULL,NULL),(55,6,'N',NULL,NULL,NULL,NULL),(55,7,'N',NULL,NULL,NULL,NULL),(55,8,'N',NULL,NULL,NULL,NULL),(55,9,'N',NULL,NULL,NULL,NULL),(55,10,'N',NULL,NULL,NULL,NULL),(55,11,'N',NULL,NULL,NULL,NULL),(55,12,'N',NULL,NULL,NULL,NULL),(56,1,'O',NULL,NULL,NULL,NULL),(56,2,'O',NULL,NULL,NULL,NULL),(56,3,'O',NULL,NULL,NULL,NULL),(56,4,'O',NULL,NULL,NULL,NULL),(56,5,'O',NULL,NULL,NULL,NULL),(56,6,'O',NULL,NULL,NULL,NULL),(56,7,'O',NULL,NULL,NULL,NULL),(56,8,'O',NULL,NULL,NULL,NULL),(56,9,'O',NULL,NULL,NULL,NULL),(56,10,'O',NULL,NULL,NULL,NULL),(56,11,'O',NULL,NULL,NULL,NULL),(56,12,'O',NULL,NULL,NULL,NULL),(57,1,'N',NULL,NULL,NULL,NULL),(57,2,'N',NULL,NULL,NULL,NULL),(57,3,'N',NULL,NULL,NULL,NULL),(57,4,'N',NULL,NULL,NULL,NULL),(57,5,'N',NULL,NULL,NULL,NULL),(57,6,'N',NULL,NULL,NULL,NULL),(57,7,'N',NULL,NULL,NULL,NULL),(57,8,'N',NULL,NULL,NULL,NULL),(57,9,'N',NULL,NULL,NULL,NULL),(57,10,'N',NULL,NULL,NULL,NULL),(57,11,'N',NULL,NULL,NULL,NULL),(57,12,'N',NULL,NULL,NULL,NULL),(58,1,'O',NULL,NULL,NULL,NULL),(58,2,'O',NULL,NULL,NULL,NULL),(58,3,'O',NULL,NULL,NULL,NULL),(58,4,'O',NULL,NULL,NULL,NULL),(58,5,'O',NULL,NULL,NULL,NULL),(58,6,'O',NULL,NULL,NULL,NULL),(58,7,'O',NULL,NULL,NULL,NULL),(58,8,'O',NULL,NULL,NULL,NULL),(58,9,'O',NULL,NULL,NULL,NULL),(58,10,'O',NULL,NULL,NULL,NULL),(58,11,'O',NULL,NULL,NULL,NULL),(58,12,'O',NULL,NULL,NULL,NULL),(59,1,'O',NULL,NULL,NULL,NULL),(59,2,'O',NULL,NULL,NULL,NULL),(59,3,'O',NULL,NULL,NULL,NULL),(59,4,'O',NULL,NULL,NULL,NULL),(59,5,'O',NULL,NULL,NULL,NULL),(59,6,'O',NULL,NULL,NULL,NULL),(59,7,'O',NULL,NULL,NULL,NULL),(59,8,'O',NULL,NULL,NULL,NULL),(59,9,'O',NULL,NULL,NULL,NULL),(59,10,'O',NULL,NULL,NULL,NULL),(59,11,'O',NULL,NULL,NULL,NULL),(59,12,'O',NULL,NULL,NULL,NULL),(60,1,'O',NULL,NULL,NULL,NULL),(60,2,'O',NULL,NULL,NULL,NULL),(60,3,'O',NULL,NULL,NULL,NULL),(60,4,'O',NULL,NULL,NULL,NULL),(60,5,'O',NULL,NULL,NULL,NULL),(60,6,'O',NULL,NULL,NULL,NULL),(60,7,'O',NULL,NULL,NULL,NULL),(60,8,'O',NULL,NULL,NULL,NULL),(60,9,'O',NULL,NULL,NULL,NULL),(60,10,'O',NULL,NULL,NULL,NULL),(60,11,'O',NULL,NULL,NULL,NULL),(60,12,'O',NULL,NULL,NULL,NULL),(61,1,'N',NULL,NULL,NULL,NULL),(61,2,'N',NULL,NULL,NULL,NULL),(61,3,'N',NULL,NULL,NULL,NULL),(61,4,'N',NULL,NULL,NULL,NULL),(61,5,'N',NULL,NULL,NULL,NULL),(61,6,'N',NULL,NULL,NULL,NULL),(61,7,'N',NULL,NULL,NULL,NULL),(61,8,'N',NULL,NULL,NULL,NULL),(61,9,'N',NULL,NULL,NULL,NULL),(61,10,'N',NULL,NULL,NULL,NULL),(61,11,'N',NULL,NULL,NULL,NULL),(61,12,'N',NULL,NULL,NULL,NULL),(62,1,'O',NULL,NULL,NULL,NULL),(62,2,'O',NULL,NULL,NULL,NULL),(62,3,'O',NULL,NULL,NULL,NULL),(62,4,'O',NULL,NULL,NULL,NULL),(62,5,'O',NULL,NULL,NULL,NULL),(62,6,'O',NULL,NULL,NULL,NULL),(62,7,'O',NULL,NULL,NULL,NULL),(62,8,'O',NULL,NULL,NULL,NULL),(62,9,'O',NULL,NULL,NULL,NULL),(62,10,'O',NULL,NULL,NULL,NULL),(62,11,'O',NULL,NULL,NULL,NULL),(62,12,'O',NULL,NULL,NULL,NULL),(63,1,'N',NULL,NULL,NULL,NULL),(63,2,'N',NULL,NULL,NULL,NULL),(63,3,'N',NULL,NULL,NULL,NULL),(63,4,'N',NULL,NULL,NULL,NULL),(63,5,'N',NULL,NULL,NULL,NULL),(63,6,'N',NULL,NULL,NULL,NULL),(63,7,'N',NULL,NULL,NULL,NULL),(63,8,'N',NULL,NULL,NULL,NULL),(63,9,'N',NULL,NULL,NULL,NULL),(63,10,'N',NULL,NULL,NULL,NULL),(63,11,'N',NULL,NULL,NULL,NULL),(63,12,'N',NULL,NULL,NULL,NULL),(64,1,'O',NULL,NULL,NULL,NULL),(64,2,'O',NULL,NULL,NULL,NULL),(64,3,'O',NULL,NULL,NULL,NULL),(64,4,'O',NULL,NULL,NULL,NULL),(64,5,'O',NULL,NULL,NULL,NULL),(64,6,'O',NULL,NULL,NULL,NULL),(64,7,'O',NULL,NULL,NULL,NULL),(64,8,'O',NULL,NULL,NULL,NULL),(64,9,'O',NULL,NULL,NULL,NULL),(64,10,'O',NULL,NULL,NULL,NULL),(64,11,'O',NULL,NULL,NULL,NULL),(64,12,'O',NULL,NULL,NULL,NULL),(65,1,'O',NULL,NULL,NULL,NULL),(65,2,'O',NULL,NULL,NULL,NULL),(65,3,'O',NULL,NULL,NULL,NULL),(65,4,'O',NULL,NULL,NULL,NULL),(65,5,'O',NULL,NULL,NULL,NULL),(65,6,'O',NULL,NULL,NULL,NULL),(65,7,'O',NULL,NULL,NULL,NULL),(65,8,'O',NULL,NULL,NULL,NULL),(65,9,'O',NULL,NULL,NULL,NULL),(65,10,'O',NULL,NULL,NULL,NULL),(65,11,'O',NULL,NULL,NULL,NULL),(65,12,'O',NULL,NULL,NULL,NULL),(66,1,'O',NULL,NULL,NULL,NULL),(66,2,'O',NULL,NULL,NULL,NULL),(66,3,'O',NULL,NULL,NULL,NULL),(66,4,'O',NULL,NULL,NULL,NULL),(66,5,'O',NULL,NULL,NULL,NULL),(66,6,'O',NULL,NULL,NULL,NULL),(66,7,'O',NULL,NULL,NULL,NULL),(66,8,'O',NULL,NULL,NULL,NULL),(66,9,'O',NULL,NULL,NULL,NULL),(66,10,'O',NULL,NULL,NULL,NULL),(66,11,'O',NULL,NULL,NULL,NULL),(66,12,'O',NULL,NULL,NULL,NULL),(67,1,'N',NULL,NULL,NULL,NULL),(67,2,'N',NULL,NULL,NULL,NULL),(67,3,'N',NULL,NULL,NULL,NULL),(67,4,'N',NULL,NULL,NULL,NULL),(67,5,'N',NULL,NULL,NULL,NULL),(67,6,'N',NULL,NULL,NULL,NULL),(67,7,'N',NULL,NULL,NULL,NULL),(67,8,'N',NULL,NULL,NULL,NULL),(67,9,'N',NULL,NULL,NULL,NULL),(67,10,'N',NULL,NULL,NULL,NULL),(67,11,'N',NULL,NULL,NULL,NULL),(67,12,'N',NULL,NULL,NULL,NULL),(68,1,'O',NULL,NULL,NULL,NULL),(68,2,'O',NULL,NULL,NULL,NULL),(68,3,'O',NULL,NULL,NULL,NULL),(68,4,'O',NULL,NULL,NULL,NULL),(68,5,'O',NULL,NULL,NULL,NULL),(68,6,'O',NULL,NULL,NULL,NULL),(68,7,'O',NULL,NULL,NULL,NULL),(68,8,'O',NULL,NULL,NULL,NULL),(68,9,'O',NULL,NULL,NULL,NULL),(68,10,'O',NULL,NULL,NULL,NULL),(68,11,'O',NULL,NULL,NULL,NULL),(68,12,'O',NULL,NULL,NULL,NULL),(69,1,'N',NULL,NULL,NULL,NULL),(69,2,'N',NULL,NULL,NULL,NULL),(69,3,'N',NULL,NULL,NULL,NULL),(69,4,'N',NULL,NULL,NULL,NULL),(69,5,'N',NULL,NULL,NULL,NULL),(69,6,'N',NULL,NULL,NULL,NULL),(69,7,'N',NULL,NULL,NULL,NULL),(69,8,'N',NULL,NULL,NULL,NULL),(69,9,'N',NULL,NULL,NULL,NULL),(69,10,'N',NULL,NULL,NULL,NULL),(69,11,'N',NULL,NULL,NULL,NULL),(69,12,'N',NULL,NULL,NULL,NULL),(70,1,'O',NULL,NULL,NULL,NULL),(70,2,'O',NULL,NULL,NULL,NULL),(70,3,'O',NULL,NULL,NULL,NULL),(70,4,'O',NULL,NULL,NULL,NULL),(70,5,'O',NULL,NULL,NULL,NULL),(70,6,'O',NULL,NULL,NULL,NULL),(70,7,'O',NULL,NULL,NULL,NULL),(70,8,'O',NULL,NULL,NULL,NULL),(70,9,'O',NULL,NULL,NULL,NULL),(70,10,'O',NULL,NULL,NULL,NULL),(70,11,'O',NULL,NULL,NULL,NULL),(70,12,'O',NULL,NULL,NULL,NULL),(71,1,'O',NULL,NULL,NULL,NULL),(71,2,'O',NULL,NULL,NULL,NULL),(71,3,'O',NULL,NULL,NULL,NULL),(71,4,'O',NULL,NULL,NULL,NULL),(71,5,'O',NULL,NULL,NULL,NULL),(71,6,'O',NULL,NULL,NULL,NULL),(71,7,'O',NULL,NULL,NULL,NULL),(71,8,'O',NULL,NULL,NULL,NULL),(71,9,'O',NULL,NULL,NULL,NULL),(71,10,'O',NULL,NULL,NULL,NULL),(71,11,'O',NULL,NULL,NULL,NULL),(71,12,'O',NULL,NULL,NULL,NULL),(72,1,'O',NULL,NULL,NULL,NULL),(72,2,'O',NULL,NULL,NULL,NULL),(72,3,'O',NULL,NULL,NULL,NULL),(72,4,'O',NULL,NULL,NULL,NULL),(72,5,'O',NULL,NULL,NULL,NULL),(72,6,'O',NULL,NULL,NULL,NULL),(72,7,'O',NULL,NULL,NULL,NULL),(72,8,'O',NULL,NULL,NULL,NULL),(72,9,'O',NULL,NULL,NULL,NULL),(72,10,'O',NULL,NULL,NULL,NULL),(72,11,'O',NULL,NULL,NULL,NULL),(72,12,'O',NULL,NULL,NULL,NULL),(73,1,'O',NULL,NULL,NULL,NULL),(73,2,'O',NULL,NULL,NULL,NULL),(73,3,'O',NULL,NULL,NULL,NULL),(73,4,'O',NULL,NULL,NULL,NULL),(73,5,'O',NULL,NULL,NULL,NULL),(73,6,'O',NULL,NULL,NULL,NULL),(73,7,'O',NULL,NULL,NULL,NULL),(73,8,'O',NULL,NULL,NULL,NULL),(73,9,'O',NULL,NULL,NULL,NULL),(73,10,'O',NULL,NULL,NULL,NULL),(73,11,'O',NULL,NULL,NULL,NULL),(73,12,'O',NULL,NULL,NULL,NULL),(74,1,'O',NULL,NULL,NULL,NULL),(74,2,'O',NULL,NULL,NULL,NULL),(74,3,'O',NULL,NULL,NULL,NULL),(74,4,'O',NULL,NULL,NULL,NULL),(74,5,'O',NULL,NULL,NULL,NULL),(74,6,'O',NULL,NULL,NULL,NULL),(74,7,'O',NULL,NULL,NULL,NULL),(74,8,'O',NULL,NULL,NULL,NULL),(74,9,'O',NULL,NULL,NULL,NULL),(74,10,'O',NULL,NULL,NULL,NULL),(74,11,'O',NULL,NULL,NULL,NULL),(74,12,'O',NULL,NULL,NULL,NULL),(75,1,'O',NULL,NULL,NULL,NULL),(75,2,'O',NULL,NULL,NULL,NULL),(75,3,'O',NULL,NULL,NULL,NULL),(75,4,'O',NULL,NULL,NULL,NULL),(75,5,'O',NULL,NULL,NULL,NULL),(75,6,'O',NULL,NULL,NULL,NULL),(75,7,'O',NULL,NULL,NULL,NULL),(75,8,'O',NULL,NULL,NULL,NULL),(75,9,'O',NULL,NULL,NULL,NULL),(75,10,'O',NULL,NULL,NULL,NULL),(75,11,'O',NULL,NULL,NULL,NULL),(75,12,'O',NULL,NULL,NULL,NULL),(76,1,'O',NULL,NULL,NULL,NULL),(76,2,'O',NULL,NULL,NULL,NULL),(76,3,'O',NULL,NULL,NULL,NULL),(76,4,'O',NULL,NULL,NULL,NULL),(76,5,'O',NULL,NULL,NULL,NULL),(76,6,'O',NULL,NULL,NULL,NULL),(76,7,'O',NULL,NULL,NULL,NULL),(76,8,'O',NULL,NULL,NULL,NULL),(76,9,'O',NULL,NULL,NULL,NULL),(76,10,'O',NULL,NULL,NULL,NULL),(76,11,'O',NULL,NULL,NULL,NULL),(76,12,'O',NULL,NULL,NULL,NULL),(77,1,'O',NULL,NULL,NULL,NULL),(77,2,'O',NULL,NULL,NULL,NULL),(77,3,'O',NULL,NULL,NULL,NULL),(77,4,'O',NULL,NULL,NULL,NULL),(77,5,'O',NULL,NULL,NULL,NULL),(77,6,'O',NULL,NULL,NULL,NULL),(77,7,'O',NULL,NULL,NULL,NULL),(77,8,'O',NULL,NULL,NULL,NULL),(77,9,'O',NULL,NULL,NULL,NULL),(77,10,'O',NULL,NULL,NULL,NULL),(77,11,'O',NULL,NULL,NULL,NULL),(77,12,'O',NULL,NULL,NULL,NULL),(78,1,'O',NULL,NULL,NULL,NULL),(78,2,'O',NULL,NULL,NULL,NULL),(78,3,'O',NULL,NULL,NULL,NULL),(78,4,'O',NULL,NULL,NULL,NULL),(78,5,'O',NULL,NULL,NULL,NULL),(78,6,'O',NULL,NULL,NULL,NULL),(78,7,'O',NULL,NULL,NULL,NULL),(78,8,'O',NULL,NULL,NULL,NULL),(78,9,'O',NULL,NULL,NULL,NULL),(78,10,'O',NULL,NULL,NULL,NULL),(78,11,'O',NULL,NULL,NULL,NULL),(78,12,'O',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `em_rel_dispo_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_rel_dispo_matiere`
--

DROP TABLE IF EXISTS `em_rel_dispo_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_rel_dispo_matiere` (
  `ID_HORAIRE_HBDO` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `FL_DISPO_MATIERE` char(1) NOT NULL DEFAULT 'O',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_HORAIRE_HBDO`,`ID_MATIERE`),
  KEY `I_FK_EM_REL_DISPO_MATIERE_PA_HORAIRE_SEMAINE` (`ID_HORAIRE_HBDO`),
  KEY `I_FK_EM_REL_DISPO_MATIERE_PA_MATIERE` (`ID_MATIERE`),
  CONSTRAINT `FK_EM_REL_DISPO_MATIERE_PA_HORAIRE_SEMAINE` FOREIGN KEY (`ID_HORAIRE_HBDO`) REFERENCES `pa_horaire_semaine` (`ID_HORAIRE_HBDO`),
  CONSTRAINT `FK_EM_REL_DISPO_MATIERE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `em_rel_dispo_matiere_chk_1` CHECK ((`FL_DISPO_MATIERE` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_rel_dispo_matiere`
--

LOCK TABLES `em_rel_dispo_matiere` WRITE;
/*!40000 ALTER TABLE `em_rel_dispo_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_rel_dispo_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_rel_dispo_prof`
--

DROP TABLE IF EXISTS `em_rel_dispo_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_rel_dispo_prof` (
  `ID_PERSONNEL` int NOT NULL,
  `ID_HORAIRE_HBDO` int NOT NULL,
  `FL_DISPO_PROF` char(1) NOT NULL DEFAULT 'O',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONNEL`,`ID_HORAIRE_HBDO`),
  KEY `I_FK_EM_REL_DISPO_PROF_PE_PROFESSEUR` (`ID_PERSONNEL`),
  KEY `I_FK_EM_REL_DISPO_PROF_PA_HORAIRE_SEMAINE` (`ID_HORAIRE_HBDO`),
  KEY `FK_SE_USERNAME_CREA_EM_REL_DISPO_PROF` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EM_REL_DISPO_PROF` (`USERNAME_UPD`),
  CONSTRAINT `FK_EM_REL_DISPO_PROF_PA_HORAIRE_SEMAINE` FOREIGN KEY (`ID_HORAIRE_HBDO`) REFERENCES `pa_horaire_semaine` (`ID_HORAIRE_HBDO`),
  CONSTRAINT `FK_EM_REL_DISPO_PROF_PE_PROFESSEUR` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_professeur` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EM_REL_DISPO_PROF` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EM_REL_DISPO_PROF` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `em_rel_dispo_prof_chk_1` CHECK ((`FL_DISPO_PROF` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Disponibilite Professeur';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_rel_dispo_prof`
--

LOCK TABLES `em_rel_dispo_prof` WRITE;
/*!40000 ALTER TABLE `em_rel_dispo_prof` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_rel_dispo_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_version_emploitemps`
--

DROP TABLE IF EXISTS `em_version_emploitemps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em_version_emploitemps` (
  `ID_VERSION_EMPLOITEMPS` smallint NOT NULL AUTO_INCREMENT,
  `ID_CLASSE` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `LIB_VERSION_EMPLOITEMPS` varchar(128) NOT NULL,
  `STATU_EMPLOITEMPS` char(1) NOT NULL DEFAULT 'N',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_VERSION_EMPLOITEMPS`),
  KEY `I_FK_EM_VERSION_EMPLOITEMPS_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EM_VERSION_EMPLOITEMPS_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_EL_EM_VERSION_EMPLOITEMPS` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EL_EM_VERSION_EMPLOITEMPS` (`USERNAME_UPD`),
  CONSTRAINT `FK_EM_VERSION_EMPLOITEMPS_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EM_VERSION_EMPLOITEMPS_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EL_EM_VERSION_EMPLOITEMPS` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EL_EM_VERSION_EMPLOITEMPS` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `em_version_emploitemps_chk_1` CHECK ((`STATU_EMPLOITEMPS` in (_utf8mb4'I',_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_version_emploitemps`
--

LOCK TABLES `em_version_emploitemps` WRITE;
/*!40000 ALTER TABLE `em_version_emploitemps` DISABLE KEYS */;
INSERT INTO `em_version_emploitemps` VALUES (1,1,1,'Version 1','O',NULL,NULL,NULL,NULL),(2,2,1,'Version 2','O',NULL,NULL,NULL,NULL),(3,3,1,'Version 3','O',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `em_version_emploitemps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_bordreau_retrait_bulletin`
--

DROP TABLE IF EXISTS `ev_bordreau_retrait_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_bordreau_retrait_bulletin` (
  `ID_BORDERAU` int NOT NULL AUTO_INCREMENT,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_PERIODE` int NOT NULL,
  `TS_RETRAIT_BUL` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NOM_PERS_BORD` varchar(45) DEFAULT NULL,
  `PRENOM_PERS_BORD` varchar(128) DEFAULT NULL,
  `DATE_NAIS_PERS_BORD` varchar(128) DEFAULT NULL,
  `LIEN_ELEV_PERS_RETRAIT` varchar(45) DEFAULT NULL,
  `DOC_IDEN_BORD` varchar(45) DEFAULT NULL,
  `LIEN_SIGNATURE` varchar(45) DEFAULT NULL,
  `USER_CREATE` varchar(45) DEFAULT NULL,
  `TS_CREATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_BORDERAU`),
  UNIQUE KEY `I_PU_EV_BORDEREAU_EL_INSCRIPTION` (`ID_INSCRIPTION`,`ID_PERIODE`),
  KEY `I_FK_EV_BORDEREAU_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_EV_BORDEREAU_PA_PERIOD_EVAL` (`ID_PERIODE`),
  CONSTRAINT `FK_EV_BORDEREAU_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_BORDEREAU_PA_PERIOD_EVAL` FOREIGN KEY (`ID_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='EV_BORDREAU_RETRAIT_BULLETIN';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_bordreau_retrait_bulletin`
--

LOCK TABLES `ev_bordreau_retrait_bulletin` WRITE;
/*!40000 ALTER TABLE `ev_bordreau_retrait_bulletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_bordreau_retrait_bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_comment_difficult`
--

DROP TABLE IF EXISTS `ev_comment_difficult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_comment_difficult` (
  `ID_DIFFICULT` int NOT NULL AUTO_INCREMENT,
  `ID_PA_DIFFICULT` int DEFAULT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_INSCRIPTION` int DEFAULT NULL,
  `ID_MATIERE` int DEFAULT NULL,
  `ID_PA_PERIODE` int DEFAULT NULL,
  `ID_PA_NIV` int DEFAULT NULL,
  `ID_CLASSE` int DEFAULT NULL,
  `DESC_DIFFICULT` varchar(256) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DIFFICULT`),
  KEY `FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB` (`ID_PA_DIFFICULT`),
  KEY `FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB_PERIOD` (`ID_PA_PERIODE`),
  KEY `FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB_NIVEAU` (`ID_PA_NIV`),
  KEY `FK_EV_COMMENT_DIFFICULT_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_EV_COMMENT_DIFFICULT_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `FK_EV_COMMENT_DIFFICULT_PA_MATIERE` (`ID_MATIERE`),
  KEY `FK_EV_COMMENT_DIFFICULT_PA_CLASSE` (`ID_CLASSE`),
  CONSTRAINT `FK_EV_COMMENT_DIFFICULT_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_COMMENT_DIFFICULT_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EV_COMMENT_DIFFICULT_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EV_COMMENT_DIFFICULT_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_DIFFICULT`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB_NIVEAU` FOREIGN KEY (`ID_PA_NIV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB_PERIOD` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Commentaire difficulte';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_comment_difficult`
--

LOCK TABLES `ev_comment_difficult` WRITE;
/*!40000 ALTER TABLE `ev_comment_difficult` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_comment_difficult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_comment_solution`
--

DROP TABLE IF EXISTS `ev_comment_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_comment_solution` (
  `ID_SOLUTION` int NOT NULL AUTO_INCREMENT,
  `ID_PA_SOLUTION` int DEFAULT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_INSCRIPTION` int DEFAULT NULL,
  `ID_MATIERE` int DEFAULT NULL,
  `ID_PA_PERIODE` int DEFAULT NULL,
  `ID_PA_NIV` int DEFAULT NULL,
  `ID_CLASSE` int DEFAULT NULL,
  `DESC_SOLUTION` varchar(256) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SOLUTION`),
  KEY `FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB` (`ID_PA_SOLUTION`),
  KEY `FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB_PERIOD` (`ID_PA_PERIODE`),
  KEY `FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB_NIVEAU` (`ID_PA_NIV`),
  KEY `FK_EV_COMMENT_SOLUTION_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_EV_COMMENT_SOLUTION_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `FK_EV_COMMENT_SOLUTION_PA_MATIERE` (`ID_MATIERE`),
  KEY `FK_EV_COMMENT_SOLUTION_PA_CLASSE` (`ID_CLASSE`),
  CONSTRAINT `FK_EV_COMMENT_SOLUTION_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_COMMENT_SOLUTION_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EV_COMMENT_SOLUTION_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EV_COMMENT_SOLUTION_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_SOLUTION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB_NIVEAU` FOREIGN KEY (`ID_PA_NIV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB_PERIOD` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='commentaire solution';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_comment_solution`
--

LOCK TABLES `ev_comment_solution` WRITE;
/*!40000 ALTER TABLE `ev_comment_solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_comment_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_evaluation`
--

DROP TABLE IF EXISTS `ev_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_evaluation` (
  `ID_EVALUATION` int NOT NULL AUTO_INCREMENT,
  `ID_PA_TYPE_EVALUATION` int NOT NULL,
  `ID_PA_STATU_EVALUATION` int DEFAULT NULL,
  `ID_PA_STATU_VALID` int DEFAULT NULL,
  `ID_MATIERE` int NOT NULL,
  `ID_SOU_MATIERE` int DEFAULT NULL,
  `ID_CLASSE` int NOT NULL,
  `LIB_EVALUATION` varchar(64) NOT NULL,
  `DAT_DEB_EVALUATION` datetime NOT NULL,
  `DUREE_EVALUATION` time NOT NULL,
  `FL_SUPR_EVALUATION` char(1) NOT NULL DEFAULT 'N',
  `LN_SUJET_EVALUATION` mediumblob,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  `DAT_OUV_EVAL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_EVALUATION`),
  KEY `I_FK_EV_EVALUATION_PA_PARAM_GLOB` (`ID_PA_TYPE_EVALUATION`),
  KEY `I_FK_EV_EVALUATION_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EV_EVALUATION_PA_SOU_MATIERE` (`ID_SOU_MATIERE`),
  KEY `I_FK_EV_EVALUATION_PA_CLASSE` (`ID_CLASSE`),
  KEY `I_FK_EV_EVALUATION_PA_PARAM_GLOB1` (`ID_PA_STATU_EVALUATION`),
  KEY `I_FK_EV_EVALUATION_PA_PARAM_GLOB2` (`ID_PA_STATU_VALID`),
  KEY `I_FK_EV_EVALUATION_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_EVALUATION` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EVALUATION` (`USERNAME_UPD`),
  CONSTRAINT `FK_EV_EVALUATION_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EV_EVALUATION_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EV_EVALUATION_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EV_EVALUATION_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYPE_EVALUATION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_EVALUATION_PA_PARAM_GLOB1` FOREIGN KEY (`ID_PA_STATU_EVALUATION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_EVALUATION_PA_SOU_MATIERE` FOREIGN KEY (`ID_SOU_MATIERE`) REFERENCES `pa_sou_matiere` (`ID_SOU_MATIERE`),
  CONSTRAINT `FK_EV_EVALUATION_PA_STATUT_VAL` FOREIGN KEY (`ID_PA_STATU_VALID`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_EVALUATION_PARAM_GLOB_STATU_VALID` FOREIGN KEY (`ID_PA_STATU_VALID`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EVALUATION` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EVALUATION` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `ev_evaluation_chk_1` CHECK ((`FL_SUPR_EVALUATION` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Evaluation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_evaluation`
--

LOCK TABLES `ev_evaluation` WRITE;
/*!40000 ALTER TABLE `ev_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_moyenne_matiere`
--

DROP TABLE IF EXISTS `ev_moyenne_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_moyenne_matiere` (
  `ID_PA_PERIODE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_PA_APPRECIATION` int DEFAULT NULL,
  `ID_MATIERE` int NOT NULL,
  `ID_PA_MODULE` int DEFAULT NULL,
  `MOY_MATIERE` decimal(4,2) NOT NULL,
  `MOY_DEVOIR` decimal(4,2) DEFAULT NULL,
  `MOY_COMPO` decimal(4,2) DEFAULT NULL,
  `RANG_MOY_MATIERE` int NOT NULL,
  `COEF_MOY_MATIERE` decimal(4,2) NOT NULL,
  `POINT_PONDERE_MOY` decimal(6,2) NOT NULL,
  `MOY_RACHA` decimal(4,2) NOT NULL DEFAULT '0.00',
  `BAREME` int NOT NULL DEFAULT '20',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_PERIODE`,`ID_INSCRIPTION`,`ID_MATIERE`),
  KEY `I_FK_EV_MOYENNE_MATIERE_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EV_MOYENNE_MATIERE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_EV_MOYENNE_MATIERE_PA_PARAM_GLOB` (`ID_PA_PERIODE`),
  KEY `IK_ID_PA_APPRECIATION__MOY_MAT` (`ID_PA_APPRECIATION`),
  KEY `FK_SE_USERNAME_CREA_MOY_MAT` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD__MOY_MAT` (`USERNAME_UPD`),
  CONSTRAINT `FK_EV_MOYENNE_MATIERE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_MOYENNE_MATIERE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `fk_ev_moyenne_matiere_pa_param_glob_appreciation` FOREIGN KEY (`ID_PA_APPRECIATION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_MOYENNE_MATIERE_PA_PARAM_GLOB_periode` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_MOY_MAT` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD__MOY_MAT` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Moyenne Matiere';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_moyenne_matiere`
--

LOCK TABLES `ev_moyenne_matiere` WRITE;
/*!40000 ALTER TABLE `ev_moyenne_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_moyenne_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_moyenne_module`
--

DROP TABLE IF EXISTS `ev_moyenne_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_moyenne_module` (
  `ID_PA_PERIODE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_PA_MODULE` int NOT NULL,
  `MOY_MODULE` decimal(4,2) NOT NULL,
  `COEF_MOY_MODULE` decimal(4,2) NOT NULL,
  `COEF_TOTAL_MODULE` decimal(4,2) NOT NULL,
  `POINT_PONDERE_MOY` decimal(6,2) NOT NULL,
  `POIN_PONDERE_GLOB` decimal(7,2) DEFAULT '0.00',
  `RETRAIT_POIN` decimal(5,2) DEFAULT '0.00',
  `POIN_PONDERE_AV_RETRAIT` decimal(7,2) DEFAULT '0.00',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_PERIODE`,`ID_INSCRIPTION`,`ID_PA_MODULE`),
  KEY `I_FK_EV_MOYENNE_MODULE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB` (`ID_PA_PERIODE`),
  KEY `I_FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB_MODULE` (`ID_PA_MODULE`),
  KEY `FK_SE_USERNAME_UPD_EV_MOYENNE_MODULE` (`USERNAME_UPD`),
  KEY `FK_SE_USERNAME_CREA_EV_MOYENNE_MODULE` (`USERNAME_CREA`),
  CONSTRAINT `FK_EV_MOYENNE_MODULE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_MODULE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB_PERIOD` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EV_MOYENNE_MODULE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EV_MOYENNE_MODULE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Moyenne Module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_moyenne_module`
--

LOCK TABLES `ev_moyenne_module` WRITE;
/*!40000 ALTER TABLE `ev_moyenne_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_moyenne_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_moyenne_periode`
--

DROP TABLE IF EXISTS `ev_moyenne_periode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_moyenne_periode` (
  `ID_INSCRIPTION` int NOT NULL,
  `ID_PA_PERIODE` int NOT NULL,
  `MOY_PRIOD` decimal(4,2) NOT NULL,
  `RANG_PRIOD` int NOT NULL,
  `DATE_VALID_MOY_PRD` datetime DEFAULT NULL,
  `LN_BULETIN_MOY_PRIOD` varchar(1024) NOT NULL,
  `ID_PA_HONEUR` int DEFAULT NULL,
  `RETRAIT_POIN_ABS` decimal(7,2) NOT NULL DEFAULT '0.00',
  `RETRAIT_POIN_INCIDEN` decimal(7,2) NOT NULL DEFAULT '0.00',
  `RETRAIT_POIN_AUTR` decimal(7,2) NOT NULL DEFAULT '0.00',
  `TOTAL_POIN_PONDERE` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TOTAL_POIN_PONDERE_AV_RACHA` decimal(10,2) DEFAULT NULL,
  `MOY_PRIOD_AV_RACHA` decimal(4,2) DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL1` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL2` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL3` int DEFAULT NULL,
  `ID_NIV_ETU_RDOUBL4` int DEFAULT NULL,
  `COEF_PRIOD` decimal(4,2) NOT NULL DEFAULT '0.00',
  `FL_MOY_GNRL` char(1) NOT NULL DEFAULT 'N',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_INSCRIPTION`,`ID_PA_PERIODE`),
  KEY `I_FK_EV_MOYENNE_PERIODE_PA_PARAM_GLOB` (`ID_PA_PERIODE`),
  KEY `I_FK_EV_MOYENNE_PERIODE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `FK_EV_MOYENNE_PERIODE_PA_PARAM_HONEUR` (`ID_PA_HONEUR`),
  KEY `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE` (`ID_NIV_ETU_RDOUBL1`),
  KEY `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE2` (`ID_NIV_ETU_RDOUBL2`),
  KEY `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE3` (`ID_NIV_ETU_RDOUBL3`),
  KEY `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE4` (`ID_NIV_ETU_RDOUBL4`),
  KEY `FK_SE_USERNAME_CREA_MOY_PERIOD` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_MOY_PERIOD` (`USERNAME_UPD`),
  CONSTRAINT `FK_EV_MOYENNE_PERIODE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETU_RDOUBL1`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE2` FOREIGN KEY (`ID_NIV_ETU_RDOUBL2`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE3` FOREIGN KEY (`ID_NIV_ETU_RDOUBL3`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE4` FOREIGN KEY (`ID_NIV_ETU_RDOUBL4`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EV_MOYENNE_PERIODE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_MOYENNE_PERIODE_PA_PARAM_HONEUR` FOREIGN KEY (`ID_PA_HONEUR`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_MOY_PERIOD` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_MOY_PERIOD` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Moyenne General';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_moyenne_periode`
--

LOCK TABLES `ev_moyenne_periode` WRITE;
/*!40000 ALTER TABLE `ev_moyenne_periode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_moyenne_periode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_moyenne_sou_matiere`
--

DROP TABLE IF EXISTS `ev_moyenne_sou_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_moyenne_sou_matiere` (
  `ID_PA_PERIODE` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `ID_SOU_MATIERE` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `MOY_SOU_MATIERE` decimal(4,2) NOT NULL,
  `MOY_SOU_MATIERE_DEVOIR` decimal(4,2) NOT NULL,
  `MOY_SOU_MATIERE_COMPO` decimal(4,2) NOT NULL,
  `COEF_MOY_SOU_MATIERE` decimal(4,2) NOT NULL,
  `POINT_PONDERE_MOY_SOU_MATIERE` decimal(6,2) NOT NULL,
  `MOY_RACHA` decimal(4,2) NOT NULL DEFAULT '0.00',
  `RANG_MOY_SOU_MATIERE` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_PERIODE`,`ID_INSCRIPTION`,`ID_SOU_MATIERE`),
  KEY `I_FK_EV_MOYENNE_SOU_MATIERE_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EV_MOYENNE_SOU_MATIERE_PA_SOU_MATIERE` (`ID_SOU_MATIERE`),
  KEY `I_FK_EV_MOYENNE_SOU_MATIERE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `I_FK_EV_MOYENNE_SOU_MATIERE_PA_PARAM_GLOB` (`ID_PA_PERIODE`),
  KEY `FK_SE_USERNAME_UPD_EV_MOYENNE_SOU_MATIERE` (`USERNAME_UPD`),
  KEY `FK_SE_USERNAME_CREA_EV_MOYENNE_SOU_MATIERE` (`USERNAME_CREA`),
  CONSTRAINT `FK_EV_MOYENNE_SOU_MATIERE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_MOYENNE_SOU_MATIERE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EV_MOYENNE_SOU_MATIERE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_MOYENNE_SOU_MATIERE_PA_SOU_MATIERE` FOREIGN KEY (`ID_SOU_MATIERE`) REFERENCES `pa_sou_matiere` (`ID_SOU_MATIERE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EV_MOYENNE_SOU_MATIERE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EV_MOYENNE_SOU_MATIERE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Moyenne Sous Matiere';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_moyenne_sou_matiere`
--

LOCK TABLES `ev_moyenne_sou_matiere` WRITE;
/*!40000 ALTER TABLE `ev_moyenne_sou_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_moyenne_sou_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_param_apprec_matiere`
--

DROP TABLE IF EXISTS `ev_param_apprec_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_param_apprec_matiere` (
  `ID_PARAM` int NOT NULL AUTO_INCREMENT,
  `LIB_PARAM` varchar(255) NOT NULL,
  `ID_MATIERE` int DEFAULT NULL,
  `ID_NIV_ETU` int DEFAULT NULL,
  `FL_SUP` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID_PARAM`),
  UNIQUE KEY `UI_matiere_niveau` (`ID_MATIERE`,`ID_NIV_ETU`),
  KEY `i_fk_pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `fk_ev_param_apprec_matiere_pa_matiere` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `fk_ev_param_apprec_matiere_pa_niv_etude` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `chk_fl_sup` CHECK ((`FL_SUP` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Paramètre appréciation par matière';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_param_apprec_matiere`
--

LOCK TABLES `ev_param_apprec_matiere` WRITE;
/*!40000 ALTER TABLE `ev_param_apprec_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_param_apprec_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_param_calc_moy_typ_eval`
--

DROP TABLE IF EXISTS `ev_param_calc_moy_typ_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_param_calc_moy_typ_eval` (
  `ID_CALC_MOY_TYP_EVAL` int NOT NULL AUTO_INCREMENT,
  `ID_PA_TYP_EVAL` int NOT NULL,
  `ID_NIV_ETU` int DEFAULT NULL,
  `ID_MATIERE` int DEFAULT NULL,
  `FL_COEF_DEFAULT` char(1) DEFAULT NULL,
  `VAL_COEFF` int NOT NULL,
  `FL_DEL` char(1) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CALC_MOY_TYP_EVAL`),
  UNIQUE KEY `I_PU_EV_PARAM_CALC_MOY_TYP_EVAL` (`ID_PA_TYP_EVAL`,`ID_NIV_ETU`,`ID_MATIERE`),
  KEY `I_FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_NIV_ETUDE` (`ID_NIV_ETU`),
  KEY `I_FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_PARAM_GLOB` (`ID_PA_TYP_EVAL`),
  KEY `FK_SE_USERNAME_CREA_EV_PARAM_CALC_MOY_TYP_EVAL` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPDATE_EV_PARAM_CALC_MOY_TYP_EVAL` (`USERNAME_UPD`),
  CONSTRAINT `FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYP_EVAL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EV_PARAM_CALC_MOY_TYP_EVAL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPDATE_EV_PARAM_CALC_MOY_TYP_EVAL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='PARAM CALC MOY TYP EVAL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_param_calc_moy_typ_eval`
--

LOCK TABLES `ev_param_calc_moy_typ_eval` WRITE;
/*!40000 ALTER TABLE `ev_param_calc_moy_typ_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_param_calc_moy_typ_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_param_det_apprec_matiere`
--

DROP TABLE IF EXISTS `ev_param_det_apprec_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_param_det_apprec_matiere` (
  `ID_DET_PARAM` int NOT NULL AUTO_INCREMENT,
  `ID_PARAM_GLOB` int NOT NULL,
  `ID_PARAM` int NOT NULL,
  `MOY_INF` decimal(5,2) NOT NULL,
  `MOY_SUP` decimal(5,2) NOT NULL,
  `FL_SUP` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID_DET_PARAM`),
  UNIQUE KEY `UI_e_moyennes_param` (`ID_PARAM`,`ID_PARAM_GLOB`),
  KEY `i_fk_pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `fk_pa_param_glob` FOREIGN KEY (`ID_PARAM_GLOB`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `fk_param_apprec` FOREIGN KEY (`ID_PARAM`) REFERENCES `ev_param_apprec_matiere` (`ID_PARAM`),
  CONSTRAINT `chk_fl_sup_det` CHECK ((`FL_SUP` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Détails appréciation matière';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_param_det_apprec_matiere`
--

LOCK TABLES `ev_param_det_apprec_matiere` WRITE;
/*!40000 ALTER TABLE `ev_param_det_apprec_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_param_det_apprec_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_rel_evaluation_periode`
--

DROP TABLE IF EXISTS `ev_rel_evaluation_periode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_rel_evaluation_periode` (
  `ID_PA_PERIODE` int NOT NULL,
  `ID_EVALUATION` int NOT NULL,
  `COEF_EVAL` decimal(4,2) NOT NULL,
  `FL_PERIOD_PRINC` char(1) NOT NULL DEFAULT 'O',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_PERIODE`,`ID_EVALUATION`),
  KEY `I_FK_EV_REL_EVALUATION_PERIODE_PA_PARAM_GLOB` (`ID_PA_PERIODE`),
  KEY `I_FK_EV_REL_EVALUATION_PERIODE_EV_EVALUATION` (`ID_EVALUATION`),
  KEY `FK_SE_USERNAME_CREA_EVAL_PERD` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EVAL_PERD` (`USERNAME_UPD`),
  CONSTRAINT `FK_EV_REL_EVALUATION_PERIODE_EV_EVALUATION` FOREIGN KEY (`ID_EVALUATION`) REFERENCES `ev_evaluation` (`ID_EVALUATION`),
  CONSTRAINT `FK_EV_REL_EVALUATION_PERIODE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EVAL_PERD` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EVAL_PERD` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `ev_rel_evaluation_periode_chk_1` CHECK ((`FL_PERIOD_PRINC` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Evaluation Periode';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_rel_evaluation_periode`
--

LOCK TABLES `ev_rel_evaluation_periode` WRITE;
/*!40000 ALTER TABLE `ev_rel_evaluation_periode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_rel_evaluation_periode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_rel_note_eval_eleve`
--

DROP TABLE IF EXISTS `ev_rel_note_eval_eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_rel_note_eval_eleve` (
  `ID_EVALUATION` int NOT NULL,
  `ID_INSCRIPTION` int NOT NULL,
  `NOT_EVALUATION` decimal(4,2) NOT NULL,
  `DAT_ENR_EVALUATION` datetime DEFAULT NULL,
  `DAT_VERIF_EVALUATION` datetime DEFAULT NULL,
  `DAT_VALID_EVALUATION` datetime DEFAULT NULL,
  `FL_ENR_EVALUATION` char(1) NOT NULL DEFAULT 'N',
  `FL_VERIF_EVALUATION` char(1) NOT NULL DEFAULT 'N',
  `FL_VALID_EVALUATION` char(1) NOT NULL DEFAULT 'N',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_EVALUATION`,`ID_INSCRIPTION`),
  KEY `I_FK_EV_REL_NOTE_EVAL_ELEVE_EV_EVALUATION` (`ID_EVALUATION`),
  KEY `I_FK_EV_REL_NOTE_EVAL_ELEVE_EL_INSCRIPTION` (`ID_INSCRIPTION`),
  KEY `FK_SE_USERNAME_CREA_EV_NOTE_ELV` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_EV_NOTE_ELV` (`USERNAME_UPD`),
  CONSTRAINT `FK_EV_REL_NOTE_EVAL_ELEVE_EL_INSCRIPTION` FOREIGN KEY (`ID_INSCRIPTION`) REFERENCES `el_inscription` (`ID_INSCRIPTION`),
  CONSTRAINT `FK_EV_REL_NOTE_EVAL_ELEVE_EV_EVALUATION` FOREIGN KEY (`ID_EVALUATION`) REFERENCES `ev_evaluation` (`ID_EVALUATION`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EV_NOTE_ELV` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EV_NOTE_ELV` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `ev_rel_note_eval_eleve_chk_1` CHECK ((`FL_ENR_EVALUATION` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `ev_rel_note_eval_eleve_chk_2` CHECK ((`FL_VERIF_EVALUATION` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `ev_rel_note_eval_eleve_chk_3` CHECK ((`FL_VALID_EVALUATION` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Evaluation Eleve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_rel_note_eval_eleve`
--

LOCK TABLES `ev_rel_note_eval_eleve` WRITE;
/*!40000 ALTER TABLE `ev_rel_note_eval_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_rel_note_eval_eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_rel_param_glob`
--

DROP TABLE IF EXISTS `ev_rel_param_glob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_rel_param_glob` (
  `ID_REL_PARAM_GLOB` int NOT NULL AUTO_INCREMENT,
  `ID_PARAM_GLOB` int NOT NULL,
  `ID_NIV_ETUDE` int DEFAULT NULL,
  `ID_NIV_ETUDE_UNIQUE` int GENERATED ALWAYS AS (coalesce(`ID_NIV_ETUDE`,-(1))) STORED,
  `MOY_MIN` decimal(4,2) NOT NULL,
  `MOY_MAX` decimal(4,2) NOT NULL,
  `NB_HEUR_ABSENCE_MAX` int DEFAULT '0',
  `NB_INCIDENT_MAX` int DEFAULT '0',
  PRIMARY KEY (`ID_REL_PARAM_GLOB`),
  UNIQUE KEY `UK_PARAM_NIVEAU_FIX` (`ID_PARAM_GLOB`,`ID_NIV_ETUDE_UNIQUE`),
  KEY `FK_EV_REL_PARAM_GLOB_PA_NIV_ETUDE` (`ID_NIV_ETUDE`),
  CONSTRAINT `FK_EV_REL_PARAM_GLOB_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETUDE`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_EV_REL_PARAM_GLOB_PA_PARAM_GLOB` FOREIGN KEY (`ID_PARAM_GLOB`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='RÈGLE D''ATTRIBUTION DES TABLEAUX D''HONNEUR ET DE CONDUITE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_rel_param_glob`
--

LOCK TABLES `ev_rel_param_glob` WRITE;
/*!40000 ALTER TABLE `ev_rel_param_glob` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_rel_param_glob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_rel_regle_moyenne_periode_matiere`
--

DROP TABLE IF EXISTS `ev_rel_regle_moyenne_periode_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_rel_regle_moyenne_periode_matiere` (
  `ID_MATIERE` int NOT NULL,
  `ID_PA_PERIODE` int NOT NULL,
  `ID_PA_REGL_CALC_MOY` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_CLASSE` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_MATIERE`,`ID_PA_PERIODE`,`ID_AN_SCOLAIRE`,`ID_CLASSE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB` (`ID_PA_PERIODE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB2` (`ID_PA_REGL_CALC_MOY`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_CLASSE` (`ID_CLASSE`),
  KEY `FK_SE_USERNAME_CREA_MOY_PRD_MAT` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_MOY_PRD_MAT` (`USERNAME_UPD`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_REGL_CALC_MOY`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_MOY_PRD_MAT` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_MOY_PRD_MAT` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_rel_regle_moyenne_periode_matiere`
--

LOCK TABLES `ev_rel_regle_moyenne_periode_matiere` WRITE;
/*!40000 ALTER TABLE `ev_rel_regle_moyenne_periode_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_rel_regle_moyenne_periode_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_rel_regle_moyenne_periode_sou_matiere`
--

DROP TABLE IF EXISTS `ev_rel_regle_moyenne_periode_sou_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_rel_regle_moyenne_periode_sou_matiere` (
  `ID_MATIERE` int NOT NULL,
  `ID_PA_PERIODE` int NOT NULL,
  `ID_PA_REGL_CALC_MOY` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_CLASSE` int NOT NULL,
  `ID_SOU_MATIERE` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SOU_MATIERE`,`ID_PA_PERIODE`,`ID_AN_SCOLAIRE`,`ID_CLASSE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_SOU_MATIERE` (`ID_SOU_MATIERE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB` (`ID_PA_PERIODE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB2` (`ID_PA_REGL_CALC_MOY`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_CLASSE` (`ID_CLASSE`),
  KEY `FK_SE_USERNAME_UPD_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE` (`USERNAME_UPD`),
  KEY `FK_SE_USERNAME_CREA_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE` (`USERNAME_CREA`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_MATIERE_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_PERIODE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_REGL_CALC_MOY`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_SOU_MATIERE` FOREIGN KEY (`ID_SOU_MATIERE`) REFERENCES `pa_sou_matiere` (`ID_SOU_MATIERE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_rel_regle_moyenne_periode_sou_matiere`
--

LOCK TABLES `ev_rel_regle_moyenne_periode_sou_matiere` WRITE;
/*!40000 ALTER TABLE `ev_rel_regle_moyenne_periode_sou_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `ev_rel_regle_moyenne_periode_sou_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_abonnement`
--

DROP TABLE IF EXISTS `no_abonnement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_abonnement` (
  `ID_ABONNEMENT` int NOT NULL AUTO_INCREMENT,
  `CODE_ABONNEMENT` varchar(24) NOT NULL,
  `NOM_ABONNEMENT` varchar(128) NOT NULL,
  `NOMBRE_SMS` int NOT NULL DEFAULT '0',
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_ABONNEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_abonnement`
--

LOCK TABLES `no_abonnement` WRITE;
/*!40000 ALTER TABLE `no_abonnement` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_abonnement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_abonnement_person`
--

DROP TABLE IF EXISTS `no_abonnement_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_abonnement_person` (
  `ID_ABON_PERS` int NOT NULL AUTO_INCREMENT,
  `ID_ABONNEMENT` int NOT NULL,
  `NB_SMS_ENVOI` int NOT NULL,
  `ID_PERSON_INT` int NOT NULL,
  `DATE_DEB_VAL` datetime NOT NULL,
  `DATE_FIN_VAL` datetime NOT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_ABON_PERS`),
  KEY `FK_NO_ABONNEMENT_PERSON_NO_ABONNEMENT` (`ID_ABONNEMENT`),
  KEY `FK_NO_ABONNEMENT_PERSON_NO_PERSONNE_NOTI` (`ID_PERSON_INT`),
  CONSTRAINT `FK_NO_ABONNEMENT_PERSON_NO_ABONNEMENT` FOREIGN KEY (`ID_ABONNEMENT`) REFERENCES `no_abonnement` (`ID_ABONNEMENT`),
  CONSTRAINT `FK_NO_ABONNEMENT_PERSON_NO_PERSONNE_NOTI` FOREIGN KEY (`ID_PERSON_INT`) REFERENCES `no_personne_noti` (`ID_PERSON_INT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_abonnement_person`
--

LOCK TABLES `no_abonnement_person` WRITE;
/*!40000 ALTER TABLE `no_abonnement_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_abonnement_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_evenmnt`
--

DROP TABLE IF EXISTS `no_evenmnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_evenmnt` (
  `ID_TYP_EVENEMNT` int NOT NULL,
  `ID_EVT_INT` int NOT NULL,
  `ID_EVT_EXTERN` int DEFAULT NULL,
  `INFO_COMP_1` varchar(128) DEFAULT NULL,
  `INFO_COMP_2` varchar(128) DEFAULT NULL,
  `INFO_COMP_3` varchar(128) DEFAULT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_EVT_INT`),
  KEY `FK_NO_EVENMNT_NO_TYP_EVENEMENT_NOTI` (`ID_TYP_EVENEMNT`),
  CONSTRAINT `FK_NO_EVENMNT_NO_TYP_EVENEMENT_NOTI` FOREIGN KEY (`ID_TYP_EVENEMNT`) REFERENCES `no_typ_evenement_noti` (`ID_TYP_EVENEMNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_evenmnt`
--

LOCK TABLES `no_evenmnt` WRITE;
/*!40000 ALTER TABLE `no_evenmnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_evenmnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_notification`
--

DROP TABLE IF EXISTS `no_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_notification` (
  `ID_NOTI` int NOT NULL AUTO_INCREMENT,
  `ID_PERSON_INT` int NOT NULL,
  `ID_PA_STATUT_ENV` int NOT NULL,
  `ID_ABON_PERS` int DEFAULT NULL,
  `ID_EVT_INT` int DEFAULT NULL,
  `ID_PARAM_MODEL` int DEFAULT NULL,
  `MESSAGE` varchar(2048) NOT NULL,
  `DATE_NOTI` datetime NOT NULL,
  PRIMARY KEY (`ID_NOTI`),
  KEY `FK_NO_NOTIFICATION_NO_PERSONNE_NOTI` (`ID_PERSON_INT`),
  KEY `FK_NO_NOTIFICATION_PA_PARAM_GLOB` (`ID_PA_STATUT_ENV`),
  KEY `FK_NO_NOTIFICATION_NO_ABONNEMENT_PERSON` (`ID_ABON_PERS`),
  KEY `FK_NO_NOTIFICATION_NO_EVENMNT` (`ID_EVT_INT`),
  KEY `FK_NO_NOTIFICATION_NO_PARAM_MODEL` (`ID_PARAM_MODEL`),
  CONSTRAINT `FK_NO_NOTIFICATION_NO_ABONNEMENT_PERSON` FOREIGN KEY (`ID_ABON_PERS`) REFERENCES `no_abonnement_person` (`ID_ABON_PERS`),
  CONSTRAINT `FK_NO_NOTIFICATION_NO_EVENMNT` FOREIGN KEY (`ID_EVT_INT`) REFERENCES `no_evenmnt` (`ID_EVT_INT`),
  CONSTRAINT `FK_NO_NOTIFICATION_NO_PARAM_MODEL` FOREIGN KEY (`ID_PARAM_MODEL`) REFERENCES `no_param_model` (`ID_PARAM_MODEL`),
  CONSTRAINT `FK_NO_NOTIFICATION_NO_PERSONNE_NOTI` FOREIGN KEY (`ID_PERSON_INT`) REFERENCES `no_personne_noti` (`ID_PERSON_INT`),
  CONSTRAINT `FK_NO_NOTIFICATION_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_STATUT_ENV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_notification`
--

LOCK TABLES `no_notification` WRITE;
/*!40000 ALTER TABLE `no_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_param_model`
--

DROP TABLE IF EXISTS `no_param_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_param_model` (
  `ID_PARAM_MODEL` int NOT NULL AUTO_INCREMENT,
  `LIBELLE_MODEL` varchar(64) NOT NULL,
  `MESSAGE_MODEL` varchar(2048) NOT NULL,
  `ID_TYP_EVENEMNT` int DEFAULT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_PARAM_MODEL`),
  KEY `FK_NO_PARAM_MODEL_NO_TYP_EVENEMENT_NOTI` (`ID_TYP_EVENEMNT`),
  CONSTRAINT `FK_NO_PARAM_MODEL_NO_TYP_EVENEMENT_NOTI` FOREIGN KEY (`ID_TYP_EVENEMNT`) REFERENCES `no_typ_evenement_noti` (`ID_TYP_EVENEMNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_param_model`
--

LOCK TABLES `no_param_model` WRITE;
/*!40000 ALTER TABLE `no_param_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_param_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_personne_noti`
--

DROP TABLE IF EXISTS `no_personne_noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_personne_noti` (
  `ID_PERSON_INT` int NOT NULL AUTO_INCREMENT,
  `ID_PERSON_EXT` int DEFAULT NULL,
  `NOM` varchar(64) NOT NULL,
  `PRENOM` varchar(64) NOT NULL,
  `SEXE` varchar(12) NOT NULL,
  `DATE_NAISSANCE` int NOT NULL,
  `NUM_TELEPHONE` varchar(32) NOT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `ADRESSE` varchar(128) DEFAULT NULL,
  `INFO_COMP_1` varchar(128) DEFAULT NULL,
  `INFO_COMP_2` varchar(128) DEFAULT NULL,
  `INFO_COMP_3` varchar(128) DEFAULT NULL,
  `INFO_COMP_4` varchar(128) DEFAULT NULL,
  `INFO_COMP_5` varchar(128) DEFAULT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_PERSON_INT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_personne_noti`
--

LOCK TABLES `no_personne_noti` WRITE;
/*!40000 ALTER TABLE `no_personne_noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_personne_noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_rel_det_abonnemnt_typ_evt`
--

DROP TABLE IF EXISTS `no_rel_det_abonnemnt_typ_evt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_rel_det_abonnemnt_typ_evt` (
  `ID_ABONNEMENT` int NOT NULL,
  `ID_TYP_EVENEMNT` int NOT NULL,
  `ID_PARAM_MODEL` int NOT NULL,
  `ID_PA_FREQ_ENV` int NOT NULL,
  `FL_ENVOI_AUTO` char(1) NOT NULL DEFAULT 'O',
  `JOUR_PREF_ENV` varchar(20) DEFAULT NULL,
  `HEURE_PREF_ENV` time DEFAULT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_ABONNEMENT`,`ID_TYP_EVENEMNT`),
  UNIQUE KEY `AK_NO_REL_DET_ABONNEMNT_TYP_EVT` (`ID_ABONNEMENT`),
  KEY `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_TYP_EVENEMENT_NOTI` (`ID_TYP_EVENEMNT`),
  KEY `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_PARAM_MODEL` (`ID_PARAM_MODEL`),
  KEY `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_PA_PARAM_GLOB1` (`ID_PA_FREQ_ENV`),
  CONSTRAINT `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_ABONNEMENT` FOREIGN KEY (`ID_ABONNEMENT`) REFERENCES `no_abonnement` (`ID_ABONNEMENT`),
  CONSTRAINT `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_PARAM_MODEL` FOREIGN KEY (`ID_PARAM_MODEL`) REFERENCES `no_param_model` (`ID_PARAM_MODEL`),
  CONSTRAINT `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_TYP_EVENEMENT_NOTI` FOREIGN KEY (`ID_TYP_EVENEMNT`) REFERENCES `no_typ_evenement_noti` (`ID_TYP_EVENEMNT`),
  CONSTRAINT `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_FREQ_ENV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_NO_REL_DET_ABONNEMNT_TYP_EVT_PA_PARAM_GLOB1` FOREIGN KEY (`ID_PA_FREQ_ENV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `no_rel_det_abonnemnt_typ_evt_chk_1` CHECK ((`FL_ENVOI_AUTO` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_rel_det_abonnemnt_typ_evt`
--

LOCK TABLES `no_rel_det_abonnemnt_typ_evt` WRITE;
/*!40000 ALTER TABLE `no_rel_det_abonnemnt_typ_evt` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_rel_det_abonnemnt_typ_evt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_typ_evenement_noti`
--

DROP TABLE IF EXISTS `no_typ_evenement_noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_typ_evenement_noti` (
  `ID_TYP_EVENEMNT` int NOT NULL AUTO_INCREMENT,
  `COD_TYP_EVENEMNT` varchar(12) NOT NULL,
  `NOM_TYP_EVENMNT` varchar(32) NOT NULL,
  `DESC_TYP_EVENMNT` varchar(128) DEFAULT NULL,
  `DAT_CREA` datetime NOT NULL,
  `DAT_UPD` datetime NOT NULL,
  PRIMARY KEY (`ID_TYP_EVENEMNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_typ_evenement_noti`
--

LOCK TABLES `no_typ_evenement_noti` WRITE;
/*!40000 ALTER TABLE `no_typ_evenement_noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_typ_evenement_noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_annee_scolaire`
--

DROP TABLE IF EXISTS `pa_annee_scolaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_annee_scolaire` (
  `ID_AN_SCOLAIRE` int NOT NULL AUTO_INCREMENT,
  `AN_SCOLAIRE` int NOT NULL,
  `DAT_DEB_SCOLAIRE` date NOT NULL,
  `DAT_FIN_SCOLAIRE` date DEFAULT NULL,
  `LIB_SCOLAIR` varchar(64) NOT NULL,
  `FL_AN_ACTF` char(1) NOT NULL DEFAULT 'N',
  `ID_PAR_REGL_CALC_MOY_GNRAL` int DEFAULT NULL,
  `MOY_RACHA` decimal(4,2) NOT NULL DEFAULT '9.75',
  `RETRAI_POIN_ABS` decimal(5,2) NOT NULL DEFAULT '1.00',
  `NB_HEUR_MIN_ABS` smallint NOT NULL DEFAULT '0',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_AN_SCOLAIRE`),
  KEY `I_PU_PA_ANNEE_SCOLAIRE` (`AN_SCOLAIRE`),
  KEY `I_FK_PA_ANNEE_SCOLAIRE_PA_PARAM_GLOB` (`ID_PAR_REGL_CALC_MOY_GNRAL`),
  KEY `FK_SE_USERNAME_CREA_PA_ANNEE_SCOLAIRE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_ANNEE_SCOLAIRE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PAR_REGL_CALC_MOY_GNRAL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pa_annee_scolaire_chk_1` CHECK ((`FL_AN_ACTF` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `pa_annee_scolaire_chk_2` CHECK ((`MOY_RACHA` between 1 and 10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Annee Scolaire';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_annee_scolaire`
--

LOCK TABLES `pa_annee_scolaire` WRITE;
/*!40000 ALTER TABLE `pa_annee_scolaire` DISABLE KEYS */;
INSERT INTO `pa_annee_scolaire` VALUES (1,2026,'2025-10-01','2026-07-31','2026/2027','O',99,9.75,0.50,0,NULL,NULL);
/*!40000 ALTER TABLE `pa_annee_scolaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_article`
--

DROP TABLE IF EXISTS `pa_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_article` (
  `ID_ARTICLE` int NOT NULL AUTO_INCREMENT,
  `ID_CHAPITRE` int NOT NULL,
  `COD_ARTICLE` varchar(5) NOT NULL,
  `NUM_ARTICLE` varchar(5) NOT NULL,
  `LIB_CRT_ARTICLE` varchar(64) NOT NULL,
  `LIB_LNG_ARTICLE` varchar(128) DEFAULT NULL,
  `PU_ARTICLE` decimal(13,2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ARTICLE`),
  UNIQUE KEY `I_PU_PA_ARTICLE` (`COD_ARTICLE`),
  KEY `I_FK_PA_ARTICLE_PA_CHAPITRE` (`ID_CHAPITRE`),
  KEY `FK_SE_USERNAME_CREA_PA_ARTICLE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_ARTICLE_PA_CHAPITRE` FOREIGN KEY (`ID_CHAPITRE`) REFERENCES `pa_chapitre` (`ID_CHAPITRE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_ARTICLE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Article';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_article`
--

LOCK TABLES `pa_article` WRITE;
/*!40000 ALTER TABLE `pa_article` DISABLE KEYS */;
INSERT INTO `pa_article` VALUES (1,1,'R1001','0001','Situation budgétaire ','Situation budgétaire antérieure',0.00,NULL,NULL),(2,1,'R1002','0002','Frais d\'inscription et de participation','Frais d\'inscription et de participation',0.00,NULL,NULL),(3,1,'R1003','0003','Prestation de service ','Prestation de service ',0.00,NULL,NULL),(4,1,'R1004','0004','Contribution du bureau de l’APE','Contribution du bureau de l\'APE',2000.00,NULL,NULL),(5,1,'R1005','0005','Abonnement à la bibliothèque','Abonnement à la bibliothèque',0.00,NULL,NULL),(6,1,'R1006','0006','Cantine scolaire','Cantine scolaire',75.00,NULL,NULL),(7,1,'R1007','0007','Subvention de l’Etat','Subvention de l\'Etat',0.00,NULL,NULL),(8,1,'R1008','0008','Subvention de la collectivité locale','Subvention de la collectivité locale',0.00,NULL,NULL),(9,1,'R1009','0009','Contribution spéciale cour du soir','Contribution spéciale cour du soir',0.00,NULL,NULL),(10,2,'R2001','0010','Subvention organismes internationaux','Subvention organismes internationaux',0.00,NULL,NULL),(11,2,'R2002','0011','Autres subventions','Autres subventions',0.00,NULL,NULL),(12,2,'R2003','0012','Dons et legs','Dons et legs',0.00,NULL,NULL),(13,3,'D1001','0013','Fourniture scolaire','Fourniture scolaire',0.00,NULL,NULL),(14,3,'D1002','0014','Documentation pédagogique et maitre d’œuvre','Documentation pédagogique et maitre d’œuvre',0.00,NULL,NULL),(15,4,'D2001','0015','Fourniture de bureau','Fourniture de bureau',0.00,NULL,NULL),(16,4,'D2002','0016','Eau et électricité','Eau et électricité',0.00,NULL,NULL),(17,4,'D2003','0017','Téléphone et poste','Téléphone et poste',0.00,NULL,NULL),(18,4,'D2004','0018','Produits pharmaceutiques','Produits pharmaceutiques',0.00,NULL,NULL),(19,4,'D2005','0019','Carburant et lubrifiants','Carburant et lubrifiants',0.00,NULL,NULL),(20,4,'D2006','0020','Matériels de sport','Matériels de sport',0.00,NULL,NULL),(21,5,'D3001','0021','Entretien et réparation des immeubles et forages','Entretien et réparation des immeubles et forages',0.00,NULL,NULL),(22,5,'D3002','0022','Entretient des machines et du mobilier','Entretient des machines et du mobilier',0.00,NULL,NULL),(23,5,'D3003','0023','Entretien et réparation des véhicules','Entretien et réparation des véhicules',0.00,NULL,NULL),(24,5,'D3004','0024','Produits et matériels informatiques','Produits et matériels informatiques',0.00,NULL,NULL),(25,5,'D3005','0025','Produits et matériels d’entretien et de nettoyage','Produits et matériels d’entretien et de nettoyage',0.00,NULL,NULL),(26,6,'D4001','0026','Salaires du personnel','Salaires du personnel',0.00,NULL,NULL),(27,6,'D4002','0027','Charges sociales et fiscales','Charges sociales et fiscales',0.00,NULL,NULL),(28,6,'D4003','0028','Heures supplémentaires et vacation','Heures supplémentaires et vacation, et prises en charges aux professeurs principaux et chef d’atelier',0.00,NULL,NULL),(29,6,'D4004','0029','Prises en charges des bibliothécaires','Prises en charges des bibliothécaires 5000/mois',0.00,NULL,NULL),(30,6,'D4005','0030','Frais de suivi des stagiaires en milieu professionnel','Frais de suivi des stagiaires en milieu professionnel',0.00,NULL,NULL),(31,7,'D5001','0031','Publicité','Publicité',0.00,NULL,NULL),(32,7,'D5002','0032','Réception et cérémonie','	Réception et cérémonie',0.00,NULL,NULL),(33,7,'D5003','0033','Frais de transport et sortie','Frais de transport et sortie',0.00,NULL,NULL),(34,7,'D5004','0034','Manifestations culturelles et sportives','Manifestations culturelles et sportives',0.00,NULL,NULL),(35,7,'D5005','0035','Cantines scolaires','Cantines scolaires',0.00,NULL,NULL),(36,7,'D5006','0036','Charges sociales','Charges sociales',0.00,NULL,NULL),(37,7,'D5007','0037','Location de salles','Location de salles',0.00,NULL,NULL),(38,7,'D5008','0038','Abonnement aux chaines cryptées','Abonnement aux chaines cryptées',0.00,NULL,NULL),(39,8,'D6001','0039','Remboursements','Remboursements',0.00,NULL,NULL),(40,8,'D6002','0040','Tenue de compte','Tenue de compte 1500/mois',0.00,NULL,NULL),(41,8,'D6003','0041','Reversement','Reversement',0.00,NULL,NULL),(42,9,'D7001','0042','Acquisition du matériel pédagogique, technique et de laboratoire','Acquisition du matériel pédagogique, technique et de laboratoire',0.00,NULL,NULL),(43,9,'D7002','0043','Acquisition du matériel et mobilier','Acquisition du matériel et mobilier',0.00,NULL,NULL),(44,9,'D7003','0044','Acquisition de matériel informatique','Acquisition de matériel informatique',0.00,NULL,NULL),(45,10,'D8001','0045','Frais de gestion de logiciel ','Frais de gestion de logiciel scolaire',0.00,NULL,NULL),(46,10,'D8002','0046','Aménagement de terrain','Aménagement de terrain',0.00,NULL,NULL),(47,10,'D8003','0047','Installation et Aménagement des constructions','Installation et Aménagement des constructions',0.00,NULL,NULL),(48,10,'D8004','0048','Autres investissements','Autres investissements',0.00,NULL,NULL);
/*!40000 ALTER TABLE `pa_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_batiment`
--

DROP TABLE IF EXISTS `pa_batiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_batiment` (
  `ID_BAT` int NOT NULL AUTO_INCREMENT,
  `CODE_BAT` char(5) NOT NULL,
  `LIB_BAT` varchar(64) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_BAT`),
  UNIQUE KEY `I_PU_PA_BATIMENT` (`CODE_BAT`),
  KEY `FK_SE_USERNAME_CREA_PA_BATIMENT` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_BATIMENT` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Batiment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_batiment`
--

LOCK TABLES `pa_batiment` WRITE;
/*!40000 ALTER TABLE `pa_batiment` DISABLE KEYS */;
INSERT INTO `pa_batiment` VALUES (1,'BAT01','Batiment A',NULL,NULL),(2,'BAT02','Batiment B',NULL,NULL);
/*!40000 ALTER TABLE `pa_batiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_calendrier_scolaire`
--

DROP TABLE IF EXISTS `pa_calendrier_scolaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_calendrier_scolaire` (
  `DATE_SCOLAIRE` date NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `NUM_JOUR` smallint NOT NULL,
  `NM_JOUR` varchar(32) NOT NULL,
  `NUM_MOIS` smallint NOT NULL,
  `NM_MOIS` varchar(32) NOT NULL,
  `NUM_SEM` int NOT NULL,
  `DATE_DEB_MOIS` date NOT NULL,
  `DATE_FIN_MOIS` date NOT NULL,
  `DATE_DEB_SEM` date NOT NULL,
  `DATE_FIN_SEM` date NOT NULL,
  `TOP_JOUR_FERI` char(1) NOT NULL,
  `TOP_VAC_SCOLAIRE` char(1) NOT NULL,
  `TOP_JOUR_OUV` char(1) NOT NULL,
  `TOP_JOUR_GREV` char(1) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`DATE_SCOLAIRE`),
  KEY `I_FK_PA_CALENDRIER_SCOLAIRE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_PA_CALENDRIER_SCOLAIRE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_CALENDRIER_SCOLAIRE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_CALENDRIER_SCOLAIRE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Calendrier Scolaire';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_calendrier_scolaire`
--

LOCK TABLES `pa_calendrier_scolaire` WRITE;
/*!40000 ALTER TABLE `pa_calendrier_scolaire` DISABLE KEYS */;
INSERT INTO `pa_calendrier_scolaire` VALUES ('2026-10-01',1,5,'Jeudi',10,'Octobre',40,'2026-10-01','2026-10-31','2026-09-28','2026-10-04','N','N','O','N',NULL,NULL),('2026-10-02',1,6,'Vendredi',10,'Octobre',40,'2026-10-01','2026-10-31','2026-09-28','2026-10-04','N','N','O','N',NULL,NULL),('2026-10-03',1,7,'Samedi',10,'Octobre',40,'2026-10-01','2026-10-31','2026-09-28','2026-10-04','N','N','O','N',NULL,NULL),('2026-10-04',1,1,'Dimanche',10,'Octobre',41,'2026-10-01','2026-10-31','2026-09-28','2026-10-11','N','N','N','N',NULL,NULL),('2026-10-05',1,2,'Lundi',10,'Octobre',41,'2026-10-01','2026-10-31','2026-10-05','2026-10-11','N','N','O','N',NULL,NULL),('2026-10-06',1,3,'Mardi',10,'Octobre',41,'2026-10-01','2026-10-31','2026-10-05','2026-10-11','N','N','O','N',NULL,NULL),('2026-10-07',1,4,'Mercredi',10,'Octobre',41,'2026-10-01','2026-10-31','2026-10-05','2026-10-11','N','N','O','N',NULL,NULL),('2026-10-08',1,5,'Jeudi',10,'Octobre',41,'2026-10-01','2026-10-31','2026-10-05','2026-10-11','N','N','O','N',NULL,NULL),('2026-10-09',1,6,'Vendredi',10,'Octobre',41,'2026-10-01','2026-10-31','2026-10-05','2026-10-11','N','N','O','N',NULL,NULL),('2026-10-10',1,7,'Samedi',10,'Octobre',41,'2026-10-01','2026-10-31','2026-10-05','2026-10-11','N','N','O','N',NULL,NULL),('2026-10-11',1,1,'Dimanche',10,'Octobre',42,'2026-10-01','2026-10-31','2026-10-05','2026-10-18','N','N','N','N',NULL,NULL),('2026-10-12',1,2,'Lundi',10,'Octobre',42,'2026-10-01','2026-10-31','2026-10-12','2026-10-18','N','N','O','N',NULL,NULL),('2026-10-13',1,3,'Mardi',10,'Octobre',42,'2026-10-01','2026-10-31','2026-10-12','2026-10-18','N','N','O','N',NULL,NULL),('2026-10-14',1,4,'Mercredi',10,'Octobre',42,'2026-10-01','2026-10-31','2026-10-12','2026-10-18','N','N','O','N',NULL,NULL),('2026-10-15',1,5,'Jeudi',10,'Octobre',42,'2026-10-01','2026-10-31','2026-10-12','2026-10-18','N','N','O','N',NULL,NULL),('2026-10-16',1,6,'Vendredi',10,'Octobre',42,'2026-10-01','2026-10-31','2026-10-12','2026-10-18','N','N','O','N',NULL,NULL),('2026-10-17',1,7,'Samedi',10,'Octobre',42,'2026-10-01','2026-10-31','2026-10-12','2026-10-18','N','N','O','N',NULL,NULL),('2026-10-18',1,1,'Dimanche',10,'Octobre',43,'2026-10-01','2026-10-31','2026-10-12','2026-10-25','N','N','N','N',NULL,NULL),('2026-10-19',1,2,'Lundi',10,'Octobre',43,'2026-10-01','2026-10-31','2026-10-19','2026-10-25','N','N','O','N',NULL,NULL),('2026-10-20',1,3,'Mardi',10,'Octobre',43,'2026-10-01','2026-10-31','2026-10-19','2026-10-25','N','N','O','N',NULL,NULL),('2026-10-21',1,4,'Mercredi',10,'Octobre',43,'2026-10-01','2026-10-31','2026-10-19','2026-10-25','N','N','O','N',NULL,NULL),('2026-10-22',1,5,'Jeudi',10,'Octobre',43,'2026-10-01','2026-10-31','2026-10-19','2026-10-25','N','N','O','N',NULL,NULL),('2026-10-23',1,6,'Vendredi',10,'Octobre',43,'2026-10-01','2026-10-31','2026-10-19','2026-10-25','N','N','O','N',NULL,NULL),('2026-10-24',1,7,'Samedi',10,'Octobre',43,'2026-10-01','2026-10-31','2026-10-19','2026-10-25','N','N','O','N',NULL,NULL),('2026-10-25',1,1,'Dimanche',10,'Octobre',44,'2026-10-01','2026-10-31','2026-10-19','2026-11-01','N','N','N','N',NULL,NULL),('2026-10-26',1,2,'Lundi',10,'Octobre',44,'2026-10-01','2026-10-31','2026-10-26','2026-11-01','N','N','O','N',NULL,NULL),('2026-10-27',1,3,'Mardi',10,'Octobre',44,'2026-10-01','2026-10-31','2026-10-26','2026-11-01','N','N','O','N',NULL,NULL),('2026-10-28',1,4,'Mercredi',10,'Octobre',44,'2026-10-01','2026-10-31','2026-10-26','2026-11-01','N','N','O','N',NULL,NULL),('2026-10-29',1,5,'Jeudi',10,'Octobre',44,'2026-10-01','2026-10-31','2026-10-26','2026-11-01','N','N','O','N',NULL,NULL),('2026-10-30',1,6,'Vendredi',10,'Octobre',44,'2026-10-01','2026-10-31','2026-10-26','2026-11-01','N','N','O','N',NULL,NULL),('2026-10-31',1,7,'Samedi',10,'Octobre',44,'2026-10-01','2026-10-31','2026-10-26','2026-11-01','O','N','O','N',NULL,NULL),('2026-11-01',1,1,'Dimanche',11,'Novembre',45,'2026-11-01','2026-11-30','2026-10-26','2026-11-08','O','N','N','N',NULL,NULL),('2026-11-02',1,2,'Lundi',11,'Novembre',45,'2026-11-01','2026-11-30','2026-11-02','2026-11-08','N','N','O','N',NULL,NULL),('2026-11-03',1,3,'Mardi',11,'Novembre',45,'2026-11-01','2026-11-30','2026-11-02','2026-11-08','N','N','O','N',NULL,NULL),('2026-11-04',1,4,'Mercredi',11,'Novembre',45,'2026-11-01','2026-11-30','2026-11-02','2026-11-08','N','N','O','N',NULL,NULL),('2026-11-05',1,5,'Jeudi',11,'Novembre',45,'2026-11-01','2026-11-30','2026-11-02','2026-11-08','N','N','O','N',NULL,NULL),('2026-11-06',1,6,'Vendredi',11,'Novembre',45,'2026-11-01','2026-11-30','2026-11-02','2026-11-08','N','N','O','N',NULL,NULL),('2026-11-07',1,7,'Samedi',11,'Novembre',45,'2026-11-01','2026-11-30','2026-11-02','2026-11-08','N','N','O','N',NULL,NULL),('2026-11-08',1,1,'Dimanche',11,'Novembre',46,'2026-11-01','2026-11-30','2026-11-02','2026-11-15','N','N','N','N',NULL,NULL),('2026-11-09',1,2,'Lundi',11,'Novembre',46,'2026-11-01','2026-11-30','2026-11-09','2026-11-15','N','N','O','N',NULL,NULL),('2026-11-10',1,3,'Mardi',11,'Novembre',46,'2026-11-01','2026-11-30','2026-11-09','2026-11-15','N','N','O','N',NULL,NULL),('2026-11-11',1,4,'Mercredi',11,'Novembre',46,'2026-11-01','2026-11-30','2026-11-09','2026-11-15','N','N','O','N',NULL,NULL),('2026-11-12',1,5,'Jeudi',11,'Novembre',46,'2026-11-01','2026-11-30','2026-11-09','2026-11-15','N','N','O','N',NULL,NULL),('2026-11-13',1,6,'Vendredi',11,'Novembre',46,'2026-11-01','2026-11-30','2026-11-09','2026-11-15','N','N','O','N',NULL,NULL),('2026-11-14',1,7,'Samedi',11,'Novembre',46,'2026-11-01','2026-11-30','2026-11-09','2026-11-15','N','N','O','N',NULL,NULL),('2026-11-15',1,1,'Dimanche',11,'Novembre',47,'2026-11-01','2026-11-30','2026-11-09','2026-11-22','N','N','N','N',NULL,NULL),('2026-11-16',1,2,'Lundi',11,'Novembre',47,'2026-11-01','2026-11-30','2026-11-16','2026-11-22','N','N','O','N',NULL,NULL),('2026-11-17',1,3,'Mardi',11,'Novembre',47,'2026-11-01','2026-11-30','2026-11-16','2026-11-22','N','N','O','N',NULL,NULL),('2026-11-18',1,4,'Mercredi',11,'Novembre',47,'2026-11-01','2026-11-30','2026-11-16','2026-11-22','N','N','O','N',NULL,NULL),('2026-11-19',1,5,'Jeudi',11,'Novembre',47,'2026-11-01','2026-11-30','2026-11-16','2026-11-22','N','N','O','N',NULL,NULL),('2026-11-20',1,6,'Vendredi',11,'Novembre',47,'2026-11-01','2026-11-30','2026-11-16','2026-11-22','N','N','O','N',NULL,NULL),('2026-11-21',1,7,'Samedi',11,'Novembre',47,'2026-11-01','2026-11-30','2026-11-16','2026-11-22','N','N','O','N',NULL,NULL),('2026-11-22',1,1,'Dimanche',11,'Novembre',48,'2026-11-01','2026-11-30','2026-11-16','2026-11-29','N','N','N','N',NULL,NULL),('2026-11-23',1,2,'Lundi',11,'Novembre',48,'2026-11-01','2026-11-30','2026-11-23','2026-11-29','N','N','O','N',NULL,NULL),('2026-11-24',1,3,'Mardi',11,'Novembre',48,'2026-11-01','2026-11-30','2026-11-23','2026-11-29','N','N','O','N',NULL,NULL),('2026-11-25',1,4,'Mercredi',11,'Novembre',48,'2026-11-01','2026-11-30','2026-11-23','2026-11-29','N','N','O','N',NULL,NULL),('2026-11-26',1,5,'Jeudi',11,'Novembre',48,'2026-11-01','2026-11-30','2026-11-23','2026-11-29','N','N','O','N',NULL,NULL),('2026-11-27',1,6,'Vendredi',11,'Novembre',48,'2026-11-01','2026-11-30','2026-11-23','2026-11-29','N','N','O','N',NULL,NULL),('2026-11-28',1,7,'Samedi',11,'Novembre',48,'2026-11-01','2026-11-30','2026-11-23','2026-11-29','N','N','O','N',NULL,NULL),('2026-11-29',1,1,'Dimanche',11,'Novembre',49,'2026-11-01','2026-11-30','2026-11-23','2026-12-06','N','N','N','N',NULL,NULL),('2026-11-30',1,2,'Lundi',11,'Novembre',49,'2026-11-01','2026-11-30','2026-11-30','2026-12-06','N','N','O','N',NULL,NULL),('2026-12-01',1,3,'Mardi',12,'Décembre',49,'2026-12-01','2026-12-31','2026-11-30','2026-12-06','N','N','O','N',NULL,NULL),('2026-12-02',1,4,'Mercredi',12,'Décembre',49,'2026-12-01','2026-12-31','2026-11-30','2026-12-06','N','N','O','N',NULL,NULL),('2026-12-03',1,5,'Jeudi',12,'Décembre',49,'2026-12-01','2026-12-31','2026-11-30','2026-12-06','N','N','O','N',NULL,NULL),('2026-12-04',1,6,'Vendredi',12,'Décembre',49,'2026-12-01','2026-12-31','2026-11-30','2026-12-06','N','N','O','N',NULL,NULL),('2026-12-05',1,7,'Samedi',12,'Décembre',49,'2026-12-01','2026-12-31','2026-11-30','2026-12-06','N','N','O','N',NULL,NULL),('2026-12-06',1,1,'Dimanche',12,'Décembre',50,'2026-12-01','2026-12-31','2026-11-30','2026-12-13','N','N','N','N',NULL,NULL),('2026-12-07',1,2,'Lundi',12,'Décembre',50,'2026-12-01','2026-12-31','2026-12-07','2026-12-13','N','N','O','N',NULL,NULL),('2026-12-08',1,3,'Mardi',12,'Décembre',50,'2026-12-01','2026-12-31','2026-12-07','2026-12-13','N','N','O','N',NULL,NULL),('2026-12-09',1,4,'Mercredi',12,'Décembre',50,'2026-12-01','2026-12-31','2026-12-07','2026-12-13','N','N','O','N',NULL,NULL),('2026-12-10',1,5,'Jeudi',12,'Décembre',50,'2026-12-01','2026-12-31','2026-12-07','2026-12-13','N','N','O','N',NULL,NULL),('2026-12-11',1,6,'Vendredi',12,'Décembre',50,'2026-12-01','2026-12-31','2026-12-07','2026-12-13','O','N','O','N',NULL,NULL),('2026-12-12',1,7,'Samedi',12,'Décembre',50,'2026-12-01','2026-12-31','2026-12-07','2026-12-13','N','N','O','N',NULL,NULL),('2026-12-13',1,1,'Dimanche',12,'Décembre',51,'2026-12-01','2026-12-31','2026-12-07','2026-12-20','N','N','N','N',NULL,NULL),('2026-12-14',1,2,'Lundi',12,'Décembre',51,'2026-12-01','2026-12-31','2026-12-14','2026-12-20','N','N','O','N',NULL,NULL),('2026-12-15',1,3,'Mardi',12,'Décembre',51,'2026-12-01','2026-12-31','2026-12-14','2026-12-20','N','N','O','N',NULL,NULL),('2026-12-16',1,4,'Mercredi',12,'Décembre',51,'2026-12-01','2026-12-31','2026-12-14','2026-12-20','N','N','O','N',NULL,NULL),('2026-12-17',1,5,'Jeudi',12,'Décembre',51,'2026-12-01','2026-12-31','2026-12-14','2026-12-20','N','N','O','N',NULL,NULL),('2026-12-18',1,6,'Vendredi',12,'Décembre',51,'2026-12-01','2026-12-31','2026-12-14','2026-12-20','N','N','O','N',NULL,NULL),('2026-12-19',1,7,'Samedi',12,'Décembre',51,'2026-12-01','2026-12-31','2026-12-14','2026-12-20','N','N','O','N',NULL,NULL),('2026-12-20',1,1,'Dimanche',12,'Décembre',52,'2026-12-01','2026-12-31','2026-12-14','2026-12-27','N','N','N','N',NULL,NULL),('2026-12-21',1,2,'Lundi',12,'Décembre',52,'2026-12-01','2026-12-31','2026-12-21','2026-12-27','N','O','O','N',NULL,NULL),('2026-12-22',1,3,'Mardi',12,'Décembre',52,'2026-12-01','2026-12-31','2026-12-21','2026-12-27','N','O','O','N',NULL,NULL),('2026-12-23',1,4,'Mercredi',12,'Décembre',52,'2026-12-01','2026-12-31','2026-12-21','2026-12-27','N','O','O','N',NULL,NULL),('2026-12-24',1,5,'Jeudi',12,'Décembre',52,'2026-12-01','2026-12-31','2026-12-21','2026-12-27','N','O','O','N',NULL,NULL),('2026-12-25',1,6,'Vendredi',12,'Décembre',52,'2026-12-01','2026-12-31','2026-12-21','2026-12-27','N','O','O','N',NULL,NULL),('2026-12-26',1,7,'Samedi',12,'Décembre',52,'2026-12-01','2026-12-31','2026-12-21','2026-12-27','N','O','O','N',NULL,NULL),('2026-12-27',1,1,'Dimanche',12,'Décembre',53,'2026-12-01','2026-12-31','2026-12-21','2027-01-03','N','O','N','N',NULL,NULL),('2026-12-28',1,2,'Lundi',12,'Décembre',53,'2026-12-01','2026-12-31','2026-12-28','2027-01-03','N','O','O','N',NULL,NULL),('2026-12-29',1,3,'Mardi',12,'Décembre',53,'2026-12-01','2026-12-31','2026-12-28','2027-01-03','N','O','O','N',NULL,NULL),('2026-12-30',1,4,'Mercredi',12,'Décembre',53,'2026-12-01','2026-12-31','2026-12-28','2027-01-03','N','O','O','N',NULL,NULL),('2026-12-31',1,5,'Jeudi',12,'Décembre',53,'2026-12-01','2026-12-31','2026-12-28','2027-01-03','N','O','O','N',NULL,NULL),('2027-01-01',1,6,'Vendredi',1,'Janvier',1,'2027-01-01','2027-01-31','2026-12-28','2027-01-03','N','O','O','N',NULL,NULL),('2027-01-02',1,7,'Samedi',1,'Janvier',1,'2027-01-01','2027-01-31','2026-12-28','2027-01-03','N','O','O','N',NULL,NULL),('2027-01-03',1,1,'Dimanche',1,'Janvier',2,'2027-01-01','2027-01-31','2026-12-28','2027-01-10','N','O','N','N',NULL,NULL),('2027-01-04',1,2,'Lundi',1,'Janvier',2,'2027-01-01','2027-01-31','2027-01-04','2027-01-10','N','O','O','N',NULL,NULL),('2027-01-05',1,3,'Mardi',1,'Janvier',2,'2027-01-01','2027-01-31','2027-01-04','2027-01-10','N','O','O','N',NULL,NULL),('2027-01-06',1,4,'Mercredi',1,'Janvier',2,'2027-01-01','2027-01-31','2027-01-04','2027-01-10','N','N','O','N',NULL,NULL),('2027-01-07',1,5,'Jeudi',1,'Janvier',2,'2027-01-01','2027-01-31','2027-01-04','2027-01-10','N','N','O','N',NULL,NULL),('2027-01-08',1,6,'Vendredi',1,'Janvier',2,'2027-01-01','2027-01-31','2027-01-04','2027-01-10','N','N','O','N',NULL,NULL),('2027-01-09',1,7,'Samedi',1,'Janvier',2,'2027-01-01','2027-01-31','2027-01-04','2027-01-10','N','N','O','N',NULL,NULL),('2027-01-10',1,1,'Dimanche',1,'Janvier',3,'2027-01-01','2027-01-31','2027-01-04','2027-01-17','N','N','N','N',NULL,NULL),('2027-01-11',1,2,'Lundi',1,'Janvier',3,'2027-01-01','2027-01-31','2027-01-11','2027-01-17','N','N','O','N',NULL,NULL),('2027-01-12',1,3,'Mardi',1,'Janvier',3,'2027-01-01','2027-01-31','2027-01-11','2027-01-17','N','N','O','N',NULL,NULL),('2027-01-13',1,4,'Mercredi',1,'Janvier',3,'2027-01-01','2027-01-31','2027-01-11','2027-01-17','N','N','O','N',NULL,NULL),('2027-01-14',1,5,'Jeudi',1,'Janvier',3,'2027-01-01','2027-01-31','2027-01-11','2027-01-17','N','N','O','N',NULL,NULL),('2027-01-15',1,6,'Vendredi',1,'Janvier',3,'2027-01-01','2027-01-31','2027-01-11','2027-01-17','N','N','O','N',NULL,NULL),('2027-01-16',1,7,'Samedi',1,'Janvier',3,'2027-01-01','2027-01-31','2027-01-11','2027-01-17','N','N','O','N',NULL,NULL),('2027-01-17',1,1,'Dimanche',1,'Janvier',4,'2027-01-01','2027-01-31','2027-01-11','2027-01-24','N','N','N','N',NULL,NULL),('2027-01-18',1,2,'Lundi',1,'Janvier',4,'2027-01-01','2027-01-31','2027-01-18','2027-01-24','N','N','O','N',NULL,NULL),('2027-01-19',1,3,'Mardi',1,'Janvier',4,'2027-01-01','2027-01-31','2027-01-18','2027-01-24','N','N','O','N',NULL,NULL),('2027-01-20',1,4,'Mercredi',1,'Janvier',4,'2027-01-01','2027-01-31','2027-01-18','2027-01-24','N','N','O','N',NULL,NULL),('2027-01-21',1,5,'Jeudi',1,'Janvier',4,'2027-01-01','2027-01-31','2027-01-18','2027-01-24','N','N','O','N',NULL,NULL),('2027-01-22',1,6,'Vendredi',1,'Janvier',4,'2027-01-01','2027-01-31','2027-01-18','2027-01-24','N','N','O','N',NULL,NULL),('2027-01-23',1,7,'Samedi',1,'Janvier',4,'2027-01-01','2027-01-31','2027-01-18','2027-01-24','N','N','O','N',NULL,NULL),('2027-01-24',1,1,'Dimanche',1,'Janvier',5,'2027-01-01','2027-01-31','2027-01-18','2027-01-31','N','N','N','N',NULL,NULL),('2027-01-25',1,2,'Lundi',1,'Janvier',5,'2027-01-01','2027-01-31','2027-01-25','2027-01-31','N','N','O','N',NULL,NULL),('2027-01-26',1,3,'Mardi',1,'Janvier',5,'2027-01-01','2027-01-31','2027-01-25','2027-01-31','N','N','O','N',NULL,NULL),('2027-01-27',1,4,'Mercredi',1,'Janvier',5,'2027-01-01','2027-01-31','2027-01-25','2027-01-31','N','N','O','N',NULL,NULL),('2027-01-28',1,5,'Jeudi',1,'Janvier',5,'2027-01-01','2027-01-31','2027-01-25','2027-01-31','N','N','O','N',NULL,NULL),('2027-01-29',1,6,'Vendredi',1,'Janvier',5,'2027-01-01','2027-01-31','2027-01-25','2027-01-31','N','N','O','N',NULL,NULL),('2027-01-30',1,7,'Samedi',1,'Janvier',5,'2027-01-01','2027-01-31','2027-01-25','2027-01-31','N','N','O','N',NULL,NULL),('2027-01-31',1,1,'Dimanche',1,'Janvier',6,'2027-01-01','2027-01-31','2027-01-25','2027-02-07','N','N','N','N',NULL,NULL),('2027-02-01',1,2,'Lundi',2,'Février',6,'2027-02-01','2027-02-28','2027-02-01','2027-02-07','N','N','O','N',NULL,NULL),('2027-02-02',1,3,'Mardi',2,'Février',6,'2027-02-01','2027-02-28','2027-02-01','2027-02-07','N','N','O','N',NULL,NULL),('2027-02-03',1,4,'Mercredi',2,'Février',6,'2027-02-01','2027-02-28','2027-02-01','2027-02-07','N','N','O','N',NULL,NULL),('2027-02-04',1,5,'Jeudi',2,'Février',6,'2027-02-01','2027-02-28','2027-02-01','2027-02-07','N','N','O','N',NULL,NULL),('2027-02-05',1,6,'Vendredi',2,'Février',6,'2027-02-01','2027-02-28','2027-02-01','2027-02-07','N','N','O','N',NULL,NULL),('2027-02-06',1,7,'Samedi',2,'Février',6,'2027-02-01','2027-02-28','2027-02-01','2027-02-07','N','N','O','N',NULL,NULL),('2027-02-07',1,1,'Dimanche',2,'Février',7,'2027-02-01','2027-02-28','2027-02-01','2027-02-14','N','N','N','N',NULL,NULL),('2027-02-08',1,2,'Lundi',2,'Février',7,'2027-02-01','2027-02-28','2027-02-08','2027-02-14','N','N','O','N',NULL,NULL),('2027-02-09',1,3,'Mardi',2,'Février',7,'2027-02-01','2027-02-28','2027-02-08','2027-02-14','N','N','O','N',NULL,NULL),('2027-02-10',1,4,'Mercredi',2,'Février',7,'2027-02-01','2027-02-28','2027-02-08','2027-02-14','N','N','O','N',NULL,NULL),('2027-02-11',1,5,'Jeudi',2,'Février',7,'2027-02-01','2027-02-28','2027-02-08','2027-02-14','N','N','O','N',NULL,NULL),('2027-02-12',1,6,'Vendredi',2,'Février',7,'2027-02-01','2027-02-28','2027-02-08','2027-02-14','N','N','O','N',NULL,NULL),('2027-02-13',1,7,'Samedi',2,'Février',7,'2027-02-01','2027-02-28','2027-02-08','2027-02-14','N','N','O','N',NULL,NULL),('2027-02-14',1,1,'Dimanche',2,'Février',8,'2027-02-01','2027-02-28','2027-02-08','2027-02-21','N','N','N','N',NULL,NULL),('2027-02-15',1,2,'Lundi',2,'Février',8,'2027-02-01','2027-02-28','2027-02-15','2027-02-21','N','N','O','N',NULL,NULL),('2027-02-16',1,3,'Mardi',2,'Février',8,'2027-02-01','2027-02-28','2027-02-15','2027-02-21','N','N','O','N',NULL,NULL),('2027-02-17',1,4,'Mercredi',2,'Février',8,'2027-02-01','2027-02-28','2027-02-15','2027-02-21','N','N','O','N',NULL,NULL),('2027-02-18',1,5,'Jeudi',2,'Février',8,'2027-02-01','2027-02-28','2027-02-15','2027-02-21','N','N','O','N',NULL,NULL),('2027-02-19',1,6,'Vendredi',2,'Février',8,'2027-02-01','2027-02-28','2027-02-15','2027-02-21','N','N','O','N',NULL,NULL),('2027-02-20',1,7,'Samedi',2,'Février',8,'2027-02-01','2027-02-28','2027-02-15','2027-02-21','N','N','O','N',NULL,NULL),('2027-02-21',1,1,'Dimanche',2,'Février',9,'2027-02-01','2027-02-28','2027-02-15','2027-02-28','N','N','N','N',NULL,NULL),('2027-02-22',1,2,'Lundi',2,'Février',9,'2027-02-01','2027-02-28','2027-02-22','2027-02-28','N','N','O','N',NULL,NULL),('2027-02-23',1,3,'Mardi',2,'Février',9,'2027-02-01','2027-02-28','2027-02-22','2027-02-28','N','N','O','N',NULL,NULL),('2027-02-24',1,4,'Mercredi',2,'Février',9,'2027-02-01','2027-02-28','2027-02-22','2027-02-28','N','N','O','N',NULL,NULL),('2027-02-25',1,5,'Jeudi',2,'Février',9,'2027-02-01','2027-02-28','2027-02-22','2027-02-28','N','N','O','N',NULL,NULL),('2027-02-26',1,6,'Vendredi',2,'Février',9,'2027-02-01','2027-02-28','2027-02-22','2027-02-28','N','N','O','N',NULL,NULL),('2027-02-27',1,7,'Samedi',2,'Février',9,'2027-02-01','2027-02-28','2027-02-22','2027-02-28','N','N','O','N',NULL,NULL),('2027-02-28',1,1,'Dimanche',2,'Février',10,'2027-02-01','2027-02-28','2027-02-22','2027-03-07','N','N','N','N',NULL,NULL),('2027-03-01',1,2,'Lundi',3,'Mars',10,'2027-03-01','2027-03-31','2027-03-01','2027-03-07','N','N','O','N',NULL,NULL),('2027-03-02',1,3,'Mardi',3,'Mars',10,'2027-03-01','2027-03-31','2027-03-01','2027-03-07','N','N','O','N',NULL,NULL),('2027-03-03',1,4,'Mercredi',3,'Mars',10,'2027-03-01','2027-03-31','2027-03-01','2027-03-07','N','N','O','N',NULL,NULL),('2027-03-04',1,5,'Jeudi',3,'Mars',10,'2027-03-01','2027-03-31','2027-03-01','2027-03-07','N','N','O','N',NULL,NULL),('2027-03-05',1,6,'Vendredi',3,'Mars',10,'2027-03-01','2027-03-31','2027-03-01','2027-03-07','N','N','O','N',NULL,NULL),('2027-03-06',1,7,'Samedi',3,'Mars',10,'2027-03-01','2027-03-31','2027-03-01','2027-03-07','N','N','O','N',NULL,NULL),('2027-03-07',1,1,'Dimanche',3,'Mars',11,'2027-03-01','2027-03-31','2027-03-01','2027-03-14','N','N','N','N',NULL,NULL),('2027-03-08',1,2,'Lundi',3,'Mars',11,'2027-03-01','2027-03-31','2027-03-08','2027-03-14','N','N','O','N',NULL,NULL),('2027-03-09',1,3,'Mardi',3,'Mars',11,'2027-03-01','2027-03-31','2027-03-08','2027-03-14','O','N','O','N',NULL,NULL),('2027-03-10',1,4,'Mercredi',3,'Mars',11,'2027-03-01','2027-03-31','2027-03-08','2027-03-14','N','N','O','N',NULL,NULL),('2027-03-11',1,5,'Jeudi',3,'Mars',11,'2027-03-01','2027-03-31','2027-03-08','2027-03-14','N','N','O','N',NULL,NULL),('2027-03-12',1,6,'Vendredi',3,'Mars',11,'2027-03-01','2027-03-31','2027-03-08','2027-03-14','N','N','O','N',NULL,NULL),('2027-03-13',1,7,'Samedi',3,'Mars',11,'2027-03-01','2027-03-31','2027-03-08','2027-03-14','N','N','O','N',NULL,NULL),('2027-03-14',1,1,'Dimanche',3,'Mars',12,'2027-03-01','2027-03-31','2027-03-08','2027-03-21','N','N','N','N',NULL,NULL),('2027-03-15',1,2,'Lundi',3,'Mars',12,'2027-03-01','2027-03-31','2027-03-15','2027-03-21','N','N','O','N',NULL,NULL),('2027-03-16',1,3,'Mardi',3,'Mars',12,'2027-03-01','2027-03-31','2027-03-15','2027-03-21','N','N','O','N',NULL,NULL),('2027-03-17',1,4,'Mercredi',3,'Mars',12,'2027-03-01','2027-03-31','2027-03-15','2027-03-21','N','N','O','N',NULL,NULL),('2027-03-18',1,5,'Jeudi',3,'Mars',12,'2027-03-01','2027-03-31','2027-03-15','2027-03-21','N','N','O','N',NULL,NULL),('2027-03-19',1,6,'Vendredi',3,'Mars',12,'2027-03-01','2027-03-31','2027-03-15','2027-03-21','N','N','O','N',NULL,NULL),('2027-03-20',1,7,'Samedi',3,'Mars',12,'2027-03-01','2027-03-31','2027-03-15','2027-03-21','N','O','O','N',NULL,NULL),('2027-03-21',1,1,'Dimanche',3,'Mars',13,'2027-03-01','2027-03-31','2027-03-15','2027-03-28','N','O','N','N',NULL,NULL),('2027-03-22',1,2,'Lundi',3,'Mars',13,'2027-03-01','2027-03-31','2027-03-22','2027-03-28','N','O','O','N',NULL,NULL),('2027-03-23',1,3,'Mardi',3,'Mars',13,'2027-03-01','2027-03-31','2027-03-22','2027-03-28','N','O','O','N',NULL,NULL),('2027-03-24',1,4,'Mercredi',3,'Mars',13,'2027-03-01','2027-03-31','2027-03-22','2027-03-28','N','O','O','N',NULL,NULL),('2027-03-25',1,5,'Jeudi',3,'Mars',13,'2027-03-01','2027-03-31','2027-03-22','2027-03-28','N','O','O','N',NULL,NULL),('2027-03-26',1,6,'Vendredi',3,'Mars',13,'2027-03-01','2027-03-31','2027-03-22','2027-03-28','N','O','O','N',NULL,NULL),('2027-03-27',1,7,'Samedi',3,'Mars',13,'2027-03-01','2027-03-31','2027-03-22','2027-03-28','N','O','O','N',NULL,NULL),('2027-03-28',1,1,'Dimanche',3,'Mars',14,'2027-03-01','2027-03-31','2027-03-22','2027-04-04','N','O','N','N',NULL,NULL),('2027-03-29',1,2,'Lundi',3,'Mars',14,'2027-03-01','2027-03-31','2027-03-29','2027-04-04','N','O','O','N',NULL,NULL),('2027-03-30',1,3,'Mardi',3,'Mars',14,'2027-03-01','2027-03-31','2027-03-29','2027-04-04','N','O','O','N',NULL,NULL),('2027-03-31',1,4,'Mercredi',3,'Mars',14,'2027-03-01','2027-03-31','2027-03-29','2027-04-04','N','O','O','N',NULL,NULL),('2027-04-01',1,5,'Jeudi',4,'Avril',14,'2027-04-01','2027-04-30','2027-03-29','2027-04-04','N','N','O','N',NULL,NULL),('2027-04-02',1,6,'Vendredi',4,'Avril',14,'2027-04-01','2027-04-30','2027-03-29','2027-04-04','N','N','O','N',NULL,NULL),('2027-04-03',1,7,'Samedi',4,'Avril',14,'2027-04-01','2027-04-30','2027-03-29','2027-04-04','N','N','O','N',NULL,NULL),('2027-04-04',1,1,'Dimanche',4,'Avril',15,'2027-04-01','2027-04-30','2027-03-29','2027-04-11','N','N','N','N',NULL,NULL),('2027-04-05',1,2,'Lundi',4,'Avril',15,'2027-04-01','2027-04-30','2027-04-05','2027-04-11','N','N','O','N',NULL,NULL),('2027-04-06',1,3,'Mardi',4,'Avril',15,'2027-04-01','2027-04-30','2027-04-05','2027-04-11','N','N','O','N',NULL,NULL),('2027-04-07',1,4,'Mercredi',4,'Avril',15,'2027-04-01','2027-04-30','2027-04-05','2027-04-11','N','N','O','N',NULL,NULL),('2027-04-08',1,5,'Jeudi',4,'Avril',15,'2027-04-01','2027-04-30','2027-04-05','2027-04-11','N','N','O','N',NULL,NULL),('2027-04-09',1,6,'Vendredi',4,'Avril',15,'2027-04-01','2027-04-30','2027-04-05','2027-04-11','N','N','O','N',NULL,NULL),('2027-04-10',1,7,'Samedi',4,'Avril',15,'2027-04-01','2027-04-30','2027-04-05','2027-04-11','N','N','O','N',NULL,NULL),('2027-04-11',1,1,'Dimanche',4,'Avril',16,'2027-04-01','2027-04-30','2027-04-05','2027-04-18','N','N','N','N',NULL,NULL),('2027-04-12',1,2,'Lundi',4,'Avril',16,'2027-04-01','2027-04-30','2027-04-12','2027-04-18','N','N','O','N',NULL,NULL),('2027-04-13',1,3,'Mardi',4,'Avril',16,'2027-04-01','2027-04-30','2027-04-12','2027-04-18','O','N','O','N',NULL,NULL),('2027-04-14',1,4,'Mercredi',4,'Avril',16,'2027-04-01','2027-04-30','2027-04-12','2027-04-18','N','N','O','N',NULL,NULL),('2027-04-15',1,5,'Jeudi',4,'Avril',16,'2027-04-01','2027-04-30','2027-04-12','2027-04-18','N','N','O','N',NULL,NULL),('2027-04-16',1,6,'Vendredi',4,'Avril',16,'2027-04-01','2027-04-30','2027-04-12','2027-04-18','N','N','O','N',NULL,NULL),('2027-04-17',1,7,'Samedi',4,'Avril',16,'2027-04-01','2027-04-30','2027-04-12','2027-04-18','N','N','O','N',NULL,NULL),('2027-04-18',1,1,'Dimanche',4,'Avril',17,'2027-04-01','2027-04-30','2027-04-12','2027-04-25','N','N','N','N',NULL,NULL),('2027-04-19',1,2,'Lundi',4,'Avril',17,'2027-04-01','2027-04-30','2027-04-19','2027-04-25','N','N','O','N',NULL,NULL),('2027-04-20',1,3,'Mardi',4,'Avril',17,'2027-04-01','2027-04-30','2027-04-19','2027-04-25','N','N','O','N',NULL,NULL),('2027-04-21',1,4,'Mercredi',4,'Avril',17,'2027-04-01','2027-04-30','2027-04-19','2027-04-25','N','N','O','N',NULL,NULL),('2027-04-22',1,5,'Jeudi',4,'Avril',17,'2027-04-01','2027-04-30','2027-04-19','2027-04-25','N','N','O','N',NULL,NULL),('2027-04-23',1,6,'Vendredi',4,'Avril',17,'2027-04-01','2027-04-30','2027-04-19','2027-04-25','N','N','O','N',NULL,NULL),('2027-04-24',1,7,'Samedi',4,'Avril',17,'2027-04-01','2027-04-30','2027-04-19','2027-04-25','N','N','O','N',NULL,NULL),('2027-04-25',1,1,'Dimanche',4,'Avril',18,'2027-04-01','2027-04-30','2027-04-19','2027-05-02','N','N','N','N',NULL,NULL),('2027-04-26',1,2,'Lundi',4,'Avril',18,'2027-04-01','2027-04-30','2027-04-26','2027-05-02','N','N','O','N',NULL,NULL),('2027-04-27',1,3,'Mardi',4,'Avril',18,'2027-04-01','2027-04-30','2027-04-26','2027-05-02','N','N','O','N',NULL,NULL),('2027-04-28',1,4,'Mercredi',4,'Avril',18,'2027-04-01','2027-04-30','2027-04-26','2027-05-02','N','N','O','N',NULL,NULL),('2027-04-29',1,5,'Jeudi',4,'Avril',18,'2027-04-01','2027-04-30','2027-04-26','2027-05-02','N','N','O','N',NULL,NULL),('2027-04-30',1,6,'Vendredi',4,'Avril',18,'2027-04-01','2027-04-30','2027-04-26','2027-05-02','N','N','O','N',NULL,NULL),('2027-05-01',1,7,'Samedi',5,'Mai',18,'2027-05-01','2027-05-31','2027-04-26','2027-05-02','O','N','O','N',NULL,NULL),('2027-05-02',1,1,'Dimanche',5,'Mai',19,'2027-05-01','2027-05-31','2027-04-26','2027-05-09','N','N','N','N',NULL,NULL),('2027-05-03',1,2,'Lundi',5,'Mai',19,'2027-05-01','2027-05-31','2027-05-03','2027-05-09','N','N','O','N',NULL,NULL),('2027-05-04',1,3,'Mardi',5,'Mai',19,'2027-05-01','2027-05-31','2027-05-03','2027-05-09','N','N','O','N',NULL,NULL),('2027-05-05',1,4,'Mercredi',5,'Mai',19,'2027-05-01','2027-05-31','2027-05-03','2027-05-09','N','N','O','N',NULL,NULL),('2027-05-06',1,5,'Jeudi',5,'Mai',19,'2027-05-01','2027-05-31','2027-05-03','2027-05-09','N','N','O','N',NULL,NULL),('2027-05-07',1,6,'Vendredi',5,'Mai',19,'2027-05-01','2027-05-31','2027-05-03','2027-05-09','N','N','O','N',NULL,NULL),('2027-05-08',1,7,'Samedi',5,'Mai',19,'2027-05-01','2027-05-31','2027-05-03','2027-05-09','N','N','O','N',NULL,NULL),('2027-05-09',1,1,'Dimanche',5,'Mai',20,'2027-05-01','2027-05-31','2027-05-03','2027-05-16','N','N','N','N',NULL,NULL),('2027-05-10',1,2,'Lundi',5,'Mai',20,'2027-05-01','2027-05-31','2027-05-10','2027-05-16','N','N','O','N',NULL,NULL),('2027-05-11',1,3,'Mardi',5,'Mai',20,'2027-05-01','2027-05-31','2027-05-10','2027-05-16','N','N','O','N',NULL,NULL),('2027-05-12',1,4,'Mercredi',5,'Mai',20,'2027-05-01','2027-05-31','2027-05-10','2027-05-16','N','N','O','N',NULL,NULL),('2027-05-13',1,5,'Jeudi',5,'Mai',20,'2027-05-01','2027-05-31','2027-05-10','2027-05-16','N','N','O','N',NULL,NULL),('2027-05-14',1,6,'Vendredi',5,'Mai',20,'2027-05-01','2027-05-31','2027-05-10','2027-05-16','N','N','O','N',NULL,NULL),('2027-05-15',1,7,'Samedi',5,'Mai',20,'2027-05-01','2027-05-31','2027-05-10','2027-05-16','N','N','O','N',NULL,NULL),('2027-05-16',1,1,'Dimanche',5,'Mai',21,'2027-05-01','2027-05-31','2027-05-10','2027-05-23','N','N','N','N',NULL,NULL),('2027-05-17',1,2,'Lundi',5,'Mai',21,'2027-05-01','2027-05-31','2027-05-17','2027-05-23','N','N','O','N',NULL,NULL),('2027-05-18',1,3,'Mardi',5,'Mai',21,'2027-05-01','2027-05-31','2027-05-17','2027-05-23','N','N','O','N',NULL,NULL),('2027-05-19',1,4,'Mercredi',5,'Mai',21,'2027-05-01','2027-05-31','2027-05-17','2027-05-23','N','N','O','N',NULL,NULL),('2027-05-20',1,5,'Jeudi',5,'Mai',21,'2027-05-01','2027-05-31','2027-05-17','2027-05-23','N','N','O','N',NULL,NULL),('2027-05-21',1,6,'Vendredi',5,'Mai',21,'2027-05-01','2027-05-31','2027-05-17','2027-05-23','O','N','O','N',NULL,NULL),('2027-05-22',1,7,'Samedi',5,'Mai',21,'2027-05-01','2027-05-31','2027-05-17','2027-05-23','N','N','O','N',NULL,NULL),('2027-05-23',1,1,'Dimanche',5,'Mai',22,'2027-05-01','2027-05-31','2027-05-17','2027-05-30','N','N','N','N',NULL,NULL),('2027-05-24',1,2,'Lundi',5,'Mai',22,'2027-05-01','2027-05-31','2027-05-24','2027-05-30','N','N','O','N',NULL,NULL),('2027-05-25',1,3,'Mardi',5,'Mai',22,'2027-05-01','2027-05-31','2027-05-24','2027-05-30','N','N','O','N',NULL,NULL),('2027-05-26',1,4,'Mercredi',5,'Mai',22,'2027-05-01','2027-05-31','2027-05-24','2027-05-30','N','N','O','N',NULL,NULL),('2027-05-27',1,5,'Jeudi',5,'Mai',22,'2027-05-01','2027-05-31','2027-05-24','2027-05-30','N','N','O','N',NULL,NULL),('2027-05-28',1,6,'Vendredi',5,'Mai',22,'2027-05-01','2027-05-31','2027-05-24','2027-05-30','N','N','O','N',NULL,NULL),('2027-05-29',1,7,'Samedi',5,'Mai',22,'2027-05-01','2027-05-31','2027-05-24','2027-05-30','N','N','O','N',NULL,NULL),('2027-05-30',1,1,'Dimanche',5,'Mai',23,'2027-05-01','2027-05-31','2027-05-24','2027-06-06','N','N','N','N',NULL,NULL),('2027-05-31',1,2,'Lundi',5,'Mai',23,'2027-05-01','2027-05-31','2027-05-31','2027-06-06','N','N','O','N',NULL,NULL),('2027-06-01',1,3,'Mardi',6,'Juin',23,'2027-06-01','2027-06-30','2027-05-31','2027-06-06','N','N','O','N',NULL,NULL),('2027-06-02',1,4,'Mercredi',6,'Juin',23,'2027-06-01','2027-06-30','2027-05-31','2027-06-06','N','N','O','N',NULL,NULL),('2027-06-03',1,5,'Jeudi',6,'Juin',23,'2027-06-01','2027-06-30','2027-05-31','2027-06-06','N','N','O','N',NULL,NULL),('2027-06-04',1,6,'Vendredi',6,'Juin',23,'2027-06-01','2027-06-30','2027-05-31','2027-06-06','N','N','O','N',NULL,NULL),('2027-06-05',1,7,'Samedi',6,'Juin',23,'2027-06-01','2027-06-30','2027-05-31','2027-06-06','N','N','O','N',NULL,NULL),('2027-06-06',1,1,'Dimanche',6,'Juin',24,'2027-06-01','2027-06-30','2027-05-31','2027-06-13','N','N','N','N',NULL,NULL),('2027-06-07',1,2,'Lundi',6,'Juin',24,'2027-06-01','2027-06-30','2027-06-07','2027-06-13','N','N','O','N',NULL,NULL),('2027-06-08',1,3,'Mardi',6,'Juin',24,'2027-06-01','2027-06-30','2027-06-07','2027-06-13','N','N','O','N',NULL,NULL),('2027-06-09',1,4,'Mercredi',6,'Juin',24,'2027-06-01','2027-06-30','2027-06-07','2027-06-13','N','N','O','N',NULL,NULL),('2027-06-10',1,5,'Jeudi',6,'Juin',24,'2027-06-01','2027-06-30','2027-06-07','2027-06-13','N','N','O','N',NULL,NULL),('2027-06-11',1,6,'Vendredi',6,'Juin',24,'2027-06-01','2027-06-30','2027-06-07','2027-06-13','N','N','O','N',NULL,NULL),('2027-06-12',1,7,'Samedi',6,'Juin',24,'2027-06-01','2027-06-30','2027-06-07','2027-06-13','N','N','O','N',NULL,NULL),('2027-06-13',1,1,'Dimanche',6,'Juin',25,'2027-06-01','2027-06-30','2027-06-07','2027-06-20','N','N','N','N',NULL,NULL),('2027-06-14',1,2,'Lundi',6,'Juin',25,'2027-06-01','2027-06-30','2027-06-14','2027-06-20','N','N','O','N',NULL,NULL),('2027-06-15',1,3,'Mardi',6,'Juin',25,'2027-06-01','2027-06-30','2027-06-14','2027-06-20','N','N','O','N',NULL,NULL),('2027-06-16',1,4,'Mercredi',6,'Juin',25,'2027-06-01','2027-06-30','2027-06-14','2027-06-20','N','N','O','N',NULL,NULL),('2027-06-17',1,5,'Jeudi',6,'Juin',25,'2027-06-01','2027-06-30','2027-06-14','2027-06-20','N','N','O','N',NULL,NULL),('2027-06-18',1,6,'Vendredi',6,'Juin',25,'2027-06-01','2027-06-30','2027-06-14','2027-06-20','N','N','O','N',NULL,NULL),('2027-06-19',1,7,'Samedi',6,'Juin',25,'2027-06-01','2027-06-30','2027-06-14','2027-06-20','N','N','O','N',NULL,NULL),('2027-06-20',1,1,'Dimanche',6,'Juin',26,'2027-06-01','2027-06-30','2027-06-14','2027-06-27','N','N','N','N',NULL,NULL),('2027-06-21',1,2,'Lundi',6,'Juin',26,'2027-06-01','2027-06-30','2027-06-21','2027-06-27','N','N','O','N',NULL,NULL),('2027-06-22',1,3,'Mardi',6,'Juin',26,'2027-06-01','2027-06-30','2027-06-21','2027-06-27','N','N','O','N',NULL,NULL),('2027-06-23',1,4,'Mercredi',6,'Juin',26,'2027-06-01','2027-06-30','2027-06-21','2027-06-27','N','N','O','N',NULL,NULL),('2027-06-24',1,5,'Jeudi',6,'Juin',26,'2027-06-01','2027-06-30','2027-06-21','2027-06-27','N','N','O','N',NULL,NULL),('2027-06-25',1,6,'Vendredi',6,'Juin',26,'2027-06-01','2027-06-30','2027-06-21','2027-06-27','N','N','O','N',NULL,NULL),('2027-06-26',1,7,'Samedi',6,'Juin',26,'2027-06-01','2027-06-30','2027-06-21','2027-06-27','N','N','O','N',NULL,NULL),('2027-06-27',1,1,'Dimanche',6,'Juin',27,'2027-06-01','2027-06-30','2027-06-21','2027-07-04','N','N','N','N',NULL,NULL),('2027-06-28',1,2,'Lundi',6,'Juin',27,'2027-06-01','2027-06-30','2027-06-28','2027-07-04','N','N','O','N',NULL,NULL),('2027-06-29',1,3,'Mardi',6,'Juin',27,'2027-06-01','2027-06-30','2027-06-28','2027-07-04','N','N','O','N',NULL,NULL),('2027-06-30',1,4,'Mercredi',6,'Juin',27,'2027-06-01','2027-06-30','2027-06-28','2027-07-04','N','N','O','N',NULL,NULL),('2027-07-01',1,5,'Jeudi',7,'Juillet',27,'2027-07-01','2027-07-31','2027-06-28','2027-07-04','N','N','O','N',NULL,NULL),('2027-07-02',1,6,'Vendredi',7,'Juillet',27,'2027-07-01','2027-07-31','2027-06-28','2027-07-04','N','N','O','N',NULL,NULL),('2027-07-03',1,7,'Samedi',7,'Juillet',27,'2027-07-01','2027-07-31','2027-06-28','2027-07-04','N','N','O','N',NULL,NULL),('2027-07-04',1,1,'Dimanche',7,'Juillet',28,'2027-07-01','2027-07-31','2027-06-28','2027-07-11','N','N','N','N',NULL,NULL),('2027-07-05',1,2,'Lundi',7,'Juillet',28,'2027-07-01','2027-07-31','2027-07-05','2027-07-11','N','N','O','N',NULL,NULL),('2027-07-06',1,3,'Mardi',7,'Juillet',28,'2027-07-01','2027-07-31','2027-07-05','2027-07-11','N','N','O','N',NULL,NULL),('2027-07-07',1,4,'Mercredi',7,'Juillet',28,'2027-07-01','2027-07-31','2027-07-05','2027-07-11','N','N','O','N',NULL,NULL),('2027-07-08',1,5,'Jeudi',7,'Juillet',28,'2027-07-01','2027-07-31','2027-07-05','2027-07-11','N','N','O','N',NULL,NULL),('2027-07-09',1,6,'Vendredi',7,'Juillet',28,'2027-07-01','2027-07-31','2027-07-05','2027-07-11','N','N','O','N',NULL,NULL),('2027-07-10',1,7,'Samedi',7,'Juillet',28,'2027-07-01','2027-07-31','2027-07-05','2027-07-11','N','N','O','N',NULL,NULL),('2027-07-11',1,1,'Dimanche',7,'Juillet',29,'2027-07-01','2027-07-31','2027-07-05','2027-07-18','N','N','N','N',NULL,NULL),('2027-07-12',1,2,'Lundi',7,'Juillet',29,'2027-07-01','2027-07-31','2027-07-12','2027-07-18','N','N','O','N',NULL,NULL),('2027-07-13',1,3,'Mardi',7,'Juillet',29,'2027-07-01','2027-07-31','2027-07-12','2027-07-18','N','N','O','N',NULL,NULL),('2027-07-14',1,4,'Mercredi',7,'Juillet',29,'2027-07-01','2027-07-31','2027-07-12','2027-07-18','N','N','O','N',NULL,NULL),('2027-07-15',1,5,'Jeudi',7,'Juillet',29,'2027-07-01','2027-07-31','2027-07-12','2027-07-18','N','O','O','N',NULL,NULL),('2027-07-16',1,6,'Vendredi',7,'Juillet',29,'2027-07-01','2027-07-31','2027-07-12','2027-07-18','N','O','O','N',NULL,NULL),('2027-07-17',1,7,'Samedi',7,'Juillet',29,'2027-07-01','2027-07-31','2027-07-12','2027-07-18','N','O','O','N',NULL,NULL),('2027-07-18',1,1,'Dimanche',7,'Juillet',30,'2027-07-01','2027-07-31','2027-07-12','2027-07-25','N','O','N','N',NULL,NULL),('2027-07-19',1,2,'Lundi',7,'Juillet',30,'2027-07-01','2027-07-31','2027-07-19','2027-07-25','N','O','O','N',NULL,NULL),('2027-07-20',1,3,'Mardi',7,'Juillet',30,'2027-07-01','2027-07-31','2027-07-19','2027-07-25','N','O','O','N',NULL,NULL),('2027-07-21',1,4,'Mercredi',7,'Juillet',30,'2027-07-01','2027-07-31','2027-07-19','2027-07-25','N','O','O','N',NULL,NULL),('2027-07-22',1,5,'Jeudi',7,'Juillet',30,'2027-07-01','2027-07-31','2027-07-19','2027-07-25','N','O','O','N',NULL,NULL),('2027-07-23',1,6,'Vendredi',7,'Juillet',30,'2027-07-01','2027-07-31','2027-07-19','2027-07-25','N','O','O','N',NULL,NULL),('2027-07-24',1,7,'Samedi',7,'Juillet',30,'2027-07-01','2027-07-31','2027-07-19','2027-07-25','N','O','O','N',NULL,NULL),('2027-07-25',1,1,'Dimanche',7,'Juillet',31,'2027-07-01','2027-07-31','2027-07-19','2027-08-01','N','O','N','N',NULL,NULL),('2027-07-26',1,2,'Lundi',7,'Juillet',31,'2027-07-01','2027-07-31','2027-07-26','2027-08-01','N','O','O','N',NULL,NULL),('2027-07-27',1,3,'Mardi',7,'Juillet',31,'2027-07-01','2027-07-31','2027-07-26','2027-08-01','N','O','O','N',NULL,NULL),('2027-07-28',1,4,'Mercredi',7,'Juillet',31,'2027-07-01','2027-07-31','2027-07-26','2027-08-01','N','O','O','N',NULL,NULL),('2027-07-29',1,5,'Jeudi',7,'Juillet',31,'2027-07-01','2027-07-31','2027-07-26','2027-08-01','N','O','O','N',NULL,NULL),('2027-07-30',1,6,'Vendredi',7,'Juillet',31,'2027-07-01','2027-07-31','2027-07-26','2027-08-01','N','O','O','N',NULL,NULL),('2027-07-31',1,7,'Samedi',7,'Juillet',31,'2027-07-01','2027-07-31','2027-07-26','2027-08-01','N','O','O','N',NULL,NULL),('2027-08-01',1,1,'Dimanche',8,'Aout',32,'2027-08-01','2027-08-31','2027-07-26','2027-08-08','N','O','N','N',NULL,NULL),('2027-08-02',1,2,'Lundi',8,'Aout',32,'2027-08-01','2027-08-31','2027-08-02','2027-08-08','N','O','O','N',NULL,NULL),('2027-08-03',1,3,'Mardi',8,'Aout',32,'2027-08-01','2027-08-31','2027-08-02','2027-08-08','N','O','O','N',NULL,NULL),('2027-08-04',1,4,'Mercredi',8,'Aout',32,'2027-08-01','2027-08-31','2027-08-02','2027-08-08','N','O','O','N',NULL,NULL),('2027-08-05',1,5,'Jeudi',8,'Aout',32,'2027-08-01','2027-08-31','2027-08-02','2027-08-08','N','O','O','N',NULL,NULL),('2027-08-06',1,6,'Vendredi',8,'Aout',32,'2027-08-01','2027-08-31','2027-08-02','2027-08-08','N','O','O','N',NULL,NULL),('2027-08-07',1,7,'Samedi',8,'Aout',32,'2027-08-01','2027-08-31','2027-08-02','2027-08-08','N','O','O','N',NULL,NULL),('2027-08-08',1,1,'Dimanche',8,'Aout',33,'2027-08-01','2027-08-31','2027-08-02','2027-08-15','N','O','N','N',NULL,NULL),('2027-08-09',1,2,'Lundi',8,'Aout',33,'2027-08-01','2027-08-31','2027-08-09','2027-08-15','N','O','O','N',NULL,NULL),('2027-08-10',1,3,'Mardi',8,'Aout',33,'2027-08-01','2027-08-31','2027-08-09','2027-08-15','N','O','O','N',NULL,NULL),('2027-08-11',1,4,'Mercredi',8,'Aout',33,'2027-08-01','2027-08-31','2027-08-09','2027-08-15','N','O','O','N',NULL,NULL),('2027-08-12',1,5,'Jeudi',8,'Aout',33,'2027-08-01','2027-08-31','2027-08-09','2027-08-15','N','O','O','N',NULL,NULL),('2027-08-13',1,6,'Vendredi',8,'Aout',33,'2027-08-01','2027-08-31','2027-08-09','2027-08-15','N','O','O','N',NULL,NULL),('2027-08-14',1,7,'Samedi',8,'Aout',33,'2027-08-01','2027-08-31','2027-08-09','2027-08-15','N','O','O','N',NULL,NULL),('2027-08-15',1,1,'Dimanche',8,'Aout',34,'2027-08-01','2027-08-31','2027-08-09','2027-08-22','N','O','N','N',NULL,NULL),('2027-08-16',1,2,'Lundi',8,'Aout',34,'2027-08-01','2027-08-31','2027-08-16','2027-08-22','N','O','O','N',NULL,NULL),('2027-08-17',1,3,'Mardi',8,'Aout',34,'2027-08-01','2027-08-31','2027-08-16','2027-08-22','N','O','O','N',NULL,NULL),('2027-08-18',1,4,'Mercredi',8,'Aout',34,'2027-08-01','2027-08-31','2027-08-16','2027-08-22','N','O','O','N',NULL,NULL),('2027-08-19',1,5,'Jeudi',8,'Aout',34,'2027-08-01','2027-08-31','2027-08-16','2027-08-22','N','O','O','N',NULL,NULL),('2027-08-20',1,6,'Vendredi',8,'Aout',34,'2027-08-01','2027-08-31','2027-08-16','2027-08-22','N','O','O','N',NULL,NULL),('2027-08-21',1,7,'Samedi',8,'Aout',34,'2027-08-01','2027-08-31','2027-08-16','2027-08-22','N','O','O','N',NULL,NULL),('2027-08-22',1,1,'Dimanche',8,'Aout',35,'2027-08-01','2027-08-31','2027-08-16','2027-08-29','N','O','N','N',NULL,NULL),('2027-08-23',1,2,'Lundi',8,'Aout',35,'2027-08-01','2027-08-31','2027-08-23','2027-08-29','N','O','O','N',NULL,NULL),('2027-08-24',1,3,'Mardi',8,'Aout',35,'2027-08-01','2027-08-31','2027-08-23','2027-08-29','N','O','O','N',NULL,NULL),('2027-08-25',1,4,'Mercredi',8,'Aout',35,'2027-08-01','2027-08-31','2027-08-23','2027-08-29','N','O','O','N',NULL,NULL),('2027-08-26',1,5,'Jeudi',8,'Aout',35,'2027-08-01','2027-08-31','2027-08-23','2027-08-29','N','O','O','N',NULL,NULL),('2027-08-27',1,6,'Vendredi',8,'Aout',35,'2027-08-01','2027-08-31','2027-08-23','2027-08-29','N','O','O','N',NULL,NULL),('2027-08-28',1,7,'Samedi',8,'Aout',35,'2027-08-01','2027-08-31','2027-08-23','2027-08-29','N','O','O','N',NULL,NULL),('2027-08-29',1,1,'Dimanche',8,'Aout',36,'2027-08-01','2027-08-31','2027-08-23','2027-09-05','N','O','N','N',NULL,NULL),('2027-08-30',1,2,'Lundi',8,'Aout',36,'2027-08-01','2027-08-31','2027-08-30','2027-09-05','N','O','O','N',NULL,NULL),('2027-08-31',1,3,'Mardi',8,'Aout',36,'2027-08-01','2027-08-31','2027-08-30','2027-09-05','N','O','O','N',NULL,NULL),('2027-09-01',1,4,'Mercredi',9,'Septembre',36,'2027-09-01','2027-09-30','2027-08-30','2027-09-05','N','O','O','N',NULL,NULL),('2027-09-02',1,5,'Jeudi',9,'Septembre',36,'2027-09-01','2027-09-30','2027-08-30','2027-09-05','N','O','O','N',NULL,NULL),('2027-09-03',1,6,'Vendredi',9,'Septembre',36,'2027-09-01','2027-09-30','2027-08-30','2027-09-05','N','O','O','N',NULL,NULL),('2027-09-04',1,7,'Samedi',9,'Septembre',36,'2027-09-01','2027-09-30','2027-08-30','2027-09-05','N','O','O','N',NULL,NULL),('2027-09-05',1,1,'Dimanche',9,'Septembre',37,'2027-09-01','2027-09-30','2027-08-30','2027-09-12','N','O','N','N',NULL,NULL),('2027-09-06',1,2,'Lundi',9,'Septembre',37,'2027-09-01','2027-09-30','2027-09-06','2027-09-12','N','O','O','N',NULL,NULL),('2027-09-07',1,3,'Mardi',9,'Septembre',37,'2027-09-01','2027-09-30','2027-09-06','2027-09-12','N','O','O','N',NULL,NULL),('2027-09-08',1,4,'Mercredi',9,'Septembre',37,'2027-09-01','2027-09-30','2027-09-06','2027-09-12','N','O','O','N',NULL,NULL),('2027-09-09',1,5,'Jeudi',9,'Septembre',37,'2027-09-01','2027-09-30','2027-09-06','2027-09-12','N','O','O','N',NULL,NULL),('2027-09-10',1,6,'Vendredi',9,'Septembre',37,'2027-09-01','2027-09-30','2027-09-06','2027-09-12','N','O','O','N',NULL,NULL),('2027-09-11',1,7,'Samedi',9,'Septembre',37,'2027-09-01','2027-09-30','2027-09-06','2027-09-12','N','O','O','N',NULL,NULL),('2027-09-12',1,1,'Dimanche',9,'Septembre',38,'2027-09-01','2027-09-30','2027-09-06','2027-09-19','N','O','N','N',NULL,NULL),('2027-09-13',1,2,'Lundi',9,'Septembre',38,'2027-09-01','2027-09-30','2027-09-13','2027-09-19','N','O','O','N',NULL,NULL),('2027-09-14',1,3,'Mardi',9,'Septembre',38,'2027-09-01','2027-09-30','2027-09-13','2027-09-19','N','O','O','N',NULL,NULL),('2027-09-15',1,4,'Mercredi',9,'Septembre',38,'2027-09-01','2027-09-30','2027-09-13','2027-09-19','N','O','O','N',NULL,NULL),('2027-09-16',1,5,'Jeudi',9,'Septembre',38,'2027-09-01','2027-09-30','2027-09-13','2027-09-19','N','O','O','N',NULL,NULL),('2027-09-17',1,6,'Vendredi',9,'Septembre',38,'2027-09-01','2027-09-30','2027-09-13','2027-09-19','N','O','O','N',NULL,NULL),('2027-09-18',1,7,'Samedi',9,'Septembre',38,'2027-09-01','2027-09-30','2027-09-13','2027-09-19','N','O','O','N',NULL,NULL),('2027-09-19',1,1,'Dimanche',9,'Septembre',39,'2027-09-01','2027-09-30','2027-09-13','2027-09-26','N','O','N','N',NULL,NULL),('2027-09-20',1,2,'Lundi',9,'Septembre',39,'2027-09-01','2027-09-30','2027-09-20','2027-09-26','N','O','O','N',NULL,NULL),('2027-09-21',1,3,'Mardi',9,'Septembre',39,'2027-09-01','2027-09-30','2027-09-20','2027-09-26','N','O','O','N',NULL,NULL),('2027-09-22',1,4,'Mercredi',9,'Septembre',39,'2027-09-01','2027-09-30','2027-09-20','2027-09-26','N','O','O','N',NULL,NULL),('2027-09-23',1,5,'Jeudi',9,'Septembre',39,'2027-09-01','2027-09-30','2027-09-20','2027-09-26','N','O','O','N',NULL,NULL),('2027-09-24',1,6,'Vendredi',9,'Septembre',39,'2027-09-01','2027-09-30','2027-09-20','2027-09-26','N','O','O','N',NULL,NULL),('2027-09-25',1,7,'Samedi',9,'Septembre',39,'2027-09-01','2027-09-30','2027-09-20','2027-09-26','N','O','O','N',NULL,NULL),('2027-09-26',1,1,'Dimanche',9,'Septembre',40,'2027-09-01','2027-09-30','2027-09-20','2027-10-03','N','O','N','N',NULL,NULL),('2027-09-27',1,2,'Lundi',9,'Septembre',40,'2027-09-01','2027-09-30','2027-09-27','2027-10-03','N','O','O','N',NULL,NULL),('2027-09-28',1,3,'Mardi',9,'Septembre',40,'2027-09-01','2027-09-30','2027-09-27','2027-10-03','N','O','O','N',NULL,NULL),('2027-09-29',1,4,'Mercredi',9,'Septembre',40,'2027-09-01','2027-09-30','2027-09-27','2027-10-03','N','O','O','N',NULL,NULL),('2027-09-30',1,5,'Jeudi',9,'Septembre',40,'2027-09-01','2027-09-30','2027-09-27','2027-10-03','N','O','O','N',NULL,NULL);
/*!40000 ALTER TABLE `pa_calendrier_scolaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_chapitre`
--

DROP TABLE IF EXISTS `pa_chapitre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_chapitre` (
  `ID_CHAPITRE` int NOT NULL AUTO_INCREMENT,
  `COD_CHAPITR` varchar(5) DEFAULT NULL,
  `LIB_CRT_CHAPITR` varchar(64) DEFAULT NULL,
  `LIB_LNG_CHAPITR` varchar(128) DEFAULT NULL,
  `COD_TYPE_CHAPITR` varchar(3) DEFAULT NULL,
  `LIB_TYPE_CHAPITR` varchar(64) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CHAPITRE`),
  UNIQUE KEY `I_PU_PA_CHAPITRE` (`COD_CHAPITR`),
  KEY `FK_SE_USERNAME_CREA_PA_CHAPITRE` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_CHAPITRE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Chapitre';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_chapitre`
--

LOCK TABLES `pa_chapitre` WRITE;
/*!40000 ALTER TABLE `pa_chapitre` DISABLE KEYS */;
INSERT INTO `pa_chapitre` VALUES (1,'ROR10','Chapitre    I','Recettes Ordinaires','R','Recette',NULL,NULL),(2,'REO20','Chapitre   II','Recettes ExtraOrdinaires','R','Recette',NULL,NULL),(3,'DAP10','Chapitre    I','Activités Pedagogiques','D','Dépense',NULL,NULL),(4,'DMF20','Chapitre   II',' Matériels et Fournitures','D','Dépense',NULL,NULL),(5,'DEP30','Chapitre  III','Entretient et Preparation','D','Dépense',NULL,NULL),(6,'DCP40','Chapitre   IV','Charge du Personnel','D','Dépense',NULL,NULL),(7,'DAC50','Chapitre    V','Autres Charges Génerale','D','Dépense',NULL,NULL),(8,'DTP60','Chapitre   VI','Transfert des Font','D','Dépense',NULL,NULL),(9,'DEQ70','Chapitre  VII','Equipements','D','Dépense',NULL,NULL),(10,'DIN80','Chapitre VIII','Investissements','D','Dépense',NULL,NULL);
/*!40000 ALTER TABLE `pa_chapitre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_circonscription`
--

DROP TABLE IF EXISTS `pa_circonscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_circonscription` (
  `ID_CIR` int NOT NULL AUTO_INCREMENT,
  `ID_PROV` int NOT NULL,
  `COD_CIR` char(6) DEFAULT NULL,
  `LIB_CIR` varchar(128) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `ID_PAYS` int NOT NULL,
  PRIMARY KEY (`ID_CIR`),
  KEY `fk_cir_prov` (`ID_PROV`),
  KEY `fk_cir_pays` (`ID_PAYS`),
  CONSTRAINT `fk_cir_pays` FOREIGN KEY (`ID_PAYS`) REFERENCES `pa_pays` (`ID_PAYS`),
  CONSTRAINT `fk_cir_prov` FOREIGN KEY (`ID_PROV`) REFERENCES `pa_province` (`ID_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Circonscription';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_circonscription`
--

LOCK TABLES `pa_circonscription` WRITE;
/*!40000 ALTER TABLE `pa_circonscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_circonscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_classe`
--

DROP TABLE IF EXISTS `pa_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_classe` (
  `ID_CLASSE` int NOT NULL AUTO_INCREMENT,
  `ID_SALLE` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `COD_CLASSE` char(5) NOT NULL,
  `LIB_CLASSE` varchar(64) NOT NULL,
  `DAT_SUP_CLASSE` date DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CLASSE`),
  UNIQUE KEY `I_PU_PA_CLASSE` (`COD_CLASSE`),
  KEY `I_FK_PA_CLASSE_PA_SALLE` (`ID_SALLE`),
  KEY `I_FK_PA_CLASSE_PA_NIV_ETUDE` (`ID_NIV_ETU`),
  KEY `FK_SE_USERNAME_CREA_PA_CLASSE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_CLASSE_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_PA_CLASSE_PA_SALLE` FOREIGN KEY (`ID_SALLE`) REFERENCES `pa_salle` (`ID_SALLE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_CLASSE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Classe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_classe`
--

LOCK TABLES `pa_classe` WRITE;
/*!40000 ALTER TABLE `pa_classe` DISABLE KEYS */;
INSERT INTO `pa_classe` VALUES (1,1,1,'600A0','6ème A',NULL,NULL,NULL),(2,2,1,'600B0','6ème B',NULL,NULL,NULL),(3,5,2,'500A0','5ème A',NULL,NULL,NULL),(4,6,2,'500B0','5ème B',NULL,NULL,NULL),(5,7,3,'400A0','4ème A',NULL,NULL,NULL),(6,8,3,'400B0','4ème B',NULL,NULL,NULL),(7,9,3,'400C0','4ème C',NULL,NULL,NULL),(8,11,4,'300A0','3ème A',NULL,NULL,NULL),(9,12,4,'300B0','3ème B',NULL,NULL,NULL),(10,15,7,'200C1','2nd C1',NULL,NULL,NULL),(11,19,10,'100D1','1ère D1',NULL,NULL,NULL),(12,22,13,'TL0D1','Tle D1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pa_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_commune`
--

DROP TABLE IF EXISTS `pa_commune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_commune` (
  `ID_COM` int NOT NULL AUTO_INCREMENT,
  `ID_PROV` int NOT NULL,
  `ID_PAYS` int DEFAULT NULL,
  `COD_COM` char(6) DEFAULT NULL,
  `LIB_COM` varchar(128) NOT NULL,
  `COD_TYP_COM` char(2) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_COM`),
  UNIQUE KEY `I_PU_PA_COMMUNE` (`COD_COM`),
  KEY `I_FK_PA_COMMUNE_PA_PROVINCE` (`ID_PROV`),
  KEY `I_FK_PA_COMMUNE_PA_PAYS` (`ID_PAYS`),
  KEY `FK_SE_USERNAME_CREA_PA_COMMUNE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_COMMUNE_PA_PAYS` FOREIGN KEY (`ID_PAYS`) REFERENCES `pa_pays` (`ID_PAYS`),
  CONSTRAINT `FK_PA_COMMUNE_PA_PROVINCE` FOREIGN KEY (`ID_PROV`) REFERENCES `pa_province` (`ID_PROV`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_COMMUNE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Commune';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_commune`
--

LOCK TABLES `pa_commune` WRITE;
/*!40000 ALTER TABLE `pa_commune` DISABLE KEYS */;
INSERT INTO `pa_commune` VALUES (1,31,233,'BAL001','Bagassi','CR',NULL,NULL),(2,31,233,'BAL002','Bana','CR',NULL,NULL),(3,31,233,'BAL003','Boromo','UR',NULL,NULL),(4,31,233,'BAL004','Fara','CR',NULL,NULL),(5,31,233,'BAL005','Oury','CR',NULL,NULL),(6,31,233,'BAL006','Pâ','CR',NULL,NULL),(7,31,233,'BAL007','Pompoï','CR',NULL,NULL),(8,31,233,'BAL008','Poura','CR',NULL,NULL),(9,31,233,'BAL009','Siby','CR',NULL,NULL),(10,31,233,'BAL010','Yaho','CR',NULL,NULL),(11,32,233,'BAN011','Balavé','CR',NULL,NULL),(12,32,233,'BAN012','Kouka','CR',NULL,NULL),(13,32,233,'BAN013','Sami','CR',NULL,NULL),(14,32,233,'BAN014','Sanaba','CR',NULL,NULL),(15,32,233,'BAN015','Solenzo','UR',NULL,NULL),(16,32,233,'BAN016','Tansila','CR',NULL,NULL),(17,13,233,'KOS017','Barani','CR',NULL,NULL),(18,13,233,'KOS018','Bomborokuy','CR',NULL,NULL),(19,13,233,'KOS019','Bourasso','CR',NULL,NULL),(20,13,233,'KOS020','Djibasso','CR',NULL,NULL),(21,13,233,'KOS021','Dokuy','CR',NULL,NULL),(22,13,233,'KOS022','Doumbala','CR',NULL,NULL),(23,13,233,'KOS023','Kombori','CR',NULL,NULL),(24,13,233,'KOS024','Madouba','CR',NULL,NULL),(25,13,233,'KOS025','Nouna','UR',NULL,NULL),(26,13,233,'KOS026','Sono','CR',NULL,NULL),(27,15,233,'MOU027','Bondokuy','CR',NULL,NULL),(28,15,233,'MOU028','Dédougou','UR',NULL,NULL),(29,15,233,'MOU029','Douroula','CR',NULL,NULL),(30,15,233,'MOU030','Kona','CR',NULL,NULL),(31,15,233,'MOU031','Ouarkoye','CR',NULL,NULL),(32,15,233,'MOU032','Safané','CR',NULL,NULL),(33,15,233,'MOU033','Tchériba','CR',NULL,NULL),(34,40,233,'NAY034','Gassan (ou Gassam)','CR',NULL,NULL),(35,40,233,'NAY035','Gossina','CR',NULL,NULL),(36,40,233,'NAY036','Kougny','CR',NULL,NULL),(37,40,233,'NAY037','Toma','UR',NULL,NULL),(38,40,233,'NAY038','Yaba','CR',NULL,NULL),(39,40,233,'NAY039','Yé','CR',NULL,NULL),(40,27,233,'SOU040','Di','CR',NULL,NULL),(41,27,233,'SOU041','Gomboro','CR',NULL,NULL),(42,27,233,'SOU042','Kassoum','CR',NULL,NULL),(43,27,233,'SOU043','Kiembara','CR',NULL,NULL),(44,27,233,'SOU044','Lanfièra (Lanfiéra)','CR',NULL,NULL),(45,27,233,'SOU045','Lankoué','CR',NULL,NULL),(46,27,233,'SOU046','Toéni','CR',NULL,NULL),(47,27,233,'SOU047','Tougan','UR',NULL,NULL),(48,6,233,'COM048','Banfora','UR',NULL,NULL),(49,6,233,'COM049','Bérégadougou','CR',NULL,NULL),(50,6,233,'COM050','Mangodara','CR',NULL,NULL),(51,6,233,'COM051','Moussodougou','CR',NULL,NULL),(52,6,233,'COM052','Niangoloko','UR',NULL,NULL),(53,6,233,'COM053','Ouo','CR',NULL,NULL),(54,6,233,'COM054','Sidéradougou','CR',NULL,NULL),(55,6,233,'COM055','Soubakaniédougou','CR',NULL,NULL),(56,6,233,'COM056','Tiéfora','CR',NULL,NULL),(57,38,233,'LER057','Dakoro','CR',NULL,NULL),(58,38,233,'LER058','Douna','CR',NULL,NULL),(59,38,233,'LER059','Kankalaba','CR',NULL,NULL),(60,38,233,'LER060','Loumana','CR',NULL,NULL),(61,38,233,'LER061','Niankorodougou','CR',NULL,NULL),(62,38,233,'LER062','Ouéléni','CR',NULL,NULL),(63,38,233,'LER063','Sindou','UR',NULL,NULL),(64,38,233,'LER064','Wolonkoto','CR',NULL,NULL),(65,11,233,'KAD065','Komki-Ipala','CR',NULL,NULL),(66,11,233,'KAD066','Komsilga','CR',NULL,NULL),(67,11,233,'KAD067','Koubri','CR',NULL,NULL),(68,11,233,'KAD068','Ouagadougou (Ouaga)','UR',NULL,NULL),(69,11,233,'KAD069','Pabré','CR',NULL,NULL),(70,11,233,'KAD070','Saaba','CR',NULL,NULL),(71,11,233,'KAD071','Tanghin-Dassouri','CR',NULL,NULL),(72,4,233,'BOU072','Bagré','CR',NULL,NULL),(73,4,233,'BOU073','Bané','CR',NULL,NULL),(74,4,233,'BOU074','Béguédo','CR',NULL,NULL),(75,4,233,'BOU075','Bissiga','CR',NULL,NULL),(76,4,233,'BOU076','Bitou (Bittou)','UR',NULL,NULL),(77,4,233,'BOU077','Boussouma','CR',NULL,NULL),(78,4,233,'BOU078','Garango','UR',NULL,NULL),(79,4,233,'BOU079','Komtoèga','CR',NULL,NULL),(80,4,233,'BOU080','Niaogho (Niaogo)','CR',NULL,NULL),(81,4,233,'BOU081','Tenkodogo','UR',NULL,NULL),(82,4,233,'BOU082','Zabré','CR',NULL,NULL),(83,4,233,'BOU083','Zoaga','CR',NULL,NULL),(84,4,233,'BOU084','Zonsé','CR',NULL,NULL),(85,36,233,'KOU085','Comin-Yanga','CR',NULL,NULL),(86,36,233,'KOU086','Dourtenga','CR',NULL,NULL),(87,36,233,'KOU087','Lalgaye','CR',NULL,NULL),(88,36,233,'KOU088','Ouargaye','UR',NULL,NULL),(89,36,233,'KOU089','Sangha (Sanga)','CR',NULL,NULL),(90,36,233,'KOU090','Soudougui','CR',NULL,NULL),(91,36,233,'KOU091','Yargatenga','CR',NULL,NULL),(92,36,233,'KOU092','Yondé','CR',NULL,NULL),(93,14,233,'KOU093','Andemtenga','CR',NULL,NULL),(94,14,233,'KOU094','Baskouré','CR',NULL,NULL),(95,14,233,'KOU095','Dialgaye','CR',NULL,NULL),(96,14,233,'KOU096','Gounghin','CR',NULL,NULL),(97,14,233,'KOU097','Kando (Cando)','CR',NULL,NULL),(98,14,233,'KOU098','Koupéla','UR',NULL,NULL),(99,14,233,'KOU099','Pouytenga','UR',NULL,NULL),(100,14,233,'KOU100','Tensobentenga (Tansobentenga)','CR',NULL,NULL),(101,14,233,'KOU101','Yargo','CR',NULL,NULL),(102,1,233,'BAM102','Bourzanga','CR',NULL,NULL),(103,1,233,'BAM103','Guibaré','CR',NULL,NULL),(104,1,233,'BAM104','Kongoussi','UR',NULL,NULL),(105,1,233,'BAM105','Nasséré','CR',NULL,NULL),(106,1,233,'BAM106','Rollo','CR',NULL,NULL),(107,1,233,'BAM107','Rouko','CR',NULL,NULL),(108,1,233,'BAM108','Sabcé','CR',NULL,NULL),(109,1,233,'BAM109','Tikaré','CR',NULL,NULL),(110,1,233,'BAM110','Zimtanga','CR',NULL,NULL),(111,17,233,'NAM111','Boala','CR',NULL,NULL),(112,17,233,'NAM112','Boulsa','UR',NULL,NULL),(113,17,233,'NAM113','Bouroum','CR',NULL,NULL),(114,17,233,'NAM114','Dargo','CR',NULL,NULL),(115,17,233,'NAM115','Nagbingou','CR',NULL,NULL),(116,17,233,'NAM116','Tougouri','CR',NULL,NULL),(117,17,233,'NAM117','Yalgo','CR',NULL,NULL),(118,17,233,'NAM118','Zéguédéguin','CR',NULL,NULL),(119,23,233,'SAN119','Barsalogho','CR',NULL,NULL),(120,23,233,'SAN120','Boussouma','CR',NULL,NULL),(121,23,233,'SAN121','Dablo','CR',NULL,NULL),(122,23,233,'SAN122','Kaya','UR',NULL,NULL),(123,23,233,'SAN123','Korsimoro','CR',NULL,NULL),(124,23,233,'SAN124','Mané','CR',NULL,NULL),(125,23,233,'SAN125','Namissiguima','CR',NULL,NULL),(126,23,233,'SAN126','Pensa','CR',NULL,NULL),(127,23,233,'SAN127','Pibaoré','CR',NULL,NULL),(128,23,233,'SAN128','Pissila','CR',NULL,NULL),(129,23,233,'SAN129','Ziga','CR',NULL,NULL),(130,5,233,'BOU130','Bingo','CR',NULL,NULL),(131,5,233,'BOU131','Imasgo','CR',NULL,NULL),(132,5,233,'BOU132','Kindi','CR',NULL,NULL),(133,5,233,'BOU133','Kokologho','CR',NULL,NULL),(134,5,233,'BOU134','Koudougou','UR',NULL,NULL),(135,5,233,'BOU135','Nandiala','CR',NULL,NULL),(136,5,233,'BOU136','Nanoro','CR',NULL,NULL),(137,5,233,'BOU137','Pella','CR',NULL,NULL),(138,5,233,'BOU138','Poa','CR',NULL,NULL),(139,5,233,'BOU139','Ramongo','CR',NULL,NULL),(140,5,233,'BOU140','Sabou','CR',NULL,NULL),(141,5,233,'BOU141','Siglé','CR',NULL,NULL),(142,5,233,'BOU142','Soaw','CR',NULL,NULL),(143,5,233,'BOU143','Sourgou','CR',NULL,NULL),(144,5,233,'BOU144','Thyou','CR',NULL,NULL),(145,22,233,'SAN145','Dassa','CR',NULL,NULL),(146,22,233,'SAN146','Didyr','CR',NULL,NULL),(147,22,233,'SAN147','Godyr','CR',NULL,NULL),(148,22,233,'SAN148','Kordié','CR',NULL,NULL),(149,22,233,'SAN149','Kyon','CR',NULL,NULL),(150,22,233,'SAN150','Pouni','CR',NULL,NULL),(151,22,233,'SAN151','Réo','UR',NULL,NULL),(152,22,233,'SAN152','Ténado','CR',NULL,NULL),(153,22,233,'SAN153','Zamo','CR',NULL,NULL),(154,22,233,'SAN154','Zawara','CR',NULL,NULL),(155,25,233,'SIS155','Biéha','CR',NULL,NULL),(156,25,233,'SIS156','Boura','CR',NULL,NULL),(157,25,233,'SIS157','Léo','UR',NULL,NULL),(158,25,233,'SIS158','Nébiélianayou','CR',NULL,NULL),(159,25,233,'SIS159','Niabouri','CR',NULL,NULL),(160,25,233,'SIS160','Silly','CR',NULL,NULL),(161,25,233,'SIS161','Tô','CR',NULL,NULL),(162,44,233,'ZIR162','Bakata','CR',NULL,NULL),(163,44,233,'ZIR163','Bougnounou','CR',NULL,NULL),(164,44,233,'ZIR164','Cassou','CR',NULL,NULL),(165,44,233,'ZIR165','Dalo','CR',NULL,NULL),(166,44,233,'ZIR166','Gao','CR',NULL,NULL),(167,44,233,'ZIR167','Sapouy','UR',NULL,NULL),(168,2,233,'BAZ168','Doulougou','CR',NULL,NULL),(169,2,233,'BAZ169','Gaongo','CR',NULL,NULL),(170,2,233,'BAZ170','Ipelcé','CR',NULL,NULL),(171,2,233,'BAZ171','Kayao','CR',NULL,NULL),(172,2,233,'BAZ172','Kombissiri','UR',NULL,NULL),(173,2,233,'BAZ173','Saponé','CR',NULL,NULL),(174,2,233,'BAZ174','Toécé','CR',NULL,NULL),(175,16,233,'NAH175','Guiaro','CR',NULL,NULL),(176,16,233,'NAH176','Pô (Po)','UR',NULL,NULL),(177,16,233,'NAH177','Tiébélé (Tiebele)','CR',NULL,NULL),(178,16,233,'NAH178','Zecco','CR',NULL,NULL),(179,16,233,'NAH179','Ziou (Zio)','CR',NULL,NULL),(180,30,233,'ZOU180','Béré (Bere)','CR',NULL,NULL),(181,30,233,'ZOU181','Bindé (Binde)','CR',NULL,NULL),(182,30,233,'ZOU182','Gogo','CR',NULL,NULL),(183,30,233,'ZOU183','Gomboussougou (Gombousougou)','CR',NULL,NULL),(184,30,233,'ZOU184','Guiba','CR',NULL,NULL),(185,30,233,'ZOU185','Manga','UR',NULL,NULL),(186,30,233,'ZOU186','Nobéré','CR',NULL,NULL),(187,8,233,'GNA187','Bilanga','CR',NULL,NULL),(188,8,233,'GNA188','Bogandé','UR',NULL,NULL),(189,8,233,'GNA189','Coalla','CR',NULL,NULL),(190,8,233,'GNA190','Liptougou','CR',NULL,NULL),(191,8,233,'GNA191','Manni (Mani)','CR',NULL,NULL),(192,8,233,'GNA192','Piéla','CR',NULL,NULL),(193,8,233,'GNA193','Thion','CR',NULL,NULL),(194,9,233,'GOU194','Diabo','CR',NULL,NULL),(195,9,233,'GOU195','Diapangou','CR',NULL,NULL),(196,9,233,'GOU196','Fada N’Gourma','UR',NULL,NULL),(197,9,233,'GOU197','Matiacoali','CR',NULL,NULL),(198,9,233,'GOU198','Tibga','CR',NULL,NULL),(199,9,233,'GOU199','Yamba','CR',NULL,NULL),(200,34,233,'KOM200','Bartiébougou (Batiébougou)','CR',NULL,NULL),(201,34,233,'KOM201','Foutouri','CR',NULL,NULL),(202,34,233,'KOM202','Gayéri','UR',NULL,NULL),(203,35,233,'KOM203','Kompienga','CR',NULL,NULL),(204,35,233,'KOM204','Madjoari','CR',NULL,NULL),(205,35,233,'KOM205','Pama','UR',NULL,NULL),(206,28,233,'TAP206','Botou','CR',NULL,NULL),(207,28,233,'TAP207','Diapaga','UR',NULL,NULL),(208,28,233,'TAP208','Kantchari','CR',NULL,NULL),(209,28,233,'TAP209','Logobou','CR',NULL,NULL),(210,28,233,'TAP210','Namounou','CR',NULL,NULL),(211,28,233,'TAP211','Partiaga','CR',NULL,NULL),(212,28,233,'TAP212','Tambaga','CR',NULL,NULL),(213,28,233,'TAP213','Tansarga','CR',NULL,NULL),(214,10,233,'HOU214','Bama','CR',NULL,NULL),(215,10,233,'HOU215','Bobo-Dioulasso','UR',NULL,NULL),(216,10,233,'HOU216','Dandé','CR',NULL,NULL),(217,10,233,'HOU217','Faramana','CR',NULL,NULL),(218,10,233,'HOU218','Fô','CR',NULL,NULL),(219,10,233,'HOU219','Karangasso-Sambla','CR',NULL,NULL),(220,10,233,'HOU220','Karangasso-Vigué','CR',NULL,NULL),(221,10,233,'HOU221','Koundougou','CR',NULL,NULL),(222,10,233,'HOU222','Léna','CR',NULL,NULL),(223,10,233,'HOU223','Padéma','CR',NULL,NULL),(224,10,233,'HOU224','Péni','CR',NULL,NULL),(225,10,233,'HOU225','Satiri','CR',NULL,NULL),(226,10,233,'HOU226','Toussiana','CR',NULL,NULL),(227,12,233,'KEN227','Banzon','CR',NULL,NULL),(228,12,233,'KEN228','Djigouéra','CR',NULL,NULL),(229,12,233,'KEN229','Kangala','CR',NULL,NULL),(230,12,233,'KEN230','Kayan','CR',NULL,NULL),(231,12,233,'KEN231','Koloko','CR',NULL,NULL),(232,12,233,'KEN232','Kourignon (Kourinion)','CR',NULL,NULL),(233,12,233,'KEN233','Kourouma','CR',NULL,NULL),(234,12,233,'KEN234','Morolaba','CR',NULL,NULL),(235,12,233,'KEN235','N\'Dorola','CR',NULL,NULL),(236,12,233,'KEN236','Orodara','UR',NULL,NULL),(237,12,233,'KEN237','Samogohiri (Samoghohiri)','CR',NULL,NULL),(238,12,233,'KEN238','Samorogouan','CR',NULL,NULL),(239,12,233,'KEN239','Sindo','CR',NULL,NULL),(240,42,233,'TUY240','Békuy','CR',NULL,NULL),(241,42,233,'TUY241','Béréba','CR',NULL,NULL),(242,42,233,'TUY242','Boni','CR',NULL,NULL),(243,42,233,'TUY243','Founzan','CR',NULL,NULL),(244,42,233,'TUY244','Houndé','UR',NULL,NULL),(245,42,233,'TUY245','Koti','CR',NULL,NULL),(246,42,233,'TUY246','Koumbia','CR',NULL,NULL),(247,39,233,'LOR247','Banh','CR',NULL,NULL),(248,39,233,'LOR248','Ouindigui','CR',NULL,NULL),(249,39,233,'LOR249','Sollé','CR',NULL,NULL),(250,39,233,'LOR250','Titao','UR',NULL,NULL),(251,20,233,'PAS251','Arbollé','CR',NULL,NULL),(252,20,233,'PAS252','Bagaré','CR',NULL,NULL),(253,20,233,'PAS253','Bokin','CR',NULL,NULL),(254,20,233,'PAS254','Gomponsom','CR',NULL,NULL),(255,20,233,'PAS255','Kirsi','CR',NULL,NULL),(256,20,233,'PAS256','Lâ-Todin','CR',NULL,NULL),(257,20,233,'PAS257','Pilimpikou','CR',NULL,NULL),(258,20,233,'PAS258','Samba','CR',NULL,NULL),(259,20,233,'PAS259','Yako','UR',NULL,NULL),(260,29,233,'YAT260','Barga','CR',NULL,NULL),(261,29,233,'YAT261','Kaïn (Kain)','CR',NULL,NULL),(262,29,233,'YAT262','Kalsaga (Kalsaka)','CR',NULL,NULL),(263,29,233,'YAT263','Kossouka','CR',NULL,NULL),(264,29,233,'YAT264','Koumbri','CR',NULL,NULL),(265,29,233,'YAT265','Namissiguima','CR',NULL,NULL),(266,29,233,'YAT266','Ouahigouya','UR',NULL,NULL),(267,29,233,'YAT267','Oula','CR',NULL,NULL),(268,29,233,'YAT268','Rambo','CR',NULL,NULL),(269,29,233,'YAT269','Séguénéga','CR',NULL,NULL),(270,29,233,'YAT270','Tangaye','CR',NULL,NULL),(271,29,233,'YAT271','Thiou','CR',NULL,NULL),(272,29,233,'YAT272','Zogoré','CR',NULL,NULL),(273,45,233,'ZON273','Bassi','CR',NULL,NULL),(274,45,233,'ZON274','Boussou','CR',NULL,NULL),(275,45,233,'ZON275','Gourcy','UR',NULL,NULL),(276,45,233,'ZON276','Léba','CR',NULL,NULL),(277,45,233,'ZON277','Tougo','CR',NULL,NULL),(278,7,233,'GAN278','Boudry','CR',NULL,NULL),(279,7,233,'GAN279','Kogho (Kogo)','CR',NULL,NULL),(280,7,233,'GAN280','Méguet','CR',NULL,NULL),(281,7,233,'GAN281','Mogtédo','CR',NULL,NULL),(282,7,233,'GAN282','Salogo','CR',NULL,NULL),(283,7,233,'GAN283','Zam','CR',NULL,NULL),(284,7,233,'GAN284','Zorgho','UR',NULL,NULL),(285,7,233,'GAN285','Zoungou','CR',NULL,NULL),(286,37,233,'KOU286','Boussé','UR',NULL,NULL),(287,37,233,'KOU287','Laye','CR',NULL,NULL),(288,37,233,'KOU288','Niou','CR',NULL,NULL),(289,37,233,'KOU289','Sourgoubila','CR',NULL,NULL),(290,37,233,'KOU290','Toéghin','CR',NULL,NULL),(291,18,233,'OUB291','Absouya','CR',NULL,NULL),(292,18,233,'OUB292','Dapélogo','CR',NULL,NULL),(293,18,233,'OUB293','Loumbila','CR',NULL,NULL),(294,18,233,'OUB294','Nagréongo','CR',NULL,NULL),(295,18,233,'OUB295','Ourgou-Manèga','CR',NULL,NULL),(296,18,233,'OUB296','Ziniaré','UR',NULL,NULL),(297,18,233,'OUB297','Zitenga','CR',NULL,NULL),(298,19,233,'OUD298','Déou','CR',NULL,NULL),(299,19,233,'OUD299','Gorom-Gorom (Gorom Gorom)','UR',NULL,NULL),(300,19,233,'OUD300','Markoye','CR',NULL,NULL),(301,19,233,'OUD301','Oursi','CR',NULL,NULL),(302,19,233,'OUD302','Tin-Akoff (Tin-Akof)','CR',NULL,NULL),(303,24,233,'SEN303','Bani','CR',NULL,NULL),(304,24,233,'SEN304','Dori','UR',NULL,NULL),(305,24,233,'SEN305','Falangountou (Falagountou)','CR',NULL,NULL),(306,24,233,'SEN306','Gorgadji','CR',NULL,NULL),(307,24,233,'SEN307','Sampelga','CR',NULL,NULL),(308,24,233,'SEN308','Seytenga','CR',NULL,NULL),(309,26,233,'SOU309','Arbinda (Aribinda)','CR',NULL,NULL),(310,26,233,'SOU310','Baraboulé','CR',NULL,NULL),(311,26,233,'SOU311','Djibo','UR',NULL,NULL),(312,26,233,'SOU312','Djiguel (Diguel)','CR',NULL,NULL),(313,26,233,'SOU313','Kelbo','CR',NULL,NULL),(314,26,233,'SOU314','Koutougou','CR',NULL,NULL),(315,26,233,'SOU315','Nassoumbou','CR',NULL,NULL),(316,26,233,'SOU316','Pobé-Mengao','CR',NULL,NULL),(317,26,233,'SOU317','Tongomayel','CR',NULL,NULL),(318,43,233,'YAG318','Boundoré','CR',NULL,NULL),(319,43,233,'YAG319','Mansila','CR',NULL,NULL),(320,43,233,'YAG320','Sébba (Sebba)','UR',NULL,NULL),(321,43,233,'YAG321','Solhan (Solan)','CR',NULL,NULL),(322,43,233,'YAG322','Tankougounadié','CR',NULL,NULL),(323,43,233,'YAG323','Titabé','CR',NULL,NULL),(324,3,233,'BOU324','Bondigui','CR',NULL,NULL),(325,3,233,'BOU325','Diébougou','UR',NULL,NULL),(326,3,233,'BOU326','Dolo','CR',NULL,NULL),(327,3,233,'BOU327','Iolonioro (Nioronioro)','CR',NULL,NULL),(328,3,233,'BOU328','Tiankoura','CR',NULL,NULL),(329,33,233,'IOB329','Dano','UR',NULL,NULL),(330,33,233,'IOB330','Dissin','CR',NULL,NULL),(331,33,233,'IOB331','Guéguéré','CR',NULL,NULL),(332,33,233,'IOB332','Koper','CR',NULL,NULL),(333,33,233,'IOB333','Niégo (Niego)','CR',NULL,NULL),(334,33,233,'IOB334','Oronkua','CR',NULL,NULL),(335,33,233,'IOB335','Ouessa','CR',NULL,NULL),(336,33,233,'IOB336','Zambo','CR',NULL,NULL),(337,41,233,'NOU337','Batié','UR',NULL,NULL),(338,41,233,'NOU338','Boussoukoula','CR',NULL,NULL),(339,41,233,'NOU339','Kpuéré (Kpueré)','CR',NULL,NULL),(340,41,233,'NOU340','Legmoin','CR',NULL,NULL),(341,41,233,'NOU341','Midébdo (Midebdo)','CR',NULL,NULL),(342,21,233,'PON342','Bouroum-Bouroum','CR',NULL,NULL),(343,21,233,'PON343','Bousséra','CR',NULL,NULL),(344,21,233,'PON344','Djigoué','CR',NULL,NULL),(345,21,233,'PON345','Gaoua','UR',NULL,NULL),(346,21,233,'PON346','Gbomblora','CR',NULL,NULL),(347,21,233,'PON347','Kampti','CR',NULL,NULL),(348,21,233,'PON348','Loropéni','CR',NULL,NULL),(349,21,233,'PON349','Malba','CR',NULL,NULL),(350,21,233,'PON350','Nako','CR',NULL,NULL),(351,21,233,'PON351','Périgban','CR',NULL,NULL),(352,11,233,'KAD352','Arrondissement 1 Ouaga','CR',NULL,NULL),(353,11,233,'KAD353','Arrondissement 2 Ouaga','CR',NULL,NULL),(354,11,233,'KAD354','Arrondissement 3 Ouaga','CR',NULL,NULL),(355,11,233,'KAD355','Arrondissement 4 Ouaga','CR',NULL,NULL),(356,11,233,'KAD356','Arrondissement 5 Ouaga','CR',NULL,NULL),(357,11,233,'KAD357','Arrondissement 6 Ouaga','CR',NULL,NULL),(358,11,233,'KAD358','Arrondissement 7 Ouaga','CR',NULL,NULL),(359,11,233,'KAD359','Arrondissement 8 Ouaga','CR',NULL,NULL),(360,11,233,'KAD360','Arrondissement 9 Ouaga','CR',NULL,NULL),(361,11,233,'KAD361','Arrondissement 10 Ouaga','CR',NULL,NULL),(362,11,233,'KAD362','Arrondissement 11 Ouaga','CR',NULL,NULL),(363,11,233,'KAD363','Arrondissement 12 Ouaga','CR',NULL,NULL),(364,10,233,'HOU364','Arrondissement 1 Bobo','CR',NULL,NULL),(365,10,233,'HOU365','Arrondissement 2 Bobo','CR',NULL,NULL),(366,10,233,'HOU366','Arrondissement 3 Bobo','CR',NULL,NULL),(367,10,233,'HOU367','Arrondissement 4 Bobo','CR',NULL,NULL),(368,10,233,'HOU368','Arrondissement 5 Bobo','CR',NULL,NULL),(369,10,233,'HOU369','Arrondissement 6 Bobo','CR',NULL,NULL),(370,10,233,'HOU370','Arrondissement 7 Bobo','CR',NULL,NULL),(371,10,233,'HOU371','Soumousso','CR',NULL,NULL),(372,6,233,'COM372','Yenderé','CR',NULL,NULL),(373,32,233,'BAN373','Kira','CR',NULL,NULL);
/*!40000 ALTER TABLE `pa_commune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_etablissement`
--

DROP TABLE IF EXISTS `pa_etablissement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_etablissement` (
  `ID_ETAB` int NOT NULL AUTO_INCREMENT,
  `ID_PROV` int NOT NULL,
  `ID_COM` int NOT NULL,
  `ID_REG` int NOT NULL,
  `ID_CIR` int DEFAULT NULL,
  `ID_PA_TYP_ETAB` int NOT NULL,
  `COD_ADMIN_ETAB` varchar(64) NOT NULL,
  `LIB_CRT_ETAB` varchar(64) NOT NULL,
  `LIB_LNG_ETAB` varchar(128) DEFAULT NULL,
  `TEL_FIXE_ETAB` varchar(24) DEFAULT NULL,
  `TEL_MOBIL_ETAB` varchar(24) DEFAULT NULL,
  `ADR_POSTAL_ETAB` varchar(64) DEFAULT NULL,
  `code_theme` varchar(45) NOT NULL,
  `code_lang` char(2) NOT NULL DEFAULT 'FR',
  `ADR_ETAB` varchar(128) NOT NULL,
  `LN_IMG_ETAB` varchar(128) NOT NULL,
  `LN_DEVISE_ETAB` varchar(128) DEFAULT NULL,
  `LN_SIGN_ETAB` varchar(128) DEFAULT NULL,
  `FL_CONTINIUM` char(1) NOT NULL DEFAULT 'O',
  `MOY_MIN_CONTINIUM` decimal(4,2) DEFAULT '7.00',
  `REF_ACT_ETAB` varchar(30) DEFAULT NULL,
  `EMAIL_ETAB` varchar(30) DEFAULT NULL,
  `Site_web_ETAB` varchar(30) DEFAULT NULL,
  `Arrondissement_ETAB` varchar(30) DEFAULT NULL,
  `Secteur_ETAB` varchar(20) DEFAULT NULL,
  `Fl_public` char(1) DEFAULT 'N',
  `FL_AUTR_SIGNATAIRE` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag signature alternative (O/N)',
  `DAT_LIVRAISON` date NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ETAB`),
  UNIQUE KEY `I_PU_PA_ETAB` (`COD_ADMIN_ETAB`),
  KEY `I_FK_PA_ETABLISSEMENT_PA_PROVINCE` (`ID_PROV`),
  KEY `I_FK_PA_ETABLISSEMENT_PA_COMMUNE` (`ID_COM`),
  KEY `I_FK_PA_ETABLISSEMENT_PA_REGION` (`ID_REG`),
  KEY `I_FK_PA_ETABLISSEMENT_PA_PARAM_GLOB` (`ID_PA_TYP_ETAB`),
  KEY `FK_PA_ETABLISSEMENT_PA_CIRCONSCRIPTION` (`ID_CIR`),
  KEY `FK_SE_USERNAME_CREA_PA_ETABLISSEMENT` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_ETABLISSEMENT_PA_CIRCONSCRIPTION` FOREIGN KEY (`ID_CIR`) REFERENCES `pa_circonscription` (`ID_CIR`),
  CONSTRAINT `FK_PA_ETABLISSEMENT_PA_COMMUNE` FOREIGN KEY (`ID_COM`) REFERENCES `pa_commune` (`ID_COM`),
  CONSTRAINT `FK_PA_ETABLISSEMENT_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYP_ETAB`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PA_ETABLISSEMENT_PA_PROVINCE` FOREIGN KEY (`ID_PROV`) REFERENCES `pa_province` (`ID_PROV`),
  CONSTRAINT `FK_PA_ETABLISSEMENT_PA_REGION` FOREIGN KEY (`ID_REG`) REFERENCES `pa_region` (`ID_REG`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_ETABLISSEMENT` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pa_etablissement_chk_1` CHECK ((`FL_CONTINIUM` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `pa_etablissement_chk_2` CHECK ((`Fl_public` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Etablissement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_etablissement`
--

LOCK TABLES `pa_etablissement` WRITE;
/*!40000 ALTER TABLE `pa_etablissement` DISABLE KEYS */;
INSERT INTO `pa_etablissement` VALUES (1,10,215,1,NULL,55,'ETABDIDPEGETAB','Lycée','Lycée','72934141','64390239','01 BP BOBO 2020','ThemeApplicationBlue','FR','Bobo Dioulasso secteur 10','Capture d\'écran 2026-07-22 111633.png',NULL,NULL,'O',7.00,'','','','','','N','N','2026-01-01',NULL,NULL);
/*!40000 ALTER TABLE `pa_etablissement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_horaire_semaine`
--

DROP TABLE IF EXISTS `pa_horaire_semaine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_horaire_semaine` (
  `ID_HORAIRE_HBDO` int NOT NULL AUTO_INCREMENT,
  `ID_PA_HORAIR_DISPO` int NOT NULL,
  `ID_PA_JOUR_DISPO` int NOT NULL,
  `FL_OUV_JOUR_HORAIR_HBDO` char(1) NOT NULL DEFAULT 'O',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_HORAIRE_HBDO`),
  UNIQUE KEY `I_PU_PA_HORAIRE_SEMAINE` (`ID_PA_JOUR_DISPO`,`ID_PA_HORAIR_DISPO`),
  KEY `I_FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB` (`ID_PA_HORAIR_DISPO`),
  KEY `I_FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB2` (`ID_PA_JOUR_DISPO`),
  KEY `FK_SE_USERNAME_CREA_PA_HORAIRE_SEMAINE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_HORAIR_DISPO`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_JOUR_DISPO`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_HORAIRE_SEMAINE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pa_horaire_semaine_chk_1` CHECK ((`FL_OUV_JOUR_HORAIR_HBDO` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Horaire Semaine';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_horaire_semaine`
--

LOCK TABLES `pa_horaire_semaine` WRITE;
/*!40000 ALTER TABLE `pa_horaire_semaine` DISABLE KEYS */;
INSERT INTO `pa_horaire_semaine` VALUES (1,56,119,'O',NULL,NULL),(2,56,118,'O',NULL,NULL),(3,56,117,'O',NULL,NULL),(4,56,116,'O',NULL,NULL),(5,56,115,'O',NULL,NULL),(6,56,114,'O',NULL,NULL),(7,57,119,'O',NULL,NULL),(8,57,118,'O',NULL,NULL),(9,57,117,'O',NULL,NULL),(10,57,116,'O',NULL,NULL),(11,57,115,'O',NULL,NULL),(12,57,114,'O',NULL,NULL),(13,58,119,'O',NULL,NULL),(14,58,118,'O',NULL,NULL),(15,58,117,'O',NULL,NULL),(16,58,116,'O',NULL,NULL),(17,58,115,'O',NULL,NULL),(18,58,114,'O',NULL,NULL),(19,59,119,'O',NULL,NULL),(20,59,118,'O',NULL,NULL),(21,59,117,'O',NULL,NULL),(22,59,116,'O',NULL,NULL),(23,59,115,'O',NULL,NULL),(24,59,114,'O',NULL,NULL),(25,60,119,'O',NULL,NULL),(26,60,118,'O',NULL,NULL),(27,60,117,'O',NULL,NULL),(28,60,116,'O',NULL,NULL),(29,60,115,'O',NULL,NULL),(30,60,114,'O',NULL,NULL),(31,61,119,'N',NULL,NULL),(32,61,118,'N',NULL,NULL),(33,61,117,'N',NULL,NULL),(34,61,116,'N',NULL,NULL),(35,61,115,'N',NULL,NULL),(36,61,114,'N',NULL,NULL),(37,62,119,'N',NULL,NULL),(38,62,118,'N',NULL,NULL),(39,62,117,'N',NULL,NULL),(40,62,116,'N',NULL,NULL),(41,62,115,'N',NULL,NULL),(42,62,114,'N',NULL,NULL),(43,63,119,'N',NULL,NULL),(44,63,118,'N',NULL,NULL),(45,63,117,'N',NULL,NULL),(46,63,116,'N',NULL,NULL),(47,63,115,'N',NULL,NULL),(48,63,114,'N',NULL,NULL),(49,64,119,'N',NULL,NULL),(50,64,118,'O',NULL,NULL),(51,64,117,'N',NULL,NULL),(52,64,116,'O',NULL,NULL),(53,64,115,'O',NULL,NULL),(54,64,114,'O',NULL,NULL),(55,65,119,'N',NULL,NULL),(56,65,118,'O',NULL,NULL),(57,65,117,'N',NULL,NULL),(58,65,116,'O',NULL,NULL),(59,65,115,'O',NULL,NULL),(60,65,114,'O',NULL,NULL),(61,66,119,'N',NULL,NULL),(62,66,118,'O',NULL,NULL),(63,66,117,'N',NULL,NULL),(64,66,116,'O',NULL,NULL),(65,66,115,'O',NULL,NULL),(66,66,114,'O',NULL,NULL),(67,67,119,'N',NULL,NULL),(68,67,118,'O',NULL,NULL),(69,67,117,'N',NULL,NULL),(70,67,116,'O',NULL,NULL),(71,67,115,'O',NULL,NULL),(72,67,114,'O',NULL,NULL),(73,113,119,'O',NULL,NULL),(74,113,118,'O',NULL,NULL),(75,113,117,'O',NULL,NULL),(76,113,116,'O',NULL,NULL),(77,113,115,'O',NULL,NULL),(78,113,114,'O',NULL,NULL);
/*!40000 ALTER TABLE `pa_horaire_semaine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_list_etabl`
--

DROP TABLE IF EXISTS `pa_list_etabl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_list_etabl` (
  `ID_ETAB` int NOT NULL AUTO_INCREMENT,
  `ID_CIR` int DEFAULT NULL,
  `CODE_ETAB` varchar(30) NOT NULL,
  `NOM_ETAB` varchar(30) NOT NULL,
  `ADRESS_ETAB` varchar(60) NOT NULL,
  `NUM_TEL_ETAB` varchar(25) DEFAULT NULL,
  `EMAIL_ETAB` varchar(70) DEFAULT NULL,
  `ID_PA_TYP_ETAB` int NOT NULL,
  `ID_PROV` int NOT NULL,
  `ID_REG` int NOT NULL,
  `ID_COM` int NOT NULL,
  `FL_PUBLIC` char(1) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ETAB`),
  UNIQUE KEY `I_PU_PA_LIST_ETABL` (`CODE_ETAB`),
  KEY `I_FK_PA_LIST_ETABL_PA_PARAM_GLOB` (`ID_PA_TYP_ETAB`),
  KEY `I_FK_PA_LIST_ETABL_PA_PROVINCE` (`ID_PROV`),
  KEY `I_FK_PA_LIST_ETABL_PA_COMMUNE` (`ID_COM`),
  KEY `I_FK_PA_LIST_ETABL_PA_REGION` (`ID_REG`),
  KEY `FK_SE_USERNAME_CREA_PA_LIST_ETABL` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPDATE_PA_LIST_ETABL` (`USERNAME_UPD`),
  KEY `FK_PA_LIST_ETABL_PA_CIRCONSCRIPTION` (`ID_CIR`),
  CONSTRAINT `FK_PA_LIST_ETABL_PA_CIRCONSCRIPTION` FOREIGN KEY (`ID_CIR`) REFERENCES `pa_circonscription` (`ID_CIR`),
  CONSTRAINT `FK_PA_LIST_ETABL_PA_COMMUNE` FOREIGN KEY (`ID_COM`) REFERENCES `pa_commune` (`ID_COM`),
  CONSTRAINT `FK_PA_LIST_ETABL_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYP_ETAB`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PA_LIST_ETABL_PA_PROVINCE` FOREIGN KEY (`ID_PROV`) REFERENCES `pa_province` (`ID_PROV`),
  CONSTRAINT `FK_PA_LIST_ETABL_PA_REGION` FOREIGN KEY (`ID_REG`) REFERENCES `pa_region` (`ID_REG`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_LIST_ETABL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPDATE_PA_LIST_ETABL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pa_list_etabl_chk_1` CHECK ((`FL_PUBLIC` in (_utf8mb4'N',_utf8mb4'O')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_list_etabl`
--

LOCK TABLES `pa_list_etabl` WRITE;
/*!40000 ALTER TABLE `pa_list_etabl` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_list_etabl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_matiere`
--

DROP TABLE IF EXISTS `pa_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_matiere` (
  `ID_MATIERE` int NOT NULL AUTO_INCREMENT,
  `COD_MATIERE` char(5) DEFAULT NULL,
  `LIB_CRT_MATIER` varchar(64) NOT NULL,
  `LIB_LNG_MATIRE` varchar(128) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_MATIERE`),
  UNIQUE KEY `I_PU_PA_MATIER` (`COD_MATIERE`),
  KEY `FK_SE_USERNAME_CREA_PA_MATIERE` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_MATIERE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Matiere';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_matiere`
--

LOCK TABLES `pa_matiere` WRITE;
/*!40000 ALTER TABLE `pa_matiere` DISABLE KEYS */;
INSERT INTO `pa_matiere` VALUES (1,'MA001','Math','Mathematique',NULL,NULL),(2,'FR002','Fr','Francais',NULL,NULL),(3,'PC003','P.C','Physique-Chimie',NULL,NULL),(4,'HG004','H.G','Histoire-Géographie',NULL,NULL),(5,'SVT05',' S.V.T','Science de vie et de la terre',NULL,NULL),(6,'ANG06','Ang','Anglais',NULL,NULL),(7,'ALL07','All','Allemand',NULL,NULL),(8,'EPS08',' E.P.S','Education Physique et Sportive',NULL,NULL),(9,'PHI09','Philosophie','Philosophie',NULL,NULL);
/*!40000 ALTER TABLE `pa_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_niv_etude`
--

DROP TABLE IF EXISTS `pa_niv_etude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_niv_etude` (
  `ID_NIV_ETU` int NOT NULL AUTO_INCREMENT,
  `COD_NIV_ETU` varchar(10) DEFAULT NULL,
  `ID_PA_CYCLE_NIV` int DEFAULT NULL,
  `ID_PA_NIV` int DEFAULT NULL,
  `ID_PA_SERI` int DEFAULT NULL,
  `ID_ORDER_NIV` int NOT NULL DEFAULT '1',
  `ID_PA_REGLE_RETRAIT_POIN` int DEFAULT NULL,
  `VA_RETRAIT_POINT_HORAIRE` decimal(5,3) DEFAULT NULL,
  `LIB_CRT_NIV_ETU` varchar(32) NOT NULL,
  `LIB_LNG_NIV_ETU` varchar(128) NOT NULL,
  `FLAG_ACTF_NIV` char(1) DEFAULT NULL,
  `FL_EXAM` char(1) NOT NULL DEFAULT 'N',
  `VAL_BAREM_EVAL` int NOT NULL DEFAULT '20',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_NIV_ETU`),
  UNIQUE KEY `I_PU_PA_NIV_ETUDE` (`COD_NIV_ETU`),
  KEY `FK_PA_NIV_ETUDE_PA_PARAM_CYCLE` (`ID_PA_CYCLE_NIV`),
  KEY `FK_PA_NIV_ETUDE_PA_PARAM_VIVEAU` (`ID_PA_NIV`),
  KEY `FK_PA_NIV_ETUDE_PA_PARAM_VIVEAU_SERI` (`ID_PA_SERI`),
  KEY `FK_PA_NIV_ETUDE_PA_PARAM_GLOB` (`ID_PA_REGLE_RETRAIT_POIN`),
  KEY `FK_SE_USERNAME_CREA_PA_NIV_ETUDE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_NIV_ETUDE_PA_PARAM_CYCLE` FOREIGN KEY (`ID_PA_CYCLE_NIV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PA_NIV_ETUDE_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_REGLE_RETRAIT_POIN`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PA_NIV_ETUDE_PA_PARAM_VIVEAU` FOREIGN KEY (`ID_PA_NIV`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PA_NIV_ETUDE_PA_PARAM_VIVEAU_SERI` FOREIGN KEY (`ID_PA_SERI`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_NIV_ETUDE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pa_niv_etude_chk_1` CHECK ((`FLAG_ACTF_NIV` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `pa_niv_etude_chk_2` CHECK ((`FL_EXAM` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Niveau Etude';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_niv_etude`
--

LOCK TABLES `pa_niv_etude` WRITE;
/*!40000 ALTER TABLE `pa_niv_etude` DISABLE KEYS */;
INSERT INTO `pa_niv_etude` VALUES (1,'60000',1073,1075,NULL,1,NULL,NULL,'6ème','Sixième',NULL,'N',20,NULL,NULL),(2,'50000',1073,1076,NULL,1,NULL,NULL,'5ème','Cinquième',NULL,'N',20,NULL,NULL),(3,'40000',1073,1077,NULL,1,NULL,NULL,'4ème','Quatrième',NULL,'N',20,NULL,NULL),(4,'30000',1073,1078,NULL,1,NULL,NULL,'3ème','Troixième',NULL,'O',20,NULL,NULL),(5,'200A3',1074,1079,NULL,1,NULL,NULL,'2nd A3','Seconde A3',NULL,'N',20,NULL,NULL),(6,'200A4',1074,1079,NULL,1,NULL,NULL,'2nd A4','Seconde A4',NULL,'N',20,NULL,NULL),(7,'200C0',1074,1079,NULL,1,NULL,NULL,'2nd C','Seconde C',NULL,'N',20,NULL,NULL),(8,'100A3',1074,1080,NULL,1,NULL,NULL,'1ere A3','Première A3',NULL,'N',20,NULL,NULL),(9,'100A4',1074,1080,NULL,1,NULL,NULL,'1ere A4','Première A4',NULL,'N',20,NULL,NULL),(10,'100D0',1074,1080,NULL,1,NULL,NULL,'1ere D','Première D',NULL,'N',20,NULL,NULL),(11,'T00A3',1074,1081,NULL,1,NULL,NULL,'Tle A3','Terminale A3',NULL,'O',20,NULL,NULL),(12,'T00A4',1074,1081,NULL,1,NULL,NULL,'Tle A4','Terminale A4',NULL,'O',20,NULL,NULL),(13,'T00D0',1074,1081,NULL,1,NULL,NULL,'Tle D','Terminale D',NULL,'O',20,NULL,NULL);
/*!40000 ALTER TABLE `pa_niv_etude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_option_niv_etud`
--

DROP TABLE IF EXISTS `pa_option_niv_etud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_option_niv_etud` (
  `ID_PA_OPTION` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `LIB_OPTION` varchar(64) NOT NULL,
  `DESC_OPTION` varchar(1024) NOT NULL,
  `FL_ACTIF` char(1) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_OPTION`,`ID_NIV_ETU`),
  KEY `FK_PA_OPTION_NIV_ETUD_PA_NIV_ETUDEADD` (`ID_NIV_ETU`),
  CONSTRAINT `FK_PA_OPTION_NIV_ETUD_PA_NIV_ETUDEADD` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_PA_OPTION_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_OPTION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Option niveau';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_option_niv_etud`
--

LOCK TABLES `pa_option_niv_etud` WRITE;
/*!40000 ALTER TABLE `pa_option_niv_etud` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_option_niv_etud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_param_glob`
--

DROP TABLE IF EXISTS `pa_param_glob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_param_glob` (
  `ID_PARAM_GLOB` int NOT NULL AUTO_INCREMENT,
  `COD_TYP_PARAM` varchar(2) NOT NULL,
  `COD_PARAM_GLOB` char(6) DEFAULT NULL,
  `LIB_CRT_PARAM_GLOB` varchar(64) NOT NULL,
  `LIB_LNG_PARAM_GLOB` varchar(128) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PARAM_GLOB`),
  UNIQUE KEY `I_PU_PA_PARAM_GLOB` (`COD_PARAM_GLOB`),
  KEY `FK_SE_USERNAME_CREA_PA_PARAM_GLOB` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_PARAM_GLOB` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Parametre Global';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_param_glob`
--

LOCK TABLES `pa_param_glob` WRITE;
/*!40000 ALTER TABLE `pa_param_glob` DISABLE KEYS */;
INSERT INTO `pa_param_glob` VALUES (1,'01','1001','Anciens','Anciens élèves',NULL,NULL),(2,'01','1002','RCE','Elève en complement d\'effectif',NULL,NULL),(3,'01','1003','Affecté','Elèves admis officiles',NULL,NULL),(4,'03','3001','GR','Grossesse',NULL,NULL),(5,'03','3002','PD','Parent démuni',NULL,NULL),(6,'03','3003','PM','Parent Malade',NULL,NULL),(7,'03','3004','PH','Parent Handicapé',NULL,NULL),(8,'03','3005','VME','Victime de Mariage d’enfant',NULL,NULL),(9,'03','3006','OP','Orphelin de Père',NULL,NULL),(10,'03','3007','OM','Orphelin de Mère',NULL,NULL),(11,'03','3008','OT','Orphelin Total',NULL,NULL),(12,'03','3009','FM','Fille Mère',NULL,NULL),(13,'05','5001','Travaux d\'intérêt général','Travaux d\'intérêt général',NULL,NULL),(14,'05','5002','Rapport d\'explication','Rapport d\'explication',NULL,NULL),(15,'05','5003','Retenu de point','Retenu de point',NULL,NULL),(16,'05','5004','Exclusion temporaire du cours 24h','Exclusion temporaire du cours 24h',NULL,NULL),(17,'05','5005','Eclusion temporaire des cours de 48h','Eclusion temporaire des cours de 48h',NULL,NULL),(18,'05','5006','Eclusion temporaire des cours de 3jours','Eclusion temporaire des cours de 3jours',NULL,NULL),(19,'05','5007','Eclusion temporaire des cours de 15 jous ','Eclusion temporaire des cours de 15 jous ',NULL,NULL),(20,'05','5008','Eclusion temporaire des cours de Exclusion définitive.','Eclusion temporaire des cours de Exclusion définitive.',NULL,NULL),(21,'07','7001','Marié','Marié',NULL,NULL),(22,'07','7002','Célibataire','Célibataire',NULL,NULL),(23,'07','7003','veuf','veuf',NULL,NULL),(24,'08','8001','Stagiaire','Stagiaire',NULL,NULL),(25,'08','8002','Contractuel','Contractuel',NULL,NULL),(26,'08','8003','Vacataire','Vacataire',NULL,NULL),(27,'10','10001','Master','Master',NULL,NULL),(28,'10','10002','licence','licence',NULL,NULL),(29,'10','10003','BTS','Brevet technicien Supérieur',NULL,NULL),(30,'02','2001','Musulman','Musulman',NULL,NULL),(31,'02','2002','Chrétien','Chrétien',NULL,NULL),(32,'02','2003','Tradition','Tradition',NULL,NULL),(33,'02','2004','Autre','Autre',NULL,NULL),(34,'09','90001','Conseillé d\'education','Conseillé d\'education',NULL,NULL),(35,'09','90002','Intendant','Intendant',NULL,NULL),(36,'09','90003','Censeur','Censeur',NULL,NULL),(37,'09','90004','Proviseur','Proviseur',NULL,NULL),(38,'09','90005','Gardien','Gardien',NULL,NULL),(39,'09','90006','Chef d\'atelier','Chef d\'atelier',NULL,NULL),(40,'09','90007','Cultivateur','Cultivateur',NULL,NULL),(41,'09','90008','Commerçant','Commerçant',NULL,NULL),(42,'09','90009','Infirmier','Infirmier',NULL,NULL),(43,'09','90010','Professeur Universite','Professeur Universite',NULL,NULL),(44,'09','90011','Menagère','Menagère',NULL,NULL),(45,'09','90012','Mecanicien','Mecanicien',NULL,NULL),(46,'11','11001','Justifié','Justifié',NULL,NULL),(47,'11','11002','Non Justifié','Non Justifié',NULL,NULL),(48,'15','15001','Collège','Collège',NULL,NULL),(49,'15','15002','Lycée Technique','Lycée Technique',NULL,NULL),(50,'12','12001','Malade','Malade',NULL,NULL),(51,'12','12002','Conge Maternite','Conge Maternite',NULL,NULL),(52,'12','12003','Exclu','Exclu',NULL,NULL),(53,'12','12004','Enfant Malade','Enfant Malade',NULL,NULL),(54,'15','15003','Lycée Enseignement Général','Lycée Enseignement Général',NULL,NULL),(55,'15','15004','Lycée','Lycée',NULL,NULL),(56,'18','18001','7H','7 heure',NULL,NULL),(57,'18','18002','8H','8 heure',NULL,NULL),(58,'18','18003','9H','9 heure',NULL,NULL),(59,'18','18005','10H','10 heure',NULL,NULL),(60,'18','18006','11H','11 heure',NULL,NULL),(61,'18','18007','12H','12 heure',NULL,NULL),(62,'18','18008','13H','13 heure',NULL,NULL),(63,'18','18009','14H','14 heure',NULL,NULL),(64,'18','18010','15H','15 heure',NULL,NULL),(65,'18','18011','16H','16 heure',NULL,NULL),(66,'18','18012','17H','17 heure',NULL,NULL),(67,'18','18013','18H','18 heure',NULL,NULL),(68,'04','50001','Violance verbale','Violance verbale',NULL,NULL),(69,'04','50002','Violance physique','Violance physique',NULL,NULL),(70,'04','50003','Barvadage en classe','Barvadage en classe',NULL,NULL),(71,'13','13001','Interrogation','Interrogation',NULL,NULL),(72,'13','13002','Devoir','Devoir',NULL,NULL),(73,'13','13003','Composition','Composition',NULL,NULL),(74,'14','14T001','1T','1 er trimestre',NULL,NULL),(75,'14','14T002','2T','2 ème trimestre',NULL,NULL),(76,'14','14T003','3T','3 ème trimestre',NULL,NULL),(91,'22','22001','Passer','Passer',NULL,NULL),(92,'22','22002','Redoubler','Redoubler',NULL,NULL),(93,'22','22003','Renvoyer','Renvoyer',NULL,NULL),(94,'23','23001','Billet de Sortie','Billet de Sortie',NULL,NULL),(95,'23','23002','Certificat de scolarité','Certificat  de scolarité',NULL,NULL),(96,'23','23003','Billet d\'entrée','Billet d\'entrée',NULL,NULL),(97,'23','23004','Attestation de niveau','Attestation de niveau',NULL,NULL),(98,'24','24002','Meilleur Moyenne/Note','Meilleur Moyenne/Note',NULL,NULL),(99,'24','24001','Diviser Total Coefficient','Diviser Total Coefficient',NULL,NULL),(100,'03','3999','AUTRE','AUTRE',NULL,NULL),(101,'10','10004','BEPC','Brevet d\'Études du Premier Cycle',NULL,NULL),(102,'10','10005','CEP','Certificat d\'études primaires',NULL,NULL),(103,'10','10006','BEP','Brevet d\'études professionnelles',NULL,NULL),(104,'20','20001','Planifier','Planifier',NULL,NULL),(105,'20','20002','Composer','Composer',NULL,NULL),(106,'20','20003','Annuler','Annuler',NULL,NULL),(107,'20','20004','Valider','Valider',NULL,NULL),(113,'18','18004','9H45','9 heure 45',NULL,NULL),(114,'19','19001','Lundi','Lundi',NULL,NULL),(115,'19','19002','Mardi','Mardi',NULL,NULL),(116,'19','19003','Mercredi','Mercredi',NULL,NULL),(117,'19','19004','Jeudi','Jeudi',NULL,NULL),(118,'19','19005','Vendre','Verndredi',NULL,NULL),(119,'19','19006','Samedi','Samedi',NULL,NULL),(120,'19','19007','Dimanche','Dimanche',NULL,NULL),(121,'06','6001','Recyclage','Recyclage',NULL,NULL),(122,'16','16001','Formation Planifier','Formation Planifier',NULL,NULL),(123,'16','16002','Formation suivie','Formation suivie',NULL,NULL),(124,'16','16003','Formation Annuler','Formation Annuler',NULL,NULL),(125,'17','17T03','Trimestre','Trimestre',NULL,NULL),(128,'21','21001','Proviseur','Proviseur',NULL,NULL),(129,'21','21002','Censeur','Censeur',NULL,NULL),(130,'21','21003','Conseiller Principal d\'Education','Conseiller Principal d\'education',NULL,NULL),(131,'24','24003','2 Meilleurs Moyennes/Notes','2 Meilleurs Moyennes/Notes',NULL,NULL),(132,'24','24004','3 Meilleurs Moyennes/Notes','3 Meilleurs Moyennes/Notes',NULL,NULL),(133,'25','25001','Limite Jour/Semaine','Un enseignant ou une classe doit respecter le nombre maximum de jours par semaine',NULL,NULL),(134,'25','25002','Limite heures quotidiennes','Un enseignant ou une classe doit respecter le nombre maximum d\'heures quotidiennes',NULL,NULL),(135,'29','29001','L','Litre',NULL,NULL),(136,'29','29002','Nombre','Nombre',NULL,NULL),(137,'29','29003','Kg','Kilogramme',NULL,NULL),(138,'29','29004','Sac','Sac',NULL,NULL),(139,'21','21004','Intendant','Intendant',NULL,NULL),(145,'30','30001','A jour Scolarité','A jour Scolarité',NULL,NULL),(146,'30','30002','Pas A jour Scolarité','Pas A jour Scolarité',NULL,NULL),(147,'21','21008','Professeur','Professeur',NULL,NULL),(148,'08','8004','Fonctionnaire','Fonctionnaire',NULL,NULL),(150,'29','29005','Franc CFA','FCFA',NULL,NULL),(151,'32','32001','blame','blame',NULL,NULL),(152,'32','32002','avertissement','avertissement',NULL,NULL),(153,'32','32003','TH','TH',NULL,NULL),(154,'32','32004','TH + Encouragement','TH + Encouragement',NULL,NULL),(155,'32','32005','TH + felicitation','TH + felicitation',NULL,NULL),(156,'25','25003','Heures minimum quotidiennes','Heures minimum quotidiennes pour une classe ou un enseignant',NULL,NULL),(157,'36','36999','Bonne conduite','Bonne conduite',NULL,NULL),(158,'40','4001','Recette','Recette',NULL,NULL),(159,'40','4006','Dépense','Dépense',NULL,NULL),(160,'40','4003','Transfert de fond','Transfert de fond',NULL,NULL),(161,'40','4004','Autre Recette','Autre Recette',NULL,NULL),(162,'40','4005','Autre Dépense','Autre Dépense',NULL,NULL),(163,'40','4002','Paiement salaire','Paiement salaire',NULL,NULL),(164,'40','4007','Annuler Opérattion Transaction','Annulation d\'une Opérattion de Transaction',NULL,NULL),(165,'40','4008','Transaction Annuler','Transaction Annuler',NULL,NULL),(166,'40','4009','Demande d\'annulation en cours','Demande d\'annulation en cours',NULL,NULL),(167,'40','4010','Demande d\'annulation refusée','Demande d\'annulation refusée',NULL,NULL),(168,'41','4101','en espèce','en espèce',NULL,NULL),(169,'41','4102','carte bancaire','carte bancaire',NULL,NULL),(170,'41','4103','Virement mobile money','Virement mobile money',NULL,NULL),(171,'42','4201','Caisse Recette','Caisse Recette',NULL,NULL),(172,'42','4203','Compte bancaire','Compte bancaire',NULL,NULL),(173,'43','4301','Erreur de saisi','Erreur de saisi',NULL,NULL),(174,'42','4202','Caisse dépense','Caisse dépense',NULL,NULL),(1073,'33','33998','1er cycle','Premier cycle',NULL,NULL),(1074,'33','33999','2nd cycle','Second cycle',NULL,NULL),(1075,'34','34600','6eme','Sixième',NULL,NULL),(1076,'34','34500','5eme','Cinquième',NULL,NULL),(1077,'34','34400','4eme','Quatrième',NULL,NULL),(1078,'34','34300','3eme','Troisième',NULL,NULL),(1079,'34','34200','2nd','Second',NULL,NULL),(1080,'34','34100','1ere','Première',NULL,NULL),(1081,'34','34TL0','Tle','Terminale',NULL,NULL),(1082,'35','35A4','A4','A4',NULL,NULL),(1083,'35','35C0','C','C',NULL,NULL),(1084,'35','35D0','D','D',NULL,NULL),(1085,'35','35TL0','AB3','AB3',NULL,NULL),(1086,'35','35TVC','TVC','TVC',NULL,NULL),(1087,'35','35E0','E','E',NULL,NULL),(1088,'39','39001','Option allemdand','Option allemdand',NULL,NULL);
/*!40000 ALTER TABLE `pa_param_glob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_pays`
--

DROP TABLE IF EXISTS `pa_pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_pays` (
  `ID_PAYS` int NOT NULL AUTO_INCREMENT,
  `COD_ISO_CRT_PAYS` char(2) NOT NULL,
  `COD_ISO_LNG_PAYS` char(3) NOT NULL,
  `NOM_AN_PAYS` varchar(64) NOT NULL,
  `NOM_FR_PAYS` varchar(64) NOT NULL,
  `NUM_ORDR_PAYS` int NOT NULL DEFAULT '999',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PAYS`),
  KEY `FK_SE_USERNAME_CREA_PA_PAYS` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_PAYS` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Pays';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_pays`
--

LOCK TABLES `pa_pays` WRITE;
/*!40000 ALTER TABLE `pa_pays` DISABLE KEYS */;
INSERT INTO `pa_pays` VALUES (1,'AF','AFG','Afghanistan','Afghanistan',999,NULL,NULL),(2,'AL','ALB','Albania','Albanie',999,NULL,NULL),(3,'AQ','ATA','Antarctica','Antarctique',999,NULL,NULL),(4,'DZ','DZA','Algeria','Algérie',999,NULL,NULL),(5,'AS','ASM','American Samoa','Samoa Américaines',999,NULL,NULL),(6,'AD','AND','Andorra','Andorre',999,NULL,NULL),(7,'AO','AGO','Angola','Angola',999,NULL,NULL),(8,'AG','ATG','Antigua and Barbuda','Antigua-et-Barbuda',999,NULL,NULL),(9,'AZ','AZE','Azerbaijan','Azerbaïdjan',999,NULL,NULL),(10,'AR','ARG','Argentina','Argentine',999,NULL,NULL),(11,'AU','AUS','Australia','Australie',999,NULL,NULL),(12,'AT','AUT','Austria','Autriche',999,NULL,NULL),(13,'BS','BHS','Bahamas','Bahamas',999,NULL,NULL),(14,'BH','BHR','Bahrain','Bahreïn',999,NULL,NULL),(15,'BD','BGD','Bangladesh','Bangladesh',999,NULL,NULL),(16,'AM','ARM','Armenia','Arménie',999,NULL,NULL),(17,'BB','BRB','Barbados','Barbade',999,NULL,NULL),(18,'BE','BEL','Belgium','Belgique',999,NULL,NULL),(19,'BM','BMU','Bermuda','Bermudes',999,NULL,NULL),(20,'BT','BTN','Bhutan','Bhoutan',999,NULL,NULL),(21,'BO','BOL','Bolivia','Bolivie',999,NULL,NULL),(22,'BA','BIH','Bosnia and Herzegovina','Bosnie-Herzégovine',999,NULL,NULL),(23,'BW','BWA','Botswana','Botswana',999,NULL,NULL),(24,'BV','BVT','Bouvet Island','Île Bouvet',999,NULL,NULL),(25,'BR','BRA','Brazil','Brésil',999,NULL,NULL),(26,'BZ','BLZ','Belize','Belize',999,NULL,NULL),(27,'IO','IOT','British Indian Ocean Territory','Territoire Britannique de l\'Océan Indien',999,NULL,NULL),(28,'SB','SLB','Solomon Islands','Îles Salomon',999,NULL,NULL),(29,'VG','VGB','British Virgin Islands','Îles Vierges Britanniques',999,NULL,NULL),(30,'BN','BRN','Brunei Darussalam','Brunéi Darussalam',999,NULL,NULL),(31,'BG','BGR','Bulgaria','Bulgarie',999,NULL,NULL),(32,'MM','MMR','Myanmar','Myanmar',999,NULL,NULL),(33,'BI','BDI','Burundi','Burundi',999,NULL,NULL),(34,'BY','BLR','Belarus','Bélarus',999,NULL,NULL),(35,'KH','KHM','Cambodia','Cambodge',999,NULL,NULL),(36,'CM','CMR','Cameroon','Cameroun',999,NULL,NULL),(37,'CA','CAN','Canada','Canada',999,NULL,NULL),(38,'CV','CPV','Cape Verde','Cap-vert',999,NULL,NULL),(39,'KY','CYM','Cayman Islands','Îles Caïmanes',999,NULL,NULL),(40,'CF','CAF','Central African','République Centrafricaine',999,NULL,NULL),(41,'LK','LKA','Sri Lanka','Sri Lanka',999,NULL,NULL),(42,'TD','TCD','Chad','Tchad',999,NULL,NULL),(43,'CL','CHL','Chile','Chili',999,NULL,NULL),(44,'CN','CHN','China','Chine',999,NULL,NULL),(45,'TW','TWN','Taiwan','Taïwan',999,NULL,NULL),(46,'CX','CXR','Christmas Island','Île Christmas',999,NULL,NULL),(47,'CC','CCK','Cocos (Keeling) Islands','Îles Cocos (Keeling)',999,NULL,NULL),(48,'CO','COL','Colombia','Colombie',999,NULL,NULL),(49,'KM','COM','Comoros','Comores',999,NULL,NULL),(50,'YT','MYT','Mayotte','Mayotte',999,NULL,NULL),(51,'CG','COG','Republic of the Congo','République du Congo',999,NULL,NULL),(52,'CD','COD','The Democratic Republic Of The Congo','République Démocratique du Congo',999,NULL,NULL),(53,'CK','COK','Cook Islands','Îles Cook',999,NULL,NULL),(54,'CR','CRI','Costa Rica','Costa Rica',999,NULL,NULL),(55,'HR','HRV','Croatia','Croatie',999,NULL,NULL),(56,'CU','CUB','Cuba','Cuba',999,NULL,NULL),(57,'CY','CYP','Cyprus','Chypre',999,NULL,NULL),(58,'CZ','CZE','Czech Republic','République Tchèque',999,NULL,NULL),(59,'BJ','BEN','Benin','Bénin',999,NULL,NULL),(60,'DK','DNK','Denmark','Danemark',999,NULL,NULL),(61,'DM','DMA','Dominica','Dominique',999,NULL,NULL),(62,'DO','DOM','Dominican Republic','République Dominicaine',999,NULL,NULL),(63,'EC','ECU','Ecuador','Équateur',999,NULL,NULL),(64,'SV','SLV','El Salvador','El Salvador',999,NULL,NULL),(65,'GQ','GNQ','Equatorial Guinea','Guinée Équatoriale',999,NULL,NULL),(66,'ET','ETH','Ethiopia','Éthiopie',999,NULL,NULL),(67,'ER','ERI','Eritrea','Érythrée',999,NULL,NULL),(68,'EE','EST','Estonia','Estonie',999,NULL,NULL),(69,'FO','FRO','Faroe Islands','Îles Féroé',999,NULL,NULL),(70,'FK','FLK','Falkland Islands','Îles (malvinas) Falkland',999,NULL,NULL),(71,'GS','SGS','South Georgia and the South Sandwich Islands','Géorgie du Sud et les Îles Sandwich du Sud',999,NULL,NULL),(72,'FJ','FJI','Fiji','Fidji',999,NULL,NULL),(73,'FI','FIN','Finland','Finlande',999,NULL,NULL),(74,'AX','ALA','Åland Islands','Îles Åland',999,NULL,NULL),(75,'FR','FRA','France','France',999,NULL,NULL),(76,'GF','GUF','French Guiana','Guyane Française',999,NULL,NULL),(77,'PF','PYF','French Polynesia','Polynésie Française',999,NULL,NULL),(78,'TF','ATF','French Southern Territories','Terres Australes Françaises',999,NULL,NULL),(79,'DJ','DJI','Djibouti','Djibouti',999,NULL,NULL),(80,'GA','GAB','Gabon','Gabon',999,NULL,NULL),(81,'GE','GEO','Georgia','Géorgie',999,NULL,NULL),(82,'GM','GMB','Gambia','Gambie',999,NULL,NULL),(83,'PS','PSE','Occupied Palestinian Territory','Territoire Palestinien Occupé',999,NULL,NULL),(84,'DE','DEU','Germany','Allemagne',999,NULL,NULL),(85,'GH','GHA','Ghana','Ghana',999,NULL,NULL),(86,'GI','GIB','Gibraltar','Gibraltar',999,NULL,NULL),(87,'KI','KIR','Kiribati','Kiribati',999,NULL,NULL),(88,'GR','GRC','Greece','Grèce',999,NULL,NULL),(89,'GL','GRL','Greenland','Groenland',999,NULL,NULL),(90,'GD','GRD','Grenada','Grenade',999,NULL,NULL),(91,'GP','GLP','Guadeloupe','Guadeloupe',999,NULL,NULL),(92,'GU','GUM','Guam','Guam',999,NULL,NULL),(93,'GT','GTM','Guatemala','Guatemala',999,NULL,NULL),(94,'GN','GIN','Guinea','Guinée',999,NULL,NULL),(95,'GY','GUY','Guyana','Guyana',999,NULL,NULL),(96,'HT','HTI','Haiti','Haïti',999,NULL,NULL),(97,'HM','HMD','Heard Island and McDonald Islands','Îles Heard et Mcdonald',999,NULL,NULL),(98,'VA','VAT','Vatican City State','Saint-Siège (état de la Cité du Vatican)',999,NULL,NULL),(99,'HN','HND','Honduras','Honduras',999,NULL,NULL),(100,'HK','HKG','Hong Kong','Hong-Kong',999,NULL,NULL),(101,'HU','HUN','Hungary','Hongrie',999,NULL,NULL),(102,'IS','ISL','Iceland','Islande',999,NULL,NULL),(103,'IN','IND','India','Inde',999,NULL,NULL),(104,'ID','IDN','Indonesia','Indonésie',999,NULL,NULL),(105,'IR','IRN','Islamic Republic of Iran','République Islamique d\'Iran',999,NULL,NULL),(106,'IQ','IRQ','Iraq','Iraq',999,NULL,NULL),(107,'IE','IRL','Ireland','Irlande',999,NULL,NULL),(108,'IL','ISR','Israel','Israël',999,NULL,NULL),(109,'IT','ITA','Italy','Italie',999,NULL,NULL),(110,'CI','CIV','Côte d\'Ivoire','Côte d\'Ivoire',999,NULL,NULL),(111,'JM','JAM','Jamaica','Jamaïque',999,NULL,NULL),(112,'JP','JPN','Japan','Japon',999,NULL,NULL),(113,'KZ','KAZ','Kazakhstan','Kazakhstan',999,NULL,NULL),(114,'JO','JOR','Jordan','Jordanie',999,NULL,NULL),(115,'KE','KEN','Kenya','Kenya',999,NULL,NULL),(116,'KP','PRK','Democratic People\'s Republic of Korea','République Populaire Démocratique de Corée',999,NULL,NULL),(117,'KR','KOR','Republic of Korea','République de Corée',999,NULL,NULL),(118,'KW','KWT','Kuwait','Koweït',999,NULL,NULL),(119,'KG','KGZ','Kyrgyzstan','Kirghizistan',999,NULL,NULL),(120,'LA','LAO','Lao People\'s Democratic Republic','République Démocratique Populaire Lao',999,NULL,NULL),(121,'LB','LBN','Lebanon','Liban',999,NULL,NULL),(122,'LS','LSO','Lesotho','Lesotho',999,NULL,NULL),(123,'LV','LVA','Latvia','Lettonie',999,NULL,NULL),(124,'LR','LBR','Liberia','Libéria',999,NULL,NULL),(125,'LY','LBY','Libyan Arab Jamahiriya','Jamahiriya Arabe Libyenne',999,NULL,NULL),(126,'LI','LIE','Liechtenstein','Liechtenstein',999,NULL,NULL),(127,'LT','LTU','Lithuania','Lituanie',999,NULL,NULL),(128,'LU','LUX','Luxembourg','Luxembourg',999,NULL,NULL),(129,'MO','MAC','Macao','Macao',999,NULL,NULL),(130,'MG','MDG','Madagascar','Madagascar',999,NULL,NULL),(131,'MW','MWI','Malawi','Malawi',999,NULL,NULL),(132,'MY','MYS','Malaysia','Malaisie',999,NULL,NULL),(133,'MV','MDV','Maldives','Maldives',999,NULL,NULL),(134,'ML','MLI','Mali','Mali',999,NULL,NULL),(135,'MT','MLT','Malta','Malte',999,NULL,NULL),(136,'MQ','MTQ','Martinique','Martinique',999,NULL,NULL),(137,'MR','MRT','Mauritania','Mauritanie',999,NULL,NULL),(138,'MU','MUS','Mauritius','Maurice',999,NULL,NULL),(139,'MX','MEX','Mexico','Mexique',999,NULL,NULL),(140,'MC','MCO','Monaco','Monaco',999,NULL,NULL),(141,'MN','MNG','Mongolia','Mongolie',999,NULL,NULL),(142,'MD','MDA','Republic of Moldova','République de Moldova',999,NULL,NULL),(143,'MS','MSR','Montserrat','Montserrat',999,NULL,NULL),(144,'MA','MAR','Morocco','Maroc',999,NULL,NULL),(145,'MZ','MOZ','Mozambique','Mozambique',999,NULL,NULL),(146,'OM','OMN','Oman','Oman',999,NULL,NULL),(147,'NA','NAM','Namibia','Namibie',999,NULL,NULL),(148,'NR','NRU','Nauru','Nauru',999,NULL,NULL),(149,'NP','NPL','Nepal','Népal',999,NULL,NULL),(150,'NL','NLD','Netherlands','Pays-Bas',999,NULL,NULL),(151,'AN','ANT','Netherlands Antilles','Antilles Néerlandaises',999,NULL,NULL),(152,'AW','ABW','Aruba','Aruba',999,NULL,NULL),(153,'NC','NCL','New Caledonia','Nouvelle-Calédonie',999,NULL,NULL),(154,'VU','VUT','Vanuatu','Vanuatu',999,NULL,NULL),(155,'NZ','NZL','New Zealand','Nouvelle-Zélande',999,NULL,NULL),(156,'NI','NIC','Nicaragua','Nicaragua',999,NULL,NULL),(157,'NE','NER','Niger','Niger',999,NULL,NULL),(158,'NG','NGA','Nigeria','Nigéria',999,NULL,NULL),(159,'NU','NIU','Niue','Niué',999,NULL,NULL),(160,'NF','NFK','Norfolk Island','Île Norfolk',999,NULL,NULL),(161,'NO','NOR','Norway','Norvège',999,NULL,NULL),(162,'MP','MNP','Northern Mariana Islands','Îles Mariannes du Nord',999,NULL,NULL),(163,'UM','UMI','United States Minor Outlying Islands','Îles Mineures Éloignées des États-Unis',999,NULL,NULL),(164,'FM','FSM','Federated States of Micronesia','États Fédérés de Micronésie',999,NULL,NULL),(165,'MH','MHL','Marshall Islands','Îles Marshall',999,NULL,NULL),(166,'PW','PLW','Palau','Palaos',999,NULL,NULL),(167,'PK','PAK','Pakistan','Pakistan',999,NULL,NULL),(168,'PA','PAN','Panama','Panama',999,NULL,NULL),(169,'PG','PNG','Papua New Guinea','Papouasie-Nouvelle-Guinée',999,NULL,NULL),(170,'PY','PRY','Paraguay','Paraguay',999,NULL,NULL),(171,'PE','PER','Peru','Pérou',999,NULL,NULL),(172,'PH','PHL','Philippines','Philippines',999,NULL,NULL),(173,'PN','PCN','Pitcairn','Pitcairn',999,NULL,NULL),(174,'PL','POL','Poland','Pologne',999,NULL,NULL),(175,'PT','PRT','Portugal','Portugal',999,NULL,NULL),(176,'GW','GNB','Guinea-Bissau','Guinée-Bissau',999,NULL,NULL),(177,'TL','TLS','Timor-Leste','Timor-Leste',999,NULL,NULL),(178,'PR','PRI','Puerto Rico','Porto Rico',999,NULL,NULL),(179,'QA','QAT','Qatar','Qatar',999,NULL,NULL),(180,'RE','REU','Réunion','Réunion',999,NULL,NULL),(181,'RO','ROU','Romania','Roumanie',999,NULL,NULL),(182,'RU','RUS','Russian Federation','Fédération de Russie',999,NULL,NULL),(183,'RW','RWA','Rwanda','Rwanda',999,NULL,NULL),(184,'SH','SHN','Saint Helena','Sainte-Hélène',999,NULL,NULL),(185,'KN','KNA','Saint Kitts and Nevis','Saint-Kitts-et-Nevis',999,NULL,NULL),(186,'AI','AIA','Anguilla','Anguilla',999,NULL,NULL),(187,'LC','LCA','Saint Lucia','Sainte-Lucie',999,NULL,NULL),(188,'PM','SPM','Saint-Pierre and Miquelon','Saint-Pierre-et-Miquelon',999,NULL,NULL),(189,'VC','VCT','Saint Vincent and the Grenadines','Saint-Vincent-et-les Grenadines',999,NULL,NULL),(190,'SM','SMR','San Marino','Saint-Marin',999,NULL,NULL),(191,'ST','STP','Sao Tome and Principe','Sao Tomé-et-Principe',999,NULL,NULL),(192,'SA','SAU','Saudi Arabia','Arabie Saoudite',999,NULL,NULL),(193,'SN','SEN','Senegal','Sénégal',999,NULL,NULL),(194,'SC','SYC','Seychelles','Seychelles',999,NULL,NULL),(195,'SL','SLE','Sierra Leone','Sierra Leone',999,NULL,NULL),(196,'SG','SGP','Singapore','Singapour',999,NULL,NULL),(197,'SK','SVK','Slovakia','Slovaquie',999,NULL,NULL),(198,'VN','VNM','Vietnam','Viet Nam',999,NULL,NULL),(199,'SI','SVN','Slovenia','Slovénie',999,NULL,NULL),(200,'SO','SOM','Somalia','Somalie',999,NULL,NULL),(201,'ZA','ZAF','South Africa','Afrique du Sud',999,NULL,NULL),(202,'ZW','ZWE','Zimbabwe','Zimbabwe',999,NULL,NULL),(203,'ES','ESP','Spain','Espagne',999,NULL,NULL),(204,'EH','ESH','Western Sahara','Sahara Occidental',999,NULL,NULL),(205,'SD','SDN','Sudan','Soudan',999,NULL,NULL),(206,'SR','SUR','Suriname','Suriname',999,NULL,NULL),(207,'SJ','SJM','Svalbard and Jan Mayen','Svalbard etÎle Jan Mayen',999,NULL,NULL),(208,'SZ','SWZ','Swaziland','Swaziland',999,NULL,NULL),(209,'SE','SWE','Sweden','Suède',999,NULL,NULL),(210,'CH','CHE','Switzerland','Suisse',999,NULL,NULL),(211,'SY','SYR','Syrian Arab Republic','République Arabe Syrienne',999,NULL,NULL),(212,'TJ','TJK','Tajikistan','Tadjikistan',999,NULL,NULL),(213,'TH','THA','Thailand','Thaïlande',999,NULL,NULL),(214,'TG','TGO','Togo','Togo',999,NULL,NULL),(215,'TK','TKL','Tokelau','Tokelau',999,NULL,NULL),(216,'TO','TON','Tonga','Tonga',999,NULL,NULL),(217,'TT','TTO','Trinidad and Tobago','Trinité-et-Tobago',999,NULL,NULL),(218,'AE','ARE','United Arab Emirates','Émirats Arabes Unis',999,NULL,NULL),(219,'TN','TUN','Tunisia','Tunisie',999,NULL,NULL),(220,'TR','TUR','Turkey','Turquie',999,NULL,NULL),(221,'TM','TKM','Turkmenistan','Turkménistan',999,NULL,NULL),(222,'TC','TCA','Turks and Caicos Islands','Îles Turks et Caïques',999,NULL,NULL),(223,'TV','TUV','Tuvalu','Tuvalu',999,NULL,NULL),(224,'UG','UGA','Uganda','Ouganda',999,NULL,NULL),(225,'UA','UKR','Ukraine','Ukraine',999,NULL,NULL),(226,'MK','MKD','The Former Yugoslav Republic of Macedonia','L\'ex-République Yougoslave de Macédoine',999,NULL,NULL),(227,'EG','EGY','Egypt','Égypte',999,NULL,NULL),(228,'GB','GBR','United Kingdom','Royaume-Uni',999,NULL,NULL),(229,'IM','IMN','Isle of Man','Île de Man',999,NULL,NULL),(230,'TZ','TZA','United Republic Of Tanzania','République-Unie de Tanzanie',999,NULL,NULL),(231,'US','USA','United States','États-Unis',999,NULL,NULL),(232,'VI','VIR','U.S. Virgin Islands','Îles Vierges des États-Unis',999,NULL,NULL),(233,'BF','BFA','Burkina Faso','Burkina Faso',999,NULL,NULL),(234,'UY','URY','Uruguay','Uruguay',999,NULL,NULL),(235,'UZ','UZB','Uzbekistan','Ouzbékistan',999,NULL,NULL),(236,'VE','VEN','Venezuela','Venezuela',999,NULL,NULL),(237,'WF','WLF','Wallis and Futuna','Wallis et Futuna',999,NULL,NULL),(238,'WS','WSM','Samoa','Samoa',999,NULL,NULL),(239,'YE','YEM','Yemen','Yémen',999,NULL,NULL),(240,'CS','SCG','Serbia and Montenegro','Serbie-et-Monténégro',999,NULL,NULL),(241,'ZM','ZMB','Zambia','Zambie',999,NULL,NULL);
/*!40000 ALTER TABLE `pa_pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_province`
--

DROP TABLE IF EXISTS `pa_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_province` (
  `ID_PROV` int NOT NULL AUTO_INCREMENT,
  `ID_REG` int NOT NULL,
  `COD_PROV` char(4) DEFAULT NULL,
  `LIB_PROV` varchar(64) NOT NULL,
  `CHF_LIE_PROV` varchar(64) NOT NULL,
  `LB_ARTICLE` varchar(10) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PROV`),
  UNIQUE KEY `I_PU_PA_PROVINCE` (`COD_PROV`),
  KEY `I_FK_PA_PROVINCE_PA_REGION` (`ID_REG`),
  KEY `FK_SE_USERNAME_CREA_PA_PROVINCE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_PROVINCE_PA_REGION` FOREIGN KEY (`ID_REG`) REFERENCES `pa_region` (`ID_REG`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_PROVINCE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Province';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_province`
--

LOCK TABLES `pa_province` WRITE;
/*!40000 ALTER TABLE `pa_province` DISABLE KEYS */;
INSERT INTO `pa_province` VALUES (1,6,'01','Bam','Kongoussi','du ',NULL,NULL),(2,13,'02','Bazèga','Kombissiri','du ',NULL,NULL),(3,5,'03','Bougouriba','Diébougou','du ',NULL,NULL),(4,10,'04','Boulgou','Tenkodogo','du ',NULL,NULL),(5,7,'05','Boulkiemdé','Koudougou','du ',NULL,NULL),(6,12,'06','Comoé','Banfora','des',NULL,NULL),(7,8,'07','Ganzourgou','Zorgho','du ',NULL,NULL),(8,4,'08','Gnagna','Bogandé','de la ',NULL,NULL),(9,4,'09','Gourma','Fada N’Gourma','du ',NULL,NULL),(10,1,'10','Houet','Bobo-Dioulasso','du ',NULL,NULL),(11,11,'11','Kadiogo','Ouagadougou','du ',NULL,NULL),(12,1,'12','Kénédougou','Orodara','des ',NULL,NULL),(13,2,'13','Kossin','Nouna','du ',NULL,NULL),(14,10,'14','Kouritenga','Koupéla','du ',NULL,NULL),(15,2,'15','Mouhoun','Dédougou','de la ',NULL,NULL),(16,13,'16','Nahouri','Pô','du ',NULL,NULL),(17,6,'17','Namentenga','Boulsa','de la ',NULL,NULL),(18,8,'18','Bassitenga','Ziniaré','de l\'',NULL,NULL),(19,3,'19','Oudalan','Gorom-Gorom','de l\'',NULL,NULL),(20,9,'20','Passoré','Yako','du ',NULL,NULL),(21,5,'21','Poni','Gaoua','du ',NULL,NULL),(22,7,'22','Sanguié','Réo','du ',NULL,NULL),(23,6,'23','Sandbondtenga','Kaya','du ',NULL,NULL),(24,3,'24','Séno','Dori','du ',NULL,NULL),(25,7,'25','Sissili','Léo','de la ',NULL,NULL),(26,3,'26','Djelgodji','Djibo','du ',NULL,NULL),(27,2,'27','Sourou','Tougan','du ',NULL,NULL),(28,4,'28','Gobnangou','Diapaga','du ',NULL,NULL),(29,9,'29','Yatenga','Ouahigouya','du ',NULL,NULL),(30,13,'30','Zoundwéogo','Manga','du ',NULL,NULL),(31,2,'31','Balé','Boromo','des ',NULL,NULL),(32,2,'32','Banwa','Solenzo','des ',NULL,NULL),(33,5,'33','Ioba','Dano','du ',NULL,NULL),(34,4,'34','Komondjari','Gayéri','de la ',NULL,NULL),(35,4,'35','Kompienga','Pama','de la ',NULL,NULL),(36,10,'36','Koulpélogo','Ouargaye','du ',NULL,NULL),(37,8,'37','Kourwéogo','Boussé','du ',NULL,NULL),(38,12,'38','Léraba','Sindou','de la ',NULL,NULL),(39,9,'39','Loroum','Titao','du ',NULL,NULL),(40,2,'40','Nayala','Toma','du ',NULL,NULL),(41,5,'41','Noumbiel','Batié','du ',NULL,NULL),(42,1,'42','Tuy','Houndé','du ',NULL,NULL),(43,3,'43','Yagha','Sebba','du ',NULL,NULL),(44,7,'44','Ziro','Sapouy','du ',NULL,NULL),(45,9,'45','Zondoma','Gourcy','du ',NULL,NULL),(46,17,'46','Dyamongou','Kantchari','du ',NULL,NULL),(47,14,'47','Karo-Peli','Arbinda','du ',NULL,NULL);
/*!40000 ALTER TABLE `pa_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_region`
--

DROP TABLE IF EXISTS `pa_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_region` (
  `ID_REG` int NOT NULL AUTO_INCREMENT,
  `COD_REG` char(2) DEFAULT NULL,
  `LIB_REG` varchar(64) NOT NULL,
  `CHF_LIEU_REG` varchar(64) NOT NULL,
  `LB_ARTICLE` varchar(10) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_REG`),
  UNIQUE KEY `I_PU_PA_REGION` (`COD_REG`),
  KEY `FK_SE_USERNAME_CREA_PA_REGION` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_REGION` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_region`
--

LOCK TABLES `pa_region` WRITE;
/*!40000 ALTER TABLE `pa_region` DISABLE KEYS */;
INSERT INTO `pa_region` VALUES (1,'01','Guiriko','Bobo-Dioulasso','du ',NULL,NULL),(2,'02','Bankui','Dédougou','du  ',NULL,NULL),(3,'03','Liptako','Dori','du ',NULL,NULL),(4,'04','Goulmou','Fada N\'Gourma','du\'',NULL,NULL),(5,'05','Djôrô','Gaoua','du ',NULL,NULL),(6,'06','Kuilsé','Kaya','des ',NULL,NULL),(7,'07','Nando','Koudougou','du ',NULL,NULL),(8,'08','Oubri','Ziniaré','du ',NULL,NULL),(9,'09','Yaadga','Ouahigouya','du ',NULL,NULL),(10,'10','Nakambé','Tenkodogo','du ',NULL,NULL),(11,'11','Kadiogo','Ouagadougou','du ',NULL,NULL),(12,'12','Tannounyan','Banfora','des ',NULL,NULL),(13,'13','Nazinon','Manga','du ',NULL,NULL),(14,'14','Soum','Djibo','du ',NULL,NULL),(15,'15','Sirba','Bogandé','de la ',NULL,NULL),(16,'16','Sourou','Tougan','du ',NULL,NULL),(17,'17','Tapoa','Diapaga','de la ',NULL,NULL);
/*!40000 ALTER TABLE `pa_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_rel_matiere_niv_etud`
--

DROP TABLE IF EXISTS `pa_rel_matiere_niv_etud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_rel_matiere_niv_etud` (
  `ID_MATIERE` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `VOLUM_HOR_HEBD` smallint NOT NULL,
  `COEFFICIENT` decimal(4,2) NOT NULL,
  `DESC_MAT_NIV_ETUD` varchar(1024) NOT NULL,
  `ID_PA_MODULE` int DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_MATIERE`,`ID_NIV_ETU`),
  KEY `I_FK_PA_REL_MATIERE_NIV_ETUD_PA_MATIERE` (`ID_MATIERE`),
  KEY `I_FK_PA_REL_MATIERE_NIV_ETUD_PA_NIV_ETUDE` (`ID_NIV_ETU`),
  KEY `I_FK_PA_REL_MATIERE_NIV_ETUD_PA_PARAM_GLOB` (`ID_PA_MODULE`),
  KEY `FK_SE_USERNAME_CREA_PA_REL_MATIERE_NIV_ETUD` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_REL_MATIERE_NIV_ETUD_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_PA_REL_MATIERE_NIV_ETUD_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_PA_REL_MATIERE_NIV_ETUD_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_MODULE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_REL_MATIERE_NIV_ETUD` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Matiere Niveau Etude';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_rel_matiere_niv_etud`
--

LOCK TABLES `pa_rel_matiere_niv_etud` WRITE;
/*!40000 ALTER TABLE `pa_rel_matiere_niv_etud` DISABLE KEYS */;
INSERT INTO `pa_rel_matiere_niv_etud` VALUES (1,1,5,5.00,'Mathématique pour la 6ème',NULL,NULL,NULL),(1,2,5,5.00,'Mathématique pour la 5ème',NULL,NULL,NULL),(1,3,5,5.00,'Mathématique pour la 4ème',NULL,NULL,NULL),(1,4,5,5.00,'Mathématique pour la 3ème',NULL,NULL,NULL),(1,6,3,3.00,'Mathématique pour la 2nd A4',NULL,NULL,NULL),(1,7,6,5.00,'Mathématique pour la 2nd C',NULL,NULL,NULL),(1,9,3,3.00,'Mathématique pour la 1e A4',NULL,NULL,NULL),(1,10,6,5.00,'Mathématique pour la 1e D',NULL,NULL,NULL),(1,12,3,3.00,'Mathématique pour la Tle A4',NULL,NULL,NULL),(1,13,6,5.00,'Mathématique pour la Tle D',NULL,NULL,NULL),(2,1,5,5.00,'Francais pour la 6ème',NULL,NULL,NULL),(2,2,5,5.00,'Francais pour la 5ème',NULL,NULL,NULL),(2,3,5,5.00,'Francais pour la 4ème',NULL,NULL,NULL),(2,4,5,5.00,'Francais pour la 3ème',NULL,NULL,NULL),(2,6,5,5.00,'Francais pour la 2nd A4',NULL,NULL,NULL),(2,7,4,3.00,'Francais pour la 2nd C',NULL,NULL,NULL),(2,9,5,5.00,'Francais pour la 1e A4',NULL,NULL,NULL),(2,10,4,3.00,'Francais pour la 1e D',NULL,NULL,NULL),(2,12,5,5.00,'Francais pour la Tle A4',NULL,NULL,NULL),(2,13,4,3.00,'Francais pour la Tle D',NULL,NULL,NULL),(3,3,4,4.00,'Physique Chimie pour la 4ème',NULL,NULL,NULL),(3,4,4,4.00,'Physique Chimie pour la 3ème',NULL,NULL,NULL),(3,7,6,7.00,'Physique Chimie pour la 2nd C',NULL,NULL,NULL),(3,10,6,5.00,'Physique Chimie pour la 1e D',NULL,NULL,NULL),(3,13,6,5.00,'Physique Chimie pour la Tle D',NULL,NULL,NULL),(4,1,3,3.00,'Histoire Géographie pour la 6ème',NULL,NULL,NULL),(4,2,3,3.00,'Histoire Géographie pour la 5ème',NULL,NULL,NULL),(4,3,3,3.00,'Histoire Géographie pour la 4ème',NULL,NULL,NULL),(4,4,3,3.00,'Histoire Géographie pour la 3ème',NULL,NULL,NULL),(4,6,3,3.00,'Histoire Géographie pour la 2nd A4',NULL,NULL,NULL),(4,7,3,2.00,'Histoire Géographie pour la 2nd C',NULL,NULL,NULL),(4,9,3,3.00,'Histoire Géographie pour la 1e A4',NULL,NULL,NULL),(4,10,3,2.00,'Histoire Géographie pour la 1e D',NULL,NULL,NULL),(4,12,3,3.00,'Histoire Géographie pour la Tle A4',NULL,NULL,NULL),(4,13,3,2.00,'Histoire Géographie pour la Tle D',NULL,NULL,NULL),(5,1,3,3.00,'SVT pour la 6ème',NULL,NULL,NULL),(5,2,3,3.00,'SVT pour la 5ème',NULL,NULL,NULL),(5,3,3,3.00,'SVT pour la 4ème',NULL,NULL,NULL),(5,4,3,3.00,'SVT pour la 3ème',NULL,NULL,NULL),(5,6,2,2.00,'SVT pour la 2nd A4',NULL,NULL,NULL),(5,7,3,3.00,'SVT pour la 2nd C',NULL,NULL,NULL),(5,9,2,2.00,'SVT pour la 1e A4',NULL,NULL,NULL),(5,10,3,4.00,'SVT pour la 1e D',NULL,NULL,NULL),(5,12,2,2.00,'SVT pour la Tle A4',NULL,NULL,NULL),(5,13,3,5.00,'SVT pour la Tle D',NULL,NULL,NULL),(6,1,3,3.00,'Anglais pour la 6ème',NULL,NULL,NULL),(6,2,3,3.00,'Anglais pour la 5ème',NULL,NULL,NULL),(6,3,3,3.00,'Anglais pour la 4ème',NULL,NULL,NULL),(6,4,3,3.00,'Anglais pour la 3ème',NULL,NULL,NULL),(6,6,4,4.00,'Anglais 2nd A4',NULL,NULL,NULL),(6,7,3,2.00,'Anglais pour la 2nd C',NULL,NULL,NULL),(6,9,4,4.00,'Anglais 1e A4',NULL,NULL,NULL),(6,10,3,2.00,'Anglais pour la 1e D',NULL,NULL,NULL),(6,12,4,4.00,'Anglais Tle A4',NULL,NULL,NULL),(6,13,3,2.00,'Anglais pour la Tle D',NULL,NULL,NULL),(7,3,4,2.00,'Allemend pour la 4ème',NULL,NULL,NULL),(7,4,2,2.00,'Allemend pour la 3ème',NULL,NULL,NULL),(7,6,3,3.00,'Allemand 2nd A4',NULL,NULL,NULL),(7,9,3,3.00,'Allemand 1e A4',NULL,NULL,NULL),(7,12,3,3.00,'Allemand Tle A4',NULL,NULL,NULL),(8,1,2,2.00,'EPS pour la 6ème',NULL,NULL,NULL),(8,2,2,2.00,'EPS pour la 5ème',NULL,NULL,NULL),(8,3,2,2.00,'EPS pour la 4ème',NULL,NULL,NULL),(8,4,2,2.00,'EPS pour la 3ème',NULL,NULL,NULL),(8,6,2,2.00,'EPS pour la 2nd A4',NULL,NULL,NULL),(8,7,2,2.00,'EPS pour la 2nd C',NULL,NULL,NULL),(8,9,2,2.00,'EPS pour la 1e A4',NULL,NULL,NULL),(8,10,2,2.00,'EPS pour la 1e D',NULL,NULL,NULL),(8,12,2,2.00,'EPS pour la Tle A4',NULL,NULL,NULL),(8,13,2,2.00,'EPS pour la Tle D',NULL,NULL,NULL),(9,6,2,2.00,'Philiosophie pour la 2nd A4',NULL,NULL,NULL),(9,7,2,2.00,'Philiosophie pour la 1e D',NULL,NULL,NULL),(9,9,2,2.00,'Philiosophie pour la 1e A4',NULL,NULL,NULL),(9,10,2,2.00,'Philiosophie pour la 1e D',NULL,NULL,NULL),(9,12,2,2.00,'Philiosophie pour la Tle A4',NULL,NULL,NULL),(9,13,2,2.00,'Philiosophie pour la Tle D',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pa_rel_matiere_niv_etud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_rel_module_niv_etud`
--

DROP TABLE IF EXISTS `pa_rel_module_niv_etud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_rel_module_niv_etud` (
  `ID_NIV_ETU` int NOT NULL,
  `ID_PA_MODULE` int NOT NULL,
  `COEFFICIENT` decimal(4,2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_MODULE`,`ID_NIV_ETU`),
  KEY `I_FK_pa_rel_module_NIV_PA_PARAM_GLOB` (`ID_PA_MODULE`),
  KEY `I_FK_pa_rel_module_NIV_PA_NIV_ETUDE` (`ID_NIV_ETU`),
  CONSTRAINT `FK_PA_REL_MODULE_NIV_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_PA_REL_MODULE_NIV_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_MODULE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Module Niveau Etude';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_rel_module_niv_etud`
--

LOCK TABLES `pa_rel_module_niv_etud` WRITE;
/*!40000 ALTER TABLE `pa_rel_module_niv_etud` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_rel_module_niv_etud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_rel_option_matier_niv_etud`
--

DROP TABLE IF EXISTS `pa_rel_option_matier_niv_etud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_rel_option_matier_niv_etud` (
  `ID_PA_OPTION` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `COEFFICIENT` decimal(4,2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_OPTION`,`ID_MATIERE`,`ID_NIV_ETU`),
  KEY `FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_NIV_ETUDEADD` (`ID_NIV_ETU`),
  KEY `FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_MATIERE` (`ID_MATIERE`),
  CONSTRAINT `FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_NIV_ETUDEADD` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_PARAM_GLOB_OPTION` FOREIGN KEY (`ID_PA_OPTION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Option Matiere niveau Matiere';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_rel_option_matier_niv_etud`
--

LOCK TABLES `pa_rel_option_matier_niv_etud` WRITE;
/*!40000 ALTER TABLE `pa_rel_option_matier_niv_etud` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_rel_option_matier_niv_etud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_rel_period_evaluation`
--

DROP TABLE IF EXISTS `pa_rel_period_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_rel_period_evaluation` (
  `ID_PA_TYP_PERIOD` int NOT NULL,
  `ID_ETAB` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_PA_PERIOD_EVAL` int NOT NULL,
  `DAT_OUV_EVAL` char(32) NOT NULL,
  `DAT_FER_EVAL` char(32) NOT NULL,
  `FL_MOY_GNRL` char(1) NOT NULL,
  `FL_FERM_PERIOD` char(1) NOT NULL DEFAULT 'N',
  `FL_DERN_PERIOD` char(1) NOT NULL DEFAULT 'N',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_AN_SCOLAIRE`,`ID_PA_PERIOD_EVAL`),
  KEY `I_FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB` (`ID_PA_TYP_PERIOD`),
  KEY `I_FK_PA_REL_PERIOD_EVALUATION_PA_ETABLISSEMENT` (`ID_ETAB`),
  KEY `I_FK_PA_REL_PERIOD_EVALUATION_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `I_FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB2` (`ID_PA_PERIOD_EVAL`),
  KEY `FK_SE_USERNAME_CREA_PA_REL_PERIOD_EVALUATION` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_REL_PERIOD_EVALUATION_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_PA_REL_PERIOD_EVALUATION_PA_ETABLISSEMENT` FOREIGN KEY (`ID_ETAB`) REFERENCES `pa_etablissement` (`ID_ETAB`),
  CONSTRAINT `FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_TYP_PERIOD`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_PERIOD_EVAL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_REL_PERIOD_EVALUATION` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pa_rel_period_evaluation_chk_1` CHECK ((`FL_MOY_GNRL` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `pa_rel_period_evaluation_chk_2` CHECK ((`FL_FERM_PERIOD` in (_utf8mb4'O',_utf8mb4'N'))),
  CONSTRAINT `pa_rel_period_evaluation_chk_3` CHECK ((`FL_DERN_PERIOD` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Periode Evaluation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_rel_period_evaluation`
--

LOCK TABLES `pa_rel_period_evaluation` WRITE;
/*!40000 ALTER TABLE `pa_rel_period_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_rel_period_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_rel_resrc_salle`
--

DROP TABLE IF EXISTS `pa_rel_resrc_salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_rel_resrc_salle` (
  `ID_RESRC` int NOT NULL,
  `ID_SALLE` int NOT NULL,
  `QTE_RESRC_SALLE` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_RESRC`,`ID_SALLE`),
  KEY `I_FK_PA_REL_RESRC_SALLE_PA_RESSOURCE` (`ID_RESRC`),
  KEY `I_FK_PA_REL_RESRC_SALLE_PA_SALLE` (`ID_SALLE`),
  KEY `FK_SE_USERNAME_CREA_PA_REL_RESRC_SALLE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_REL_RESRC_SALLE_PA_RESSOURCE` FOREIGN KEY (`ID_RESRC`) REFERENCES `pa_ressource` (`ID_RESRC`),
  CONSTRAINT `FK_PA_REL_RESRC_SALLE_PA_SALLE` FOREIGN KEY (`ID_SALLE`) REFERENCES `pa_salle` (`ID_SALLE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_REL_RESRC_SALLE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ressource Salle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_rel_resrc_salle`
--

LOCK TABLES `pa_rel_resrc_salle` WRITE;
/*!40000 ALTER TABLE `pa_rel_resrc_salle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_rel_resrc_salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_rel_sou_matiere_niv_etud`
--

DROP TABLE IF EXISTS `pa_rel_sou_matiere_niv_etud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_rel_sou_matiere_niv_etud` (
  `ID_SOU_MATIERE` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `COEFFICIENT` decimal(4,2) NOT NULL,
  `DESC_SOU_MAT_NIV_ETUD` varchar(1024) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_NIV_ETU`,`ID_SOU_MATIERE`),
  CONSTRAINT `FK_PA_SOU_MATIERE_PA_NIV_ETUDEADD` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Sous Matiere Niveau Etude';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_rel_sou_matiere_niv_etud`
--

LOCK TABLES `pa_rel_sou_matiere_niv_etud` WRITE;
/*!40000 ALTER TABLE `pa_rel_sou_matiere_niv_etud` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_rel_sou_matiere_niv_etud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_ressource`
--

DROP TABLE IF EXISTS `pa_ressource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_ressource` (
  `ID_RESRC` int NOT NULL AUTO_INCREMENT,
  `COD_RESRC` char(5) NOT NULL,
  `LIB_RESRC` varchar(128) NOT NULL,
  `QTE_TT_RESRC` bigint DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_RESRC`),
  UNIQUE KEY `I_PU_PA_RESSOURCE` (`COD_RESRC`),
  KEY `FK_SE_USERNAME_CREA_PA_RESSOURCE` (`USERNAME_CREA`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_RESSOURCE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ressource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_ressource`
--

LOCK TABLES `pa_ressource` WRITE;
/*!40000 ALTER TABLE `pa_ressource` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_ressource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_salle`
--

DROP TABLE IF EXISTS `pa_salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_salle` (
  `ID_SALLE` int NOT NULL AUTO_INCREMENT,
  `ID_BAT` int DEFAULT NULL,
  `COD_SALLE` char(5) NOT NULL,
  `LIB_SALLE` varchar(64) NOT NULL,
  `FLG_DISPO_SAL` char(1) NOT NULL DEFAULT 'O',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SALLE`),
  UNIQUE KEY `I_PU_PA_SALLE` (`COD_SALLE`),
  KEY `I_FK_PA_SALLE_PA_BATIMENT` (`ID_BAT`),
  KEY `FK_SE_USERNAME_CREA_PA_SALLE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_SALLE_PA_BATIMENT` FOREIGN KEY (`ID_BAT`) REFERENCES `pa_batiment` (`ID_BAT`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_SALLE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pa_salle_chk_1` CHECK ((`FLG_DISPO_SAL` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Salle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_salle`
--

LOCK TABLES `pa_salle` WRITE;
/*!40000 ALTER TABLE `pa_salle` DISABLE KEYS */;
INSERT INTO `pa_salle` VALUES (1,NULL,'SAL01','Salle Thomas Sankara','O',NULL,NULL),(2,1,'SAL02','Salle Blaise Compaore','O',NULL,NULL),(3,2,'SAL03','Salle Rock Kabore','O',NULL,NULL),(4,2,'SAL04','Salle Maurice Yaméogo','O',NULL,NULL),(5,2,'SAL05','Salle Sangoulé Lamizana','O',NULL,NULL),(6,2,'SAL06','Salle Saye Zerbo','O',NULL,NULL),(7,2,'SAL07','Salle Jean-Baptiste Ouédraogo','O',NULL,NULL),(8,2,'SAL08','Salle Michel Kafando','O',NULL,NULL),(9,2,'SAL09','Salle Guimbi OUATTARA','O',NULL,NULL),(10,2,'SAL10','Salle Yennenga','O',NULL,NULL),(11,2,'SAL11','Salle Norbert Zongo','O',NULL,NULL),(12,2,'SAL12','Salle Martin Luther King','O',NULL,NULL),(13,2,'SAL13','Salle Mohamed Ali','O',NULL,NULL),(14,2,'SAL14','Salle Patrice Lumumba','O',NULL,NULL),(15,1,'SAL15','Salle Malcolm X','O',NULL,NULL),(16,1,'SAL16','Salle Rosa Parks','O',NULL,NULL),(17,1,'SAL17','Salle Jeff Bezos','O',NULL,NULL),(18,1,'SAL18','Salle Bill Gates','O',NULL,NULL),(19,1,'SAL19','Salle Mark Zuckerberg','O',NULL,NULL),(20,1,'SAL20','Mahamadou Bonkoungou','O',NULL,NULL),(21,1,'SAL21','Ormar KANAZOE','O',NULL,NULL),(22,1,'SAL22','Djanguinaba Barro','O',NULL,NULL);
/*!40000 ALTER TABLE `pa_salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_sou_matiere`
--

DROP TABLE IF EXISTS `pa_sou_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_sou_matiere` (
  `ID_SOU_MATIERE` int NOT NULL AUTO_INCREMENT,
  `ID_MATIERE` int NOT NULL,
  `COD_SOU_MATIERE` char(5) DEFAULT NULL,
  `LIB_CRT_SOU_MATIERE` varchar(64) NOT NULL,
  `LIB_LNG_SOU_MATIRE` varchar(128) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SOU_MATIERE`),
  UNIQUE KEY `I_PU_PA_SOU_MATIERE` (`COD_SOU_MATIERE`),
  KEY `FK_PA_SOU_MATIERE_PA_MATIERE` (`ID_MATIERE`),
  CONSTRAINT `FK_PA_SOU_MATIERE_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Sous Matiere';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_sou_matiere`
--

LOCK TABLES `pa_sou_matiere` WRITE;
/*!40000 ALTER TABLE `pa_sou_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `pa_sou_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_sous_article`
--

DROP TABLE IF EXISTS `pa_sous_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_sous_article` (
  `ID_SS_ARTICL` int NOT NULL AUTO_INCREMENT,
  `ID_ARTICLE` int NOT NULL,
  `COD_SS_ARTICL` varchar(7) NOT NULL,
  `NUM_SS_ARTICL` varchar(6) NOT NULL,
  `LIB_CRT_SS_ARTICL` varchar(64) NOT NULL,
  `LIB_LNG_SS_ARTICL` varchar(128) NOT NULL,
  `PU_SS_ARTICL` decimal(13,2) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SS_ARTICL`),
  UNIQUE KEY `I_PU_PA_SOUS_ARTICLE` (`COD_SS_ARTICL`),
  KEY `I_FK_PA_SOUS_ARTICLE_PA_ARTICLE` (`ID_ARTICLE`),
  KEY `FK_SE_USERNAME_CREA_PA_SOUS_ARTICLE` (`USERNAME_CREA`),
  CONSTRAINT `FK_PA_SOUS_ARTICLE_PA_ARTICLE` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `pa_article` (`ID_ARTICLE`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PA_SOUS_ARTICLE` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Sous Article';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_sous_article`
--

LOCK TABLES `pa_sous_article` WRITE;
/*!40000 ALTER TABLE `pa_sous_article` DISABLE KEYS */;
INSERT INTO `pa_sous_article` VALUES (1,1,'R100101','0001','Report exercice antérieur','Report exercice antérieur',0.00,NULL,NULL),(2,1,'R100102','0002','Arriérés exercice antérieur','Arriérés exercice antérieur',0.00,NULL,NULL),(3,2,'R100201','0003','Frais d\'inscription Premier cycle','Frais d\'inscription Premier cycle',0.00,NULL,NULL),(4,2,'R100202','0004','Frais d\'inscription Second cycle','Frais d\'inscription Second cycle',0.00,NULL,NULL),(5,3,'R100301','0005','Frais de dépôt des demandes en RCE','Frais de dépôt des demandes en RCE',0.00,NULL,NULL),(6,3,'R100302','0006','Location de salles','Location de salles',0.00,NULL,NULL),(7,3,'R100303','0007','Cartes d’identités scolaires','Cartes d’identités scolaires',0.00,NULL,NULL),(8,3,'R100304','0008','Attestation de niveau et certificat de scolarité','Attestation de niveau et certificat de scolarité',0.00,NULL,NULL),(9,3,'R100305','0009','Livret scolaire','Livret scolaire',0.00,NULL,NULL),(10,3,'R100306','0010','Ristourne de la vente de la tenue scolaire tshort','Ristourne de la vente de la tenue scolaire tshort',0.00,NULL,NULL),(11,3,'R100307','0011','Location de matériels de sonorisation','Location de matériels de sonorisation',0.00,NULL,NULL),(12,3,'R100308','0012','Inscription aux examens du BEPC','Inscription aux examens du BEPC',0.00,NULL,NULL),(13,3,'R100309','0013','Vente de la plaque solaire et batterie','Vente de la plaque solaire et batterie',0.00,NULL,NULL),(14,3,'R100310','0014','Location des manuels scolaires','Location des manuels scolaires',0.00,NULL,NULL),(15,5,'R100501','0015','Abonnement Biblithèque Premier cycle','Abonnement Biblithèque Premier cycle',500.00,NULL,NULL),(16,5,'R100502','0016','Abonnement Biblithèque Second cycle','Abonnement Biblithèque Second cycle',1000.00,NULL,NULL),(17,7,'R10O701','0017','Heures supplémentaires et de vacation','Heures supplémentaires et de vacation',0.00,NULL,NULL),(18,7,'R100702','0018','Autres subventions de l’Etat','Autres subventions de l’Etat',0.00,NULL,NULL),(19,41,'D600301','0019','Reversements de 10% au MENA','Reversements de 10% au MENA',0.00,NULL,NULL),(20,41,'D600302','0020','Reversements cantine scolaires','Reversements cantine scolaires',35.00,NULL,NULL),(21,41,'D600303','0021',' Reversements manuel scolaires',' Reversements manuel scolaires',0.00,NULL,NULL),(22,41,'D600304','0022','Reversements des frais d’inscriptions aux examens BPC','Reversements des frais d’inscriptions aux examens',0.00,NULL,NULL),(23,41,'D600305','0023','Reversements des frais d’inscriptions aux examens BAC','Reversements des frais d’inscriptions aux examens',0.00,NULL,NULL),(24,4,'R100401','0024','APE Premier Cycle','APE Premier Cycle',0.00,NULL,NULL),(25,4,'R100402','0025','APE Second Cycle','APE Second Cycle',0.00,NULL,NULL),(26,3,'R100312','0026','Frais de participation','Frais de participation',0.00,NULL,NULL),(27,3,'R100313','0027','Frais de Cotisation spéciale','Frais de Cotisation spéciale',0.00,NULL,NULL),(28,3,'R100314','0028','Inscription aux examens du BAC','Inscription aux examens du BAC',0.00,NULL,NULL),(29,26,'D400101','1','CNSS Employeur','CNSS Employeur',0.00,NULL,NULL),(30,26,'D400102','1','CNSS Employé','CNSS Employé',0.00,NULL,NULL),(31,26,'D400103','1','Effort de guerre','Effort de guerre',0.00,NULL,NULL),(32,26,'D400104','1','Indemnité de logement','Indemnité de logement',0.00,NULL,NULL);
/*!40000 ALTER TABLE `pa_sous_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_version_ddl`
--

DROP TABLE IF EXISTS `pa_version_ddl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_version_ddl` (
  `LB_VERSION` varchar(120) NOT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`LB_VERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_version_ddl`
--

LOCK TABLES `pa_version_ddl` WRITE;
/*!40000 ALTER TABLE `pa_version_ddl` DISABLE KEYS */;
INSERT INTO `pa_version_ddl` VALUES ('0_GESTION_ETABLISSEMENT_COMPLET_V10.4.SQL','2026-07-22 11:06:37');
/*!40000 ALTER TABLE `pa_version_ddl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_absence_personnel`
--

DROP TABLE IF EXISTS `pe_absence_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_absence_personnel` (
  `ID_ABS_PERSONNEL` int NOT NULL AUTO_INCREMENT,
  `ID_PA_MOTF_ABS_PERS` int NOT NULL,
  `ID_PA_STATU_ABS_PERS` int NOT NULL,
  `DAT_DEB_ABS_PERSONNEL` datetime NOT NULL,
  `DAT_FIN_ABS_PERSONNEL` datetime DEFAULT NULL,
  `DESC_ABS_PERSONNEL` varchar(64) DEFAULT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `LIEU_ABSENCE` varchar(60) DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ABS_PERSONNEL`),
  KEY `I_FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB` (`ID_PA_MOTF_ABS_PERS`),
  KEY `I_FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB1` (`ID_PA_STATU_ABS_PERS`),
  KEY `I_FK_PE_ABSENCE_PERSONNEL_PE_PERSONNEL` (`ID_PERSONNEL`),
  KEY `FK_SE_USERNAME_CREA_PE_ABSENCE_PERSONNEL` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_ABSENCE_PERSONNEL` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_MOTF_ABS_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB1` FOREIGN KEY (`ID_PA_STATU_ABS_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_ABSENCE_PERSONNEL_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_ABSENCE_PERSONNEL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_ABSENCE_PERSONNEL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Absence Personnel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_absence_personnel`
--

LOCK TABLES `pe_absence_personnel` WRITE;
/*!40000 ALTER TABLE `pe_absence_personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_absence_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_note_personnel`
--

DROP TABLE IF EXISTS `pe_note_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_note_personnel` (
  `ID_NOTE_PERS` int NOT NULL AUTO_INCREMENT,
  `ID_PERSONNEL` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `NOTE_GLOB_PERS` decimal(6,2) NOT NULL,
  `DAT_NOTE_PERS` datetime NOT NULL,
  `LIEU_NOTE_PERS` varchar(64) NOT NULL,
  `LN_FICHIER_PROCES_VERBAL` varchar(1024) DEFAULT NULL,
  `COMMENT_NOTE_PERS` varchar(255) NOT NULL,
  `DAT_SIGN_PROCES_VERBAL_PERS` date DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_NOTE_PERS`),
  KEY `I_FK_PE_NOTE_PERSONNEL_PE_PERSONNEL` (`ID_PERSONNEL`),
  KEY `I_FK_PE_NOTE_PERSONNEL_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_SE_USERNAME_CREA_PE_NOTE_PERSONNEL` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_NOTE_PERSONNEL` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_NOTE_PERSONNEL_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_PE_NOTE_PERSONNEL_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_NOTE_PERSONNEL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_NOTE_PERSONNEL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_note_personnel`
--

LOCK TABLES `pe_note_personnel` WRITE;
/*!40000 ALTER TABLE `pe_note_personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_note_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_personnel`
--

DROP TABLE IF EXISTS `pe_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_personnel` (
  `ID_PERSONNEL` int NOT NULL AUTO_INCREMENT,
  `ID_PA_PRO_PERS` int DEFAULT NULL,
  `ID_PA_STATU_PERS` int NOT NULL,
  `ID_PA_TYP_PERS` int DEFAULT NULL,
  `ID_COM_NAIS_PERS` int DEFAULT NULL,
  `ID_PERSONNEL_RESP` int DEFAULT NULL,
  `ID_PAYS_NAIS_PERS` int NOT NULL,
  `NUM_MATR_PERS` varchar(32) NOT NULL,
  `NOM_PERS` varchar(64) NOT NULL,
  `PRENOM_PERS` varchar(64) NOT NULL,
  `SEX_PERS` char(1) NOT NULL DEFAULT 'F',
  `ADR_PERS` varchar(64) DEFAULT NULL,
  `ID_PA_SIT_MATRI` int DEFAULT NULL,
  `SECTEUR_PERS` varchar(64) DEFAULT NULL,
  `ARDMNT_PERS` varchar(64) DEFAULT NULL,
  `NBENFANT_PERS` smallint DEFAULT NULL,
  `DATE_NAIS_PERS` date DEFAULT NULL,
  `LIEN_SIGN_PERS` varchar(1024) DEFAULT NULL,
  `ECHEL_PERS` smallint DEFAULT NULL,
  `ECHELON_PERS` smallint DEFAULT NULL,
  `CATEG_PERS` varchar(10) DEFAULT NULL,
  `CLASSE_PERS` smallint DEFAULT NULL,
  `TEL_PERS` varchar(24) NOT NULL,
  `LIEU_NAIS_PERS` varchar(64) DEFAULT NULL,
  `ANCIENETE_MOIS_PERS` smallint DEFAULT NULL,
  `DAT_DEB_SERV_ETABL_PERS` date DEFAULT NULL,
  `DAT_FIN_SERV_ETABL_PERS` date DEFAULT NULL,
  `SAL_MENS_PERS` decimal(10,2) DEFAULT NULL,
  `LIEN_IMG_PERS` varchar(1024) DEFAULT NULL,
  `DAT_DEB_SERV_MENA` date DEFAULT NULL,
  `DAT_DEB_SERV_FONC_PUBL` date DEFAULT NULL,
  `TITRE_HONORIFIQ_1` varchar(250) DEFAULT NULL,
  `TITRE_HONORIFIQ_2` varchar(250) DEFAULT NULL,
  `TITRE_HONORIFIQ_3` varchar(250) DEFAULT NULL,
  `TOP_ACTI_HONORIFIQ_1` char(1) DEFAULT NULL,
  `TOP_ACTI_HONORIFIQ_2` char(1) DEFAULT NULL,
  `TOP_ACTI_HONORIFIQ_3` char(1) DEFAULT NULL,
  `ID_PA_FONC_REEL` int DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONNEL`),
  UNIQUE KEY `I_PU_PE_PERSONNEL` (`NUM_MATR_PERS`),
  UNIQUE KEY `I_FK_PE_PERSONNEL_PE_PERSONNEL` (`ID_PERSONNEL_RESP`),
  KEY `I_FK_PE_PERSONNEL_PA_PARAM_GLOB2` (`ID_PA_STATU_PERS`),
  KEY `I_FK_PE_PERSONNEL_PA_PARAM_TYPE` (`ID_PA_TYP_PERS`),
  KEY `I_FK_PE_PERSONNEL_PA_COMMUNE` (`ID_COM_NAIS_PERS`),
  KEY `I_FK_PE_PERSONNEL_PA_PAYS` (`ID_PAYS_NAIS_PERS`),
  KEY `I_FK_PE_PERSONNEL_PROFESSION` (`ID_PA_PRO_PERS`),
  KEY `I_FK_PE_PERSONNEL_PA_PARAM_GLOB_MATRI` (`ID_PA_SIT_MATRI`),
  KEY `FK_SE_USERNAME_CREA_PE_PERSONNEL` (`USERNAME_CREA`),
  KEY `FK_PE_PERSONNEL_PARAM_GLOB_FONCTION_REEL` (`ID_PA_FONC_REEL`),
  KEY `FK_SE_USERNAME_UPD_PE_PERSONNEL` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_PERSONNEL_PA_COMMUNE` FOREIGN KEY (`ID_COM_NAIS_PERS`) REFERENCES `pa_commune` (`ID_COM`),
  CONSTRAINT `FK_PE_PERSONNEL_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_STATU_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_PERSONNEL_PA_PARAM_TYPE` FOREIGN KEY (`ID_PA_TYP_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_PERSONNEL_PA_PAYS` FOREIGN KEY (`ID_PAYS_NAIS_PERS`) REFERENCES `pa_pays` (`ID_PAYS`),
  CONSTRAINT `FK_PE_PERSONNEL_PA_TYP_PERS` FOREIGN KEY (`ID_PA_TYP_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_PERSONNEL_PARAM_GLOB_FONCTION_REEL` FOREIGN KEY (`ID_PA_FONC_REEL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_PERSONNEL_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL_RESP`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_PE_PERSONNEL_PROFESSION` FOREIGN KEY (`ID_PA_PRO_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_PERSONNEL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_PERSONNEL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `I_FK_PE_PERSONNEL_PA_PARAM_GLOB_MATRI` FOREIGN KEY (`ID_PA_SIT_MATRI`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `pe_personnel_chk_1` CHECK ((`SEX_PERS` in (_utf8mb4'F',_utf8mb4'M')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Personnel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_personnel`
--

LOCK TABLES `pe_personnel` WRITE;
/*!40000 ALTER TABLE `pe_personnel` DISABLE KEYS */;
INSERT INTO `pe_personnel` VALUES (1,128,148,NULL,215,NULL,233,'MA001M','OUATTARA','Fousseni','M','',NULL,'','',0,'1990-07-31',NULL,NULL,0,'',NULL,'64390239','Bobo Dioulasso',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','o','o','o',NULL,'admin','2026-07-22 11:19:25','admin','2026-07-22 11:19:25');
/*!40000 ALTER TABLE `pe_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_professeur`
--

DROP TABLE IF EXISTS `pe_professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_professeur` (
  `ID_PERSONNEL` int NOT NULL,
  `ID_PA_TITR_CAPA` int DEFAULT NULL,
  `NB_HEUR_HBD_REGLMEN` smallint DEFAULT NULL,
  `NB_HEUR_HBD_SUPLMEN` smallint DEFAULT '0',
  `NB_HEUR_MENS_REGLMEN` smallint DEFAULT NULL,
  `NB_HEUR_MENS_SUPLMEN` smallint DEFAULT '0',
  `TAUX_HORAIRE` decimal(8,2) DEFAULT NULL,
  `TITR_CAPA` varchar(25) DEFAULT NULL,
  `REF_AUTO_ENSEIGN` varchar(64) NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONNEL`),
  KEY `I_FK_pe_professeur_PA_PARAM_GLOB_TITR` (`ID_PA_TITR_CAPA`),
  KEY `FK_SE_USERNAME_CREA_PE_PROFESSEUR` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_PROFESSEUR` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_PROFESSEUR_PA_PARAM_GLOB_TITR` FOREIGN KEY (`ID_PA_TITR_CAPA`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_PROFESSEUR_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_PROFESSEUR` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_PROFESSEUR` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Professeur';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_professeur`
--

LOCK TABLES `pe_professeur` WRITE;
/*!40000 ALTER TABLE `pe_professeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_rel_detail_note_personnel`
--

DROP TABLE IF EXISTS `pe_rel_detail_note_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_rel_detail_note_personnel` (
  `NOTE_PERS` decimal(6,2) NOT NULL,
  `ID_PA_DETAIL_NOTE_PERS` int NOT NULL,
  `ID_NOTE_PERS` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_DETAIL_NOTE_PERS`,`ID_NOTE_PERS`),
  KEY `I_FK_PE_REL_DETAIL_NOTE_PERSONNEL_PA_PARAM_GLOB` (`ID_PA_DETAIL_NOTE_PERS`),
  KEY `I_FK_PE_REL_DETAIL_NOTE_PERSONNEL_PE_NOTE_PERSONNEL` (`ID_NOTE_PERS`),
  KEY `FK_SE_USERNAME_CREA_PE_REL_DETAIL_NOTE_PERSONNEL` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_REL_DETAIL_NOTE_PERSONNEL` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_REL_DETAIL_NOTE_PERSONNEL_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_DETAIL_NOTE_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_REL_DETAIL_NOTE_PERSONNEL_PE_NOTE_PERSONNEL` FOREIGN KEY (`ID_NOTE_PERS`) REFERENCES `pe_note_personnel` (`ID_NOTE_PERS`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_REL_DETAIL_NOTE_PERSONNEL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_REL_DETAIL_NOTE_PERSONNEL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_rel_detail_note_personnel`
--

LOCK TABLES `pe_rel_detail_note_personnel` WRITE;
/*!40000 ALTER TABLE `pe_rel_detail_note_personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_rel_detail_note_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_rel_diplome_personnel`
--

DROP TABLE IF EXISTS `pe_rel_diplome_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_rel_diplome_personnel` (
  `ID_PERSONNEL` int NOT NULL,
  `ID_PA_DIPLOME` int NOT NULL,
  `DAT_DIPLOM_PERSONNEL` date DEFAULT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONNEL`,`ID_PA_DIPLOME`),
  KEY `I_FK_PE_REL_DIPLOME_PERSONNEL_PE_PERSONNEL` (`ID_PERSONNEL`),
  KEY `I_FK_PE_REL_DIPLOME_PERSONNEL_PA_PARAM_GLOB` (`ID_PA_DIPLOME`),
  KEY `FK_SE_USERNAME_CREA_PE_REL_DIPLOME_PERSONNEL` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_REL_DIPLOME_PERSONNEL` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_REL_DIPLOME_PERSONNEL_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_DIPLOME`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_REL_DIPLOME_PERSONNEL_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_REL_DIPLOME_PERSONNEL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_REL_DIPLOME_PERSONNEL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Diplome Personnel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_rel_diplome_personnel`
--

LOCK TABLES `pe_rel_diplome_personnel` WRITE;
/*!40000 ALTER TABLE `pe_rel_diplome_personnel` DISABLE KEYS */;
INSERT INTO `pe_rel_diplome_personnel` VALUES (1,27,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pe_rel_diplome_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_rel_fonction`
--

DROP TABLE IF EXISTS `pe_rel_fonction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_rel_fonction` (
  `ID_ETAB` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `ID_PA_FONCTION` int NOT NULL,
  `DAT_DEB_FONCTION` date NOT NULL,
  `FLAG_ACTF_FONCTION` char(1) NOT NULL DEFAULT 'O',
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ETAB`,`ID_PERSONNEL`,`DAT_DEB_FONCTION`),
  KEY `I_FK_PE_REL_FONCTION_PA_ETABLISSEMENT` (`ID_ETAB`),
  KEY `I_FK_PE_REL_FONCTION_PE_PERSONNEL` (`ID_PERSONNEL`),
  KEY `I_FK_PE_REL_FONCTION_PA_PARAM_GLOB` (`ID_PA_FONCTION`),
  KEY `FK_SE_USERNAME_CREA_PE_REL_FONCTION` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_REL_FONCTION` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_REL_FONCTION_PA_ETABLISSEMENT` FOREIGN KEY (`ID_ETAB`) REFERENCES `pa_etablissement` (`ID_ETAB`),
  CONSTRAINT `FK_PE_REL_FONCTION_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_FONCTION`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_REL_FONCTION_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_REL_FONCTION` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_REL_FONCTION` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `pe_rel_fonction_chk_1` CHECK ((`FLAG_ACTF_FONCTION` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Fonction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_rel_fonction`
--

LOCK TABLES `pe_rel_fonction` WRITE;
/*!40000 ALTER TABLE `pe_rel_fonction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_rel_fonction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_rel_formation_personnel`
--

DROP TABLE IF EXISTS `pe_rel_formation_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_rel_formation_personnel` (
  `ID_PA_FORMATION_PERS` int NOT NULL,
  `ID_PERSONNEL` int NOT NULL,
  `LB_FORM_PERS` varchar(64) NOT NULL,
  `DAT_DEB_FORM_PERS` datetime NOT NULL,
  `DAT_FIN_FORM_PERS` datetime NOT NULL,
  `LIEU_FORM_PERS` varchar(128) NOT NULL,
  `MOTF_FORM_PERS` varchar(128) NOT NULL,
  `ID_PA_STATU_FORM_PERS` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PA_FORMATION_PERS`,`ID_PERSONNEL`),
  KEY `I_FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB` (`ID_PA_FORMATION_PERS`),
  KEY `I_FK_PE_REL_FORMATION_PERSONNEL_PE_PERSONNEL` (`ID_PERSONNEL`),
  KEY `I_FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB2` (`ID_PA_STATU_FORM_PERS`),
  KEY `FK_SE_USERNAME_CREA_PE_REL_FORMATION_PERSONNEL` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_REL_FORMATION_PERSONNEL` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB` FOREIGN KEY (`ID_PA_FORMATION_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB2` FOREIGN KEY (`ID_PA_STATU_FORM_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_PE_REL_FORMATION_PERSONNEL_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_REL_FORMATION_PERSONNEL` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_REL_FORMATION_PERSONNEL` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Formation Personnel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_rel_formation_personnel`
--

LOCK TABLES `pe_rel_formation_personnel` WRITE;
/*!40000 ALTER TABLE `pe_rel_formation_personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_rel_formation_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe_rel_matiere_professeur`
--

DROP TABLE IF EXISTS `pe_rel_matiere_professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe_rel_matiere_professeur` (
  `ID_PERSONNEL` int NOT NULL,
  `ID_MATIERE` int NOT NULL,
  `USERNAME_CREA` varchar(45) DEFAULT NULL,
  `TS_CREA` datetime DEFAULT NULL,
  `USERNAME_UPD` varchar(45) DEFAULT NULL,
  `TS_MAJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONNEL`,`ID_MATIERE`),
  KEY `I_FK_PE_REL_MATIERE_PROFESSEUR_PE_PROFESSEUR` (`ID_PERSONNEL`),
  KEY `I_FK_PE_REL_MATIERE_PROFESSEUR_PA_MATIERE` (`ID_MATIERE`),
  KEY `FK_SE_USERNAME_CREA_PE_REL_MATIERE_PROFESSEUR` (`USERNAME_CREA`),
  KEY `FK_SE_USERNAME_UPD_PE_REL_MATIERE_PROFESSEUR` (`USERNAME_UPD`),
  CONSTRAINT `FK_PE_REL_MATIERE_PROFESSEUR_PA_MATIERE` FOREIGN KEY (`ID_MATIERE`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_PE_REL_MATIERE_PROFESSEUR_PE_PROFESSEUR` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_professeur` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERNAME_CREA_PE_REL_MATIERE_PROFESSEUR` FOREIGN KEY (`USERNAME_CREA`) REFERENCES `se_users` (`USERNAME`),
  CONSTRAINT `FK_SE_USERNAME_UPD_PE_REL_MATIERE_PROFESSEUR` FOREIGN KEY (`USERNAME_UPD`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Matiere Professeur';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe_rel_matiere_professeur`
--

LOCK TABLES `pe_rel_matiere_professeur` WRITE;
/*!40000 ALTER TABLE `pe_rel_matiere_professeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_rel_matiere_professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_fonctionnalites`
--

DROP TABLE IF EXISTS `se_fonctionnalites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_fonctionnalites` (
  `CODE_FONCTION` varchar(10) NOT NULL,
  `CODE_FONCTION_HIERA` varchar(10) DEFAULT NULL,
  `NAME_FONCTION` varchar(45) NOT NULL,
  `DESCRIPT_FONCTION` varchar(255) NOT NULL,
  `ENABLED` char(1) NOT NULL,
  `NUMERO_ORDRE` int NOT NULL,
  PRIMARY KEY (`CODE_FONCTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_fonctionnalites`
--

LOCK TABLES `se_fonctionnalites` WRITE;
/*!40000 ALTER TABLE `se_fonctionnalites` DISABLE KEYS */;
INSERT INTO `se_fonctionnalites` VALUES ('F11',NULL,'ELEVE','Module eleve','1',1),('F111','F11','LISTELEVE','Module eleve liste','1',111),('F112','F11','INSCRIPTION','Module eleve inscription','1',132),('F1121','F112','INSCRIPTIONIND','Module eleve inscription individuel','1',122),('F1122','F112','INSCRIPTIONLOT','Module eleve inscription lot','1',121),('F113','F11','ABSENCES','Module eleve absences','1',143),('F114','F11','INCIDENT','Module eleve incidents','1',154),('F115','F11','DOCUMENT','Module eleve documents administratifs','1',165),('F1151','F115','CIS','Carte d\'Identé Scolaire ','0',151),('F116','F11','BOURSE','Module eleve bourses','0',176),('F117','F11','STATITSITIQUE','Module eleve statistiques','1',187),('F1171','F117','STATITSITIQUEGLOB','Module eleve statistiques globale','1',171),('F1172','F117','STATITSITIQUENIV','Module eleve statistiques niveau','1',172),('F1173','F117','STATITSITIQUECLA','Module eleve statistiques classe','1',173),('F1174','F117','STATITSITIQUEAGE','Module eleve statistiques age','1',174),('F1175','F117','STATITSITIQUESOP','Module eleve statistiques socio professionnel parent','1',175),('F1176','F117','STATITSITIQUESOE','Module eleve statistiques situation sociale','1',176),('F118','F11','INSCRIPTION MODIFICATION','Module eleve inscription individuel modification','1',1198),('F119','F11','LISTELEVEINSCRIT','Module eleve liste inscrit','1',129),('F20',NULL,'EVALUATION','Module evaluation','1',2),('F201','F20','EVALPARAM','Module evaluation parametre','1',21),('F2011','F201','PARAMOUVP','Module evaluation parametre ouverture periode','1',2011),('F2012','F201','PARAMCOEFFEVAL','Module evaluation parametre coefficient evaluation','1',2012),('F2013','F201','COEFFTYPEVALMAT','Module evaluation parametre coefficient type evaluation matiere','1',2013),('F2014','F201','PARAMAPP','Module evaluation parametre appreciation','1',20214),('F2015','F201','PARAMREGLE','MODULE EVALUATION PARAMÈTRE RÈGLE ATTRIB TH CONDUITE','1',20215),('F202','F20','PLANEVALUA','Module evaluation planing evaluation','1',22),('F2021','F202','EVALPLANBUTLOT','Button action en lot','1',2021),('F203','F20','SAISINOTE','Module evaluation saisi note','1',23),('F2031','F203','LISTNOTE','Module evaluation saisi note liste note','1',231),('F2032','F203','ENREGNOTE','Module evaluation saisi note enregistrer note','1',232),('F2033','F203','VALIDNOTE','Module evaluation saisi note valider note','1',233),('F204','F20','CALCULMOY','Module evaluation calculer Moyenne','1',24),('F2042','F204','CALCULMOYMAT','Module evaluation calculer Moyenne Matiere','1',242),('F2043','F204','CALCULMOYPER','Module evaluation calculer Moyenne période','1',244),('F2044','F204','CALCULMOYGEN','Module evaluation calculer Moyenne général','1',245),('F2045','F204','CALCULMOYMOD','Module evaluation calculer Moyenne Module','1',243),('F205','F20','CALCULMOY','Module evaluation Bulletin','1',25),('F206','F20','STATISTIQ','Module evaluation statistique','1',26),('F2061','F206','STATISTIQSP','Module evaluation statistique periode','1',261),('F2062','F206','STATISTIQSA','Module evaluation statistique annuelle','1',262),('F2063','F206','STATISTIQSD','Module evaluation statistique detail','1',263),('F34',NULL,'COMPTABILITE','Module comptabilité','1',3),('F341','F34','COMPTABILITEP','Module comptabilité paramètre','1',31),('F3411','F341','COMPTABILITEPP','Module comptabilité paramètre scolarité','1',311),('F3412','F341','COMPTABILITEPS','Module comptabilité paramètre paie personnel','1',312),('F3413','F341','COMPTABILITEPEC','comptabilité paramètrage des échéances de payements','1',313),('F342','F34','COMPTABILITEREC','Module comptabilité recette','1',32),('F3421','F342','COMPTABILITERECEL','Module comptabilité recette élève','1',321),('F34211','F3421','VALIDERIMPRIMERDOUBLE','Boutton pour valider et imprimer en double un paiement de recette eleve','1',3),('F34212','F3421','VALIDERIMPRIMER','Boutton pour valider et imprimer un paiement de recette eleve','0',3),('F3422','F342','COMPTABILITERECAU','Module comptabilité recette autres','1',322),('F3423','F342','COMPTABILITERECAUTEL','Module comptabilité autre recette élève','1',323),('F343','F34','COMPTABILITEDEP','Module comptabilité depense','1',33),('F3431','F343','COMPTABILITEDEPPP','Module comptabilité paie professeur','1',331),('F3432','F343','COMPTABILITEDEPAU','Module comptabilité depense autres','1',332),('F3433','F343','COMPTABILITERECBO','Module comptabilité dépense bourse','1',333),('F3434','F343','COMPTABILITECREDIT','Module comptabilité pour octroyer du crédit au personnel','1',334),('F344','F34','COMPTABILITESTAT','Module comptabilité statistiques','1',34),('F3441','F344','COMPTABILITESTATGV','Module comptabilité statistiques vision global','1',3441),('F3442','F344','COMPTABILITESTATRECET','Module comptabilité  statistiques recettes détaillées','1',3442),('F3443','F344','COMPTABILITESTATSCOLELV','Module comptabilité  statistiques scolarités détaillées','1',3443),('F3444','F344','COMPTABILITESTATAN','Module comptabilité  statistiques recettes détaillées','1',3444),('F345','F34','COMPTABILITECAI','Comptabilité  Caisse','1',35),('F3451','F345','COMPTABILITECAIP','comptabilité paramètre Caisse','1',351),('F3452','F345','COMPTABILITETRANSF','comptabilité transferts de fonds','1',352),('F3453','F345','COMPTABILITE_STATCC','Module comptabilité statistiques etat connexion caisse et détails transaction','1',353),('F346','F34','COMPTABILITEANNULOP','Module comptabilité  annuler opération','1',37),('F43',NULL,'EMPLOI DU TEMPS','Module emploi du temps','1',4),('F431','F43','EMPLOI DU TEMPS LISTER','Module emploi du temps afficher emploi','1',41),('F4311','F431','EMPLOI DU TEMPS LISTER Heure','Module emploi du temps afficher emploi Heure','1',411),('F4312','F431','EMPLOI DU TEMPS LISTER Minutes','Module emploi du temps afficher emploi Minutes','1',412),('F432','F43','EMPLOI DU TEMPS CAHIER DE TEXTE','Module emploi du temps cahier de texte','1',42),('F433','F43','EMPLOI DU TEMPS AFFECTATION','Module emploi du temps affectation classe professeur','1',43),('F434','F43','EMPLOI DU TEMPS GENERATION','Module emploi du temps génération emploi du temps','1',44),('F4341','F434','EMPLOI DU TEMPS GENERATION DISPO CLASSE','Module emploi du temps génération emploi du temps diponibilité clase','1',441),('F4342','F434','EMPLOI DU TEMPS GENERATION DISPO ENSEIGNANT','Module emploi du temps génération emploi du temps diponibilité enseignant','1',442),('F4343','F434','EMPLOI DU TEMPS GENERATION PARAM PAUSE','Module emploi du temps génération emploi du temps paramètre pause','1',443),('F4344','F434','EMPLOI DU TEMPS GENERATION PARAM CLASSE','Module emploi du temps génération emploi du temps paramètre classe','1',444),('F4345','F434','EMPLOI DU TEMPS GENERATION PARAM ENSEIGNANT','Module emploi du temps génération emploi du temps paramètre ensignant','1',445),('F4346','F434','EMPLOI DU TEMPS GENERATION GENERER','Module emploi du temps génération emploi du temps générer','1',446),('F435','F43','EMPLOI DU TEMPS STATISTIQUES','Module emploi du temps statistiques','1',45),('F4351','F435','EMPLOI DU TEMPS STATISTIQUES ENSEIGN GLOB','Module emploi du temps statistiques vision enseignant globale','1',451),('F4352','F435','EMPLOI DU TEMPS STATISTIQUES ENSEIGN PRDE','Module emploi du temps statistiques vision enseignant periode','1',452),('F4353','F435','EMPLOI DU TEMPS STATISTIQUES CLASSE GLOB','Module emploi du temps statistiques vision classe globale','1',453),('F4354','F435','EMPLOI DU TEMPS STATISTIQUES CLASSE PRDE','Module emploi du temps statistiques vision classe période','1',454),('F52',NULL,'PERSONNEL','Module personnel','1',5),('F521','F52','PERSONNELLIST','Module personnel lister','1',51),('F522','F52','PERSONNELADD','Module personnel ajouter','1',52),('F523','F52','PERSONNELABS','Module personnel absence','1',53),('F524','F52','PERSONNELFORM','Module personnel formation','1',54),('F525','F52','PERSONNELSTAT','Module personnel statitiques','1',55),('F5251','F525','PERSONNELSTATDIST','Module personnel statitiques par Dicipline table','1',551),('F5252','F525','PERSONNELSTATDISG','Module personnel statitiques par Dicipline graphique','1',552),('F5253','F525','PERSONNELSTATSFOT','Module personnel statitiques par statut et fonction table','1',553),('F5254','F525','PERSONNELSTATSFOG','Module personnel statitiques par statut et fonction graphique','1',554),('F60',NULL,'GESTIONROLES','Module gestion de roles','1',7),('F601','F60','GESTION ROLES','Module gestion de roles','1',71),('F602','F60','GESTION ROLES','Module gestion de roles','1',72),('F603','F60','AJOUTER FONCTIONNALITE','ajout fonctionnalités','1',73),('F65',NULL,'PARAMETRAGE','Module de paramétrage','1',6),('F651','F65','PARAMETRAGE ETAB','Module de paramétrage etablissement','1',61),('F6511','F651','PARAMETRAGE ETAB INFORMATION','Module de paramétrage des informations de l\'etablissement','1',611),('F6512','F651','PARAMETRAGE ETAB PARTENAIRE','Module de paramétrage des partenaires de l\'etablissement','1',612),('F652','F65','PARAMETRAGE MATIERE NIV','Module de paramétrage matiere et niveau','1',62),('F6521','F652','PARAMETRAGE MATIERE','Module de paramétrage matiere','1',621),('F6522','F652','PARAMETRAGE NIVEAU','Module de paramétrage niveau','1',622),('F6523','F652','PARAMETRAGE MATIERE NIV','Module de paramétrage matiere et niveau','1',623),('F6524','F652','PARAMETRAGEMODULE','Module de paramétrage module','1',6524),('F653','F65','PARAMETRAGE CLASSE SALLE','Module de paramétrage classe salle','1',63),('F6531','F653','PARAMETRAGE CLASSE','Module de paramétrage classe','1',631),('F6532','F653','PARAMETRAGE SALLE','Module de paramétrage Salle','1',632),('F6533','F653','PARAMETRAGE BATIMENT','Module de paramétrage Batiment','1',633),('F654','F65','PARAMETRAGE INTENDANCE','Module de paramétrage intendance','1',64),('F6541','F654','PARAMETRAGE INTENDANCE CHAPITRE','Module de paramétrage intendance chapitre','1',641),('F6542','F654','PARAMETRAGE INTENDANCE ARTICLE','Module de paramétrage intendance article','1',642),('F6543','F654','PARAMETRAGE INTENDANCE SOUS ARTICLE','Module de paramétrage intendance sous article','1',643),('F655','F65','PARAMETRAGE GLOBAUX','Module de paramétrage globale','1',65),('F656','F65','Données de references','Données de references','1',66),('F6561','F656','PARAMETRAGE CALENDRIER SCOLAIRE','Module de paramétrage Calendrier scolaire','1',6561),('F6562','F65','PARAMETRAGE DECOUPAGE ADMINISTRATIF','Module de paramétrage découpage administratif','1',6562),('F6563','F65','PARAMETRAGE CIRCONSCRIPTION','Module de paramétrage circonscription','1',6563),('F659','F65','PARAMETRAGE LISTE ETABLISSEMENT','Module de paramétrage pour la liste des établissement','1',659),('F76',NULL,'STATISTIQUES','Module statistiques','1',8),('F761','F76','STATISTIQUES RAPPORT TRIMESTRE','Module statistiques rapport trimestriel','1',61),('F762','F76','STATISTIQUES RAPPORT ANNUEL','Module statistiques rapport annuel','1',62),('F763','F76','STATISTIQUES DES ELEVES','Module statistiques pour les élèves','1',63),('F764','F76','STATISTIQUES DU PERSONNEL','Module statistiques pour le personnel','1',64),('F765','F76','STATISTIQUES DU COMPTABILITE','Module statistiques pour la comptabilité','1',65),('F81',NULL,'PREFERENCE','THEME PREFERENCE','1',9);
/*!40000 ALTER TABLE `se_fonctionnalites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_histo_conxion_appl`
--

DROP TABLE IF EXISTS `se_histo_conxion_appl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_histo_conxion_appl` (
  `ID_CONXION_APPL` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `IP_ADRES` varchar(128) DEFAULT NULL,
  `MAC_ADRES` varchar(128) DEFAULT NULL,
  `DAT_CONXION` datetime NOT NULL,
  `DAT_DECONXION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CONXION_APPL`),
  KEY `I_FK_SE_HISTO_CONXION_APPL_SE_USERS` (`USERNAME`),
  CONSTRAINT `FK_SE_HISTO_CONXION_APPL_SE_USERS` FOREIGN KEY (`USERNAME`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_histo_conxion_appl`
--

LOCK TABLES `se_histo_conxion_appl` WRITE;
/*!40000 ALTER TABLE `se_histo_conxion_appl` DISABLE KEYS */;
INSERT INTO `se_histo_conxion_appl` VALUES (1,'admin','192.168.5.1','DESKTOP-AFE0ERQ','2026-07-22 11:10:37',NULL),(2,'admin','192.168.5.1','DESKTOP-AFE0ERQ','2026-07-22 11:15:21',NULL);
/*!40000 ALTER TABLE `se_histo_conxion_appl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_rel_roles_fonctionnalites`
--

DROP TABLE IF EXISTS `se_rel_roles_fonctionnalites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_rel_roles_fonctionnalites` (
  `CODE_FONCTION` varchar(10) NOT NULL,
  `CODE_ROLE` varchar(10) NOT NULL,
  PRIMARY KEY (`CODE_ROLE`,`CODE_FONCTION`),
  KEY `I_FK_SE_REL_ROLES_FONCTIONNALITES_FONCTIONCODE` (`CODE_FONCTION`),
  KEY `I_FK_SE_REL_ROLES_FONCTIONNALITES_ROLECODE` (`CODE_ROLE`),
  CONSTRAINT `FK_SE_REL_ROLES_FONCTIONNALITES_FONCTIONCODE` FOREIGN KEY (`CODE_FONCTION`) REFERENCES `se_fonctionnalites` (`CODE_FONCTION`),
  CONSTRAINT `FK_SE_REL_ROLES_FONCTIONNALITES_ROLECODE` FOREIGN KEY (`CODE_ROLE`) REFERENCES `se_roles` (`CODE_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_rel_roles_fonctionnalites`
--

LOCK TABLES `se_rel_roles_fonctionnalites` WRITE;
/*!40000 ALTER TABLE `se_rel_roles_fonctionnalites` DISABLE KEYS */;
INSERT INTO `se_rel_roles_fonctionnalites` VALUES ('F11','R0'),('F11','R1'),('F11','R3'),('F11','R6'),('F111','R0'),('F111','R1'),('F111','R3'),('F111','R6'),('F112','R0'),('F112','R1'),('F112','R3'),('F112','R6'),('F1121','R0'),('F1121','R1'),('F1121','R6'),('F1122','R0'),('F1122','R1'),('F1122','R3'),('F1122','R6'),('F113','R0'),('F113','R1'),('F113','R3'),('F113','R6'),('F114','R0'),('F114','R1'),('F114','R3'),('F114','R6'),('F115','R0'),('F115','R1'),('F115','R3'),('F115','R6'),('F1151','R6'),('F116','R0'),('F116','R1'),('F116','R3'),('F116','R6'),('F117','R0'),('F117','R1'),('F117','R3'),('F117','R6'),('F1171','R0'),('F1171','R1'),('F1171','R3'),('F1171','R6'),('F1172','R0'),('F1172','R1'),('F1172','R3'),('F1172','R6'),('F1173','R0'),('F1173','R1'),('F1173','R3'),('F1173','R6'),('F1174','R0'),('F1174','R1'),('F1174','R3'),('F1174','R6'),('F1175','R0'),('F1175','R1'),('F1175','R3'),('F1175','R6'),('F1176','R0'),('F1176','R1'),('F1176','R3'),('F1176','R6'),('F118','R6'),('F119','R0'),('F119','R1'),('F119','R3'),('F119','R6'),('F20','R0'),('F20','R1'),('F20','R3'),('F20','R5'),('F20','R6'),('F201','R0'),('F201','R6'),('F2011','R0'),('F2011','R6'),('F2012','R0'),('F2012','R1'),('F2012','R6'),('F2013','R0'),('F2013','R6'),('F2014','R0'),('F2014','R6'),('F2015','R0'),('F2015','R6'),('F202','R0'),('F202','R1'),('F202','R5'),('F202','R6'),('F2021','R0'),('F2021','R1'),('F2021','R6'),('F203','R0'),('F203','R1'),('F203','R3'),('F203','R5'),('F203','R6'),('F2031','R0'),('F2031','R1'),('F2031','R3'),('F2031','R5'),('F2031','R6'),('F2032','R0'),('F2032','R1'),('F2032','R5'),('F2032','R6'),('F2033','R0'),('F2033','R1'),('F2033','R6'),('F204','R0'),('F204','R1'),('F204','R5'),('F204','R6'),('F2042','R0'),('F2042','R1'),('F2042','R5'),('F2042','R6'),('F2043','R0'),('F2043','R1'),('F2043','R5'),('F2043','R6'),('F2044','R0'),('F2044','R1'),('F2044','R6'),('F2045','R0'),('F2045','R1'),('F2045','R6'),('F205','R0'),('F205','R1'),('F205','R6'),('F206','R0'),('F206','R1'),('F206','R6'),('F2061','R0'),('F2061','R1'),('F2061','R6'),('F2062','R0'),('F2062','R1'),('F2062','R6'),('F2063','R0'),('F2063','R1'),('F2063','R6'),('F34','R0'),('F34','R2'),('F34','R6'),('F34','R7'),('F341','R0'),('F341','R2'),('F341','R6'),('F341','R7'),('F3411','R0'),('F3411','R2'),('F3411','R6'),('F3411','R7'),('F3412','R0'),('F3412','R2'),('F3412','R6'),('F3412','R7'),('F3413','R6'),('F342','R0'),('F342','R2'),('F342','R6'),('F342','R7'),('F3421','R0'),('F3421','R2'),('F3421','R6'),('F3421','R7'),('F34211','R0'),('F34211','R2'),('F34211','R6'),('F34211','R7'),('F34212','R0'),('F34212','R2'),('F34212','R6'),('F34212','R7'),('F3422','R0'),('F3422','R2'),('F3422','R6'),('F3422','R7'),('F3423','R0'),('F3423','R2'),('F3423','R6'),('F3423','R7'),('F343','R0'),('F343','R2'),('F343','R6'),('F343','R7'),('F3431','R0'),('F3431','R2'),('F3431','R6'),('F3431','R7'),('F3432','R0'),('F3432','R2'),('F3432','R6'),('F3432','R7'),('F3433','R0'),('F3433','R2'),('F3433','R6'),('F3433','R7'),('F3434','R2'),('F3434','R6'),('F344','R0'),('F344','R2'),('F344','R6'),('F344','R7'),('F3441','R0'),('F3441','R2'),('F3441','R6'),('F3441','R7'),('F3442','R0'),('F3442','R2'),('F3442','R6'),('F3442','R7'),('F3443','R0'),('F3443','R2'),('F3443','R6'),('F3443','R7'),('F3444','R0'),('F3444','R2'),('F3444','R6'),('F3444','R7'),('F345','R0'),('F345','R2'),('F345','R6'),('F345','R7'),('F3451','R0'),('F3451','R2'),('F3451','R6'),('F3451','R7'),('F3452','R0'),('F3452','R2'),('F3452','R6'),('F3452','R7'),('F3453','R0'),('F3453','R2'),('F3453','R6'),('F3453','R7'),('F346','R0'),('F346','R2'),('F346','R6'),('F346','R7'),('F43','R0'),('F43','R1'),('F43','R6'),('F431','R0'),('F431','R1'),('F431','R6'),('F4311','R0'),('F4311','R1'),('F4311','R6'),('F4312','R0'),('F4312','R1'),('F4312','R6'),('F432','R0'),('F432','R1'),('F432','R6'),('F433','R0'),('F433','R1'),('F433','R6'),('F434','R0'),('F434','R1'),('F434','R6'),('F4341','R0'),('F4341','R1'),('F4341','R6'),('F4342','R0'),('F4342','R1'),('F4342','R6'),('F4343','R0'),('F4343','R1'),('F4343','R6'),('F4344','R0'),('F4344','R1'),('F4344','R6'),('F4345','R0'),('F4345','R1'),('F4345','R6'),('F4346','R0'),('F4346','R1'),('F4346','R6'),('F435','R0'),('F435','R1'),('F435','R6'),('F4351','R0'),('F4351','R1'),('F4351','R6'),('F4352','R0'),('F4352','R1'),('F4352','R6'),('F4353','R0'),('F4353','R1'),('F4353','R6'),('F4354','R0'),('F4354','R1'),('F4354','R6'),('F52','R0'),('F52','R1'),('F52','R6'),('F521','R0'),('F521','R1'),('F521','R6'),('F522','R0'),('F522','R1'),('F522','R6'),('F523','R0'),('F523','R1'),('F523','R6'),('F524','R0'),('F524','R1'),('F524','R6'),('F525','R0'),('F525','R1'),('F525','R6'),('F5251','R0'),('F5251','R1'),('F5251','R6'),('F5252','R0'),('F5252','R1'),('F5252','R6'),('F5253','R0'),('F5253','R1'),('F5253','R6'),('F5254','R0'),('F5254','R1'),('F5254','R6'),('F60','R0'),('F60','R6'),('F601','R0'),('F601','R6'),('F602','R0'),('F602','R6'),('F603','R0'),('F603','R6'),('F65','R0'),('F65','R2'),('F65','R6'),('F65','R7'),('F651','R0'),('F651','R6'),('F6511','R6'),('F6512','R6'),('F652','R0'),('F652','R6'),('F6521','R0'),('F6521','R6'),('F6522','R0'),('F6522','R6'),('F6523','R0'),('F6523','R6'),('F6524','R0'),('F6524','R6'),('F653','R0'),('F653','R6'),('F6531','R0'),('F6531','R6'),('F6532','R0'),('F6532','R6'),('F6533','R0'),('F6533','R6'),('F654','R0'),('F654','R2'),('F654','R6'),('F654','R7'),('F6541','R0'),('F6541','R2'),('F6541','R6'),('F6541','R7'),('F6542','R0'),('F6542','R2'),('F6542','R6'),('F6542','R7'),('F6543','R0'),('F6543','R2'),('F6543','R6'),('F6543','R7'),('F655','R0'),('F655','R6'),('F656','R0'),('F656','R6'),('F6561','R0'),('F6561','R6'),('F6562','R0'),('F6562','R6'),('F6563','R6'),('F659','R6'),('F76','R0'),('F76','R6'),('F761','R0'),('F761','R6'),('F762','R0'),('F762','R6'),('F81','R0'),('F81','R1'),('F81','R6');
/*!40000 ALTER TABLE `se_rel_roles_fonctionnalites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_rel_users_roles`
--

DROP TABLE IF EXISTS `se_rel_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_rel_users_roles` (
  `CODE_ROLE` varchar(10) NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  PRIMARY KEY (`USERNAME`,`CODE_ROLE`),
  KEY `I_FK_SE_USERNAME_ROLES` (`USERNAME`),
  KEY `I_FK_SE_SE_ROLECODE_USERS` (`CODE_ROLE`),
  CONSTRAINT `FK_SE_SE_ROLECODE_USERS` FOREIGN KEY (`CODE_ROLE`) REFERENCES `se_roles` (`CODE_ROLE`),
  CONSTRAINT `FK_SE_USERNAME_ROLE` FOREIGN KEY (`USERNAME`) REFERENCES `se_users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_rel_users_roles`
--

LOCK TABLES `se_rel_users_roles` WRITE;
/*!40000 ALTER TABLE `se_rel_users_roles` DISABLE KEYS */;
INSERT INTO `se_rel_users_roles` VALUES ('R0','uprov'),('R1','ucens'),('R2','ucompt'),('R6','admin');
/*!40000 ALTER TABLE `se_rel_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_roles`
--

DROP TABLE IF EXISTS `se_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_roles` (
  `CODE_ROLE` varchar(10) NOT NULL,
  `NAME_ROLE` varchar(45) NOT NULL,
  `DESCRIPT_ROLE` varchar(255) NOT NULL,
  PRIMARY KEY (`CODE_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_roles`
--

LOCK TABLES `se_roles` WRITE;
/*!40000 ALTER TABLE `se_roles` DISABLE KEYS */;
INSERT INTO `se_roles` VALUES ('R0','PROVISEUR','proviseur'),('R1','CENSEUR','CENSEUR'),('R2','COMPTABLE','COMPTABLE'),('R3','CONSEILLER','CONSEILLER'),('R4','SURVEILLANT','SURVEILLANT'),('R5','ENSEIGNANT','ENSEIGNANT'),('R6','ADMIN','ADMIN'),('R7','INTENDANT','INTENDANT');
/*!40000 ALTER TABLE `se_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_users`
--

DROP TABLE IF EXISTS `se_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_users` (
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ID_PERSONNEL` int DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '1',
  `USERNAME_LABEL` varchar(45) NOT NULL,
  `FL_ACTIF` varchar(1) DEFAULT 'O',
  PRIMARY KEY (`USERNAME`),
  UNIQUE KEY `USERNAME_LABEL` (`USERNAME_LABEL`),
  KEY `I_FK_SE_USERNAME_PE_PERSONNEL` (`ID_PERSONNEL`),
  CONSTRAINT `FK_SE_USERS_PE_PERSONNEL` FOREIGN KEY (`ID_PERSONNEL`) REFERENCES `pe_personnel` (`ID_PERSONNEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_users`
--

LOCK TABLES `se_users` WRITE;
/*!40000 ALTER TABLE `se_users` DISABLE KEYS */;
INSERT INTO `se_users` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3',NULL,1,'admin','O'),('ucens','933973208baa8c48aa09a412e2ea6c3d',NULL,1,'ucens','O'),('ucompt','24f8ddea752133a66bbe6698ecfd57b8',NULL,1,'ucompt','O'),('uprov','8675ccbca6ab0c2e3d202e0fb58ef062',NULL,1,'uprov','O');
/*!40000 ALTER TABLE `se_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_comptabilite`
--

DROP TABLE IF EXISTS `st_comptabilite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_comptabilite` (
  `ID_AN_SCOLAIRE_STATISTIQUE` int NOT NULL,
  `ID_AN_SCOLAIRE_ACTUEL` int NOT NULL,
  `FL_RECETTE` varchar(2) NOT NULL DEFAULT 'N',
  `ID_ARTICLE` int NOT NULL,
  `MT_TOT_ARTICLE` decimal(12,2) NOT NULL DEFAULT '0.00',
  `DATE_GENERATION` varchar(30) NOT NULL,
  KEY `FK_ST_COMPTABILITE_ARTICLE` (`ID_ARTICLE`),
  KEY `FK_ST_COMPTABILITE_AN_SCOLAIRE_ACTUEL` (`ID_AN_SCOLAIRE_ACTUEL`),
  KEY `FK_ST_COMPTABILITE_AN_SCOLAIRE_STATISTIQUE` (`ID_AN_SCOLAIRE_STATISTIQUE`),
  CONSTRAINT `FK_ST_COMPTABILITE_AN_SCOLAIRE_ACTUEL` FOREIGN KEY (`ID_AN_SCOLAIRE_ACTUEL`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_ST_COMPTABILITE_AN_SCOLAIRE_STATISTIQUE` FOREIGN KEY (`ID_AN_SCOLAIRE_STATISTIQUE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_ST_COMPTABILITE_ARTICLE` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `pa_article` (`ID_ARTICLE`),
  CONSTRAINT `st_comptabilite_chk_1` CHECK ((`FL_RECETTE` in (_utf8mb4'O',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_comptabilite`
--

LOCK TABLES `st_comptabilite` WRITE;
/*!40000 ALTER TABLE `st_comptabilite` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_comptabilite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_date_generate`
--

DROP TABLE IF EXISTS `st_date_generate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_date_generate` (
  `DATE_GENERATION` varchar(30) NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `TYP_STATISTIQUE` varchar(30) NOT NULL,
  `TS_CREA` timestamp NULL DEFAULT NULL,
  `TS_UPDATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`DATE_GENERATION`,`ID_AN_SCOLAIRE`,`TYP_STATISTIQUE`),
  KEY `FK_ST_DATE_GENERATE_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_ST_DATE_GENERATE_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_date_generate`
--

LOCK TABLES `st_date_generate` WRITE;
/*!40000 ALTER TABLE `st_date_generate` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_date_generate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_eleve_classe_annee_scol`
--

DROP TABLE IF EXISTS `st_eleve_classe_annee_scol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_eleve_classe_annee_scol` (
  `ID_CLASSE` int NOT NULL,
  `ID_NIV_ETU` int NOT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `ID_PA_CYCLE` int NOT NULL,
  `SEX_ELV` varchar(1) NOT NULL DEFAULT 'M',
  `ID_PA_STATUT_ELEVE` int NOT NULL,
  `NB_ELV_TOT` int NOT NULL,
  `DATE_GENERATION` varchar(30) NOT NULL,
  KEY `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_CLASSE` (`ID_CLASSE`),
  KEY `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_NIV_ETUDE` (`ID_NIV_ETU`),
  KEY `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_PARAM_GLOB_CYCL` (`ID_PA_CYCLE`),
  KEY `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_PARAM_GLOB_STATUT` (`ID_PA_STATUT_ELEVE`),
  CONSTRAINT `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `pa_classe` (`ID_CLASSE`),
  CONSTRAINT `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_NIV_ETUDE` FOREIGN KEY (`ID_NIV_ETU`) REFERENCES `pa_niv_etude` (`ID_NIV_ETU`),
  CONSTRAINT `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_PARAM_GLOB_CYCL` FOREIGN KEY (`ID_PA_CYCLE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_PARAM_GLOB_STATUT` FOREIGN KEY (`ID_PA_STATUT_ELEVE`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `st_eleve_classe_annee_scol_chk_1` CHECK ((`SEX_ELV` in (_utf8mb4'F',_utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_eleve_classe_annee_scol`
--

LOCK TABLES `st_eleve_classe_annee_scol` WRITE;
/*!40000 ALTER TABLE `st_eleve_classe_annee_scol` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_eleve_classe_annee_scol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_personnel`
--

DROP TABLE IF EXISTS `st_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_personnel` (
  `ID_PA_STATU_PERS` int NOT NULL,
  `ID_PA_PRO_PERS` int NOT NULL,
  `ID_PA_FONC_REEL` int DEFAULT NULL,
  `ID_MATIERE1` int DEFAULT NULL,
  `ID_MATIERE2` int DEFAULT NULL,
  `ID_MATIERE3` int DEFAULT NULL,
  `ID_AN_SCOLAIRE` int NOT NULL,
  `NB_PERS_TOT` int NOT NULL,
  `DATE_GENERATION` varchar(30) NOT NULL,
  `SEX_PERS` varchar(10) NOT NULL DEFAULT 'M',
  KEY `FK_ST_PERSONNEL_PA_ANNEE_SCOLAIRE` (`ID_AN_SCOLAIRE`),
  KEY `FK_ST_PERSONNEL_PA_MATIERE1` (`ID_MATIERE1`),
  KEY `FK_ST_PERSONNEL_PA_MATIERE2` (`ID_MATIERE2`),
  KEY `FK_ST_PERSONNEL_PA_MATIERE3` (`ID_MATIERE3`),
  KEY `FK_ST_PERSONNEL_PA_PARAM_GLOB_PROF` (`ID_PA_PRO_PERS`),
  KEY `FK_ST_PERSONNEL_PA_PARAM_GLOB_FONC_REEL` (`ID_PA_FONC_REEL`),
  KEY `FK_ST_PERSONNEL_PA_PARAM_GLOB_STATU_PERS` (`ID_PA_STATU_PERS`),
  CONSTRAINT `FK_ST_PERSONNEL_PA_ANNEE_SCOLAIRE` FOREIGN KEY (`ID_AN_SCOLAIRE`) REFERENCES `pa_annee_scolaire` (`ID_AN_SCOLAIRE`),
  CONSTRAINT `FK_ST_PERSONNEL_PA_MATIERE1` FOREIGN KEY (`ID_MATIERE1`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_ST_PERSONNEL_PA_MATIERE2` FOREIGN KEY (`ID_MATIERE2`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_ST_PERSONNEL_PA_MATIERE3` FOREIGN KEY (`ID_MATIERE3`) REFERENCES `pa_matiere` (`ID_MATIERE`),
  CONSTRAINT `FK_ST_PERSONNEL_PA_PARAM_GLOB_FONC_REEL` FOREIGN KEY (`ID_PA_FONC_REEL`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_ST_PERSONNEL_PA_PARAM_GLOB_PROF` FOREIGN KEY (`ID_PA_PRO_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `FK_ST_PERSONNEL_PA_PARAM_GLOB_STATU_PERS` FOREIGN KEY (`ID_PA_STATU_PERS`) REFERENCES `pa_param_glob` (`ID_PARAM_GLOB`),
  CONSTRAINT `st_personnel_chk_1` CHECK ((`SEX_PERS` in (_utf8mb4'F',_utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_personnel`
--

LOCK TABLES `st_personnel` WRITE;
/*!40000 ALTER TABLE `st_personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_personnel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-22 11:23:08

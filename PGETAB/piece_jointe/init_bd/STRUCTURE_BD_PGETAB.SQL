DROP DATABASE IF EXISTS pgetab;
CREATE DATABASE IF NOT EXISTS pgetab;
ALTER DATABASE pgetab CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE pgetab;
CREATE TABLE IF NOT EXISTS PA_VERSION_DDL ( LB_VERSION VARCHAR(120) not null, 
 TS_MAJ DATETIME,
   PRIMARY KEY (LB_VERSION) );
INSERT INTO PA_VERSION_DDL values('0_GESTION_ETABLISSEMENT_COMPLET_V10.4.SQL', now());
# -----------------------------------------------------------------------------
#       TABLE : EV_MOYENNE_MATIERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_MOYENNE_MATIERE
 (
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   ID_PA_APPRECIATION INT DEFAULT NULL,
   ID_MATIERE INTEGER NOT NULL  ,
   ID_PA_MODULE INTEGER NULL ,
   MOY_MATIERE DECIMAL(4,2) NOT NULL  ,
   MOY_DEVOIR DECIMAL(4,2)  NULL  ,
   MOY_COMPO DECIMAL(4,2)  NULL  ,
   RANG_MOY_MATIERE INTEGER NOT NULL  ,
   COEF_MOY_MATIERE DECIMAL(4,2) NOT NULL  ,
   POINT_PONDERE_MOY DECIMAL(6,2) NOT NULL  ,
   MOY_RACHA DECIMAL(4,2) NOT NULL DEFAULT 0 ,
    BAREME int not null default 20,
    USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME ,
   PRIMARY KEY (ID_PA_PERIODE,ID_INSCRIPTION,ID_MATIERE) 
 ) 
 comment = "Moyenne Matiere";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_MOYENNE_MATIERE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_EV_MOYENNE_MATIERE_PA_MATIERE
     ON EV_MOYENNE_MATIERE (ID_MATIERE ASC);

CREATE  INDEX I_FK_EV_MOYENNE_MATIERE_EL_INSCRIPTION
     ON EV_MOYENNE_MATIERE (ID_INSCRIPTION ASC);

CREATE  INDEX I_FK_EV_MOYENNE_MATIERE_PA_PARAM_GLOB
     ON EV_MOYENNE_MATIERE (ID_PA_PERIODE ASC);

 ALTER TABLE ev_moyenne_matiere
 ADD KEY IK_ID_PA_APPRECIATION__MOY_MAT (ID_PA_APPRECIATION);
# -----------------------------------------------------------------------------
#       TABLE : EV_REL_REGLE_MOYENNE_PERIODE_MATIERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE
 (
   ID_MATIERE INTEGER NOT NULL  ,
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_PA_REGL_CALC_MOY INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_CLASSE INTEGER NOT NULL,
   ID_SOU_MATIERE INTEGER NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME ,
   PRIMARY KEY (ID_SOU_MATIERE,ID_PA_PERIODE,ID_AN_SCOLAIRE,ID_CLASSE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_SOU_MATIERE
     ON EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE (ID_SOU_MATIERE ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_MATIERE
     ON EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE (ID_MATIERE ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB
     ON EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE (ID_PA_PERIODE ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB2
     ON EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE (ID_PA_REGL_CALC_MOY ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_ANNEE_SCOLAIRE
     ON EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_CLASSE
     ON EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE (ID_CLASSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EV_MOYENNE_SOU_MATIERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_MOYENNE_SOU_MATIERE
 (
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   ID_SOU_MATIERE INTEGER NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   MOY_SOU_MATIERE DECIMAL(4,2) NOT NULL  ,
   MOY_SOU_MATIERE_DEVOIR DECIMAL(4,2) NOT NULL  ,
   MOY_SOU_MATIERE_COMPO DECIMAL(4,2) NOT NULL  ,
   COEF_MOY_SOU_MATIERE DECIMAL(4,2) NOT NULL  ,
   POINT_PONDERE_MOY_SOU_MATIERE DECIMAL(6,2) NOT NULL  ,
   MOY_RACHA DECIMAL(4,2) NOT NULL  
      DEFAULT 0 ,
	RANG_MOY_SOU_MATIERE  INTEGER NOT NULL  ,
    USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME ,
   PRIMARY KEY (ID_PA_PERIODE,ID_INSCRIPTION,ID_SOU_MATIERE) 
 ) 
 comment = "Moyenne Sous Matiere";
 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_MOYENNE_SOU_MATIERE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EV_MOYENNE_SOU_MATIERE_PA_MATIERE
     ON EV_MOYENNE_SOU_MATIERE (ID_MATIERE ASC);

CREATE  INDEX I_FK_EV_MOYENNE_SOU_MATIERE_PA_SOU_MATIERE
     ON EV_MOYENNE_SOU_MATIERE (ID_SOU_MATIERE ASC);
	 
CREATE  INDEX I_FK_EV_MOYENNE_SOU_MATIERE_EL_INSCRIPTION
     ON EV_MOYENNE_SOU_MATIERE (ID_INSCRIPTION ASC);

CREATE  INDEX I_FK_EV_MOYENNE_SOU_MATIERE_PA_PARAM_GLOB
     ON EV_MOYENNE_SOU_MATIERE (ID_PA_PERIODE ASC);
 # -----------------------------------------------------------------------------
#       TABLE : EV_MOYENNE_MODULE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EV_MOYENNE_MODULE
 (
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   ID_PA_MODULE INTEGER NOT NULL  ,
   MOY_MODULE DECIMAL(4,2) NOT NULL  ,
   COEF_MOY_MODULE DECIMAL(4,2) NOT NULL  ,
   COEF_TOTAL_MODULE DECIMAL(4,2) NOT NULL  ,
   POINT_PONDERE_MOY DECIMAL(6,2) NOT NULL  ,
   POIN_PONDERE_GLOB DECIMAL(7,2) DEFAULT 0.0,
   RETRAIT_POIN DECIMAL(5,2) DEFAULT 0.0,
   POIN_PONDERE_AV_RETRAIT DECIMAL(7,2) DEFAULT 0.0,
   USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME ,
   PRIMARY KEY (ID_PA_PERIODE,ID_INSCRIPTION,ID_PA_MODULE) 
 ) 
 comment = "Moyenne Module";
  # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_MOYENNE_MODULE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_EV_MOYENNE_MODULE_EL_INSCRIPTION
     ON EV_MOYENNE_MODULE (ID_INSCRIPTION ASC);

CREATE  INDEX I_FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB
     ON EV_MOYENNE_MODULE (ID_PA_PERIODE ASC);
CREATE  INDEX I_FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB_MODULE
     ON EV_MOYENNE_MODULE (ID_PA_MODULE ASC);
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ev_param_apprec_matiere
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ev_param_apprec_matiere (
  ID_PARAM int NOT NULL AUTO_INCREMENT,
  LIB_PARAM varchar(255) NOT NULL,
  ID_MATIERE int DEFAULT NULL,
  ID_NIV_ETU int DEFAULT NULL,
  FL_SUP char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (ID_PARAM)
)  COMMENT='Paramètre appréciation par matière';
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ev_param_apprec_matiere
# -----------------------------------------------------------------------------
ALTER TABLE ev_param_apprec_matiere
ADD UNIQUE KEY UI_matiere_niveau (ID_MATIERE, ID_NIV_ETU);

ALTER TABLE ev_param_apprec_matiere
ADD CONSTRAINT chk_fl_sup CHECK (FL_SUP IN ('O', 'N'));

ALTER TABLE ev_param_apprec_matiere
ADD KEY i_fk_pa_niv_etude (ID_NIV_ETU);

# -----------------------------------------------------------------------------
#       TABLE ev_param_det_apprec_matiere
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ev_param_det_apprec_matiere (
  ID_DET_PARAM int NOT NULL AUTO_INCREMENT,
  ID_PARAM_GLOB int NOT NULL,
  ID_PARAM int NOT NULL,
  MOY_INF decimal(5,2) NOT NULL,
  MOY_SUP decimal(5,2) NOT NULL,
  FL_SUP char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (ID_DET_PARAM)
) COMMENT='Détails appréciation matière';
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ev_param_det_apprec_matiere
# -----------------------------------------------------------------------------
ALTER TABLE ev_param_det_apprec_matiere
ADD UNIQUE KEY UI_e_moyennes_param (ID_PARAM, ID_PARAM_GLOB);

ALTER TABLE ev_param_det_apprec_matiere
ADD KEY i_fk_pa_param_glob (ID_PARAM_GLOB);

ALTER TABLE ev_param_det_apprec_matiere
ADD CONSTRAINT chk_fl_sup_det CHECK (FL_SUP IN ('O', 'N'));
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_PARAM_CALC_MOY_TYP_EVAL
# -----------------------------------------------------------------------------
CREATE TABLE EV_PARAM_CALC_MOY_TYP_EVAL (
  ID_CALC_MOY_TYP_EVAL INTEGER NOT NULL AUTO_INCREMENT ,
  ID_PA_TYP_EVAL INT NOT NULL,
  ID_NIV_ETU INT DEFAULT NULL,
  ID_MATIERE INT DEFAULT NULL,
  FL_COEF_DEFAULT CHAR(1) DEFAULT NULL,
  VAL_COEFF INT NOT NULL,
  FL_DEL CHAR(1) DEFAULT NULL,
  USERNAME_CREA VARCHAR(45) DEFAULT NULL,
  TS_CREA DATETIME DEFAULT NULL,
  USERNAME_UPD VARCHAR(45) DEFAULT NULL,
  TS_MAJ DATETIME DEFAULT NULL
     , PRIMARY KEY (ID_CALC_MOY_TYP_EVAL) 
)  COMMENT='PARAM CALC MOY TYP EVAL';
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_PARAM_CALC_MOY_TYP_EVAL
# -----------------------------------------------------------------------------

CREATE  UNIQUE INDEX I_PU_EV_PARAM_CALC_MOY_TYP_EVAL
     ON EV_PARAM_CALC_MOY_TYP_EVAL (ID_PA_TYP_EVAL ASC, ID_NIV_ETU ASC, ID_MATIERE ASC);

CREATE  INDEX I_FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_NIV_ETUDE
     ON EV_PARAM_CALC_MOY_TYP_EVAL (ID_NIV_ETU ASC);

CREATE  INDEX I_FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_MATIERE
     ON EV_PARAM_CALC_MOY_TYP_EVAL (ID_MATIERE ASC);

CREATE  INDEX I_FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_PARAM_GLOB
     ON EV_PARAM_CALC_MOY_TYP_EVAL (ID_PA_TYP_EVAL ASC);


# -----------------------------------------------------------------------------
#       TABLE : PE_ABSENCE_PERSONNEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_ABSENCE_PERSONNEL
 (
   ID_ABS_PERSONNEL INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_MOTF_ABS_PERS INTEGER NOT NULL  ,
   ID_PA_STATU_ABS_PERS INTEGER NOT NULL  ,
   DAT_DEB_ABS_PERSONNEL DATETIME NOT NULL  ,
   DAT_FIN_ABS_PERSONNEL DATETIME NULL  ,
   DESC_ABS_PERSONNEL VARCHAR(64) NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   LIEU_ABSENCE VARCHAR(60) DEFAULT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_ABS_PERSONNEL) 
 ) 
 comment = "Absence Personnel";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_ABSENCE_PERSONNEL
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB
     ON PE_ABSENCE_PERSONNEL (ID_PA_MOTF_ABS_PERS ASC);

CREATE  INDEX I_FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB1
     ON PE_ABSENCE_PERSONNEL (ID_PA_STATU_ABS_PERS ASC);

CREATE  INDEX I_FK_PE_ABSENCE_PERSONNEL_PE_PERSONNEL
     ON PE_ABSENCE_PERSONNEL (ID_PERSONNEL ASC);

# -----------------------------------------------------------------------------
#       TABLE : EL_DOSSIER_BOURSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_DOSSIER_BOURSE
 (
   ID_DOS_BOURSE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_BOURSE INTEGER NOT NULL  ,
   ID_ELEVE INTEGER NOT NULL  ,
   DATE_DEPO_BOURSE DATE NOT NULL  ,
   DATE_ENV_DOS_BOURS DATE  NULL  ,
   DATE_RSLT_DOS_BOURS DATE  NULL  ,
   RESULT_BOUR CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (RESULT_BOUR in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME  
   , PRIMARY KEY (ID_DOS_BOURSE) 
 ) 
 comment = "Dossier Bourse";


# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_DOSSIER_BOURSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_DOSSIER_BOURSE_EL_PARAM_BOURSE
     ON EL_DOSSIER_BOURSE (ID_BOURSE ASC);

CREATE  INDEX I_FK_EL_DOSSIER_BOURSE_EL_ELEVE
     ON EL_DOSSIER_BOURSE (ID_ELEVE ASC);

CREATE UNIQUE INDEX I_PU_EL_DOSSIER_BOURSE
     ON EL_DOSSIER_BOURSE (ID_ELEVE ASC,ID_BOURSE ASC);
# -----------------------------------------------------------------------------
#       TABLE : EL_INSCRIPTION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_INSCRIPTION
 (
   ID_INSCRIPTION INTEGER NOT NULL AUTO_INCREMENT ,
   ID_ELEVE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_PA_RSLT_SCOL INTEGER NULL  ,
   ID_PA_OPTION INTEGER NULL,
   ID_CLASSE INTEGER NOT NULL  ,
   ID_PA_TYP_ELV INTEGER NOT NULL  ,
   ID_PA_PERIOD_DEL INTEGER   ,
    ID_NIV_ETU_RDOUBL1 int(11) DEFAULT NULL,
    ID_NIV_ETU_RDOUBL2 int(11) DEFAULT NULL,
    ID_NIV_ETU_RDOUBL3 int(11) DEFAULT NULL,
    ID_NIV_ETU_RDOUBL4 int(11) DEFAULT NULL,
   MT_SCO_INSCRIP DECIMAL(13,2) NULL  ,
   EST_BOURS_INSCRIP CHAR(1) NOT NULL  
   DEFAULT "N"     CHECK (EST_BOURS_INSCRIP in ("O","N")),
   FL_PAY_SCOL CHAR(1) NOT NULL DEFAULT 'N' CHECK(FL_PAY_SCOL in ('O','N','E')),
   MOY_GENRAL DEC(4,2) NULL  ,
   RANG_GNRAL SMALLINT NULL  ,
   DAT_VAL_MOY_GNRAL DATETIME NULL  ,
   MT_BOURSE DEC(7,2) NULL  ,
   LN_BULETIN_MOY_GNRAL VARCHAR(1024) NULL  ,
   DAT_CREAT datetime  NOT NULL   default current_timestamp,
   MOY_GENRAL_AV_RACHA decimal(4,2),
   MOTIF_DEL VARCHAR(64),
   FL_DEL CHAR(1) NOT NULL   DEFAULT "N"    CHECK (FL_DEL in ("A","N","S")),
   DATE_DEL  DATETIME  NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME  ,	
    PRIMARY KEY (ID_INSCRIPTION) 
 ) 
 comment = "Incription";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_INSCRIPTION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_INSCRIPTION_EL_ELEVE
     ON EL_INSCRIPTION (ID_ELEVE ASC);

CREATE  INDEX I_FK_EL_INSCRIPTION_PA_ANNEE_SCOLAIRE
     ON EL_INSCRIPTION (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_EL_INSCRIPTION_PA_PARAM_GLOB
     ON EL_INSCRIPTION (ID_PA_RSLT_SCOL ASC);

CREATE  INDEX I_FK_EL_INSCRIPTION_PA_CLASSE
     ON EL_INSCRIPTION (ID_CLASSE ASC);

CREATE  INDEX I_FK_EL_INSCRIPTION_PA_PARAM_GLOB2
     ON EL_INSCRIPTION (ID_PA_TYP_ELV ASC);

CREATE UNIQUE INDEX ID_PU_EL_INSCRIPTION
     ON EL_INSCRIPTION (ID_ELEVE ASC,ID_AN_SCOLAIRE ASC);
	 
# -----------------------------------------------------------------------------
#       TABLE : el_dern_numero_matricule
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS el_dern_numero_matricule
 (
   ID_MATRICULE INTEGER NOT NULL  ,
   NO_MATRICULE VARCHAR(12) NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  , 
    PRIMARY KEY (ID_AN_SCOLAIRE) 
 ) 
 comment = "Dernier numéro";

 # -----------------------------------------------------------------------------
# INDEX DE LA TABLE el_dern_numero_matricule
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_el_dern_numero_matricule_annee_scolaire
     ON el_dern_numero_matricule (ID_AN_SCOLAIRE ASC);
	 
# -----------------------------------------------------------------------------
#       TABLE : PA_ETABLISSEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_ETABLISSEMENT
 (
   ID_ETAB INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PROV INTEGER NOT NULL  ,
   ID_COM INTEGER NOT NULL  ,
   ID_REG INTEGER NOT NULL  ,
   ID_CIR INT NULL ,
   ID_PA_TYP_ETAB INTEGER NOT NULL  ,
   COD_ADMIN_ETAB VARCHAR(64) NOT NULL  ,
   LIB_CRT_ETAB VARCHAR(64) NOT NULL  ,
   LIB_LNG_ETAB VARCHAR(128) NULL  ,
   TEL_FIXE_ETAB VARCHAR(24) NULL  ,
   TEL_MOBIL_ETAB VARCHAR(24) NULL  ,
   ADR_POSTAL_ETAB VARCHAR(64) NULL  ,
   code_theme VARCHAR(45) NOT NULL,
   code_lang CHAR(2) NOT NULL default "FR",
   ADR_ETAB VARCHAR(128) NOT NULL  ,
   LN_IMG_ETAB VARCHAR(128) NOT NULL  ,
   LN_DEVISE_ETAB VARCHAR(128),
   LN_SIGN_ETAB VARCHAR(128),
   FL_CONTINIUM char(1) not null default 'O'     check (FL_CONTINIUM in ('O','N')),
   MOY_MIN_CONTINIUM DECIMAL(4,2) DEFAULT 7 NULL, 
  REF_ACT_ETAB VARCHAR(30) NULL,
   EMAIL_ETAB VARCHAR(30) NULL,
   Site_web_ETAB VARCHAR(30) NULL,
   Arrondissement_ETAB VARCHAR(30) NULL,
   Secteur_ETAB VARCHAR(20) NULL,
   Fl_public CHAR(1) DEFAULT 'N' CHECK (Fl_public IN ('O', 'N')) NULL,
   FL_AUTR_SIGNATAIRE CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'Flag signature alternative (O/N)',
   DAT_LIVRAISON DATE NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_ETAB) 
 ) 
 comment = "Etablissement";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_ETABLISSEMENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_ETABLISSEMENT_PA_PROVINCE
     ON PA_ETABLISSEMENT (ID_PROV ASC);

CREATE  INDEX I_FK_PA_ETABLISSEMENT_PA_COMMUNE
     ON PA_ETABLISSEMENT (ID_COM ASC);

CREATE  INDEX I_FK_PA_ETABLISSEMENT_PA_REGION
     ON PA_ETABLISSEMENT (ID_REG ASC);

CREATE  INDEX I_FK_PA_ETABLISSEMENT_PA_PARAM_GLOB
     ON PA_ETABLISSEMENT (ID_PA_TYP_ETAB ASC);

CREATE UNIQUE INDEX I_PU_PA_ETAB
     ON PA_ETABLISSEMENT (COD_ADMIN_ETAB ASC);

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_LIST_ETABL
# -----------------------------------------------------------------------------
CREATE TABLE PA_LIST_ETABL (
    ID_ETAB INT AUTO_INCREMENT NOT NULL,
    ID_CIR INT NULL,
    CODE_ETAB VARCHAR(30) NOT NULL,
    NOM_ETAB VARCHAR(30) NOT NULL,
    ADRESS_ETAB VARCHAR(60) NOT NULL,
    NUM_TEL_ETAB VARCHAR(25) NULL,
    EMAIL_ETAB VARCHAR(70) NULL,
    ID_PA_TYP_ETAB INT NOT NULL,
    ID_PROV INT NOT NULL,
    ID_REG INT NOT NULL,
    ID_COM  INT NOT NULL,
    FL_PUBLIC CHAR(1) CHECK (FL_PUBLIC IN ('N', 'O')) NOT NULL,
    USERNAME_CREA VARCHAR(45) DEFAULT NULL,
   TS_CREA DATETIME DEFAULT NULL,
   USERNAME_UPD VARCHAR(45) DEFAULT NULL,
   TS_MAJ DATETIME DEFAULT NULL,
    PRIMARY KEY (ID_ETAB)
);
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_LIST_ETABL
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_PA_LIST_ETABL_PA_PARAM_GLOB
     ON PA_LIST_ETABL (ID_PA_TYP_ETAB ASC);

CREATE UNIQUE INDEX I_PU_PA_LIST_ETABL
     ON PA_LIST_ETABL (CODE_ETAB ASC);
     
CREATE  INDEX I_FK_PA_LIST_ETABL_PA_PROVINCE
     ON PA_LIST_ETABL (ID_PROV ASC);

CREATE  INDEX I_FK_PA_LIST_ETABL_PA_COMMUNE
     ON PA_LIST_ETABL (ID_COM ASC);

CREATE  INDEX I_FK_PA_LIST_ETABL_PA_REGION
     ON PA_LIST_ETABL (ID_REG ASC);
# -----------------------------------------------------------------------------
#       TABLE : PA_MATIERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_MATIERE
 (
   ID_MATIERE INTEGER NOT NULL AUTO_INCREMENT ,
   COD_MATIERE CHAR(5) NULL  ,
   LIB_CRT_MATIER VARCHAR(64) NOT NULL  ,
   LIB_LNG_MATIRE VARCHAR(128) NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_MATIERE) 
 ) 
 comment = "Matiere";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_MATIERE 
# -----------------------------------------------------------------------------
CREATE UNIQUE INDEX I_PU_PA_MATIER
     ON PA_MATIERE (COD_MATIERE ASC);
# -----------------------------------------------------------------------------
#       TABLE : pa_rel_module_niv_etud Ajout 13/06/2022
# -----------------------------------------------------------------------------	 
CREATE TABLE pa_rel_module_niv_etud (
  ID_NIV_ETU int NOT NULL,
  ID_PA_MODULE int NOT NULL,
  COEFFICIENT decimal(4,2) NOT NULL,
  USERNAME_CREA varchar(45) DEFAULT NULL,
  TS_CREA datetime DEFAULT NULL,
  PRIMARY KEY (ID_PA_MODULE,ID_NIV_ETU)
  ) COMMENT='Module Niveau Etude';

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE pa_rel_module_niv_etud
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_pa_rel_module_NIV_PA_PARAM_GLOB
     ON pa_rel_module_niv_etud (ID_PA_MODULE ASC);
CREATE  INDEX I_FK_pa_rel_module_NIV_PA_NIV_ETUDE
     ON pa_rel_module_niv_etud (ID_NIV_ETU ASC);
	 
#Ajout du manuel 08-05-2022
# -----------------------------------------------------------------------------
#       TABLE : PA_SOU_MATIERE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PA_SOU_MATIERE
 (
   ID_SOU_MATIERE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_MATIERE INTEGER NOT NULL,
   COD_SOU_MATIERE CHAR(5) NULL  ,
   LIB_CRT_SOU_MATIERE VARCHAR(64) NOT NULL  ,
   LIB_LNG_SOU_MATIRE VARCHAR(128) NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_SOU_MATIERE) 
 ) 
 comment = "Sous Matiere";
 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_SOU_MATIERE
# -----------------------------------------------------------------------------
CREATE UNIQUE INDEX I_PU_PA_SOU_MATIERE
     ON PA_SOU_MATIERE (COD_SOU_MATIERE ASC);
# -----------------------------------------------------------------------------
#       TABLE : PA_REL_SOU_MATIERE_NIV_ETUD
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PA_REL_SOU_MATIERE_NIV_ETUD
 (
   ID_SOU_MATIERE INTEGER NOT NULL  ,
   ID_NIV_ETU INTEGER NOT NULL  ,
   COEFFICIENT DECIMAL(4,2) NOT NULL  ,
   DESC_SOU_MAT_NIV_ETUD VARCHAR(1024) NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_NIV_ETU,ID_SOU_MATIERE) 
 ) 
 comment = "Sous Matiere Niveau Etude";
 # -----------------------------------------------------------------------------
#       TABLE : PA_OPTION_NIV_ETUD
# -----------------------------------------------------------------------------
 CREATE TABLE IF NOT EXISTS PA_OPTION_NIV_ETUD
 (
   ID_PA_OPTION INTEGER NOT NULL  ,
   ID_NIV_ETU INTEGER NOT NULL  ,
   LIB_OPTION VARCHAR(64) NOT NULL  ,
   DESC_OPTION VARCHAR(1024) NOT NULL  ,
   FL_ACTIF CHAR(1) NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_PA_OPTION,ID_NIV_ETU) 
 )  comment = "Option niveau";
 # -----------------------------------------------------------------------------
#       TABLE : PA_REL_OPTION_MATIER_NIV_ETUD
# -----------------------------------------------------------------------------
	  
CREATE TABLE IF NOT EXISTS PA_REL_OPTION_MATIER_NIV_ETUD
 (
   ID_PA_OPTION INTEGER NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   ID_NIV_ETU INTEGER NOT NULL  ,
   COEFFICIENT DECIMAL(4,2) NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_PA_OPTION,ID_MATIERE,ID_NIV_ETU) 
 ) 
 comment = "Option Matiere niveau Matiere";
# -----------------------------------------------------------------------------
#       TABLE : EV_MOYENNE_PERIODE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_MOYENNE_PERIODE
 (
   ID_INSCRIPTION INTEGER NOT NULL  ,
   ID_PA_PERIODE INTEGER NOT NULL  ,
   MOY_PRIOD DECIMAL(4,2) NOT NULL  ,
   RANG_PRIOD INTEGER NOT NULL  ,
   DATE_VALID_MOY_PRD DATETIME NULL  ,
   LN_BULETIN_MOY_PRIOD VARCHAR(1024) NOT NULL  ,
   /*Ajout 01/12/2020*/
   ID_PA_HONEUR INTEGER  NULL,
   RETRAIT_POIN_ABS DECIMAL(7,2) NOT NULL  
      DEFAULT 0,
   RETRAIT_POIN_INCIDEN DECIMAL(7,2) NOT NULL  
      DEFAULT 0,
   RETRAIT_POIN_AUTR DECIMAL(7,2) NOT NULL  
      DEFAULT 0,
   TOTAL_POIN_PONDERE DECIMAL(10,2) NOT NULL  
      DEFAULT 0 ,
    TOTAL_POIN_PONDERE_AV_RACHA decimal(10,2) ,
	MOY_PRIOD_AV_RACHA decimal(4,2),
    ID_NIV_ETU_RDOUBL1 INTEGER,
    ID_NIV_ETU_RDOUBL2 INTEGER,
    ID_NIV_ETU_RDOUBL3 INTEGER,
   ID_NIV_ETU_RDOUBL4 INTEGER,
	COEF_PRIOD DECIMAL(4,2) NOT NULL DEFAULT 0,
	FL_MOY_GNRL char(1) NOT NULL DEFAULT 'N',
	   USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME 
   , PRIMARY KEY (ID_INSCRIPTION,ID_PA_PERIODE) 
 ) 
 comment = "Moyenne General";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_MOYENNE_PERIODE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EV_MOYENNE_PERIODE_PA_PARAM_GLOB
     ON EV_MOYENNE_PERIODE (ID_PA_PERIODE ASC);

CREATE  INDEX I_FK_EV_MOYENNE_PERIODE_EL_INSCRIPTION
     ON EV_MOYENNE_PERIODE (ID_INSCRIPTION ASC);

# -----------------------------------------------------------------------------
# TABLE EV_BORDREAU_RETRAIT_BULLETIN
# -----------------------------------------------------------------------------
CREATE TABLE EV_BORDREAU_RETRAIT_BULLETIN (
   ID_BORDERAU INT NOT NULL AUTO_INCREMENT,
  ID_INSCRIPTION INT NOT NULL,
  ID_PERIODE INT NOT NULL,
  TS_RETRAIT_BUL DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  NOM_PERS_BORD VARCHAR(45) DEFAULT NULL,
  PRENOM_PERS_BORD VARCHAR(128) DEFAULT NULL,
  DATE_NAIS_PERS_BORD VARCHAR(128) DEFAULT NULL,
  LIEN_ELEV_PERS_RETRAIT VARCHAR(45) DEFAULT NULL,
  DOC_IDEN_BORD VARCHAR(45) DEFAULT NULL,
  LIEN_SIGNATURE VARCHAR(45) DEFAULT NULL,
  USER_CREATE VARCHAR(45) DEFAULT NULL,
  TS_CREATE DATETIME DEFAULT NULL,
  PRIMARY KEY ( ID_BORDERAU)
)COMMENT='EV_BORDREAU_RETRAIT_BULLETIN';

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_BORDREAU_RETRAIT_BULLETIN
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_EV_BORDEREAU_EL_INSCRIPTION
     ON EV_BORDREAU_RETRAIT_BULLETIN (ID_INSCRIPTION);

CREATE  INDEX I_FK_EV_BORDEREAU_PA_PERIOD_EVAL
     ON EV_BORDREAU_RETRAIT_BULLETIN (ID_PERIODE);
CREATE UNIQUE INDEX I_PU_EV_BORDEREAU_EL_INSCRIPTION
     ON EV_BORDREAU_RETRAIT_BULLETIN (ID_INSCRIPTION ASC,ID_PERIODE ASC);
# -----------------------------------------------------------------------------
#       TABLE : PA_PAYS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PAYS
 (
   ID_PAYS INTEGER NOT NULL AUTO_INCREMENT ,
   COD_ISO_CRT_PAYS CHAR(2) NOT NULL  ,
   COD_ISO_LNG_PAYS CHAR(3) NOT NULL  ,
   NOM_AN_PAYS VARCHAR(64) NOT NULL  ,
   NOM_FR_PAYS VARCHAR(64) NOT NULL  ,
   NUM_ORDR_PAYS INTEGER NOT NULL DEFAULT 999,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_PAYS) 
 ) 
 comment = "Pays";

# -----------------------------------------------------------------------------
#       TABLE : PA_REGION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_REGION
 (
   ID_REG INTEGER NOT NULL AUTO_INCREMENT ,
   COD_REG CHAR(2) NULL  ,
   LIB_REG VARCHAR(64) NOT NULL  ,
   CHF_LIEU_REG VARCHAR(64) NOT NULL  ,
   LB_ARTICLE VARCHAR(10),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_REG) 
 ) 
 comment = "Region";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_REGION
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_PU_PA_REGION
     ON PA_REGION (COD_REG ASC);
# -----------------------------------------------------------------------------
#       TABLE : PA_CIRCONSCRIPTION
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PA_CIRCONSCRIPTION (
    ID_CIR INT NOT NULL AUTO_INCREMENT,
    ID_PROV INT NOT NULL,
    COD_CIR CHAR(6) NULL,
    LIB_CIR VARCHAR(128) NOT NULL,
    USERNAME_CREA VARCHAR(45),
    TS_CREA DATETIME,
    ID_PAYS INT NOT NULL,
    PRIMARY KEY (ID_CIR)) COMMENT = 'Circonscription';

# -----------------------------------------------------------------------------
#       TABLE : PA_NIV_ETUDE
# -----------------------------------------------------------------------------
/* repasser mettre not null 30/08/2021 */
CREATE TABLE IF NOT EXISTS PA_NIV_ETUDE
 (
   ID_NIV_ETU INTEGER NOT NULL AUTO_INCREMENT ,
   COD_NIV_ETU VARCHAR(10) NULL  ,
   ID_PA_CYCLE_NIV INTEGER NULL,
   ID_PA_NIV INTEGER  NULL,
   ID_PA_SERI INTEGER  NULL,
   ID_ORDER_NIV INTEGER NOT NULL DEFAULT 1,
   ID_PA_REGLE_RETRAIT_POIN INT DEFAULT NULL,
   VA_RETRAIT_POINT_HORAIRE DECIMAL(5,3) DEFAULT NULL,
   LIB_CRT_NIV_ETU VARCHAR(32) NOT NULL  ,
   LIB_LNG_NIV_ETU VARCHAR(128) NOT NULL  ,
   FLAG_ACTF_NIV CHAR(1) NULL       CHECK (FLAG_ACTF_NIV in ("O","N")),
   FL_EXAM CHAR(1) NOT NULL     DEFAULT "N"    CHECK (FL_EXAM in ("O","N")),
   VAL_BAREM_EVAL INT NOT NULL DEFAULT 20,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_NIV_ETU) 
 ) 
 comment = "Niveau Etude";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_NIV_ETUDE
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_PU_PA_NIV_ETUDE
     ON PA_NIV_ETUDE (COD_NIV_ETU ASC);


# -----------------------------------------------------------------------------
#       TABLE : PE_PROFESSEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_PROFESSEUR
 (
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_PA_TITR_CAPA INTEGER  NULL,
   NB_HEUR_HBD_REGLMEN SMALLINT  NULL  ,
   NB_HEUR_HBD_SUPLMEN SMALLINT  NULL  
      DEFAULT 0,
   NB_HEUR_MENS_REGLMEN SMALLINT NULL  ,
   NB_HEUR_MENS_SUPLMEN SMALLINT NULL  
      DEFAULT 0,
   TAUX_HORAIRE DECIMAL(8,2) NULL  ,
   TITR_CAPA VARCHAR(25) NULL  ,
   REF_AUTO_ENSEIGN VARCHAR(64) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME    
   , PRIMARY KEY (ID_PERSONNEL) 
 ) 
 comment = "Professeur";
 
CREATE  INDEX I_FK_pe_professeur_PA_PARAM_GLOB_TITR
     ON pe_professeur (ID_PA_TITR_CAPA ASC);
# -----------------------------------------------------------------------------
#       TABLE : EL_INCIDENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_INCIDENT
 (
   ID_INCIDENT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_EXCLUSION_ELV INTEGER NOT NULL  ,
   ID_PA_TYP_INCIDENT INTEGER NOT NULL  ,
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   DAT_INCIDENT DATETIME NOT NULL  ,
   DAT_DEB_INCIDENT DATETIME NULL  ,
   DAT_FIN_INCIDENT DATETIME NULL  ,
   PAREN_CONVOQ CHAR(1) NULL       CHECK (PAREN_CONVOQ in ("O","N")),
   LIB_LNG_INCIDENT VARCHAR(128) NOT NULL  ,
   NB_POIN_RETRAI DECIMAL(7,2) NOT NULL  
      DEFAULT 0,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME  
   , PRIMARY KEY (ID_INCIDENT) 
 ) 
 comment = "Incident";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_INCIDENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_INCIDENT_PA_PARAM_GLOB
     ON EL_INCIDENT (ID_PA_EXCLUSION_ELV ASC);

CREATE  INDEX I_FK_EL_INCIDENT_PA_PARAM_GLOB1
     ON EL_INCIDENT (ID_PA_TYP_INCIDENT ASC);

CREATE  INDEX I_FK_EL_INCIDENT_EL_INSCRIPTION
     ON EL_INCIDENT (ID_INSCRIPTION ASC);

CREATE  INDEX I_FK_EL_INCIDENT_PA_PERIOD_EVAL
     ON EL_INCIDENT (ID_PA_PERIODE ASC);


# -----------------------------------------------------------------------------
#       TABLE : EL_ELEVE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_ELEVE
 (
   ID_ELEVE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PAYS_NAIS_ELV INTEGER NOT  NULL  ,
   ID_PAYS_NATIONNALITE_ELV INTEGER NOT NULL  ,
   ID_PA_RELIGION_PERE_ELV INTEGER  NULL  ,
   ID_PA_RELIGION_MERE_ELV INTEGER  NULL  ,
   ID_PA_SITUA_SOCIAL_ELV INTEGER NOT NULL  ,
   ID_PA_PROFES_PERE_ELV INTEGER  NULL  ,
   ID_COM_NAIS_ELV INTEGER NULL  ,
   ID_PA_PROFES_MERE_ELV INTEGER  NULL  ,
   ID_NIV_ETU_RDOUBL1 INTEGER  NULL,
   ID_NIV_ETU_RDOUBL2 INTEGER  NULL,
   ID_ETAB_ORIG INT,
   NUM_MATRI_ELV VARCHAR(12) NOT NULL  ,
   NOM_ELV VARCHAR(64) NOT NULL  ,
   PRENOM_ELV VARCHAR(64) NOT NULL  ,
   TEL_ELV VARCHAR(32) NOT NULL  ,
   DAT_NAIS_ELV DATE NOT NULL  ,
   LIEU_NAIS_ELV VARCHAR(64) NOT NULL  ,
   NM_PERE_ELV VARCHAR(64) NOT NULL  ,
   PRNM_PERE_ELV VARCHAR(64) NOT NULL  ,
   NM_MERE_ELV VARCHAR(64) NOT NULL  ,
   PRNM_MERE_ELV VARCHAR(64) NOT NULL  ,
   NUM_TEL_PAREN_ELV VARCHAR(64) NOT NULL  ,
   APT_SPOR_ELV CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (APT_SPOR_ELV in ("O","N")),
   LN_IMG_ELV VARCHAR(1024) NOT NULL  ,
   SEX_ELV CHAR(1) NOT NULL  
      DEFAULT "F"     CHECK (SEX_ELV in ("M","F")),
   ANNEE_NAIS_EN VARCHAR(31) NOT NULL DEFAULT "",
   NUM_PV varchar(30),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME  
   , PRIMARY KEY (ID_ELEVE) 
 ) 
 comment = "Eleve";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_ELEVE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_ELEVE_PA_PAYS
     ON EL_ELEVE (ID_PAYS_NAIS_ELV ASC);

CREATE  INDEX I_FK_EL_ELEVE_PA_PAYS2
     ON EL_ELEVE (ID_PAYS_NATIONNALITE_ELV ASC);

CREATE  INDEX I_FK_EL_ELEVE_PA_PARAM_GLOB
     ON EL_ELEVE (ID_PA_RELIGION_PERE_ELV ASC);

CREATE  INDEX I_FK_EL_ELEVE_PA_PARAM_GLOB4
     ON EL_ELEVE (ID_PA_RELIGION_MERE_ELV ASC);

CREATE  INDEX I_FK_EL_ELEVE_PA_PARAM_GLOB5
     ON EL_ELEVE (ID_PA_SITUA_SOCIAL_ELV ASC);

CREATE  INDEX I_FK_EL_ELEVE_PA_PARAM_GLOB1
     ON EL_ELEVE (ID_PA_PROFES_PERE_ELV ASC);

CREATE  INDEX I_FK_EL_ELEVE_PA_COMMUNE
     ON EL_ELEVE (ID_COM_NAIS_ELV ASC);

CREATE  INDEX I_FK_EL_ELEVE_PA_PARAM_GLOB21
     ON EL_ELEVE (ID_PA_PROFES_MERE_ELV ASC);

CREATE UNIQUE INDEX I_PU_ELEVE
     ON EL_ELEVE (NUM_MATRI_ELV ASC);


# -----------------------------------------------------------------------------
#       TABLE : EL_ABSENCE_ELEVE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_ABSENCE_ELEVE
 (
   ID_ABS_ELV INTEGER NOT NULL AUTO_INCREMENT ,
   ID_INCIDENT INTEGER NULL  ,
   ID_PA_STATU_ABS_ELV INTEGER NOT NULL  ,
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   ID_PA_MOTF_ABS_ELV INTEGER NOT NULL  ,
   DAT_DEB_ABS_ELV DATETIME NOT NULL  ,
   DAT_FIN_ABS_ELV DATETIME NULL  ,
   DESC_ABS_ELV VARCHAR(128) NOT NULL ,
   id_matiere INT NULL,
   FL_DEL CHAR(1) NOT NULL DEFAULT 'N' CHECK (FL_DEL IN ('O', 'N')),
   TS_DEL  VARCHAR(64) DEFAULT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_ABS_ELV) 
 ) 
 comment = "Absence Eleve";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_ABSENCE_ELEVE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_ABSENCE_ELEVE_EL_INCIDENT
     ON EL_ABSENCE_ELEVE (ID_INCIDENT ASC);

CREATE  INDEX I_FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB
     ON EL_ABSENCE_ELEVE (ID_PA_STATU_ABS_ELV ASC);

CREATE  INDEX I_FK_EL_ABSENCE_ELEVE_EL_INSCRIPTION
     ON EL_ABSENCE_ELEVE (ID_INSCRIPTION ASC);

CREATE  INDEX I_FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB2
     ON EL_ABSENCE_ELEVE (ID_PA_MOTF_ABS_ELV ASC);
 
CREATE  INDEX I_FK_EL_ABSENCE_ELEVE_PA_PERIOD_EVAL
     ON EL_ABSENCE_ELEVE (ID_PA_PERIODE ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_HORAIRE_SEMAINE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_HORAIRE_SEMAINE
 (
   ID_HORAIRE_HBDO INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_HORAIR_DISPO INTEGER NOT NULL  ,
   ID_PA_JOUR_DISPO INTEGER NOT NULL  ,
   FL_OUV_JOUR_HORAIR_HBDO CHAR(1) NOT NULL  
      DEFAULT "O"     CHECK (FL_OUV_JOUR_HORAIR_HBDO in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_HORAIRE_HBDO) 
 ) 
 comment = "Horaire Semaine";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_HORAIRE_SEMAINE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB
     ON PA_HORAIRE_SEMAINE (ID_PA_HORAIR_DISPO ASC);

CREATE  INDEX I_FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB2
     ON PA_HORAIRE_SEMAINE (ID_PA_JOUR_DISPO ASC);
/* Ajouter manuellement le 09/08/2020 */
CREATE UNIQUE INDEX I_PU_PA_HORAIRE_SEMAINE
     ON PA_HORAIRE_SEMAINE (ID_PA_JOUR_DISPO ASC,ID_PA_HORAIR_DISPO ASC);

# -----------------------------------------------------------------------------
#       TABLE : PA_COMMUNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_COMMUNE
 (
   ID_COM INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PROV INTEGER NOT NULL  ,
   ID_PAYS INTEGER NULL,
   COD_COM CHAR(6) NULL  ,
   LIB_COM VARCHAR(128) NOT NULL  ,
   COD_TYP_COM CHAR(2) NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_COM) 
 ) 
 comment = "Commune";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_COMMUNE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_COMMUNE_PA_PROVINCE
     ON PA_COMMUNE (ID_PROV ASC);

CREATE UNIQUE INDEX I_PU_PA_COMMUNE
     ON PA_COMMUNE (COD_COM ASC);

CREATE INDEX I_FK_PA_COMMUNE_PA_PAYS
ON PA_COMMUNE (ID_PAYS ASC);

# -----------------------------------------------------------------------------
#       TABLE : EM_EMPLOITEMPS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EM_EMPLOITEMPS
 (
   ID_CLASSE INTEGER NOT NULL  ,
   ID_HORAIRE_HBDO INTEGER NOT NULL  ,
   ID_VERSION_EMPLOITEMPS SMALLINT NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL,
   ID_PERSONNEL INTEGER NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_CLASSE,ID_HORAIRE_HBDO,ID_VERSION_EMPLOITEMPS) 
 ) 
 comment = "EmploiTemps";
 
  # -----------------------------------------------------------------------------
#       TABLE : EM_REL_DISPO_MATIERE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EM_REL_DISPO_MATIERE
 (
   ID_HORAIRE_HBDO INTEGER NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   FL_DISPO_MATIERE CHAR(1) NOT NULL  
      DEFAULT "O"     CHECK (FL_DISPO_MATIERE in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_HORAIRE_HBDO,ID_MATIERE) 
 ) 
 comment = "";
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_REL_DISPO_MATIERE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EM_REL_DISPO_MATIERE_PA_HORAIRE_SEMAINE
     ON EM_REL_DISPO_MATIERE (ID_HORAIRE_HBDO ASC);

CREATE  INDEX I_FK_EM_REL_DISPO_MATIERE_PA_MATIERE
     ON EM_REL_DISPO_MATIERE (ID_MATIERE ASC);

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_EMPLOITEMPS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EM_EMPLOITEMPS_PA_HORAIRE_SEMAINE
     ON EM_EMPLOITEMPS (ID_HORAIRE_HBDO ASC);
	 
CREATE  INDEX I_FK_EM_EMPLOITEMPS_PA_ANNEE_SCOLAIRE
     ON EM_EMPLOITEMPS (ID_AN_SCOLAIRE ASC);
	 
CREATE  INDEX I_FK_EM_EMPLOITEMPS_PA_CLASSE
     ON EM_EMPLOITEMPS (ID_CLASSE ASC);

CREATE  INDEX I_FK_EM_EMPLOITEMPS_PE_PROFESSEUR
     ON EM_EMPLOITEMPS (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_EM_EMPLOITEMPS_PA_MATIERE
     ON EM_EMPLOITEMPS (ID_MATIERE ASC);

CREATE  INDEX I_FK_EM_EMPLOITEMPS_EM_VERSION_EMPLOITEMPS
     ON EM_EMPLOITEMPS (ID_VERSION_EMPLOITEMPS ASC);

# -----------------------------------------------------------------------------
#       TABLE : PE_PERSONNEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_PERSONNEL
 (
   ID_PERSONNEL INTEGER NOT NULL AUTO_INCREMENT ,
/*Ajout mannuel du 18/07/2020*/
   ID_PA_PRO_PERS INTEGER  NULL  ,
   ID_PA_STATU_PERS INTEGER NOT NULL  ,
   ID_PA_TYP_PERS INTEGER NULL  ,
   ID_COM_NAIS_PERS INTEGER NULL  ,
   ID_PERSONNEL_RESP INTEGER  NULL  ,
   ID_PAYS_NAIS_PERS INTEGER NOT NULL  ,
   NUM_MATR_PERS VARCHAR(32) NOT NULL  ,
   NOM_PERS VARCHAR(64) NOT NULL  ,
   PRENOM_PERS VARCHAR(64) NOT NULL  ,
   SEX_PERS CHAR(1) NOT NULL  
      DEFAULT "F"     CHECK (SEX_PERS in ("F","M")),
   /* ajout manuel du 08/06/2022 */
   ADR_PERS VARCHAR(64),
   ID_PA_SIT_MATRI INTEGER,
   SECTEUR_PERS VARCHAR(64),
   ARDMNT_PERS VARCHAR(64),
   NBENFANT_PERS SMALLINT,
   DATE_NAIS_PERS DATE NULL  ,
   LIEN_SIGN_PERS VARCHAR(1024),
   ECHEL_PERS SMALLINT NULL  ,
   ECHELON_PERS SMALLINT NULL  ,
   CATEG_PERS VARCHAR(10) NULL  ,
   CLASSE_PERS SMALLINT NULL  ,
   TEL_PERS VARCHAR(24) NOT NULL  ,
   LIEU_NAIS_PERS VARCHAR(64) NULL  ,
   ANCIENETE_MOIS_PERS SMALLINT  NULL  ,
   DAT_DEB_SERV_ETABL_PERS DATE  NULL  ,
   DAT_FIN_SERV_ETABL_PERS DATE NULL  ,
   SAL_MENS_PERS DECIMAL(10,2) NULL  ,
   LIEN_IMG_PERS VARCHAR(1024) NULL  ,
   DAT_DEB_SERV_MENA DATE NULL  ,
   DAT_DEB_SERV_FONC_PUBL DATE NULL ,
   /*Ajout mannuel du 22/03/2021*/
   TITRE_HONORIFIQ_1 VARCHAR(250),
   TITRE_HONORIFIQ_2 VARCHAR(250),
   TITRE_HONORIFIQ_3 VARCHAR(250),
   TOP_ACTI_HONORIFIQ_1 CHAR(1),
   TOP_ACTI_HONORIFIQ_2 CHAR(1),
   TOP_ACTI_HONORIFIQ_3 CHAR(1),
   /* fonction reel ajout le 04/08/2024 */
   ID_PA_FONC_REEL INT ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   ,   
   PRIMARY KEY (ID_PERSONNEL) 
 ) 
 comment = "Personnel";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_PERSONNEL
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_PERSONNEL_PA_PARAM_GLOB2
     ON PE_PERSONNEL (ID_PA_STATU_PERS ASC);

CREATE  INDEX I_FK_PE_PERSONNEL_PA_PARAM_TYPE
     ON PE_PERSONNEL (ID_PA_TYP_PERS ASC);
	 
CREATE  INDEX I_FK_PE_PERSONNEL_PA_COMMUNE
     ON PE_PERSONNEL (ID_COM_NAIS_PERS ASC);

CREATE UNIQUE INDEX I_FK_PE_PERSONNEL_PE_PERSONNEL
     ON PE_PERSONNEL (ID_PERSONNEL_RESP ASC);

CREATE  INDEX I_FK_PE_PERSONNEL_PA_PAYS
     ON PE_PERSONNEL (ID_PAYS_NAIS_PERS ASC);

CREATE UNIQUE INDEX I_PU_PE_PERSONNEL
     ON PE_PERSONNEL (NUM_MATR_PERS ASC);

/*Ajout mannuel du 18/07/2020*/
CREATE  INDEX I_FK_PE_PERSONNEL_PROFESSION
     ON PE_PERSONNEL (ID_PA_PRO_PERS ASC);
/*Ajout mannuel du 08/06/2022*/
CREATE  INDEX I_FK_PE_PERSONNEL_PA_PARAM_GLOB_MATRI
     ON PE_PERSONNEL (ID_PA_SIT_MATRI ASC);

# -----------------------------------------------------------------------------
#       TABLE : EL_PARAM_BOURSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_PARAM_BOURSE
 (
   ID_BOURSE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_REG INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_PA_DIPLOME INTEGER NOT NULL  ,
   ID_NIV_ETU INT NOT NULL,
   AN_BOURSE SMALLINT NOT NULL  ,
   NB_POIN_REQ_BOURSE DECIMAL(6,2) NOT NULL  ,
   MOY_REQ_BOURSE DECIMAL(4,2) NOT NULL  ,
   AGE_MAX INT NOT NULL,
   MT_BOURSE DEC(7,2) NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_BOURSE) 
 ) 
 comment = "Param Bourse";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_PARAM_BOURSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_PARAM_BOURSE_PA_REGION
     ON EL_PARAM_BOURSE (ID_REG ASC);

CREATE  INDEX I_FK_EL_PARAM_BOURSE_PA_ANNEE_SCOLAIRE
     ON EL_PARAM_BOURSE (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_EL_PARAM_BOURSE_PA_PARAM_GLOB
     ON EL_PARAM_BOURSE (ID_PA_DIPLOME ASC);

CREATE  INDEX I_FK_EL_PARAM_BOURSE_PA_NIV_ETUDE
     ON EL_PARAM_BOURSE (ID_NIV_ETU ASC);

CREATE UNIQUE INDEX I_PU_EL_PARAM_BOURSE
     ON EL_PARAM_BOURSE (ID_REG ASC,ID_AN_SCOLAIRE ASC,ID_PA_DIPLOME ASC);

# -----------------------------------------------------------------------------
#       TABLE : PA_CALENDRIER_SCOLAIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_CALENDRIER_SCOLAIRE
 (
   DATE_SCOLAIRE DATE NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   NUM_JOUR SMALLINT NOT NULL  ,
   NM_JOUR VARCHAR(32) NOT NULL  ,
   NUM_MOIS SMALLINT NOT NULL  ,
   NM_MOIS VARCHAR(32) NOT NULL  ,
   NUM_SEM INTEGER NOT NULL, 
   DATE_DEB_MOIS DATE NOT NULL, 
   DATE_FIN_MOIS DATE NOT NULL , 
   DATE_DEB_SEM DATE NOT NULL, 
   DATE_FIN_SEM DATE NOT NULL,
   TOP_JOUR_FERI CHAR(1) NOT NULL  ,
   TOP_VAC_SCOLAIRE CHAR(1) NOT NULL  ,
   TOP_JOUR_OUV CHAR(1) NOT NULL  ,
   TOP_JOUR_GREV CHAR(1) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME 
   , PRIMARY KEY (DATE_SCOLAIRE) 
 ) 
 comment = "Calendrier Scolaire";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_CALENDRIER_SCOLAIRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_CALENDRIER_SCOLAIRE_PA_ANNEE_SCOLAIRE
     ON PA_CALENDRIER_SCOLAIRE (ID_AN_SCOLAIRE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PA_ANNEE_SCOLAIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_ANNEE_SCOLAIRE
 (
   ID_AN_SCOLAIRE INTEGER NOT NULL AUTO_INCREMENT ,
   AN_SCOLAIRE INTEGER NOT NULL  ,
   DAT_DEB_SCOLAIRE DATE NOT NULL  ,
   DAT_FIN_SCOLAIRE DATE NULL  ,
   LIB_SCOLAIR VARCHAR(64) NOT NULL  ,
   FL_AN_ACTF CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_AN_ACTF in ("O","N")),
   ID_PAR_REGL_CALC_MOY_GNRAL INTEGER NULL  ,
   MOY_RACHA DECIMAL(4,2) NOT NULL  
      DEFAULT 9.75    CHECK (MOY_RACHA between 1 and 10),
   RETRAI_POIN_ABS DECIMAL(5,2) NOT NULL  
      DEFAULT 1
   ,
   NB_HEUR_MIN_ABS SMALLINT NOT NULL  
      DEFAULT 0,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   ,   PRIMARY KEY (ID_AN_SCOLAIRE) 
 ) 
 comment = "Annee Scolaire";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_ANNEE_SCOLAIRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_PU_PA_ANNEE_SCOLAIRE
     ON PA_ANNEE_SCOLAIRE (AN_SCOLAIRE ASC);


CREATE  INDEX I_FK_PA_ANNEE_SCOLAIRE_PA_PARAM_GLOB
     ON PA_ANNEE_SCOLAIRE (ID_PAR_REGL_CALC_MOY_GNRAL ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_PARAM_GLOB
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PARAM_GLOB
 (
   ID_PARAM_GLOB INTEGER NOT NULL AUTO_INCREMENT ,
   COD_TYP_PARAM VARCHAR(2) NOT NULL,
   COD_PARAM_GLOB CHAR(6) NULL  ,
   LIB_CRT_PARAM_GLOB VARCHAR(64) NOT NULL  ,
   LIB_LNG_PARAM_GLOB VARCHAR(128) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME 
   , PRIMARY KEY (ID_PARAM_GLOB) 
 ) 
 comment = "Parametre Global";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_PARAM_GLOB
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_PU_PA_PARAM_GLOB
     ON PA_PARAM_GLOB (COD_PARAM_GLOB ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_BATIMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_BATIMENT
 (
   ID_BAT INTEGER NOT NULL AUTO_INCREMENT ,
   CODE_BAT CHAR(5) NOT NULL  ,
   LIB_BAT VARCHAR(64) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME 
   , PRIMARY KEY (ID_BAT) 
 ) 
 comment = "Batiment";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_BATIMENT
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_PU_PA_BATIMENT
     ON PA_BATIMENT (CODE_BAT ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_CLASSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_CLASSE
 (
   ID_CLASSE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_SALLE INTEGER NOT NULL  ,
   ID_NIV_ETU INTEGER NOT NULL  ,
   COD_CLASSE CHAR(5) NOT NULL  ,
   LIB_CLASSE VARCHAR(64) NOT NULL ,
   DAT_SUP_CLASSE DATE NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_CLASSE) 
 ) 
 comment = "Classe";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_CLASSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_CLASSE_PA_SALLE
     ON PA_CLASSE (ID_SALLE ASC);


CREATE  INDEX I_FK_PA_CLASSE_PA_NIV_ETUDE
     ON PA_CLASSE (ID_NIV_ETU ASC);


CREATE UNIQUE INDEX I_PU_PA_CLASSE
     ON PA_CLASSE (COD_CLASSE ASC);


# -----------------------------------------------------------------------------
#       TABLE : EV_EVALUATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_EVALUATION
 (
   ID_EVALUATION INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_TYPE_EVALUATION INTEGER NOT NULL  ,
   ID_PA_STATU_EVALUATION INTEGER NULL  ,
   /* ajout le 04/08/2024*/
   ID_PA_STATU_VALID  INT,
   ID_MATIERE INTEGER NOT NULL  ,
   ID_SOU_MATIERE INTEGER  ,
   ID_CLASSE INTEGER NOT NULL  ,
   LIB_EVALUATION VARCHAR(64) NOT NULL  ,
   DAT_DEB_EVALUATION DATETIME NOT NULL  ,
   DUREE_EVALUATION TIME NOT NULL  ,
   FL_SUPR_EVALUATION CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_SUPR_EVALUATION in ("O","N")),
   LN_SUJET_EVALUATION mediumblob    ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME, 
   DAT_OUV_EVAL DATETIME
   , PRIMARY KEY (ID_EVALUATION) 
 ) 
 comment = "Evaluation";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_EVALUATION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EV_EVALUATION_PA_PARAM_GLOB
     ON EV_EVALUATION (ID_PA_TYPE_EVALUATION ASC);

CREATE  INDEX I_FK_EV_EVALUATION_PA_MATIERE
     ON EV_EVALUATION (ID_MATIERE ASC);
	 
CREATE  INDEX I_FK_EV_EVALUATION_PA_SOU_MATIERE
     ON EV_EVALUATION (ID_SOU_MATIERE ASC);
	 
CREATE  INDEX I_FK_EV_EVALUATION_PA_CLASSE
     ON EV_EVALUATION (ID_CLASSE ASC);

CREATE  INDEX I_FK_EV_EVALUATION_PA_PARAM_GLOB1
     ON EV_EVALUATION (ID_PA_STATU_EVALUATION ASC);
     
CREATE  INDEX I_FK_EV_EVALUATION_PA_PARAM_GLOB2
     ON EV_EVALUATION (ID_PA_STATU_VALID ASC);

CREATE  INDEX I_FK_EV_EVALUATION_PA_ANNEE_SCOLAIRE
     ON EV_EVALUATION (ID_AN_SCOLAIRE ASC);
	 # -----------------------------------------------------------------------------
#       TABLE : ev_comment_difficult
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ev_comment_difficult
(
   ID_DIFFICULT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_DIFFICULT INTEGER,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER ,
   ID_MATIERE INTEGER,
   ID_PA_PERIODE INTEGER,
   ID_PA_NIV INTEGER,
   ID_CLASSE INTEGER,
   DESC_DIFFICULT VARCHAR(256) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME    
   , PRIMARY KEY (ID_DIFFICULT) 
)
 comment = "Commentaire difficulte";

# -----------------------------------------------------------------------------
#       TABLE : ev_comment_solution
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ev_comment_solution
(
   ID_SOLUTION INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_SOLUTION INTEGER,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER ,
   ID_MATIERE INTEGER,
   ID_PA_PERIODE INTEGER,
   ID_PA_NIV INTEGER,
   ID_CLASSE INTEGER,
   DESC_SOLUTION VARCHAR(256) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME    
   , PRIMARY KEY (ID_SOLUTION) 
)  comment = "commentaire solution";

# -----------------------------------------------------------------------------
#       TABLE : PA_RESSOURCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_RESSOURCE
 (
   ID_RESRC INTEGER NOT NULL AUTO_INCREMENT ,
   COD_RESRC CHAR(5) NOT NULL  ,
   LIB_RESRC VARCHAR(128) NOT NULL  ,
   QTE_TT_RESRC BIGINT(4) NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_RESRC) 
 ) 
 comment = "Ressource";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_RESSOURCE
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_PU_PA_RESSOURCE
     ON PA_RESSOURCE (COD_RESRC ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_SALLE
 (
   ID_SALLE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_BAT INTEGER NULL  ,
   COD_SALLE CHAR(5) NOT NULL  ,
   LIB_SALLE VARCHAR(64) NOT NULL  ,
   FLG_DISPO_SAL CHAR(1) NOT NULL  
      DEFAULT "O"     CHECK (FLG_DISPO_SAL in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_SALLE) 
 ) 
 comment = "Salle";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_SALLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_SALLE_PA_BATIMENT
     ON PA_SALLE (ID_BAT ASC);

CREATE UNIQUE INDEX I_PU_PA_SALLE
     ON PA_SALLE (COD_SALLE ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_ARTICLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_ARTICLE
 (
   ID_ARTICLE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_CHAPITRE INTEGER NOT NULL  ,
   COD_ARTICLE VARCHAR(5) NOT NULL  ,
   NUM_ARTICLE VARCHAR(5) NOT NULL  ,
   LIB_CRT_ARTICLE VARCHAR(64) NOT NULL  ,
   LIB_LNG_ARTICLE VARCHAR(128) NULL  ,
   PU_ARTICLE DECIMAL(13,2) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME 
   , PRIMARY KEY (ID_ARTICLE) 
 ) 
 comment = "Article";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_ARTICLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_ARTICLE_PA_CHAPITRE
     ON PA_ARTICLE (ID_CHAPITRE ASC);

CREATE UNIQUE INDEX I_PU_PA_ARTICLE
     ON PA_ARTICLE (COD_ARTICLE ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_CHAPITRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_CHAPITRE
 (
   ID_CHAPITRE INTEGER NOT NULL AUTO_INCREMENT ,
   COD_CHAPITR VARCHAR(5) NULL  ,
   LIB_CRT_CHAPITR VARCHAR(64) NULL  ,
   LIB_LNG_CHAPITR VARCHAR(128) NULL  ,
   COD_TYPE_CHAPITR VARCHAR(3) NULL  ,
   LIB_TYPE_CHAPITR VARCHAR(64) NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME  
   , PRIMARY KEY (ID_CHAPITRE) 
 ) 
 comment = "Chapitre";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_CHAPITRE
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_PU_PA_CHAPITRE
     ON PA_CHAPITRE (COD_CHAPITR ASC);


# -----------------------------------------------------------------------------
#       TABLE : EL_DOCUMENT_BOURSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_DOCUMENT_BOURSE
 (
   ID_DOC_BOURSE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_BOURSE INTEGER NOT NULL  ,
   ID_PA_DOC INTEGER NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME  ,
    PRIMARY KEY (ID_DOC_BOURSE) 
 ) 
 comment = "Document Bourse";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_DOCUMENT_BOURSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_DOCUMENT_BOURSE_EL_PARAM_BOURSE
     ON EL_DOCUMENT_BOURSE (ID_BOURSE ASC);

CREATE  INDEX I_FK_EL_DOCUMENT_BOURSE_PA_PARAM_GLOB
     ON EL_DOCUMENT_BOURSE (ID_PA_DOC ASC);						   
# -----------------------------------------------------------------------------
#       TABLE : PA_SOUS_ARTICLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_SOUS_ARTICLE
 (
   ID_SS_ARTICL INTEGER NOT NULL AUTO_INCREMENT ,
   ID_ARTICLE INTEGER NOT NULL  ,
   COD_SS_ARTICL VARCHAR(7) NOT NULL  ,
   NUM_SS_ARTICL VARCHAR(6) NOT NULL  ,
   LIB_CRT_SS_ARTICL VARCHAR(64) NOT NULL  ,
   LIB_LNG_SS_ARTICL VARCHAR(128) NOT NULL  ,
   PU_SS_ARTICL DECIMAL(13,2) NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_SS_ARTICL) 
 ) 
 comment = "Sous Article";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_SOUS_ARTICLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_SOUS_ARTICLE_PA_ARTICLE
     ON PA_SOUS_ARTICLE (ID_ARTICLE ASC);

CREATE UNIQUE INDEX I_PU_PA_SOUS_ARTICLE
     ON PA_SOUS_ARTICLE (COD_SS_ARTICL ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_PROVINCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PROVINCE
 (
   ID_PROV INTEGER NOT NULL AUTO_INCREMENT ,
   ID_REG INTEGER NOT NULL  ,
   COD_PROV CHAR(4) NULL  ,
   LIB_PROV VARCHAR(64) NOT NULL  ,
   CHF_LIE_PROV VARCHAR(64) NOT NULL  ,
   LB_ARTICLE VARCHAR(10) ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_PROV) 
 ) 
 comment = "Province";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_PROVINCE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_PROVINCE_PA_REGION
     ON PA_PROVINCE (ID_REG ASC);

CREATE UNIQUE INDEX I_PU_PA_PROVINCE
     ON PA_PROVINCE (COD_PROV ASC);


# -----------------------------------------------------------------------------
#       TABLE : EV_REL_EVALUATION_PERIODE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_REL_EVALUATION_PERIODE
 (
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_EVALUATION INTEGER NOT NULL  ,
   COEF_EVAL DECIMAL(4,2) NOT NULL ,
   FL_PERIOD_PRINC CHAR(1) NOT NULL     DEFAULT 'O'    CHECK (FL_PERIOD_PRINC in ('O','N')),
    USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME ,
   PRIMARY KEY (ID_PA_PERIODE,ID_EVALUATION) 
 ) 
 comment = "Evaluation Periode";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_REL_EVALUATION_PERIODE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EV_REL_EVALUATION_PERIODE_PA_PARAM_GLOB
     ON EV_REL_EVALUATION_PERIODE (ID_PA_PERIODE ASC);

CREATE  INDEX I_FK_EV_REL_EVALUATION_PERIODE_EV_EVALUATION
     ON EV_REL_EVALUATION_PERIODE (ID_EVALUATION ASC);
# -----------------------------------------------------------------------------
#       TABLE : EV_REL_PARAM_GLOB
# -----------------------------------------------------------------------------
CREATE TABLE EV_REL_PARAM_GLOB (
    ID_REL_PARAM_GLOB INT AUTO_INCREMENT PRIMARY KEY,
    ID_PARAM_GLOB INT NOT NULL,
    ID_NIV_ETUDE INT NULL,
    ID_NIV_ETUDE_UNIQUE INT GENERATED ALWAYS AS (COALESCE(ID_NIV_ETUDE, -1)) STORED,
    MOY_MIN DECIMAL(4,2) NOT NULL,
    MOY_MAX DECIMAL(4,2) NOT NULL,
    NB_HEUR_ABSENCE_MAX INT DEFAULT 0,
    NB_INCIDENT_MAX INT DEFAULT 0
     ) COMMENT ='RÈGLE D\'ATTRIBUTION DES TABLEAUX D\'HONNEUR ET DE CONDUITE';

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_REL_PARAM_GLOB
# -----------------------------------------------------------------------------

ALTER TABLE EV_REL_PARAM_GLOB
ADD UNIQUE INDEX UK_PARAM_NIVEAU_FIX (ID_PARAM_GLOB, ID_NIV_ETUDE_UNIQUE);

 # -----------------------------------------------------------------------------
#       TABLE : EM_REL_DISPO_CLASSE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EM_REL_DISPO_CLASSE
 (
   ID_HORAIRE_HBDO INTEGER NOT NULL  ,
   ID_CLASSE INTEGER NOT NULL  ,
   FL_DISPO_CLASSE CHAR(1) NOT NULL  
      DEFAULT "O"     CHECK (FL_DISPO_CLASSE in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_HORAIRE_HBDO,ID_CLASSE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_REL_DISPO_CLASSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EM_REL_DISPO_CLASSE_PA_HORAIRE_SEMAINE
     ON EM_REL_DISPO_CLASSE (ID_HORAIRE_HBDO ASC);

CREATE  INDEX I_FK_EM_REL_DISPO_CLASSE_PA_CLASSE
     ON EM_REL_DISPO_CLASSE (ID_CLASSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EM_REL_DISPO_PROF
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EM_REL_DISPO_PROF
 (
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_HORAIRE_HBDO INTEGER NOT NULL  ,
   FL_DISPO_PROF CHAR(1) NOT NULL  
      DEFAULT "O"     CHECK (FL_DISPO_PROF in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_PERSONNEL,ID_HORAIRE_HBDO) 
 ) 
 comment = "Disponibilite Professeur";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_REL_DISPO_PROF
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EM_REL_DISPO_PROF_PE_PROFESSEUR
     ON EM_REL_DISPO_PROF (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_EM_REL_DISPO_PROF_PA_HORAIRE_SEMAINE
     ON EM_REL_DISPO_PROF (ID_HORAIRE_HBDO ASC);
# -----------------------------------------------------------------------------
#       TABLE : EM_REL_CONTRAINT_CLASSE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EM_REL_CONTRAINT_CLASSE
 (
   ID_PA_CTRNT_CLASSE INTEGER NOT NULL  ,
   ID_CLASSE INTEGER NOT NULL  ,
   VALEUR_CTRNT_CLASSE TINYINT NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME    
   , PRIMARY KEY (ID_PA_CTRNT_CLASSE,ID_CLASSE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_REL_CONTRAINT_CLASSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EM_REL_CONTRAINT_CLASSE_PA_PARAM_GLOB
     ON EM_REL_CONTRAINT_CLASSE (ID_PA_CTRNT_CLASSE ASC);

CREATE  INDEX I_FK_EM_REL_CONTRAINT_CLASSE_PA_CLASSE
     ON EM_REL_CONTRAINT_CLASSE (ID_CLASSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EM_REL_CONTRAINT_PROFESSEUR
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EM_REL_CONTRAINT_PROFESSEUR
 (
   ID_PA_CNTRT_PROF INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   VALEUR_CTRNT_PROF TINYINT NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME    
   , PRIMARY KEY (ID_PA_CNTRT_PROF,ID_PERSONNEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_REL_CONTRAINT_PROFESSEUR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EM_REL_CONTRAINT_PROFESSEUR_PA_PARAM_GLOB
     ON EM_REL_CONTRAINT_PROFESSEUR (ID_PA_CNTRT_PROF ASC);

CREATE  INDEX I_FK_EM_REL_CONTRAINT_PROFESSEUR_PE_PROFESSEUR
     ON EM_REL_CONTRAINT_PROFESSEUR (ID_PERSONNEL ASC);

		
/*Ajout manuel du 05/09/2020 pour faciliter la generation de lenploi du temps*/
# -----------------------------------------------------------------------------
#       TABLE : EM_ACTIVITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EM_ACTIVITE
 (
   ID_ACTIVITE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_CLASSE INTEGER NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL,
   DUREE_ACTIVITE SMALLINT NOT NULL,
   DT_MAJ_ACTIVITE DATETIME NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
  , PRIMARY KEY (ID_ACTIVITE) 
 ) 
 comment = "Activite Professeur Classe Matiere";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_ACTIVITE
# -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EM_ACTIVITE_PE_PROFESSEUR
     ON EM_ACTIVITE (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_EM_ACTIVITE_PA_CLASSE
     ON EM_ACTIVITE (ID_CLASSE ASC);

CREATE  INDEX I_FK_EM_ACTIVITE_PA_MATIERE
     ON EM_ACTIVITE (ID_MATIERE ASC);
	 
CREATE  INDEX I_FK_EM_ACTIVITE_PA_ANNEE_SCOLAIRE
     ON EM_ACTIVITE (ID_AN_SCOLAIRE ASC);
	 
# -----------------------------------------------------------------------------
#       TABLE : EM_REL_CLASSE_PROF
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EM_REL_CLASSE_PROF
 (
   ID_CLASSE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   FLAG_PROF_PRINCIP CHAR(1) NOT NULL
   DEFAULT "N"     CHECK (FLAG_PROF_PRINCIP in ("O","N")),
   DT_MAJ_ACTIVITE DATETIME NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
  , PRIMARY KEY (ID_CLASSE,ID_AN_SCOLAIRE,ID_MATIERE) 
 ) 
 comment = "Activite Professeur Classe Matiere";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_REL_CLASSE_PROF
# -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EM_REL_CLASSE_PROF_PE_PROFESSEUR
     ON EM_REL_CLASSE_PROF (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_EM_REL_CLASSE_PROF_PA_CLASSE
     ON EM_REL_CLASSE_PROF (ID_CLASSE ASC);

CREATE  INDEX I_FK_EM_REL_CLASSE_PROF_PA_MATIERE
     ON EM_REL_CLASSE_PROF (ID_MATIERE ASC);

CREATE  INDEX I_FK_EM_REL_CLASSE_PROF_PA_ANNEE_SCOLAIRE
     ON EM_REL_CLASSE_PROF (ID_AN_SCOLAIRE ASC);
	
# -----------------------------------------------------------------------------
#       TABLE : PE_REL_FORMATION_PERSONNEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_REL_FORMATION_PERSONNEL
 (
   ID_PA_FORMATION_PERS INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   LB_FORM_PERS VARCHAR(64) NOT NULL  ,
   DAT_DEB_FORM_PERS DATETIME NOT NULL  ,
   /* Correction manuelle  Fousséni OUATTARA 09/08/2020*/
   DAT_FIN_FORM_PERS DATETIME NOT NULL  ,
   LIEU_FORM_PERS VARCHAR(128) NOT NULL  ,
   MOTF_FORM_PERS VARCHAR(128) NOT NULL  ,
   ID_PA_STATU_FORM_PERS INTEGER NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME     
   , PRIMARY KEY (ID_PA_FORMATION_PERS,ID_PERSONNEL) 
 ) 
 comment = "Formation Personnel";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_REL_FORMATION_PERSONNEL
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB
     ON PE_REL_FORMATION_PERSONNEL (ID_PA_FORMATION_PERS ASC);

CREATE  INDEX I_FK_PE_REL_FORMATION_PERSONNEL_PE_PERSONNEL
     ON PE_REL_FORMATION_PERSONNEL (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB2
     ON PE_REL_FORMATION_PERSONNEL (ID_PA_STATU_FORM_PERS ASC);

# -----------------------------------------------------------------------------
#       TABLE : EV_REL_NOTE_EVAL_ELEVE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_REL_NOTE_EVAL_ELEVE
 (
   ID_EVALUATION INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   NOT_EVALUATION DECIMAL(4,2) NOT NULL  ,
   DAT_ENR_EVALUATION DATETIME NULL  ,
   DAT_VERIF_EVALUATION DATETIME NULL  ,
   DAT_VALID_EVALUATION DATETIME NULL  ,
   FL_ENR_EVALUATION CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_ENR_EVALUATION in ("O","N")),
   FL_VERIF_EVALUATION CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_VERIF_EVALUATION in ("O","N")),
   FL_VALID_EVALUATION CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_VALID_EVALUATION in ("O","N")),
    USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME ,
   PRIMARY  KEY (ID_EVALUATION,ID_INSCRIPTION) 
 ) 
 comment = "Evaluation Eleve";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_REL_NOTE_EVAL_ELEVE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EV_REL_NOTE_EVAL_ELEVE_EV_EVALUATION
     ON EV_REL_NOTE_EVAL_ELEVE (ID_EVALUATION ASC);

CREATE  INDEX I_FK_EV_REL_NOTE_EVAL_ELEVE_EL_INSCRIPTION
     ON EV_REL_NOTE_EVAL_ELEVE (ID_INSCRIPTION ASC);

# -----------------------------------------------------------------------------
#       TABLE : PA_REL_RESRC_SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_REL_RESRC_SALLE
 (
   ID_RESRC INTEGER NOT NULL  ,
   ID_SALLE INTEGER NOT NULL  ,
   QTE_RESRC_SALLE INTEGER NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME 
   , PRIMARY KEY (ID_RESRC,ID_SALLE) 
 ) 
 comment = "Ressource Salle";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_REL_RESRC_SALLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_REL_RESRC_SALLE_PA_RESSOURCE
     ON PA_REL_RESRC_SALLE (ID_RESRC ASC);

CREATE  INDEX I_FK_PA_REL_RESRC_SALLE_PA_SALLE
     ON PA_REL_RESRC_SALLE (ID_SALLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EL_REL_DOC_ADMINSTR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_REL_DOC_ADMINSTR
 (
   ID_DOC_ADMINSTR INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_TYP_DOC INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   DAT_DOC_ADMINSTR DATETIME NOT NULL  ,
   ETAT_DOC_ADMINSTR CHAR(1) NOT NULL  ,
  /* Ajout des modifications mannuel le 09/08/2020 */
   DATE_ENTR DATETIME,
   DATE_SORTIE DATETIME,
   MOTIF_DOCUMENT VARCHAR(256),
   LN_DOC_ADMINSTR VARCHAR(1024) NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME  
   , PRIMARY KEY (ID_DOC_ADMINSTR) 
 ) 
 comment = "Document administratif";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_REL_DOC_ADMINSTR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_REL_DOC_ADMINSTR_PA_PARAM_GLOB
     ON EL_REL_DOC_ADMINSTR (ID_PA_TYP_DOC ASC);

CREATE  INDEX I_FK_EL_REL_DOC_ADMINSTR_EL_INSCRIPTION
     ON EL_REL_DOC_ADMINSTR (ID_INSCRIPTION ASC);

# -----------------------------------------------------------------------------
#       TABLE : EL_REL_DIPLOME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_REL_DIPLOME
 (
   ID_ELEVE INTEGER NOT NULL  ,
   ID_PA_DIPLOME INTEGER NOT NULL  ,
    ID_AN_SCOLAIRE INTEGER,
   DATE_DIPLOME DATE NOT NULL  ,
   NB_POIN_DIPLOME DECIMAL(6,2) NOT NULL  ,
   MOY_DIPLOME DECIMAL(4,2) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_ELEVE,ID_PA_DIPLOME) 
 ) 
 comment = "Diplome Eleve";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_REL_DIPLOME
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_REL_DIPLOME_EL_ELEVE
     ON EL_REL_DIPLOME (ID_ELEVE ASC);

CREATE  INDEX I_FK_EL_REL_DIPLOME_PA_PARAM_GLOB
     ON EL_REL_DIPLOME (ID_PA_DIPLOME ASC);

# -----------------------------------------------------------------------------
#       TABLE : PA_REL_MATIERE_NIV_ETUD
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_REL_MATIERE_NIV_ETUD
 (
   ID_MATIERE INTEGER NOT NULL  ,
   ID_NIV_ETU INTEGER NOT NULL  ,
   VOLUM_HOR_HEBD SMALLINT NOT NULL  ,
   COEFFICIENT DECIMAL(4,2) NOT NULL  ,
   DESC_MAT_NIV_ETUD VARCHAR(1024) NOT NULL  ,
   ID_PA_MODULE INTEGER NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_MATIERE,ID_NIV_ETU) 
 ) 
 comment = "Matiere Niveau Etude";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_REL_MATIERE_NIV_ETUD
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_REL_MATIERE_NIV_ETUD_PA_MATIERE
     ON PA_REL_MATIERE_NIV_ETUD (ID_MATIERE ASC);

CREATE  INDEX I_FK_PA_REL_MATIERE_NIV_ETUD_PA_NIV_ETUDE
     ON PA_REL_MATIERE_NIV_ETUD (ID_NIV_ETU ASC);

CREATE  INDEX I_FK_PA_REL_MATIERE_NIV_ETUD_PA_PARAM_GLOB
     ON PA_REL_MATIERE_NIV_ETUD (ID_PA_MODULE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PE_REL_MATIERE_PROFESSEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_REL_MATIERE_PROFESSEUR
 (
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_PERSONNEL,ID_MATIERE) 
 ) 
 comment = "Matiere Professeur";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_REL_MATIERE_PROFESSEUR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_REL_MATIERE_PROFESSEUR_PE_PROFESSEUR
     ON PE_REL_MATIERE_PROFESSEUR (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_PE_REL_MATIERE_PROFESSEUR_PA_MATIERE
     ON PE_REL_MATIERE_PROFESSEUR (ID_MATIERE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PE_REL_FONCTION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_REL_FONCTION
 (
   ID_ETAB INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_PA_FONCTION INTEGER NOT NULL  ,
   DAT_DEB_FONCTION DATE NOT NULL  ,
   FLAG_ACTF_FONCTION CHAR(1) NOT NULL  
      DEFAULT "O"     CHECK (FLAG_ACTF_FONCTION in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_ETAB,ID_PERSONNEL,DAT_DEB_FONCTION) 
 ) 
 comment = "Fonction";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_REL_FONCTION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_REL_FONCTION_PA_ETABLISSEMENT
     ON PE_REL_FONCTION (ID_ETAB ASC);

CREATE  INDEX I_FK_PE_REL_FONCTION_PE_PERSONNEL
     ON PE_REL_FONCTION (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_PE_REL_FONCTION_PA_PARAM_GLOB
     ON PE_REL_FONCTION (ID_PA_FONCTION ASC);

# -----------------------------------------------------------------------------
#       TABLE : PA_REL_PERIOD_EVALUATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_REL_PERIOD_EVALUATION
 (
   ID_PA_TYP_PERIOD INTEGER NOT NULL  ,
   ID_ETAB INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_PA_PERIOD_EVAL INTEGER NOT NULL  ,
   DAT_OUV_EVAL CHAR(32) NOT NULL  ,
   DAT_FER_EVAL CHAR(32) NOT NULL  ,
   FL_MOY_GNRL CHAR(1) NOT NULL       CHECK (FL_MOY_GNRL in ("O","N")),
   FL_FERM_PERIOD CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_FERM_PERIOD in ("O","N")),
   FL_DERN_PERIOD CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_DERN_PERIOD in ("O","N")),
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME
   , PRIMARY KEY (ID_AN_SCOLAIRE,ID_PA_PERIOD_EVAL) 
 ) 
 comment = "Periode Evaluation";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_REL_PERIOD_EVALUATION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB
     ON PA_REL_PERIOD_EVALUATION (ID_PA_TYP_PERIOD ASC);

CREATE  INDEX I_FK_PA_REL_PERIOD_EVALUATION_PA_ETABLISSEMENT
     ON PA_REL_PERIOD_EVALUATION (ID_ETAB ASC);

CREATE  INDEX I_FK_PA_REL_PERIOD_EVALUATION_PA_ANNEE_SCOLAIRE
     ON PA_REL_PERIOD_EVALUATION (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB2
     ON PA_REL_PERIOD_EVALUATION (ID_PA_PERIOD_EVAL ASC);

# -----------------------------------------------------------------------------
#       TABLE : PE_REL_DIPLOME_PERSONNEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_REL_DIPLOME_PERSONNEL
 (
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_PA_DIPLOME INTEGER NOT NULL  ,
   DAT_DIPLOM_PERSONNEL DATE NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_PERSONNEL,ID_PA_DIPLOME) 
 ) 
 comment = "Diplome Personnel";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_REL_DIPLOME_PERSONNEL
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_REL_DIPLOME_PERSONNEL_PE_PERSONNEL
     ON PE_REL_DIPLOME_PERSONNEL (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_PE_REL_DIPLOME_PERSONNEL_PA_PARAM_GLOB
     ON PE_REL_DIPLOME_PERSONNEL (ID_PA_DIPLOME ASC);

# -----------------------------------------------------------------------------
#       TABLE : EL_REL_DEPOT_DOSSIER_DOCUMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_REL_DEPOT_DOSSIER_DOCUMENT
 (
   ID_DOC_BOURSE INTEGER NOT NULL  ,
   ID_DOS_BOURSE INTEGER NOT NULL  ,
   DATE_DOC_RECU DATE NOT NULL  ,
   DOC_RECU CHAR(1) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_DOC_BOURSE,ID_DOS_BOURSE) 
 ) 
 comment = "Document Depot Dossier";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_REL_DEPOT_DOSSIER_DOCUMENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOCUMENT_BOURSE
     ON EL_REL_DEPOT_DOSSIER_DOCUMENT (ID_DOC_BOURSE ASC);

CREATE  INDEX I_FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOSSIER_BOURSE
     ON EL_REL_DEPOT_DOSSIER_DOCUMENT (ID_DOS_BOURSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EM_VERSION_EMPLOITEMPS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EM_VERSION_EMPLOITEMPS
 (
   ID_VERSION_EMPLOITEMPS SMALLINT NOT NULL AUTO_INCREMENT ,
   ID_CLASSE INTEGER NOT NULL,
    ID_AN_SCOLAIRE INTEGER NOT NULL,
   LIB_VERSION_EMPLOITEMPS VARCHAR(128) NOT NULL  ,
   STATU_EMPLOITEMPS CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (STATU_EMPLOITEMPS in ("I","O","N")) ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_VERSION_EMPLOITEMPS) 
 ) 
 comment = "";
 CREATE  INDEX I_FK_EM_VERSION_EMPLOITEMPS_PA_CLASSE
     ON EM_VERSION_EMPLOITEMPS (ID_CLASSE ASC);
CREATE  INDEX I_FK_EM_VERSION_EMPLOITEMPS_PA_ANNEE_SCOLAIRE
     ON EM_VERSION_EMPLOITEMPS (ID_AN_SCOLAIRE ASC);
# -----------------------------------------------------------------------------
#       TABLE : PE_NOTE_PERSONNEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_NOTE_PERSONNEL
 (
   ID_NOTE_PERS INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   NOTE_GLOB_PERS DECIMAL(6,2) NOT NULL  ,
   DAT_NOTE_PERS DATETIME NOT NULL  ,
   LIEU_NOTE_PERS VARCHAR(64) NOT NULL  ,
   LN_FICHIER_PROCES_VERBAL VARCHAR(1024) NULL  ,
   COMMENT_NOTE_PERS VARCHAR(255) NOT NULL  ,
   DAT_SIGN_PROCES_VERBAL_PERS DATE NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_NOTE_PERS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_NOTE_PERSONNEL
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_NOTE_PERSONNEL_PE_PERSONNEL
     ON PE_NOTE_PERSONNEL (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_PE_NOTE_PERSONNEL_PA_ANNEE_SCOLAIRE
     ON PE_NOTE_PERSONNEL (ID_AN_SCOLAIRE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PE_REL_DETAIL_NOTE_PERSONNEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_REL_DETAIL_NOTE_PERSONNEL
 (
   NOTE_PERS DECIMAL(6,2) NOT NULL  ,
   ID_PA_DETAIL_NOTE_PERS INTEGER NOT NULL  ,
   ID_NOTE_PERS INTEGER NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_PA_DETAIL_NOTE_PERS,ID_NOTE_PERS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_REL_DETAIL_NOTE_PERSONNEL
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_REL_DETAIL_NOTE_PERSONNEL_PA_PARAM_GLOB
     ON PE_REL_DETAIL_NOTE_PERSONNEL (ID_PA_DETAIL_NOTE_PERS ASC);

CREATE  INDEX I_FK_PE_REL_DETAIL_NOTE_PERSONNEL_PE_NOTE_PERSONNEL
     ON PE_REL_DETAIL_NOTE_PERSONNEL (ID_NOTE_PERS ASC);

# -----------------------------------------------------------------------------
#       TABLE : EV_REL_REGLE_MOYENNE_PERIODE_MATIERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EV_REL_REGLE_MOYENNE_PERIODE_MATIERE
 (
   ID_MATIERE INTEGER NOT NULL  ,
   ID_PA_PERIODE INTEGER NOT NULL  ,
   ID_PA_REGL_CALC_MOY INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_CLASSE INTEGER NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_MAJ DATETIME ,
   PRIMARY KEY (ID_MATIERE,ID_PA_PERIODE,ID_AN_SCOLAIRE,ID_CLASSE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_MATIERE
     ON EV_REL_REGLE_MOYENNE_PERIODE_MATIERE (ID_MATIERE ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB
     ON EV_REL_REGLE_MOYENNE_PERIODE_MATIERE (ID_PA_PERIODE ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB2
     ON EV_REL_REGLE_MOYENNE_PERIODE_MATIERE (ID_PA_REGL_CALC_MOY ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_ANNEE_SCOLAIRE
     ON EV_REL_REGLE_MOYENNE_PERIODE_MATIERE (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_CLASSE
     ON EV_REL_REGLE_MOYENNE_PERIODE_MATIERE (ID_CLASSE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EL_REL_CHEF_CLASSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EL_REL_CHEF_CLASSE
 (
   ID_CLASSE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_INSCRIPTION_CHEF INTEGER NOT NULL  ,
    ID_INSCRIPTION_SOU_CHEF INTEGER NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME    
   , PRIMARY KEY (ID_CLASSE,ID_AN_SCOLAIRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EL_REL_CHEF_CLASSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EL_REL_CHEF_CLASSE_PA_CLASSE
     ON EL_REL_CHEF_CLASSE (ID_CLASSE ASC);

CREATE  INDEX I_FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_CHEF
     ON EL_REL_CHEF_CLASSE (ID_INSCRIPTION_CHEF ASC);

CREATE  INDEX I_FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_SOU_CHEF
     ON EL_REL_CHEF_CLASSE (ID_INSCRIPTION_SOU_CHEF ASC);
	 
CREATE  INDEX I_FK_EL_REL_CHEF_CLASSE_PA_ANNEE_SCOLAIRE
     ON EL_REL_CHEF_CLASSE (ID_AN_SCOLAIRE ASC);
#-----------------------------------------------------Ajout tables COMPTABILITE------------------------------------------------------------------
# -----------------------------------------------------------------------------
# TABLE : CO_AUTR_DEPENSE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_AUTR_DEPENSE
 (
   ID_DEPENSE INTEGER NOT NULL  ,
   NUM_ORDR_FACTUR INTEGER NOT NULL  ,
   ID_PA_UNIT_MESURE INTEGER NOT NULL  ,
   ID_SS_ARTICL INTEGER NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_ARTICLE INTEGER NOT NULL  ,
   DAT_DEPEN_AUTR DATETIME NOT NULL  ,
   QTE_DEPEN_AUTR INTEGER NOT NULL  ,
   PU_DEPEN DECIMAL(8,2) NOT NULL  ,
   MT_DEPEN_AUTR DECIMAL(10,2) NOT NULL  ,
   MT_DEPEN_PAY DECIMAL(10,2) NOT NULL , 
   /* Ajout mannuel 04/10/2020*/
   MT_DEPEN_TOT_PAYE DECIMAL(10,2) NOT NULL  ,
   INFO_FOURNISEUR VARCHAR(256) NOT NULL  ,
   /* Ajout mannuel 24/09/2020*/
   LIB_DEPENS VARCHAR(128) NOT NULL ,
   /*Ajout manuel 15/08/2024*/
   NO_RECU varchar(255) default null,
   DESC_DEPENS VARCHAR(256) NULL  ,
   DAT_UPD_DEPEN_AUTR DATETIME NULL  ,
   LN_FACTUR VARCHAR(1024) NOT NULL ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,    
    PRIMARY KEY (ID_DEPENSE,NUM_ORDR_FACTUR) 
 ) 
 comment = "Depense Autre";
 # -----------------------------------------------------------------------------
 #     TABLE CO_CRED_PERS
 # -----------------------------------------------------------------------------
 CREATE TABLE CO_CRED_PERS (
     ID_CRED INT NOT NULL AUTO_INCREMENT ,
     ID_PERS_EMPL INT NOT NULL,
     ID_DEPENS INT NOT NULL,
     LIB_CRED VARCHAR(64) NOT NULL,
     DESC_CRED VARCHAR(512),
     ID_PA_ECHENCE INT NOT NULL,
     DAT_CREDIT VARCHAR(10) NOT NULL,
     DAT_DEB_PAY VARCHAR(10) NOT NULL,
     DAT_FIN_PAY VARCHAR(10) NOT NULL,
     NB_ECHEANCE INT NOT NULL,
     MT_TOT_CRED DECIMAL(10,2) NOT NULL,
     MT_PAY_CRED DECIMAL(10,2) DEFAULT 0,
     MT_REST_PAY_CRED DECIMAL(10,2) NOT NULL,
     USERNAME_CREA VARCHAR(45) DEFAULT NULL,
     DAT_CREA DATETIME DEFAULT NULL,
     USERNAME_UPD VARCHAR(45) DEFAULT NULL,
     DAT_UPD DATETIME DEFAULT NULL,
     PRIMARY KEY(ID_CRED)
 )
  comment = "Credit Personnel";
 ;
 # -----------------------------------------------------------------------------
 #      TABLE CO_ECHEANCE
 # -----------------------------------------------------------------------------
 CREATE TABLE CO_ECHEANCE (
     ID_ECHEANCE INT NOT NULL AUTO_INCREMENT ,
     ID_CRED INT NOT NULL,
     ID_PA_ECHENCE INT NOT NULL,
     MT_ECHEANCE DECIMAL(10,2) NOT NULL,
     DAT_ECHEANCE DATE NOT NULL,
     NUM_ORDR INT NOT NULL,
     USERNAME_CREA VARCHAR(45) DEFAULT NULL,
     DAT_CREA DATETIME DEFAULT NULL,
     USERNAME_UPD VARCHAR(45) DEFAULT NULL,
     DAT_UPD DATETIME DEFAULT NULL,
     PRIMARY KEY(ID_ECHEANCE)
 )
  comment = "Echeance credit Personnel";
  # -----------------------------------------------------------------------------
  #     TABLE CO_PAIE_CRED
  # -----------------------------------------------------------------------------
 CREATE TABLE CO_PAIE_CRED (
     ID_REC INT NOT NULL,
     ID_ECHEANCE INT NOT NULL,
     ID_RECETTE INT NOT NULL,
     DAT_PAY DATE NOT NULL,
     MT_PAY DECIMAL(10,2) NOT NULL,
     USERNAME_CREA VARCHAR(45) DEFAULT NULL,
     DAT_CREA DATETIME DEFAULT NULL,
     USERNAME_UPD VARCHAR(45) DEFAULT NULL,
     DAT_UPD DATETIME DEFAULT NULL,
     PRIMARY KEY(ID_RECETTE)
 )
  comment = "Paiement credit Personnel";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_AUTR_DEPENSE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PA_PARAM_GLOB
     ON CO_AUTR_DEPENSE (ID_PA_UNIT_MESURE ASC);
CREATE  INDEX I_FK_CO_AUTR_DEPENSESE_USERNAME_CREA
     ON CO_AUTR_DEPENSE (USERNAME_CREA ASC);

CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PA_SOUS_ARTICLE
     ON CO_AUTR_DEPENSE (ID_SS_ARTICL ASC);

CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PA_ANNEE_SCOLAIRE
     ON CO_AUTR_DEPENSE (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_CO_AUTR_DEPENSE_CO_LST_DEPENSE
     ON CO_AUTR_DEPENSE (ID_DEPENSE ASC);

CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PA_ARTICLE
     ON CO_AUTR_DEPENSE (ID_ARTICLE ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_DEPENSE_SE_USERNAME_CREA
     ON CO_AUTR_DEPENSE (USERNAME_CREA ASC);

# -----------------------------------------------------------------------------
#       TABLE : CO_ANNUL_TRANSAC
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_ANNUL_TRANSACT
 (
   ID_TRANSAC INTEGER NOT NULL  ,
   ID_DEPENSE INTEGER  NULL  ,
   NUM_ORDR_PAIE_DEP INTEGER  NULL  ,
   ID_RECETTE INTEGER  NULL  ,
   NUM_ORDR_PAIE_REC INTEGER  NULL  ,
   NO_RECU VARCHAR(64)  NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_TRANSAC_ANNUL INTEGER  NULL,
   ID_PERS_USR_1 INTEGER NOT NULL  ,
   ID_PERS_USR_2 INTEGER  NULL  ,
   DAT_ANNUL DATETIME NOT NULL  ,
   MT_ANNUL DECIMAL(10,2) NOT NULL  ,
   /*Montant total de la depense ou de la recette annulle */
   MT_TOT_OPE_COMPTA DECIMAL(10,2)  NULL,
  /*Montant total paye de la depense ou de la recette annulle */
   MT_TOT_PAY_OPE_COMPTA DECIMAL(10,2)  NULL,
   ID_PA_MOTF_ANNUL INTEGER NOT NULL ,
   ID_PA_STATU_ANNUL INTEGER NOT NULL ,
   CO_TABLE_DEPENSE VARCHAR(64) NOT NULL ,
   DESC_DEPENSE_ANNUL VARCHAR(256) not NULL  ,
   prev_num_ordr_paie_rec int,
    prev_num_ordr_paie_dep int,
   DAT_UPD_ANNUL DATETIME NULL  ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,    
   USERNAME_UPD VARCHAR(45), 
   TS_UPD DATETIME,
    PRIMARY KEY (ID_TRANSAC) 
 ) 
 comment ="Transaction annulation";
 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_ANNUL_TRANSACT
# -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CO_ANNUL_TRANSACT_CO_LST_ID_DEPENSE
     ON CO_ANNUL_TRANSACT (ID_DEPENSE ASC);

CREATE  INDEX I_FK_CO_ANNUL_TRANSACT_PA_PARAM_GLOB
     ON CO_ANNUL_TRANSACT (ID_PA_MOTF_ANNUL ASC);

CREATE  INDEX I_FK_CO_ANNUL_TRANSACT_PA_ANNEE_SCOLAIRE
     ON CO_ANNUL_TRANSACT (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_CO_ANNUL_TRANSACT_SE_USERNAME_CREA
     ON CO_ANNUL_TRANSACT (USERNAME_CREA ASC);

CREATE  INDEX I_FK_CO_ANNUL_TRANSACT_CO_LIST_ID_RECETTE
     ON CO_ANNUL_TRANSACT (ID_RECETTE ASC);
	 

CREATE  INDEX I_FK_CO_ANNUL_TRANSACT_CO_TRANSACT
     ON CO_ANNUL_TRANSACT (ID_TRANSAC ASC);
	 
CREATE  INDEX I_FK_CO_ANNUL_TRANSACT_CO_TRANSACT_ANNULL
     ON CO_ANNUL_TRANSACT (ID_TRANSAC_ANNUL ASC);
 # -----------------------------------------------------------------------------
#       TABLE : CO_INSCRIPTION_CANTINE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_INSCRIPTION_CANTINE
 (
   ID_INSCR_CANTINE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   ID_PA_PLAT INTEGER NOT NULL  ,
   ID_RECETTE INTEGER NOT NULL  ,
   NUM_ORDR_PAIE INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   NB_PLAT SMALLINT NOT NULL  ,
   DAT_INS_CANTINE DATETIME NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME    
   , PRIMARY KEY (ID_INSCR_CANTINE) 
 ) 
 comment = "Inscription Cantine";
 
 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_INSCRIPTION_CANTINE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_CO_INSCRIPTION_CANTINE_EL_INSCRIPTION
     ON CO_INSCRIPTION_CANTINE (ID_INSCRIPTION ASC);

CREATE  INDEX I_FK_CO_INSCRIPTION_CANTINE_PA_PARAM_GLOB
     ON CO_INSCRIPTION_CANTINE (ID_PA_PLAT ASC);
	 
CREATE  INDEX I_FK_CO_INSCRIPTION_CANTINE_SE_USERNAME_CREA
     ON CO_INSCRIPTION_CANTINE (USERNAME_CREA ASC);

CREATE  INDEX I_FK_CO_INSCRIPTION_CANTINE_CO_AUTR_RECETTE
     ON CO_INSCRIPTION_CANTINE (ID_RECETTE ASC,NUM_ORDR_PAIE ASC);

CREATE  INDEX I_FK_CO_INSCRIPTION_CANTINE_PE_PERSONNEL
     ON CO_INSCRIPTION_CANTINE (ID_PERSONNEL ASC);
	 
# -----------------------------------------------------------------------------
#       TABLE : CO_AUTR_RECETTE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_AUTR_RECETTE
 (
   ID_RECETTE INTEGER NOT NULL  ,
   NUM_ORDR_PAIE INTEGER NOT NULL  ,
   ID_SS_ARTICL INTEGER NULL  ,
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_PA_UNIT_MESURE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
  /*Ajout 07/08/2021*/
   NO_RECU VARCHAR(64) NOT NULL  ,
   /*Fin ajout du 07/08/2021*/
   DAT_REC_AUTR DATETIME NOT NULL  ,
   QTE_REC_AUTR INTEGER NOT NULL  ,
   PU_REC DECIMAL(10,2) NOT NULL  ,
   MT_REC_AUTR DECIMAL(10,2) NOT NULL  ,
   /* Ajout mannuel 04/10/2020*/
   MT_REC_TOT_PAYE DECIMAL(10,2) NOT NULL  ,
   MT_REC_PAYE DECIMAL(10,2) NOT NULL  ,
   /* Ajout mannuel 24/09/2020*/
   LIB_REC_AUTR VARCHAR(128) NOT NULL,
   DESC_REC_AUTR VARCHAR(256) NULL  ,
   DAT_UPD_REC_AUTR DATETIME NULL  ,
   LN_REC_AUTRE VARCHAR(1024) NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,    
    PRIMARY KEY (ID_RECETTE,NUM_ORDR_PAIE) 
 ) 
 comment = "Recette Autre";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_AUTR_RECETTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CO_AUTR_RECETTE_PA_SOUS_ARTICLE
     ON CO_AUTR_RECETTE (ID_SS_ARTICL ASC);

CREATE  INDEX I_FK_CO_AUTR_RECETTE_PA_ARTICLE
     ON CO_AUTR_RECETTE (ID_ARTICLE ASC);

CREATE  INDEX I_FK_CO_AUTR_RECETTE_CO_LIST_ID_RECETTE
     ON CO_AUTR_RECETTE (ID_RECETTE ASC);

CREATE  INDEX I_FK_CO_AUTR_RECETTE_PA_PARAM_GLOB
     ON CO_AUTR_RECETTE (ID_PA_UNIT_MESURE ASC);

CREATE  INDEX I_FK_CO_AUTR_RECETTE_PA_ANNEE_SCOLAIRE
     ON CO_AUTR_RECETTE (ID_AN_SCOLAIRE ASC);

CREATE  INDEX I_FK_CO_AUTR_RECETTE_SE_USERNAME_CREA
     ON CO_AUTR_RECETTE (USERNAME_CREA ASC);
# -----------------------------------------------------------------------------
#       TABLE : CO_CAISSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_CAISSE
 (
   ID_CAISSE INTEGER NOT NULL AUTO_INCREMENT ,
   CODE_CAISSE VARCHAR(24) NOT NULL  ,
   NOM_CAISSE VARCHAR(64) NOT NULL  ,
   DESC_CAISSE VARCHAR(256) NOT NULL  ,
   FLAG_CAISSE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FLAG_CAISSE in ("O","N")),
   SOLD_CAISSE DECIMAL(12,2) NOT NULL  ,
   DAT_CREAT DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   PRIMARY KEY (ID_CAISSE) 
   , UNIQUE INDEX PU_CODE_CAISSE (CODE_CAISSE) 
 ) 
 comment = "";
 # -----------------------------------------------------------------------------
#       TABLE : CO_HISTO_CONXION_CAISSE
# -----------------------------------------------------------------------------
 CREATE TABLE IF NOT EXISTS CO_HISTO_CONXION_CAISSE
 (
   ID_CONXION_CAISSE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_CAISSE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   MT_FINAL_CAISSE DECIMAL(12,2) NOT NULL  ,
   MT_INIT_CAISSE DECIMAL(12,2) NOT NULL  ,
   DAT_CONXION DATETIME NOT NULL  ,
   DAT_DECONXION DATETIME NULL  
   , PRIMARY KEY (ID_CONXION_CAISSE) 
 ) 
 comment = "";
# -----------------------------------------------------------------------------
#       TABLE : CO_TRANSAC_CAISSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_TRANSAC_CAISSE
 (
   ID_TRANSAC INTEGER NOT NULL AUTO_INCREMENT ,
   ID_RECETTE INTEGER  NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   NUM_PAIE_REC SMALLINT  NULL  ,
   ID_DEPENSE INTEGER  NULL  ,
   NUM_PAIE_DEP SMALLINT  NULL  ,
   ID_PA_TYP_TRANSAC INTEGER NOT NULL  ,
   ID_PA_MOY_PAIMEN INTEGER NOT NULL  ,
   ID_CONXION_CAISSE INTEGER NOT NULL  ,
   MT_PAIEMENT_DEP DECIMAL(10,2) NOT NULL DEFAULT 0 ,
   MT_PAIEMENT_REC DECIMAL(10,2) NOT NULL DEFAULT 0 ,
   MT_TOTAL_CAISSE DECIMAL(12,2) NOT NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL ,
   LB_TRANSAC VARCHAR(255),
    PRIMARY KEY (ID_TRANSAC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_TRANSFERT_FOND
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_TRANSFERT_FOND
 (
   ID_TRANSFER_FOND INTEGER NOT NULL AUTO_INCREMENT ,
   ID_DEPENSE INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   NUM_PAIE_DEP SMALLINT NOT NULL  ,
   NUM_PAIE_REC SMALLINT NOT NULL  ,
   ID_RECETTE INTEGER NOT NULL  ,
   ID_PERS_USR_1 INTEGER NOT NULL  ,
   ID_PERS_USR_2 INTEGER NOT NULL  ,
   DESC_TRANSFER VARCHAR(128) NOT NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NULL  ,
   MT_TRANSFER DEC(13,2) NOT NULL  
   , PRIMARY KEY (ID_TRANSFER_FOND) 
 ) 
 comment = "";
 # -----------------------------------------------------------------------------
#       TABLE : CO_REL_CAISSE_ACCESS_PERSONNEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_REL_CAISSE_ACCESS_PERSONNEL
 (
   ID_CAISSE INTEGER NOT NULL  ,
   ID_PERS INTEGER NOT NULL  ,
   FL_LIRE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_LIRE in ("O","N")),
   FL_MODIF CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_MODIF in ("O","N")),
   FL_DROIT CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_DROIT in ("O","N")),
	  USERNAME_CREA VARCHAR(45), 
      TS_CREA DATETIME, 
   	  USERNAME_UPD VARCHAR(45), 
      TS_UPD DATETIME, 
   	  PRIMARY KEY (ID_CAISSE,ID_PERS)
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_PAIEMEN_SALAIR
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_PAIEMEN_SALAIR
 (
   ID_DEPENSE INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_ARTICLE INTEGER  NULL,
   ID_BULTIN integer null,
   /*Ajout 07/08/2021*/
   NO_RECU VArCHAR(64) NOT NULL ,
   /*Fin ajout du 07/08/2021*/
   DT_DEB_MOIS DATE NOT NULL  ,
   DT_FIN_MOIS DATE NOT NULL  ,
   DATE_PAI_SALAIR DATETIME NOT NULL  ,
   TAU_HORAIR_ENSEIGN DECIMAL(8,2) NOT NULL  ,
   NB_HEUR_ENSEIGN INTEGER NOT NULL  ,
   SALAIR_MENS DECIMAL(10,2) NOT NULL  ,
   DOC_IDENTI_PERS VARCHAR(256) NOT NULL  ,
   DESC_SALAIR VARCHAR(256) NULL  ,
   LN_FICH_PAI VARCHAR(1024) NOT NULL, 
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME, 
   PRIMARY KEY (ID_DEPENSE) 
 ) 
 comment = "Paiement Salaire";
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_PAIEMEN_SALAIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CO_PAIEMEN_SALAIR_PE_PERSONNEL
     ON CO_PAIEMEN_SALAIR (ID_PERSONNEL ASC);
	 
CREATE  INDEX I_FK_CO_PAIEMEN_SALAIR_PA_ANNEE_SCOLAIRE
     ON CO_PAIEMEN_SALAIR (ID_AN_SCOLAIRE ASC);

	    CREATE  INDEX I_FK_CO_PAIEMEN_SALAIR_SE_USERNAME_CREA
     ON CO_PAIEMEN_SALAIR (USERNAME_CREA ASC);
# -----------------------------------------------------------------------------
#       TABLE : CO_PAIEMEN_BOURSE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_PAIEMEN_BOURSE
 (
   ID_DEPENSE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
    /*Ajout 07/08/2021*/
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   ID_ARTICLE INTEGER  NULL,
   NO_RECU VARCHAR(64) NOT NULL ,
   /*Fin ajout du 07/08/2021*/
   DAT_DEB_MOIS DATE NOT NULL  ,
   DAT_FIN_MOIS DATE NOT NULL  ,
   DAT_PAI_BOURSE DATETIME NOT NULL  ,
   MT_BOURS_PAYE DECIMAL(10,2) NOT NULL  ,
   DOC_IDENTITE_BOURSE VARCHAR(256) NOT NULL  ,
   DESC_PAI_BOURS VARCHAR(256) NULL  ,
   LN_REC_BOURS VARCHAR(1024) NOT NULL,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,    
   PRIMARY KEY (ID_DEPENSE) 
 ) 
 comment = "Paiement Bourse";
 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_PAIEMEN_BOURSE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CO_PAIEMEN_BOURSE_EL_INSCRIPTION
     ON CO_PAIEMEN_BOURSE (ID_INSCRIPTION ASC);
	 
   CREATE  INDEX I_FK_CO_PAIEMEN_BOURSE_SE_USERNAME_CREA
     ON CO_PAIEMEN_BOURSE (USERNAME_CREA ASC);
	 
CREATE  INDEX I_FK_CO_PAIEMEN_BOURSE_PA_ANNEE_SCOLAIRE
     ON CO_PAIEMEN_BOURSE (ID_AN_SCOLAIRE ASC); 
# -----------------------------------------------------------------------------
#       TABLE : CO_RECETTE_ELEVE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_RECETTE_ELEVE
 (
   ID_RECETTE INTEGER NOT NULL  ,
   NUM_ORDR_PAI INTEGER NOT NULL  ,
   ID_PARAM_SCOLARITE INTEGER NOT NULL  ,
   ID_INSCRIPTION INTEGER NOT NULL  ,
   /*Ajout 07/08/2021*/
   ID_AN_SCOLAIRE INTEGER NOT NULL  ,
   NO_RECU  VARCHAR(64) NOT NULL ,
   /*recette eleve*/
   DAT_RECU DATETIME NOT NULL  ,
   MT_REC_ELEV DECIMAL(10,2) NOT NULL  ,
   MT_REC_TOT_ELEV DECIMAL(10,2) NOT NULL  ,
   MT_SCOL_TOT_PAY DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   MT_TOT_AUTR_FRAIS_PAY DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   DESC_REC_ELEV VARCHAR(256) NULL  ,
   LN_REC_ELEVE VARCHAR(1024) NOT NULL,
   NB_PARAM_SCOLARITE INT DEFAULT 0,
   ID_GROUP_REC INTEGER ,
   USERNAME_CREA VARCHAR(45),
    TS_CREA DATETIME, 
   PRIMARY KEY (ID_RECETTE,NUM_ORDR_PAI) 
 ) 
 comment = "Recette Eleve";
 
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_RECETTE_ELEVE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CO_RECETTE_ELEVE_CO_PARAM_SCOLARITE
     ON CO_RECETTE_ELEVE (ID_PARAM_SCOLARITE ASC);

CREATE  INDEX I_FK_CO_RECETTE_ELEVE_CO_LIST_ID_RECETTE
     ON CO_RECETTE_ELEVE (ID_RECETTE ASC);

CREATE  INDEX I_FK_CO_RECETTE_ELEVE_EL_INSCRIPTION
     ON CO_RECETTE_ELEVE (ID_INSCRIPTION ASC);
	 
   CREATE  INDEX I_FK_CO_RECETTE_ELEVE_SE_USERNAME_CREA
     ON CO_RECETTE_ELEVE (USERNAME_CREA ASC);
CREATE  INDEX I_FK_CO_RECETTE_ELEVE_PA_ANNEE_SCOLAIRE
     ON CO_RECETTE_ELEVE (ID_AN_SCOLAIRE ASC);
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE co_group_recette
# -----------------------------------------------------------------------------
CREATE TABLE co_group_recette (
    id_group_rec INT AUTO_INCREMENT PRIMARY KEY,
    id_inscription integer ,
    mt_rec_groupe DECIMAL(10, 2) NOT NULL,
    dat_crea DATE NOT NULL,
    lien_rec_group VARCHAR(255),
    ln_recu_elv_autr_scol varchar(128),
    ln_rec_elv_scol varchar(128),
    mt_rec_group_scol float ,
    mt_rec_group_rest_scol float ,
    mt_rec_group_autr_scol float,
    mt_rec_group_rest_autr_scol float
);
 # -----------------------------------------------------------------------------
#       TABLE : CO_LST_DEPENSE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_LST_DEPENSE
 (
   ID_DEPENSE INTEGER NOT NULL AUTO_INCREMENT,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME 
   , PRIMARY KEY (ID_DEPENSE) 
 ) 
 comment = "Liste Identifiant Depense";
  CREATE  INDEX I_FK_CO_LST_DEPENSE_SE_USERNAME_CREA
     ON CO_LST_DEPENSE (USERNAME_CREA ASC);
 # -----------------------------------------------------------------------------
#       TABLE : CO_LIST_ID_RECETTE
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_LIST_ID_RECETTE
 (
   ID_RECETTE INTEGER NOT NULL AUTO_INCREMENT ,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME    
   , PRIMARY KEY (ID_RECETTE) 
 ) 
 comment = "List Indentifiant Recette";
 CREATE  INDEX I_FK_CO_LIST_ID_RECETTE_SE_USERNAME_CREA
     ON CO_LIST_ID_RECETTE (USERNAME_CREA ASC);
 # -----------------------------------------------------------------------------
#       TABLE : CO_DERNIER_NUMERO_RECU
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_DERNIER_NUMERO_RECU
 (
   ID_AN_SCOLAIRE INTEGER NOT NULL,
   COD_ELEM_RECU VARCHAR(7) NOT NULL ,
   NO_RECU  VARCHAR(64) NOT NULL ,
   ID_RECU INTEGER NOT NULL 
   , PRIMARY KEY (COD_ELEM_RECU) 
 ) 
 comment = "Dernier numéro de reçu";
   CREATE  INDEX I_FK_CO_DERNIER_NUMERO_RECU_PA_ANNEE_SCOLAIRE
     ON CO_DERNIER_NUMERO_RECU (ID_AN_SCOLAIRE ASC);
# -----------------------------------------------------------------------------
#       TABLE : CO_PARAM_SCOLARITE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_PARAM_SCOLARITE
 (
   ID_PARAM_SCOLARITE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_SS_ARTICL INTEGER NOT NULL  ,
   ID_PA_TYP_ELEV INTEGER NOT NULL  ,
   ID_NIV_ETU INTEGER NOT NULL  ,
   FL_OBLIGATOIRE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_OBLIGATOIRE in ("O","N")),
   MONTANT_SCOLARITE DECIMAL(10,2) NOT NULL ,
   NB_MIN_SCOLARITE INT DEFAULT 0,
   NB_MAX_SCOLARITE INT DEFAULT 0,
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME,
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_PARAM_SCOLARITE) 
 ) 
 comment = "Parametre scolarite";
 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_PARAM_SCOLARITE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CO_PARAM_SCOLARITE_PA_SOUS_ARTICLE
     ON CO_PARAM_SCOLARITE (ID_SS_ARTICL ASC);

CREATE  INDEX I_FK_CO_PARAM_SCOLARITE_PA_PARAM_GLOB
     ON CO_PARAM_SCOLARITE (ID_PA_TYP_ELEV ASC);

CREATE  INDEX I_FK_CO_PARAM_SCOLARITE_PA_NIV_ETUDE
     ON CO_PARAM_SCOLARITE (ID_NIV_ETU ASC);
/*Mannuelle 20/09/2020*/ 
CREATE UNIQUE INDEX I_PU_CO_PARAM_SCOLARITE
     ON CO_PARAM_SCOLARITE(ID_SS_ARTICL ASC,ID_PA_TYP_ELEV ASC,ID_NIV_ETU ASC);

CREATE  INDEX I_FK_CO_PARAM_SCOLARITE_SE_USERNAME_CREA
     ON CO_PARAM_SCOLARITE (USERNAME_CREA ASC);
	 
CREATE  INDEX I_FK_CO_PARAM_SCOLARITE_SE_USERNAME_UPD
     ON CO_PARAM_SCOLARITE (USERNAME_UPD ASC);

 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_SCOLARITE_ECHEANC
# -----------------------------------------------------------------------------

CREATE TABLE CO_SCOLARITE_ECHEANC (
  id_scolarite_echeanc INT NOT NULL AUTO_INCREMENT,
  NUM_TRANCH INT NOT NULL, 
  NB_TRANCH INT NOT NULL, 
  ID_AN_SCOLAIRE INT NOT NULL,
  ID_PA_TYP_ELEV INT NOT NULL,
  POURCENT_SCOLARIT DECIMAL(5, 2) NOT NULL CHECK (POURCENT_SCOLARIT >= 0 AND POURCENT_SCOLARIT <= 1),
  ID_NIV_ETU INT NOT NULL,
  DATE_LIMITE VARCHAR(100) NOT NULL,
  FL_DELETE VARCHAR(2) NOT NULL CHECK (FL_DELETE IN ('O', 'N')),
  USERNAME_CREA VARCHAR(45)  DEFAULT NULL,
  TS_CREA DATETIME DEFAULT NULL,
  TS_MAJ DATETIME DEFAULT NULL,
  USERNAME_UPD VARCHAR(45)  DEFAULT NULL,
  PRIMARY KEY (id_scolarite_echeanc)
);
# Table CO_CNTRA #
CREATE TABLE CO_CNTRA(
    ID_CNTRA INT NOT NULL AUTO_INCREMENT,
    ID_PERSONNEL INT NOT NULL,
    SALAIRE_DE_BASE DECIMAL(10,3) NOT NULL,
    DATE_DEBUT DATE NOT NULL,
    DATE_FIN DATE NOT NULL,
    DATE_FIN_REEL DATE DEFAULT NULL,
    MOTIF_FIN VARCHAR(256) DEFAULT '',
    FL_VALIDE CHAR(1) DEFAULT 'N',
    FL_FIN CHAR(1) DEFAULT 'N',
    ID_PA_TYP_CNTRA INT NOT NULL,
    ID_PA_MOTF_FIN INT DEFAULT NULL,
    PRIMARY KEY(ID_CNTRA)
) COMMENT = "CONTRAT DU PERSONNEL";
CREATE  INDEX I_FK_CO_CNTRA_PE_PERSONNEL ON CO_CNTRA (ID_PERSONNEL ASC);

CREATE  INDEX I_FK_CO_CONTRA_PA_PARAM_GLOB  ON CO_CNTRA (ID_PA_TYP_CNTRA ASC);

#TABLE CO_ELEM_SAL
CREATE TABLE CO_ELEM_SAL(
    ID_ELEM_SAL INT NOT NULL AUTO_INCREMENT,
    ID_CNTRA INT DEFAULT NULL,
    ID_SS_ARTICL INT DEFAULT NULL,
    MT_ELEM_REC DECIMAL(10,2) DEFAULT NULL,
    MT_ELEM_DEP DECIMAL(10,2) DEFAULT NULL,
    TAUX_RECETTE FLOAT DEFAULT NULL,
    TAUX_DEPENSE FLOAT DEFAULT NULL,
    MT_BASE DECIMAL(10,2) DEFAULT NULL COMMENT "LE MONTANT RÉEL SUR LEQUEL LES RETENUS OU PRIMES SERONT CALCULÉS CAR ILS NE SE FONT PAS FORCEMENT SUR TOUT LE SALAIRE DE BASE",
    PRIMARY KEY (ID_ELEM_SAL),
    UNIQUE KEY(ID_CNTRA,ID_SS_ARTICL)
);
CREATE  INDEX I_FK_CO_ELEM_SAL_CO_CNTRA ON CO_ELEM_SAL (ID_CNTRA ASC);

CREATE  INDEX I_FK_CO_ELEM_SAL_PA_SOUS_ARTICLE  ON CO_ELEM_SAL (ID_SS_ARTICL ASC);
 # -----------------------------------------------------------------------------
 #      TABLE co_bultin_sal
 # -----------------------------------------------------------------------------
create table co_bultin_sal (
	ID_BULTIN integer not null auto_increment,
    ID_CNTRA integer,
    salaire_base decimal(10,3),
    salaire_net decimal(10,3),
    date_debut date,
    date_fin date,
    volume_horaire smallint,
    FL_VALIDE char(1) not null default 'N',
    FL_PAYE char(1) not null default 'N',
    primary key (ID_BULTIN)
) comment='table bulletin de salaire';

CREATE INDEX I_FK_CO_BULTIN_SAL_CO_CNTRA ON co_bultin_sal (ID_CNTRA ASC);
 # -----------------------------------------------------------------------------
 #      TABLE co_elem_bultin
 # -----------------------------------------------------------------------------
create table co_elem_bultin (
	ID_ELEM_BULTIN integer not null auto_increment,
    ID_BULTIN integer,
    ID_SS_ARTICL integer,
    mt_elem_rec_base decimal(10,2),
    mt_elem_dep_base decimal(10,2),
    mt_elem_rec_reel decimal(10,2),
    mt_elem_dep_reel decimal(10,2),
    taux_recette float default 0,
    taux_depense float default 0,
    mt_base decimal(10,2) default null comment "le montant réel sur lequel les retenus ou primes seront calculés car ils ne se font pas forcement sur tout le salaire de base",
    fl_cntra char(1) default 'O' comment "Flag permet de savoir si l'élément est lié ou non au contrat",
    primary key (ID_ELEM_BULTIN)
);
CREATE INDEX I_FK_CO_ELEM_BULTIN_CO_BULTIN_SAL ON co_elem_bultin (ID_BULTIN ASC);

CREATE INDEX I_FK_CO_ELEM_BULTIN_PA_SOUS_ARTICL ON co_elem_bultin (ID_SS_ARTICL ASC);
 # -----------------------------------------------------------------------------
 #      TABLE co_autr_recette_eleve
 # -----------------------------------------------------------------------------
CREATE TABLE co_autr_recette_eleve (
	NUM_ORD_PAIE integer not null,
    ID_RECETTE integer not null,
    ID_AN_SCOLAIRE integer not null,
    ID_INSCRIPTION integer not null,
    libelle varchar(60),
    desc_rec varchar(60),
    mt_rec_tot decimal(10,2) not null default 0.0,
    mt_rec_tot_paye decimal(10,2) not null default 0.0,
    mt_rec_paye decimal(10,2)  not null default 0.0,
    ln_rec varchar(250) comment 'lien du réçu',
    no_recu varchar(64) comment 'numero réçu',
    date_rec datetime,
    ts_crea datetime,
    ts_maj datetime,
    username_crea varchar(45),
    primary key(ID_RECETTE,NUM_ORD_PAIE)
) comment ='autre recette eleve';
 # -----------------------------------------------------------------------------
 #      TABLE co_autr_recette_eleve_details
 # -----------------------------------------------------------------------------
CREATE TABLE co_autr_recette_eleve_details(
	ID_RECETTE_DETAIL integer auto_increment,
    NUM_ORD_PAIE integer not null,
    ID_RECETTE integer,
    ID_SS_ARTICL integer default null,
    ID_ARTICLE integer default null,
    qte_rec integer not null default 0,
    pu_rec decimal(10,2) not null default 0.0,
    mt_rec decimal(10,2) not null default 0.0,
    primary key(ID_RECETTE_DETAIL)
) comment = 'détail autre recette eleve';
# -----------------------------------------------------------------------------
#       TABLE : EM_CAHIER_TEXTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EM_CAHIER_TEXTE
 (
   ID_CAHIER_TEXT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_CLASSE INTEGER NOT NULL  ,
   ID_MATIERE INTEGER NOT NULL  ,
   ID_PERSONNEL INTEGER NOT NULL  ,
   ID_AN_SCOLAIRE INTEGER NOT NULL,
   DAT_CAH_TEXT DATETIME NOT NULL  ,
   DAT_HEUR_DEB_ACTIVI DATETIME NOT NULL  ,
   DAT_HEUR_FIN_ACTIVI DATETIME NOT NULL  ,
   DESC_ACTIVITE VARCHAR(512) NOT NULL  ,
   USERNAME_CREA VARCHAR(45), 
   USERNAME_UPD VARCHAR(45), 
   TS_MAJ DATETIME   
   , PRIMARY KEY (ID_CAHIER_TEXT) 
 ) 
 comment = "Cahier Texte";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EM_CAHIER_TEXTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EM_CAHIER_TEXTE_PA_CLASSE
     ON EM_CAHIER_TEXTE (ID_CLASSE ASC);

CREATE  INDEX I_FK_EM_CAHIER_TEXTE_PA_MATIERE
     ON EM_CAHIER_TEXTE (ID_MATIERE ASC);

CREATE  INDEX I_FK_EM_CAHIER_TEXTE_PE_PROFESSEUR
     ON EM_CAHIER_TEXTE (ID_PERSONNEL ASC);
	 
# -----------------------------------------------------------------------------
#       TABLE SE_ROLES
# -----------------------------------------------------------------------------
CREATE TABLE SE_ROLES (
  CODE_ROLE VARCHAR(10) NOT NULL,
  NAME_ROLE VARCHAR(45) NOT NULL,
  DESCRIPT_ROLE VARCHAR(255) NOT NULL,
  PRIMARY KEY (CODE_ROLE)
);	 
# -----------------------------------------------------------------------------
#       TABLE SE_USERS
# -----------------------------------------------------------------------------
CREATE TABLE SE_USERS (
  USERNAME VARCHAR(45) NOT NULL,
  PASSWORD VARCHAR(45) NOT NULL,
  ID_PERSONNEL INTEGER NULL,
  ENABLED TINYINT NOT NULL DEFAULT '1',
  USERNAME_LABEL VARCHAR(45) NOT NULL UNIQUE,
  FL_ACTIF varchar(1) DEFAULT 'O',
  PRIMARY KEY (USERNAME)
);
 CREATE  INDEX I_FK_SE_USERNAME_PE_PERSONNEL   ON SE_USERS (ID_PERSONNEL ASC);
 # -----------------------------------------------------------------------------
#       TABLE SE_REL_USERS_ROLES
# -----------------------------------------------------------------------------
CREATE TABLE SE_REL_USERS_ROLES (
  CODE_ROLE VARCHAR(10) NOT NULL,
  USERNAME VARCHAR(45) NOT NULL,
  PRIMARY KEY (USERNAME,CODE_ROLE)
) ;
 CREATE  INDEX I_FK_SE_USERNAME_ROLES   ON SE_REL_USERS_ROLES (USERNAME ASC);
  CREATE  INDEX I_FK_SE_SE_ROLECODE_USERS   ON SE_REL_USERS_ROLES (CODE_ROLE ASC);
# -----------------------------------------------------------------------------
#       TABLE SE_FONCTIONNALITES
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS SE_FONCTIONNALITES
 (
   CODE_FONCTION VARCHAR(10) NOT NULL  ,
   CODE_FONCTION_HIERA VARCHAR(10) NULL  ,
   NAME_FONCTION VARCHAR(45) NOT NULL  ,
   DESCRIPT_FONCTION VARCHAR(255) NOT NULL  ,
   ENABLED CHAR(1) NOT NULL  ,
   NUMERO_ORDRE INTEGER NOT NULL,
    PRIMARY KEY (CODE_FONCTION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE SE_REL_ROLES_FONCTIONNALITES
# -----------------------------------------------------------------------------
CREATE TABLE SE_REL_ROLES_FONCTIONNALITES (
   CODE_FONCTION VARCHAR(10) NOT NULL,
   CODE_ROLE VARCHAR(10) NOT NULL,
  PRIMARY KEY (CODE_ROLE,CODE_FONCTION)
);
 CREATE  INDEX I_FK_SE_REL_ROLES_FONCTIONNALITES_FONCTIONCODE   ON SE_REL_ROLES_FONCTIONNALITES (CODE_FONCTION ASC);
  CREATE  INDEX I_FK_SE_REL_ROLES_FONCTIONNALITES_ROLECODE   ON SE_REL_ROLES_FONCTIONNALITES (CODE_ROLE ASC);
# -----------------------------------------------------------------------------
#       TABLE : SE_HISTO_CONXION_APPL
# -----------------------------------------------------------------------------

 CREATE TABLE IF NOT EXISTS SE_HISTO_CONXION_APPL
 (
   ID_CONXION_APPL INTEGER NOT NULL AUTO_INCREMENT,
   USERNAME VARCHAR(45) NOT NULL  ,
   IP_ADRES VARCHAR(128)  NULL  ,
   MAC_ADRES VARCHAR(128)  NULL  ,
   DAT_CONXION DATETIME NOT NULL  ,
   DAT_DECONXION DATETIME NULL  
   , PRIMARY KEY (ID_CONXION_APPL) 
 ) 
 comment = "";
CREATE  INDEX I_FK_SE_HISTO_CONXION_APPL_SE_USERS
     ON SE_HISTO_CONXION_APPL (USERNAME ASC);
CREATE TABLE IF NOT EXISTS NO_PARAM_MODEL
 (
   ID_PARAM_MODEL INTEGER NOT NULL AUTO_INCREMENT ,
   LIBELLE_MODEL VARCHAR(64) NOT NULL  ,
   MESSAGE_MODEL VARCHAR(2048) NOT NULL  ,
   ID_TYP_EVENEMNT INTEGER NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_PARAM_MODEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NO_ABONNEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NO_ABONNEMENT
 (
   ID_ABONNEMENT INTEGER NOT NULL AUTO_INCREMENT ,
   CODE_ABONNEMENT VARCHAR(24) NOT NULL  ,
   NOM_ABONNEMENT VARCHAR(128) NOT NULL  ,
   NOMBRE_SMS INTEGER NOT NULL  
      DEFAULT 0,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_ABONNEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NO_PERSONNE_NOTI
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NO_PERSONNE_NOTI
 (
   ID_PERSON_INT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PERSON_EXT INTEGER NULL  ,
   NOM VARCHAR(64) NOT NULL  ,
   PRENOM VARCHAR(64) NOT NULL  ,
   SEXE VARCHAR(12) NOT NULL  ,
   DATE_NAISSANCE INTEGER NOT NULL  ,
   NUM_TELEPHONE VARCHAR(32) NOT NULL  ,
   EMAIL VARCHAR(128) NULL  ,
   ADRESSE VARCHAR(128) NULL  ,
   INFO_COMP_1 VARCHAR(128) NULL  ,
   INFO_COMP_2 VARCHAR(128) NULL  ,
   INFO_COMP_3 VARCHAR(128) NULL  ,
   INFO_COMP_4 VARCHAR(128) NULL  ,
   INFO_COMP_5 VARCHAR(128) NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_PERSON_INT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NO_NOTIFICATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NO_NOTIFICATION
 (
   ID_NOTI INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PERSON_INT INTEGER NOT NULL  ,
   ID_PA_STATUT_ENV INTEGER NOT NULL  ,
   ID_ABON_PERS INTEGER NULL  ,
   ID_EVT_INT INTEGER NULL  ,
   ID_PARAM_MODEL INTEGER NULL  ,
   MESSAGE VARCHAR(2048) NOT NULL  ,
   DATE_NOTI DATETIME NOT NULL  
   , PRIMARY KEY (ID_NOTI) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NO_TYP_EVENEMENT_NOTI
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NO_TYP_EVENEMENT_NOTI
 (
   ID_TYP_EVENEMNT INTEGER NOT NULL AUTO_INCREMENT ,
   COD_TYP_EVENEMNT VARCHAR(12) NOT NULL  ,
   NOM_TYP_EVENMNT VARCHAR(32) NOT NULL  ,
   DESC_TYP_EVENMNT VARCHAR(128) NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_TYP_EVENEMNT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NO_REL_DET_ABONNEMNT_TYP_EVT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NO_REL_DET_ABONNEMNT_TYP_EVT
 (
   ID_ABONNEMENT INTEGER NOT NULL  ,
   ID_TYP_EVENEMNT INTEGER NOT NULL  ,
   ID_PARAM_MODEL INTEGER NOT NULL  ,
   ID_PA_FREQ_ENV INTEGER NOT NULL  ,
   FL_ENVOI_AUTO CHAR(1) NOT NULL  
      DEFAULT "O"     CHECK (FL_ENVOI_AUTO in ("O","N")),
   JOUR_PREF_ENV VARCHAR(20) NULL  ,
   HEURE_PREF_ENV TIME NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_ABONNEMENT,ID_TYP_EVENEMNT) 
   , UNIQUE INDEX AK_NO_REL_DET_ABONNEMNT_TYP_EVT (ID_ABONNEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NO_ABONNEMENT_PERSON
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NO_ABONNEMENT_PERSON
 (
   ID_ABON_PERS INTEGER NOT NULL AUTO_INCREMENT ,
   ID_ABONNEMENT INTEGER NOT NULL  ,
   NB_SMS_ENVOI INTEGER NOT NULL  ,
   ID_PERSON_INT INTEGER NOT NULL  ,
   DATE_DEB_VAL DATETIME NOT NULL  ,
   DATE_FIN_VAL DATETIME NOT NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_ABON_PERS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NO_EVENMNT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NO_EVENMNT
 (
   ID_TYP_EVENEMNT INTEGER NOT NULL  ,
   ID_EVT_INT INTEGER NOT NULL  ,
   ID_EVT_EXTERN INTEGER NULL  ,
   INFO_COMP_1 VARCHAR(128) NULL  ,
   INFO_COMP_2 VARCHAR(128) NULL  ,
   INFO_COMP_3 VARCHAR(128) NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_EVT_INT) 
 ) 
 comment = "";
 
 # -----------------------------------------------------------------------------
#       TABLE : ST_COMPTABILITE
# -----------------------------------------------------------------------------
 
 CREATE TABLE ST_COMPTABILITE (
  ID_AN_SCOLAIRE_STATISTIQUE INT NOT NULL,
  ID_AN_SCOLAIRE_ACTUEL INT NOT NULL,
  FL_RECETTE VARCHAR(2) NOT NULL DEFAULT 'N' CHECK(FL_RECETTE IN ('O','N')),
  ID_ARTICLE INT NOT NULL,
  MT_TOT_ARTICLE DECIMAL(12,2) NOT NULL DEFAULT 0,
  DATE_GENERATION VARCHAR(30) NOT NULL
) ;
# -----------------------------------------------------------------------------
#       TABLE : ST_ELEVE_CLASSE_ANNEE_SCOL
# -----------------------------------------------------------------------------
CREATE TABLE ST_ELEVE_CLASSE_ANNEE_SCOL (
  ID_CLASSE INT NOT NULL,
  ID_NIV_ETU INT NOT NULL,
  ID_AN_SCOLAIRE INT NOT NULL,
  ID_PA_CYCLE INT NOT NULL,
  SEX_ELV VARCHAR(1) NOT NULL DEFAULT 'M' CHECK(SEX_ELV IN ('F','M')),
  ID_PA_STATUT_ELEVE INT NOT NULL,
  NB_ELV_TOT INT NOT NULL,
  DATE_GENERATION VARCHAR(30) NOT NULL
) ;
# -----------------------------------------------------------------------------
#       TABLE : ST_PERSONNEL
# -----------------------------------------------------------------------------
CREATE TABLE ST_PERSONNEL (
 ID_PA_STATU_PERS INT NOT NULL,
 ID_PA_PRO_PERS INT NOT NULL,
 ID_PA_FONC_REEL INT DEFAULT NULL,
 ID_MATIERE1 INT DEFAULT NULL,
 ID_MATIERE2 INT DEFAULT NULL,
 ID_MATIERE3 INT DEFAULT NULL,
 ID_AN_SCOLAIRE INT NOT NULL,
 NB_PERS_TOT INT NOT NULL,
 DATE_GENERATION VARCHAR(30) NOT NULL,
 SEX_PERS  VARCHAR(10) NOT NULL DEFAULT 'M' CHECK(SEX_PERS IN ('F','M'))
);
 # -----------------------------------------------------------------------------
#       TABLE : ST_DATE_GENERATE
# -----------------------------------------------------------------------------
 CREATE TABLE ST_DATE_GENERATE (
    DATE_GENERATION VARCHAR(30) NOT NULL, 
    ID_AN_SCOLAIRE INT NOT NULL,
    TYP_STATISTIQUE VARCHAR (30) NOT NULL,
    TS_CREA TIMESTAMP DEFAULT NULL,
    TS_UPDATE TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (DATE_GENERATION, ID_AN_SCOLAIRE, TYP_STATISTIQUE)
);
# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------
ALTER TABLE ev_moyenne_matiere ADD CONSTRAINT fk_ev_moyenne_matiere_pa_param_glob_appreciation FOREIGN KEY (ID_PA_APPRECIATION) REFERENCES pa_param_glob (ID_PARAM_GLOB);
ALTER TABLE EV_MOYENNE_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_MATIERE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EV_MOYENNE_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_MATIERE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EV_MOYENNE_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_MATIERE_PA_PARAM_GLOB_periode FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
-- ALTER TABLE EV_MOYENNE_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_MATIERE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MODULE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_ABSENCE_PERSONNEL ADD CONSTRAINT FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MOTF_ABS_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_ABSENCE_PERSONNEL ADD CONSTRAINT FK_PE_ABSENCE_PERSONNEL_PA_PARAM_GLOB1 FOREIGN KEY (ID_PA_STATU_ABS_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_ABSENCE_PERSONNEL ADD CONSTRAINT FK_PE_ABSENCE_PERSONNEL_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE EL_DOSSIER_BOURSE ADD CONSTRAINT FK_EL_DOSSIER_BOURSE_EL_PARAM_BOURSE FOREIGN KEY (ID_BOURSE) REFERENCES EL_PARAM_BOURSE (ID_BOURSE) ;
ALTER TABLE EL_DOSSIER_BOURSE ADD CONSTRAINT FK_EL_DOSSIER_BOURSE_EL_ELEVE FOREIGN KEY (ID_ELEVE) REFERENCES EL_ELEVE (ID_ELEVE) ;
ALTER TABLE EL_INSCRIPTION ADD CONSTRAINT FK_EL_INSCRIPTION_EL_ELEVE FOREIGN KEY (ID_ELEVE) REFERENCES EL_ELEVE (ID_ELEVE) ;
ALTER TABLE EL_INSCRIPTION ADD CONSTRAINT FK_EL_INSCRIPTION_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EL_INSCRIPTION ADD CONSTRAINT FK_EL_INSCRIPTION_PA_PARAM_GLOB FOREIGN KEY (ID_PA_RSLT_SCOL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_INSCRIPTION ADD CONSTRAINT FK_EL_INSCRIPTION_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EL_INSCRIPTION ADD CONSTRAINT FK_EL_INSCRIPTION_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_TYP_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_INSCRIPTION ADD CONSTRAINT FK_EL_INSCRIPTION_PA_PARAM_GLOB_OPTION FOREIGN KEY (ID_PA_OPTION) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_INSCRIPTION ADD CONSTRAINT FK_EL_INSCRIPTION_PA_PERIOD FOREIGN KEY (ID_PA_PERIOD_DEL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE PA_ETABLISSEMENT ADD CONSTRAINT FK_PA_ETABLISSEMENT_PA_PROVINCE FOREIGN KEY (ID_PROV) REFERENCES PA_PROVINCE (ID_PROV) ;
ALTER TABLE PA_ETABLISSEMENT ADD CONSTRAINT FK_PA_ETABLISSEMENT_PA_COMMUNE FOREIGN KEY (ID_COM) REFERENCES PA_COMMUNE (ID_COM) ;
ALTER TABLE PA_ETABLISSEMENT ADD CONSTRAINT FK_PA_ETABLISSEMENT_PA_REGION FOREIGN KEY (ID_REG) REFERENCES PA_REGION (ID_REG) ;
ALTER TABLE PA_NIV_ETUDE ADD CONSTRAINT FK_PA_NIV_ETUDE_PA_PARAM_CYCLE FOREIGN KEY (ID_PA_CYCLE_NIV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_NIV_ETUDE ADD CONSTRAINT FK_PA_NIV_ETUDE_PA_PARAM_VIVEAU FOREIGN KEY (ID_PA_NIV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_NIV_ETUDE ADD CONSTRAINT FK_PA_NIV_ETUDE_PA_PARAM_VIVEAU_SERI FOREIGN KEY (ID_PA_SERI) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_NIV_ETUDE ADD CONSTRAINT FK_PA_NIV_ETUDE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_REGLE_RETRAIT_POIN) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE PA_ETABLISSEMENT ADD CONSTRAINT FK_PA_ETABLISSEMENT_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYP_ETAB) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_LIST_ETABL ADD CONSTRAINT FK_PA_LIST_ETABL_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYP_ETAB) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE PA_LIST_ETABL ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_LIST_ETABL FOREIGN KEY (USERNAME_CREA)  REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_LIST_ETABL ADD CONSTRAINT  FK_SE_USERNAME_UPDATE_PA_LIST_ETABL FOREIGN KEY (USERNAME_UPD)  REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_LIST_ETABL ADD CONSTRAINT FK_PA_LIST_ETABL_PA_PROVINCE FOREIGN KEY (ID_PROV) REFERENCES PA_PROVINCE (ID_PROV) ;
ALTER TABLE PA_LIST_ETABL ADD CONSTRAINT FK_PA_LIST_ETABL_PA_COMMUNE FOREIGN KEY (ID_COM) REFERENCES PA_COMMUNE (ID_COM) ;
ALTER TABLE PA_LIST_ETABL ADD CONSTRAINT FK_PA_LIST_ETABL_PA_REGION FOREIGN KEY (ID_REG) REFERENCES PA_REGION (ID_REG) ;
 ALTER TABLE PA_LIST_ETABL  ADD CONSTRAINT FK_PA_LIST_ETABL_PA_CIRCONSCRIPTION FOREIGN KEY (ID_CIR)     REFERENCES PA_CIRCONSCRIPTION (ID_CIR);
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT FK_EV_MOYENNE_PERIODE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT FK_EV_MOYENNE_PERIODE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
/*AJOUT 01/12/2020*/
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT FK_EV_MOYENNE_PERIODE_PA_PARAM_HONEUR FOREIGN KEY (ID_PA_HONEUR) REFERENCES PA_PARAM_GLOB(ID_PARAM_GLOB);
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETU_RDOUBL1) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE2 FOREIGN KEY (ID_NIV_ETU_RDOUBL2)  REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE3 FOREIGN KEY (ID_NIV_ETU_RDOUBL3) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT FK_EV_MOYENNE_PERIODE_PA_NIV_ETUDE4 FOREIGN KEY (ID_NIV_ETU_RDOUBL4) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
-- ALTER TABLE EV_MOYENNE_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_MATIERE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MODULE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;

ALTER TABLE EV_MOYENNE_MODULE ADD CONSTRAINT FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MODULE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_MOYENNE_MODULE ADD CONSTRAINT FK_EV_MOYENNE_MODULE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EV_MOYENNE_MODULE ADD CONSTRAINT FK_EV_MOYENNE_MODULE_PA_PARAM_GLOB_PERIOD FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_MOYENNE_SOU_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_SOU_MATIERE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EV_MOYENNE_SOU_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_SOU_MATIERE_PA_SOU_MATIERE FOREIGN KEY (ID_SOU_MATIERE) REFERENCES PA_SOU_MATIERE (ID_SOU_MATIERE) ;
ALTER TABLE EV_MOYENNE_SOU_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_SOU_MATIERE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EV_MOYENNE_SOU_MATIERE ADD CONSTRAINT FK_EV_MOYENNE_SOU_MATIERE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_REGL_CALC_MOY) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_MATIERE_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE_PA_SOU_MATIERE FOREIGN KEY (ID_SOU_MATIERE) REFERENCES PA_SOU_MATIERE (ID_SOU_MATIERE) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EV_REL_REGLE_MOYENNE_PERIODE_SOU_MATIERE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_SOU_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EV_MOYENNE_SOU_MATIERE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_SOU_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EV_MOYENNE_SOU_MATIERE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_MODULE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EV_MOYENNE_MODULE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_MODULE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EV_MOYENNE_MODULE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_PROFESSEUR ADD CONSTRAINT FK_PE_PROFESSEUR_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE PE_PROFESSEUR ADD CONSTRAINT FK_PE_PROFESSEUR_PA_PARAM_GLOB_TITR FOREIGN KEY (ID_PA_TITR_CAPA) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_INCIDENT ADD CONSTRAINT FK_EL_INCIDENT_PA_PARAM_GLOB FOREIGN KEY (ID_PA_EXCLUSION_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_INCIDENT ADD CONSTRAINT FK_EL_INCIDENT_PA_PARAM_GLOB1 FOREIGN KEY (ID_PA_TYP_INCIDENT) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_INCIDENT ADD CONSTRAINT FK_EL_INCIDENT_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EL_INCIDENT ADD CONSTRAINT FK_EL_INCIDENT_PA_PERIOD_EVAL FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_PAYS FOREIGN KEY (ID_PAYS_NAIS_ELV) REFERENCES PA_PAYS (ID_PAYS) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_PAYS2 FOREIGN KEY (ID_PAYS_NATIONNALITE_ELV) REFERENCES PA_PAYS (ID_PAYS) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_RELIGION_PERE_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_PARAM_GLOB5 FOREIGN KEY (ID_PA_RELIGION_MERE_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_PARAM_GLOB1 FOREIGN KEY (ID_PA_SITUA_SOCIAL_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_PROFES_PERE_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_COMMUNE FOREIGN KEY (ID_COM_NAIS_ELV) REFERENCES PA_COMMUNE (ID_COM) ;
ALTER TABLE PA_COMMUNE ADD CONSTRAINT  FK_PA_COMMUNE_PA_PAYS FOREIGN KEY (ID_PAYS) REFERENCES PA_PAYS (ID_PAYS) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_PARAM_GLOB3 FOREIGN KEY (ID_PA_PROFES_MERE_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_NIV_ETUDE_REDOUBL1 FOREIGN KEY (ID_NIV_ETU_RDOUBL1) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU);
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_NIV_ETUDE_REDOUBL2 FOREIGN KEY (ID_NIV_ETU_RDOUBL2) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU);
ALTER TABLE EL_ELEVE ADD CONSTRAINT FK_EL_ELEVE_PA_LIST_ETABL FOREIGN KEY (ID_ETAB_ORIG) REFERENCES PA_LIST_ETABL(ID_ETAB);
ALTER TABLE EL_ABSENCE_ELEVE ADD CONSTRAINT FK_EL_ABSENCE_ELEVE_EL_INCIDENT FOREIGN KEY (ID_INCIDENT) REFERENCES EL_INCIDENT (ID_INCIDENT) ;
ALTER TABLE EL_ABSENCE_ELEVE ADD CONSTRAINT FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_STATU_ABS_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ABSENCE_ELEVE ADD CONSTRAINT FK_EL_ABSENCE_ELEVE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EL_ABSENCE_ELEVE ADD CONSTRAINT FK_EL_ABSENCE_ELEVE_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_MOTF_ABS_ELV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_ABSENCE_ELEVE ADD CONSTRAINT FK_EL_ABSENCE_ELEVE_PA_PERIOD_EVAL FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_HORAIRE_SEMAINE ADD CONSTRAINT FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_HORAIR_DISPO) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_HORAIRE_SEMAINE ADD CONSTRAINT FK_PA_HORAIRE_SEMAINE_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_JOUR_DISPO) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_COMMUNE ADD CONSTRAINT FK_PA_COMMUNE_PA_PROVINCE FOREIGN KEY (ID_PROV) REFERENCES PA_PROVINCE (ID_PROV) ;
ALTER TABLE PA_REL_MODULE_NIV_ETUD ADD CONSTRAINT FK_PA_REL_MODULE_NIV_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MODULE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_REL_MODULE_NIV_ETUD ADD CONSTRAINT FK_PA_REL_MODULE_NIV_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT FK_EM_EMPLOITEMPS_PA_HORAIRE_SEMAINE FOREIGN KEY (ID_HORAIRE_HBDO) REFERENCES PA_HORAIRE_SEMAINE (ID_HORAIRE_HBDO) ;
ALTER TABLE EM_VERSION_EMPLOITEMPS ADD CONSTRAINT FK_EM_VERSION_EMPLOITEMPS_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EM_VERSION_EMPLOITEMPS ADD CONSTRAINT FK_EM_VERSION_EMPLOITEMPS_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT FK_EM_EMPLOITEMPS_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT FK_EM_EMPLOITEMPS_PE_PROFESSEUR FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PROFESSEUR (ID_PERSONNEL) ;
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT FK_EM_EMPLOITEMPS_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE)  ;
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT FK_EM_EMPLOITEMPS_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EM_REL_DISPO_MATIERE ADD CONSTRAINT FK_EM_REL_DISPO_MATIERE_PA_HORAIRE_SEMAINE FOREIGN KEY (ID_HORAIRE_HBDO) REFERENCES PA_HORAIRE_SEMAINE (ID_HORAIRE_HBDO) ;
ALTER TABLE EM_REL_DISPO_MATIERE ADD CONSTRAINT FK_EM_REL_DISPO_MATIERE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT FK_EM_EMPLOITEMPS_EM_VERSION_EMPLOITEMPS FOREIGN KEY (ID_VERSION_EMPLOITEMPS) REFERENCES EM_VERSION_EMPLOITEMPS (ID_VERSION_EMPLOITEMPS) ;
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_STATU_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PA_TYP_PERS FOREIGN KEY (ID_PA_TYP_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PA_COMMUNE FOREIGN KEY (ID_COM_NAIS_PERS) REFERENCES PA_COMMUNE (ID_COM) ;
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL_RESP) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PA_PAYS FOREIGN KEY (ID_PAYS_NAIS_PERS) REFERENCES PA_PAYS (ID_PAYS) ;
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT I_FK_PE_PERSONNEL_PA_PARAM_GLOB_MATRI FOREIGN KEY (ID_PA_SIT_MATRI) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_PERSONNEL FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PARAM_GLOB_FONCTION_REEL FOREIGN KEY (ID_PA_FONC_REEL) REFERENCES PA_PARAM_GLOB(ID_PARAM_GLOB);
/*AJOUT MANNUEL DU 18/07/2020*/
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PROFESSION FOREIGN KEY (ID_PA_PRO_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
/*AJOUT MANNUEL DU 03/04/2021*/
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT FK_PE_PERSONNEL_PA_PARAM_TYPE FOREIGN KEY (ID_PA_TYP_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_PARAM_BOURSE ADD CONSTRAINT FK_EL_PARAM_BOURSE_PA_REGION FOREIGN KEY (ID_REG) REFERENCES PA_REGION (ID_REG) ;
ALTER TABLE EL_PARAM_BOURSE ADD CONSTRAINT FK_EL_PARAM_BOURSE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EL_PARAM_BOURSE ADD CONSTRAINT FK_EL_PARAM_BOURSE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_DIPLOME) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_CALENDRIER_SCOLAIRE ADD CONSTRAINT FK_PA_CALENDRIER_SCOLAIRE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EL_PARAM_BOURSE ADD CONSTRAINT FK_EL_PARAM_BOURSE_PA_NIV_ETUD FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE PA_ANNEE_SCOLAIRE ADD CONSTRAINT FK_PA_ANNEE_SCOLAIRE_PA_PARAM_GLOB FOREIGN KEY (ID_PAR_REGL_CALC_MOY_GNRAL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_CLASSE ADD CONSTRAINT FK_PA_CLASSE_PA_SALLE FOREIGN KEY (ID_SALLE) REFERENCES PA_SALLE (ID_SALLE) ;
ALTER TABLE PA_CLASSE ADD CONSTRAINT FK_PA_CLASSE_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYPE_EVALUATION) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PA_STATUT_VAL FOREIGN KEY (ID_PA_STATU_VALID) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PA_SOU_MATIERE FOREIGN KEY (ID_SOU_MATIERE) REFERENCES PA_SOU_MATIERE (ID_SOU_MATIERE) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PA_PARAM_GLOB1 FOREIGN KEY (ID_PA_STATU_EVALUATION) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT FK_EV_EVALUATION_PARAM_GLOB_STATU_VALID FOREIGN KEY (ID_PA_STATU_VALID) REFERENCES PA_PARAM_GLOB(ID_PARAM_GLOB);
ALTER TABLE PA_SALLE ADD CONSTRAINT FK_PA_SALLE_PA_BATIMENT FOREIGN KEY (ID_BAT) REFERENCES PA_BATIMENT (ID_BAT) ;
ALTER TABLE PA_ARTICLE ADD CONSTRAINT FK_PA_ARTICLE_PA_CHAPITRE FOREIGN KEY (ID_CHAPITRE) REFERENCES PA_CHAPITRE (ID_CHAPITRE) ;
ALTER TABLE EL_DOCUMENT_BOURSE ADD CONSTRAINT FK_EL_DOCUMENT_BOURSE_EL_PARAM_BOURSE FOREIGN KEY (ID_BOURSE) REFERENCES EL_PARAM_BOURSE (ID_BOURSE) ;
ALTER TABLE EL_DOCUMENT_BOURSE ADD CONSTRAINT FK_EL_DOCUMENT_BOURSE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_DOC) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_SOUS_ARTICLE ADD CONSTRAINT FK_PA_SOUS_ARTICLE_PA_ARTICLE FOREIGN KEY (ID_ARTICLE) REFERENCES PA_ARTICLE (ID_ARTICLE) ;
ALTER TABLE PA_PROVINCE ADD CONSTRAINT FK_PA_PROVINCE_PA_REGION FOREIGN KEY (ID_REG) REFERENCES PA_REGION (ID_REG) ;
ALTER TABLE EV_REL_EVALUATION_PERIODE ADD CONSTRAINT FK_EV_REL_EVALUATION_PERIODE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_REL_EVALUATION_PERIODE ADD CONSTRAINT FK_EV_REL_EVALUATION_PERIODE_EV_EVALUATION FOREIGN KEY (ID_EVALUATION) REFERENCES EV_EVALUATION (ID_EVALUATION) ;
ALTER TABLE EM_REL_DISPO_PROF ADD CONSTRAINT FK_EM_REL_DISPO_PROF_PE_PROFESSEUR FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PROFESSEUR (ID_PERSONNEL) ;
ALTER TABLE EM_REL_DISPO_PROF ADD CONSTRAINT FK_EM_REL_DISPO_PROF_PA_HORAIRE_SEMAINE FOREIGN KEY (ID_HORAIRE_HBDO) REFERENCES PA_HORAIRE_SEMAINE (ID_HORAIRE_HBDO) ;
ALTER TABLE EM_REL_DISPO_CLASSE ADD CONSTRAINT FK_EM_REL_DISPO_CLASSE_PA_HORAIRE_SEMAINE FOREIGN KEY (ID_HORAIRE_HBDO) REFERENCES PA_HORAIRE_SEMAINE (ID_HORAIRE_HBDO) ;
ALTER TABLE EM_REL_DISPO_CLASSE ADD CONSTRAINT FK_EM_REL_DISPO_CLASSE_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE PE_REL_FORMATION_PERSONNEL ADD CONSTRAINT FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB FOREIGN KEY (ID_PA_FORMATION_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_REL_FORMATION_PERSONNEL ADD CONSTRAINT FK_PE_REL_FORMATION_PERSONNEL_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE PE_REL_FORMATION_PERSONNEL ADD CONSTRAINT FK_PE_REL_FORMATION_PERSONNEL_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_STATU_FORM_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_REL_NOTE_EVAL_ELEVE ADD CONSTRAINT FK_EV_REL_NOTE_EVAL_ELEVE_EV_EVALUATION FOREIGN KEY (ID_EVALUATION) REFERENCES EV_EVALUATION (ID_EVALUATION) ;
ALTER TABLE EV_REL_NOTE_EVAL_ELEVE ADD CONSTRAINT FK_EV_REL_NOTE_EVAL_ELEVE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EV_PARAM_CALC_MOY_TYP_EVAL ADD CONSTRAINT FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU);
ALTER TABLE EV_PARAM_CALC_MOY_TYP_EVAL ADD CONSTRAINT FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE);
ALTER TABLE EV_PARAM_CALC_MOY_TYP_EVAL ADD CONSTRAINT FK_EV_PARAM_CALC_MOY_TYP_EVAL_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYP_EVAL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE EV_PARAM_CALC_MOY_TYP_EVAL ADD CONSTRAINT  FK_SE_USERNAME_CREA_EV_PARAM_CALC_MOY_TYP_EVAL FOREIGN KEY (USERNAME_CREA)  REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_PARAM_CALC_MOY_TYP_EVAL ADD CONSTRAINT  FK_SE_USERNAME_UPDATE_EV_PARAM_CALC_MOY_TYP_EVAL FOREIGN KEY (USERNAME_UPD)  REFERENCES SE_USERS (USERNAME);
ALTER TABLE ev_param_apprec_matiere ADD CONSTRAINT fk_ev_param_apprec_matiere_pa_matiere FOREIGN KEY (ID_MATIERE) REFERENCES pa_matiere (ID_MATIERE);
ALTER TABLE ev_param_apprec_matiere ADD CONSTRAINT fk_ev_param_apprec_matiere_pa_niv_etude FOREIGN KEY (ID_NIV_ETU) REFERENCES pa_niv_etude (ID_NIV_ETU);
ALTER TABLE ev_param_det_apprec_matiere ADD CONSTRAINT fk_pa_param_glob FOREIGN KEY (ID_PARAM_GLOB) REFERENCES pa_param_glob (ID_PARAM_GLOB);
ALTER TABLE ev_param_det_apprec_matiere ADD CONSTRAINT fk_param_apprec FOREIGN KEY (ID_PARAM) REFERENCES ev_param_apprec_matiere (ID_PARAM);
ALTER TABLE PA_REL_RESRC_SALLE ADD CONSTRAINT FK_PA_REL_RESRC_SALLE_PA_RESSOURCE FOREIGN KEY (ID_RESRC) REFERENCES PA_RESSOURCE (ID_RESRC) ;
ALTER TABLE PA_REL_RESRC_SALLE ADD CONSTRAINT FK_PA_REL_RESRC_SALLE_PA_SALLE FOREIGN KEY (ID_SALLE) REFERENCES PA_SALLE (ID_SALLE) ;
ALTER TABLE EL_REL_DOC_ADMINSTR ADD CONSTRAINT FK_EL_REL_DOC_ADMINSTR_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYP_DOC) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_REL_DOC_ADMINSTR ADD CONSTRAINT FK_EL_REL_DOC_ADMINSTR_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EL_REL_DIPLOME ADD CONSTRAINT FK_EL_REL_DIPLOME_EL_ELEVE FOREIGN KEY (ID_ELEVE) REFERENCES EL_ELEVE (ID_ELEVE) ;
ALTER TABLE EL_REL_DIPLOME ADD CONSTRAINT FK_EL_REL_DIPLOME_PA_PARAM_GLOB FOREIGN KEY (ID_PA_DIPLOME) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_REL_DIPLOME ADD CONSTRAINT FK_EL_REL_DIPLOME_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES  PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE)  ;
ALTER TABLE PA_REL_MATIERE_NIV_ETUD ADD CONSTRAINT FK_PA_REL_MATIERE_NIV_ETUD_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE PA_REL_MATIERE_NIV_ETUD ADD CONSTRAINT FK_PA_REL_MATIERE_NIV_ETUD_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE PA_REL_MATIERE_NIV_ETUD ADD CONSTRAINT FK_PA_REL_MATIERE_NIV_ETUD_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MODULE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_REL_MATIERE_PROFESSEUR ADD CONSTRAINT FK_PE_REL_MATIERE_PROFESSEUR_PE_PROFESSEUR FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PROFESSEUR (ID_PERSONNEL) ;
ALTER TABLE PE_REL_MATIERE_PROFESSEUR ADD CONSTRAINT FK_PE_REL_MATIERE_PROFESSEUR_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE PE_REL_FONCTION ADD CONSTRAINT FK_PE_REL_FONCTION_PA_ETABLISSEMENT FOREIGN KEY (ID_ETAB) REFERENCES PA_ETABLISSEMENT (ID_ETAB) ;
 ALTER TABLE PA_ETABLISSEMENT   ADD CONSTRAINT FK_PA_ETABLISSEMENT_PA_CIRCONSCRIPTION FOREIGN KEY (ID_CIR) REFERENCES PA_CIRCONSCRIPTION (ID_CIR);
 ALTER TABLE PE_REL_FONCTION ADD CONSTRAINT FK_PE_REL_FONCTION_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE PE_REL_FONCTION ADD CONSTRAINT FK_PE_REL_FONCTION_PA_PARAM_GLOB FOREIGN KEY (ID_PA_FONCTION) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_REL_PERIOD_EVALUATION ADD CONSTRAINT FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYP_PERIOD) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_REL_PERIOD_EVALUATION ADD CONSTRAINT FK_PA_REL_PERIOD_EVALUATION_PA_ETABLISSEMENT FOREIGN KEY (ID_ETAB) REFERENCES PA_ETABLISSEMENT (ID_ETAB) ;
ALTER TABLE PA_REL_PERIOD_EVALUATION ADD CONSTRAINT FK_PA_REL_PERIOD_EVALUATION_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE PA_REL_PERIOD_EVALUATION ADD CONSTRAINT FK_PA_REL_PERIOD_EVALUATION_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_PERIOD_EVAL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_REL_DIPLOME_PERSONNEL ADD CONSTRAINT FK_PE_REL_DIPLOME_PERSONNEL_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE PE_REL_DIPLOME_PERSONNEL ADD CONSTRAINT FK_PE_REL_DIPLOME_PERSONNEL_PA_PARAM_GLOB FOREIGN KEY (ID_PA_DIPLOME) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_REL_DEPOT_DOSSIER_DOCUMENT ADD CONSTRAINT FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOCUMENT_BOURSE FOREIGN KEY (ID_DOC_BOURSE) REFERENCES EL_DOCUMENT_BOURSE (ID_DOC_BOURSE) ;
ALTER TABLE EL_REL_DEPOT_DOSSIER_DOCUMENT ADD CONSTRAINT FK_EL_REL_DEPOT_DOSSIER_DOCUMENT_EL_DOSSIER_BOURSE FOREIGN KEY (ID_DOS_BOURSE) REFERENCES EL_DOSSIER_BOURSE (ID_DOS_BOURSE) ;
ALTER TABLE PE_NOTE_PERSONNEL ADD CONSTRAINT FK_PE_NOTE_PERSONNEL_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE PE_NOTE_PERSONNEL ADD CONSTRAINT FK_PE_NOTE_PERSONNEL_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE PE_REL_DETAIL_NOTE_PERSONNEL ADD CONSTRAINT FK_PE_REL_DETAIL_NOTE_PERSONNEL_PA_PARAM_GLOB FOREIGN KEY (ID_PA_DETAIL_NOTE_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PE_REL_DETAIL_NOTE_PERSONNEL ADD CONSTRAINT FK_PE_REL_DETAIL_NOTE_PERSONNEL_PE_NOTE_PERSONNEL FOREIGN KEY (ID_NOTE_PERS) REFERENCES PE_NOTE_PERSONNEL (ID_NOTE_PERS) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_PARAM_GLOB2 FOREIGN KEY (ID_PA_REGL_CALC_MOY) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE ADD CONSTRAINT FK_EV_REL_REGLE_MOYENNE_PERIODE_MATIERE_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EM_REL_CONTRAINT_CLASSE ADD CONSTRAINT FK_EM_REL_CONTRAINT_CLASSE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_CTRNT_CLASSE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EM_REL_CONTRAINT_CLASSE ADD CONSTRAINT FK_EM_REL_CONTRAINT_CLASSE_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EM_REL_CONTRAINT_PROFESSEUR ADD CONSTRAINT FK_EM_REL_CONTRAINT_PROFESSEUR_PA_PARAM_GLOB FOREIGN KEY (ID_PA_CNTRT_PROF) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EL_REL_CHEF_CLASSE ADD CONSTRAINT FK_EL_REL_CHEF_CLASSE_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EL_REL_CHEF_CLASSE ADD CONSTRAINT FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_CHEF FOREIGN KEY (ID_INSCRIPTION_CHEF) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EL_REL_CHEF_CLASSE ADD CONSTRAINT FK_EL_REL_CHEF_CLASSE_EL_INSCRIPTION_SOU_CHEF FOREIGN KEY (ID_INSCRIPTION_SOU_CHEF) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EL_REL_CHEF_CLASSE ADD CONSTRAINT FK_EL_REL_CHEF_CLASSE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EM_ACTIVITE ADD CONSTRAINT FK_EM_ACTIVITE_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EM_ACTIVITE ADD CONSTRAINT FK_EM_ACTIVITE_PE_PROFESSEUR FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PROFESSEUR (ID_PERSONNEL) ;
ALTER TABLE EM_ACTIVITE ADD CONSTRAINT FK_EM_ACTIVITE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EM_ACTIVITE ADD CONSTRAINT FK_EM_ACTIVITE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EM_REL_CLASSE_PROF ADD CONSTRAINT  FK_EM_REL_CLASSE_PROF_PA_CLASSEADD FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EM_REL_CLASSE_PROF ADD CONSTRAINT FK_EM_REL_CLASSE_PROF_PE_PROFESSEUR FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PROFESSEUR (ID_PERSONNEL) ;
ALTER TABLE EM_REL_CLASSE_PROF ADD CONSTRAINT I_FK_EM_REL_CLASSE_PROF_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EM_REL_CLASSE_PROF ADD CONSTRAINT FK_EM_REL_CLASSE_PROF_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_PARAM_SCOLARITE ADD CONSTRAINT FK_CO_PARAM_SCOLARITE_PA_SOUS_ARTICLE FOREIGN KEY (ID_SS_ARTICL) REFERENCES PA_SOUS_ARTICLE (ID_SS_ARTICL) ;
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_CO_LIST_ID_RECETTE FOREIGN KEY (ID_RECETTE) REFERENCES CO_LIST_ID_RECETTE (ID_RECETTE) ;
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MOTF_ANNUL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_PE_PERSONNEL_1 FOREIGN KEY (ID_PERS_USR_1) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_PE_PERSONNEL_2 FOREIGN KEY (ID_PERS_USR_2) REFERENCES PE_PERSONNEL (ID_PERSONNEL);
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_CO_LST_DEPENSE FOREIGN KEY (ID_DEPENSE) REFERENCES CO_LST_DEPENSE (ID_DEPENSE) ;
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_PA_PARAM_GLOB_STATU FOREIGN KEY (ID_PA_STATU_ANNUL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
-- ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;


ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT  FK_SE_USERNAME_UPD_CO_ANNUL_TRANSACT FOREIGN KEY (USERNAME_UPD)  REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_CO_TRANSACT_ANNUL FOREIGN KEY (ID_TRANSAC_ANNUL) REFERENCES CO_TRANSAC_CAISSE (ID_TRANSAC) ;
ALTER TABLE CO_ANNUL_TRANSACT ADD CONSTRAINT FK_CO_ANNUL_TRANSACT_CO_TRANSACT FOREIGN KEY (ID_TRANSAC) REFERENCES CO_TRANSAC_CAISSE (ID_TRANSAC) ;
ALTER TABLE CO_PARAM_SCOLARITE ADD CONSTRAINT FK_CO_PARAM_SCOLARITE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYP_ELEV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE CO_PARAM_SCOLARITE ADD CONSTRAINT FK_CO_PARAM_SCOLARITE_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE CO_REL_CAISSE_ACCESS_PERSONNEL ADD CONSTRAINT FK_CO_REL_CAISSE_ACCESS_PERSONNEL_CO_CAISSE FOREIGN KEY (ID_CAISSE) REFERENCES CO_CAISSE (ID_CAISSE) ;
ALTER TABLE CO_REL_CAISSE_ACCESS_PERSONNEL ADD CONSTRAINT FK_CO_REL_CAISSE_ACCESS_PE_PERSONNEL FOREIGN KEY (ID_PERS) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE CO_REL_CAISSE_ACCESS_PERSONNEL ADD CONSTRAINT FK_SE_USERNAME_UPD_CO_REL_CAISSE_ACCESS_PERSONNEL FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_REL_CAISSE_ACCESS_PERSONNEL ADD CONSTRAINT FK_SE_USERNAME_CREA_CO_REL_CAISSE_ACCESS_PERSONNEL FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_HISTO_CONXION_CAISSE ADD CONSTRAINT FK_CO_HISTO_CONXION_CAISSE_CO_CAISSE FOREIGN KEY (ID_CAISSE) REFERENCES CO_CAISSE (ID_CAISSE) ;
ALTER TABLE CO_HISTO_CONXION_CAISSE ADD CONSTRAINT FK_CO_HISTO_CONXION_CAISSE_PE_PERSONNELADD FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL);
ALTER TABLE CO_HISTO_CONXION_CAISSE ADD CONSTRAINT FK_CO_HISTO_CONXION_CAISSE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_TRANSAC_CAISSE ADD CONSTRAINT FK_CO_TRANSAC_CAISSE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_TRANSAC_CAISSE ADD CONSTRAINT FK_CO_TRANSAC_CAISSE_CO_LST_DEPENSE FOREIGN KEY (ID_DEPENSE) REFERENCES CO_LST_DEPENSE (ID_DEPENSE) ;
ALTER TABLE CO_TRANSAC_CAISSE ADD CONSTRAINT FK_CO_TRANSAC_CAISSE_CO_LIST_ID_RECETTE FOREIGN KEY (ID_RECETTE) REFERENCES CO_LIST_ID_RECETTE (ID_RECETTE) ;
-- ALTER TABLE CO_TRANSAC_CAISSE ADD CONSTRAINT FK_CO_TRANSAC_CAISSE_CO_HISTO_CONXION_CAISSE FOREIGN KEY (ID_CONXION_CAISSE) REFERENCES CO_HISTO_CONXION_CAISSE (ID_CONXION_CAISSE) ;
ALTER TABLE CO_TRANSAC_CAISSE ADD CONSTRAINT FK_CO_TRANSAC_CAISSE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_TYP_TRANSAC) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE CO_TRANSAC_CAISSE ADD CONSTRAINT FK_CO_TRANSAC_CAISSE_PA_PARAM_GLOB_2 FOREIGN KEY (ID_PA_MOY_PAIMEN) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE CO_TRANSFERT_FOND ADD CONSTRAINT FK_CO_TRANSFERT_FOND_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_TRANSFERT_FOND ADD CONSTRAINT FK_CO_TRANSFERT_FOND_PE_PERSONNEL_1ADD FOREIGN KEY (ID_PERS_USR_1) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE CO_TRANSFERT_FOND ADD CONSTRAINT FK_CO_TRANSFERT_FOND_PE_PERSONNEL_2ADD FOREIGN KEY (ID_PERS_USR_2) REFERENCES PE_PERSONNEL (ID_PERSONNEL);
ALTER TABLE CO_TRANSFERT_FOND ADD CONSTRAINT FK_CO_TRANSFERT_FOND_CO_LST_DEPENSE FOREIGN KEY (ID_DEPENSE) REFERENCES CO_LST_DEPENSE (ID_DEPENSE) ;
ALTER TABLE CO_TRANSFERT_FOND ADD CONSTRAINT FK_CO_TRANSFERT_FOND_CO_LIST_ID_RECETTE FOREIGN KEY (ID_RECETTE) REFERENCES CO_LIST_ID_RECETTE (ID_RECETTE) ;
ALTER TABLE CO_RECETTE_ELEVE ADD CONSTRAINT FK_CO_RECETTE_ELEVE_CO_PARAM_SCOLARITE FOREIGN KEY (ID_PARAM_SCOLARITE) REFERENCES CO_PARAM_SCOLARITE (ID_PARAM_SCOLARITE) ;
ALTER TABLE CO_RECETTE_ELEVE ADD constraint FK_CO_RECETTE_ELEVE_CO_GROUP_RECETTE FOREIGN KEY (ID_GROUP_REC) REFERENCES CO_GROUP_RECETTE(ID_GROUP_REC);
ALTER TABLE CO_INSCRIPTION_CANTINE ADD CONSTRAINT FK_CO_INSCRIPTION_CANTINE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE CO_RECETTE_ELEVE ADD CONSTRAINT FK_CO_RECETTE_ELEVE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE CO_PAIEMEN_BOURSE ADD CONSTRAINT FK_CO_PAIEMEN_BOURSE_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE CO_PAIEMEN_BOURSE ADD CONSTRAINT FK_CO_PAIEMEN_SALAIR_PA_ARTICLE FOREIGN KEY (ID_ARTICLE) REFERENCES  PA_ARTICLE (ID_ARTICLE)  ;
ALTER TABLE CO_DERNIER_NUMERO_RECU ADD CONSTRAINT FK_CO_DERNIER_NUMERO_RECU_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_AUTR_DEPENSE ADD CONSTRAINT FK_CO_AUTR_DEPENSE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_UNIT_MESURE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE  EV_COMMENT_DIFFICULT ADD CONSTRAINT FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB FOREIGN KEY (ID_PA_DIFFICULT) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE  EV_COMMENT_DIFFICULT ADD CONSTRAINT FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB_PERIOD FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE  EV_COMMENT_DIFFICULT ADD CONSTRAINT FK_EV_COMMENT_DIFFICULT_PA_PARAM_GLOB_NIVEAU FOREIGN KEY (ID_PA_NIV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_COMMENT_DIFFICULT ADD CONSTRAINT FK_EV_COMMENT_DIFFICULT_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EV_COMMENT_DIFFICULT ADD CONSTRAINT FK_EV_COMMENT_DIFFICULT_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EV_COMMENT_DIFFICULT ADD CONSTRAINT FK_EV_COMMENT_DIFFICULT_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EV_COMMENT_DIFFICULT ADD CONSTRAINT FK_EV_COMMENT_DIFFICULT_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE  EV_COMMENT_SOLUTION ADD CONSTRAINT FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB FOREIGN KEY (ID_PA_SOLUTION) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE  EV_COMMENT_SOLUTION ADD CONSTRAINT FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB_PERIOD FOREIGN KEY (ID_PA_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE  EV_COMMENT_SOLUTION ADD CONSTRAINT FK_EV_COMMENT_SOLUTION_PA_PARAM_GLOB_NIVEAU FOREIGN KEY (ID_PA_NIV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE EV_COMMENT_SOLUTION ADD CONSTRAINT FK_EV_COMMENT_SOLUTION_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EV_COMMENT_SOLUTION ADD CONSTRAINT FK_EV_COMMENT_SOLUTION_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION) ;
ALTER TABLE EV_COMMENT_SOLUTION ADD CONSTRAINT FK_EV_COMMENT_SOLUTION_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EV_COMMENT_SOLUTION ADD CONSTRAINT FK_EV_COMMENT_SOLUTION_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE CO_AUTR_DEPENSE ADD CONSTRAINT FK_CO_AUTR_DEPENSE_PA_SOUS_ARTICLE FOREIGN KEY (ID_SS_ARTICL) REFERENCES PA_SOUS_ARTICLE (ID_SS_ARTICL) ;
ALTER TABLE CO_AUTR_DEPENSE ADD CONSTRAINT FK_CO_AUTR_DEPENSE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_AUTR_DEPENSE ADD CONSTRAINT FK_CO_AUTR_DEPENSE_CO_LST_DEPENSE FOREIGN KEY (ID_DEPENSE) REFERENCES CO_LST_DEPENSE (ID_DEPENSE) ;
ALTER TABLE CO_AUTR_DEPENSE ADD CONSTRAINT FK_CO_AUTR_DEPENSE_PA_ARTICLE FOREIGN KEY (ID_ARTICLE) REFERENCES PA_ARTICLE (ID_ARTICLE) ;
ALTER TABLE CO_PAIEMEN_SALAIR ADD CONSTRAINT FK_CO_PAIEMEN_SALAIR_CO_LST_DEPENSE FOREIGN KEY (ID_DEPENSE) REFERENCES CO_LST_DEPENSE (ID_DEPENSE) ;
-- ALTER TABLE CO_PAIEMEN_SALAIR ADD CONSTRAINT FK_CO_PAIEMEN_SALAIR_PA_ARTICLE FOREIGN KEY (ID_ARTICLE) REFERENCES  PA_ARTICLE (ID_ARTICLE)  ;
ALTER TABLE CO_PAIEMEN_BOURSE ADD CONSTRAINT FK_CO_PAIEMEN_BOURSE_CO_LST_DEPENSE FOREIGN KEY (ID_DEPENSE) REFERENCES CO_LST_DEPENSE (ID_DEPENSE) ;
ALTER TABLE CO_AUTR_RECETTE ADD CONSTRAINT FK_CO_AUTR_RECETTE_PA_SOUS_ARTICLE FOREIGN KEY (ID_SS_ARTICL) REFERENCES PA_SOUS_ARTICLE (ID_SS_ARTICL) ;
ALTER TABLE CO_AUTR_RECETTE ADD CONSTRAINT FK_CO_AUTR_RECETTE_PA_ARTICLE FOREIGN KEY (ID_ARTICLE) REFERENCES PA_ARTICLE (ID_ARTICLE) ;
ALTER TABLE CO_AUTR_RECETTE ADD CONSTRAINT FK_CO_AUTR_RECETTE_CO_LIST_ID_RECETTE FOREIGN KEY (ID_RECETTE) REFERENCES CO_LIST_ID_RECETTE (ID_RECETTE) ;
ALTER TABLE CO_AUTR_RECETTE ADD CONSTRAINT FK_CO_AUTR_RECETTE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_UNIT_MESURE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE CO_AUTR_RECETTE ADD CONSTRAINT FK_CO_AUTR_RECETTE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_PAIEMEN_SALAIR ADD CONSTRAINT FK_CO_PAIEMEN_SALAIR_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_INSCRIPTION_CANTINE ADD CONSTRAINT FK_CO_INSCRIPTION_CANTINE_CO_AUTR_RECETTE FOREIGN KEY (ID_RECETTE,NUM_ORDR_PAIE) REFERENCES CO_AUTR_RECETTE (ID_RECETTE,NUM_ORDR_PAIE) ;
ALTER TABLE CO_PAIEMEN_SALAIR ADD CONSTRAINT FK_CO_PAIEMEN_SALAIR_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE CO_INSCRIPTION_CANTINE ADD CONSTRAINT FK_CO_INSCRIPTION_CANTINE_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE CO_INSCRIPTION_CANTINE ADD CONSTRAINT FK_CO_INSCRIPTION_CANTINE_PA_PARAM_GLOB FOREIGN KEY (ID_PA_PLAT) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE CO_RECETTE_ELEVE ADD CONSTRAINT FK_CO_RECETTE_ELEVE_CO_LIST_ID_RECETTE FOREIGN KEY (ID_RECETTE) REFERENCES CO_LIST_ID_RECETTE (ID_RECETTE) ;
ALTER TABLE EM_CAHIER_TEXTE ADD CONSTRAINT FK_EM_CAHIER_TEXTE_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE) ;
ALTER TABLE EM_CAHIER_TEXTE ADD CONSTRAINT FK_EM_CAHIER_TEXTE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE EM_CAHIER_TEXTE ADD CONSTRAINT FK_EM_CAHIER_TEXTE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE EM_CAHIER_TEXTE ADD CONSTRAINT FK_EM_CAHIER_TEXTE_PE_PROFESSEUR FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PROFESSEUR (ID_PERSONNEL) ;
ALTER TABLE EM_REL_CONTRAINT_PROFESSEUR ADD CONSTRAINT FK_EM_REL_CONTRAINT_PROFESSEUR_PE_PROFESSEUR FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PROFESSEUR (ID_PERSONNEL) ;
ALTER TABLE SE_USERS ADD CONSTRAINT FK_SE_USERS_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL) ;
ALTER TABLE EL_DERN_NUMERO_MATRICULE ADD CONSTRAINT FK_EL_DERN_NUMERO_MATRICULE_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE(ID_AN_SCOLAIRE) ;
ALTER TABLE SE_REL_USERS_ROLES ADD CONSTRAINT  FK_SE_USERNAME_ROLE FOREIGN KEY (USERNAME) REFERENCES SE_USERS (USERNAME);
ALTER TABLE SE_REL_ROLES_FONCTIONNALITES ADD CONSTRAINT  FK_SE_REL_ROLES_FONCTIONNALITES_FONCTIONCODE FOREIGN KEY (CODE_FONCTION) REFERENCES SE_FONCTIONNALITES (CODE_FONCTION);
ALTER TABLE SE_REL_ROLES_FONCTIONNALITES ADD CONSTRAINT  FK_SE_REL_ROLES_FONCTIONNALITES_ROLECODE FOREIGN KEY (CODE_ROLE) REFERENCES SE_ROLES (CODE_ROLE);
ALTER TABLE SE_REL_USERS_ROLES ADD CONSTRAINT  FK_SE_SE_ROLECODE_USERS FOREIGN KEY (CODE_ROLE) REFERENCES SE_ROLES (CODE_ROLE);
ALTER TABLE SE_HISTO_CONXION_APPL ADD CONSTRAINT FK_SE_HISTO_CONXION_APPL_SE_USERS FOREIGN KEY (USERNAME) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EV_EVALUATION ADD CONSTRAINT  FK_SE_USERNAME_CREA_EVALUATION FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_EVALUATION ADD CONSTRAINT  FK_SE_USERNAME_UPD_EVALUATION FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_CREA_MOY_MAT FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_UPD__MOY_MAT FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT  FK_SE_USERNAME_CREA_MOY_PERIOD FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_MOYENNE_PERIODE ADD CONSTRAINT  FK_SE_USERNAME_UPD_MOY_PERIOD FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_REL_EVALUATION_PERIODE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EVAL_PERD FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_REL_EVALUATION_PERIODE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EVAL_PERD FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_REL_NOTE_EVAL_ELEVE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EV_NOTE_ELV FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_REL_NOTE_EVAL_ELEVE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EV_NOTE_ELV FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_CREA_MOY_PRD_MAT FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_REL_REGLE_MOYENNE_PERIODE_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_UPD_MOY_PRD_MAT FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_AUTR_DEPENSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_AUTR_DEPENSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_AUTR_RECETTE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_AUTR_RECETTE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_INSCRIPTION_CANTINE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_INSCRIPTION_CANTINE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_LIST_ID_RECETTE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_LIST_ID_RECETTE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_LST_DEPENSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_LST_DEPENSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_PAIEMEN_BOURSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_PAIEMEN_BOURSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_PAIEMEN_SALAIR ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_PAIEMEN_SALAIR FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_PARAM_SCOLARITE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_PARAM_SCOLARITE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_PARAM_SCOLARITE ADD CONSTRAINT  FK_SE_USERNAME_UPD_CO_PARAM_SCOLARITE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_RECETTE_ELEVE ADD CONSTRAINT  FK_SE_USERNAME_CREA_CO_RECETTE_ELEVE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_ABSENCE_ELEVE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_ABSENCE_ELEVE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_DOCUMENT_BOURSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_DOCUMENT_BOURSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_DOSSIER_BOURSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_DOSSIER_BOURSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_ELEVE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_ELEVE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_INCIDENT ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_INCIDENT FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_INSCRIPTION ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_INSCRIPTION FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_PARAM_BOURSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_PARAM_BOURSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_CHEF_CLASSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_REL_CHEF_CLASSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_DEPOT_DOSSIER_DOCUMENT ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_REL_DEPOT_DOSSIER_DOCUMENT FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_DIPLOME ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_REL_DIPLOME FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_DOC_ADMINSTR ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_REL_DOC_ADMINSTR FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_ABSENCE_ELEVE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_ABSENCE_ELEVE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_DOCUMENT_BOURSE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_DOCUMENT_BOURSE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_DOSSIER_BOURSE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_DOSSIER_BOURSE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_ELEVE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_ELEVE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_INCIDENT ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_INCIDENT FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_INSCRIPTION ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_INSCRIPTION FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_PARAM_BOURSE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_PARAM_BOURSE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_CHEF_CLASSE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_REL_CHEF_CLASSE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_DEPOT_DOSSIER_DOCUMENT ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_REL_DEPOT_DOSSIER_DOCUMENT FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_DIPLOME ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_REL_DIPLOME FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE  EL_REL_DOC_ADMINSTR ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_REL_DOC_ADMINSTR FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EM_ACTIVITE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_ACTIVITE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EM_CAHIER_TEXTE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_CAHIER_TEXTE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_EMPLOITEMPS FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_REL_CLASSE_PROF ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_REL_CLASSE_PROF FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EM_REL_CONTRAINT_CLASSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_REL_CONTRAINT_CLASSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_REL_CONTRAINT_PROFESSEUR ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_REL_CONTRAINT_PROFESSEUR FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_REL_DISPO_CLASSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_REL_DISPO_CLASSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_REL_DISPO_PROF ADD CONSTRAINT  FK_SE_USERNAME_CREA_EM_REL_DISPO_PROF FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_VERSION_EMPLOITEMPS ADD CONSTRAINT  FK_SE_USERNAME_CREA_EL_EM_VERSION_EMPLOITEMPS FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_CAHIER_TEXTE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EM_CAHIER_TEXTE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EM_EMPLOITEMPS ADD CONSTRAINT  FK_SE_USERNAME_UPD_EM_EMPLOITEMPS FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_REL_CONTRAINT_CLASSE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EM_REL_CONTRAINT_CLASSE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_REL_DISPO_CLASSE ADD CONSTRAINT  FK_SE_USERNAME_UPD_EM_REL_DISPO_CLASSE FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_REL_DISPO_PROF ADD CONSTRAINT  FK_SE_USERNAME_UPD_EM_REL_DISPO_PROF FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE EM_VERSION_EMPLOITEMPS ADD CONSTRAINT  FK_SE_USERNAME_UPD_EL_EM_VERSION_EMPLOITEMPS FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME) ;
ALTER TABLE PA_ANNEE_SCOLAIRE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_ANNEE_SCOLAIRE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_ARTICLE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_ARTICLE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_BATIMENT ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_BATIMENT FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_CALENDRIER_SCOLAIRE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_CALENDRIER_SCOLAIRE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_CHAPITRE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_CHAPITRE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_CLASSE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_CLASSE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_COMMUNE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_COMMUNE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_ETABLISSEMENT ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_ETABLISSEMENT FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_HORAIRE_SEMAINE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_HORAIRE_SEMAINE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_MATIERE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_MATIERE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
# AJOUT MANNUEL 2022-05-08
ALTER TABLE PA_REL_OPTION_MATIER_NIV_ETUD ADD CONSTRAINT FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_NIV_ETUDEADD FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE PA_REL_OPTION_MATIER_NIV_ETUD ADD CONSTRAINT FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE PA_REL_OPTION_MATIER_NIV_ETUD ADD CONSTRAINT FK_PA_REL_OPTION_MATIER_NIV_ETUD_PA_PARAM_GLOB_OPTION FOREIGN KEY (ID_PA_OPTION) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE PA_SOU_MATIERE ADD CONSTRAINT FK_PA_SOU_MATIERE_PA_MATIERE FOREIGN KEY (ID_MATIERE) REFERENCES PA_MATIERE (ID_MATIERE) ;
ALTER TABLE PA_REL_SOU_MATIERE_NIV_ETUD ADD CONSTRAINT FK_PA_SOU_MATIERE_PA_NIV_ETUDEADD FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE PA_OPTION_NIV_ETUD ADD CONSTRAINT FK_PA_OPTION_NIV_ETUD_PA_NIV_ETUDEADD FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU) ;
ALTER TABLE PA_OPTION_NIV_ETUD ADD CONSTRAINT FK_PA_OPTION_PA_PARAM_GLOB FOREIGN KEY (ID_PA_OPTION) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE NO_PARAM_MODEL ADD CONSTRAINT FK_NO_PARAM_MODEL_NO_TYP_EVENEMENT_NOTI FOREIGN KEY (ID_TYP_EVENEMNT) REFERENCES NO_TYP_EVENEMENT_NOTI (ID_TYP_EVENEMNT) ;
ALTER TABLE NO_NOTIFICATION ADD CONSTRAINT FK_NO_NOTIFICATION_NO_PERSONNE_NOTI FOREIGN KEY (ID_PERSON_INT) REFERENCES NO_PERSONNE_NOTI (ID_PERSON_INT) ;
ALTER TABLE NO_NOTIFICATION ADD CONSTRAINT FK_NO_NOTIFICATION_PA_PARAM_GLOB FOREIGN KEY (ID_PA_STATUT_ENV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE NO_NOTIFICATION ADD CONSTRAINT FK_NO_NOTIFICATION_NO_ABONNEMENT_PERSON FOREIGN KEY (ID_ABON_PERS) REFERENCES NO_ABONNEMENT_PERSON (ID_ABON_PERS) ;
ALTER TABLE NO_NOTIFICATION ADD CONSTRAINT FK_NO_NOTIFICATION_NO_EVENMNT FOREIGN KEY (ID_EVT_INT) REFERENCES NO_EVENMNT (ID_EVT_INT) ;
ALTER TABLE NO_NOTIFICATION ADD CONSTRAINT FK_NO_NOTIFICATION_NO_PARAM_MODEL FOREIGN KEY (ID_PARAM_MODEL) REFERENCES NO_PARAM_MODEL (ID_PARAM_MODEL) ;
ALTER TABLE NO_REL_DET_ABONNEMNT_TYP_EVT ADD CONSTRAINT FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_ABONNEMENT FOREIGN KEY (ID_ABONNEMENT) REFERENCES NO_ABONNEMENT (ID_ABONNEMENT) ;
ALTER TABLE NO_REL_DET_ABONNEMNT_TYP_EVT ADD CONSTRAINT FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_TYP_EVENEMENT_NOTI FOREIGN KEY (ID_TYP_EVENEMNT) REFERENCES NO_TYP_EVENEMENT_NOTI (ID_TYP_EVENEMNT) ;
ALTER TABLE NO_REL_DET_ABONNEMNT_TYP_EVT ADD CONSTRAINT FK_NO_REL_DET_ABONNEMNT_TYP_EVT_NO_PARAM_MODEL FOREIGN KEY (ID_PARAM_MODEL) REFERENCES NO_PARAM_MODEL (ID_PARAM_MODEL) ;
ALTER TABLE NO_REL_DET_ABONNEMNT_TYP_EVT ADD CONSTRAINT FK_NO_REL_DET_ABONNEMNT_TYP_EVT_PA_PARAM_GLOB FOREIGN KEY (ID_PA_FREQ_ENV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE NO_REL_DET_ABONNEMNT_TYP_EVT ADD CONSTRAINT FK_NO_REL_DET_ABONNEMNT_TYP_EVT_PA_PARAM_GLOB1 FOREIGN KEY (ID_PA_FREQ_ENV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;
ALTER TABLE NO_ABONNEMENT_PERSON ADD CONSTRAINT FK_NO_ABONNEMENT_PERSON_NO_ABONNEMENT FOREIGN KEY (ID_ABONNEMENT) REFERENCES NO_ABONNEMENT (ID_ABONNEMENT) ;
ALTER TABLE NO_ABONNEMENT_PERSON ADD CONSTRAINT FK_NO_ABONNEMENT_PERSON_NO_PERSONNE_NOTI FOREIGN KEY (ID_PERSON_INT) REFERENCES NO_PERSONNE_NOTI (ID_PERSON_INT) ;
ALTER TABLE NO_EVENMNT ADD CONSTRAINT FK_NO_EVENMNT_NO_TYP_EVENEMENT_NOTI FOREIGN KEY (ID_TYP_EVENEMNT) REFERENCES NO_TYP_EVENEMENT_NOTI (ID_TYP_EVENEMNT) ;
ALTER TABLE PA_NIV_ETUDE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_NIV_ETUDE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_PARAM_GLOB ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_PARAM_GLOB FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_PAYS ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_PAYS FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_PROVINCE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_PROVINCE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_REGION ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_REGION FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_REL_MATIERE_NIV_ETUD ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_REL_MATIERE_NIV_ETUD FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_REL_PERIOD_EVALUATION ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_REL_PERIOD_EVALUATION FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_REL_RESRC_SALLE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_REL_RESRC_SALLE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_RESSOURCE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_RESSOURCE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_SALLE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_SALLE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PA_SOUS_ARTICLE ADD CONSTRAINT  FK_SE_USERNAME_CREA_PA_SOUS_ARTICLE FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_ABSENCE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_ABSENCE_PERSONNEL FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_NOTE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_NOTE_PERSONNEL FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_PROFESSEUR ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_PROFESSEUR FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_DETAIL_NOTE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_REL_DETAIL_NOTE_PERSONNEL FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_DIPLOME_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_REL_DIPLOME_PERSONNEL FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_FONCTION ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_REL_FONCTION FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_FORMATION_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_REL_FORMATION_PERSONNEL FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_MATIERE_PROFESSEUR ADD CONSTRAINT  FK_SE_USERNAME_CREA_PE_REL_MATIERE_PROFESSEUR FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_ABSENCE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_ABSENCE_PERSONNEL FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_NOTE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_NOTE_PERSONNEL FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_PERSONNEL FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_PROFESSEUR ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_PROFESSEUR FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_DETAIL_NOTE_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_REL_DETAIL_NOTE_PERSONNEL FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_DIPLOME_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_REL_DIPLOME_PERSONNEL FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_FONCTION ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_REL_FONCTION FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_FORMATION_PERSONNEL ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_REL_FORMATION_PERSONNEL FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE PE_REL_MATIERE_PROFESSEUR ADD CONSTRAINT  FK_SE_USERNAME_UPD_PE_REL_MATIERE_PROFESSEUR FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_RECETTE_ELEVE ADD CONSTRAINT FK_CO_RECETTE_ELEVE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_PAIEMEN_BOURSE ADD CONSTRAINT FK_CO_PAIEMEN_BOURSE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
-- ALTER TABLE CO_AUTR_DEPENSE ADD CONSTRAINT FK_CO_AUTR_DEPENSE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE) ;
ALTER TABLE CO_SCOLARITE_ECHEANC ADD CONSTRAINT FK_CO_SCOLARITE_ECHEANC_ANNEE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE);
ALTER TABLE CO_SCOLARITE_ECHEANC ADD CONSTRAINT FK_CO_SCOLARITE_ECHEANC_TYP_ELEV FOREIGN KEY (ID_PA_TYP_ELEV) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE CO_SCOLARITE_ECHEANC ADD CONSTRAINT FK_CO_SCOLARITE_ECHEANC_NIV_ETU FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU);
ALTER TABLE CO_SCOLARITE_ECHEANC ADD CONSTRAINT FK_CO_SCOLARITE_ECHEANC_USERNAME_CREA FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
ALTER TABLE CO_SCOLARITE_ECHEANC ADD CONSTRAINT FK_CO_SCOLARITE_ECHEANC_USERNAME_UPD FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
ALTER TABLE EV_BORDREAU_RETRAIT_BULLETIN ADD CONSTRAINT  FK_EV_BORDEREAU_EL_INSCRIPTION FOREIGN KEY (ID_INSCRIPTION) REFERENCES EL_INSCRIPTION (ID_INSCRIPTION);
ALTER TABLE EV_BORDREAU_RETRAIT_BULLETIN ADD CONSTRAINT  FK_EV_BORDEREAU_PA_PERIOD_EVAL FOREIGN KEY (ID_PERIODE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE ST_COMPTABILITE ADD CONSTRAINT FK_ST_COMPTABILITE_ARTICLE FOREIGN KEY (ID_ARTICLE) REFERENCES PA_ARTICLE (ID_ARTICLE);
ALTER TABLE ST_COMPTABILITE ADD CONSTRAINT FK_ST_COMPTABILITE_AN_SCOLAIRE_ACTUEL FOREIGN KEY (ID_AN_SCOLAIRE_ACTUEL) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE);
ALTER TABLE ST_COMPTABILITE ADD CONSTRAINT  FK_ST_COMPTABILITE_AN_SCOLAIRE_STATISTIQUE FOREIGN KEY (ID_AN_SCOLAIRE_STATISTIQUE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE);
ALTER TABLE ST_DATE_GENERATE ADD CONSTRAINT FK_ST_DATE_GENERATE_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE);
ALTER TABLE ST_PERSONNEL ADD CONSTRAINT FK_ST_PERSONNEL_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE);
ALTER TABLE ST_PERSONNEL ADD CONSTRAINT FK_ST_PERSONNEL_PA_MATIERE1 FOREIGN KEY (ID_MATIERE1) REFERENCES PA_MATIERE (ID_MATIERE);
ALTER TABLE ST_PERSONNEL ADD CONSTRAINT FK_ST_PERSONNEL_PA_MATIERE2 FOREIGN KEY (ID_MATIERE2) REFERENCES PA_MATIERE (ID_MATIERE);
ALTER TABLE ST_PERSONNEL ADD CONSTRAINT FK_ST_PERSONNEL_PA_MATIERE3 FOREIGN KEY (ID_MATIERE3) REFERENCES PA_MATIERE (ID_MATIERE);
ALTER TABLE ST_PERSONNEL ADD CONSTRAINT FK_ST_PERSONNEL_PA_PARAM_GLOB_PROF FOREIGN KEY (ID_PA_PRO_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE ST_PERSONNEL ADD CONSTRAINT FK_ST_PERSONNEL_PA_PARAM_GLOB_FONC_REEL FOREIGN KEY (ID_PA_FONC_REEL) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE ST_PERSONNEL ADD CONSTRAINT FK_ST_PERSONNEL_PA_PARAM_GLOB_STATU_PERS FOREIGN KEY (ID_PA_STATU_PERS) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE ST_ELEVE_CLASSE_ANNEE_SCOL ADD CONSTRAINT FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES PA_CLASSE (ID_CLASSE);
ALTER TABLE ST_ELEVE_CLASSE_ANNEE_SCOL ADD CONSTRAINT FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETU) REFERENCES PA_NIV_ETUDE (ID_NIV_ETU);
ALTER TABLE ST_ELEVE_CLASSE_ANNEE_SCOL ADD CONSTRAINT FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_ANNEE_SCOLAIRE FOREIGN KEY (ID_AN_SCOLAIRE) REFERENCES PA_ANNEE_SCOLAIRE (ID_AN_SCOLAIRE);
ALTER TABLE ST_ELEVE_CLASSE_ANNEE_SCOL ADD CONSTRAINT FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_PARAM_GLOB_CYCL FOREIGN KEY (ID_PA_CYCLE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE ST_ELEVE_CLASSE_ANNEE_SCOL ADD CONSTRAINT FK_ST_ELEVE_CLASSE_ANNEE_SCOL_PA_PARAM_GLOB_STATUT FOREIGN KEY (ID_PA_STATUT_ELEVE) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE CO_CRED_PERS ADD CONSTRAINT FK_PERS_EMPL FOREIGN KEY (ID_PERS_EMPL) REFERENCES PE_PERSONNEL(ID_PERSONNEL);
ALTER TABLE CO_CRED_PERS ADD CONSTRAINT FK_DEPENSE FOREIGN KEY (ID_DEPENS) REFERENCES CO_LST_DEPENSE(ID_DEPENSE);
ALTER TABLE CO_CRED_PERS ADD CONSTRAINT FK_PA_ECHEANCE FOREIGN KEY (ID_PA_ECHENCE) REFERENCES PA_PARAM_GLOB(ID_PARAM_GLOB);
ALTER TABLE CO_CRED_PERS ADD CONSTRAINT FK_USERNAME_CREA FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS(USERNAME);
ALTER TABLE CO_CRED_PERS ADD CONSTRAINT FK_USERNAME_UPD FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS(USERNAME);
ALTER TABLE CO_PAIE_CRED ADD CONSTRAINT FK_CRED_PAIE FOREIGN KEY (ID_REC) REFERENCES CO_CRED_PERS(ID_CRED);
ALTER TABLE CO_PAIE_CRED ADD CONSTRAINT FK_ECHEANCE_PAIE FOREIGN KEY (ID_ECHEANCE) REFERENCES CO_ECHEANCE(ID_ECHEANCE);
ALTER TABLE CO_PAIE_CRED ADD CONSTRAINT FK_USERNAME_CO_PAIE_CRED_CREA FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS(USERNAME);
ALTER TABLE CO_PAIE_CRED ADD CONSTRAINT FK_USERNAME_CO_PAIE_CRED_UPD FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS(USERNAME);
ALTER TABLE CO_ECHEANCE ADD CONSTRAINT FK_CRED_ECHEANCE FOREIGN KEY (ID_CRED) REFERENCES CO_CRED_PERS(ID_CRED);
ALTER TABLE CO_ECHEANCE ADD CONSTRAINT FK_PA_ECHEANCE1 FOREIGN KEY (ID_PA_ECHENCE) REFERENCES PA_PARAM_GLOB(ID_PARAM_GLOB);
ALTER TABLE CO_ECHEANCE ADD CONSTRAINT FK_USERNAME_CO_ECHEANCE_CRO FOREIGN KEY (USERNAME_CREA) REFERENCES SE_USERS(USERNAME);
ALTER TABLE CO_ECHEANCE ADD CONSTRAINT FK_USERNAME_CO_ECHEANCE_UPD FOREIGN KEY (USERNAME_UPD) REFERENCES SE_USERS(USERNAME);
ALTER TABLE CO_CNTRA ADD CONSTRAINT FK_CO_CNTRA_PE_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PE_PERSONNEL (ID_PERSONNEL);

ALTER TABLE CO_CNTRA ADD CONSTRAINT FK_CO_CNTRA_FK_PA_PARAM FOREIGN KEY (ID_PA_TYP_CNTRA) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);

ALTER TABLE CO_CNTRA ADD CONSTRAINT FK_CO_CNTRA_PA_PARAM_GLOB FOREIGN KEY (ID_PA_MOTF_FIN) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);

ALTER TABLE CO_ELEM_SAL ADD CONSTRAINT FK_CO_CNTRA_FK_CO_ELEM_SAL FOREIGN KEY (ID_CNTRA) REFERENCES CO_CNTRA(ID_CNTRA);

ALTER TABLE CO_ELEM_SAL ADD CONSTRAINT FK_CO_ELEM_SAL_PA_SOUS_ARTICLE FOREIGN KEY (ID_SS_ARTICL) REFERENCES PA_SOUS_ARTICLE(ID_SS_ARTICL);

ALTER TABLE co_bultin_sal ADD CONSTRAINT fk_co_bultin_sal_co_cntra foreign key (ID_CNTRA) references co_cntra (ID_CNTRA);

ALTER  TABLE co_elem_bultin ADD CONSTRAINT fk_co_elem_bultin_co_bultin foreign key (ID_BULTIN) references co_bultin_sal(ID_BULTIN);

ALTER TABLE co_elem_bultin ADD CONSTRAINT fk_co_elem_bultin_pa_sous_article foreign key (ID_SS_ARTICL) references pa_sous_article (ID_SS_ARTICL);

ALTER TABLE co_paiemen_salair ADD CONSTRAINT fk_co_paiemen_salair_co_bultin_sal foreign key (ID_BULTIN) references co_bultin_sal(ID_BULTIN);

ALTER TABLE co_autr_recette_eleve_details	ADD CONSTRAINT fk_co_autr_recette_eleve_details_pa_sous_article foreign key(ID_SS_ARTICL) references pa_sous_article(ID_SS_ARTICL);
 ALTER TABLE co_autr_recette_eleve_details    ADD CONSTRAINT fk_co_autr_recette_eleve_details_co_autr_rec_eleve foreign key(ID_RECETTE,NUM_ORD_PAIE) references co_autr_recette_eleve(ID_RECETTE,NUM_ORD_PAIE);
 ALTER TABLE co_autr_recette_eleve_details    ADD CONSTRAINT fk_co_autr_recette_eleve_details_pa_article foreign key(ID_ARTICLE) references pa_article(ID_ARTICLE);
ALTER TABLE co_autr_recette_eleve	ADD CONSTRAINT fk_co_autr_rec_eleve_co_list_id_recette foreign key(ID_RECETTE) references co_list_id_recette(ID_RECETTE);
ALTER TABLE co_autr_recette_eleve  ADD CONSTRAINT fk_co_autr_rec_eleve_pa_annee_scolaire foreign key(ID_AN_SCOLAIRE) references pa_annee_scolaire(ID_AN_SCOLAIRE);
ALTER TABLE co_autr_recette_eleve ADD CONSTRAINT fk_co_autr_rec_eleve_el_inscription foreign key(ID_INSCRIPTION) references el_inscription(ID_INSCRIPTION);
ALTER TABLE co_autr_recette_eleve ADD CONSTRAINT fk_co_autr_rec_eleve_se_usera foreign key(username_crea) references se_users(USERNAME);
  ALTER TABLE PA_CIRCONSCRIPTION ADD CONSTRAINT   fk_cir_prov FOREIGN KEY (ID_PROV) REFERENCES PA_PROVINCE(ID_PROV);
  ALTER TABLE PA_CIRCONSCRIPTION ADD CONSTRAINT   fk_cir_pays FOREIGN KEY (ID_PAYS) REFERENCES PA_PAYS(ID_PAYS);

 ALTER TABLE EV_REL_PARAM_GLOB
 ADD CONSTRAINT FK_EV_REL_PARAM_GLOB_PA_PARAM_GLOB FOREIGN KEY (ID_PARAM_GLOB) REFERENCES PA_PARAM_GLOB(ID_PARAM_GLOB);

 ALTER TABLE EV_REL_PARAM_GLOB
 ADD CONSTRAINT FK_EV_REL_PARAM_GLOB_PA_NIV_ETUDE FOREIGN KEY (ID_NIV_ETUDE) REFERENCES PA_NIV_ETUDE(ID_NIV_ETU);
ALTER TABLE el_inscription
ADD CONSTRAINT fk_el_eleve_redoubl1 FOREIGN KEY (ID_NIV_ETU_RDOUBL1) REFERENCES pa_niv_etude(ID_NIV_ETU),
ADD CONSTRAINT fk_el_eleve_redoubl2 FOREIGN KEY (ID_NIV_ETU_RDOUBL2) REFERENCES pa_niv_etude(ID_NIV_ETU),
ADD CONSTRAINT fk_el_eleve_redoubl3 FOREIGN KEY (ID_NIV_ETU_RDOUBL3) REFERENCES pa_niv_etude(ID_NIV_ETU),
ADD CONSTRAINT fk_el_eleve_redoubl4 FOREIGN KEY (ID_NIV_ETU_RDOUBL4) REFERENCES pa_niv_etude(ID_NIV_ETU);
-- Ajout de la contrainte clé étrangère
ALTER TABLE el_absence_eleve
ADD CONSTRAINT FK_el_absence_eleve_pa_matiere
    FOREIGN KEY (id_matiere)
    REFERENCES pa_matiere(id_matiere);

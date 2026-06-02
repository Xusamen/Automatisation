DROP DATABASE IF EXISTS eresto;

CREATE DATABASE IF NOT EXISTS eresto;
USE eresto;
# -----------------------------------------------------------------------------
#       TABLE : SE_ROLES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SE_ROLES
 (
   CODE_ROLE VARCHAR(10) NOT NULL  ,
   NAME_ROLE VARCHAR(45) NOT NULL  ,
   DESCRIPT_ROLE VARCHAR(256) NOT NULL  
   , PRIMARY KEY (CODE_ROLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PE_PERSONNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_PERSONNE
 (
   ID_PERS INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PAYS_NAIS INTEGER NOT NULL  ,
   ID_COM_NAIS INTEGER NULL  ,
   ID_PA_TYP_PERS INTEGER NULL  ,
   NOM VARCHAR(64) NOT NULL  ,
   PRENOM VARCHAR(64) NOT NULL  ,
   NUM_TEL_MOB VARCHAR(20) NOT NULL  ,
   NUM_TEL_FIX VARCHAR(20) NULL  ,
   NUM_TEL_BUR VARCHAR(20) NULL  ,
   ADR_MAIL VARCHAR(128) NULL  ,
   SEXE CHAR(1) NOT NULL  ,
   ADR_RESI VARCHAR(128) NULL  ,
   DATE_NAIS DATE NULL  ,
   LIEN_IMG_PERS VARCHAR(256) NULL  ,
   LIEU_NAIS VARCHAR(128) NULL ,
   DAT_SUP datetime DEFAULT NULL   
   , PRIMARY KEY (ID_PERS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_PACK_PROD
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PACK_PROD
 (
   ID_PACK_PROD INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PROD INTEGER NOT NULL  ,
   ID_PA_UNIT_MESUR INTEGER NOT NULL  ,
   PU_PACK_PROD DECIMAL(8,2) NOT NULL  
      DEFAULT 0,
   DESC_PACK_PROD VARCHAR(256) NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   DAT_SUP DATETIME NULL  
   , PRIMARY KEY (ID_PACK_PROD) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_FACTURE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_FACTURE
 (
   NUM_FACTURE VARCHAR(128) NOT NULL  ,
   ID_PA_STATU_FACTUR INTEGER NOT NULL  ,
   ID_REC INTEGER NULL  ,
   ID_DEPENS INTEGER NULL  ,
   LN_IMG_FACTURE VARCHAR(256) NOT NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (NUM_FACTURE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_REGION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_REGION
 (
   ID_REGION CHAR(32) NOT NULL  ,
   ID_PAYS INTEGER NULL  ,
   CODE_REGION CHAR(32) NOT NULL  ,
   LIBELLE_REGION CHAR(32) NOT NULL  ,
   CHEF_LIEU_REGION CHAR(32) NOT NULL  
   , PRIMARY KEY (ID_REGION) 
 ) 
 comment = "";
 
 # -----------------------------------------------------------------------------
#       TABLE : pa_type_document_format
# -----------------------------------------------------------------------------
 CREATE TABLE pa_type_document_format (
  idFormat int(11) NOT NULL AUTO_INCREMENT,
  taille varchar(35) DEFAULT NULL,
  dimension varchar(45) DEFAULT NULL,
  PRIMARY KEY (idFormat)
);

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
   NUM_ORDR_PAYS INTEGER NOT NULL  
      DEFAULT 999
   , PRIMARY KEY (ID_PAYS) 
   , UNIQUE INDEX PU_COD_ISO_CRT_PAYS (COD_ISO_CRT_PAYS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_COMMANDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_COMMANDE
 (
   ID_REC INTEGER NOT NULL  ,
   ID_SERVICE INTEGER NOT NULL  ,
   ID_PA_TRCH_AGE_CLI INTEGER NULL  ,
   ID_ENTREPRISE INTEGER NOT NULL  ,
   ID_PA_STATU_CMNDE INTEGER NOT NULL  ,
   ID_PERS_CAISSSE INTEGER NOT NULL  ,
   ID_PERS_CLIEN INTEGER NULL  ,
   ID_PERS_DISTRIB INTEGER NULL  ,
   DAT_COMNDE DATETIME NULL  ,
   NB_CLIENT SMALLINT NULL  ,
   MT_COMNDE DECIMAL(10,2) NOT NULL  ,
   MT_COMNDE_HT DECIMAL(10,2) NOT NULL  ,
   MT_COMNDE_TAX DECIMAL(8,2) NOT NULL  
      DEFAULT 0,
   FRAIS_TRANS_TOT DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   MT_COMNDE_PAYE DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   SORTI_AUTO CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (SORTI_AUTO in ("O","N")),
   TX_COMISSION DECIMAL(5,2) NULL  ,
   MT_REMISE DECIMAL(10,2) NULL  ,
   MT_COM_TOT DECIMAL(10,2) not  NULL default 0,
   DESC_COMNDE VARCHAR(512) NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_REC) 
 ) 
 comment = "";
 # -----------------------------------------------------------------------------
#       TABLE : CO_COMISSION
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_COMISSION
 (
   ID_REC INTEGER NOT NULL  ,
   ID_DEPENS INTEGER NOT NULL  ,
   ID_PERS INTEGER NOT NULL  ,
   MT_COM_TOT DECIMAL(10,2) NOT NULL,
   MT_COM_REST_A_PAYE DECIMAL(10,2) NOT NULL,
   USERNAME_UPD VARCHAR(45), 
   USERNAME_CREA VARCHAR(45), 
   TS_CREA DATETIME, 
   TS_UPD DATETIME, 
 PRIMARY KEY (ID_REC)   
 ) 
 comment = "";
 # -----------------------------------------------------------------------------
#       TABLE : CO_REL_CAISSE_ACCESS_EMPLOYE
# -----------------------------------------------------------------------------
 CREATE TABLE IF NOT EXISTS CO_REL_CAISSE_ACCESS_EMPLOYE
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
#       TABLE : PA_TABLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_TABLE
 (
   ID_TABLE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_SALLE INTEGER NOT NULL  ,
   NOM_TABLE VARCHAR(32) NOT NULL  ,
   CAPA_TABLE INTEGER NOT NULL  ,
   DESC_TABLE VARCHAR(128) NOT NULL  ,
   ETA_TABL CHAR(1) NOT NULL       CHECK (ETA_TABL in ("O","D")),
   DAT_MAJ DATETIME NOT NULL  ,
   DAT_DERN_OCCUP DATETIME NULL  
   , PRIMARY KEY (ID_TABLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ST_MOUV_INTERNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ST_MOUV_INTERNE
 (
   ID_MOUV_INT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_TYP_MOUV INTEGER NOT NULL  ,
   ID_SALLE_SRC INTEGER NOT NULL  ,
   ID_SALLE_CIBL INTEGER NOT NULL  ,
   ID_PERS_SRC INTEGER NOT NULL  ,
   ID_PERS_CIBL INTEGER NOT NULL  ,
   ID_MOUV_INT_RETRN INTEGER NULL  ,
   DAT_MOUV_INT DATE NOT NULL  ,
   DESC_MOUV_INT VARCHAR(128) NULL  ,
   LN_BORD_MVT_INT VARCHAR(128) NOT NULL ,
   TS_CREA DATETIME DEFAULT NULL ,  
   TS_MAJ DATETIME DEFAULT NULL ,
   PRIMARY KEY (ID_MOUV_INT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ST_MOUV_INTERNE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ST_MOUV_INTERNE_PA_PARAM_GLOB
     ON ST_MOUV_INTERNE (ID_PA_TYP_MOUV ASC);


CREATE  INDEX I_FK_ST_MOUV_INTERNE_PA_SALLE
     ON ST_MOUV_INTERNE (ID_SALLE_SRC ASC);


CREATE  INDEX I_FK_ST_MOUV_INTERNE_PE_EMPLOYE
     ON ST_MOUV_INTERNE (ID_PERS_SRC ASC);


CREATE  INDEX I_FK_ST_MOUV_INTERNE_PE_EMPLOYE2
     ON ST_MOUV_INTERNE (ID_PERS_CIBL ASC);


CREATE  INDEX I_FK_ST_MOUV_INTERNE_PA_SALLE1
     ON ST_MOUV_INTERNE (ID_SALLE_CIBL ASC);


# -----------------------------------------------------------------------------
#       TABLE : CO_DETAIL_COMNDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_DETAIL_COMNDE
 (
   ID_REC INTEGER NOT NULL  ,
   NUM_LIGN_COMND SMALLINT NOT NULL  ,
   ID_PROD INTEGER NOT NULL  ,
   ID_PLAT INTEGER NULL  ,
   QT_PROD SMALLINT NOT NULL  ,
   QT_PROD_ENVOI SMALLINT NOT NULL  
      DEFAULT 0,
   PU_APLQ DECIMAL(8,2) NOT NULL default 0,
   PU_PROD DECIMAL(8,2) NOT NULL  ,
   MT_TOT_PROD DECIMAL(10,2) NOT NULL  ,
   MT_TOT_PROD_HT DECIMAL(10,2) NULL  ,
   MT_TAX_PROD DECIMAL(8,2) NULL  ,
   PU_ACHAT_PROD DECIMAL(8,2) NULL,
   MT_TOT_ACHAT_PROD DECIMAL(10,2) NULL,
   MT_REMISE DECIMAL(10,2) NULL  ,
   FRAI_TRANS DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   FL_STOCKABLE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_STOCKABLE in ("O","N")),
   DESC_LIGN_COMND VARCHAR(256) NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_REC,NUM_LIGN_COMND) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_LIST_DEPENSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_LIST_DEPENSE
 (
   ID_DEPENS INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_STATU_COMPTA INTEGER NULL  ,
   ID_PA_STATU_LIVRAIS INTEGER NULL  
   , PRIMARY KEY (ID_DEPENS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_PLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PLAT
 (
   ID_PLAT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_UNIT_MESUR INTEGER NOT NULL  ,
   ID_MENU INTEGER NOT NULL  ,
   CODE_PLAT VARCHAR(10) NOT NULL  ,
   NOM_PLAT VARCHAR(64) NOT NULL  ,
   DESC_PLAT VARCHAR(128) NOT NULL  ,
   PU_PLAT DECIMAL(8,2) NOT NULL  ,
   DISPO_PLAT CHAR(1) NOT NULL       CHECK (DISPO_PLAT in ("O","N")),
   LN_IMG_PLAT VARCHAR(256) NOT NULL  
   , PRIMARY KEY (ID_PLAT) 
   , UNIQUE INDEX PU_CODE_PLAT (CODE_PLAT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SE_HISTO_CONXION_APPL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SE_HISTO_CONXION_APPL
 (
   ID_CONXION_APPL INTEGER NOT NULL AUTO_INCREMENT ,
   USERNAME VARCHAR(45) NOT NULL  ,
   IP_ADRES VARCHAR(128) NULL  ,
   MAC_ADRES VARCHAR(128) NULL  ,
   DAT_CONXION DATETIME NOT NULL  ,
   DAT_DECONXION DATETIME NULL  
   , PRIMARY KEY (ID_CONXION_APPL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_MENU
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_MENU
 (
   ID_MENU INTEGER NOT NULL AUTO_INCREMENT ,
   COD_MENU VARCHAR(10) NOT NULL  ,
   NOM_MENU VARCHAR(64) NOT NULL  ,
   DESC_MENU VARCHAR(256) NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   DAT_DEL DATETIME NULL  
   , PRIMARY KEY (ID_MENU) 
   , UNIQUE INDEX PU_COD_MENU (COD_MENU) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_SERVICE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_SERVICE
 (
   ID_SERVICE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_TABLE INTEGER NULL  ,
   ID_PERS_SERV INTEGER NOT NULL  ,
   DAT_DEB_SERVICE DATETIME NOT NULL  ,
   DAT_FIN_SERVICE DATETIME NULL  ,
   ID_ENTREPRISE INTEGER NOT NULL  
   , PRIMARY KEY (ID_SERVICE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SE_FONCTIONNALITES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SE_FONCTIONNALITES
 (
   CODE_FONCTION VARCHAR(10) NOT NULL  ,
   CODE_FONCTION_HIERA VARCHAR(10) NULL  ,
   NAME_FONCTION VARCHAR(45) NOT NULL  ,
   DESCRIPT_FONCTION VARCHAR(255) NOT NULL  ,
   NUMERO_ORDRE INTEGER NOT NULL  ,
   ENABLED CHAR(1) NOT NULL  
   , PRIMARY KEY (CODE_FONCTION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_LIST_RECETTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_LIST_RECETTE
 (
   ID_REC INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_STATU_COMPTA INTEGER NULL  ,
   ID_PA_STATU_LIVRAIS INTEGER NULL  
   , PRIMARY KEY (ID_REC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_COMMUNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_COMMUNE
 (
   ID_COM INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PROV INTEGER NOT NULL  ,
   COD_COM CHAR(6) NOT NULL  ,
   LIB_COM VARCHAR(128) NOT NULL  ,
   COD_TYP_COM CHAR(2) NOT NULL  ,
   ID_PAYS INTEGER NULL  
   , PRIMARY KEY (ID_COM) 
   , UNIQUE INDEX PU_COD_COM (COD_COM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_PAI_SALAIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_PAI_SALAIRE
 (
   ID_DEPENS INTEGER NOT NULL  ,
   ID_ENTREPRISE INTEGER NOT NULL  ,
   ID_PERS INTEGER NOT NULL  ,
   DAT_DEB_PRD DATE NOT NULL  ,
   DAT_FIN_PRD DATE NOT NULL  ,
   MT_PAI_SAL DECIMAL(10,2) NOT NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   DESC_SALAIR VARCHAR(255) NULL  ,
   DOC_IDENTI_PERS VARCHAR(255) NOT NULL ,
    DAT_PAIEMENT datetime NOT NULL DEFAULT current_timestamp   
   , PRIMARY KEY (ID_DEPENS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PE_FOURNISSEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_FOURNISSEUR
 (
   ID_PERS INTEGER NOT NULL  ,
   DESIGN_FOURN VARCHAR(128) NOT NULL  ,
   REF_IFU VARCHAR(128) NULL  ,
   OBJ_FOUR VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_PERS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ST_MOUV_EXTERNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ST_MOUV_EXTERNE
 (
   ID_MOUV_EXT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_STATU INTEGER NOT NULL  ,
   ID_SALLE INTEGER NOT NULL  ,
   ID_PA_TYP_MOUV INTEGER NOT NULL  ,
   ID_REC INTEGER NULL  ,
   ID_DEPENS INTEGER NULL  ,
   ID_PERS_EMP_MOUV INTEGER NOT NULL  ,
   DAT_MOUV_EXT DATE NOT NULL  ,
   DESC_MOUV_EXT VARCHAR(128) NULL  ,
   LN_BORD_MVT_EXT VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_MOUV_EXT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_TRANSAC_CAISSE_DEPENSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_TRANSAC_CAISSE_DEPENSE
 (
   ID_DEPENS INTEGER NOT NULL  ,
   NUM_DEP SMALLINT NOT NULL  ,
   ID_CONXION_CAISSE INTEGER NOT NULL  ,
   ID_PA_MOY_PAIMEN INTEGER NOT NULL  ,
   MT_DEP DECIMAL(10,2) NOT NULL  ,
   MT_DEP_TOT DECIMAL(10,2) NOT NULL  ,
   MT_DEP_REST DECIMAL(10,2) NOT NULL  ,
   MT_TOT_CAISSE_DEP DECIMAL(12,2) NOT NULL  ,
   LB_TRANSAC varchar(128),
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   DAT_TRANSACT datetime NOT NULL DEFAULT current_timestamp
   , PRIMARY KEY (ID_DEPENS,NUM_DEP) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_COMMANDE_FRS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_COMMANDE_FRS
 (
   ID_DEPENS INTEGER NOT NULL  ,
   ID_PA_STATU_CMNDE INTEGER NOT NULL  ,
   ID_ENTREPRISE INTEGER NOT NULL  ,
   ID_PERS_FRS INTEGER NULL  ,
   ID_PERS_EMPL INTEGER NOT NULL  ,
   DAT_COMNDE DATE NOT NULL  ,
   MT_COMNDE DEC(10,2) NOT NULL  ,
   MT_COMNDE_PAYE DEC(10,2) NOT NULL  ,
   MT_COMNDE_HT DEC(10,2) NOT NULL  ,
   MT_COMNDE_TVA DEC(10,2) NOT NULL  ,
   MT_CMNDE_FRAIS DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   MT_CMNDE_FRAIS_TOTAL DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   ENTRE_AUTO CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (ENTRE_AUTO in ("O","N")),
   DESC_COMNDE VARCHAR(128) NULL  ,
   DAT_CREA DATE NOT NULL  ,
   DAT_UPD DATE NOT NULL  
   , PRIMARY KEY (ID_DEPENS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_CAISSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_CAISSE
 (
   ID_CAISSE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_TYPE_CAISSE INTEGER NOT NULL  ,
   CODE_CAISSE VARCHAR(24) NOT NULL  ,
   NOM_CAISSE VARCHAR(64) NOT NULL  ,
   DESC_CAISSE VARCHAR(256) NOT NULL  ,
   FLAG_CAISSE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FLAG_CAISSE in ("O","N")),
   SOLD_CAISSE DECIMAL(18,2) NOT NULL  ,
   DAT_CREAT DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   FL_REC_DEP CHAR(1) NOT NULL       CHECK (FL_REC_DEP in ("D","R"))
   , PRIMARY KEY (ID_CAISSE) 
   , UNIQUE INDEX PU_CODE_CAISSE (CODE_CAISSE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_TRANSFERT_FOND
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_TRANSFERT_FOND
 (
   ID_TRANSFER_FOND INTEGER NOT NULL AUTO_INCREMENT ,
   ID_DEPENS INTEGER NOT NULL  ,
   NUM_DEP SMALLINT NOT NULL  ,
   NUM_PAIEMENT SMALLINT NOT NULL  ,
   ID_REC INTEGER NOT NULL  ,
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
#       TABLE : PA_ENTITE_GESTION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_ENTITE_GESTION
 (
   ID_EGESTION INTEGER NOT NULL AUTO_INCREMENT ,
   ID_ENTREPRISE INTEGER NOT NULL  ,
   COD_EGESTION CHAR(7) NOT NULL  ,
   LIB_EGESTION VARCHAR(128) NULL  ,
   DAT_DEB_EGESTION DATE NULL  ,
   DAT_FIN_EGESTION DATE NULL  
   , PRIMARY KEY (ID_EGESTION) 
   , UNIQUE INDEX PU_COD_EGESTION (COD_EGESTION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_CALENDRIER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_CALENDRIER
 (
   DATE_CAL DATE NOT NULL  ,
   NUM_JOUR SMALLINT NOT NULL  ,
   NOM_JOUR VARCHAR(20) NOT NULL  ,
   NUM_MOIS SMALLINT NOT NULL  ,
   NOM_MOIS VARCHAR(20) NOT NULL  ,
   NUM_SEM SMALLINT NOT NULL  ,
   NOM_SEM VARCHAR(20) NOT NULL  ,
   DAT_DEB_SEM DATE NOT NULL  ,
   DAT_FIN_SEM DATE NOT NULL  ,
   DAT_DEB_MOIS DATE NOT NULL  ,
   DAT_FIN_MOIS DATE NOT NULL  ,
   NUM_TRIM SMALLINT NOT NULL  ,
   NOM_TRIM VARCHAR(20) NOT NULL  ,
   DAT_DEB_TRIM DATE NOT NULL  ,
   DAT_FIN_TRIM DATE NOT NULL  
   , PRIMARY KEY (DATE_CAL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_PRODUIT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PRODUIT
 (
   ID_PROD INTEGER NOT NULL AUTO_INCREMENT ,
   ID_CATEG_PROD INTEGER NOT NULL  ,
   ID_PA_UNIT_MESUR INTEGER NULL  ,
   COD_PROD VARCHAR(28) NOT NULL  ,
   NOM_PROD VARCHAR(128) NOT NULL  ,
   DESC_PROD VARCHAR(128) NULL  ,
   LN_IMG_PROD VARCHAR(256) NOT NULL  ,
   TX_TVA DECIMAL(6,2) NOT NULL  
      DEFAULT 0,
   PU_PROD_ACH DEC(8,2) NOT NULL  
      DEFAULT 0,
   PU_PROD_VEN DECIMAL(8,2) NOT NULL  
      DEFAULT 0,
   FL_STOCKABLE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_STOCKABLE in ("O","N")),
   FL_VENTE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_VENTE in ("O","N")),
   FL_ACHAT CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_ACHAT in ("O","N")),
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   DAT_DEL DATETIME NULL  ,
   NUM_INTER_PROD VARCHAR(64) NULL  ,
   COD_BAR_PROD VARCHAR(255) NULL  ,
   ID_PA_UNITE2 INTEGER NULL  ,
   COEF_CONV_UNITE2 SMALLINT NULL  ,
   PRIX_VENTE_DISTRIB DECIMAL (7,2) NULL,
   ID_PA_ETA_TRANSFORM INTEGER NULL  
   , PRIMARY KEY (ID_PROD) 
   , UNIQUE INDEX PU_COD_PROD (COD_PROD) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_PRODUIT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_PRODUIT_PA_CATEG_PROD
     ON PA_PRODUIT (ID_CATEG_PROD ASC);


CREATE  INDEX I_FK_PA_PRODUIT_PA_PARAM_GLOB
     ON PA_PRODUIT (ID_PA_UNIT_MESUR ASC);


CREATE  INDEX I_FK_PA_PRODUIT_PA_PARAM_UNIT2
     ON PA_PRODUIT (ID_PA_UNITE2 ASC);


CREATE  INDEX I_FK_PA_PRODUIT_PA_PARAM_GLOB1
     ON PA_PRODUIT (ID_PA_ETA_TRANSFORM ASC);


# -----------------------------------------------------------------------------
#       TABLE : CO_TRANSAC_CAISSE_RECETTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_TRANSAC_CAISSE_RECETTE
 (
   ID_REC INTEGER NOT NULL  ,
   NUM_PAIEMENT SMALLINT NOT NULL  ,
   ID_PA_MOY_PAIMEN INTEGER NOT NULL  ,
   ID_CONXION_CAISSE INTEGER NOT NULL  ,
   MT_PAIEMENT DECIMAL(10,2) NOT NULL  ,
   MT_TOTAL_REC_A_PAYER DECIMAL(10,2) NOT NULL  ,
   MT_REC_REST_A_PAYER DECIMAL(10,2) NOT NULL  ,
   MT_TOTAL_CAISSE_REC DECIMAL(12,2) NOT NULL  ,
   LB_TRANSAC varchar(128),
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  ,
   DAT_TRANSACT datetime NOT NULL DEFAULT current_timestamp
   , PRIMARY KEY (ID_REC,NUM_PAIEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PE_FICHE_PRESENCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_FICHE_PRESENCE
 (
   ID_PERS_FICHE INTEGER NOT NULL  ,
   DATE_CAL DATE NOT NULL  ,
   ID_PA_STATU_PRES INTEGER NOT NULL  ,
   ID_PERS_USR INTEGER NOT NULL  ,
   DAT_HEUR_ARVE DATETIME NOT NULL  ,
   DAT_HEUR_DEPAR DATETIME NOT NULL  ,
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL  
   , PRIMARY KEY (ID_PERS_FICHE,DAT_HEUR_ARVE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_ENTREPRISE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_ENTREPRISE
 (
   ID_ENTREPRISE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PAYS INTEGER NOT NULL  ,
   ID_PROV INTEGER NULL  ,
   ID_REGION CHAR(32) NULL  ,
   ID_COM INTEGER NOT NULL  ,
   ID_PERS INTEGER NULL  ,
   NOM_ENTREPRISE VARCHAR(64) NOT NULL  ,
   NOM_CRT VARCHAR(32) NOT NULL  ,
   ADR_ENTREPRISE VARCHAR(32) NOT NULL  ,
   NUM_TEL_1 VARCHAR(20) NOT NULL  ,
   NUM_TEL_2 VARCHAR(20) NULL  ,
   NUM_TEL_3 VARCHAR(20) NULL  ,
   ADR_POSTAL VARCHAR(64) NOT NULL  ,
   RCCM VARCHAR(64) NOT NULL  ,
   CODE_THEME VARCHAR(45) NULL  ,
   NUM_IFU VARCHAR(64) NOT NULL  ,
   LN_IMG_ENTREPRISE VARCHAR(128) NULL  
   , PRIMARY KEY (ID_ENTREPRISE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_PARAM_GLOB
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PARAM_GLOB
 (
   ID_PARAM_GLOB INTEGER NOT NULL AUTO_INCREMENT ,
   COD_PARAM_GLOB VARCHAR(10) NOT NULL  ,
   COD_CATEG_PARAM_GLOB CHAR(2) NOT NULL       CHECK (COD_CATEG_PARAM_GLOB in ("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20")),
   LIB_PARAM_GLOB VARCHAR(32) NOT NULL  ,
   DESC_PARAM_GLOB VARCHAR(128) NULL  
   , PRIMARY KEY (ID_PARAM_GLOB) 
   , UNIQUE INDEX PU_COD_PARAM_GLOB (COD_PARAM_GLOB) 
 ) 
 comment = "";
/* Ajout du 26/10/2022 */
# -----------------------------------------------------------------------------
# TABLE : PA_CLASSE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PA_CLASSE
(ID_CLASSE INTEGER NOT NULL AUTO_INCREMENT ,
 CODE_CLASSE VARCHAR(32) NOT NULL  ,
 LIB_CLASSE VARCHAR(128) NOT NULL  ,
 TYP_CLASSE CHAR(2) NOT NULL ,  
 DAT_CREA DATETIME NOT NULL  ,
 DAT_UPD DATETIME NOT NULL, 
  USERNAME_CREA VARCHAR(45), 
 USERNAME_UPD VARCHAR(45), 
   PRIMARY KEY (ID_CLASSE) 
 ) 
 COMMENT = "CLASSE";
 CREATE UNIQUE INDEX I_PU_PA_CLASSE
     ON PA_CLASSE(CODE_CLASSE);
# -----------------------------------------------------------------------------
# TABLE : PA_COMPTE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PA_COMPTE
(
 ID_COMPTE INTEGER NOT NULL AUTO_INCREMENT ,
 CODE_COMPTE VARCHAR(32) NOT NULL ,
 LIB_COMPTE VARCHAR(128) NOT NULL  ,
 ID_CLASSE INTEGER NOT NULL,
 TYP_COMPTE CHAR(2) NOT NULL ,
 DAT_CREA DATETIME NOT NULL  ,
 DAT_UPD DATETIME NOT NULL, 
 USERNAME_CREA VARCHAR(45), 
 USERNAME_UPD VARCHAR(45), 
   PRIMARY KEY (ID_COMPTE) 
 ) 
 COMMENT = "COMPTE";
  CREATE UNIQUE INDEX I_PU_PA_COMPTE
     ON PA_COMPTE(CODE_COMPTE);
# -----------------------------------------------------------------------------
# TABLE : PA_SOUS_COMPTE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PA_SOUS_COMPTE
(
 ID_SOU_COMPTE INTEGER NOT NULL AUTO_INCREMENT ,
 CODE_SOU_COMPTE VARCHAR(32) NOT NULL ,
 LIB_SOU_COMPTE VARCHAR(128) NOT NULL ,
 ID_COMPTE INTEGER NOT NULL,    
 DAT_CREA DATETIME NOT NULL  ,
 DAT_UPD DATETIME NOT NULL, 
 USERNAME_CREA VARCHAR(45), 
 USERNAME_UPD VARCHAR(45), 
   PRIMARY KEY (ID_SOU_COMPTE) 
 ) 
 COMMENT = "SOUS COMPTE";
  CREATE UNIQUE INDEX I_PU_PA_SOUS_COMPTE
     ON PA_SOUS_COMPTE(CODE_SOU_COMPTE);
	 
# -----------------------------------------------------------------------------
#       TABLE : CO_HISTO_CONXION_CAISSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_HISTO_CONXION_CAISSE
 (
   ID_CONXION_CAISSE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_CAISSE INTEGER NOT NULL  ,
   ID_PERS INTEGER NOT NULL  ,
   MT_FINAL_CAISSE DECIMAL(10,2) NOT NULL  ,
   MT_INIT_CAISSE DECIMAL(10,2) NOT NULL  ,
   DAT_CONXION DATETIME NOT NULL  ,
   DAT_DECONXION DATETIME NULL  
   , PRIMARY KEY (ID_CONXION_CAISSE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ST_INVENTAIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ST_INVENTAIRE
 (
   ID_INVENT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_TYP_INVENT INTEGER NOT NULL  ,
   ID_PERS_EMP_IVENT INTEGER NOT NULL  ,
   ID_SALLE INTEGER NOT NULL  ,
   DAT_DEB_INVENT DATE NOT NULL  ,
   DAT_FIN_INVENT DATE NOT NULL  
      DEFAULT '9999-12-31',
   DESC_INVENT VARCHAR(255) NULL  ,
   LN_BORD_INVENT VARCHAR(128) NULL  
   , PRIMARY KEY (ID_INVENT) 
   , UNIQUE INDEX PU_DATE_INVENT (DAT_DEB_INVENT,ID_SALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_RECU
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_RECU
 (
   NUM_REC INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_STATU_REC INTEGER NOT NULL  ,
   ID_DEPENS INTEGER NULL  ,
   NUM_DEP SMALLINT NULL  ,
   ID_REC INTEGER NULL  ,
   NUM_PAIEMENT SMALLINT NULL  ,
   LN_IMG_REC VARCHAR(256) NULL  ,
   DAT_CREA DATE NULL  ,
   DAT_UPD DATE NULL  
   , PRIMARY KEY (NUM_REC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ST_DET_MOUV
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ST_DET_MOUV
 (
   ID_DET_MOUV INTEGER NOT NULL AUTO_INCREMENT ,
   ID_MOUV_INT INTEGER NULL  ,
   ID_MOUV_EXT INTEGER NULL  ,
   ID_INVENT INTEGER NULL  ,
   ID_PA_UNIT_MESUR INTEGER NOT NULL  ,
   ID_PROD INTEGER NOT NULL  ,
   QTE_DET_MOUV BIGINT(4) NOT NULL  ,
   DAT_MOUV DATETIME NOT NULL  ,
   DAT_PERIM DATETIME NULL  ,
   DESC_MOUV VARCHAR(256) NULL  ,
   QTE_CMNDE_TOT BIGINT(4) NULL  ,
   QTE_CMNDE_TOT_RECU BIGINT(4) NULL  ,
   QTE_RETRN BIGINT(11) NULL ,
   TS_CREA DATETIME DEFAULT NULL,
   TS_MAJ DATETIME DEFAULT NULL
   , PRIMARY KEY (ID_DET_MOUV) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CO_DETAIL_COMNDE_FRS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CO_DETAIL_COMNDE_FRS
 (
   ID_DEPENS INTEGER NOT NULL  ,
   NUM_LIGN INTEGER NOT NULL  ,
   ID_PROD INTEGER NOT NULL  ,
   PU_PROD DEC(8,2) NOT NULL  ,
   QT_PROD INTEGER NOT NULL  ,
   QT_PROD_RECU SMALLINT NOT NULL  
      DEFAULT 0,
   MT_TVA DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   MT_TOT_HT DEC(10,2) NOT NULL  ,
   MT_FRAIS DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   MT_TOT DEC(10,2) NOT NULL  ,
   FL_STOCKABLE CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_STOCKABLE in ("O","N")),
   DESC_LIGN_COMNDE VARCHAR(256) NULL  ,
   NOM_PROD_F VARCHAR(64) NULL  
   , PRIMARY KEY (ID_DEPENS,NUM_LIGN) 
 ) 
 comment = "";
/* Ajout du 26/10/2022 */
# -----------------------------------------------------------------------------
# TABLE : CO_AUTR_DEPENSE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_AUTR_DEPENSE
 (
   ID_DEPENS INTEGER NOT NULL  ,
   LIB_DEPENS VARCHAR(128) NOT NULL ,  
   ID_ENTREPRISE INTEGER NOT NULL  ,
   ID_PERS_EMPL INTEGER NOT NULL  ,
   ID_PERS_FRS INTEGER NULL ,
   ID_COMPTE INTEGER NOT NULL  ,
   ID_SOU_COMPTE INTEGER NULL  ,
   DAT_DEPEN_AUTR DATETIME NOT NULL  ,
   MT_DEPEN_AUTR DECIMAL(10,2) NOT NULL  ,
   MT_DEPEN_PAY DECIMAL(10,2) NOT NULL , 
   DESC_DEPENS VARCHAR(256) NULL  ,
   LN_FACTUR VARCHAR(1024) NOT NULL ,
   ID_PERS_CREA INTEGER NOT NULL  , 
   ID_PERS_UPD INTEGER NULL  , 
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL,     
   PRIMARY KEY (ID_DEPENS) 
 ) 
 COMMENT = "DEPENSE AUTRE";
 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_AUTR_DEPENSE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PA_SOUS_COMPTE
     ON CO_AUTR_DEPENSE (ID_SOU_COMPTE ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PA_COMPTE
     ON CO_AUTR_DEPENSE (ID_COMPTE ASC);

CREATE  INDEX I_FK_CO_AUTR_DEPENSE_CO_LIST_DEPENSE
     ON CO_AUTR_DEPENSE (ID_DEPENS ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PE_EMPLOYE_CREA
     ON CO_AUTR_DEPENSE (ID_PERS_CREA ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PE_EMPLOYE_UPD
     ON CO_AUTR_DEPENSE (ID_PERS_UPD ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_DEPENSE_PE_EMPLOYE_EMPL
     ON CO_AUTR_DEPENSE (ID_PERS_EMPL ASC);

# -----------------------------------------------------------------------------
# TABLE : CO_AUTR_RECETTE
# -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CO_AUTR_RECETTE
 (
   ID_REC INTEGER NOT NULL  ,
   LIB_REC VARCHAR(128) NOT NULL ,  
   ID_ENTREPRISE INTEGER NOT NULL  ,
   ID_PERS_EMPL INTEGER NOT NULL  ,
   ID_PERS_CLIEN INTEGER NULL,
   ID_COMPTE INTEGER NOT NULL  ,
   ID_SOU_COMPTE INTEGER NULL  ,
   DAT_REC_AUTR DATETIME NOT NULL  ,
   MT_REC_AUTR DECIMAL(10,2) NOT NULL  ,
   MT_REC_PAY DECIMAL(10,2) NOT NULL , 
   DESC_REC VARCHAR(256) NULL  ,
   LN_FACTUR VARCHAR(1024) NOT NULL ,
   ID_PERS_CREA INTEGER NOT NULL  , 
   ID_PERS_UPD INTEGER NULL  , 
   DAT_CREA DATETIME NOT NULL  ,
   DAT_UPD DATETIME NOT NULL,     
   PRIMARY KEY (ID_REC) 
 ) 
 COMMENT = "RECETTE AUTRE";
 # -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CO_AUTR_RECETTE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_CO_AUTR_RECETTE_PA_SOUS_COMPTE
     ON CO_AUTR_RECETTE (ID_SOU_COMPTE ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_RECETTE_PA_COMPTE
     ON CO_AUTR_RECETTE (ID_COMPTE ASC);

CREATE  INDEX I_FK_CO_AUTR_RECETTE_CO_LIST_RECETTE
     ON CO_AUTR_RECETTE (ID_REC ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_RECETTE_PE_EMPLOYE_CREA
     ON CO_AUTR_RECETTE (ID_PERS_CREA ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_RECETTE_PE_EMPLOYE_UPD
     ON CO_AUTR_RECETTE (ID_PERS_UPD ASC);
	 
CREATE  INDEX I_FK_CO_AUTR_RECETTE_PE_EMPLOYE_EMPLOY
     ON CO_AUTR_RECETTE (ID_PERS_EMPL ASC);

# -----------------------------------------------------------------------------
#       TABLE : PA_SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_SALLE
 (
   ID_SALLE INTEGER NOT NULL AUTO_INCREMENT ,
   ID_PA_BATIMENT INTEGER NULL  ,
   ID_ENTREPRISE INTEGER NULL  ,
   ID_PERS INTEGER NULL  ,
   COD_SALLE VARCHAR(10) NOT NULL  ,
   LIB_SALLE VARCHAR(32) NOT NULL  ,
   ID_PA_TYP_SAL INTEGER NOT NULL  ,
   DESC_SALLE VARCHAR(128) NULL  ,
   ETAT_SALLE CHAR(1) NOT NULL  
      DEFAULT "D"     CHECK (ETAT_SALLE in ("D","O","S")),
    NUM_ORDRE int not null default 9999,
   DAT_DEL DATE NULL  ,
   FL_DEFAULT_VENT CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_DEFAULT_VENT in ("O","N")),
   FL_DEFAULT_ACHA CHAR(1) NOT NULL  
      DEFAULT "N"     CHECK (FL_DEFAULT_ACHA in ("O","N"))
   , PRIMARY KEY (ID_SALLE) 
   , UNIQUE INDEX PU_COD_SALLE (COD_SALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PA_SALLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PA_SALLE_PA_PARAM_GLOB
     ON PA_SALLE (ID_PA_BATIMENT ASC);


CREATE  INDEX I_FK_PA_SALLE_PA_ENTREPRISE
     ON PA_SALLE (ID_ENTREPRISE ASC);


CREATE  INDEX I_FK_PA_SALLE_PA_PARAM_GLOB2
     ON PA_SALLE (ID_PA_TYP_SAL ASC);


# -----------------------------------------------------------------------------
#       TABLE : PA_CATEG_PROD
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_CATEG_PROD
 (
   ID_CATEG_PROD INTEGER NOT NULL AUTO_INCREMENT ,
   ID_GAM_PROD INTEGER NOT NULL  ,
   COD_CATEG_PROD VARCHAR(16) NOT NULL  ,
   NOM_CATEG_PROD VARCHAR(32) NOT NULL  ,
   DESC_CATEG_PROD VARCHAR(128) NULL  
   , PRIMARY KEY (ID_CATEG_PROD) 
   , UNIQUE INDEX PU_COD_CATEG_PROD (COD_CATEG_PROD) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_GAM_PROD
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_GAM_PROD
 (
   ID_GAM_PROD INTEGER NOT NULL AUTO_INCREMENT ,
   ID_ENTREPRISE INTEGER NOT NULL  ,
   COD_GAM_PROD VARCHAR(10) NOT NULL  ,
   NOM_GAM_PROD VARCHAR(32) NOT NULL  ,
   CODE_TYP_OPE CHAR(1) NOT NULL  ,
   DESC_GAM_PROD VARCHAR(128) NULL  
   , PRIMARY KEY (ID_GAM_PROD) 
   , UNIQUE INDEX PU_COD_GAM_PROD (COD_GAM_PROD) 
 ) 
 comment = "";
 # -----------------------------------------------------------------------------
#       TABLE : PA_TYPE_DOCUMENT_FORMAT
# -----------------------------------------------------------------------------

CREATE TABLE PA_TYPE_DOCUMENT_FORMAT (
  IDFORMAT INT(11) NOT NULL AUTO_INCREMENT,
  TAILLE VARCHAR(35) DEFAULT NULL,
  DIMENSION VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (IDFORMAT)
);
# -----------------------------------------------------------------------------
#       TABLE : PE_EMPLOYE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PE_EMPLOYE
 (
   ID_PERS INTEGER NOT NULL  ,
   ID_PA_DIPLOME INTEGER NOT NULL  ,
   ID_EGESTION INTEGER NULL  ,
   ID_PA_STATU INTEGER NOT NULL  ,
   ID_PA_FONCTION INTEGER NOT NULL  ,
   NUM_MAT_EMP VARCHAR(20) NOT NULL  ,
   DAT_EMBAUCH DATETIME NOT NULL  ,
   ANCIEN_MOIS INTEGER NOT NULL  ,
    TX_COMISSION DECIMAL(5,2) NULL,
   SAL_MENS DECIMAL(10,2) NOT NULL  
      DEFAULT 0,
   DAT_FIN_SERV_EMP DATETIME NULL  ,
   TX_COMMISSION DECIMAL(5,2) NULL  
   , PRIMARY KEY (ID_PERS) 
   , UNIQUE INDEX PU_NUM_MAT_EMP (NUM_MAT_EMP) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PE_EMPLOYE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PE_EMPLOYE_PA_PARAM_GLOB
     ON PE_EMPLOYE (ID_PA_DIPLOME ASC);


CREATE  INDEX I_FK_PE_EMPLOYE_PA_ENTITE_GESTION
     ON PE_EMPLOYE (ID_EGESTION ASC);


CREATE  INDEX I_FK_PE_EMPLOYE_PA_PARAM_GLOB1
     ON PE_EMPLOYE (ID_PA_FONCTION ASC);


CREATE  INDEX I_ID_PA_STATU
     ON PE_EMPLOYE (ID_PA_STATU ASC);


# -----------------------------------------------------------------------------
#       TABLE : ST_DET_INVENTAIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ST_DET_INVENTAIRE
 (
   ID_INVENT INTEGER NOT NULL  ,
   ID_PA_UNIT_MESUR INTEGER NOT NULL  ,
   ID_PROD INTEGER NOT NULL  ,
   QTE_ENTREE INTEGER NOT NULL  ,
   QTE_SORTIE INTEGER NOT NULL  ,
   QTE_CORECTION INTEGER NOT NULL  ,
   QTE_STOCK INTEGER NOT NULL  ,
   MT_ENTREE DECIMAL(10,2) NOT NULL  ,
   MT_SORTIE DECIMAL(10,2) NOT NULL  ,
   MT_STOCK DECIMAL(10,2) NOT NULL  ,
   DESC_DET_INVENT VARCHAR(256) NULL  
   , PRIMARY KEY (ID_INVENT,ID_PA_UNIT_MESUR,ID_PROD) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_PROVINCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_PROVINCE
 (
   ID_PROV INTEGER NOT NULL AUTO_INCREMENT ,
   ID_REGION CHAR(32) NOT NULL  ,
   COD_PROV CHAR(4) NOT NULL  ,
   LIB_PROV VARCHAR(64) NOT NULL  ,
   CHF_LIE_PROV VARCHAR(64) NOT NULL  
   , PRIMARY KEY (ID_PROV) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SE_USERS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SE_USERS
 (
   USERNAME VARCHAR(45) NOT NULL  ,
   ID_PERS INTEGER NULL  ,
   PASSWORD VARCHAR(45) NOT NULL  ,
   ENABLED CHAR(1) NOT NULL  
   , PRIMARY KEY (USERNAME) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_REL_CONTENU_SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_REL_CONTENU_SALLE
 (
   ID_SALLE INTEGER NOT NULL  ,
   ID_PA_ELEM INTEGER NOT NULL  ,
   NB_ELEMENT SMALLINT NOT NULL  
   , PRIMARY KEY (ID_SALLE,ID_PA_ELEM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SE_REL_USERS_ROLES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SE_REL_USERS_ROLES
 (
   CODE_ROLE VARCHAR(10) NOT NULL  ,
   USERNAME VARCHAR(45) NOT NULL  
   , PRIMARY KEY (CODE_ROLE,USERNAME) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PA_ENTITE_RATA
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PA_ENTITE_RATA
 (
   ID_EGESTION INTEGER NOT NULL  ,
   ID_EGESTION_RATA INTEGER NOT NULL  ,
   DAT_DEB_VAL DATE NOT NULL  ,
   DAT_FIN_VAL DATE NULL  ,
   DESC_RATA VARCHAR(128) NULL  
   , PRIMARY KEY (ID_EGESTION,ID_EGESTION_RATA) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SE_REL_ROLES_FONCTIONNALITES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SE_REL_ROLES_FONCTIONNALITES
 (
   CODE_ROLE VARCHAR(10) NOT NULL  ,
   CODE_FONCTION VARCHAR(10) NOT NULL  
   , PRIMARY KEY (CODE_ROLE,CODE_FONCTION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ST_REL_MOUV_EXT_INT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ST_REL_MOUV_EXT_INT
 (
   ID_MOUV_EXT INT NOT NULL  ,
   ID_MOUV_INT INTEGER NOT NULL  ,
   ID_REC INTEGER NOT NULL  ,
   DAT_CREA DATETIME NOT NULL  
   , PRIMARY KEY (ID_REC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ST_REL_DET_CORRECT_INVENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ST_REL_DET_CORRECT_INVENT
 (
   ID_DET_MOUV INTEGER NOT NULL  ,
   ID_INVENT INTEGER NOT NULL  ,
   ID_PA_UNIT_MESUR INTEGER NOT NULL  ,
   ID_PROD INTEGER NOT NULL  ,
   ID_PERS INTEGER NULL  ,
   QTE_DET_CORRECT DEC(10,2) NOT NULL  ,
   DAT_CORRECT DATETIME NOT NULL  
   , PRIMARY KEY (ID_DET_MOUV) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PR_DET_PROD_PLAN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PR_DET_PROD_PLAN
 (
   ID_PLAN INTEGER NOT NULL  ,
   ID_PROD INTEGER NOT NULL  ,
   ID_PA_UNIT_MESUR INTEGER NOT NULL  ,
   ID_SALLE INTEGER NOT NULL  ,
   ID_PA_ETA_TRANSFORM INTEGER NOT NULL  ,
   QTE_UTIL_PROD_PREV INTEGER NOT NULL  ,
   QTE_UTIL_PROD_REEL INTEGER NULL  ,
   PU_UTIL_PROD_REEL DEC(10,2) NOT NULL  ,
   PU_UTIL_PROD_PREV DEC(10,2) NULL  
   , PRIMARY KEY (ID_PLAN,ID_PROD,ID_PA_UNIT_MESUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PR_DET_EQUIP_PROD
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PR_DET_EQUIP_PROD
 (
   ID_PA_ROLE_PRODUCT INTEGER NOT NULL  ,
   ID_PERS INTEGER NOT NULL  ,
   ID_PLAN INTEGER NOT NULL  
   , PRIMARY KEY (ID_PERS,ID_PLAN) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PR_PLANIFICATION_PROD
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PR_PLANIFICATION_PROD
 (
   ID_PLAN INTEGER NOT NULL AUTO_INCREMENT ,
   NUM_PLAN VARCHAR(56) NOT NULL  ,
   ID_SALLE_SRC INTEGER NULL  ,
   ID_SALLE_CIBL INTEGER NULL  ,
   CONSIGN_PLAN VARCHAR(256) NOT NULL  ,
   DESC_PLAN VARCHAR(256) NOT NULL  ,
   REF_PLAN_LOT VARCHAR(256) NOT NULL  ,
   DAT_PLAN DATETIME NOT NULL  ,
   DAT_DEB_FABR DATETIME NOT NULL  ,
   DAT_FIN_FABR DATETIME NOT NULL  ,
   ID_PA_STAUT_PLAN INTEGER NOT NULL  ,
   MT_FRAIS_PLAN DEC(12,2) NULL  ,
   MT_DEPENS_PLAN DEC(12,2) NULL  ,
   MT_REC_PREV_PLAN DEC(12,2) NULL  
   , PRIMARY KEY (ID_PLAN) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PR_PLANIFICATION_PROD
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_PU_NUM_PLAN_PR_PLANIFICATION_PA_PROD
     ON PR_PLANIFICATION_PROD (NUM_PLAN ASC);


# -----------------------------------------------------------------------------
#       TABLE : PR_REL_MOUV_INT_PLAN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PR_REL_MOUV_INT_PLAN
 (
   ID_MOUV_INT INTEGER NOT NULL  ,
   ID_PLAN INTEGER NOT NULL  
   , PRIMARY KEY (ID_MOUV_INT,ID_PLAN) 
 ) 
 comment = "";
# -----------------------------------------------------------------------------
#       TABLE : pe_adherent
# -----------------------------------------------------------------------------
CREATE TABLE pe_adherent (
ID_PERS int NOT NULL,
FLAG_ACTIF int(1) DEFAULT '0',
DAT_DERN_VISIT datetime DEFAULT NULL,
TAILLE decimal(5,2) DEFAULT '0.00',
POIDS decimal(5,2) DEFAULT '0.00',
DAT_CREA datetime NOT NULL,
DAT_UPD datetime NOT NULL,
  PRIMARY KEY (ID_PERS)
) ;
# -----------------------------------------------------------------------------
#       TABLE : sp_fiche_presence
# -----------------------------------------------------------------------------
CREATE TABLE sp_fiche_presence (
  ID_PERS_FICHE int NOT NULL,
  DATE_CAL date NOT NULL,
  ID_PA_STATU_PRES int NOT NULL,
  ID_PERS_USR int NOT NULL,
  DAT_HEUR_ARVE datetime NOT NULL,
  DAT_HEUR_DEPAR datetime NOT NULL,
  DAT_CREA datetime NOT NULL,
  DAT_UPD datetime NOT NULL,
  PRIMARY KEY (ID_PERS_FICHE,DAT_HEUR_ARVE)
);

# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------
CREATE  INDEX I_FK_SP_FICHE_PRESENCE_PA_CALENDRIER ON  SP_FICHE_PRESENCE(DATE_CAL);
CREATE  INDEX I_FK_SP_FICHE_PRESENCE_PE_EMPLOYE ON  SP_FICHE_PRESENCE (ID_PERS_USR);
CREATE  INDEX I_FK_SP_FICHE_PRESENCE_PA_PARAM_GLOB ON  SP_FICHE_PRESENCE (ID_PA_STATU_PRES);
 
ALTER TABLE   SP_FICHE_PRESENCE ADD FOREIGN KEY FK_SP_FICHE_PRESENCE_PA_CALENDRIER (DATE_CAL) REFERENCES PA_CALENDRIER (DATE_CAL);
ALTER TABLE   SP_FICHE_PRESENCE ADD FOREIGN KEY  FK_SP_FICHE_PRESENCE_PE_EMPLOYE (ID_PERS_USR) REFERENCES PE_EMPLOYE (ID_PERS);
ALTER TABLE   SP_FICHE_PRESENCE ADD FOREIGN KEY FK_SP_FICHE_PRESENCE_PA_PARAM_GLOB  (ID_PA_STATU_PRES) REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB);
ALTER TABLE   SP_FICHE_PRESENCE ADD FOREIGN KEY FK_SP_FICHE_PRESENCE_PE_ADHERENT  (ID_PERS_FICHE) REFERENCES PE_ADHERENT (ID_PERS);

ALTER TABLE  pe_adherent
   ADD FOREIGN KEY fk_pe_adherent_pe_personne(ID_PERS) REFERENCES pe_personne (ID_PERS);

ALTER TABLE PE_PERSONNE 
  ADD FOREIGN KEY FK_PE_PERSONNE_PA_PAYS (ID_PAYS_NAIS)
      REFERENCES PA_PAYS (ID_PAYS) ;


ALTER TABLE PE_PERSONNE 
  ADD FOREIGN KEY FK_PE_PERSONNE_PA_COMMUNE (ID_COM_NAIS)
      REFERENCES PA_COMMUNE (ID_COM) ;


ALTER TABLE PE_PERSONNE 
  ADD FOREIGN KEY FK_PE_PERSONNE_PA_PARAM_GLOB (ID_PA_TYP_PERS)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_PACK_PROD 
  ADD FOREIGN KEY FK_PA_PACK_PROD_PA_PRODUIT (ID_PROD)
      REFERENCES PA_PRODUIT (ID_PROD) ;


ALTER TABLE PA_PACK_PROD 
  ADD FOREIGN KEY FK_PA_PACK_PROD_PA_PARAM_GLOB (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_FACTURE 
  ADD FOREIGN KEY FK_CO_FACTURE_PA_PARAM_GLOB (ID_PA_STATU_FACTUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_FACTURE 
  ADD FOREIGN KEY FK_CO_FACTURE_CO_LIST_RECETTE (ID_REC)
      REFERENCES CO_LIST_RECETTE (ID_REC) ;


ALTER TABLE CO_FACTURE 
  ADD FOREIGN KEY FK_CO_FACTURE_CO_LIST_DEPENSE (ID_DEPENS)
      REFERENCES CO_LIST_DEPENSE (ID_DEPENS) ;


ALTER TABLE CO_REL_CAISSE_ACCESS_EMPLOYE 
  ADD FOREIGN KEY FK_CO_REL_CAISSE_ACCESS_EMPLOYE_CO_CAISSE (ID_CAISSE)
      REFERENCES CO_CAISSE (ID_CAISSE) ;


ALTER TABLE CO_REL_CAISSE_ACCESS_EMPLOYE 
  ADD FOREIGN KEY FK_CO_REL_CAISSE_ACCESS_EMPLOYE_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;

ALTER TABLE CO_REL_CAISSE_ACCESS_EMPLOYE ADD FOREIGN KEY  FK_SE_USERNAME_UPD_CO_REL_CAISSE_ACCESS_EMPLOYE (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
 ALTER TABLE CO_REL_CAISSE_ACCESS_EMPLOYE ADD FOREIGN KEY  FK_SE_USERNAME_CREA_CO_REL_CAISSE_ACCESS_EMPLOYE (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);

ALTER TABLE CO_COMISSION 
  ADD FOREIGN KEY FK_CO_COMISSION_CO_LIST_RECETTE (ID_REC)
      REFERENCES CO_LIST_RECETTE (ID_REC) ;


ALTER TABLE CO_COMISSION 
  ADD FOREIGN KEY FK_CO_COMISSION_CO_LIST_DEPENSE (ID_DEPENS)
      REFERENCES CO_LIST_DEPENSE (ID_DEPENS) ;


ALTER TABLE CO_COMISSION 
  ADD FOREIGN KEY FK_CO_COMISSION_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;
	  
ALTER TABLE CO_COMISSION ADD FOREIGN KEY  FK_SE_USERNAME_UPD_CO_COMISSION (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
 ALTER TABLE CO_COMISSION ADD FOREIGN KEY  FK_SE_USERNAME_CREA_CO_COMISSION (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);


ALTER TABLE PA_REGION 
  ADD FOREIGN KEY FK_PA_REGION_PA_PAYS (ID_PAYS)
      REFERENCES PA_PAYS (ID_PAYS) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_CO_SERVICE (ID_SERVICE)
      REFERENCES CO_SERVICE (ID_SERVICE) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_PA_PARAM_GLOB (ID_PA_TRCH_AGE_CLI)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_PA_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES PA_ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_PE_EMPLOYE (ID_PERS_CAISSSE)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_PA_PARAM_GLOB2 (ID_PA_STATU_CMNDE)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_CO_LIST_RECETTE (ID_REC)
      REFERENCES CO_LIST_RECETTE (ID_REC) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_PE_PERSONNE (ID_PERS_CLIEN)
      REFERENCES PE_PERSONNE (ID_PERS) ;


ALTER TABLE CO_COMMANDE 
  ADD FOREIGN KEY FK_CO_COMMANDE_PE_EMPLOYE1 (ID_PERS_DISTRIB)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PA_TABLE 
  ADD FOREIGN KEY FK_PA_TABLE_PA_SALLE (ID_SALLE)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE ST_MOUV_INTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_INTERNE_PA_PARAM_GLOB (ID_PA_TYP_MOUV)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE ST_MOUV_INTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_INTERNE_PA_SALLE (ID_SALLE_SRC)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE ST_MOUV_INTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_INTERNE_PE_EMPLOYE (ID_PERS_SRC)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE ST_MOUV_INTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_INTERNE_PE_EMPLOYE2 (ID_PERS_CIBL)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE ST_MOUV_INTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_INTERNE_PA_SALLE1 (ID_SALLE_CIBL)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE ST_MOUV_INTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_INTERNE_ST_MOUV_INTERNE (ID_MOUV_INT_RETRN)
      REFERENCES ST_MOUV_INTERNE (ID_MOUV_INT) ;


ALTER TABLE CO_DETAIL_COMNDE 
  ADD FOREIGN KEY FK_CO_DETAIL_COMNDE_CO_COMMANDE (ID_REC)
      REFERENCES CO_COMMANDE (ID_REC) ;


ALTER TABLE CO_DETAIL_COMNDE 
  ADD FOREIGN KEY FK_CO_DETAIL_COMNDE_PA_PRODUIT (ID_PROD)
      REFERENCES PA_PRODUIT (ID_PROD) ;


ALTER TABLE CO_DETAIL_COMNDE 
  ADD FOREIGN KEY FK_CO_DETAIL_COMNDE_PA_PLAT (ID_PLAT)
      REFERENCES PA_PLAT (ID_PLAT) ;


ALTER TABLE CO_LIST_DEPENSE 
  ADD FOREIGN KEY FK_CO_LIST_DEPENSE_PA_PARAM_GLOB (ID_PA_STATU_COMPTA)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_LIST_DEPENSE 
  ADD FOREIGN KEY FK_CO_LIST_DEPENSE_PA_PARAM_GLOB1 (ID_PA_STATU_LIVRAIS)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_PLAT 
  ADD FOREIGN KEY FK_PA_PLAT_PA_PARAM_GLOB (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_PLAT 
  ADD FOREIGN KEY FK_PA_PLAT_PA_MENU (ID_MENU)
      REFERENCES PA_MENU (ID_MENU) ;


ALTER TABLE SE_HISTO_CONXION_APPL 
  ADD FOREIGN KEY FK_SE_HISTO_CONXION_APPL_SE_USERS (USERNAME)
      REFERENCES SE_USERS (USERNAME) ;


ALTER TABLE CO_SERVICE 
  ADD FOREIGN KEY FK_CO_SERVICE_PA_TABLE (ID_TABLE)
      REFERENCES PA_TABLE (ID_TABLE) ;


ALTER TABLE CO_SERVICE 
  ADD FOREIGN KEY FK_CO_SERVICE_PE_EMPLOYE (ID_PERS_SERV)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE CO_SERVICE 
  ADD FOREIGN KEY FK_CO_SERVICE_PA_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES PA_ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE SE_FONCTIONNALITES 
  ADD FOREIGN KEY FK_SE_FONCTIONNALITES_SE_FONCTIONNALITES (CODE_FONCTION_HIERA)
      REFERENCES SE_FONCTIONNALITES (CODE_FONCTION) ;


ALTER TABLE CO_LIST_RECETTE 
  ADD FOREIGN KEY FK_CO_LIST_RECETTE_PA_PARAM_GLOB (ID_PA_STATU_COMPTA)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_LIST_RECETTE 
  ADD FOREIGN KEY FK_CO_LIST_RECETTE_PA_PARAM_GLOB1 (ID_PA_STATU_LIVRAIS)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_COMMUNE 
  ADD FOREIGN KEY FK_PA_COMMUNE_PA_PROVINCE (ID_PROV)
      REFERENCES PA_PROVINCE (ID_PROV) ;


ALTER TABLE PA_COMMUNE 
  ADD FOREIGN KEY FK_PA_COMMUNE_PA_PAYS (ID_PAYS)
      REFERENCES PA_PAYS (ID_PAYS) ;


ALTER TABLE CO_PAI_SALAIRE 
  ADD FOREIGN KEY FK_CO_PAI_SALAIRE_PA_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES PA_ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE CO_PAI_SALAIRE 
  ADD FOREIGN KEY FK_CO_PAI_SALAIRE_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE CO_PAI_SALAIRE 
  ADD FOREIGN KEY FK_CO_PAI_SALAIRE_CO_LIST_DEPENSE (ID_DEPENS)
      REFERENCES CO_LIST_DEPENSE (ID_DEPENS) ;


ALTER TABLE PE_FOURNISSEUR 
  ADD FOREIGN KEY FK_PE_FOURNISSEUR_PE_PERSONNE (ID_PERS)
      REFERENCES PE_PERSONNE (ID_PERS) ;


ALTER TABLE ST_MOUV_EXTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_EXTERNE_PE_EMPLOYE (ID_PERS_EMP_MOUV)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE ST_MOUV_EXTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_EXTERNE_PA_PARAM_GLOB (ID_PA_STATU)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE ST_MOUV_EXTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_EXTERNE_PA_SALLE (ID_SALLE)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE ST_MOUV_EXTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_EXTERNE_CO_COMMANDE_FRS (ID_DEPENS)
      REFERENCES CO_COMMANDE_FRS (ID_DEPENS) ;


ALTER TABLE ST_MOUV_EXTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_EXTERNE_PA_PARAM_GLOB1 (ID_PA_TYP_MOUV)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE ST_MOUV_EXTERNE 
  ADD FOREIGN KEY FK_ST_MOUV_EXTERNE_CO_COMMANDE (ID_REC)
      REFERENCES CO_COMMANDE (ID_REC) ;


ALTER TABLE CO_TRANSAC_CAISSE_DEPENSE 
  ADD FOREIGN KEY FK_CO_TRANSAC_CAISSE_DEPENSE_CO_LIST_DEPENSE (ID_DEPENS)
      REFERENCES CO_LIST_DEPENSE (ID_DEPENS) ;


ALTER TABLE CO_TRANSAC_CAISSE_DEPENSE 
  ADD FOREIGN KEY FK_CO_TRANSAC_CAISSE_DEPENSE_CO_HISTO_CONXION_CAISSE (ID_CONXION_CAISSE)
      REFERENCES CO_HISTO_CONXION_CAISSE (ID_CONXION_CAISSE) ;


ALTER TABLE CO_TRANSAC_CAISSE_DEPENSE 
  ADD FOREIGN KEY FK_CO_TRANSAC_CAISSE_DEPENSE_PA_PARAM_GLOB (ID_PA_MOY_PAIMEN)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_COMMANDE_FRS 
  ADD FOREIGN KEY FK_CO_COMMANDE_FRS_PE_FOURNISSEUR (ID_PERS_FRS)
      REFERENCES PE_FOURNISSEUR (ID_PERS) ;


ALTER TABLE CO_COMMANDE_FRS 
  ADD FOREIGN KEY FK_CO_COMMANDE_FRS_PA_PARAM_GLOB (ID_PA_STATU_CMNDE)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_COMMANDE_FRS 
  ADD FOREIGN KEY FK_CO_COMMANDE_FRS_PA_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES PA_ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE CO_COMMANDE_FRS 
  ADD FOREIGN KEY FK_CO_COMMANDE_FRS_PE_EMPLOYE (ID_PERS_EMPL)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE CO_COMMANDE_FRS 
  ADD FOREIGN KEY FK_CO_COMMANDE_FRS_CO_LIST_DEPENSE (ID_DEPENS)
      REFERENCES CO_LIST_DEPENSE (ID_DEPENS) ;


ALTER TABLE CO_CAISSE 
  ADD FOREIGN KEY FK_CO_CAISSE_PA_PARAM_GLOB (ID_PA_TYPE_CAISSE)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_TRANSFERT_FOND 
  ADD FOREIGN KEY FK_CO_TRANSFERT_FOND_CO_TRANSAC_CAISSE_DEPENSE (ID_DEPENS,NUM_DEP)
      REFERENCES CO_TRANSAC_CAISSE_DEPENSE (ID_DEPENS,NUM_DEP) ;


ALTER TABLE CO_TRANSFERT_FOND 
  ADD FOREIGN KEY FK_CO_TRANSFERT_FOND_PE_EMPLOYE (ID_PERS_USR_1)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE CO_TRANSFERT_FOND 
  ADD FOREIGN KEY FK_CO_TRANSFERT_FOND_CO_TRANSAC_CAISSE_RECETTE (ID_REC,NUM_PAIEMENT)
      REFERENCES CO_TRANSAC_CAISSE_RECETTE (ID_REC,NUM_PAIEMENT) ;


ALTER TABLE CO_TRANSFERT_FOND 
  ADD FOREIGN KEY FK_CO_TRANSFERT_FOND_PE_EMPLOYE2 (ID_PERS_USR_2)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PA_ENTITE_GESTION 
  ADD FOREIGN KEY FK_PA_ENTITE_GESTION_PA_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES PA_ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE PA_PRODUIT 
  ADD FOREIGN KEY FK_PA_PRODUIT_PA_CATEG_PROD (ID_CATEG_PROD)
      REFERENCES PA_CATEG_PROD (ID_CATEG_PROD) ;


ALTER TABLE PA_PRODUIT 
  ADD FOREIGN KEY FK_PA_PRODUIT_PA_PARAM_GLOB (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_PRODUIT 
  ADD FOREIGN KEY FK_PA_PRODUIT_PA_PARAM_UNIT2 (ID_PA_UNITE2)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_PRODUIT 
  ADD FOREIGN KEY FK_PA_PRODUIT_PA_PARAM_GLOB1 (ID_PA_ETA_TRANSFORM)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_TRANSAC_CAISSE_RECETTE 
  ADD FOREIGN KEY FK_CO_TRANSAC_CAISSE_RECETTE_PA_PARAM_GLOB (ID_PA_MOY_PAIMEN)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_TRANSAC_CAISSE_RECETTE 
  ADD FOREIGN KEY FK_CO_TRANSAC_CAISSE_RECETTE_CO_LIST_RECETTE (ID_REC)
      REFERENCES CO_LIST_RECETTE (ID_REC) ;


ALTER TABLE CO_TRANSAC_CAISSE_RECETTE 
  ADD FOREIGN KEY FK_CO_TRANSAC_CAISSE_RECETTE_CO_HISTO_CONXION_CAISSE (ID_CONXION_CAISSE)
      REFERENCES CO_HISTO_CONXION_CAISSE (ID_CONXION_CAISSE) ;


ALTER TABLE PE_FICHE_PRESENCE 
  ADD FOREIGN KEY FK_PE_FICHE_PRESENCE_PA_CALENDRIER (DATE_CAL)
      REFERENCES PA_CALENDRIER (DATE_CAL) ;


ALTER TABLE PE_FICHE_PRESENCE 
  ADD FOREIGN KEY FK_PE_FICHE_PRESENCE_PE_EMPLOYE (ID_PERS_USR)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PE_FICHE_PRESENCE 
  ADD FOREIGN KEY FK_PE_FICHE_PRESENCE_PA_PARAM_GLOB (ID_PA_STATU_PRES)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PE_FICHE_PRESENCE 
  ADD FOREIGN KEY FK_PE_FICHE_PRESENCE_PE_EMPLOYE2 (ID_PERS_FICHE)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PA_ENTREPRISE 
  ADD FOREIGN KEY FK_PA_ENTREPRISE_PA_PAYS (ID_PAYS)
      REFERENCES PA_PAYS (ID_PAYS) ;


ALTER TABLE PA_ENTREPRISE 
  ADD FOREIGN KEY FK_PA_ENTREPRISE_PA_PROVINCE (ID_PROV)
      REFERENCES PA_PROVINCE (ID_PROV) ;


ALTER TABLE PA_ENTREPRISE 
  ADD FOREIGN KEY FK_PA_ENTREPRISE_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PA_ENTREPRISE 
  ADD FOREIGN KEY FK_PA_ENTREPRISE_PA_REGION (ID_REGION)
      REFERENCES PA_REGION (ID_REGION) ;


ALTER TABLE PA_ENTREPRISE 
  ADD FOREIGN KEY FK_PA_ENTREPRISE_PA_COMMUNE (ID_COM)
      REFERENCES PA_COMMUNE (ID_COM) ;


ALTER TABLE CO_HISTO_CONXION_CAISSE 
  ADD FOREIGN KEY FK_CO_HISTO_CONXION_CAISSE_CO_CAISSE (ID_CAISSE)
      REFERENCES CO_CAISSE (ID_CAISSE) ;


ALTER TABLE CO_HISTO_CONXION_CAISSE 
  ADD FOREIGN KEY FK_CO_HISTO_CONXION_CAISSE_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE ST_INVENTAIRE 
  ADD FOREIGN KEY FK_ST_INVENTAIRE_PE_EMPLOYE (ID_PERS_EMP_IVENT)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE ST_INVENTAIRE 
  ADD FOREIGN KEY FK_ST_INVENTAIRE_PA_PARAM_GLOB (ID_PA_TYP_INVENT)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE ST_INVENTAIRE 
  ADD FOREIGN KEY FK_ST_INVENTAIRE_PA_SALLE (ID_SALLE)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE CO_RECU 
  ADD FOREIGN KEY FK_CO_RECU_PA_PARAM_GLOB (ID_PA_STATU_REC)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE CO_RECU 
  ADD FOREIGN KEY FK_CO_RECU_CO_TRANSAC_CAISSE_DEPENSE (ID_DEPENS,NUM_DEP)
      REFERENCES CO_TRANSAC_CAISSE_DEPENSE (ID_DEPENS,NUM_DEP) ;


ALTER TABLE CO_RECU 
  ADD FOREIGN KEY FK_CO_RECU_CO_TRANSAC_CAISSE_RECETTE (ID_REC,NUM_PAIEMENT)
      REFERENCES CO_TRANSAC_CAISSE_RECETTE (ID_REC,NUM_PAIEMENT) ;


ALTER TABLE ST_DET_MOUV 
  ADD FOREIGN KEY FK_ST_DET_MOUV_ST_MOUV_INTERNE (ID_MOUV_INT)
      REFERENCES ST_MOUV_INTERNE (ID_MOUV_INT) ;


ALTER TABLE ST_DET_MOUV 
  ADD FOREIGN KEY FK_ST_DET_MOUV_ST_MOUV_EXTERNE (ID_MOUV_EXT)
      REFERENCES ST_MOUV_EXTERNE (ID_MOUV_EXT) ;


ALTER TABLE ST_DET_MOUV 
  ADD FOREIGN KEY FK_ST_DET_MOUV_PA_PARAM_GLOB (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE ST_DET_MOUV 
  ADD FOREIGN KEY FK_ST_DET_MOUV_PA_PRODUIT (ID_PROD)
      REFERENCES PA_PRODUIT (ID_PROD) ;


ALTER TABLE ST_DET_MOUV 
  ADD FOREIGN KEY FK_ST_DET_MOUV_ST_INVENTAIRE (ID_INVENT)
      REFERENCES ST_INVENTAIRE (ID_INVENT) ;


ALTER TABLE CO_DETAIL_COMNDE_FRS 
  ADD FOREIGN KEY FK_CO_DETAIL_COMNDE_FRS_CO_COMMANDE_FRS (ID_DEPENS)
      REFERENCES CO_COMMANDE_FRS (ID_DEPENS) ;


ALTER TABLE CO_DETAIL_COMNDE_FRS 
  ADD FOREIGN KEY FK_CO_DETAIL_COMNDE_FRS_PA_PRODUIT (ID_PROD)
      REFERENCES PA_PRODUIT (ID_PROD) ;


ALTER TABLE PA_SALLE 
  ADD FOREIGN KEY FK_PA_SALLE_PA_PARAM_GLOB (ID_PA_BATIMENT)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_SALLE 
  ADD FOREIGN KEY FK_PA_SALLE_PA_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES PA_ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE PA_SALLE 
  ADD FOREIGN KEY FK_PA_SALLE_PA_PARAM_GLOB1 (ID_PA_TYP_SAL)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PA_SALLE 
  ADD FOREIGN KEY FK_PA_SALLE_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PA_CATEG_PROD 
  ADD FOREIGN KEY FK_PA_CATEG_PROD_PA_GAM_PROD (ID_GAM_PROD)
      REFERENCES PA_GAM_PROD (ID_GAM_PROD) ;


ALTER TABLE PA_GAM_PROD 
  ADD FOREIGN KEY FK_PA_GAM_PROD_PA_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES PA_ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE PE_EMPLOYE 
  ADD FOREIGN KEY FK_PE_EMPLOYE_PA_PARAM_GLOB (ID_PA_DIPLOME)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PE_EMPLOYE 
  ADD FOREIGN KEY FK_PE_EMPLOYE_PA_ENTITE_GESTION (ID_EGESTION)
      REFERENCES PA_ENTITE_GESTION (ID_EGESTION) ;


ALTER TABLE PE_EMPLOYE 
  ADD FOREIGN KEY FK_PE_EMPLOYE_PA_PARAM_GLOB2 (ID_PA_FONCTION)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PE_EMPLOYE 
  ADD FOREIGN KEY FK_PE_EMPLOYE_PE_PERSONNE (ID_PERS)
      REFERENCES PE_PERSONNE (ID_PERS) ;


ALTER TABLE PE_EMPLOYE 
  ADD FOREIGN KEY ID_PA_STATU (ID_PA_STATU)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE ST_DET_INVENTAIRE 
  ADD FOREIGN KEY FK_ST_DET_INVENTAIRE_PA_PRODUIT (ID_PROD)
      REFERENCES PA_PRODUIT (ID_PROD) ;


ALTER TABLE ST_DET_INVENTAIRE 
  ADD FOREIGN KEY FK_ST_DET_INVENTAIRE_PA_PARAM_GLOB (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE ST_DET_INVENTAIRE 
  ADD FOREIGN KEY FK_ST_DET_INVENTAIRE_ST_INVENTAIRE (ID_INVENT)
      REFERENCES ST_INVENTAIRE (ID_INVENT) ;


ALTER TABLE ST_DET_INVENTAIRE 
  ADD FOREIGN KEY FK_ST_DET_INVENTAIRE_PA_PRODUIT2 (ID_PROD)
      REFERENCES PA_PRODUIT (ID_PROD) ;


ALTER TABLE PA_PROVINCE 
  ADD FOREIGN KEY FK_PA_PROVINCE_PA_REGION (ID_REGION)
      REFERENCES PA_REGION (ID_REGION) ;


ALTER TABLE SE_USERS 
  ADD FOREIGN KEY FK_SE_USERS_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PA_REL_CONTENU_SALLE 
  ADD FOREIGN KEY FK_PA_REL_CONTENU_SALLE_PA_SALLE (ID_SALLE)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE PA_REL_CONTENU_SALLE 
  ADD FOREIGN KEY FK_PA_REL_CONTENU_SALLE_PA_PARAM_GLOB (ID_PA_ELEM)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE SE_REL_USERS_ROLES 
  ADD FOREIGN KEY FK_SE_REL_USERS_ROLES_SE_ROLES (CODE_ROLE)
      REFERENCES SE_ROLES (CODE_ROLE) ;


ALTER TABLE SE_REL_USERS_ROLES 
  ADD FOREIGN KEY FK_SE_REL_USERS_ROLES_SE_USERS (USERNAME)
      REFERENCES SE_USERS (USERNAME) ;


ALTER TABLE PA_ENTITE_RATA 
  ADD FOREIGN KEY FK_PA_ENTITE_RATA_PA_ENTITE_GESTION (ID_EGESTION)
      REFERENCES PA_ENTITE_GESTION (ID_EGESTION) ;


ALTER TABLE PA_ENTITE_RATA 
  ADD FOREIGN KEY FK_PA_ENTITE_RATA_PA_ENTITE_GESTION2 (ID_EGESTION_RATA)
      REFERENCES PA_ENTITE_GESTION (ID_EGESTION) ;


ALTER TABLE SE_REL_ROLES_FONCTIONNALITES 
  ADD FOREIGN KEY FK_SE_REL_ROLES_FONCTIONNALITES_SE_ROLES (CODE_ROLE)
      REFERENCES SE_ROLES (CODE_ROLE) ;


ALTER TABLE SE_REL_ROLES_FONCTIONNALITES 
  ADD FOREIGN KEY FK_SE_REL_ROLES_FONCTIONNALITES_SE_FONCTIONNALITES (CODE_FONCTION)
      REFERENCES SE_FONCTIONNALITES (CODE_FONCTION) ;


ALTER TABLE ST_REL_MOUV_EXT_INT 
  ADD FOREIGN KEY FK_ST_REL_MOUV_EXT_INT_ST_MOUV_EXTERNE (ID_MOUV_EXT)
      REFERENCES ST_MOUV_EXTERNE (ID_MOUV_EXT) ;


ALTER TABLE ST_REL_MOUV_EXT_INT 
  ADD FOREIGN KEY FK_ST_REL_MOUV_EXT_INT_ST_MOUV_INTERNE (ID_MOUV_INT)
      REFERENCES ST_MOUV_INTERNE (ID_MOUV_INT) ;


ALTER TABLE ST_REL_MOUV_EXT_INT 
  ADD FOREIGN KEY FK_ST_REL_MOUV_EXT_INT_CO_COMMANDE (ID_REC)
      REFERENCES CO_COMMANDE (ID_REC) ;


ALTER TABLE ST_REL_DET_CORRECT_INVENT 
  ADD FOREIGN KEY FK_ST_REL_DET_CORRECT_INVENT_ST_DET_MOUV (ID_DET_MOUV)
      REFERENCES ST_DET_MOUV (ID_DET_MOUV) ;


ALTER TABLE ST_REL_DET_CORRECT_INVENT 
  ADD FOREIGN KEY FK_ST_REL_DET_CORRECT_INVENT_ST_DET_INVENTAIRE (ID_INVENT,ID_PA_UNIT_MESUR,ID_PROD)
      REFERENCES ST_DET_INVENTAIRE (ID_INVENT,ID_PA_UNIT_MESUR,ID_PROD) ;


ALTER TABLE ST_REL_DET_CORRECT_INVENT 
  ADD FOREIGN KEY FK_ST_REL_DET_CORRECT_INVENT_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PR_DET_PROD_PLAN 
  ADD FOREIGN KEY FK_PR_DET_PROD_PLAN_PR_PLANIFICATION_PROD (ID_PLAN)
      REFERENCES PR_PLANIFICATION_PROD (ID_PLAN) ;


ALTER TABLE PR_DET_PROD_PLAN 
  ADD FOREIGN KEY FK_PR_DET_PROD_PLAN_PA_PRODUIT (ID_PROD)
      REFERENCES PA_PRODUIT (ID_PROD) ;


ALTER TABLE PR_DET_PROD_PLAN 
  ADD FOREIGN KEY FK_PR_DET_PROD_PLAN_PA_PARAM_GLOB (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PR_DET_PROD_PLAN 
  ADD FOREIGN KEY FK_PR_DET_PROD_PLAN_PA_PARAM_GLOB3 (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PR_DET_PROD_PLAN 
  ADD FOREIGN KEY FK_PR_DET_PROD_PLAN_PA_PARAM_GLOB4 (ID_PA_UNIT_MESUR)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PR_DET_PROD_PLAN 
  ADD FOREIGN KEY FK_PR_DET_PROD_PLAN_PA_PARAM_GLOB1 (ID_PA_ETA_TRANSFORM)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PR_DET_PROD_PLAN 
  ADD FOREIGN KEY FK_PR_DET_PROD_PLAN_PA_SALLE (ID_SALLE)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE PR_DET_EQUIP_PROD 
  ADD FOREIGN KEY FK_PR_DET_EQUIP_PROD_PA_PARAM_GLOB (ID_PA_ROLE_PRODUCT)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PR_DET_EQUIP_PROD 
  ADD FOREIGN KEY FK_PR_DET_EQUIP_PROD_PE_EMPLOYE (ID_PERS)
      REFERENCES PE_EMPLOYE (ID_PERS) ;


ALTER TABLE PR_DET_EQUIP_PROD 
  ADD FOREIGN KEY FK_PR_DET_EQUIP_PROD_PR_PLANIFICATION_PROD (ID_PLAN)
      REFERENCES PR_PLANIFICATION_PROD (ID_PLAN) ;


ALTER TABLE PR_PLANIFICATION_PROD 
  ADD FOREIGN KEY FK_PR_PLANIFICATION_PROD_PA_PARAM_GLOB (ID_PA_STAUT_PLAN)
      REFERENCES PA_PARAM_GLOB (ID_PARAM_GLOB) ;


ALTER TABLE PR_PLANIFICATION_PROD 
  ADD FOREIGN KEY FK_PR_PLANIFICATION_PROD_PA_SALLE (ID_SALLE_SRC)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE PR_PLANIFICATION_PROD 
  ADD FOREIGN KEY FK_PR_PLANIFICATION_PROD_PA_SALLE1 (ID_SALLE_CIBL)
      REFERENCES PA_SALLE (ID_SALLE) ;


ALTER TABLE PR_REL_MOUV_INT_PLAN 
  ADD FOREIGN KEY FK_PR_REL_MOUV_INT_PLAN_ST_MOUV_INTERNE (ID_MOUV_INT)
      REFERENCES ST_MOUV_INTERNE (ID_MOUV_INT) ;


ALTER TABLE PR_REL_MOUV_INT_PLAN 
  ADD FOREIGN KEY FK_PR_REL_MOUV_INT_PLAN_PR_PLANIFICATION_PROD (ID_PLAN)
      REFERENCES PR_PLANIFICATION_PROD (ID_PLAN) ;

ALTER TABLE PA_COMPTE 
  ADD FOREIGN KEY FK_PA_CLASSE_PA_COMPTE (ID_CLASSE)
      REFERENCES PA_CLASSE (ID_CLASSE) ;
	  
ALTER TABLE PA_SOUS_COMPTE 
  ADD FOREIGN KEY FK_PA_SOU_COMPTE_PA_COMPTE (ID_COMPTE)
      REFERENCES PA_COMPTE (ID_COMPTE) ;

 ALTER TABLE PA_CLASSE ADD FOREIGN KEY  FK_SE_USERNAME_CREA_PA_CLASSE_COMTA (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
 ALTER TABLE PA_COMPTE ADD FOREIGN KEY  FK_SE_USERNAME_CREA_PA_COMPTE (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
 ALTER TABLE PA_SOUS_COMPTE ADD FOREIGN KEY  FK_SE_USERNAME_CREA_PA_SOU_COMPTE (USERNAME_CREA) REFERENCES SE_USERS (USERNAME);
 
  ALTER TABLE PA_CLASSE ADD FOREIGN KEY  FK_SE_USERNAME_UPD_PA_CLASSE_COMTA (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
 ALTER TABLE PA_COMPTE ADD FOREIGN KEY  FK_SE_USERNAME_UPD_PA_COMPTE (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
 ALTER TABLE PA_SOUS_COMPTE ADD FOREIGN KEY  FK_SE_USERNAME_UPD_PA_SOU_COMPTE (USERNAME_UPD) REFERENCES SE_USERS (USERNAME);
 

ALTER TABLE CO_AUTR_DEPENSE 
  ADD FOREIGN KEY FK_CO_AUTR_DEPENSE_PA_COMPTE (ID_COMPTE)
      REFERENCES PA_COMPTE (ID_COMPTE) ;
	  
ALTER TABLE CO_AUTR_DEPENSE 
  ADD FOREIGN KEY FK_CO_AUTR_DEPENSE_PA_SOU_COMPTE (ID_SOU_COMPTE)
      REFERENCES PA_SOUS_COMPTE (ID_SOU_COMPTE) ;

ALTER TABLE CO_AUTR_DEPENSE 
  ADD FOREIGN KEY FK_CO_AUTR_DEPENSE_CO_LIST_DEPENSE (ID_DEPENS)
      REFERENCES CO_LIST_DEPENSE (ID_DEPENS) ;
	  
ALTER TABLE CO_AUTR_DEPENSE 
  ADD FOREIGN KEY FK_CO_AUTR_DEPENSE_PE_EMPLOYE_CREA (ID_PERS_CREA)
      REFERENCES PE_EMPLOYE (ID_PERS) ;
	
ALTER TABLE CO_AUTR_DEPENSE 
  ADD FOREIGN KEY FK_CO_AUTR_DEPENSE_PE_EMPLOYE_UPD (ID_PERS_UPD)
      REFERENCES PE_EMPLOYE (ID_PERS) ;
	  
ALTER TABLE CO_AUTR_DEPENSE 
  ADD FOREIGN KEY FK_CO_AUTR_DEPENSE_PE_EMPLOYE_EMPL (ID_PERS_EMPL)
      REFERENCES PE_EMPLOYE (ID_PERS) ;

ALTER TABLE CO_AUTR_DEPENSE 
  ADD FOREIGN KEY FK_CO_AUTR_DEPENSE_FRS_PE_FOURNISSEUR (ID_PERS_FRS)
      REFERENCES PE_FOURNISSEUR (ID_PERS) ;

ALTER TABLE CO_AUTR_RECETTE 
  ADD FOREIGN KEY FK_CO_AUTR_RECETTE_PA_COMPTE (ID_COMPTE)
      REFERENCES PA_COMPTE (ID_COMPTE) ;
	  
ALTER TABLE CO_AUTR_RECETTE 
  ADD FOREIGN KEY FK_CO_AUTR_RECETTE_PA_SOU_COMPTE (ID_SOU_COMPTE)
      REFERENCES PA_SOUS_COMPTE (ID_SOU_COMPTE) ;

ALTER TABLE CO_AUTR_RECETTE 
  ADD FOREIGN KEY FK_CO_AUTR_RECETTE_CO_LIST_RECETTE (ID_REC)
      REFERENCES CO_LIST_RECETTE (ID_REC) ;
	  
ALTER TABLE CO_AUTR_RECETTE 
  ADD FOREIGN KEY FK_CO_AUTR_RECETTE_PE_EMPLOYE_CREA (ID_PERS_CREA)
      REFERENCES PE_EMPLOYE (ID_PERS) ;
	
ALTER TABLE CO_AUTR_RECETTE 
  ADD FOREIGN KEY FK_CO_AUTR_RECETTE_PE_EMPLOYE_UPD (ID_PERS_UPD)
      REFERENCES PE_EMPLOYE (ID_PERS) ;
	  
ALTER TABLE CO_AUTR_RECETTE 
  ADD FOREIGN KEY FK_CO_AUTR_RECETTE_PE_EMPLOYE_EMPL (ID_PERS_EMPL)
      REFERENCES PE_EMPLOYE (ID_PERS) ;
	  
ALTER TABLE CO_AUTR_RECETTE 
  ADD FOREIGN KEY FK_CO_AUTR_RECETTE_PE_PERSONNE (ID_PERS_CLIEN)
      REFERENCES PE_PERSONNE (ID_PERS) ;


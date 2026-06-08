*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${REQUETE_SQL}
...    SELECT e.ID_ELEVE, e.NUM_MATRI_ELV, e.NOM_ELV, e.PRENOM_ELV, e.SEX_ELV,
...    e.DAT_NAIS_ELV, e.LIEU_NAIS_ELV, e.TEL_ELV, e.NUM_TEL_PAREN_ELV,
...    e.APT_SPOR_ELV, e.LN_IMG_ELV, e.ANNEE_NAIS_EN, e.NUM_PV,
...    e.NM_PERE_ELV, e.PRNM_PERE_ELV,
...    pp_prof.LIB_CRT_PARAM_GLOB      AS PROFESSION_PERE,
...    pp_reli_pere.LIB_CRT_PARAM_GLOB AS RELIGION_PERE,
...    e.NM_MERE_ELV, e.PRNM_MERE_ELV,
...    pm_prof.LIB_CRT_PARAM_GLOB      AS PROFESSION_MERE,
...    pm_reli_mere.LIB_CRT_PARAM_GLOB AS RELIGION_MERE,
...    ss.LIB_CRT_PARAM_GLOB           AS SITUATION_SOCIALE,
...    pays_nais.NOM_FR_PAYS           AS PAYS_NAISSANCE,
...    com_nais.LIB_COM                AS COMMUNE_NAISSANCE,
...    pays_nat.NOM_FR_PAYS            AS NATIONALITE,
...    i.ID_INSCRIPTION,
...    i.DAT_CREAT                     AS DATE_INSCRIPTION,
...    i.MT_SCO_INSCRIP,
...    i.EST_BOURS_INSCRIP,
...    i.FL_PAY_SCOL,
...    i.MOY_GENRAL,
...    i.RANG_GNRAL,
...    i.FL_DEL                        AS STATUT_INSCRIPTION,
...    ans.LIB_SCOLAIR                 AS ANNEE_SCOLAIRE,
...    ans.AN_SCOLAIRE,
...    ans.FL_AN_ACTF                  AS ANNEE_ACTIVE,
...    cl.COD_CLASSE, cl.LIB_CLASSE,
...    niv.COD_NIV_ETU,
...    niv.LIB_CRT_NIV_ETU             AS NIVEAU_ETUDE,
...    typ_elv.LIB_CRT_PARAM_GLOB      AS TYPE_ELEVE,
...    rslt.LIB_CRT_PARAM_GLOB         AS RESULTAT_SCOLAIRE
...    FROM EL_ELEVE e
...    LEFT JOIN EL_INSCRIPTION i
...        ON i.ID_ELEVE = e.ID_ELEVE AND i.FL_DEL = 'N'
...    LEFT JOIN PA_ANNEE_SCOLAIRE ans
...        ON ans.ID_AN_SCOLAIRE = i.ID_AN_SCOLAIRE
...    LEFT JOIN PA_CLASSE cl
...        ON cl.ID_CLASSE = i.ID_CLASSE
...    LEFT JOIN PA_NIV_ETUDE niv
...        ON niv.ID_NIV_ETU = cl.ID_NIV_ETU
...    LEFT JOIN PA_PARAM_GLOB typ_elv
...        ON typ_elv.ID_PARAM_GLOB = i.ID_PA_TYP_ELV
...    LEFT JOIN PA_PARAM_GLOB rslt
...        ON rslt.ID_PARAM_GLOB = i.ID_PA_RSLT_SCOL
...    LEFT JOIN PA_PAYS pays_nais
...        ON pays_nais.ID_PAYS = e.ID_PAYS_NAIS_ELV
...    LEFT JOIN PA_COMMUNE com_nais
...        ON com_nais.ID_COM = e.ID_COM_NAIS_ELV
...    LEFT JOIN PA_PAYS pays_nat
...        ON pays_nat.ID_PAYS = e.ID_PAYS_NATIONNALITE_ELV
...    LEFT JOIN PA_PARAM_GLOB pp_prof
...        ON pp_prof.ID_PARAM_GLOB = e.ID_PA_PROFES_PERE_ELV
...    LEFT JOIN PA_PARAM_GLOB pm_prof
...        ON pm_prof.ID_PARAM_GLOB = e.ID_PA_PROFES_MERE_ELV
...    LEFT JOIN PA_PARAM_GLOB pp_reli_pere
...        ON pp_reli_pere.ID_PARAM_GLOB = e.ID_PA_RELIGION_PERE_ELV
...    LEFT JOIN PA_PARAM_GLOB pm_reli_mere
...        ON pm_reli_mere.ID_PARAM_GLOB = e.ID_PA_RELIGION_MERE_ELV
...    LEFT JOIN PA_PARAM_GLOB ss
...        ON ss.ID_PARAM_GLOB = e.ID_PA_SITUA_SOCIAL_ELV
...    WHERE e.NOM_ELV = 'BAGA'
...    AND e.PRENOM_ELV = 'Hama'
...    AND e.NUM_TEL_PAREN_ELV = '64541270'
...    ORDER BY ans.FL_AN_ACTF DESC, ans.AN_SCOLAIRE DESC,
...    e.NOM_ELV ASC, e.PRENOM_ELV ASC


*** Test Cases ***
Validation des keywords de connexion bd
    connexion bd
    execution requete    ${REQUETE_SQL}    
    deconnexion bd
    

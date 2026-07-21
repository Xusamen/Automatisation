*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyennePeriodeSemestre${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyennePeriodeSemestre${/}resultat_attendu.json
${REQUETE}    
...            SELECT
...                 el.NOM_ELV,
...                 el.PRENOM_ELV,
...                 pp.LIB_CRT_PARAM_GLOB         AS LIBELLE_PERIODE,
...                 SUM(mm.POINT_PONDERE_MOY)     AS TOTAL_POIN_PONDERE,
...                 mp.RETRAIT_POIN_ABS,
...                 mp.RETRAIT_POIN_INCIDEN,
...                 mp.RETRAIT_POIN_AUTR,
...                 ROUND(SUM(mm.POINT_PONDERE_MOY) / SUM(mm.COEF_MOY_MATIERE), 2) AS MOY_PRIOD,
...                 SUM(mm.COEF_MOY_MATIERE)      AS COEF_PRIOD
...            FROM EV_MOYENNE_MATIERE mm
...            INNER JOIN EV_MOYENNE_PERIODE mp
...                 ON  mp.ID_INSCRIPTION = mm.ID_INSCRIPTION
...                 AND mp.ID_PA_PERIODE  = mm.ID_PA_PERIODE
...            INNER JOIN EL_INSCRIPTION i
...                 ON i.ID_INSCRIPTION = mm.ID_INSCRIPTION
...            INNER JOIN EL_ELEVE el
...                 ON el.ID_ELEVE = i.ID_ELEVE
...            INNER JOIN PA_CLASSE cl
...                 ON cl.ID_CLASSE = i.ID_CLASSE
...            INNER JOIN PA_PARAM_GLOB pp
...                 ON pp.ID_PARAM_GLOB = mm.ID_PA_PERIODE
...            WHERE
...                 cl.COD_CLASSE = '200C1'
...            GROUP BY
...                 el.NOM_ELV,
...                 el.PRENOM_ELV,
...                 cl.LIB_CLASSE,
...                 pp.LIB_CRT_PARAM_GLOB,
...                 mp.RETRAIT_POIN_ABS,
...                 mp.RETRAIT_POIN_INCIDEN,
...                 mp.RETRAIT_POIN_AUTR
...            ORDER BY
...                 el.NOM_ELV ASC,
...                 el.PRENOM_ELV ASC,
...                 pp.LIB_CRT_PARAM_GLOB ASC;

*** Test Cases ***
Calcul de moyenne periode
    [Documentation]    Automatisation cas de test calcul de moyenne periode Periode semestrielle
    lance pgetab
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluation	bouton_evaluations
    selectionne le sous module    Calcul_de_moyenne    bouton_calcul_de_moyenne
    selectionne le sous sous module    Moyenne_periode    bouton_moyenne_periode
    
    choisis option    option_semestre_1    choix_periode1
    choisis option    option_2ndC1    choix_classe
    clique    bouton_calculer_moyenne_periode_classe
    pause    1s
    appuyer sur entrer

    choisis option    option_semestre_2    choix_periode4
    clique    bouton_calculer_moyenne_periode_classe
    pause    1s
    appuyer sur entrer   

    arrete pgetab   
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}
 
*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyenneMatiereSemestre${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyenneMatiereSemestre${/}resultat_attendu.json
${REQUETE}    
...            SELECT
...                el.NOM_ELV,
...                el.PRENOM_ELV,
...                pp.LIB_CRT_PARAM_GLOB    AS LIBELLE_PERIODE,
...                pm.LIB_CRT_MATIER        AS LIBELLE_MATIERE,
...                mm.MOY_DEVOIR,
...                mm.MOY_COMPO,
...                mm.MOY_MATIERE,
...                mm.COEF_MOY_MATIERE,
...                mm.POINT_PONDERE_MOY,
...                mm.BAREME
...            FROM EV_MOYENNE_MATIERE mm
...            INNER JOIN EL_INSCRIPTION i
...                ON i.ID_INSCRIPTION = mm.ID_INSCRIPTION
...            INNER JOIN EL_ELEVE el
...                ON el.ID_ELEVE = i.ID_ELEVE
...            INNER JOIN PA_CLASSE cl
...                ON cl.ID_CLASSE = i.ID_CLASSE
...            INNER JOIN PA_MATIERE pm
...                ON pm.ID_MATIERE = mm.ID_MATIERE
...            INNER JOIN PA_PARAM_GLOB pp
...                ON pp.ID_PARAM_GLOB = mm.ID_PA_PERIODE
...            WHERE
...                cl.COD_CLASSE = '200C1'
...            ORDER BY
...                el.NOM_ELV ASC,
...                el.PRENOM_ELV ASC,
...                pp.LIB_CRT_PARAM_GLOB ASC,
...                pm.LIB_CRT_MATIER ASC;

*** Test Cases ***
Calcul de moyenne matiere
    [Documentation]    Automatisation Cas de Test Calcul de moyenne par matiere Periode semestrielle
    lance pgetab
    pause	10s
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluation	bouton_evaluations
    selectionne le sous module    Calcul_de_moyenne    bouton_calcul_de_moyenne
    charge image    Module_Evaluation/SM_Calcul_de_moyenne/SSM_Moyenne_matiere
    
    #calcul moyenne matiere semestre 1
    choisis option    option_semestre_1    choix_periode
    choisis option    option_2ndC1    choix_classe
    clique    bouton_calculer_moyenne_matiere_classe
    pause    1s
    appuyer sur entrer

    #calcul moyenne matiere semestre 2
    choisis option    option_semestre_2    choix_periode4
    clique    bouton_calculer_moyenne_matiere_classe
    pause    1s
    appuyer sur entrer
    
    arrete pgetab
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}
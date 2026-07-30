*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py
Resource         ../resources/utils-keywords.resource

Suite Setup     init env and start
Suite Teardown  stop and clean env

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyenneMatiere${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyenneMatiere${/}resultat_attendu.json
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
...                cl.COD_CLASSE = '600A0'
...            ORDER BY
...                el.NOM_ELV ASC,
...                el.PRENOM_ELV ASC,
...                pp.LIB_CRT_PARAM_GLOB ASC,
...                pm.LIB_CRT_MATIER ASC;

*** Test Cases ***
Calcul de moyenne matiere
    [Documentation]    Automatisation Cas de Test Calcul de moyenne par matiere
    lance pgetab
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluation	bouton_evaluations
    selectionne le sous module    Calcul_de_moyenne    bouton_calcul_de_moyenne
    charge image    Module_Evaluation/SM_Calcul_de_moyenne/SSM_Moyenne_matiere
    
    #calcul moyenne matiere trimestre 1
    choisis option    option_6iemeA    choix_classe
    clique    bouton_calculer_moyenne_matiere_classe
    pause    3s
    appuyer sur entrer

    #calcul moyenne matiere trimestre 2
    choisis option    option_trimestre2    choix_periode1
    clique    bouton_calculer_moyenne_matiere_classe
    pause    3s
    appuyer sur entrer
    
    #calcul moyenne matiere trimestre 3
    choisis option    option_trimestre3    choix_periode2
    clique    bouton_calculer_moyenne_matiere_classe
    pause    3s
    appuyer sur entrer
    arrete pgetab
    
    # verification
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}
*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py
Resource         ../resources/utils-keywords.resource

Suite Setup     init env and start
Suite Teardown  stop and clean env

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyenneGeneraleSemestre${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_CalculMoyenneGeneraleSemestre${/}resultat_attendu.json
${REQUETE}
...            SELECT
...                el.NOM_ELV,
...                el.PRENOM_ELV,
...                FLOOR(
...                    (SUM(mp.MOY_PRIOD * mp.COEF_PRIOD) / SUM(mp.COEF_PRIOD)) * 100
...                ) / 100 AS MOY_GENRAL,
...                i.MOY_GENRAL_AV_RACHA,
...                cl.LIB_CLASSE,
...                ans.LIB_SCOLAIR AS ANNEE_SCOLAIRE
...            FROM EV_MOYENNE_PERIODE mp
...            INNER JOIN EL_INSCRIPTION i
...                ON i.ID_INSCRIPTION = mp.ID_INSCRIPTION
...            INNER JOIN EL_ELEVE el
...                ON el.ID_ELEVE = i.ID_ELEVE
...            INNER JOIN PA_CLASSE cl
...                ON cl.ID_CLASSE = i.ID_CLASSE
...            INNER JOIN PA_ANNEE_SCOLAIRE ans
...                ON ans.ID_AN_SCOLAIRE = i.ID_AN_SCOLAIRE
...            WHERE
...                cl.COD_CLASSE = '200C1'
...            GROUP BY
...                el.NOM_ELV,
...                el.PRENOM_ELV,
...                i.ID_INSCRIPTION,
...                i.MOY_GENRAL_AV_RACHA,
...                cl.LIB_CLASSE,
...                ans.LIB_SCOLAIR
...            HAVING
...                SUM(mp.MOY_PRIOD * mp.COEF_PRIOD) / SUM(mp.COEF_PRIOD) IS NOT NULL
...            ORDER BY
...                MOY_GENRAL DESC,
...                el.NOM_ELV ASC,
...                el.PRENOM_ELV ASC;

*** Test Cases ***
Calcul de moyenne generale
    [Documentation]    Automatisation cas de test calcul de moyenne generale Periode semestrielle
    lance pgetab
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluation	bouton_evaluations
    selectionne le sous module    Calcul_de_moyenne    bouton_calcul_de_moyenne
    selectionne le sous sous module    Moyenne_generale    bouton_moyenne_generale
    choisis option    option_2ndC1    choix_classe
    clique    bouton_valider_classe
    pause    3s
    appuyer sur entrer
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}
    arrete pgetab
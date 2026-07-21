*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_SuppressionAbsences${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_SuppressionAbsences${/}resultat_attendu.json
${REQUETE}
...            SELECT
...                ab.DESC_ABS_ELV,
...                ab.FL_DEL,
...                el.NOM_ELV,
...                el.PRENOM_ELV,
...                cl.LIB_CLASSE,
...                pm.LIB_CRT_MATIER        AS LIBELLE_MATIERE,
...                statu.LIB_CRT_PARAM_GLOB AS STATUT_ABSENCE,
...                motif.LIB_CRT_PARAM_GLOB AS MOTIF_ABSENCE,
...                pp.LIB_CRT_PARAM_GLOB    AS LIBELLE_PERIODE
...            FROM EL_ABSENCE_ELEVE ab
...            INNER JOIN EL_INSCRIPTION i
...                ON i.ID_INSCRIPTION = ab.ID_INSCRIPTION
...            INNER JOIN EL_ELEVE el
...                ON el.ID_ELEVE = i.ID_ELEVE
...            INNER JOIN PA_CLASSE cl
...                ON cl.ID_CLASSE = i.ID_CLASSE
...            LEFT JOIN PA_MATIERE pm
...                ON pm.ID_MATIERE = ab.id_matiere
...            LEFT JOIN PA_PARAM_GLOB statu
...                ON statu.ID_PARAM_GLOB = ab.ID_PA_STATU_ABS_ELV
...            LEFT JOIN PA_PARAM_GLOB motif
...                ON motif.ID_PARAM_GLOB = ab.ID_PA_MOTF_ABS_ELV
...            LEFT JOIN PA_PARAM_GLOB pp
...                ON pp.ID_PARAM_GLOB = ab.ID_PA_PERIODE
...            ORDER BY
...                el.NOM_ELV ASC,
...                el.PRENOM_ELV ASC,
...                ab.DAT_DEB_ABS_ELV ASC;

*** Test Cases ***
Gestion des absences
    [Documentation]    Automatisation cas de test suppression et modification absence
    execution dump    TC_SUP_MODIF_ABS_INPUT.sql   
    lance pgetab
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluations	bouton_evaluations
    selectionne le module	Eleves	bouton_eleve
    selectionne le sous module    Absences    bouton_absences
    pause    2s
    clique    ligne_eleve_camara_rahim
    clique    absence_1
    clique    bouton_modifier
    choisis option    option_justifier    choix_statut_absence
    clique    bouton_modifier_absence
    clique    ligne_eleve_camara_rahim
    clique    absence_2
    clique    bouton_supprimer
    appuyer sur entrer
    clique    ligne_eleve_zongo_franck
    clique    absence_1
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle haut
    clique    bouton_modifier
    choisis option    option_justifier    choix_statut_absence
    clique    bouton_modifier_absence
    clique    ligne_eleve_zongo_franck
    clique    absence_1
    touche directionnelle bas
    clique    bouton_supprimer
    appuyer sur entrer

    #Verification
    arrete pgetab
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}



*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_GestionAbsences${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_GestionAbsences${/}resultat_attendu.json
${REQUETE}    
...            SELECT
...                el.NOM_ELV,
...                el.PRENOM_ELV,    
...                ab.DESC_ABS_ELV,
...                ab.FL_DEL,
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
    [Documentation]    Automatisation cas de test de gestion des absences d'un eleve
    execution dump    TC_INSERTION_ELEVE.sql 
    lance pgetab
    pause	10s
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluations	bouton_evaluations
    pause    1s
    selectionne le module	Eleves	bouton_eleve
    selectionne le sous module    Absences    bouton_absences
    pause    2s
    saisis	BAZONGO    champ_nom
    saisis	Alicia    champ_prenom
    clique	bouton_ajouter
    choisis option    option_anglais    choix_matiere
    saisis_hover_max    11/03/2026    champ_debut_absence    50   
    saisis_hover_max    07:00    champ_debut_absence    150
    saisis_hover_max    11/03/2026    champ_fin_absence    50    
    saisis_hover_max    09:00    champ_fin_absence    150
    saisis "Panne mecanique" dans le champ "champ_description"
    clique    bouton_1
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    appuyer sur entrer
    clique    bouton_ajouter_absence
    appuyer sur entrer

    clique	bouton_ajouter
    choisis option    option_hg    choix_matiere
    saisis_hover_max    17/05/2026    champ_debut_absence    50   
    saisis_hover_max    15:00    champ_debut_absence    150
    saisis_hover_max    17/05/2026    champ_fin_absence    50    
    saisis_hover_max    17:00    champ_fin_absence    150
    saisis "Problemes familiaux" dans le champ "champ_description"
    clique    bouton_1
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    appuyer sur entrer
    clique    bouton_ajouter_absence
    appuyer sur entrer

    clique  champ_nom_1
    selectionne tout
    supprime selection
    saisis texte    KABORE
    clique  champ_prenom_1
    selectionne tout
    supprime selection
    saisis texte    Wendyam
    clique    bouton_ajouter
    choisis option    option_justifier    choix_statut_absence
    choisis option    option_math    choix_matiere
    saisis_hover_max    25/06/2026    champ_debut_absence    50   
    saisis_hover_max    07:00    champ_debut_absence    150
    saisis_hover_max    25/06/2026    champ_fin_absence    50    
    saisis_hover_max    09:00    champ_fin_absence    150
    saisis "Souffrant du paludisme" dans le champ "champ_description"
    clique    bouton_1
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    touche directionnelle bas
    appuyer sur entrer
    clique    bouton_ajouter_absence
    appuyer sur entrer
    arrete pgetab

    #Verification
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}

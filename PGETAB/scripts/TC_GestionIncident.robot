*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_GestionIncidents${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_GestionIncidents${/}resultat_attendu.json
${REQUETE}    
...            SELECT
...                el.NOM_ELV,
...                el.PRENOM_ELV,
...                cl.LIB_CLASSE,
...                inc.LIB_LNG_INCIDENT,
...                inc.NB_POIN_RETRAI,
...                inc.PAREN_CONVOQ,
...                typ_inc.LIB_CRT_PARAM_GLOB  AS TYPE_INCIDENT,
...                exclu.LIB_CRT_PARAM_GLOB    AS TYPE_EXCLUSION,
...                pp.LIB_CRT_PARAM_GLOB       AS LIBELLE_PERIODE
...            FROM EL_INCIDENT inc
...            INNER JOIN EL_INSCRIPTION i
...                ON i.ID_INSCRIPTION = inc.ID_INSCRIPTION
...            INNER JOIN EL_ELEVE el
...                ON el.ID_ELEVE = i.ID_ELEVE
...            INNER JOIN PA_CLASSE cl
...                ON cl.ID_CLASSE = i.ID_CLASSE
...            LEFT JOIN PA_PARAM_GLOB typ_inc
...                ON typ_inc.ID_PARAM_GLOB = inc.ID_PA_TYP_INCIDENT
...            LEFT JOIN PA_PARAM_GLOB exclu
...                ON exclu.ID_PARAM_GLOB = inc.ID_PA_EXCLUSION_ELV
...            LEFT JOIN PA_PARAM_GLOB pp
...                ON pp.ID_PARAM_GLOB = inc.ID_PA_PERIODE
...            ORDER BY
...                el.NOM_ELV ASC,
...                el.PRENOM_ELV ASC,
...                inc.DAT_INCIDENT ASC;

*** Test Cases ***
Gestion des incidents
    [Documentation]    Automatisation cas de test gestion d'incident
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
    selectionne le sous module    Incidents    bouton_incidents
    pause    2s
    saisis	OUEDRAOGO    champ_nom
    saisis	Stefi	champ_prenom
    clique	bouton_ajouter
    saisis texte   Harcelement
    choisis option    option_type_sanction_3    choix_type_sanction
    choisis option    option_type_incident_3    choix_type_incident
    saisis "01/07/2026" dans le champ "champ_date"
    saisis "15:00" dans le champ "champ_date_heure"
    saisis "02/07/2026" dans le champ "champ_date_debut_exclusion"
    saisis "00:00" dans le champ "champ_heure_debut_exclusion"
    saisis "03/07/2026" dans le champ "champ_date_fin_exclusion"
    saisis "23:59" dans le champ "champ_heure_fin_exclusion"
    choisis option    option_trimestre_3    choix_periode
    clique  champ_retrait_point
    selectionne tout
    supprime selection
    saisis texte    5
    clique    bouton_valider
    appuyer sur entrer

    clique  champ_nom_1
    selectionne tout
    supprime selection
    saisis texte    BIRBA
    clique  champ_prenom_1
    selectionne tout
    supprime selection
    saisir_texte    Emmanuel
    clique	bouton_ajouter
    saisis texte   Delinquance scolaire
    choisis option    option_type_sanction_1    choix_type_sanction
    choisis option    option_type_incident_2    choix_type_incident
    saisis "02/03/2026" dans le champ "champ_date"
    saisis "09:00" dans le champ "champ_date_heure_2"
    saisis "03/03/2026" dans le champ "champ_date_debut_exclusion"
    saisis "00:00" dans le champ "champ_heure_debut_exclusion_2"
    saisis "17/03/2026" dans le champ "champ_date_fin_exclusion"
    saisis "23:59" dans le champ "champ_heure_fin_exclusion_2"
    choisis option    option_trimestre_2    choix_periode
    clique  champ_retrait_point
    selectionne tout
    supprime selection
    saisis texte    8
    clique    bouton_convocation_parent
    clique    bouton_valider
    appuyer sur entrer
    arrete pgetab

    #Verification BD
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}
    



    
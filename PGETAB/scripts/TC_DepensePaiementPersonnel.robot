*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_DepensePaiementPersonnel${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_DepensePaiementPersonnel${/}resultat_attendu.json
${REQUETE}
*** Test Cases ***
Module Depense
    [Documentation]    Automatisation du cas de test lié au paiement du personnel
    execution dump    TC_SM_DEPENSE_INPUT.sql
    lance pgetab
    saisis	intendant	champ_nom_utilisateur
    saisis	souris	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    charge image    Module_Comptabilite
    clique    bouton_depense    
    charge image    Module_Comptabilite/SM_Depense/SSM_Paie_personnel
    saisis    BANDE    champ_nom
    saisis    Stephanie    champ_prenom
    clique    bouton_bulletin
    clique  periode_debut
    selectionne tout
    supprime selection
    saisis texte    01/10/2025
    clique  periode_fin
    selectionne tout
    supprime selection
    saisis texte    31/10/2025
    clique    bouton_valider
    appuyer sur entrer
    clique    bouton_detail_bulletin
    clique    bouton_valider_bulletin
    clique    bouton_oui
    appuyer sur entrer
    clique    bouton_payer
    pause    1s
    appuyer sur entrer
    saisis "CNIB B10759750 du 10/09/2020" dans le champ "champ_document_ID"
    choisis option    option_salaire_personnel    choix_motif_paiement
    choisis option    option_bulletin    choix_bulletin
    saisis_hover_max    RAS    champ_motif    50
    clique    bouton_valider_paiement_salaire
    pause    5s

    clique  champ_nom_1
    selectionne tout
    supprime selection
    saisis texte    Camara
    clique  champ_prenom_1
    selectionne tout
    supprime selection
    saisis texte    Madou
    clique    bouton_bulletin
    saisis "30" dans le champ "champ_volume_horaire"
    clique  periode_debut
    selectionne tout
    supprime selection
    saisis texte    01/10/2025
    clique  periode_fin
    selectionne tout
    supprime selection
    saisis texte    31/10/2025
    clique    bouton_calculer
    clique    bouton_valider
    appuyer sur entrer
    clique    bouton_detail_bulletin
    clique    bouton_valider_bulletin
    clique    bouton_oui
    appuyer sur entrer
    clique    bouton_payer
    pause    1s
    appuyer sur entrer
    saisis "CNIB B10758000 du 10/05/2019" dans le champ "champ_document_ID"
    choisis option    option_salaire_personnel    choix_motif_paiement
    choisis option    option_bulletin    choix_bulletin
    saisis_hover_max    RAS    champ_motif    50
    clique    bouton_valider_paiement_salaire
    arrete pgetab

    
    #Verification BD
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}



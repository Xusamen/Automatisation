*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py
Resource         ../resources/utils-keywords.resource

Suite Setup     init env and start
Suite Teardown  stop and clean env

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_DepensePaiementBourse${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_DepensePaiementBourse${/}resultat_attendu.json
${REQUETE}

*** Test Cases ***
Module Depense
    [Documentation]    Automatisation du cas de test lié au paiement du personnel
    execution dump    TC_PAIEMENT_BOURSE_INPUT.sql
    lance pgetab
    saisis	intendant	champ_nom_utilisateur
    saisis	souris	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    charge image    Module_Comptabilite
    clique    bouton_depense
    charge image    Module_Comptabilite/SM_Depense
    pause    1s
    clique    bouton_paie_bourse   
    charge image    Module_Comptabilite/SM_Depense/SSM_Paie_bourse
    pause    2s
    saisis    OUEDRAOGO    champ_nom
    saisis    Richard    champ_prenom
    clique    bouton_payer
    pause    1s
    choisis option    option_fourniture_scolaire    choix_motif_bourse
    saisis_hover_max    01/10/2025    champ_date_debut    75
    saisis_hover_max    31/07/2026    champ_date_fin    75
    saisis_hover_max    Paiement_bourse    champ_document    75
    #saisis_hover_max    RAS    champ_commentaire    75                   correction    format attendu
    clique    bouton_payer_bourse
    pause    2s

    clique  champ_nom_1
    selectionne tout
    supprime selection
    saisis texte    TRAORE
    clique  champ_prenom_1
    selectionne tout
    supprime selection
    saisis texte    Amina
    clique    bouton_payer
    pause    1s
    saisis_hover_max    01/10/2025    champ_date_debut    75
    saisis_hover_max    31/07/2026    champ_date_fin    75
    #saisis_hover_max        champ_document    75                        correction format attendu
    saisis_hover_max    RAS    champ_commentaire    75
    clique    bouton_payer_bourse
    pause    2s
    arrete pgetab

    
    #Verification BD
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}
    


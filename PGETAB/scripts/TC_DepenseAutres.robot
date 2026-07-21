*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_DepenseAutre${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_DepenseAutre${/}resultat_attendu.json
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
    charge image    Module_Comptabilite/SM_Depense
    clique    bouton_autres_depenses
    charge image    Module_Comptabilite/SM_Depense/SSM_Autres_depenses
    clique    bouton_nouvelle_depense
    appuyer sur entrer
    saisis_hover_max    Paiement de factures eau, electricite, fibre    champ_libelle    50
    choisis option    option_materiel_fourniture    choix_chapitre
    choisis option    option_eau_electricite   choix_article
    choisis option    option_cfa   choix_unite
    clique    modifier_prix_unitaire
    saisis_hover_max    75000    champ_prix_unitaire    50
    saisis_hover_max    1    champ_quantite    50
    saisis "Facture N°54 Sonabel, Facture N°10 ONEA, Facture N°1250 MOOV-FIBRE" dans le champ "champ_info_fournisseur"
    saisis_hover_max    RAS    champ_commentaire    60
    clique    bouton_valider
    pause    5s

    clique    bouton_nouvelle_depense
    saisis_hover_max    Financement semaine culturel an 2025/2026    champ_libelle    50
    choisis option    option_autres_charges_generale    choix_chapitre
    choisis option    option_manifestation_culturel_sportive   choix_article_2
    choisis option    option_cfa   choix_unite
    clique    modifier_prix_unitaire
    saisis_hover_max    575000    champ_prix_unitaire    50
    saisis_hover_max    1    champ_quantite    50
    saisis "Facture N°54 Location, Facture N°10 Decoration, Facture N°1250 Divers" dans le champ "champ_info_fournisseur"
    saisis_hover_max    RAS    champ_commentaire    60
    clique    bouton_valider
    arrete pgetab

    #Verification BD
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}





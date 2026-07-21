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
#Definir la requete corresppondante

*** Test Cases ***
Desincription Eleves
    [Documentation]    Automatisation cas de test de lié à la desincription d'un eleve
    execution dump    TC_INSERTION_ELEVE.sql 
    lance pgetab
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluations    bouton_evaluations
    pause    1s
    selectionne le module	Eleves	bouton_eleve
    selectionne le sous module    Liste_eleve_inscrit     bouton_liste_eleve_inscrit
    pause    2s
    saisis_hover_max  31/12/2026    date_recherche_inscription    5
    appuyer sur entrer
    saisis	BIRBA    champ_nom
    saisis	Emmanuel    champ_prenom
    clique	bouton_desinscription
    appuyer sur entrer

    clique  champ_nom_1
    selectionne tout
    supprime selection
    saisis texte    KABORE
    clique  champ_prenom_1
    selectionne tout
    supprime selection
    saisis texte    Wendyam
    clique    bouton_desinscription
    appuyer sur entrer

    clique  champ_nom_2
    selectionne tout
    supprime selection
    saisis texte    ZONGO
    clique  champ_prenom_2
    selectionne tout
    supprime selection
    saisis texte    Franck
    clique    bouton_desinscription
    appuyer sur entrer
    arrete pgetab

    #Verification
    #connexion bd
    #generer resultat obtenu    ${REQUETE}    ${OBTENU}
    #deconnexion bd
    #comparer resultats    ${OBTENU}        ${ATTENDU}
    

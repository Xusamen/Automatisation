*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${REQUETE}     select NOM_ELV, PRENOM_ELV, LIEU_NAIS_ELV, PRNM_PERE_ELV from el_eleve  
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_Evaluation${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_Evaluation${/}resultat_attendu.json

*** Test Cases ***
Inscription Eleve
    [Documentation]    Automatisation Cas de Test Inscription Eleve

    Given lance pgetab
    And pause	10s
    And saisis	admin	champ_nom_utilisateur
    And saisis	admin	champ_mot_de_passe
    When clique	bouton_login
    Then verification	icone
    And pause	2s
    And selectionne le module	Evaluations	bouton_evaluations





    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}
    arrete pgetab
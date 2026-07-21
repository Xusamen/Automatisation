*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Cas de test
    [Documentation]    Automatisation du cas de test  Authentification

    Given lance pgetab
    And pause	10s
    When saisis	admin	champ_nom_utilisateur
    And saisis	admin	champ_mot_de_passe
    And clique	bouton_login
    Then verification	icone
    And arrete pgetab
    #Modifier en ajoutant l'usage d'identifiant erroné

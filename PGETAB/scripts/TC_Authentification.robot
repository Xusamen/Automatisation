*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Nom du cas de test
    [Documentation]    Automatisation du cas de test  Authentification

    Given lance pgetab
    When saisis "admin" "champ_nom_utilisateur"
    And saisis "admin" "champ_mot_de_passe"
    And clique "bouton_login"
    Then verification "icone"

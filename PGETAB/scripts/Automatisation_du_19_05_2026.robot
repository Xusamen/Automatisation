*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Cas de test
    [Documentation]    Automatisation du cas de test  AUTH PGETAB

    Given lance pgetab
    And   pause	4s
    And   saisis	admin	champ_nom_utilisateur
    And   saisis	admin	champ_mot_de_passe
    And   clique	bouton_login
    Then  verification	icone
    And   pause	5s

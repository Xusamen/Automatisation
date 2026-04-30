*** Settings ***
Resource         ../resources/autoges-keywords.resource
Library          OperatingSystem
Library          Process

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Authentification Auto-Ecole Scheduler
    [Documentation]    AUTOGES AUTH
    Given lancer autoges
    When je saisis    Dev    id
    And je saisis     souris    password
    And je clique sur    connexion
    Then visible    icone
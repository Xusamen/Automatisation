*** Settings ***
Resource         ../resources/autoges-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Conversion du cas de test
    [Documentation]    xxxxx

    Given lancer autoges

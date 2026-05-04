*** Settings ***
Resource         ../resources/autoges-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Lancer Autoges Test Case
    [Documentation]    xxxx

    Given lancer autoges

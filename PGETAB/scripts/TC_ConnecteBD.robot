*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Validation des keywords de connexion bd
    connexion bd
    

*** Settings ****
Library          OperatingSystem
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/utils-keywords.resource

Suite Setup     init env and start
Suite Teardown  stop and clean env

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Cas de test
    [Documentation]    Automatisation du cas de test  Authentification

    lance pgetab
    clique    lien_admin
    clique    bouton_login
    pause    5s
    verification    icone
    arrete pgetab
    #Modifier en ajoutant l'usage d'identifiant erroné

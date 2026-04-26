
*** Settings ***
Library    Browser


*** Variables ***
${URL}    https://www.gestion.entreprise.did-itech.com/
${ID}    admin
${PASSWORD}    admin

*** Test Cases ***
Test Google
    New Browser    chromium    headless=True
    New Page    ${URL}    
        
    # Saisie téléphone
    Fill Text    input[id="_r_0_"]    ${ID}

    # Saisie mot de passe
    Fill Text    input[id="_r_1_"]    ${PASSWORD}

    # Valider
    Click    button[type="submit"]

    Sleep    30s
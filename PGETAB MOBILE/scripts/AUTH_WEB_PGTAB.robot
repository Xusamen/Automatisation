
*** Settings ***
Library    Browser


*** Variables ***
${URL}    https://www.pgetab.web.did-itech.com/login
${ID}    cdg01.passepartout
${PASSWORD}    admin

*** Test Cases ***
Test PGETAB WEB
    New Browser    chromium    headless=False
    New Page    ${URL}    
        
    # Saisie téléphone
    Fill Text    input[name="username"]    ${ID}

    # Saisie mot de passe
    Fill Text    input[name="password"]    ${PASSWORD}

    # Valider
    Click    button[type="submit"]


    Sleep    10s

    Keyboard Key    press    Tab
    Keyboard Key    press    Tab

    Keyboard Key    press    Enter

    Sleep    5s
*** Settings ***
Library    Browser

*** Variables ***
${URL}      https://votre-plateforme.com
${USER}     mon_utilisateur

*** Test Cases ***
Connexion Reussie Sur La Plateforme
    New Browser    chromium    headless=False
    New Page       ${URL}
    Fill Text      id=username_field    ${USER}
    Fill Text      id=password_field    MonMotDePasseSecret
    Click          id=login_button
    Get Text       h1    contains    Tableau de bord
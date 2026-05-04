*** Settings ***
Library         Browser
Library         Process

*** Variables ***
${statut_global}     OK
${URL_BASE}          https://votre-application.com
${BROWSER}           chromium
${HEADLESS}          ${False}

*** Keywords ***

# --- Gestionnaire de flux ---
_gestionnaire_etape
    [Arguments]    ${nom_technique}    @{arguments}
    IF    "${statut_global}" == "KO"
        Log    STATUS: BLOCKED | Etape: ${nom_technique}    WARN
        RETURN
    END

    ${status}    ${erreur} =    Run Keyword And Ignore Error    ${nom_technique}    @{arguments}

    IF    "${status}" == "PASS"
        Log    STATUS: OK | Etape: ${nom_technique}
    ELSE
        Set Global Variable    ${statut_global}    KO
        Log    STATUS: KO | Etape: ${nom_technique} | Erreur: ${erreur}    ERROR
        # Optionnel : Prendre une capture d'écran en cas d'erreur
        Take Screenshot
        Fail    ${erreur}
    END

# --- Keywords Métiers (Lisibles) ---

lance l'application web
    _gestionnaire_etape    lancer_navigateur_technique

saisis "${texte}" dans le champ "${selecteur}"
    _gestionnaire_etape    saisir_texte_technique    ${selecteur}    ${texte}

clique sur le bouton "${selecteur}"
    _gestionnaire_etape    cliquer_element_technique    ${selecteur}

verifie la presence de "${selecteur}"
    _gestionnaire_etape    verifier_visibilite_technique    ${selecteur}

selectionne le module "${nom_module}"
    # Ici, on suppose que le module a un ID ou un texte spécifique
    _gestionnaire_etape    cliquer_element_technique    text=${nom_module}

appuyer sur la touche
    [Arguments]    ${touche}
    _gestionnaire_etape    presser_touche_technique    ${touche}

# --- Keywords Techniques (Bas Niveau Playwright) ---

lancer_navigateur_technique
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${URL_BASE}
    # Attente que l'élément principal de login soit chargé
    Wait For Elements State    body    visible    20s

saisir_texte_technique
    [Arguments]    ${selector}    ${valeur}
    # Playwright vide automatiquement le champ avec 'Fill Text'
    Wait For Elements State    ${selector}    visible    10s
    Fill Text    ${selector}    ${valeur}

cliquer_element_technique
    [Arguments]    ${selector}
    Wait For Elements State    ${selector}    visible    10s
    Click    ${selector}

verifier_visibilite_technique
    [Arguments]    ${selector}
    Wait For Elements State    ${selector}    visible    10s

presser_touche_technique
    [Arguments]    ${touche}
    # Exemple: Keyboard Key  Enter
    Keyboard Key    press    ${touche}
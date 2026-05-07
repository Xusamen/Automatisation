*** Settings ***
Library         SikuliLibrary
Library         Process

*** Variables ***
${statut_global}    OK
${module_actuel}    ${EMPTY}
${chemin_images_base}    ${CURDIR}${/}..${/}images

*** Keywords ***

# gestion des statuts
gestionnaire_etape
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
        Fail    ${erreur}
    END

# Keywords Fonctionnel
lance pgetab
    gestionnaire_etape    lancer_app

saisis
    [Arguments]    ${texte}    ${nom_image}
    gestionnaire_etape    saisir_donnee    ${nom_image}    ${texte}

saisis "${texte}" dans le champ "${image_label}"
    [Arguments]    ${distance}=150
    gestionnaire_etape    saisir_donnee_hover_droit    ${image_label}    ${texte}    ${distance}

clique
    [Arguments]    ${nom_bouton}
    gestionnaire_etape    cliquer_bouton    ${nom_bouton}

verification
    [Arguments]    ${nom_icone}
    gestionnaire_etape    verifier_visibilite_technique    ${nom_icone}
    
appuyer sur entrer
    gestionnaire_etape    presser_touche_technique    ENTER

appuyer sur tab
    gestionnaire_etape    presser_touche_technique    TAB

touche directionnelle gauche
    gestionnaire_etape    presser_touche_technique    LEFT

touche directionnelle droite
    gestionnaire_etape    presser_touche_technique    RIGHT

touche directionnelle haut
    gestionnaire_etape    presser_touche_technique    UP

touche directionnelle bas
    gestionnaire_etape    presser_touche_technique    DOWN

pause
    [Arguments]    ${temps}
    [Documentation]    Attend un temps donné (ex: 2s, 500ms).
    _gestionnaire_etape    attente_technique    ${temps}

selectionne le module
    [Arguments]    ${nom_module}    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    # On définit le premier niveau : Module_X
    Set Global Variable    ${module_actuel}    Module_${nom_module}
    _gestionnaire_etape    charger_chemin_technique    ${module_actuel}

selectionne le sous module
    [Arguments]    ${nom_sous_module}    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    # On ajoute le sous-module au chemin actuel : Module_X/SM_Y
    Set Global Variable    ${module_actuel}    ${module_actuel}${/}SM_${nom_sous_module}
    _gestionnaire_etape    charger_chemin_technique    ${module_actuel}

selectionne le sous sous module
    [Arguments]    ${nom_ssm}    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    # On ajoute le sous-sous-module : Module_X/SM_Y/SSM_Z
    Set Global Variable    ${module_actuel}    ${module_actuel}${/}SSM_${nom_ssm}
    _gestionnaire_etape    charger_chemin_technique    ${module_actuel}


# Mots-clés Techniques
lancer_app
    ${chemin_login}    Set Variable    ${chemin_images_base}${/}Login
    Add Image Path    ${chemin_login}
    Start Process    C:\\EXECUTION_PGETAB.bat    shell=True
    Wait Until Screen Contain    bouton_login.png    20
    ${chemin_accueil}    Set Variable    ${chemin_images_base}${/}Accueil
    Add Image Path    ${chemin_accueil}
    Log    Prêt sur la page d'accueil. Dossier chargé : ${chemin_accueil}

saisir_donnee
    [Arguments]    ${image}    ${valeur}
    Click    ${image}.png
    Input Text    ${EMPTY}    ${valeur}

cliquer_bouton
    [Arguments]    ${bouton}
    Click    ${bouton}.png

verifier_visibilite_technique
    [Arguments]    ${icone}
    Wait Until Screen Contain    ${icone}.png    10

presser_touche_technique
    [Arguments]    ${touche}
    Press Special Key    ${touche}

charger_chemin_technique
    [Arguments]    ${chemin_relatif}
    ${nouveau_chemin}    Set Variable    ${chemin_images_base}${/}${chemin_relatif}
    Add Image Path    ${nouveau_chemin}
    Log    [CONTEXTE] Images chargées depuis : ${nouveau_chemin}

saisir_donnee_hover_droit
    [Arguments]    ${image_label}    ${texte}    ${distance}
    Wait Until Screen Contain    ${image_label}.png    10
    ${coordinates} =    Get Center    ${image_label}.png
    ${target_x} =    Evaluate    ${coordinates[0]} + ${distance}
    ${target_y} =    Set Variable    ${coordinates[1]}
    Mouse Move    ${target_x}    ${target_y}
    Click Region    ${target_x}    ${target_y}
    Type    a    ${Key.CTRL}
    Type    ${Key.BACKSPACE}
    Input Text    ${image_label}.png    ${texte}

attente_technique
    [Arguments]    ${temps}
    Sleep    ${temps}
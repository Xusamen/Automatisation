*** Settings ***
Library         SikuliLibrary
Library         Process

*** Variables ***
${statut_global}    OK
${module_actuel}    ${EMPTY}
${module_parent}    ${EMPTY}
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
lance egesti
    gestionnaire_etape    lancer_app

arrete egesti
    gestionnaire_etape    arret_app

saisis
    [Arguments]    ${texte}    ${nom_image}
    gestionnaire_etape    saisir_donnee    ${nom_image}    ${texte}

clique
    [Arguments]    ${nom_bouton}
    gestionnaire_etape    cliquer_bouton    ${nom_bouton}

verification
    [Arguments]    ${nom_icone}
    gestionnaire_etape    verifier_visibilite_technique    ${nom_icone}

appuyer_sur_entrer
    gestionnaire_etape    presser_touche_technique    ENTER

appuyer_sur_tab
    gestionnaire_etape    presser_touche_technique    TAB

touche_directionnelle_gauche
    gestionnaire_etape    presser_touche_technique    LEFT

touche_directionnelle_droite
    gestionnaire_etape    presser_touche_technique    RIGHT

touche_directionnelle_haut
    gestionnaire_etape    presser_touche_technique    UP

touche_directionnelle_bas
    gestionnaire_etape    presser_touche_technique    DOWN

pause
    [Arguments]    ${temps}
    [Documentation]    Attend un temps donné (ex: 2s, 500ms).
    gestionnaire_etape    attente_technique    ${temps}

selectionne le module
    [Arguments]    ${nom_module}    ${nom_bouton}
    gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    Set Global Variable    ${module_parent}    Module_${nom_module}
    Set Global Variable    ${module_actuel}    ${module_parent}
    gestionnaire_etape    charger_chemin_technique    ${module_actuel}

selectionne le sous module
    [Arguments]    ${nom_sous_module}    ${nom_bouton}
    gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    Set Global Variable    ${module_actuel}    ${module_parent}${/}SM_${nom_sous_module}
    gestionnaire_etape    charger_chemin_technique    ${module_actuel}

selectionne le sous sous module
    [Arguments]    ${nom_ssm}    ${nom_bouton}
    gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    Set Global Variable    ${module_actuel}    ${module_actuel}${/}SSM_${nom_ssm}
    gestionnaire_etape    charger_chemin_technique    ${module_actuel}

choisis option 
    [Arguments]    ${image_option}    ${image_combo}
    gestionnaire_etape    selectionner_combobox    ${image_combo}    100   ${image_option}

charge image
    [Arguments]    ${chemin}
    [Documentation]   Charge des images en specifiant Module_xx/SM_xx/SSM_xx
    Set Global Variable    ${module_actuel}    ${chemin}    
    gestionnaire_etape    charger_repertoire_via_chemin_technique    ${chemin}


# Mots-clés Techniques
lancer_app
    ${chemin_login}    Set Variable    ${chemin_images_base}${/}Login
    Add Image Path    ${chemin_login}
    Start Process    C:\\EXECUTION_EGESTI.bat    shell=True
    attente_technique    20s
    Wait Until Screen Contain    bouton_se_connecter.png    5
    ${chemin_accueil}    Set Variable    ${chemin_images_base}${/}Accueil
    Add Image Path    ${chemin_accueil}
    Log    EGESTI lancé & Dossier image chargé : ${chemin_accueil}

arreter_app
    Start Process    C:\\ARRET_PGETAB.bat    shell=True
    attente_technique    10s
    Log    arret de EGESTI

attente_technique
    [Arguments]    ${temps}
    Sleep    ${temps}

saisir_donnee
    [Arguments]    ${image}    ${valeur}
    Click    ${image}.png
    Input Text    ${image}.png    ${valeur}

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

selectionner_combobox
    [Arguments]    ${image_label}    ${distance}    ${image_option}
    
    Wait Until Screen Contain    ${image_label}.png    10
    ${coordinates} =    Get Image Coordinates    ${image_label}.png
    
    ${center_x} =    Evaluate    int(${coordinates[0]} + (${coordinates[2]} / 2))
    ${center_y} =    Evaluate    int(${coordinates[1]} + (${coordinates[3]} / 2))
    ${target_x} =    Evaluate    int(${center_x} + ${distance})
    
    Mouse Move Location    ${target_x}    ${center_y}
    Sleep    0.2s
    
    Click    ${image_label}.png    50    0
    Sleep    0.5s    
    Wait Until Screen Contain    ${image_option}.png    5
    Click    ${image_option}.png    0    0

charger_repertoire_via_chemin_technique
    [Arguments]    ${chemin_relatif}
    ${chemin_final}    Set Variable    ${chemin_images_base}${/}${chemin_relatif}
    Add Image Path    ${chemin_final}
    Log    [CONTEXTE IMAGES] Basculement réussi vers le répertoire : ${chemin_final}
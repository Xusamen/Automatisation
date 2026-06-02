# resources/erp_keywords.resource
# Keywords réutilisables pour interagir avec l'ERP via SikuliLibrary

*** Settings ***
Library    SikuliLibrary
Library    OperatingSystem
Library    Collections


*** Variables ***
${IMAGES_DIR}      ${CURDIR}/../images_sikuli
${TIMEOUT_UI}      10       # secondes — délai max pour trouver une image à l'écran
${TIMEOUT_TRAITEMENT}    30  # secondes — délai max pour fin de traitement ERP


*** Keywords ***

# ------------------------------------------------------------------ #
#  NAVIGATION                                                          #
# ------------------------------------------------------------------ #

Naviguer Vers Module
    [Documentation]    Clique sur l'image de menu pour ouvrir un module ERP
    [Arguments]    ${menu_image}
    ${chemin_image}=    Set Variable    ${IMAGES_DIR}/${menu_image}
    Wait Until Screen Contain    ${chemin_image}    ${TIMEOUT_UI}
    Click    ${chemin_image}

Ouvrir Nouveau Formulaire
    [Documentation]    Clique sur le bouton "Nouveau" du module courant
    [Arguments]    ${bouton_image}
    ${chemin_image}=    Set Variable    ${IMAGES_DIR}/${bouton_image}
    Wait Until Screen Contain    ${chemin_image}    ${TIMEOUT_UI}
    Click    ${chemin_image}


# ------------------------------------------------------------------ #
#  SAISIE DE DONNÉES                                                   #
# ------------------------------------------------------------------ #

Saisir Champ
    [Documentation]    Trouve un champ par son image de référence et saisit une valeur
    [Arguments]    ${champ_image}    ${valeur}
    ${chemin_image}=    Set Variable    ${IMAGES_DIR}/${champ_image}
    Wait Until Screen Contain    ${chemin_image}    ${TIMEOUT_UI}
    Click    ${chemin_image}
    Type    ${valeur}

Saisir Ligne Commande
    [Documentation]    Saisit une ligne article (code, quantité, prix) dans le tableau de commande
    [Arguments]    ${ligne}
    Saisir Champ    ${ligne}[article_image]      ${ligne}[article_code]
    Saisir Champ    ${ligne}[quantite_image]     ${ligne}[quantite]
    Saisir Champ    ${ligne}[prix_image]         ${ligne}[prix_unitaire]

Saisir Toutes Les Lignes
    [Documentation]    Itère sur la liste des lignes du cas de test et les saisit
    [Arguments]    ${lignes}
    FOR    ${ligne}    IN    @{lignes}
        Saisir Ligne Commande    ${ligne}
    END


# ------------------------------------------------------------------ #
#  VALIDATION ET ATTENTE                                               #
# ------------------------------------------------------------------ #

Valider Formulaire
    [Documentation]    Clique sur le bouton de validation du formulaire
    [Arguments]    ${bouton_image}
    ${chemin_image}=    Set Variable    ${IMAGES_DIR}/${bouton_image}
    Wait Until Screen Contain    ${chemin_image}    ${TIMEOUT_UI}
    Click    ${chemin_image}

Attendre Confirmation
    [Documentation]    Attend l'apparition de l'image de confirmation de succès ERP
    [Arguments]    ${confirmation_image}
    ${chemin_image}=    Set Variable    ${IMAGES_DIR}/${confirmation_image}
    Wait Until Screen Contain    ${chemin_image}    ${TIMEOUT_TRAITEMENT}
    Log    Traitement ERP confirmé visuellement.


# ------------------------------------------------------------------ #
#  KEYWORD HAUT NIVEAU — SAISIE COMPLÈTE D'UNE COMMANDE               #
# ------------------------------------------------------------------ #

Saisir Et Valider Commande
    [Documentation]    Keyword complet : navigation + saisie + validation pour une commande
    [Arguments]    ${cas}
    ${nav}=       Get From Dictionary    ${cas}    navigation
    ${entree}=    Get From Dictionary    ${cas}    donnees_entree

    Naviguer Vers Module        ${nav}[menu_image]
    Ouvrir Nouveau Formulaire   ${nav}[bouton_nouveau_image]

    Saisir Champ    ${entree}[client_image]           ${entree}[client_code]
    Saisir Champ    ${entree}[date_livraison_image]   ${entree}[date_livraison]
    Saisir Toutes Les Lignes    ${entree}[lignes]

    Valider Formulaire    ${entree}[validation_image]
    Attendre Confirmation    ${entree}[confirmation_image]

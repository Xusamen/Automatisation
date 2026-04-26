*** Settings ***
Library          SikuliLibrary
Library          Process

*** Keywords ***
# --- Initialisation (A appeler au début du test) ---

Démarrer l'environnement de test
    Start Sikuli Process
    # On indique à Sikuli de regarder dans le dossier 'images' du dépôt cloné
    Add Image Path    ${CURDIR}/images
    # On définit un seuil de ressemblance (0.7 est un bon compromis)
    Set Min Similarity    0.7

# --- Mots-clés Métier (Gherkin) ---

je lance l'application AUTOGES
    Start Process    AUTO-ECOLE-SCHEDULER.exe
    # On attend que l'app soit visible
    Wait Until Screen Contain    bouton_connexion.png    20

je clique sur le bouton "${nom_bouton}"
    # Sikuli cherchera automatiquement le fichier .png dans le dossier défini plus haut
    Click    ${nom_bouton}.png

je saisis "${texte}" sur l'image "${nom_image}"
    # On clique d'abord pour donner le focus, puis on écrit
    Click    ${nom_image}.png
    Input Text    ${nom_image}.png    ${texte}

l'image "${nom_icone}" doit être visible
    Wait Until Screen Contain    ${nom_icone}.png    10
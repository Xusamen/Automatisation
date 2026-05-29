*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Library          OperatingSystem

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Cas de test
    [Documentation]    Automatisation du cas de test  Inscription d'un eleve

    Given lance pgetab
    And pause	10s
    And saisis	admin	champ_nom_utilisateur
    And saisis	admin	champ_mot_de_passe
    When clique	bouton_login
    Then verification	icone
    And pause	5s
    When selectionne le module	Evaluations	bouton_evaluations
    And selectionne le module	Eleves	bouton_eleve
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "Yelemou" dans le champ "champ_nom"
    And saisis "Stefie" dans le champ "champ_prenom"
    And saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    And saisis "55250025" dans le champ "champ_telephone_eleve"
    And saisis "07/12/2003" dans le champ "champ_date_de_naissance"
    And clique	bouton_dispenser
    And clique	bouton_suivant
    And saisis "BALIMA" dans le champ "champ_nom_mere"
    And saisis "Brigitte" dans le champ "champ_prenom_mere"
    And saisis "Sylvain" dans le champ "champ_prenom_pere"
    And saisis "76691268" dans le champ "champ_telephone_parent"
    And clique	bouton_suivant
    And choisis option	option_eleve_protege	choix_mode_recrutement
    And choisis option	option_niveau_3	choix_niveau_etude
    And saisis "090920" dans le champ "champ_numero_pv"
    And clique	bouton_valider
    And pause	5s
    And appuyer sur entrer
    And charge image	Accueil
    When selectionne le module	Evaluations	bouton_evaluations
    And selectionne le module	Eleves	bouton_eleve
    And selectionne le sous module	Liste_eleve_inscrit	bouton_liste_eleve_inscrit
    And selectionne le sous module	Listes_eleve	bouton_listes_eleve
    And pause	5s
    And saisis	YELEMOU	champ_recherche_nom
    And saisis	Stefie	champ_recherche_prenom
    And clique	choix_niveau
    And clique	option_niveau_3
    And clique	choix_classe
    And clique	option_classe_3_1

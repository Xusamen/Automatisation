*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${REQUETE}     select NOM_ELV, PRENOM_ELV, LIEU_NAIS_ELV, PRNM_PERE_ELV from el_eleve  
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_Inscription${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_Inscription${/}resultat_attendu.json

*** Test Cases ***
Inscription Eleve
    [Documentation]    Automatisation Cas de Test Inscription Eleve

    Given lance pgetab
    And pause	10s
    And saisis	admin	champ_nom_utilisateur
    And saisis	admin	champ_mot_de_passe
    When clique	bouton_login
    Then verification	icone
    And pause	2s
    And selectionne le module	Evaluations	bouton_evaluations
    And selectionne le module	Eleves	bouton_eleve
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "CAMARA" dans le champ "champ_nom"
    And saisis "Rahim" dans le champ "champ_prenom"
    And saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    And saisis "55250025" dans le champ "champ_telephone_eleve"
    And saisis "07/12/2015" dans le champ "champ_date_de_naissance"
    And clique	bouton_dispenser
    When clique	bouton_suivant
    And saisis "TRAORE" dans le champ "champ_nom_mere"
    And saisis "Abi" dans le champ "champ_prenom_mere"
    And saisis "Souleymane" dans le champ "champ_prenom_pere"
    And saisis "76691268" dans le champ "champ_telephone_parent"
    When clique	bouton_suivant
    And choisis option	option_eleve_officiel	choix_mode_recrutement
    And choisis option	option_niveau_6	choix_niveau_etude
    And saisis "44790" dans le champ "champ_numero_pv"
    When clique	bouton_valider
    And pause	5s
    And appuyer sur entrer

    And charge image	Module_eleves
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "BAZONGO" dans le champ "champ_nom"
    And saisis "Alicia" dans le champ "champ_prenom"
    And saisis "Mangodara" dans le champ "champ_lieu_naissance"
    And saisis "55010101" dans le champ "champ_telephone_eleve"
    And choisis option    option_sexe_feminin	choix_sexe
    And saisis "07/01/2015" dans le champ "champ_date_de_naissance"
    And clique	bouton_dispenser
    When clique	bouton_suivant
    And saisis "TRAORE" dans le champ "champ_nom_mere"
    And saisis "Abi" dans le champ "champ_prenom_mere"
    And saisis "Hernes" dans le champ "champ_prenom_pere"
    And saisis "76691269" dans le champ "champ_telephone_parent"
    When clique	bouton_suivant
    And choisis option	option_eleve_officiel	choix_mode_recrutement
    And choisis option	option_niveau_6	choix_niveau_etude
    And saisis "44791" dans le champ "champ_numero_pv"
    When clique	bouton_valider
    And pause	5s
    And appuyer sur entrer

    And charge image	Module_eleves
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "OUEDRAOGO" dans le champ "champ_nom"
    And saisis "Stefi" dans le champ "champ_prenom"
    And saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    And saisis "55050505" dans le champ "champ_telephone_eleve"
    And choisis option    option_sexe_feminin	choix_sexe
    And saisis "07/02/2015" dans le champ "champ_date_de_naissance"
    When clique	bouton_suivant
    And saisis "Tapsoba" dans le champ "champ_nom_mere"
    And saisis "Ines" dans le champ "champ_prenom_mere"
    And saisis "Steve" dans le champ "champ_prenom_pere"
    And saisis "76691270" dans le champ "champ_telephone_parent"
    When clique	bouton_suivant
    And choisis option	option_eleve_officiel	choix_mode_recrutement
    And choisis option	option_niveau_6	choix_niveau_etude
    And saisis "44792" dans le champ "champ_numero_pv"
    When clique	bouton_valider
    And pause	5s
    And appuyer sur entrer


    And charge image	Module_eleves
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "ZONGO" dans le champ "champ_nom"
    And saisis "Franck" dans le champ "champ_prenom"
    And saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    And saisis "55060606" dans le champ "champ_telephone_eleve"
    And saisis "07/03/2015" dans le champ "champ_date_de_naissance"
    When clique	bouton_suivant
    And saisis "SAWADOGO" dans le champ "champ_nom_mere"
    And saisis "Jessica" dans le champ "champ_prenom_mere"
    And saisis "Robert" dans le champ "champ_prenom_pere"
    And saisis "76691271" dans le champ "champ_telephone_parent"
    When clique	bouton_suivant
    And choisis option	option_eleve_officiel	choix_mode_recrutement
    And choisis option	option_niveau_6	choix_niveau_etude
    And saisis "44793" dans le champ "champ_numero_pv"
    When clique	bouton_valider
    And pause	5s
    And appuyer sur entrer


    And charge image	Module_eleves
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "KABORE" dans le champ "champ_nom"
    And saisis "Wendyam" dans le champ "champ_prenom"
    And saisis "Ouagadougou" dans le champ "champ_lieu_naissance"
    And saisis "55070707" dans le champ "champ_telephone_eleve"
    And saisis "07/04/2015" dans le champ "champ_date_de_naissance"
    When clique	bouton_suivant
    And saisis "SOULAMA" dans le champ "champ_nom_mere"
    And saisis "Debora" dans le champ "champ_prenom_mere"
    And saisis "Desiré" dans le champ "champ_prenom_pere"
    And saisis "76691272" dans le champ "champ_telephone_parent"
    When clique	bouton_suivant
    And choisis option	option_eleve_officiel	choix_mode_recrutement
    And choisis option	option_niveau_6	choix_niveau_etude
    And saisis "44794" dans le champ "champ_numero_pv"
    When clique	bouton_valider
    And pause	5s
    And appuyer sur entrer


    And charge image	Module_eleves
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "BIRBA" dans le champ "champ_nom"
    And saisis "Emmanuel" dans le champ "champ_prenom"
    And saisis "Dedougou" dans le champ "champ_lieu_naissance"
    And saisis "55070707" dans le champ "champ_telephone_eleve"
    And saisis "07/05/2016" dans le champ "champ_date_de_naissance"
    When clique	bouton_suivant
    And saisis "BIRBA" dans le champ "champ_nom_mere"
    And saisis "Sephora" dans le champ "champ_prenom_mere"
    And saisis "Lucas" dans le champ "champ_prenom_pere"
    And saisis "76691273" dans le champ "champ_telephone_parent"
    When clique	bouton_suivant
    And choisis option	option_eleve_officiel	choix_mode_recrutement
    And choisis option	option_niveau_6	choix_niveau_etude
    And saisis "44795" dans le champ "champ_numero_pv"
    When clique	bouton_valider
    And pause	5s
    And appuyer sur entrer


    And charge image	Module_eleves
    And selectionne le sous module	Inscription	bouton_inscription
    And selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    And saisis "OUEDRAOGO" dans le champ "champ_nom"
    And saisis "Richard" dans le champ "champ_prenom"
    And saisis "Ouahigouya" dans le champ "champ_lieu_naissance"
    And saisis "55080808" dans le champ "champ_telephone_eleve"
    And saisis "07/06/2015" dans le champ "champ_date_de_naissance"
    When clique	bouton_suivant
    And saisis "KABORE" dans le champ "champ_nom_mere"
    And saisis "Adonija" dans le champ "champ_prenom_mere"
    And saisis "Florian Christian" dans le champ "champ_prenom_pere"
    And saisis "76691274" dans le champ "champ_telephone_parent"
    When clique	bouton_suivant
    And choisis option	option_eleve_officiel	choix_mode_recrutement
    And choisis option	option_niveau_6	choix_niveau_etude
    And saisis "44796" dans le champ "champ_numero_pv"
    When clique	bouton_valider
    And pause	5s
    And appuyer sur entrer

    When connexion bd
    and generer resultat obtenu    ${REQUETE}    ${OBTENU}
    Then deconnexion bd
    And comparer resultats    ${OBTENU}        ${ATTENDU}
    And arrete pgetab

*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images  
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_Inscription${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_Inscription${/}resultat_attendu.json
${REQUETE}     
...            SELECT
...                e.NOM_ELV,
...                e.PRENOM_ELV,
...                e.LIEU_NAIS_ELV,
...                e.PRNM_PERE_ELV,
...                an.LIB_SCOLAIR AS ANNEE_SCOLAIRE,
...                cl.LIB_CLASSE  AS CLASSE
...            FROM el_eleve e
...            JOIN el_inscription i   ON i.ID_ELEVE = e.ID_ELEVE
...            JOIN pa_annee_scolaire an ON an.ID_AN_SCOLAIRE = i.ID_AN_SCOLAIRE
...            JOIN pa_classe cl       ON cl.ID_CLASSE = i.ID_CLASSE;

*** Test Cases ***
Inscription Eleve
    [Documentation]    Automatisation Cas de test Inscription Eleve
    execution dump    CONFIG_BASE.sql
    lance pgetab
    pause	10s
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluations	bouton_evaluations
    selectionne le module	Eleves	bouton_eleve
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "CAMARA" dans le champ "champ_nom"
    saisis "Rahim" dans le champ "champ_prenom"
    saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    saisis "55250025" dans le champ "champ_telephone_eleve"
    saisis "07/12/2015" dans le champ "champ_date_de_naissance"
    clique	bouton_dispenser
    clique	bouton_suivant
    saisis "TRAORE" dans le champ "champ_nom_mere"
    saisis "Abi" dans le champ "champ_prenom_mere"
    saisis "Souleymane" dans le champ "champ_prenom_pere"
    saisis "76691268" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_6	choix_niveau_etude
    saisis "44790" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer

    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "BAZONGO" dans le champ "champ_nom"
    saisis "Alicia" dans le champ "champ_prenom"
    saisis "Mangodara" dans le champ "champ_lieu_naissance"
    saisis "55010101" dans le champ "champ_telephone_eleve"
    choisis option    option_sexe_feminin	choix_sexe
    saisis "07/01/2015" dans le champ "champ_date_de_naissance"
    clique	bouton_dispenser
    clique	bouton_suivant
    saisis "TRAORE" dans le champ "champ_nom_mere"
    saisis "Abi" dans le champ "champ_prenom_mere"
    saisis "Hernes" dans le champ "champ_prenom_pere"
    saisis "76691269" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_6	choix_niveau_etude
    saisis "44791" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer

    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "OUEDRAOGO" dans le champ "champ_nom"
    saisis "Stefi" dans le champ "champ_prenom"
    saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    saisis "55050505" dans le champ "champ_telephone_eleve"
    choisis option    option_sexe_feminin	choix_sexe
    saisis "07/02/2015" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "Tapsoba" dans le champ "champ_nom_mere"
    saisis "Ines" dans le champ "champ_prenom_mere"
    saisis "Steve" dans le champ "champ_prenom_pere"
    saisis "76691270" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_6	choix_niveau_etude
    saisis "44792" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer


    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "ZONGO" dans le champ "champ_nom"
    saisis "Franck" dans le champ "champ_prenom"
    saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    saisis "55060606" dans le champ "champ_telephone_eleve"
    saisis "07/03/2015" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "SAWADOGO" dans le champ "champ_nom_mere"
    saisis "Jessica" dans le champ "champ_prenom_mere"
    saisis "Robert" dans le champ "champ_prenom_pere"
    saisis "76691271" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_6	choix_niveau_etude
    saisis "44793" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer


    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "KABORE" dans le champ "champ_nom"
    saisis "Wendyam" dans le champ "champ_prenom"
    saisis "Ouagadougou" dans le champ "champ_lieu_naissance"
    saisis "55070707" dans le champ "champ_telephone_eleve"
    saisis "07/04/2015" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "SOULAMA" dans le champ "champ_nom_mere"
    saisis "Debora" dans le champ "champ_prenom_mere"
    saisis "Desiré" dans le champ "champ_prenom_pere"
    saisis "76691272" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_6	choix_niveau_etude
    saisis "44794" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer


    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "BIRBA" dans le champ "champ_nom"
    saisis "Emmanuel" dans le champ "champ_prenom"
    saisis "Dedougou" dans le champ "champ_lieu_naissance"
    saisis "55070707" dans le champ "champ_telephone_eleve"
    saisis "07/05/2016" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "BIRBA" dans le champ "champ_nom_mere"
    saisis "Sephora" dans le champ "champ_prenom_mere"
    saisis "Lucas" dans le champ "champ_prenom_pere"
    saisis "76691273" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_6	choix_niveau_etude
    saisis "44795" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer


    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "OUEDRAOGO" dans le champ "champ_nom"
    saisis "Richard" dans le champ "champ_prenom"
    saisis "Ouahigouya" dans le champ "champ_lieu_naissance"
    saisis "55080808" dans le champ "champ_telephone_eleve"
    saisis "07/06/2015" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "KABORE" dans le champ "champ_nom_mere"
    saisis "Adonija" dans le champ "champ_prenom_mere"
    saisis "Florian Christian" dans le champ "champ_prenom_pere"
    saisis "76691274" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_6	choix_niveau_etude
    saisis "44796" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer

    #incription pour classe periode semestre
    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "NIKIEMA" dans le champ "champ_nom"
    saisis "Yve" dans le champ "champ_prenom"
    saisis "OUAGADOUGOU" dans le champ "champ_lieu_naissance"
    saisis "55080808" dans le champ "champ_telephone_eleve"
    saisis "07/06/2010" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "NIKIEMA" dans le champ "champ_nom_mere"
    saisis "Fatou" dans le champ "champ_prenom_mere"
    saisis "Paul" dans le champ "champ_prenom_pere"
    saisis "76691275" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_2	choix_niveau_etude
    saisis "44797" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer


    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "ZERBO" dans le champ "champ_nom"
    saisis "Morija" dans le champ "champ_prenom"
    saisis "Ouahigouya" dans le champ "champ_lieu_naissance"
    saisis "55080808" dans le champ "champ_telephone_eleve"
    choisis option    option_sexe_feminin	choix_sexe
    saisis "10/05/2010" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "COMPAORE" dans le champ "champ_nom_mere"
    saisis "Leila" dans le champ "champ_prenom_mere"
    saisis "Abraham" dans le champ "champ_prenom_pere"
    saisis "76691276" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_2	choix_niveau_etude
    saisis "44798" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer


    charge image	Module_eleves
    selectionne le sous module	Inscription	bouton_inscription
    selectionne le sous sous module	Inscription_individuelle	bouton_inscription_individuelle
    saisis "TRAORE" dans le champ "champ_nom"
    saisis "Amina" dans le champ "champ_prenom"
    saisis "Bobo Dioulasso" dans le champ "champ_lieu_naissance"
    saisis "55080808" dans le champ "champ_telephone_eleve"
    choisis option    option_sexe_feminin	choix_sexe
    saisis "07/07/2010" dans le champ "champ_date_de_naissance"
    clique	bouton_suivant
    saisis "SANON" dans le champ "champ_nom_mere"
    saisis "Jessica" dans le champ "champ_prenom_mere"
    saisis "Eric" dans le champ "champ_prenom_pere"
    saisis "76691277" dans le champ "champ_telephone_parent"
    clique	bouton_suivant
    choisis option	option_eleve_officiel	choix_mode_recrutement
    choisis option	option_niveau_2	choix_niveau_etude
    saisis "44799" dans le champ "champ_numero_pv"
    clique	bouton_valider
    pause	1s
    appuyer sur entrer    

    arrete pgetab
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}

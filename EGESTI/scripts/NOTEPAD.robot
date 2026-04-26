*** Settings ***
Library           PywinautoLibrary

*** Test Cases ***
Open Notepad, Type Text, Save and Close
    Launch Application    notepad.exe
    Get Dialog From Regex    Sans titre

    Type Text    Edit    Hello, World!

    Menu Select    Fichier->&Enregistrer sous...
    Get Dialog    Enregistrer sous
    Type Text    edit1    autom_win11.txt
    Click    Enregistrer
    
    Get Dialog From Regex    autom_win11
    Menu Select    Fichier->&Quitter

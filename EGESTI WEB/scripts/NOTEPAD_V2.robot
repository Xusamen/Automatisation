*** Settings ***
Library           PywinautoLibrary

*** Test Cases ***
Open Notepad, Type Text, Save and Close
    Launch Application    notepad.exe
    Sleep    2s
    Get Dialog From Regex    .*Sans titre.*
    Type Text    Edit    Hello, World!
    Send Keys    ^s
    Sleep    3s
    Get Dialog From Regex    .*Enregistrer sous.*|.*Save As.*
    Sleep    1s
    Type Text    Edit1    autom_win10.txt
    Click    Enregistrer
    Sleep    2s
    Get Dialog From Regex    .*autom_win10.*
    Menu Select    Fichier->Quitter
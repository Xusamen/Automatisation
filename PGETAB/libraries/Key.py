import pyautogui
from robot.api.deco import keyword

class Key:

    ROBOT_LIBRARY_SCOPE = "TEST CASE"

    @keyword("selectionne tout")
    def tout_selectionner(self):
        """Fait Ctrl+A pour sélectionner tout le contenu du champ actif."""
        pyautogui.hotkey('ctrl', 'a')

    @keyword("copie selection")
    def copier_selection(self):
        pyautogui.hotkey('ctrl', 'c')

    @keyword("colle")
    def coller(self):
        pyautogui.hotkey('ctrl', 'v')

    @keyword("supprime selection")
    def supprimer_selection(self):
        """Supprime le contenu sélectionné."""
        pyautogui.press('delete')

    @keyword("vider champ")
    def vider_champ(self):
        pyautogui.hotkey('ctrl', 'a')
        pyautogui.press('delete')

    @keyword("active majuscule")
    def activer_majuscule(self):
        pyautogui.press('capslock')

    @keyword("desactive majuscule")
    def desactiver_majuscule(self):
        pyautogui.press('capslock')

    @keyword("saisis en majuscule")
    def saisir_en_majuscule(self, texte):
        """Saisit en majuscules sans toucher au Caps Lock."""
        pyautogui.typewrite(texte.upper(), interval=0.05)
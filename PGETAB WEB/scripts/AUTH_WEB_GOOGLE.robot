*** Settings ***
Library    Browser

*** Test Cases ***
Test Google
    New Browser    chromium    headless=False
    New Page    https://google.com
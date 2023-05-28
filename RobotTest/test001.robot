*** Settings ***
Library  SeleniumLibrary
#Suite Setup    Set Selenium Speed   0.5

*** Variables ***
${URL}  https://pl.wikipedia.org/wiki/Wikipedia:Strona_g%C5%82%C3%B3wna
${BROWSER}  Chrome
${LOGIN_ID}  id:pt-login-2


*** Keywords ***
Login In Wikipedia
    [Arguments]   ${LOGIN}  ${WIKI_PASS}
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Click Element   ${LOGIN_ID}
    Input Text      id:wpName1  ${LOGIN}
    Input Password      id:wpPassword1  ${WIKI_PASS}
    Select Checkbox  id:wpRemember
    Click Button     id:wpLoginAttempt

*** Test Cases ***
MyFirtstTest
    [Documentation]  First test
    ${LOGIN}  set variable  Wiesior
    ${WIKI_PASS}  set variable  \#Z3NQhsPApwBT.3
    Login In Wikipedia  ${LOGIN}  ${WIKI_PASS}
    Input Text       xpath://input[@title='Przeszukaj Wikipedię [alt-shift-f]']  BVB
    Press Keys       xpath://input[@title='Przeszukaj Wikipedię [alt-shift-f]']  RETURN
    Capture Page Screenshot  screenshot.png
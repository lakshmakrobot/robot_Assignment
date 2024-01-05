*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Suite Setup    Open Browser    https://the-internet.herokuapp.com/key_presses    Chrome
Suite Teardown    Close Browser


*** Test Cases ***
Press Tab key
    Press Keys    id=target    TAB
    ${enter_tab_text}=    Get Text     xpath=//p[@id='result']
    Should Be Equal    ${enter_tab_text}    You entered: TAB
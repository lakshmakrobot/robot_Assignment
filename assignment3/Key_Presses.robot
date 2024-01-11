*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser


*** Test Cases ***
Press Tab key
    Go To    https://the-internet.herokuapp.com/key_presses
    Press Keys    id=target    TAB
    ${enter_tab_text}=    Get Text     xpath=//p[@id='result']
    Should Be Equal    ${enter_tab_text}    You entered: TAB
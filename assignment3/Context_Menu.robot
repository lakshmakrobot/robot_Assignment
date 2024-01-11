*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Test Cases ***
Right Click And Assert Text In Prompt
    Go To    https://the-internet.herokuapp.com/context_menu
    ${element_box}=    Set Variable    xpath=//div[@id='hot-spot']
    Wait Until Element Is Visible    ${element_box}
    Open Context Menu    ${element_box}
    Sleep    1
    ${alert_prompt_txt}=    Handle Alert
    Should Be Equal    ${alert_prompt_txt}    You selected a context menu

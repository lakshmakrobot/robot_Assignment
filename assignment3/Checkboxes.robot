*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Test Cases ***
Verify Checkbox Is Checked
    Go To    https://the-internet.herokuapp.com/checkboxes
    ${checkbox1}=    Set Variable    xpath=//input[@type='checkbox'][1]
    Click Element    ${checkbox1}
    Checkbox Should Be Selected    ${checkbox1}

Verify Checkbox Is Unchecked
    ${checkbox2}=    Set Variable    xpath=//input[@type='checkbox'][2]
    Click Element    ${checkbox2}
    Checkbox Should Not Be Selected    ${checkbox2}


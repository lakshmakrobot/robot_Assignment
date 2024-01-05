*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Suite Setup    Open Browser    https://the-internet.herokuapp.com/checkboxes    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Verify Checkbox Is Checked
    ${checkbox1}=    Set Variable    xpath=//input[@type='checkbox'][1]
    Click Element    ${checkbox1}
    Checkbox Should Be Selected    ${checkbox1}

Verify Checkbox Is Unchecked
    ${checkbox2}=    Set Variable    xpath=//input[@type='checkbox'][2]
    Click Element    ${checkbox2}
    Checkbox Should Not Be Selected    ${checkbox2}


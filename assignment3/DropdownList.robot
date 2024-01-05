*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Suite Setup    Open Browser    https://the-internet.herokuapp.com/dropdown    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Select Option2 from dropdown
    ${dropdown_locator}=    Set Variable    id=dropdown
    Select From List By Index    ${dropdown_locator}    2

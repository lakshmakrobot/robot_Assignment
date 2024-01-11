*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Test Cases ***
Select Option2 from dropdown
    Go To    https://the-internet.herokuapp.com/dropdown
    ${dropdown_locator}=    Set Variable    id=dropdown
    Select From List By Index    ${dropdown_locator}    2

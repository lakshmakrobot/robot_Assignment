*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser


*** Test Cases ***
Login Page
    Go To    https://the-internet.herokuapp.com/login
    Input Text    id=username    tomsmith
    Input Text    id=password    SuperSecretPassword!
    Click Button    xpath=//button[@type='submit']

Assert Login
    ${login_text}=    Get Text    //div[@id='flash']
    Should Contain    ${login_text}    You logged into a secure area!

Logout And Assert 
    Click Element    xpath=//a[contains(@href ,'logout')]
    ${login_out}=    Get Text    //div[@id='flash']
    Should Contain    ${login_out}    You logged out of the secure area
   
*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Suite Setup    Open Browser    https://the-internet.herokuapp.com/login    Chrome
Suite Teardown    Close Browser


*** Test Cases ***
Login Page
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

    
    
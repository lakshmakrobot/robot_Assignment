*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser


*** Test Cases ***
Hover And Assert first User
    Go To    https://the-internet.herokuapp.com/hovers
    Mouse Over    xpath=//div[@class='figure'][1]
    ${hover_text}=    Get Text    xpath=(//div[@class='figcaption']//h5)[1]
    Should Be Equal    ${hover_text}    name: user1
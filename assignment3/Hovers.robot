*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Suite Setup    Open Browser    https://the-internet.herokuapp.com/hovers    Chrome
Suite Teardown    Close Browser


*** Test Cases ***
Hover And Assert first User
    Mouse Over    xpath=//div[@class='figure'][1]
    ${hover_text}=    Get Text    xpath=(//div[@class='figcaption']//h5)[1]
    Should Be Equal    ${hover_text}    name: user1
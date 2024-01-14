*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${url}    https://the-internet.herokuapp.com/infinite_scroll

*** Test Cases ***
Scroll the Page 10 Times 
    Go To   ${url}
    ${counter}=    Set Variable    1
    WHILE     ${counter} < 11
       Scroll Page Down    500
       Wait Until Keyword Succeeds    20s    1s    Element Should Be Visible    xpath=//div[@class='jscroll-added'] [${counter}]
       ${counter}=    Evaluate    ${counter}+1
    END
    
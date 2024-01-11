*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://www.google.com/
${TextToEnter}    ai will take over the world
${GLOBAL_TIMEOUT}    10s


*** Test Cases ***
Assert First Link On Google Search
    Go To    ${URL}    
    Input Text      xpath=//textarea[@title='Search']    ${TextToEnter}
    Wait And Click    xpath=//div[@role = 'presentation']//li[@role = 'presentation'][1]
    Wait And Click     xpath=(//*[@id='Odp5De']//a)[1]
    ${current_browser_link}=    Get Location
    Should Contain     ${current_browser_link}    https://www.techbusinessnews.com.au/opinion/could-artificial-intelligence-take-over-the-world
    ${link_title}=     Get Title
    Should Contain    ${link_title}    Will AI - Artificial Intelligence Take Over The World? - Tech Business News
    Close Browser

*** Keywords ***
Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}
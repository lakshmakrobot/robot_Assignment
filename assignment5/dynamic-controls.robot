*** Settings ***
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${url}    https://the-internet.herokuapp.com/dynamic_controls

*** Test Cases ***
Click the remove button and assert checkbox is removed
    Go To    ${url}
    Click Element    xpath=//form[@id='checkbox-example']/button
    Wait Until element is displayed    xpath=//p[@id='message']
    ${its_gone_text}=    Get Text    xpath=//p[@id='message']
    Should Be Equal As Strings    ${its_gone_text}    It's gone!

Click Enable button and enter text in Input Box and take screenshot
    Click Element    xpath=//form[@id='input-example']/button
    Wait Until element is displayed    xpath=//form[@id='input-example']//p[@id='message']
    ${its_enabled_text}=    Get Text    xpath=//form[@id='input-example']//p[@id='message']
    Should Be Equal As Strings    ${its_enabled_text}    It's enabled!
    Input Text    xpath=//form[@id='input-example']//input[@type='text']    HELLO
    Capture Page Screenshot    hello.png

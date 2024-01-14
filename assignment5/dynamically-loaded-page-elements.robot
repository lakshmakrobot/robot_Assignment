*** Settings ***
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${url}    https://the-internet.herokuapp.com/dynamic_loading/1

*** Test Cases ***
Click Start And Assert Hello World Text
    Go To    ${url}
    Click Button    xpath=//div[@id='start']/button
    Wait Until element is displayed    xpath=//div[@id='finish']/h4
    ${hello_world_text}    Get Text    xpath=//div[@id='finish']/h4
    Should Be Equal As Strings    ${hello_world_text}    Hello World!
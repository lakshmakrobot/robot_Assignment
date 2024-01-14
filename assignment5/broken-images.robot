*** Settings ***
Library    RequestsLibrary
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${url}    https://the-internet.herokuapp.com/broken_images

*** Test Cases ***
Assert Images Are Loaded
    Go To    ${url}
    @{img_elements}    Get WebElements    xpath=//div[@id='content']//img
    ${img_elements_length}    Evaluate    len($img_elements)
    Create Session    img-session    ${url}
    FOR    ${element_index}    IN RANGE    1   ${img_elements_length}+1
        ${img src}=    Get element attribute      xpath=//div[@id='content']//img [${element_index}]    src
        ${response}    Run Keyword And Ignore Error    GET On Session    img-session    ${img src}
        Run Keyword And Continue On Failure    Should Be Equal    ${response}[0]    PASS    Image is rendered
    END

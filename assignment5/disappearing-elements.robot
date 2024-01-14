*** Settings ***
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${url}    https://the-internet.herokuapp.com/disappearing_elements


*** Test Cases ***
Reload untill gallery element is not visible
    Go To    ${url}
    ${gallery_element_status}=   Set Variable     PASS
    WHILE    '${gallery_element_status}' != 'FAIL'
        Reload Page
        ${gallery_element}=     Run Keyword And Ignore Error   Element Should Not Be Visible    xpath=//a[text()='Gallery'] 
        ${gallery_element_status}=    Set Variable    ${Gallery_element}[0]    
    END
 



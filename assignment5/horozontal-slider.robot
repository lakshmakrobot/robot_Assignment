*** Settings ***
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${url}    https://the-internet.herokuapp.com/horizontal_slider
${slider_value}    0

*** Test Cases ***
Horizonal Slider check 
    Go To    ${url}
    Click Element    xpath=//input[@type='range']
    ${slider_value}=    Get Slider text    xpath=//span[@id='range']            
 
    
    # the browser starts with the slider value 3 since setting the value to zero first and runing while loop again
    WHILE     ${slider_value} > 0
        Press Keys   None    LEFT
        ${slider_value}=    Get Slider text    xpath=//span[@id='range']            
    END

    WHILE     ${slider_value} < 5
        Press Keys   None    RIGHT   
        ${slider_value}=    Get Slider text    xpath=//span[@id='range']            
    END




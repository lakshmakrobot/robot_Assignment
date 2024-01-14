*** Settings ***
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${url}    https://the-internet.herokuapp.com/tables

*** Test Cases ***
Sort Table By email
    Go To    ${url}
    Click Element     xpath=//table[@id='table1']//th[@class='header']//span[text()='Email']
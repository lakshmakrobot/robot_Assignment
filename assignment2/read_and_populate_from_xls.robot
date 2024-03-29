*** Settings ***
Library           SeleniumLibrary
Library           ${CURDIR}/../py_resource/get_row_data.py
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser
*** Variables ***
${URL}    https://rpachallenge.com/
${GLOBAL_TIMEOUT}  10s
${file_path}    ${CURDIR}${/}../data_folder/challenge.xlsx
${sheet_name}   Sheet1


*** Test Cases ***
Enter Employee Details 
    Start Browser
    FOR    ${index}    IN RANGE    2    12
        @{output}=    Read Excel Row    ${file_path}    ${sheet_name}    ${index}
        Fill Form Website   ${output[0]}    ${output[1]}    ${output[2]}    ${output[3]}    ${output[4]}    ${output[5]}    ${output[6]}
    END

*** Keywords ***
Start Browser
    Go To    ${URL}    
    Maximize Browser Window
    Scroll Element Into View    xpath=//button[text()='Start']
    Click Button    xpath=//button[text()='Start']

Fill Form Website
    [Arguments]     ${first_name}      ${last_name}      ${company_name}      ${role}      ${address}      ${email}      ${phone_number}
    Input Text      xpath=//input[@ng-reflect-name='labelFirstName']    ${first_name}
    Input Text      xpath=//input[@ng-reflect-name='labelLastName']     ${last_name}
    Input Text      xpath=//input[@ng-reflect-name='labelCompanyName']  ${company_name}
    Input Text      xpath=//input[@ng-reflect-name='labelRole']          ${role}
    Input Text      xpath=//input[@ng-reflect-name='labelAddress']       ${address}
    Input Text      xpath=//input[@ng-reflect-name='labelEmail']         ${email}
    Input Text      xpath=//input[@ng-reflect-name='labelPhone']   ${phone_number}
    Click Element   xpath=//input[@value='Submit']
    
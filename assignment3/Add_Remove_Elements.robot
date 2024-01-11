*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser


*** Test Cases ***
Add Element twice And Assert
    Go To    https://the-internet.herokuapp.com/add_remove_elements/
    ${add_button}    Set Variable    //button[text()='Add Element']

    FOR    ${index}    IN RANGE    2
        Click Button    ${add_button}
    END

    ${delete_btn}=    Get WebElements    //div[@id='elements']/button
    ${del_btn_count}=    Get Length    ${delete_btn}
    Should Be Equal As Numbers    ${del_btn_count}    2

Delete button And Assert
    ${del_button}    Set Variable    //div[@id='elements']/button
    Click Button    ${del_button}
    ${delete_btn}=    Get WebElements    ${del_button}
    ${del_btn_count}=    Get Length    ${delete_btn}
    Should Be Equal As Numbers    ${del_btn_count}    1

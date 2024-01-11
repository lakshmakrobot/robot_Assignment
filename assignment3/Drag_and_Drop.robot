*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser


*** Test Cases ***
Swap Boxs and Take Screenshot
    Go To    https://the-internet.herokuapp.com/drag_and_drop
    Drag And Drop    id=column-a    id=column-b
    Capture Page Screenshot    screenshot.png
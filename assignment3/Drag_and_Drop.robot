*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Suite Setup    Open Browser    https://the-internet.herokuapp.com/drag_and_drop    Chrome
Suite Teardown    Close Browser


*** Test Cases ***
Swap Boxs and Take Screenshot
    Drag And Drop    id=column-a    id=column-b
    Capture Page Screenshot    screenshot.png
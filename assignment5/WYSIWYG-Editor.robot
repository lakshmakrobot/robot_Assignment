*** Settings ***
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser


*** Variables ***
${url}    https://the-internet.herokuapp.com/tinymce

*** Test Cases ***
Replace text with Al rules
    Go To    ${url}
    Select Frame    id=mce_0_ifr
    Execute JavaScript    document.body.innerHTML = ''
    Execute JavaScript    document.body.innerHTML += 'AI Rules'
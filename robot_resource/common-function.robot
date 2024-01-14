*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    RequestsLibrary

*** Variables ***
${hub_url}    127.0.0.1
${GLOBAL_TIMEOUT}    20s

*** Keywords ***
Browser Setup
    ${dc}=    Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities()    sys, selenium.webdriver
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --enable-notifications
    Call Method    ${chrome_options}    add_argument    --window-size\=1360,768
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --allow-insecure-localhost
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ${dc}=    Call Method    ${chrome_options}    to_capabilities
    ${selenoid_args}     Create Dictionary     enableVNC=${True}    name=${SUITE NAME}
    Set To Dictionary    ${dc}    selenoid:options    ${selenoid_args}
    Log    ${dc}
    Create Webdriver    Remote    command_executor=http://${hub_url}:4444/wd/hub    desired_capabilities=${dc}
    Set Selenium Speed    0.1
    Run Keyword and Ignore Error    Maximize Browser Window

Scroll Page Down
    [Arguments]    ${pixels}
    Execute JavaScript    window.scrollBy(0, ${pixels});

Get Slider text
    [Arguments]    ${element_path}
    ${slider_value_txt}=    Get Text    ${element_path}
    ${slider_value}=    Convert To Number    ${slider_value_txt}
    [Return]    ${slider_value}


Wait Until element is displayed
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    ${xpath}    20s


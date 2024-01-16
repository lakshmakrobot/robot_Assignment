*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    ${CURDIR}/../py_resource/create_addrows.py
Resource    ${CURDIR}${/}../KEYWORDS/common-function.robot
Resource    ${CURDIR}/../PAGE_OR/flipkart-OR.robot

*** Keywords ***
Navigate To Mobiles Section
    Click Element    ${mobiles_tab}

Apply Price and Apple Device filter
    [Arguments]    ${filter_price}
    Select From List by Value    ${filter-dropdown}    ${filter_price}
    Sleep    2s
    Click Element    ${apple_category}

Navigate To flipkart Website
    Go To    ${url}

Get Size of webelements 
    Sleep    1
    ${element_size}    Get WebElements    ${element_name}
    ${elements_length}    Evaluate    len($element_size)
    [Return]    ${elements_length}

Save Name Price Rating In Xls Sheet
    [Arguments]    ${sheet_name}    ${elements_length}
    Iterate Through All Elements And SAVE In xls    ${sheet_name}    ${elements_length}    ${element_name}    ${element_price}    ${element_rating}
    
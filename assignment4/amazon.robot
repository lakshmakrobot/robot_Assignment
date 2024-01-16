*** Settings ***
Resource    ${CURDIR}${/}../KEYWORDS/amazon-KEYWORDS.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${sheet_name}    amazon

*** Test Cases ***
Search For Iphone with 20000
    Navigate To Amazon Website
    Navigate To Mobiles Section
    Apply Price and Apple Device filter

Save Name Price Ratings
    ${element_size}    Get Size of webelements
    Save Name Price Rating In Xls Sheet    ${sheet_name}    ${element_size}

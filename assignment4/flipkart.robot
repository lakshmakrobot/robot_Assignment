*** Settings ***
Resource    ${CURDIR}${/}../KEYWORDS/flipkart-KEYWORDS.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${sheet_name}    flipkart
${price}    20000

*** Test Cases ***
Search For Iphone with 20000
    Navigate To flipkart Website
    Navigate To Mobiles Section
    Apply Price and Apple Device filter    ${price}
    

Save Name Price Ratings
    ${element_size}    Get Size of webelements 
    Save Name Price Rating In Xls Sheet    ${sheet_name}    ${element_size}
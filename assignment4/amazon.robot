*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    ${CURDIR}/../py_resource/create_addrows.py
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${xls-file}    ${CURDIR}${/}../data_folder/iphonedata.xlsx
${sheet_name}    amazon
${element_price}    (//span[@class = 'a-price-whole'])
${element_rating}    (//span[@class = 'a-size-base s-underline-text'])
${element_name}    (//span[@class = 'a-size-base-plus a-color-base a-text-normal'])

*** Test Cases ***
Search For Iphone with 20000
    Go To    https://www.amazon.in/
    Click Element    xpath=//a[contains(@href,'/mobile-phones')]
    Click Element    xpath=//li//span[text()='Over ₹20,000']
    Click Element    xpath=//li[@aria-label='Apple']//div
    

Get Name Price Ratings
    Sleep    1
    ${element_size}    Get WebElements    xpath=(//span[@class = 'a-size-base-plus a-color-base a-text-normal'])
    ${elements_length}    Evaluate    len($element_size)
    FOR    ${element_index}    IN RANGE    1   ${elements_length}
        ${element_name_text}    Get Text    ${element_name} [${element_index}]
        ${element_price_text}    Get Text    ${element_price} [${element_index}]
        ${element_rating_text}    Get Text    ${element_rating} [${element_index}]
        append rows    ${xls-file}    ${sheet_name}    ${element_name_text}    ${element_price_text}    ${element_rating_text}
    END

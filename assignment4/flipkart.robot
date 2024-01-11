*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    ${CURDIR}/../py_resource/create_addrows.py
Resource    ${CURDIR}${/}../robot_resource/common-function.robot
Suite Setup    Browser Setup
Suite Teardown    Close Browser

*** Variables ***
${xls-file}    ${CURDIR}${/}../data_folder/iphonedata.xlsx
${sheet_name}    flipkart
${element_price}    (//div[@class='_30jeq3 _1_WHN1'])
${element_rating}    (//span[@class='_2_R_DZ']//span/span[contains(text(),'Rating')])
${element_name}    (//div[@class='_4rR01T'])
${hub_url}    127.0.0.1

*** Test Cases ***
Search For Iphone with 20000
    Go To    https://www.flipkart.com/
    Click Element    xpath=//span[text()='Mobiles']
    Select From List by Value    (//select[@class ='_2YxCDZ'])[1]    20000
    Sleep    2s
    Click Element    //div[text()='APPLE']/..
    

Get Name Price Ratings
    Sleep    1
    ${element_size}    Get WebElements    xpath=(//div[@class='_4rR01T'])
    ${elements_length}    Evaluate    len($element_size)
    FOR    ${element_index}    IN RANGE    1   ${elements_length}
        ${element_name_text}    Get Text    ${element_name} [${element_index}]
        ${element_price_text}    Get Text    ${element_price} [${element_index}]
        ${element_rating_text}    Get Text    ${element_rating} [${element_index}]
        append rows    ${xls-file}    ${sheet_name}    ${element_name_text}    ${element_price_text}    ${element_rating_text}
    END
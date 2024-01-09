*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    /home/lakshman_k/rftest/robot_Assignment/assignment4/create_addrows.py
Suite Setup    Open Browser    https://www.flipkart.com/    Chrome
Suite Teardown    Close Browser

*** Variables ***
${xls-file}    /home/lakshman_k/rftest/robot_Assignment/assignment4/iphonedata.xlsx
${sheet_name}    flipkart
${element_price}    (//div[@class='_30jeq3 _1_WHN1'])
${element_rating}    (//span[@class='_2_R_DZ']//span/span[contains(text(),'Rating')])
${element_name}    (//div[@class='_4rR01T'])

*** Test Cases ***
Search For Iphone with 20000
    Click Element    xpath=//span[text()='Mobiles']
    Select From List by Value    (//select[@class ='_2YxCDZ'])[1]    20000
    Click Element    //div[text()='APPLE']
    

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





        

        


    




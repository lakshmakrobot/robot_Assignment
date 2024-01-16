*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${element_price}    (//div[@class='_30jeq3 _1_WHN1'])
${element_rating}    (//span[@class='_2_R_DZ']//span/span[contains(text(),'Rating')])
${element_name}    (//div[@class='_4rR01T'])
${mobiles_tab}      //span[contains(text(),'Mobiles')]
${filter-dropdown}    (//select[@class ='_2YxCDZ'])[1]
${apple_category}    //div[text()='APPLE']/..
${url}    https://www.flipkart.com/

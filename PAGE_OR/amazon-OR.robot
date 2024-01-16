*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${element_price}    (//span[@class = 'a-price-whole'])
${element_rating}    (//span[@class = 'a-size-base s-underline-text'])
${element_name}    (//span[@class = 'a-size-base-plus a-color-base a-text-normal'])
${mobiles_tab}    //a[contains(@href,'/mobile-phones')]
${filter-20000}    //li//span[text()='Over ₹20,000']
${apple_category}    //li[@aria-label='Apple']//div
${url}    https://www.amazon.in/

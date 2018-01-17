*** Settings ***
Library           Selenium2Library

*** Variables ***
${Homepage.Electronic Device Category Menu Link}    id=Level_1_Category_No1
${Homepage.Mobile Sub Category Menu Link}    link=โทรศัพท์มือถือ

*** Keywords ***
Goto mobile product list page
    Click Element    ${Homepage.Electronic Device Category Menu Link}
    Wait Until Element Is Visible    ${Homepage.Mobile Sub Category Menu Link}
    Click Link    ${Homepage.Mobile Sub Category Menu Link}

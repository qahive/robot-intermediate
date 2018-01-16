*** Settings ***
Library           Selenium2Library

*** Keywords ***
Goto mobile product list page
    Click Element    id=Level_1_Category_No1
    Wait Until Element Is Visible    link=โทรศัพท์มือถือ
    Click Link    link=โทรศัพท์มือถือ

Add product by index to cart
    [Arguments]    ${product index}
    Mouse Over    css=div[data-qa-locator="product-item"]:nth-of-type(${product index})
    Click Button    css=div[data-qa-locator="product-item"]:nth-of-type(${product index}) button
    Wait Until Element Is Visible    css=button.ant-modal-close
    Click Button    css=button.ant-modal-close
    Wait Until Page Does Not Contain Element    css=button.ant-modal-close
    Sleep    5 seconds

Verify total number of product in cart
    [Arguments]    ${total item}
    ${item in cart} =    Get Text    id=topActionCartNumber
    Should Be Equal    ${total item}    ${item in cart}

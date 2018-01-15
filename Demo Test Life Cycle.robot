*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Add sigle item to cart
    Open Browser    https://www.lazada.co.th/    browser=chrome
    Maximize Browser Window
    Sleep    3 seconds
    Click Element    id=Level_1_Category_No1
    Wait Until Element Is Visible    css=li[data-cate="cate_1_9"]
    Click Element    css=li[data-cate="cate_1_9"]
    Mouse Over    css=div[data-qa-locator="product-item"]:nth-of-type(1)
    Click Button    css=div[data-qa-locator="product-item"]:nth-of-type(1) button
    Wait Until Element Is Visible    css=button.ant-modal-close
    Click Button    css=button.ant-modal-close
    Wait Until Page Does Not Contain Element    css=button.ant-modal-close
    Sleep    5 seconds
    ${item in cart} =    Get Text    id=topActionCartNumber
    Should Be Equal    1    ${item in cart}

Add multi item to cart
    Open Browser    https://www.lazada.co.th/    browser=chrome
    Maximize Browser Window
    Sleep    3 seconds
    Click Element    id=Level_1_Category_No1
    Wait Until Element Is Visible    css=li[data-cate="cate_1_9"]
    Click Element    css=li[data-cate="cate_1_9"]
    comment    Add item 1
    Mouse Over    css=div[data-qa-locator="product-item"]:nth-of-type(1)
    Click Element    css=div[data-qa-locator="product-item"]:nth-of-type(1) button
    Wait Until Element Is Visible    css=button.ant-modal-close
    Click Button    css=button.ant-modal-close
    Wait Until Page Does Not Contain Element    css=button.ant-modal-close
    comment    Add item 2
    Mouse Over    css=div[data-qa-locator="product-item"]:nth-of-type(2)
    Click Button    css=div[data-qa-locator="product-item"]:nth-of-type(2) button
    Wait Until Element Is Visible    css=button.ant-modal-close
    Click Button    css=button.ant-modal-close
    Wait Until Page Does Not Contain Element    css=button.ant-modal-close
    Sleep    5 seconds
    ${item in cart} =    Get Text    id=topActionCartNumber
    Should Be Equal    2    ${item in cart}

*** Keywords ***

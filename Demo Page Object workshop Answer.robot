*** Settings ***
Suite Setup       Test Suite Setup
Suite Teardown    Close All Browsers
Test Setup        Test Setup
Test Teardown     Test Teardown
Library           Selenium2Library
Resource          Resources/Homepage.robot
Resource          Resources/ProductListPage.robot

*** Test Cases ***
Add sigle item to cart
    Homepage.Goto mobile product list page
    ProductListPage.Add product by index to cart    1
    ProductListPage.Verify total number of product in cart    1

Add multi item to cart
    Homepage.Goto mobile product list page
    ProductListPage.Add product by index to cart    1
    ProductListPage.Add product by index to cart    2
    ProductListPage.Add product by index to cart    3
    ProductListPage.Verify total number of product in cart    3

*** Keywords ***
Test Suite Setup
    Open Browser    https://www.lazada.co.th/    browser=chrome
    Maximize Browser Window

Test Setup
    Go To    https://www.lazada.co.th/
    Sleep    3 seconds

Test Teardown
    Delete All Cookies

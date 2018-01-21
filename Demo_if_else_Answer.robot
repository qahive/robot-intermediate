*** Settings ***
Suite Setup       Test Suite Setup
Suite Teardown    Close All Browsers
Test Setup        Test Setup
Test Teardown     Test Teardown
Library           Selenium2Library
Resource          Resources/Homepage.robot
Resource          Resources/ProductListPage.robot

*** Test Cases ***
Demo if save screenshot
    Homepage.Goto mobile product list page
    ProductListPage.Add product by index to cart    1
    ProductListPage.Verify total number of product in cart    2

Demo product price validation
    Go To    https://www.lazada.co.th/#hp-just-for-you
    Validate product price    1

*** Keywords ***
Test Suite Setup
    Open Browser    https://www.lazada.co.th/    browser=chrome
    Maximize Browser Window

Test Setup
    Go To    https://www.lazada.co.th/
    Sleep    3 seconds

Test Teardown
    Run Keyword If Test Failed    Capture Page Screenshot
    Delete All Cookies

Validate product price
    [Arguments]    ${index}
    Wait Until Page Contains Element    xpath=(//*[@id="hp-just-for-you"]//a[@class="card-jfy-li-content"])[${index}]    30 seconds
    Comment    Validate regular price
    ${price first line} =     Get Text    xpath=(//*[@id="hp-just-for-you"]//a[@class="card-jfy-li-content"])[${index}]//div[@class="hp-mod-price-first-line"]/span[@class="price"]
    Should Be True    ${price first line} > 0
    Comment    Validate promo price
    ${found second price} =     Run Keyword And Return Status    Page Should Contain Element    xpath=(//*[@id="hp-just-for-you"]//a[@class="card-jfy-li-content"])[${index}]//div[@class="hp-mod-price-second-line"]//span[@class="price"]
    Return From Keyword If    ${found second price} == ${False}
    ${price second line} =     Get Text    xpath=(//*[@id="hp-just-for-you"]//a[@class="card-jfy-li-content"])[${index}]//div[@class="hp-mod-price-second-line"]//span[@class="price"]
    Should Be True    ${price second line} > ${price first line}

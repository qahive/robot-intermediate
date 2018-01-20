*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Demo Form Submit
    Open Browser    https://www.w3schools.com/html/html_forms.asp    browser=googlechrome
    Maximize Browser Window
    Input Text    css=div.w3-white > form > input[name=firstname]    John
    Input Text    css=div.w3-white > form > input[name=lastname]    Doe
    Click Element    css=div.w3-white > form > input[type=submit]
    Wait Until Keyword Succeeds    3x    5 seconds    Select Window    title=Forms action page
    ${submit value} =    Get Text    css=div.w3-container
    Should Contain    ${submit value}    firstname=John&lastname=Doe
    [Teardown]    Close All Browsers

Demo XPath ul and li
    Open Browser    http://getbootstrap.com/2.3.2/getting-started.html#contents    browser=googlechrome
    Maximize Browser Window
    ${component value} =     Get Text    xpath=//section[@id="contents"]//ul/li[2]
    Should Be Equal As Strings    Button dropdowns    ${component value}

Demo XPath table
    Open Browser    https://www.w3schools.com/html/html_tables.asp    browser=googlechrome
    Maximize Browser Window
    ${country} =     Get Text    xpath=//table[@id="customers"]/tbody/tr[2]/td[3]
    Should Be Equal As Strings    Germany    ${country}

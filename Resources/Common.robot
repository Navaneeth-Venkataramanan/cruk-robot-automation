*** Settings ***
Documentation     Common library across the entire test suite

Library    SeleniumLibrary    timeout=50    implicit_wait=30    run_on_failure=Take Screenshot

*** Variables ***
${chrome_browser}    chrome
${firefox_browser}    firefox
${link}    https://app.pws.int.cruk.org/support-us/your-donation
${accept_cookies_button}    xpath=//button[@id="onetrust-accept-btn-handler"]

*** Keywords ***

Begin Chrome Web Test
    [Documentation]    Test Setup opens a browser
    Open Browser    about:blank    ${chrome_browser}
    Maximize Browser Window

Begin Firefox Web Test
    [Documentation]    Test Setup opens a browser
    Open Browser    about:blank    ${firefox_browser}
    Maximize Browser Window

End Web Test
    [Documentation]    Closes the browser
    Close Browser

Go To CRUK Donations Page
     Go To    ${link}
     Accept cookies

Accept cookies
     Sleep    5s
     ${status} =    Run Keyword And Return Status    Wait Until Element Is Visible     ${accept_cookies_button}    timeout=30
     Run Keyword If      ${status}    Click Element   ${accept_cookies_button}
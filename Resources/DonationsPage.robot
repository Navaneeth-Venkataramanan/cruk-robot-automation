*** Settings ***
Documentation     Common library across the entire test suite
Library           SeleniumLibrary    timeout=30    run_on_failure=Take Screenshot
Library           String
Library           DateTime
Library           Collections

*** Variables ***
${donation_page_otheramount_input}    xpath=//input[@id="otherAmount"]
${donation_page_donation_type}    xpath=//div[@id='typeRadioGroup']//span[text()="DONATION TYPE"]//parent::label/div
${donation_page_motivation_dropdown}    xpath=//select[@name='motivation']
${donation_page_motivation_option}    xpath=//select[@name='motivation']/option[text()="MOTIVATION OPTION"]
${donation_page_donation_reason}    xpath=//span[text()="DONATION REASON"]//ancestor::label/input[@name="destinationRadioGroup"]//parent::label//div
${donation_page_cancer_type_dropdown}    xpath=//select[@aria-label='Select a cancer type or research area']
${donation_page_cancer_type}    xpath=//select[@aria-label='Select a cancer type or research area']/option[text()="CANCER TYPE"]
${donation_page_continue_button}    xpath=//span[text()="Continue"]//parent::button[@type='submit']
${donation_page_memoryname}    xpath=//*[@id="inMemoryName"]
${donation_page_forename}    xpath=//*[@id="forename"]
${donation_page_surname}    xpath=//*[@id="surname"]
${donation_page_email}    xpath=//*[@id="emailAddress"]
${donation_page_phonenumber}    xpath=//*[@id="phoneNumber"]
${donation_page_postalcode}    xpath=//*[@id="postalCode"]
${donation_page_find_address_button}    xpath=//span[text()="Find address"]//parent::button[@type='button']
${donation_page_select_address_dropdown}    xpath=//*[@id="addressSelection"]
${donation_page_address}    xpath=//select[@id='addressSelection']/option[text()="ADDRESS"]
${donation_page_payment_type}    xpath=//span[text()="PAYMENT OPTION"]//ancestor::label//div
${donation_page_card_holder_name}    xpath=//input[@id="cardholderName"]
${donation_page_card_number_label}    xpath=//div/h3[text()="Card number "]//parent::div//div[@id="card-number"]
${donation_page_card_number_iframe}    xpath=//iframe[@id='braintree-hosted-field-number']
${donation_page_card_number}    xpath=//input[@id="credit-card-number"]
${donation_page_card_expiry_date_label}    xpath=//div/h3[text()="Expiry date "]//parent::div//div[@id="card-expiration-date"]
${donation_page_card_expiry_date_iframe}    xpath=//iframe[@id='braintree-hosted-field-expirationDate']
${donation_page_card_expiry_date}    xpath=//input[@id="expiration"]
${donation_page_card_security_label}    xpath=//div/h3[text()="Security code "]//parent::div//div[@id="card-cvv"]
${donation_page_card_security_iframe}    xpath=//iframe[@id='braintree-hosted-field-cvv']
${donation_page_security}    xpath=//input[@id="cvv"]
${donation_page_contactus_radio}    xpath=//legend[text()="CONTACTUS TYPE"]//parent::fieldset//span[text()="CONTACTUS RADIO"]//parent::label//div[1]
${donation_page_reference_number}    xpath=//p[text()="Your reference number is "]/strong
${donation_page_continue_mydonation_button}    xpath=//button[@type="submit"]/span[contains(text(),'Complete my donation')]
${donation_page_gift_aid_checkbox}    xpath=//label[text()="Yes I would like Cancer Research UK to claim Gift Aid on my donation"]//parent::div

*** Keywords ***
Page Title Is
    [Arguments]    ${expected_page_title}
    ${actual_page_title}    Get Title
    Wait Until Keyword Succeeds    3x    5s    Title Should Be    ${actual_page_title}    ${expected_page_title}

Enter Donation Amount
    [Arguments]    ${donation_amount}
    Input Text    ${donation_page_otheramount_input}    ${donation_amount}

Select Donation Type
    [Arguments]    ${donation_type}
    ${donation_type_radio_button} =    Replace String   ${donation_page_donation_type}    DONATION TYPE    ${donation_type}
    Wait Until Element Is Visible    ${donation_type_radio_button}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation_type_radio_button}

Select Your Motivation
    [Arguments]    ${motivation_option}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation_page_motivation_dropdown}
    ${motivation} =    Replace String   ${donation_page_motivation_option}    MOTIVATION OPTION    ${motivation_option}
    Wait Until Element Is Visible    ${motivation}
    Run Keyword And Ignore Error    Scroll Element Into View    ${motivation}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${motivation}

Enter Motivation Reason
    [Arguments]    ${motivation_reason}
    Input Text    ${donation_page_memoryname}    ${motivation_reason}

Select Donation Reason
    [Arguments]    ${donation_reason}
    ${donation} =    Replace String   ${donation_page_donation_reason}    DONATION REASON    ${donation_reason}
    Wait Until Element Is Visible    ${donation}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation}

Select Cancer Type
    [Arguments]    ${cancer_type}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation_page_cancer_type_dropdown}
    ${cancertype} =    Replace String   ${donation_page_cancer_type}    CANCER TYPE    ${cancer_type}
    Wait Until Element Is Visible    ${cancertype}
    Run Keyword And Ignore Error    Scroll Element Into View    ${cancertype}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${cancertype}

Click Continue
    Wait Until Element is Visible    ${donation_page_continue_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_continue_button}
    Wait Until Keyword Succeeds    5x    10s    Click Element    ${donation_page_continue_button}

Select Address
    [Arguments]    ${address}
    Wait Until Element Is Visible    ${donation_page_select_address_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_select_address_dropdown}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation_page_select_address_dropdown}
    ${donar_address} =    Replace String   ${donation_page_address}    ADDRESS    ${address}
    Wait Until Element Is Visible    ${donar_address}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donar_address}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donar_address}

Enter Donor Details
    [Arguments]    ${forename}    ${surname}    ${email}    ${phonenumber}    ${postcode}    ${address}
    Wait Until Page Contains Element    ${donation_page_forename}
    Input Text    ${donation_page_forename}    ${forename}
    Input Text    ${donation_page_surname}    ${surname}
    Wait Until Page Contains Element    ${donation_page_email}
    Mouse Over    ${donation_page_email}
    Input Text    ${donation_page_email}    ${email}
    Wait Until Page Contains Element    ${donation_page_phonenumber}
    Mouse Over    ${donation_page_phonenumber}
    Input Text    ${donation_page_phonenumber}    ${phonenumber}
    Wait Until Page Contains Element    ${donation_page_postalcode}
    Mouse Over    ${donation_page_postalcode}
    Input Text    ${donation_page_postalcode}    ${postcode}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donar_address}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation_page_find_address_button}
    Select Address    ${address}

Select Contact Type
    [Arguments]   ${contactus_type}    ${contactus_radio}
    ${radio_button} =    Set Variable   ${donation_page_contactus_radio}
    ${radio_button} =    Replace String    ${radio_button}    CONTACTUS TYPE    ${contactus_type}
    ${radio_button} =    Replace String    ${radio_button}    CONTACTUS RADIO    ${contactus_radio}
    Run Keyword And Ignore Error    Scroll Element Into View    ${radio_button}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${radio_button}

Select Payment Type
    [Arguments]    ${payment_type}
    ${payment_option} =    Replace String   ${donation_page_payment_type}    PAYMENT OPTION    ${payment_type}
    Wait Until Element Is Visible    ${payment_option}
    Mouse Over    ${payment_option}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${payment_option}

Enter Card Details
    [Arguments]    ${cardholder_name}    ${card_number}    ${expiry_date}    ${security}
    Wait Until Page Contains Element    ${donation_page_card_holder_name}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_card_holder_name}
    Input Text    ${donation_page_card_holder_name}    ${cardholder_name}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_card_number_label}
    Select Frame    ${donation_page_card_number_iframe}
    Input Text    ${donation_page_card_number}    ${card_number}
    Unselect Frame
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_card_expiry_date_label}
    Select Frame    ${donation_page_card_expiry_date_iframe}
    Input Text    ${donation_page_card_expiry_date}    ${expiry_date}
    Unselect Frame
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_card_security_label}
    Select Frame    ${donation_page_card_security_iframe}
    Input Text    ${donation_page_security}    ${security}
    Unselect Frame

Select Gift Aid
    Wait Until Element is Visible    ${donation_page_gift_aid_checkbox}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_gift_aid_checkbox}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation_page_gift_aid_checkbox}

Click Continue My Donation
    Wait Until Element is Visible    ${donation_page_continue_mydonation_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${donation_page_continue_mydonation_button}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${donation_page_continue_mydonation_button}

Verify Successful Donation With Reference Number
    [Arguments]    ${expected_referenc_enumber}
    Wait Until Element Is Visible    ${donation_page_reference_number}
    ${actual_reference_number} =    Get Text    ${donation_page_reference_number}
    Wait Until Keyword Succeeds    3x    5s    Element Text Should Be    ${actual_reference_number}    ${expected_referenc_enumber}
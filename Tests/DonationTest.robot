*** Settings ***
Documentation  CRUK Test Cases
Library    SeleniumLibrary

Resource  ../Resources/Common.robot
Resource  ../Resources/DonationsPage.robot

Test Setup       Common.Begin Chrome Web Test
Test Teardown    Common.End Web Test

*** Test Cases ***

Verify Successful Donation To Cancer Research UK
    [Documentation]  This test is to test for making a donation to Cancer Research UK
    [Tags]    Functional Test
    Given Common.Go To CRUK Donations Page
    When DonationsPage.Page Title Is    Support US | Cancer Research UK
    Then DonationsPage.Enter Donation Amount    10
    And DonationsPage.Select Donation Type    Yes, this donation is my own money
    And DonationsPage.Select Your Motivation    In memory of someone
    And DonationsPage.Enter Motivation Reason    Shankaran
    And DonationsPage.Select Donation Reason    Choose a cancer type or an area of research
    And DonationsPage.Select Cancer Type    Bowel cancer
    When DonationsPage.Click Continue
    Then DonationsPage.Enter Donor Details    Tester    O'Doh-erty    auto-pws@cancer.org.uk    07999999999    GU22 7SS    37 The Rowans, Woking, GU22 7SS
    And DonationsPage.Select Contact Type    Email    No
    When DonationsPage.Click Continue
    Then DonationsPage.Select Payment Type    Credit / Debit card
    And DonationsPage.Enter Card Details    Tester    4000000000001000    1225    123
    And DonationsPage.Select Gift Aid
    When DonationsPage.Click Continue My Donation
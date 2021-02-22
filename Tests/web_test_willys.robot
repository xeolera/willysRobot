*** Settings ***
Documentation               This is some basic info about the whole test suite regarding Willys.se
Library                     SeleniumLibrary
Resource                    ../Resources/Willys.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

*** Variables ***
${BROWSER}              chrome
${URL}                  https:/www.willys.se/
${amount_of_product}    1

*** Test Cases ***

User must recieve wanted product page from search menu
[Tags] TestGerkh1
    GIVEN USER is not logged in
    AND USER page is verified
    AND USER searching for a product
    WHEN USER input product correctly
    THEN the chosen product page will pop up for the USER

USER can search for product, and also add to cart a product.
    [Documentation]                 This is some basic info about the test1
    [Tags]                          Test 1
    Go to Web Page
    Search for Product              cola
    Add product to cart
    Check if Added Value

USER can search for product, add to shopping cart and also check the shopping cart.
    [Documentation]                 This is some basic info about the test2
    [Tags]                          Test 2
    Go to Web Page
    Search for Product              cola
    Add product to cart
    Check if Added Value
    Check ShoppingCart

USER can Switch Window to "Lediga tjänster".
    [Documentation]                 Testfall 4
    [Tags]                          Test 4
    Go to Web Page
    Click & Switch Window


USER can navigate to willys.se, click on "Erbjudande" and verify title.
    [Documentation]                 Testfall 3
    [Tags]                          Test 3
    Go to Web Page
    Click on topmenu




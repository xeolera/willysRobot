*** Settings ***

*** Keywords ***
Begin Web Test
    Open browser                   about:blank             ${BROWSER}
    Set selenium timeout           15

Go to Web Page
    Load Page
    Verify Page Loaded

USER is not logged in
    Load Page

Load Page
    Go to                           ${URL}

Verify Page Loaded
    ${LINK_TEXT}                    Get Title
    Should Be Equal                  ${LINK_TEXT}      Handla billig mat online | Willys

Verify Page Loaded_Erbjudande
    Wait Until Page Contains Element   xpath://*[@id="__next"]/div/div[3]/main/section/div/div[1]/div/section/div/h1

Verify Page Loaded_JobbaHosOss
    Wait Until Page Contains Element   xpath://*[@id="main-content"]/div[4]/div/div[1]/div/div/div/div/div/div[2]/div/h1[3]

USER page is verified
    Verify Page Loaded

Search for Product
    [ARGUMENTS]                     ${SEARCH_TERM}
    Enter Search Term               ${SEARCH_TERM}
    Submit Search
    Verify Search Completed         ${SEARCH_TERM}

USER searching for a product
    Enter Search Term               kiwi

Enter Search Term
    [Arguments]                     ${SEARCH_TERM}
    Input Text                      id:selenium--search-items-input         ${SEARCH_TERM}

Submit Search
    Press Keys                      xpath://input[@id="selenium--search-items-input"]       RETURN
    Press Keys                      xpath://input[@id="selenium--search-items-input"]       RETURN

Verify Search Completed
    [Arguments]                    ${SEARCH_TERM}
    Wait Until Page Contains Element    xpath://*[@id="selenium--product-grid-header"]
    ${ACTUAL_TERM}                 Get Text  xpath://*[@id="selenium--product-grid-header"]
    Should Be Equal                "Sökord: ${SEARCH_TERM}"        "${ACTUAL_TERM}"

USER input product correctly
    Submit Search

Verify Page Loaded_kiwi
    Wait Until Page Contains Element    xpath://*[@id="selenium--product-grid-header"]

the chosen product page will pop up for the USER
    Verify Search Completed         kiwi
    Verify Page Loaded_kiwi

Add product to cart
    Press Keys                      xpath://*[@class="ax-btn ax-product-quantity-btn ax-product-quantity-plus selenium--product-quantity-add-to-cart-btn"]      RETURN
    Wait Until Page Contains Element    xpath://*[@id="selenium--delivery-method-selector"]
    Go to                           https://www.willys.se/sok?q=cola

Check if Added Value
    ${amount_of_product}            Get element count  xpath://*[@id="selenium--cart-badge-total-unit-count"]
    log to console                  ${amount_of_product}

Check ShoppingCart
    Press Keys                      xpath://*[@id="ax-toolbar"]/div[1]/div/ax-cart-mini/div/a      RETURN
    Wait Until Page Contains Element    xpath://*[@id="selenium--cart"]/div/div[1]/div[7]/ax-product-list/md-list/md-list-item/div/div[2]/h3

Click on topmenu
    Press Keys                      xpath://*[@id="selenium--header-nav-link-erbjudanden"]         RETURN
    Verify Page Loaded_Erbjudande

Click & Switch Window
    Click link                      xpath://html/body/div[3]/md-content/div[5]/footer/div/div[1]/accordion-nav/div/nav/ul/li[3]/div/a
    Switch Window                   new
    Verify Page Loaded_JobbaHosOss

End Web Test
    Close Browser
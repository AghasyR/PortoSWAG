*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}               https://www.saucedemo.com/
${URL2}              https://www.saucedemo.com/cart.html
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce
${MyFirstName}       Aghasy
${MyLastName}        Rezandi
${ZIP}               55281

*** Test Cases ***
Login And BuyProduct
    Open Browser    ${URL}          ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password     ${VALID_PASSWORD}
    Click Button    css:.btn_action
   
    # Add a product to the cart
    Click Button    css:.btn_primary.btn_inventory#add-to-cart-sauce-labs-backpack
    Click Button    css:.btn_primary.btn_inventory#add-to-cart-sauce-labs-bike-light
    Click Button    css:.btn_primary.btn_inventory#add-to-cart-sauce-labs-bolt-t-shirt
    
    # Navigate to the cart
    Click Link     css:.shopping_cart_link
    
    # Verify the product is in the cart
    Element Should Be Visible    css:.cart_list
    Element Should Be Visible    css:.cart_item
    
    # Click the "Continue Shopping" button
    Click Button    css:#continue-shopping

     # Click the "Inventory Item Image" button and buy it
    Click Link      css:#item_2_img_link
    Click Button    css:.btn_primary.btn_inventory#add-to-cart-sauce-labs-onesie
    Click Link      css:.shopping_cart_link

    # Proceed to checkout
    Click Button    css:.checkout_button

    # Fill in checkout information
    Input Text     id=first-name    ${MyFirstName} 
    Input Text     id=last-name     ${MyLastName} 
    Input Text     id=postal-code   ${ZIP}  

    # Continue to the next step
    Click Button    css:.cart_button

    # Complete the purchase
    Click Button    css:.cart_button

    # Verify the purchase completion (You may need to adapt this based on the actual confirmation)
    Wait Until Page Contains Element    css:.complete-header
    Element Should Be Visible           css:.complete-text

    Log    Successfully logged in, added a product to the cart, and completed the purchase
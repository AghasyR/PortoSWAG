*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}       chrome
${URL}           https://www.saucedemo.com/
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce
${VALID_USERNAME2}   performance_glitch_user
${INVALID_USERNAME}  invalid_username
${INVALID_PASSWORD}  invalid_password

*** Test Cases ***
Open Browser And Login With Valid Credentials
    Open Browser And Login    ${VALID_USERNAME}    ${VALID_PASSWORD}

Login with Different Valid Credentials
    Open Browser And Login    ${VALID_USERNAME2}   ${VALID_PASSWORD}

Login With Invalid Username
    Open Browser And Login    ${INVALID_USERNAME}    ${VALID_PASSWORD}

Login With Invalid Password
    Open Browser And Login    ${VALID_USERNAME}    ${INVALID_PASSWORD}

Login With Empty Username
    Open Browser And Login    ""    ${VALID_PASSWORD}

Login With Empty Password
    Open Browser And Login    ${VALID_USERNAME}    ""

*** Keywords ***
Open Browser And Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=user-name    ${username}
    Input Text    id=password    ${password}
    Click Button    css:.btn_action
    Wait Until Page Contains Element    css:.product_label
    Log    Successfully logged in with credentials: ${username} / ${password}
    Close Browser
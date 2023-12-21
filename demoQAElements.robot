*** Settings ***
Library  SeleniumLibrary
Resource    Resource/Steps.robot

*** Test Cases ***
Open Browser DemoQA Site
    Open DemoQA Website
Click Elements Category
    Click Elements Category
#Open All Menus
 #   Open All Menus
CLick TextBox
    Click Text Box Button
Fill the form
    Fill User Form
Checkbox Test
    Click Check Box Button
    Check Checkbox
RadioButton Test
    Click Radio Button
Webtables Test 
    Click Web Tables
    Fill User Form WebTables
    Check on Search Menu
Test Button
    Button Test
Test Link Button
    Link Button test
    Click All Elements
Broken Links Test   
    Click Broken Links
Upload Download Test
    Click Upload Download
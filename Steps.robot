*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}               https://demoqa.com/
${CheckboxSelectedEle}    xpath=//span[@class='rct-checkbox']
${ExpandPlus}          xpath=//button[@class='rct-option rct-option-expand-all']
${CheckboxDesktop}     xpath=//span[@class='rct-title' and contains(text(),'Desktop')]
${CheckboxNotes}       xpath=//span[@class='rct-title' and contains(text(),'Notes')]
${CheckboxDocuments}   xpath=//span[@class='rct-title' and contains(text(),'Documents')]
${CheckboxWKS}         xpath=//span[@class='rct-title' and contains(text(),'WorkSpace')]
${CheckboxRCT}         xpath=//span[@class='rct-title' and contains(text(),'React')]
${CheckboxPVT}         xpath=//span[@class='rct-title' and contains(text(),'Private')]
${CheckboxWF}          xpath=//span[@class='rct-title' and contains(text(),'Word File.doc')] 
${ElementPath}                   xpath://div[@class='card-body']//h5[text()='Elements']
${CheckboxHome}                  xpath=//span[@class="rct-title" and text()="Home"]/following-sibling::input[@id="tree-node-home"]
${CollapseBtnCheckBox}           xpath=//button[@class='rct-collapse rct-collapse-btn']
${full_name_locator}             id=userName
${email_locator}                 id=userEmail
${current_address_locator}        id=currentAddress
${permanent_address_locator}      id=permanentAddress
${submit_button_locator}          id=submit
${output_locator}                 id=output
${First_Name_Loc}                 xpath=//input[@id='firstName']
${Last_Name_Loc}                  xpath=//input[@id='lastName']
${EmailInput}                     xpath=//input[@id='userEmail']
${AgeInput}                       xpath=//input[@id='age']
${SalaryInput}                    xpath=//input[@id='salary']
${DeptInput}                      xpath=//input[@id='department']
${SubmitButton}                   xpath=//button[@id='submit']
${SearchBoxInput}                 id=searchBox
${EditIcon}                       xpath=//span[@class='mr-2' and @title='Edit']
${DeleteIcon}                     xpath=//span[@title='Delete']
${DoubleClickBtn}                 id=doubleClickBtn
${RightClickBtn}                  id=rightClickBtn
# ${elementR}=    Get Element       //button[@id='rightClickBtn']
${ClickMeButton}                    //button[contains(text(), 'Click Me')]
${SimpleLink}                     id=simpleLink
${DynamicLink}                    id=dynamicLink
${CreatedLink}                    id=created
${NoContent}                      id=no-content
${MovedBtnLink}                   id=moved
${BadReq}                         id=bad-request
${una}                            id=unauthorized
${Forbidden}                      id=forbidden
${NF}                             id=invalid-url
${Radio yesID}        id=yesRadio
${Radio impressiveID}        id=impressiveRadio
${WebAddBtn}                 id=addNewRecordButton
${Checkbox ID}       id=tree-node-home
${TextBoxPath}       xpath://li[@id='item-0']//span[text()='Text Box']
${CheckBoxPath}      xpath://li[@id='item-1']//span[text()='Check Box']
${RadioButonPath}    xpath://li[@id='item-2']//span[text()='Radio Button']
${WebTablesPath}     xpath://li[@id='item-3']//span[text()='Web Tables']
${ButtonsPath}       xpath://li[@id='item-4']//span[text()='Buttons']
${LinksPath}         xpath://li[@id='item-5']//span[text()='Links']
${BLIPath}           xpath://li[@id='item-6']//span[text()='Broken Links - Images']
${UADPath}           xpath://li[@id='item-7']//span[text()='Upload and Download']
${DPPath}            xpath://li[@id='item-8']//span[text()='Dynamic Properties']
${VL}                //a[text()='Click Here for Valid Link']
${BrokenL}            //a[text()='Click Here for Broken Link']
${DownloadButton}    id=downloadButton
${UploadButton}      xpath=//input[@id='uploadFile']
@{XPathValues}    ${TextBoxPath}       xpath://li[@id='item-0']//span[text()='Text Box']
...               ${CheckBoxPath}      xpath://li[@id='item-1']//span[text()='Check Box']
...               ${RadioButonPath}    xpath://li[@id='item-2']//span[text()='Radio Button']
...               ${WebTablesPath}     xpath://li[@id='item-3']//span[text()='Web Tables']
...               ${ButtonsPath}       xpath://li[@id='item-4']//span[text()='Buttons']
...               ${LinksPath}         xpath://li[@id='item-5']//span[text()='Links']
...               ${BLIPath}           xpath://li[@id='item-6']//span[text()='Broken Links - Images']
...               ${UADPath}           xpath://li[@id='item-7']//span[text()='Upload and Download']
...               ${DPPath}            xpath://li[@id='item-8']//span[text()='Dynamic Properties']
*** Keywords ***
Open Menu
    [Arguments]    ${xpath}
    Click Element    ${xpath}

Open All Menus
    FOR    ${xpath}    IN    @{XPathValues}
        Open Menu    ${xpath}
        Execute JavaScript  window.scrollBy(0, 500)
    END

Open DemoQA Website
    Open Browser  ${URL}          ${BROWSER}
    Maximize Browser Window
    Execute JavaScript  window.scrollBy(0, 500)

Click Elements Category
    [Documentation]  Test clicking the "Elements" category
    Wait Until Element Is Visible  ${ElementPath}  
    Click Element  ${ElementPath} 
    # Add additional steps to interact with elements in the "Elements" category as needed

Click Text Box Button
    # Click the button with the specified ID
    Click Element  ${TextBoxPath}
    # Add additional test steps here

Fill User Form
    # Fill in the Full Name field
    Input Text  ${full_name_locator}  Abu Sabrina
    # Fill in the Email field
    Input Text  ${email_locator}  synchron.testing@gmail.com
    # Fill in the Current Address field
    Input Text  ${current_address_locator}  Rendeng Kulon, Sewon
    # Fill in the Permanent Address field
    Input Text  ${permanent_address_locator}  Rendeng Kulon, Bantul
    # Click the Submit button
    Click Element  ${submit_button_locator}
    # Add additional test steps here
    Execute JavaScript  window.scrollBy(0, 500)

Click Check Box Button
    # Click the button with the specified ID
    Click Element  ${CheckBoxPath}
    # Add additional test steps here

Check Checkbox
   Click Element    ${CheckboxSelectedEle}
    Log    Checkbox is now checked.
    Click Element    ${ExpandPlus} 
    Click Element    ${CheckboxDesktop} 
    Click Element    ${CheckboxNotes}
    Click Element    ${CheckboxWKS}
    Click Element    ${CheckboxRCT}  
    Click Element    ${CheckboxPVT}

Check If Checkbox Is Not Checked
    ${is_checked} =    Execute JavaScript    return document.getElementById('${Checkbox ID}').checked
    Run Keyword Unless    not ${is_checked}    Log    Checkbox is already checked.

Click Radio Button
    Click Element  ${RadioButonPath}
    Execute JavaScript    window.scrollTo(0, 0)
    Execute JavaScript    document.getElementById('yesRadio').click();
    Execute JavaScript    document.getElementById('impressiveRadio').click();

Click Web Tables
    Execute JavaScript  window.scrollBy(0, 500)
    Click Element   ${WebTablesPath}
    Click Element   ${WebAddBtn}
    
Fill User Form WebTables
    Wait Until Element Is Visible    ${First_Name_Loc}
   # Zoom Out  0.95
    Input Text  ${First_Name_Loc}  Abu Sabrina
    Input Text  ${Last_Name_Loc}   Agha
    Input Text  ${EmailInput}   synchrontesting@gmail.com
    Input Text  ${AgeInput}   33
    Input Text  ${SalaryInput}   5000000
    Input Text  ${DeptInput}   Testerwork
    Wait Until Element Is Visible    ${SubmitButton}
    Click Element  ${SubmitButton}
Check on Search Menu
    Input Text  ${SearchBoxInput}     Agha
    Wait Until Element Is Visible    ${EditIcon}    timeout=10s
    Click Element  ${EditIcon}
    Input Text  ${DeptInput}   TestBird
    Click Element  ${SubmitButton}
    Input Text  ${SearchBoxInput}     Agha
    Wait Until Element Is Visible    ${DeleteIcon}    timeout=10s
    Click Element  ${DeleteIcon} 

Button Test
    Click Element  ${ButtonsPath}
    Execute JavaScript  window.scrollBy(0, 500)
    Double Click Element  ${DoubleClickBtn}
   # Click Element    ${elementR}
    Click Element  ${ClickMeButton}      

Link Button test
   Execute JavaScript  window.scrollBy(0, 500)
   Open Menu  ${LinksPath}

Click All Elements
     ${LinkCreate}=    Create List    ${CreatedLink}    ${NoContent}    ${MovedBtnLink}    ${BadReq}    ${una}    ${Forbidden}    ${NF}
    FOR    ${LinkEle}    IN    @{LinkCreate}
        Click Element    ${LinkEle}
    END
    Execute JavaScript    window.open('', 'https://demoqa.com/links');
    Click Element  ${SimpleLink}
    Sleep    2s    # Add a delay to allow the new tab to fully load
    # Add your verification steps or other actions in the new tab
    Switch Window    index=0   # Switch back to the original tab
    Close Window    # Close the new tab
    Wait Until Element Is Visible  ${DynamicLink
    Execute JavaScript    window.open('', 'https://demoqa.com/links');
    Click Element  ${DynamicLink
    Sleep    2s    # Add a delay to allow the new tab to fully load
    Switch Window    index=1   # Switch to the newly opened tab
    # Add your verification steps or other actions in the new tab
    Switch Window    index=0   # Switch back to the original tab
    Close Window    # Close the new tab
   
Click Broken Links
    Click Element  ${BLIPath}
    Click Element  ${VL}  
    Go Back
    Click Element  ${BrokenL} 
    Go Back

Click Upload Download
    Execute JavaScript  window.scrollBy(0, 500)
    Click Element  ${UADPath}
    Click Element  ${DownloadButton}
    Choose File  class:form-control-file  C:\Users\Leonovo\Downloads\OIG (8).jpg
   
Choose File
    [Arguments]    ${UploadButton}    ${file_path}
    Choose File    ${UploadButton}   Data Permaduan/MultiOpenorder.png

Zoom Out
    [Arguments]  ${zoom_factor}
    Execute JavaScript  document.body.style.zoom='${zoom_factor}'
*** Settings ***
Library    SeleniumLibrary
Library    RPA.Excel.Files
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource
Library    DateTime

*** Variables ***
${EXCELFILE}    ${CURDIR}/accounts.xlsx
${DATE_FORMAT}    %d/%m/%Y
${RIGHT_ARROW}    //button[@title='Move to Chosen']
${AVAILABLE_LIST}      xpath=//ul[@class="slds-listbox slds-listbox_vertical"]//span[text()='${countries}']
@{countries}    NZ    UK    US



*** Keywords ***
SearchAccount
    LoginToSalesforce
    #Account creation
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}
    Execute JavaScript    ${SetAccountsInSearchBox}
    Wait Until Page Contains Element    ${WaitForAccounts}    10
    Execute JavaScript    ${ClickAccounts}
    Sleep    10

Fill_All_Fields
    [Arguments]    ${AccName}    ${AccParentAccount}    ${AccPhone}    ${AccWebsite}    ${AccActive}        ${AccBillingStreet}    ${AccBillingCity}    ${AccBillingZip}    ${AccBillingState}    ${AccBillingCountry}    ${AccDesciption}    ${AccCountry}    
    Click Element    ${Account_New}
    Wait Until Element Is Visible    xpath=//input[@name='Name']    10
    Input Text    ${Name}    ${AccName}
    Click Element    //input[@placeholder='Search Accounts...']
    Sleep    10
    Input Text    //input[@placeholder='Search Accounts...']    ${AccParentAccount}
    Wait Until Element Is Visible    //lightning-base-combobox-item[normalize-space()='${AccParentAccount}']    20
    Click Element    //lightning-base-combobox-item[normalize-space()='${AccParentAccount}']
    Input Text    xpath=//input[@name='Phone']   ${AccPhone}
    Input Text    xpath=//input[@name='Website']    ${AccWebsite}
    Execute JavaScript    document.evaluate("//label[normalize-space(text())='Active']/following-sibling::div//button", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Click Element    //lightning-base-combobox-item//span[normalize-space(text())="${AccActive}"]
    Input Text    //label[text()='Billing Street']/ancestor::div[contains(@class,'slds-form-element')]//textarea    ${AccBillingStreet}    
    Input Text    //label[text()='Billing City']/following::input[1]    ${AccBillingCity}    
    Input Text    //label[text()='Billing Zip/Postal Code']/following::input[1]    ${AccBillingZip}
    Input Text    //label[text()='Billing State/Province']/following::input[1]    ${AccBillingState}
    Input Text    //label[text()='Billing Country']/following::input[1]    ${AccBillingCountry}
    ${SLAExpireDate}=    Get Current Date    result_format=${DATE_FORMAT}    increment=2 days
    Input Text    xpath=//input[@name="SLAExpirationDate__c"]    ${SLAExpireDate}
    Input Text    //label[text()='Description']/following::textarea[1]    ${AccDesciption}
    FOR    ${country}    IN    @{countries}
        ${country_xpath}=    Set Variable    //ul[@class="slds-listbox slds-listbox_vertical"]//span[text()='${country}']
        ${script}=    Set Variable    var el = document.evaluate("${country_xpath.replace('"', '\\"')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if(el) el.click();
        Execute JavaScript    ${script}
    END
    Click Element    ${RIGHT_ARROW}
    Click Button  xpath=//button[@name='SaveEdit']
    Sleep    30
    Go To    https://kairos2-dev-ed.develop.lightning.force.com/lightning/o/Account/list?filterName=__Recent    
    Wait Until Page Contains Element    xpath=//span[@class='triggerLinkText selectedListView slds-page-header__title slds-truncate slds-p-right--xx-small lst-temp-slds-lineHeight uiOutputText']
    Sleep    10

*** Test Cases ***
createAccountFromExcel
    Open Workbook    ${EXCELFILE}
    ${data}=    Read Worksheet As Table    header=True
    Close Workbook
    SearchAccount
    FOR    ${row}    IN    @{data}
        ${Name}=       Set Variable    ${row}[AccName]
        ${AccParentAccount}=    Set Variable    ${row}[AccParentAccount]
        ${Phone}=   Set Variable    ${row}[AccPhone]
        ${Website}=      Set Variable    ${row}[AccWebsite]
        ${AccActive}=    Set Variable    ${row}[AccActive]
        ${AccBillingStreet}=    Set Variable    ${row}[AccBillingStreet]
        ${AccBillingCity}=    Set Variable    ${row}[AccBillingCity]
        ${AccBillingZip}=    Set Variable    ${row}[AccBillingZip]
        ${AccBillingState}=    Set Variable    ${row}[AccBillingState]
        ${AccBillingCountry}=    Set Variable    ${row}[AccBillingCountry]
        ${AccDescription}=    Set Variable    ${row}[AccDesciption]
        ${AccCountry}=    Set Variable    ${row}[AccCountry]
        
       
        Fill_All_Fields    ${Name}    ${AccParentAccount}    ${Phone}    ${Website}    ${AccActive}     ${AccBillingStreet}    ${AccBillingCity}    ${AccBillingZip}    ${AccBillingState}    ${AccBillingCountry}    ${AccDescription}    ${AccCountry}  
    END
    Close Browser


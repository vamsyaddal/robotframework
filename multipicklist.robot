*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    OperatingSystem
Resource    ../resources/login.resource

*** Variables ***
@{COUNTRIES}    AUS    CA    IND    NZ

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

*** Test Cases ***
multipicklistSelection
    SearchAccount
    Click Element    ${Account_New}
    Sleep    10
    Input Text    xpath=//input[@name='Phone']   98989898
    Input Text    xpath=//input[@name='Website']    wwww.l.com
    Input Text    //label[text()='Billing Street']/ancestor::div[contains(@class,'slds-form-element')]//textarea    Strret 2    
    Input Text    //label[text()='Billing City']/following::input[1]    HYS    
    Input Text    //label[text()='Billing Zip/Postal Code']/following::input[1]    500018
    Input Text    //label[text()='Billing State/Province']/following::input[1]    TS
    Input Text    //label[text()='Billing Country']/following::input[1]    IND
    Input Text    //label[text()='Description']/following::textarea[1]    test
    Scroll Element Into View    //span[text()="AUS"]
    Click Element    //span[text()="AUS"]
    Click Element    xpath=//button[@title='Move to Chosen']
    Click Element    //span[text()="CA"]
    Click Element    xpath=//button[@title='Move to Chosen']

    Sleep    1s
    Close Browser

    
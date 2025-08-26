*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource



*** Variables ***
${COUNTER}            1


*** Test Cases ***
accountAndContactCreation
    ${account_name}=    Set Variable    Account_${COUNTER}
    ${contact_name}=    Set Variable    Contact_${COUNTER}
    LoginToSalesforce
    #Account creation
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}
    Execute JavaScript    ${SetAccountsInSearchBox}
    Wait Until Page Contains Element    ${WaitForAccounts}    10
    Execute JavaScript    ${ClickAccounts}
    Sleep    10
    Click Element    ${Account_New}
    Sleep    10
    Input Text    ${Name}    ${account_name}
    Input Text    ${Billing_Street}    Main Road
    Input Text    ${Billing_City}    Hyderabad
    Input Text    ${Billing_Zip}    500018
    Input Text    ${Billing_State}    TS
    Input Text    ${Billing_Country}    IND
    Input Text    ${SLA}    09/04/2025
    Input Text    ${Description}    This is a creation of the Account
    Click Button    ${Save_Button}
    Sleep    10

    #Contact creation
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}    10
    Execute JavaScript    ${SetContactsInSearchBox}
    Wait Until Page Contains Element    ${WaitForContacts}    10
    Execute JavaScript    ${ClickContacts}
    Sleep    10
    Click Element    ${Contact_New}
    Sleep    10
    Input Text    ${Phone}    998877665
    Wait Until Page Contains Element    ${Click_Salutation}    10
    Wait Until Element Is Visible    ${Click_Salutation}    10
    Click Element    ${Click_Salutation}
    Click Element       ${Select_Salutation} 
    Input Text    ${Last_Name}    ${contact_name}
    Input Text    ${AccountName1}    Vamsy Addala
    Sleep    10
    Click Element    ${SelectAccountName}
    Input Text    ${Department}    Salesforce
    Input Text    ${BirthDate}    01/04/2025
    Input Text    ${Other_Street}    Main road
    Input Text    ${Other_City}    VIzag
    Input Text    ${Other_Zip}    524300
    Input Text    ${Other_State}    AP
    Input Text    ${Other_Country}    IND
    Input Text    ${Languages}    English
    Input Text    ${Description}    This is a Contact Creation
    Click Button    ${Save_Button}
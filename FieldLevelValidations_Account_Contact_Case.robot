*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource



*** Test Cases ***
FieldLevelValidationForAccount
    LoginToSalesforce

    #Account Name field validation
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}    10
    Execute JavaScript    ${SetAccountsInSearchBox}
    Wait Until Page Contains Element    ${WaitForAccounts}    10
    Execute JavaScript    ${ClickAccounts}
    Sleep    10
    Click Element    ${Account_New}
    Sleep    10
    Click Button    ${Save_Button}
    Element Should Contain   ${Account_Error_Message}    Complete this field.
    Sleep    10
    Element Should Contain      ${Account_We_Hit_a_Snag}      We hit a snag.
    Element Should Contain           ${AccountNameLink}    Account Name

    #Contact Last Name field validation
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}    10
    Execute JavaScript    ${SetContactsInSearchBox}
    Wait Until Page Contains Element    ${WaitForContacts}    10
    Execute JavaScript    ${ClickContacts}
    Sleep    10
    Click Element    ${Contact_New}
    Sleep    10
    Click Button    ${Save_Button}
    Element Should Contain   ${Contact_Error_Message}    Complete this field.
    Sleep    10s
    Element Should Contain        ${Contact_We_Hit_a_Snag}    We hit a snag.
    Element Should Contain           ${ContactLastNameLink}    Name

    #Case Origin field validation
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}    10
    Execute JavaScript    ${SetCasesInSearchBox}
    Wait Until Page Contains Element    ${WaitForCases}    10
    Execute JavaScript    ${ClickCases}
    Sleep    30
    Click Element    ${Case_New}
    Sleep    10
    Click Button    ${Save_Button}
    Element Should Contain   ${Case_Error_Message}    Complete this field.
    Sleep    10
    Element Should Contain        ${Case_We_Hit_a_Snag}    We hit a snag.
    Element Should Contain           ${CaseOriginLink}    Case Origin
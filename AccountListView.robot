*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource



*** Variables ***
${MAX_RETRIES}    10
${targetAccount}    Account_9
${retries}=    0

*** Test Cases ***
AccountListView
    LoginToSalesforce
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}    10
    Execute JavaScript    ${SetAccountsInSearchBox}
    Wait Until Page Contains Element    ${WaitForAccounts}    10
    Execute JavaScript    ${ClickAccounts}
    Wait Until Page Contains Element    ${WaitForRecentlyViewed}    30
    Execute JavaScript    ${ClickRecentlyViewedAccounts}
    Sleep    15
    Execute Javascript    ${ClickOnViewAllAccounts}
    Sleep    30s
    FOR    ${index}    IN RANGE    ${MAX_RETRIES}
        ${element_found}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//table//tbody//tr[.//*[contains(text(),'${targetAccount}')]])[1]
        IF    ${element_found}
        Click Element    ${TargetAccount}
        Sleep    5
        Capture Page Screenshot    ${targetAccount}.png
        Exit For Loop
        END
        Execute JavaScript    var row = document.querySelector('table tbody tr:last-child');
...        if (row) {
...            row.scrollIntoView({behavior: 'smooth', block: 'center'});
...                } 
...        else {
...        return 'Element not found';
...            }
        Execute JavaScript    return document.querySelector('table tbody tr:last-child td:first-child').click()
        #Click Element    (//table/tbody/tr[last()]/td[1])
        Sleep    15s
        ${retries}=    Evaluate    ${retries} + 1
    END
    Run Keyword If    not ${element_found}    Fail    Element not found after ${MAX_RETRIES} retries










    # IF    ${count} > ${TARGET_INDEX}
    #     WHILE    ${count}>${TARGET_INDEX}
    #         ${final_list}=    Get WebElements    ${ACCOUNT_LINKS}
    #         ${account_name}=  Get Text    ${final_list}[${TARGET_INDEX}]
    #         Log To Console    Opening Account: ${account_name}
    #         Scroll Element Into View    ${final_list}[${TARGET_INDEX}]
    #         Click Element               ${final_list}[${TARGET_INDEX}]
    #     END
    # ELSE
    # # ${elements}    Get WebElements    //table//tbody//tr//th//a
    #     FOR    ${el}    IN    @{elements}
    #         ${account_name}    Get Text    ${el}
    #         ${count}       Get Length         ${elements}
    #         # Scroll Element Into View    ${el}
    #         Run Keyword If    '${account_name}' == 'Account_3'    Click Element    ${el}
    #         Log    Total Accounts: ${count}  
    #         Log    Account Name: ${account_name}
    #     END
    # END
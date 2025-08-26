*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource
Resource    ../resources/global.resource




*** Tasks ***
SalesOpportunityCreation
    LoginToRFP
    Go To    ${userdetails}
    Sleep    10
    Select Frame    ${iframeonLoginpage}
    Sleep    10
    Click Element    ${loginbutton}
    Unselect Frame   
    Sleep    10
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}    10
    Execute JavaScript    ${EnterLeads}
    Sleep    10
    Execute Javascript    ${clickleads}
    Sleep    30
    Execute JavaScript    ${Newbtn}
    Sleep    10
    Wait Until Element Is Visible    ${clickrfpsalutation}    10
    Click Element    ${clickrfpsalutation}
    Sleep    5
    Execute Javascript    ${selectrfpSalutation}
    Input Text    ${rfplastname}    Test
    Input Text    ${rfpcompany}    ${ls}
    Input Text    ${rfpPhone}    96876876
    Input Text    ${rfpMobile}    2423452345424
    Input Text    ${rfpLinkedIn}    wewe.linkedIn
    Sleep    10
    Wait Until Element Is Visible    ${ourOfferings}    10
    Click Element    ${ourOfferings}
    Sleep    30
    Wait Until Page Contains Element    ${selectImplementations}    5s
    Click Element    ${selectImplementations}
    Sleep    30
    Click Button    ${rfpleadSave}
    Wait Until Element Is Visible    xpath=//span[@class='title slds-path__title'][normalize-space()='Converted']    5
    Execute JavaScript    var el = [...document.querySelectorAll("span.slds-path__title")].find(e => e.textContent.trim() === "Converted");    
    ...    if (el) el.click();
    Execute JavaScript    var btn = [...document.querySelectorAll("button")].find(e => e.textContent.trim() === "Select Converted Status");
    ...    if (btn) btn.click();
    Sleep    10
    Click Button    ${rfpCOnvert}
    Sleep    10
    Element Should Contain    ${rfpaccount}    Account
    Element Should Contain    //h3[text()='Contact']    Contact
    Element Should Contain    //h3[text()='Opportunity']    Opportunity



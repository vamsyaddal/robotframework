*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource

*** Variables ***
${RFPurl}    https://cpprd--uat.sandbox.lightning.force.com/lightning/page/home
${RFPun}    sreedhar.pusala@cloudperitus.com.cpuat
${RFPpw}    Cp@qa2025
${browser}    Chrome
@{ourofferingvalues}=    --None--    Advisory Services    Assessment Services    Data Migration Services    Integrated Support Services    Implementation Services
@{Stagevalues}=      Prospecting      Due Diligence      Needs Analysis      Value Proposition      Effort Estimation      Awaiting Customer Response      Closed Won      Closed Lost



*** Tasks ***
RFPandEffortEstimationRecordCreation
    LoginToRFP
    Go To    https://cpprd--uat.sandbox.my.salesforce-setup.com/lightning/setup/ManageUsers/page?address=%2F0055e000006ug1eAAA%3Fnoredirect%3D1%26isUserEntityOverride%3D1
    Sleep    10
    Select Frame    //iframe[@title='User: Sales_RFP ~ Salesforce - Enterprise Edition']
    Sleep    10
    Click Element    //td[@id='topButtonRow']//input[@title='Login']
    Unselect Frame
    Sleep    10
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}
    Execute JavaScript    document.evaluate("//input[@placeholder='Search apps and items...']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value = 'Opportunities';
    Sleep    10
    Execute Javascript    document.evaluate("//a[@id='Opportunity']//b[contains(text(),'Opportunities')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue?.click();
    Sleep    30
    # ${oppty_names}=    Execute Javascript    return [...document.querySelectorAll('lightning-datatable a')].map(a => a.textContent.trim());
    Scroll Element Into View    //table//tbody//tr[.//*[contains(text(),'${ls}')]])[1]
    Click Element    //table//tbody//tr[.//*[contains(text(),'${ls}')]])[1]
    ${ourofferings}=    Get List Items    xpath=//label[contains(text(),'Our Offerings')]/following::span[1]
    ${stage}=    Get List Items    //label[contains(text(),'Stage')]/following::span[1]
    FOR    ${index}    IN RANGE    ${len(${ourofferingvalues})}
        Should Be Equal As Strings    ${ourofferings}[${index}]    ${ourofferingvalues}[${index}]
    END
    FOR    ${index1}    IN RANGE    ${len(${Stagevalues})}
        Should Be Equal As Strings    ${stage}[${index1}]    ${Stagevalues}[${index1}]
    END
    


    
    
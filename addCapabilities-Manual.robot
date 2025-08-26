*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource
Library    BuiltIn

*** Variables ***
${RFPurl}    https://cpprd--uat.sandbox.lightning.force.com/lightning/page/home
${RFPun}    sreedhar.pusala@cloudperitus.com.cpuat
${RFPpw}    Cp@qa2025
${browser}    Chrome
# ${Salesforce_Cloud_Values}=    Set Variable    //label[contains(text(), "Salesforce Cloud Type")]/following::span[1]
${capability_count}    3
    


*** Tasks ***
AddCapabilities
    Open Browser    ${RFPurl}   ${browser}
    Input Text    ${username}    ${RFPun}
    Input Password    ${password}    ${RFPpw}
    Click Button    ${submit}
    Maximize Browser Window
    Sleep    5
  
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}
    Execute JavaScript    document.evaluate("//input[@placeholder='Search apps and items...']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value = 'Contacts';
    Sleep    10
    Execute Javascript    document.evaluate("//a[@id='Contact']//b[contains(text(),'Contacts')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue?.click();
    Sleep    30
    Click Element    //table//tbody//tr[.//th//a[normalize-space()='Vishal Pattabhi']]//th//a
    Sleep    10
    Click Button    //button[normalize-space()='Log in to Experience as User']
    Sleep    30
    Execute JavaScript    document.evaluate("//span[normalize-space()='WinFlow']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    # Click Element    //span[normalize-space()='WinFlow']
    Sleep    10
    Scroll Element Into View    //a[@target='_self'][normalize-space()='Tech M-']
    Click Element    //a[@target='_self'][normalize-space()='Tech M-']
    Sleep    10
    Click Element    //span[@data-label='Capability Identification']
    Sleep    10
    Click Element    //button[normalize-space()='Mark Stage as Completed']
    Sleep    10
    Click Button    //button[normalize-space()='Add Capability']
    Sleep    10
    # Click Element    //lightning-icon[@class='slds-icon_container_circle slds-icon-action-new slds-icon_container']//lightning-primitive-icon[@exportparts='icon']//*[name()='svg']
    # Click Button    //button[@class='slds-button slds-button_neutral'][normalize-space()='Save']
    # Element Should Contain    xpath=//label[contains(text(), "Salesforce Cloud Type")]/following::div[contains(text(), "Complete this field.")][1]    Complete this field.
    # Element Should Contain    xpath=//label[contains(text(), "Epic Name")]/following::div[contains(text(), "Complete this field.")][1]    Complete this field.
    # Element Should Contain    xpath=//label[contains(text(), "Use Case Type")]/following::div[contains(text(), "Complete this field.")][1]    Complete this field.
    # Sleep    10
    # Element Should Contain    xpath=//label[contains(text(), "Use Case Description")]/following::div[contains(text(), "Complete this field.")][1]    Complete this field.
    # Click Element    //label[contains(text(), "Salesforce Cloud Type")]/following::span[1]
    # Sleep    10
    # Click Element    //lightning-base-combobox-item//span[text()='Sales Cloud']
    # @{elements}=    Get WebElements    (//lightning-base-combobox//span[@class='slds-truncate'])[1]
    # @{actual_values}=    Create List
    # FOR    ${el}    IN    @{elements}
    #     ${val}=    Get Text    ${el}
    #     ${actual_values}=    Create List    @{actual_values}    ${val}
    # END
    # @{expected_values}=    Create List    Manufacturing Cloud    Health Cloud    Vaccine Cloud    Education Cloud    Non-profit Cloud    IoT Cloud    App Cloud    Integration Cloud    Sales Cloud    Service Cloud    Marketing Cloud    Commerce Cloud    Experience Cloud    Analytics Cloud    Financial Services Cloud
    # FOR    ${val}    IN    @{expected_values}
    #     List Selection Should Be    ${actual_values}    ${val}
    # END
    # Input Text    //input[@role='textbox']    Test
    # Sleep    10
    # Click Element    //span[contains(@class, 'slds-listbox__option-text') and text()='Test']
    # Input Text    //label[contains(text(), "Use Case Title")]/following::textarea[1]    TEst UseCase
    # Input Text    //label[contains(text(), "Use Case Description")]/following::textarea[1]    TEst UseDescription
    # Click Button    //button[@class='slds-button slds-button_neutral'][normalize-space()='Save']
    ${loop_limit}=    Evaluate    ${capability_count} + 1
    FOR    ${index}    IN RANGE    0    ${loop_limit}
        Log    Iteration ${index}
        Sleep    10
        Click Element    xpath=//lightning-icon[@class='slds-icon_container_circle slds-icon-action-new slds-icon_container']//lightning-primitive-icon[@exportparts='icon']//*[name()='svg']
        Click Element    xpath=//label[contains(text(), "Salesforce Cloud Type")]/following::span[1]
        Sleep    1
        Click Element    xpath=//lightning-base-combobox-item[not(@aria-hidden='true')]//span[normalize-space()='Sales Cloud']
        Input Text    xpath=//input[@role='textbox']    Test
        Sleep    1
        Click Element    xpath=//span[contains(@class, 'slds-listbox__option-text') and text()='Test']
        Input Text    xpath=//label[contains(text(), "Use Case Title")]/following::textarea[1]    TEst UseCase ${index}
        Input Text    xpath=//label[contains(text(), "Use Case Description")]/following::textarea[1]    TEst UseDescription ${index}
        Click Button    xpath=//button[@class='slds-button slds-button_neutral'][normalize-space()='Save']
        Sleep    2
    END





    
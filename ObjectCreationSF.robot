*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource


*** Test Cases ***
ObjectCreation
    LoginToSalesforce
    Click Link    locator=xpath://a[@class='menuTriggerLink slds-button slds-button_icon slds-button_icon slds-button_icon-container slds-button_icon-small slds-global-actions__setup slds-global-actions__item-action']
    Click Link    //a[@title='Create Menu']
    Click Element    //span[text()="Custom Object"]
    Sleep    time_=15s
    Select Frame    //iframe[@title='New Custom Object ~ Salesforce - Developer Edition']
    Input Text    //input[@name="MasterLabel"]    Student
    Input Text    //input[@name="PluralLabel"]    Students
    Input Text    //textarea[@name="Description"]    This is a Student Object
    Clear Element Text    //input[@name="MasterNameFieldLabel"]
    Input Text    //input[@name="MasterNameFieldLabel"]    Student Id
    Select From List By Label    //select[@name="AutoNo"]    Auto Number
    Select Checkbox    //input[@name="options_0"]
    Select Checkbox    //input[@name="options_20"]
    # Click Button    //td[@id="topButtonRow"]//input[@title="Save"]
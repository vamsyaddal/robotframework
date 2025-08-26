*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource


*** Test Cases ***
UserCreation
    LoginToSalesforce
    Click Link    locator=xpath://a[@class='menuTriggerLink slds-button slds-button_icon slds-button_icon slds-button_icon-container slds-button_icon-small slds-global-actions__setup slds-global-actions__item-action']
    Click Link    //a[@title='Create Menu']
    Click Element    //div//*[@id="userCreateMenuItem"]
    Sleep    time_=15s
    Select Frame    //iframe[@title='New User ~ Salesforce - Developer Edition']
    Wait Until Element Is Visible    //label[text()='First Name']/following::input[1]    timeout=30s
    Scroll Element Into View    //label[text()='First Name']/following::input[1]
    Input Text    //label[text()='First Name']/following::input[1]    Prime
    Input Text    //*[@name="name_lastName"]    Minister
    Input Text    //*[@name="Alias"]    PM
    Input Text    //*[@name="Email"]    p@m.com
    Input Text    //*[@name="Username"]    primeminister
    Input Text    //*[@name="CommunityNickname"]    Modi
    Select From List By Label    //*[@name="role"]    CEO
    Select From List By Label    //select[@id="Profile"]    Salesforce API Only System Integrations
    Input Text    //input[@name="Title"]    NM
    Input Text    //input[@name="CompanyName"]    India
    Input Text    //input[@name="Department"]    Social
    Input Text    //input[@name="Division"]    North
    Select Checkbox    //input[@name="UserPermissions_10"]
    Input Text    //input[@name="Phone"]    9988776655
    Input Text    //input[@name="Extension"]    NM
    Input Text    //input[@name="Fax"]    87654
    Input Text    //input[@name="MobilePhone"]    040 420000
    Input Text    //input[@name="EmployeeNumber"]    118
    Input Text    //textarea[@name="Addressstreet"]    Myhometwitza
    Input Text    //input[@name="Addresscity"]    Hyderabad
    Input Text    //input[@name="Addresszip"]    Hyderabad
    Input Text    //input[@name="Addressstate"]    Hyderabad
    Input Text    //input[@name="Addressstate"]    Hyderabad
    Input Text    //input[@name="Addresscountry"]    Hyderabad
    Input Text    //input[@name="FederationIdentifier"]    CP118    
    Click Button    //td[@class="pbButton"]//input[@name='save']
    Unselect Frame

    
    
        
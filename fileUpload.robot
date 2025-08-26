*** Settings ***
Library    SeleniumLibrary
Variables    ../pageObjects/xpaths.yaml
Resource    ../resources/login.resource
Library    keywords.py


*** Variables ***
${file_path}    C:\\Users\\CP_LPT-110\\Downloads\\accounts.xlsx



*** Test Cases ***
fileUpload
    LoginToSalesforce
    Execute JavaScript    ${AppLauncher}
    Wait Until Page Contains Element    ${WaitforSearch}
    Execute JavaScript    ${SetFilesInSearchBox}
    Wait Until Page Contains Element    ${WaitForFiles}    10
    Execute JavaScript    ${ClickFiles}
    Sleep    10
    Click Element    xpath=//a[@title="Upload Files"]
    Sleep    2s
    Upload File Using PyAutoGUI    ${file_path} 
    Sleep    5
    Click Button    xpath=//div[@class="modal-container slds-modal__container"]//button[@type='button' and @class='slds-button slds-button_neutral ok desktop uiButton--default uiButton--brand uiButton']
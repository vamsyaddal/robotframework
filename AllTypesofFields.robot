*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://artoftesting.com/samplesiteforselenium
${browser}    Chrome

*** Test Cases ***    
Handlingallfields
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Input Text    xpath://input[@name="firstName"]    text=HEllo
    Click Button    xpath://button[@id="idOfButton"]
    Double Click Element    xpath://button[@id="dblClkBtn"]
    Handle Alert    accept
    Select Radio Button    gender    male
    Select Checkbox    xpath://input[@value='Performance']
    Click Element    xpath://select[@id='testingDropdown']
    Select From List By Index    xpath://select[@id='testingDropdown']    3
    Capture Page Screenshot
    # Select From List By Value    testingDropdown    Database Testing   
    Scroll Element Into View        xpath://button[normalize-space()='Generate Alert Box']
    Sleep    time_=10s
    Click Button    xpath://button[normalize-space()='Generate Alert Box']
    Handle Alert    accept
    Click Button    xpath://button[normalize-space()='Generate Confirm Box']
    Handle Alert    dismiss
    Drag And Drop    xpath://div[@id="targetDiv"]    target=xpath://img[@id="myImage"]
    Sleep    time_=10s
    Capture Page Screenshot


      




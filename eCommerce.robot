*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    http://tutorialsninja.com/demo/
${browser}    Chrome

*** Test Cases ***
registerUser
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Click Element    //span[normalize-space()='My Account']
    Click Element     //ul[@class='dropdown-menu dropdown-menu-right']//a[normalize-space()='Register']
    # Click Link    //a[normalize-space()='Register']
    Input Text    //input[@id='input-firstname']    Vamsy
    Input Text    //input[@placeholder="Last Name"]    Addala
    Input Text    //input[@placeholder="E-Mail"]    vamsyaddala524@gmail.com
    Input Text    //input[@placeholder="Telephone"]    9988776655
    Input Password    //input[@placeholder="Password"]    12345
    Input Password    //input[@placeholder="Password Confirm"]    12345
    Select Radio Button    newsletter    1
    Select Checkbox    //input[@name='agree']
    Click Button    //input[@value='Continue']
loginUser
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Click Element    //span[normalize-space()='My Account']
    Click Element     //ul[@class='dropdown-menu dropdown-menu-right']//a[normalize-space()='Login']
    Input Text    //input[@placeholder="E-Mail Address"]    vamsy524@gmail.com
    Input Password    //input[@placeholder="Password"]    12345
    Click Button    //input[@value="Login"]

buyingProducts
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Mouse Over    //a[text()='Desktops']
    Click Link    //a[normalize-space()='Show AllDesktops']
    Click Link    //a[normalize-space()='Cameras (2)']
    Click Button    //a[contains(text(), 'Nikon D300')]/following::button[1]
    Click Button    //div[@id="cart"]/button[@class="btn btn-inverse btn-block btn-lg dropdown-toggle"]
    Click Link    //strong[normalize-space()='View Cart']
    Click Link    //a[@class='btn btn-primary']
    
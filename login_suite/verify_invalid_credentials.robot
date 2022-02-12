*** Settings ***
Documentation      This suit file handles all the test case related to the invalid credentials

Library     SeleniumLibrary
Library     OperatingSystem

Resource    ../base/common_functionality.resource

Test Setup      Launch Browser
Test Teardown   End Browser

Test Template       Verify Invalid Credential Template

*** Test Cases ***
TC1     john   john123    Dutch    Invalid username or password
TC2     peter   peter123   Danish    Invalid username or password
TC3     Mark    Mark123     Greek   Invalid username or password
TC4     ${EMPTY}    peter123         Dutch       Invalid username or password

*** Keywords ***
Verify Invalid Credential Template
    [Arguments]     ${username}     ${password}     ${language}     ${expected_error}
    Input Text    id=authUser    ${username}
    Input Password    id=clearPass    ${password}
    Select From List By Label    name=languageChoice    ${language}
    Click Element    xpath=//button[@type='submit']
    Element Should Contain    //div[contains(text(),'Invalid')]    ${expected_error}



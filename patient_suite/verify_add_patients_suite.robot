*** Comments ***
Navigate onto https://demo.openemr.io/b/openemr/interface/login/login.php?site=default
Update username as admin
Update password as pass
Click on the login button
Click on Patient/Client and Click on Patients
Click Add New Patient
Add the first name, last name
Update DOB as today's date
Update the Sex
 Click on the create new patient button above the form
 Click on confirm create new patient button.
 Print the text from alert box (if any error before handling alert add 5 sec wait)
 Handle alert
 Close the Happy Birthday popup
 Get the added patient name and print in the console.


*** Settings ***
Documentation   this file contains adding new patients and verifing it
Library   SeleniumLibrary

Resource    ../base/common_functionality.resource
Test Setup   Launch Browser
Test Teardown  End Browser

Test Template   Patient Verify Credential Template


*** Test Cases ***
TC1     admin    pass   English (Indian)    OpenEMR     Harsha  Chopda    1995-10-10   Female


*** Keywords ***
Patient Verify Credential Template
           [Arguments]          ${username}      ${password}       ${language}       ${expected_title}    ${fname}   ${lname}   ${dob}  ${fs}
       Input Text    id=authUser    ${username}
     Input Password    id=clearPass    ${password}
     Select From List By Label    name=languageChoice     ${language}
     Click Element    xpath=//button[@type='submit']
     Title Should Be    ${expected_title}
     Mouse Over    xpath=//div[@data-bind='text:label']
     Click Element    link=Patients
     Click Element    id=create_patient_btn1
     Select From List By Label    id=form_title   Ms.
     Input Text    id=form_fname    ${fname}
     Input Text    id=form_lname    ${lname}
     Input Text    id=form_DOB      ${dob}
     Select From List By Label    id=form_sex   ${fs}
     Click Element    id=create
      Mouse Down    xpath=//input[@type='button']
      ${alert_text}  Handle Alert  action=Accept  timeout=20s
       Log To Console  ${alert_text}


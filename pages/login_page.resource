*** Settings ***
Documentation   this file handles all the operation in the login page of openemr

Library     SeleniumLibrary

*** Variables ***
${USERNAME_LOCATOR}     id=authUser

*** Keywords ***
Enter Username
    [Arguments]     ${username}
    Input Text    ${USERNAME_LOCATOR}    ${username}
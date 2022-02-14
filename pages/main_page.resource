*** Settings ***
Documentation   This file handles all the menu for openemr application

Resource    ../base/common_functionality.resource


*** Keywords ***
Main Page Title Should be
    [Arguments]     ${expected_title}
    Title Should Be    ${expected_title}
*** Settings ***
Documentation   This file contains reusable keywords

Library     SeleniumLibrary

*** Keywords ***
Launch Browser
    Open Browser      browser=chrome        executable_path=${EXECDIR}${/}drivers${/}chromedriver
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://demo.openemr.io/b/openemr

End Browser
    Capture Page Screenshot
    Close Browser
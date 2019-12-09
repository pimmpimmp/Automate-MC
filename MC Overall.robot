*** Settings ***
Library    Selenium2Library
Library    DateTime
Library    String
Test Setup    Set Screenshot Directory    ${CURDIR}/Screenshot
Resource    Variables/Variables.robot
Resource    Keywords/Keywords.robot
Resource    Database/database.robot
# Suite teardown    Close all browsers


*** Test cases ***
User Earner login
    Open MC web
    login Pimm

User Earner Apply
    Search for apply MC
    Go Homepage

User Earner Check Apply
    Go Applied MC
    Go to card
    Check Card Apply
    Go Homepage

User Earner Submit

User Earner Logout

Call database
    ConnectDB
    Delete DB
Wait
    Sleep                       5
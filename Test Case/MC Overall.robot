*** Settings ***
Library    Selenium2Library
Library    DateTime
Library    String
Resource    ${CURDIR}/MC//Variables/Variables.robot
Resource    ${CURDIR}/Keywords/Keywords.robot
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

Wait
    Sleep                       5
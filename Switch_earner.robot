*** Settings ***
Library    Selenium2Library
Library    DateTime
Library    String
Test Setup    Set Screenshot Directory    ${CURDIR}/Screenshot
Resource    Variables/Variables.robot
Resource    Keywords/Keywords.robot
Resource    Database/database.robot
# Suite teardown    Close all browsers

*** Variables ***
${BROWSER}                      chrome
${MC_web}                       https://www.4lifelonglearning.org/
${MC_Main_Web}                  https://app.4lifelonglearning.org/en
${MC_test}                      https://d-app.4lifelonglearning.org/en/
${MC_test_dashboard}                      https://d-app.4lifelonglearning.org/en/reviewer/dashboard
${MC_test_server}               http://10.26.11.90:10001/en
${MC_test_server_dashboard}            http://10.26.11.90:10001/en/reviewer/dashboard

${Email_Earner_Pimm}                    jarinya.pimm@gmail.com
${Pass_Earner_Pimm}                     Pimm1806
${Email_Earner_Pimm2}                   jarinya.pimm2@gmail.com
${Pass_Earner_Pimm2}                    Pimm1806
${Email_test_01}                        test_user01@testmc.com
${Email_test_02}                        test_user02@testmc.com
${Pass_test}                            test1234
${User_Earner}                          earner.mc@gmail.com
${Pass_Earner}                          123456789
${User_Reviewer1}                       reviewer1.mc@gmail.com
${User_Reviewer2}                       reviewer2.mc@gmail.com
${Pass_Reviewer}                        123456789

${MC_test1}                             MC TEST 1


*** Keywords ***
Open MC web
    Open BROWSER                                        ${MC_test_server}                                                             ${BROWSER}
    Maximize Browser Window

User1 login
    Wait Until Page Contains                            Learn, Grow, Become
    Click Element                                       //a[contains(text(),"Sign in")]
    Wait Until Page Contains                            Don't have an account?
    Input Text                                          input-email                                                     ${Email_test_01}
    Input Text                                          input-password                                                  ${Pass_test}
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Learn, Grow, Become

User2 login
    Wait Until Page Contains                            Learn, Grow, Become
    Click Element                                       //a[contains(text(),"Sign in")]
    Wait Until Page Contains                            Don't have an account?
    Input Text                                          input-email                                                     ${Email_test_02}
    Input Text                                          input-password                                                  ${Pass_test}
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Learn, Grow, Become

User apply
    Input Text                                          inputSearchMC                                                   ${MC_test1}
    Press key                                           inputSearchMC                                                   \\13
    Wait Until Element Contains                         //div[@class="card-body"]//h4[contains(text(),"${MC_test1}")]              ${MC_test1}
    Click Element                                       //h4[contains(text(),"${MC_test1}")]
    Wait Until Page Contains                            Apply
    Click Element                                        //button/span/span[contains(text(),"Apply")]
    Sleep                                               2

Check Card Apply
    Wait Until Element Contains                         //div[@class="earner earner__status"]//div[contains(text(),"Applied")]                          Applied

User1 Submiss
    Input Text                                          //div[div[a[contains(text(),"First Submission")]]]//textarea                                    User1 unswer1
    Input Text                                          //div[div[a[contains(text(),"Read me more")]]]//textarea                                        User1 unswer2
    Input Text                                          //div[div[a[contains(text(),"xxx")]]]//textarea                                                 User1 unswer3
    Click button                                        id=mission
    Wait Until Page Contains                            You have successfully submitted the application.

User2 Submiss
    Input Text                                          //div[div[a[contains(text(),"First Submission")]]]//textarea                                    User2 unswer1
    Input Text                                          //div[div[a[contains(text(),"Read me more")]]]//textarea                                        User2 unswer2
    Input Text                                          //div[div[a[contains(text(),"xxx")]]]//textarea                                                 User2 unswer3
    Click button                                        id=mission
    Wait Until Page Contains                            You have successfully submitted the application.

login Reviewer
    Wait Until Page Contains                            Learn, Grow, Become
    Click Element                                       //a[contains(text(),"Sign in")]
    Wait Until Page Contains                            Don't have an account?
    Input Text                                          input-email                                                     ${User_Reviewer1}
    Input Text                                          input-password                                                  ${Pass_Reviewer}
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Learn, Grow, Become

Go to dashbaord
    go to                                               ${MC_test_server_dashboard}
    Wait Until Page Contains                            MC TEST 1

Go To card Test 1
    click Element                                       //*[contains(text(),"MC TEST 1")]
    Wait Until Page Contains                            Tasked reviewed

switch to user 1
    Click Button                                        //button[contains(text(),"Earner list")]
    Wait Until Page Contains                            pimm test user1
    Click Element                                        //span[contains(text(),"pimm test user1")]

check task1 user1
    Wait Until Element Is Enabled                       //span[contains(text(),"Pass")]
    Click Element                                       //span[contains(text(),"Pass")]


switch to user 2
    Click Button                                        //button[contains(text(),"Earner list")]
    Wait Until Page Contains                            pimm test user1
    Click Element                                        //span[contains(text(),"pimm test user2")]


check task1 user2
    Wait Until Element Is Enabled                       //span[contains(text(),"Not yet pass")]
    Click Element                                       //span[contains(text(),"Not yet pass")]

switch back to user1 check task1 data collect
    Click Button                                        //button[contains(text(),"Earner list")]
    Wait Until Page Contains                            pimm test user1
    Click Element                                        //span[contains(text(),"pimm test user1")]
    Wait Until Page Contains                            Pass

*** Test cases ***
# User1
#     Open MC web
#     User1 login
#     User apply
#     User1 Submiss
#     Close Browser

# User2
#     Open MC web
#     User2 login
#     User apply
#     User2 Submiss
#     Close Browser

Reviewer login
    Open MC web
    login Reviewer

Go to dashbaord
    Go to dashbaord
    Go To card Test 1
    switch to user 1
    check task1 user1
    switch to user 2
    switch back to user1 check task1 data collect
*** Settings ***
Library    Selenium2Library
Resource    Variables.robot

*** Keywords ***
Open MC web
    Open BROWSER                                        ${MC_web}                                                               ${BROWSER}
    Maximize Browser Window

Register1
    Wait Until Page Contains                            Learn. Build. Success.
    Click Element                                       //a[contains(text(),"Sign up")]
    Wait Until Page Contains                            Have an account?
    Input Text                                          input-firstname                                                 pimm
    Input Text                                          input-lastname                                                  test user1
    Input Text                                          input-email                                                     ${Email_1}
    Input Text                                          input-password                                                  test
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Password should be at least 6 characters
    Input Text                                          input-password                                                  ${Pass_2}
    Click Button                                        //button[@class="btn btn-success"]


login Earner
    Wait Until Page Contains                            Competency-based learning
    Click Element                                       //a[contains(text(),"Sign in")]
    Wait Until Page Contains                            Don't have an account?
    Input Text                                          input-email                                                     ${User_Earner}
    Input Text                                          input-password                                                  ${Pass_Earner}
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Learn, Grow, Become

login Pimm
    Wait Until Page Contains                            Competency-based learning
    Click Element                                       //a[contains(text(),"Sign in")]
    Wait Until Page Contains                            Don't have an account?
    Input Text                                          input-email                                                     ${Email_Earner_Pimm}
    Input Text                                          input-password                                                  ${Pass_Earner_Pimm}
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Learn, Grow, Become

Logout
    Click Element                                       //span[@class="user-profile ml-2"]
    Click Element                                       //a[contains(text(),"Sign out")]
    Wait Until Page Contains                            Sign up

Go Homepage
    Click Element                                       //img[@class="logo logo__header"]


Search
    Input Text                                          inputSearchMC                                                   Supply Chain Risk Management
    Press key                                           inputSearchMC                                                   \\13

Go Applied MC
    sleep                                               2
    Click Element                                       //span[contains(text(),"Applied MCs")]
    Wait Until Page Contains                            Applied Micro Credentials

Go to card
    Wait Until Element Contains                         //div[@class="card-body"]//h4[contains(text(),"Constructive Course Design")]              ${MC_apply}
    Click Element                                       //h4[contains(text(),"Constructive Course Design")]

Check Card Apply
    Wait Until Element Contains                         //div[@class="earner earner__status"]//div[contains(text(),"Applied")]                          Applied

Go Owner MC
    sleep                                               2
    Click Element                                       //a[contains(text(),"My Own MCs")]
    Wait Until Page Contains                            My Micro-credentials

Go Reviewer MC
    sleep                                               2
    Click Element                                       //a[contains(text(),"Review Evidence Submission")]
    Wait Until Page Contains                            My Micro-credentials

Create MC
    sleep                                               2
    Click Element                                       show-btn
    Wait Until Page Contains                            Overview
    Click Element                                       //button[@class="btn btn-success"]
    Wait Until Page Contains                            Title is required
    Click Element                                       //a[contains(text(),"Cancel")]
    sleep                                               1
    Click Element                                       show-btn
    Wait Until Page Contains                            Overview
    Input Text                                          mc-title                                                     Automate Test
    Input Text                                          mc-description                                               Automate Test Description
    Click Element                                       (//div[@class="tags-input-root"])[1]
    Click Element                                       //*[contains(text(),"Programming")]
    Click Element                                       (//div[@class="tags-input-root"])[2]
    Click Element                                       //*[contains(text(),"GraphQL")]
    Click Element                                       (//div[@class="tags-input-root"])[2]
    Click Element                                       //*[contains(text(),"Vuex")]
    Click Element                                       (//div[@class="tags-input-root"])[3]
    Click Element                                       //*[contains(text(),"Web Development")]
    Click Element                                       //*[@class="ml-5 custom-control custom-radio"]
    Click Element                                       //*[@id="price"]
    Input Text                                          //*[@id="price"]                                                       500
    Click Element                                       //label[contains(text(),"Free")]
    Click Element                                       //*[@id="price"]
    Input Text                                          //*[@id="price"]                                                       555
    Click Button                                        //button[@class="btn btn-success"]
    Sleep                                               1

Add Detail MC
    Sleep                                               1
    Click Element                                       //h4[contains(text(),"Automate Test")]
    Wait Until Page Contains                            Constructive Course Design
    Click Element                                       //div[span[p[contains(text(),"Constructive Course Design")]]]//button[contains(text(),"Edit")]
    Select From List                                    //select[@class="form-control"]                             Publish
    Input Text                                          mc-description                                              Edit Automate Test Description add more text too long word.
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[span[p[contains(text(),"Detail")]]]//button[contains(text(),"Edit")]
    Sleep                                               2
    ${text} =                                           getFile                                                                 ${CURDIR}/file/MCdetial.txt    encoding=UTF-8
    Select Frame                                        //*[@class="tox-edit-area__iframe"]
    Input Text                                          tinymce                                                                                                     ${text}
    Unselect Frame
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[p[contains(text(),"Learning unit/ Learning resources")]]//button[contains(text(),"+ Add")]
    Input Text                                          input-title                                                             Learning Unit 1
    Input Text                                          editor                                                                  Description Learning Unit 1
    sleep                                               1
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[p[contains(text(),"Learning unit/ Learning resources")]]//button[contains(text(),"+ Add")]
    Input Text                                          input-title                                                             Learning Unit 2
    Input Text                                          editor                                                                  Description Learning Unit 2
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${img}
    sleep                                               3
    Choose File                                         //input[@type="file"]                                                                ${doc}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${excel}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${pdf}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${ppt}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${vdo}
    sleep                                               2
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[p[contains(text(),"Learning unit/ Learning resources")]]//button[contains(text(),"+ Add")]
    Input Text                                          input-title                                                             For Delete
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[div[a[contains(text(),"For Delete")]]]//button[contains(text(),"Delete")]
    Click Button                                        //button[@class="btn btn-primary"]
    sleep                                               1
    Click Element                                       //div[p[contains(text(),"Submission & Evaluation")]]//button[contains(text(),"+ Add")]
    Input Text                                          input-title                                                             test
    Input Text                                          //textarea[@k-obj="input-description"]                                  test
    sleep                                               1
    Choose File                                         //input[@type="file"]                                                                ${img}
    Input Text                                          input-passCriterion                                                     test
    Input Text                                          input-notPassCriterion                                                  test
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[div[li[a[contains(text(),"test")]]]]//button[contains(text(),"Delete")]
    Click Button                                        //button[@class="btn btn-primary"]
    sleep                                               1
    Click Element                                       //div[p[contains(text(),"Submission & Evaluation")]]//button[contains(text(),"+ Add")]
    Input Text                                          input-title                                                             คำถามข้อที่ 1
    ${submis}                                           getFile                                                                 ${CURDIR}/file/submission.txt    encoding=UTF-8
    Input Text                                          //textarea[@k-obj="input-description"]                                  ${submis}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${img}
    sleep                                               3
    Choose File                                         //input[@type="file"]                                                                ${doc}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${excel}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${pdf}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${ppt}
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${vdo}
    sleep                                               2
    Input Text                                          input-passCriterion                                                     How to Pass ?
    Input Text                                          input-notPassCriterion                                                  How to Not Pass ?
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[p[contains(text(),"Submission & Evaluation")]]//button[contains(text(),"+ Add")]
    Input Text                                          input-title                                                             คำถามข้อที่ 2
    Input Text                                          //textarea[@k-obj="input-description"]                                  ไก่กับไข่อะไรเกิดก่อน?
    sleep                                               2
    Choose File                                         //input[@type="file"]                                                                ${img}
    sleep                                               2
    Input Text                                          input-passCriterion                                                     How to Pass ?
    Input Text                                          input-notPassCriterion                                                  How to Not Pass ?
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[p[contains(text(),"Reviewer")]]//div[contains(text(),"+ Add")]
    sleep                                               2
    Click Element                                       //div[contains(text(),"pimm pimmp")]
    Click Element                                       //div[contains(text(),"Palm Kmutt")]
    Click Element                                       //div[contains(text(),"pimm test user1")]
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[div[div[contains(text(),"Palm Kmutt")]]]//div[contains(text(),"Delete")]
    Wait Until Page Contains                            Are you sure that you want to delete this?
    Click Button                                        //button[a[contains(text(),"Delete")]]
    sleep                                               1

Select tab MC
    Sleep                                               1
    Wait Until Page Contains                            Constructive Course Design
    Click Element                                       //span[contains(text(),"Learning Units")]
    Click Element                                       //span[contains(text(),"Overview")]
    Click Element                                       //span[contains(text(),"Submission & Evaluation")]
    Click Element                                       //span[contains(text(),"Details")]


Search for apply MC
    Input Text                                          inputSearchMC                                                   Constructive Course Design
    Press key                                           inputSearchMC                                                   \\13
    Wait Until Element Contains                         //div[@class="card-body"]//h4[contains(text(),"Constructive Course Design")]              ${MC_apply}
    Click Element                                       //h4[contains(text(),"${MC_apply}")]
    Wait Until Page Contains                            Apply
    Click Element                                        //button/span/span[contains(text(),"Apply")]
    Sleep                                               2

Submit MC
# Try to Click
    # sleep                                               2
    # Click Element                                       //div[div[a[contains(text(),"Learning Unit 1")]]]//div[contains(text(),"Show Learning Unit")]
    # Wait Until Page Contains                            Hide Learning Unit
    # Click Element                                       //div[div[a[contains(text(),"Learning Unit 1")]]]//p[contains(text(),"Hide Learning Unit")]
    # Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Show Learning Unit")]
    # # Wait Until Page Contains                            Hide Learning Unit
    # Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Hide Learning Unit")]
    # Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Assessment Rubric")]
    # Sleep                                               1
    # Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Assessment Rubric")]
# Answer
    ${ans}                                              getFile                                                                 ${Text_ans}                                                           encoding=UTF-8
    Input Text                                          //div[div[a[contains(text(),"Provide profile of anticipated learners as followed:")]]]//textarea[@id="textarea-description"]                                  ${ans}
    sleep                                               2
    Choose File                                         //input[@type="file"][1]                                                                ${img}
    sleep                                               1
    Choose File                                         //input[@type="file"][1]                                                                ${img2}
    sleep                                               1
    Choose File                                         //input[@type="file"][1]                                                                ${doc}
    sleep                                               2
    Choose File                                         //input[@type="file"][1]                                                                ${excel}
    sleep                                               2
    Choose File                                         //input[@type="file"][1]                                                                ${pdf}
    sleep                                               2
    Choose File                                         //input[@type="file"][1]                                                                ${ppt}
    sleep                                               2
    Choose File                                         //input[@type="file"][1]                                                                ${vdo}
    sleep                                               3

    # Click Element                                       //a[contains(text(),"Submit Application")]

Tag

Category
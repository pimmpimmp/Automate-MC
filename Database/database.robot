*** Settings ***
Library    Selenium2Library
Library           DatabaseLibrary
Library           OperatingSystem



*** Variables ***
${DBHost}         mc-develop-services.chnqcpnomaqb.ap-southeast-1.rds.amazonaws.com
${DBName}         application
${DBUser}         admin
${DBPass}         2XzffjMJC7ZW
${DBPort}         3306


*** Keywords ***
ConnectDB
    Connect To Database Using Custom Params    pymysql    user='${DBUser}', password='${DBPass}', host='${DBHost}', port=${DBPort}
Delete DB
    # Execute Sql Script                      ${CURDIR}/delete.sql
    Execute Sql Script                      ${CURDIR}/delete_pimm.sql

# *** Test Cases ***
# # Connect
# #     Connect To Database         pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
# Connect2
#     Connect To Database Using Custom Params    pymysql    user='${DBUser}', password='${DBPass}', host='${DBHost}', port=${DBPort}
# Query
#     ${queryResults}    Query    SELECT * FROM application.Mcapp where userId = (select uId from user.Userlb where email = 'jarinya.pimm2@gmail.com');
#     Log Many    @{queryResults}
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

${DBHost_test}         10.26.11.90
${DBName_test}         application
${DBUser_test}         root
${DBPass_test}         1234
${DBPort_test}         33066


*** Keywords ***
ConnectDB
    Connect To Database Using Custom Params    pymysql    user='${DBUser}', password='${DBPass}', host='${DBHost}', port=${DBPort}
ConnectDB_test
    Connect To Database Using Custom Params    pymysql    user='${DBUser_test}', password='${DBPass_test}', host='${DBHost_test}', port=${DBPort_test}
Delete DB
    # Execute Sql Script                      ${CURDIR}/delete.sql
    # Execute Sql Script                      ${CURDIR}/delete_pimm.sql
    Execute Sql Script                      ${CURDIR}/dl_pimm_test.sql

*** Test Cases ***
Connect
    ConnectDB_test
    Delete DB

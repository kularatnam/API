*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  Collections

*** Variables ***
${baseurl}      https://rbccm-canada.smartsbroker.com
${date}     20200207
${feed}     omega

*** Test Cases ***
Get_alert
    [Tags]    DEBUG
    ${auth}=    create list     alerts      Smarts99$
    create session  mysession   ${baseurl}      auth=${auth}
    ${response}=    get request  mysession      /cmss/citadel/exportAlerts?date=${date}&marketCode=${feed}&apiVersion=9

    #Validations
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}       200
    ${status}=      convert to string   ${response.content}
    should contain      ${status}       PROCESSING COMPLETE

*** Keywords ***
Provided precondition
    #Setup system under test
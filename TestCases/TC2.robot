*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  Collections
Library  SeleniumLibrary

*** Variables ***
${Browser}  Chrome
${URL}  https://www.xe.com/mt/ca-money-transfer

${date}     20200207
${feed}     omega

*** Test Cases ***
Get_alert
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    click link  //*[@id="reactContainer"]/main/div[1]/section/div/div/div[2]/div/div[2]/a
    wait until page contains  Already have an account?
    click link  //*[@id="root"]/div[2]/div/div/section/footer/p/a
    wait until page contains  Need an account?
    input text  //*[@id="email"]  hussainzahirmuhammad@gmail.com
    input text  //*[@id="password"]  
    wait until element is enabled  //*[@id="signIn"]/button
    click button  //*[@id="signIn"]/button
#    [Tags]    DEBUG
#    ${auth}=    create list     alerts      Smarts99$
#    create session  mysession   ${baseurl}      auth=${auth}
#    ${response}=    get request  mysession      /cmss/citadel/exportAlerts?date=${date}&marketCode=${feed}&apiVersion=9

    #Validations
#    ${status_code}=     convert to string   ${response.status_code}
#    should be equal     ${status_code}       200
#    ${status}=      convert to string   ${response.content}
#    should contain      ${status}       PROCESSING COMPLETE

*** Keywords ***
Provided precondition
    #Setup system under test

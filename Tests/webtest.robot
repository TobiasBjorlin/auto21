*** Settings ***
Documentation  Lab with test cases
Library  SeleniumLibrary
Suite Setup  Open Browser To Start Page


*** Keywords ***
Open Browser To Start Page
    Open Browser  about:blank  chrome
    Go To  http://rental12.infotiv.net/
    Wait Until Page Contains  Infotiv Car Rental
End Web Test
    Close Browser
Press Continue Button
    Click Element  //*[@id="continue"]
    Wait Until Page Contains  What would you like to drive?
Press Continue Button To Fail Date
    Click Element  //*[@id="continue"]
    ${current_url}  Get Location
    Should Not Be Equal  current_url  http://rental12.infotiv.net/webpage/html/gui/showCars.php
Press ABOUT Button
    Click Element  //*[@id="about"]
    Wait Until Page Contains  Welcome
Input Start Date Outside Limits
    Input Text  //*[@id="start"]  0101






Login To Page With Correct Info
    Input Text  //*[@id="email"]  test@iths.se
    Input Password  //*[@id="password"]  apa123
    Click Element  //*[@id="login"]
    Wait Until Page Contains  You are signed in as Tobias
Press First Book Button
    Click Element  //*[@id="bookQ7pass5"]
    Wait Until Page Contains  Confirm booking of Audi Q7
Add Card Info And Confirm
    Input Text  //*[@id="cardNum"]  1234567891011120
    Input Text  //*[@id="fullName"]  Tobias
    Input Text  //*[@id="cvc"]  123
    Click Element  //*[@id="confirm"]
    Wait Until Page Contains  A Audi Q7 is now ready for pickup
Press My Page
    Click Element  //*[@id="mypage"]
    Wait Until Page Contains  My bookings
Press Cancel Booking And Confirm Alert
    Element Should Be Visible  //*[@id="unBook1"]
    Click Element  //*[@id="unBook1"]
    Alert Should Be Present
    Wait Until Page Contains  has been Returned


*** Test Cases ***
User Can Press ABOUT From Different Pages
    [Documentation]  This will test the ability for a user to click on ABOUT while in different pages
    [Tags]  Test ABOUT Button
    Press ABOUT Button
    End Web Test

    Open Browser To Start Page
    Press Continue Button
    Press ABOUT Button
    End Web Test

Select Date Outside Requirements
    [Documentation]  This will test the date selection, that it doesnt accept dates outside REQ
    [Tags]  Select Date
    Open Browser To Start Page
    Input Start Date Outside Limits
    Press Continue Button To Fail Date
    End Web Test


VG_test
    [Documentation]  This test will go from start to login and booking a car and removing it from booking list
    [Tags]  VG_test
    Open Browser To Start Page
    Given Login To Page With Correct Info
    And Press Continue Button
    And Press First Book Button
    And Add Card Info And Confirm
    And Press My Page
    And Press Cancel Booking And Confirm Alert
    Then Page Should Contain  has been Returned
    End Web Test

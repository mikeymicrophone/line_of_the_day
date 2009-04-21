Feature: Manage accounts
  In order to identify himself
  a pickup artist
  wants to create an account
  
  Scenario: new empty account
    Given I am on the new account page
    And I press "join"
    Then I should see "whasho name"

  Scenario: new account
    Given I am on the home page
    And I press "join up"
    And I fill in "username" with "schwabsauce"
    And I fill in "email" with "mike.schwab@example.com"
    And I fill in "password" with "women_want_to_fuck_me_everywhere_I_go"
    And I fill in "password_confirmation" with "women_want_to_fuck_me_everywhere_I_go"
    When I press "join"
    Then I should see "welcome little brother"
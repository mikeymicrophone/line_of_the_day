Feature: post a line
  In order to remember and share lines
  a pick-up artist
  wants his lines to be saved
  
  Scenario: posting an empty line
    Given I am on the home page
    And I press "save"
    Then I should see "speak up homey!"

  Scenario: posting a line
    Given I am on the home page
    And I fill in "line" with "How does a girl like you get to be a girl like you?"
    And I press "save"
    Then I should see "money"
    And there should be a line "How does a girl like you get to be a girl like you?"
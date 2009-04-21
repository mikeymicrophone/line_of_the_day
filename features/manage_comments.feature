Feature: Manage comments
  In order to share wisdom and reflection
  a pickup artist
  wants to be able to comment on lines
  
  Scenario: empty new comment
    Given I am on the line page for line "Hands up, guns out! Represent that world town!"
    And I press "comment"
    Then I should see "yeah speak up though"

  Scenario: new comment
    Given I am on the line page for line "Hands up, guns out! Represent that world town!"
    And I fill in "comment" with "Don't do it to me M.I.A.  No do it to me."
    And I press "comment"
    Then I should see "Don't do it to me M.I.A.  No do it to me."
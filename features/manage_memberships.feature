Feature: Manage memberships
  In order to share thoughts with many friends
  a pick-up artists
  wants to be able to
  
  Scenario: add button while member field still empty
    Given I am on the group page for my group "bantalones"
    And I press "add"
    Then I should see "who were you talking about again?."

  Scenario: add a member to an opt-in group
    Given I am on the group page for my group "scallops"
    And "scallops" is an opt-in group
    And I fill in "username" with "bad_bart"
    And I press "add"
    Then I should see "bad_bart invited."
  
  Scenario: add a member to an approve group
    Given I am on the group page for my group "dollops"
    And "dollops" is an approve group
    And I fill in "username" with "real_mccoy"
    And I press "add"
    Then I should see "real_mccoy invited."
  
  Scenario: add a member to an opt-out group
    Given I am on the group page for my group "horse riders"
    And "horse riders" is an opt-out group
    And I fill in "username" with "blackness"
    And I press "add"
    Then I should see "blackness"
  
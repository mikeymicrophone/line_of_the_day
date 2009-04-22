Feature: Publishing lines to groups
  In order to keep friends informed enough to be accurately critical of one's progress
  a pick-up artist
  wants to be able to publish lines to groups
  
  Scenario: Publish a line
    Given I am on the my lines page
    And I have a group "Watermelon & Peach"
    When I click the publish link next to my line "Hare Krishna, George Hareson"
    And I click "Watermelon & Peach"
    Then there should be a publication of the line "Hare Krishna, George Hareson" to the group "Watermelon & Peach"

  Scenario: View published line
    Given I am on the lines page
    And I am in the group "Dingo Mingol"
    And there is a publication of the line "Besmirched are we?" to the group "Dingo Mingol"
    Then I should see "Besmirched are we?"
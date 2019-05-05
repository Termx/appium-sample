Feature: User is able to use gestures

  Scenario: User is able to swipe to open the Left side menu
    Given I land on the Home screen
    When I swipe from left to right
    Then I should see the left side menu
    Then I swipe from right to left
    And I see "Length" as a current unit converter

  Scenario: User is able to swipe to open the Right side menu
    Given I land on the Home screen
    When I swipe from right to left
    And I see "Calculator" as a current unit converter
    When I swipe from left to right
    And I see "Length" as a current unit converter

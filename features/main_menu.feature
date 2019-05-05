Feature: Main Menu

  Scenario: I should see the left side menu when I tap the menu icon,
    Given I land on the Home screen
    When I press on the Menu icon
    Then I should see the left side menu

  Scenario: I should be able to open the My Conversions screen
    Given I land on the Home screen
    When I press on the Menu icon
    And I press on the My Conversions button
    Then I land on the My Conversions screen

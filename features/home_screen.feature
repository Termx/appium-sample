Feature: Tests for Home screen functionality

Background:
  Given I land on the Home screen

  Scenario: Default values on the Home screen is Foot and Centimeter
    Then the Left Unit picker value should be "Foot"
    And the Right unit picker value should be "Centimeter"

  Scenario: The Show All button should be enabled at launch
    Then the Show All button should be disabled
    When I type "1" on the application keyboard
    Then The Show All button should be enabled

  Scenario Outline: Verify default conversion
    When I type "<target>" on the application keyboard
    Then I should see the result as "<result>"
  Examples:
    |target|result    |
    |1     |30.48     |
    |2     |60.96     |
    |3     |91.44     |
    |9     |274.32    |
    |1011  |30 815.28 |

  Scenario: User is able to add current conversion to the Favorites list
    Then I press on the Add to Favorites icon
    When I press on the Menu icon
    Then I press on the Favorite conversions
    And I verify "Length" is added to Favorite conversions list

@wip
  Scenario: User able to search by existing Conversion type
    Then I press on the search icon
    Then I type "Temperature" in the search field
    And I press the return button on soft keyboard
    Then I see "Temperature" as a current unit converter
    Then the Left Unit picker value should be "Celsius"
    And the Right unit picker value should be "Fahrenheit"

  Scenario Outline: User is able to select values from unit pickers
    Then I select "<unit_type>" from the left unit picker
    When I type "<amount>" on the application keyboard
    Then I should see the result as "<result>"
    Examples:
    |unit_type| amount |  result |
    | Inch    | 1      | 2.54    |
    | Link    | 1      | 20.1168 |

  Scenario: User is able to convert values
    When I press on the Menu icon
    Then I select "Volume" from the menu
    Then I select "Cup" from the right unit picker
    When I type "1" on the application keyboard
    Then I should see the result as "15.1416"

  Scenario: User is able to cleanup conversion history
    When I press on the Menu icon
    Then I select "History" from the menu
    Then I see "History" as a current unit converter
    Then I should see the text as "No history right now"
    When I press on the Menu icon
    Then I select "Length" from the menu
    When I type "1" on the application keyboard
    When I press on the Menu icon
    Then I select "History" from the menu
    And I verify that the 1st result in history list is "Length"
    When I press delete from history at 1st row
    Then I should see the text "No history right now"

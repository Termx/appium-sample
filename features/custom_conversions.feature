Feature: User able to create and manage custom conversions

  Scenario: User is able to create a new conversion
    Given I land on the Home screen
    Then I press on the Menu icon
    Then I press on the My Conversions button
    Then I press on the Create Your First Conversion button
    And I type "Power" as a custom conversion name
    When I press on the New Unit button
    Then I type "Horse power" as a unit name
    Then I type "HP" as a unit symbol
    Then I type "1" as a unit value
    Then I press submit checkmark on the Custom Conversions screen
    When I press on New unit button
    Then I type "Mule power" as unit name
    Then I type "MP" as unit symbol
    Then I type "0.5" as unit value
    Then I press submit checkmark on the Custom Conversions screen
    When I press on the OK button on the Custom Conversions screen
    Then I verify "Power" is added to the Custom Conversions list

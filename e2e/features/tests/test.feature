Feature: Budgeting App

  Scenario: User add an inflow to the budget
    Given I open page "/"
    Given I check the current balance
    When user select a category "Income"
    And fill the description "test"
    And fill the value "10.00"
    And click on add button
    Then category "Income" is added with description "test" and value "10.00"
    And the total inflow value "10.00" is accurate
    And the total working balance is accurate
    When the Inflow vs Outflow report is generated
    Then the inflow amount is accurate

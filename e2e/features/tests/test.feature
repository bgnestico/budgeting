Feature: Budgeting App

  Scenario: User add an inflow to the budget and generates report
    Given I open page "/"
    Given I check the current balance
    When user select a category "Income"
    And fill the description "Salary"
    And fill the value "4000.00"
    And click on add button
    Then category "Income" is added with description "Salary" and value "4000.00"
    And the total inflow value "4000.00" is accurate
    And the total working balance is accurate
    When the Inflow vs Outflow report is generated
    Then the inflow amount is accurate
    And I close the browser


  Scenario: User add an outflow to the budget and generates report
    Given I open page "/"
    Given I check the current balance
    When user select a category "Travel"
    And fill the description "USA"
    And fill the value "-10.50"
    And click on add button
    Then category "Travel" is added with description "USA" and value "-10.50"
    And the total outflow value "-10.50" is accurate
    And the total working balance is accurate
    When the Inflow vs Outflow report is generated
    Then the outflow amount is accurate
    And I close the browser


  Scenario: User makes balance negative and generates report
    Given I open page "/"
    Given I check the current balance
    When user select a category "Travel"
    And fill the description "USA"
    And fill the value "-999999.00"
    And click on add button
    Then category "Travel" is added with description "USA" and value "-999999.00"
    And the total outflow value "-999999.00" is accurate
    And the total working balance is accurate
    When the Inflow vs Outflow report is generated
    Then the outflow amount is accurate
    And I close the browser

# Budgeting App test plan

- Prepared by: Daniel Cavenago
- Version: 1.0
- Date of creation: 20180928
- Last update: 20180928

## INTRODUCTION
### Goal
   This test plan describes the testing approach and overall framework that will drive the testing of the Budgeting App.
### Project description
   Budgeting App is a tool provided by Modus Create that allows users to create a personal budget, including incomes and outcomes, generating accurate reports so they can follow, understand and control their cash flow.

## TESTING STRATEGY
### Test Assumptions
   - Non-functional testing was performed and was successfully.
   - This is a web app only, not available for mobile.

### Test Objectives
   - Budgeting creation
   - Reporting creation
   - User experience

### Scope
   - Exploratory testing
   - Functional testing
   - Automation testing

### Out of scope
   - All types of Non Functional testing.
   - Mobile testing.
   - Multiple browsers testing.

### Approach
   - Black box manual testing.
   - End to end flows.
   - Automation with Watir and Cucumber.

### Test Environment
   - Local host using Chrome browser only.

## TEST MANAGEMENT PROCESS
### Tools
   - Jira
### Test design process
   - Understanding requirements
   - Use cases creation
   - Use cases review
   - Test cases creation
   - Test cases review

### Test cases design
   - Description
   - Type
   - Priority
   - Preconditions
   - Steps
   - Expected results

### Test execution process
   - Run tests
   - Set result of the execution
   - Bugs logging and follow up with devs
   - Daily stand up meetings

### Bug template
   - Title
   - Description
   - Priority
   - Steps to reproduce
   - Actual results
   - Expected results
   - Attachments (screenshots, videos, logs)
   - Environment

### Bug classification
   - Critical = App broken (Blocker)
   - High = Major feature implemented that is not meeting its requirements.
   - Medium = Feature implemented that is not meeting its requirements but impact is negligible.
   - Low = Cosmetic impact.

## USER STORIES AND TESTS CASES
   - User can see a table budget on budget page
   -- Test cases:
     - Verify that the budgeting table has a column labeled Category
     - Verify that the budgeting table has a column labeled Description
     - Verify that the budgeting table has a column labeled Amount
     - Verify that the budgeting table has a select field for categories
     - Verify that the budgeting table has a Description field
     - Verify that the budgeting table has an Amount field
     - Verify that the budgeting table has an Add button

  - User can see the balance fields
  -- Test cases:
     - Verify that there is a Total Inflow field at the bottom
     - Verify that there is a Total Outflow field at the bottom
     - Verify that there is a Working Balance field at the bottom

  User can add inflows to the budget
  Test cases:
     Verify that the user is able to add a Category type income
     Verify that the income added is color green on the table
     Verify that the income added has format number plus dot plus 2 digits
     Verify that the income added increases the total inflow amount accurately
     Verify that the income added increases the working balance amount accurately

  User can add outflows to the budget
  Test cases:
     Verify that the user is able to add a Category of any type but income
     Verify that the outflow added is color red on the table
     Verify that the outflow added has format negative number plus dot plus 2 digits
     Verify that the outflow added increases the total outflow amount accurately
     Verify that the outflow added decreases the working balance amount accurately

  User can fill Description field
  Test cases:
     Verify that the Description field is mandatory
     Verify that the Description field allows special characters
     Verify that the Description field has a limit of 100 characters

  User can fill Amount field
  Test cases:
     Verify that the Amount field is mandatory
     Verify that the Amount field allows only numbers and dots
     Verify that the Amount field format has a limit of 30 digits

  User can generate Inflow vs Outflow report
  Test cases:
      Verify there is a section labeled Inflow vs Outflow under report page
      Verify the report generated has an green Inflow column with the accurate total amount at the bottom
      Verify the report generated has an Outflow column split in categories with the accurate total amount at the bottom

  User can generate Spending by Category report
  Test cases:
      Verify there is a section labeled Spending by Category under report page
      Verify the report generated has all the categories and their accurate amount

# AUTOMATED TESTS

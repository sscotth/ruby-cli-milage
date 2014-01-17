Feature: Generic Add Function
  As a car owner
  In order to know much I spend on gas
  I want to enter in my fuel receipts

  # # Usage:
  #   `./mileage add`
  #
  # # Acceptance Criteria:
  #   * Asks for necessary information
  #   * Asks for a total confirmation
  #   * If something fails validation, it informs me the proper usage and to reenter the data

  Scenario: Proper Entry
    Given I have a fuel receipt
    When I use the 'add' argument
    Then It should prompt me to enter the transaction date
    When I enter the transaction date
    Then It should prompt me to enter the gallons purchased
    When I enter the gallons purchased
    Then It should prompt me to enter the price paid per gallon
    When I enter the price paid per gallon
    Then It should prompt me to confirm the entered information with the total amount spent
    When I press 'y' to confirm
    Then It should add the entry to the database
    When The entry has been added to the database
    Then It should display 'Saved!' along with the data entered and its id

  Scenario: Improper Date Entry
    Given I have a fuel receipt
    When I use the 'add' argument
    Then It should prompt me to enter the transaction date
    When I enter a non-valid transaction date
    Then It should display 'Cannot parse date. Usage: YYYY-MM-DD [HH:MM:SS]'
    And It should prompt me to enter the transaction date

  Scenario: Improper Gallons Entry
    Given I have a fuel receipt
    When I use the 'add' argument
    Then It should prompt me to enter the transaction date
    When I enter the transaction date
    Then It should prompt me to enter the gallons purchased
    When I enter a non-positive or non-numeric string
    Then It should display 'Cannot parse gallons. Usage: 12.345'
    And It should prompt me to enter the gallons purchased

  Scenario: Improper Price Entry
    Given I have a fuel receipt
    When I use the 'add' argument
    Then It should prompt me to enter the transaction date
    When I enter the transaction date
    Then It should prompt me to enter the gallons purchased
    When I enter the gallons purchased
    Then It should prompt me to enter the price paid per gallon
    When I enter a non-positive or non-numeric string
    Then It should display 'Cannot parse price. Usage: 3.45[9]'
    And It should prompt me to enter the price paid per gallon

  Scenario: Improper Confirmation
    Given I have a fuel receipt
    When I use the 'add' argument
    Then It should prompt me to enter the transaction date
    When I enter the transaction date
    Then It should prompt me to enter the gallons purchased
    When I enter the gallons purchased
    Then It should prompt me to enter the price paid per gallon
    When I enter the price paid per gallon
    Then It should prompt me to confirm the entered information with the total amount spent
    When I press any character other than 'y' or 'n'
    Then It should display 'Cannot confirm. Press "y" or "n"'

  Scenario: Unconfirmed Entry
    Given I have a fuel receipt
    When I use the 'add' argument
    Then It should prompt me to enter the transaction date
    When I enter the transaction date
    Then It should prompt me to enter the gallons purchased
    When I enter the gallons purchased
    Then It should prompt me to enter the price paid per gallon
    When I enter the price paid per gallon
    Then It should prompt me to confirm the entered information with the total amount spent
    When I press 'n' to not confirm
    Then It should display 'Canceled'

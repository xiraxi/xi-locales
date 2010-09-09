Feature: Only admins can modify translations

  Scenario: Anoymous user can not access to translations
    Given an anonymous session
    When I go to the translations page
    Then I see the login page

  Scenario: Regular users can not access to translations
    Given a regular user session
    When I go to the translations page
    Then I see the forbidden page

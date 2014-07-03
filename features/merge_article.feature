Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple similar blog articles
  I want to be able to merge articles into one

  Background:
    Given the blog is set up
    And the following users exist
      | id | login  | email            | password   |
      |  2 | thirty | thirty@22.com    | thirtyPass |
      |  3 | fourty | fourty@44.com    | fourtyPass |
    And the following articles exist
      | id | title  | body  | author   |
      |  3 | test3  | hello | thirty   |
      |  4 | test4  | world | fourty   |
    

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    And I am on the article page for "test3"
    Then I should not see "not found"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then article "test3" should have title "test3"
    And article "test3" should have body "hello world"
    And article "test3" should be owned by "thirty"
    And show me the page

  Scenario: non-admin user should not be allowed to merge articles
    Given I am on the article page for "test3"
    #And show me the page
    Then I should not see "not found"
    And I should see "Login"
    And I should not see "merge_with"
    And I should not see "Merge"
    And article "test3" should have title "test3"
    And article "test3" should have body "hello"
    And article "test3" should be owned by "thirty"


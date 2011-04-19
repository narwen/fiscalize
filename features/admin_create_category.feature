Feature: Admin creates a category

  Scenario: success
    Given I am on the categories page
    And I follow "New Category"
    And I fill in "Name" with "Restaurant"
    And I fill in "URL" with "restaurant"
    When I press "Create"
    Then I should see "Category was created."
    And I should see the following table:
      | Name       | URL        | 
      | Restaurant | restaurant |



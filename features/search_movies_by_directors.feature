
Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Bridgeton    | G      | Chris Vans   |   1968-04-06 |
  | Mean Girls   | PG     |              |   1981-06-12 |
  | Friends      | PG     | Chris Vans   |   1950-06-12 |
  | Alladin      | G      | Chris Vans   |   2000-06-12 |
  | Holiday      | R      | Ridley Hogan |   2019-06-12 |
  
 
  
 
Scenario: add director to existing movie
  When I go to the edit page for "Bridgeton"
  And  I fill in "Director" with "Chris Vans"
  And  I press "Update Movie Info"
  Then the director of "Bridgeton" should be "Chris Vans"

Scenario: find movie with same director
  Given I am on the details page for "Bridgeton"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Friends"
  And   I should see "Alladin"
  But   I should not see "Mean Girls"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Mean Girls"
  Then  I should not see "Chris Vans "
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Mean Girls' has no director info"
Feature: Blogger
  As a Blogger
  I want to share my thoughts with the world
  so that everyone knows how brilliant I am

  @wip
  Scenario: making a duplicate blog entry
    When I make a duplicate blog entry
    Then I get an error message

  Scenario: Adding the blog entry
    When I add a new blog entry
    Then blog post shows at the top of the list

  Scenario: displaying blog posts
    When displaying blog posts
    Then only the previous 10 should display






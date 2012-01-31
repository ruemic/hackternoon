Feature: Bob can create a project
  In order to promote Hackternoon
  I allow Bob, a current user, to create a project

    @javascript
    Scenario: Bob can create a project
      Given I exist as a user
      And I go to the home page
      And I should see page_has_link "Projects"
      And I follow "Projects"
      And I should see page_has_link "New Project"
      And I follow "New Project"
      Then I should see "New Project"
      And I should not see "User"
      And I should not see "Dscrptn"
      And I should not see "url"
      And I should see "Github URL"
      And I should see "Description"
      And I fill in the following:
        | Name               | hackternoon.com   |
        | project_dscrptn    | Hackternoon.com helps Hackternooners find partners and projects. |
        | project_github_url | http://github.com/hackternoon |
      And I press "Save"
      Then I should see "Hackternooners"
      And I should see "Project was successfully created."
      And I should see page_has_link "Edit"
      And I should see page_has_no_link "Back"
      And I follow "Edit"
      And I should see "Editing project"
      And I should see "Description"
      And I should see page_has_no_link "Back"
      And I should see page_has_link "Show"
      And I fill in the following:
        | Name | Hackternoon.com   |
      And I press "Save"
      And debug
      Then I should see "Hackternooners"
      And I should see page_has_link "Bob"

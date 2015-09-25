require "test_helper"

feature "Teams have crud actions" do
  scenario "create a new team" do
    # Given a signed-id user at a new team page
    sign_in
    visit '/'
    click_on "Teams"
    click_on "New Team"
    # When I submit a filled-in form
    fill_in "Name", with: "Seattle Sounders FC"
    click_on "Create Team"
    # Then a team is created
    page.must_have_content "Team was successfully created."
    page.must_have_content "Seattle Sounders FC"
  end

  scenario "update a team" do
    # Given a signed-in user and an existing team
    sign_in
    visit teams_path
    click_on "Tigers"
    click_on "Edit"
    # When I update a field and submit
    fill_in "Name", with: "Leopards"
    click_on "Update Team"
    # Then the team is updated
    page.must_have_content "Team was successfully updated."
    page.must_have_content "Leopards"
  end
end

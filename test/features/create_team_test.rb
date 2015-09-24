require "test_helper"

feature "Create team" do
  scenario "create a new team" do
    # Given a signed-id user at a new team page
    sign_in
    click_on "Teams"
    click_on "New Team"
    # When I submit a filled-in form
    fill_in "Name", with: "Seattle Sounders FC"
    click_on "Create Team"
    # Then a team is created
    page.must_have_content "Team was succesfully created."
    page.must_have_content "Seattle Sounders FC"
  end
end

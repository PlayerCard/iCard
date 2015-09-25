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
    click_on "Edit team and lineup"
    # When I update a field and submit
    fill_in "Name", with: "Leopards"
    click_on "Update Team"
    # Then the team is updated
    page.must_have_content "Team was successfully updated."
    page.must_have_content "Leopards"
  end

  scenario "delete a team" do
    # Given an signed-in user and an existing team
    sign_in
    visit team_path(teams(:lions))
    # When I click delete
    click_on "Delete"
    # The team should be deleted
    page.must_have_content "Team was successfully deleted."
    page.wont_have_content "Lions"
  end

  scenario "edit lineup and submit successfully" do
    visit teams_path
    click_on "Tigers"
    click_on "Edit team and lineup"
    save_and_open_page
    uncheck "team_team_memberships_attributes_0_in_line_up"
    click_on "Update Team"
    page.must_have_content "Team was successfully updated."
  end

  scenario "submit lineup with too many players gives error" do
    visit teams_path
    click_on "Tigers"
    click_on "Edit team and lineup"
    check "team_team_memberships_attributes_5_in_line_up"
    click_on "Update Team"
    page.must_have_content "Cannot select more than 20 players for lineup, you selected 21."
  end
end

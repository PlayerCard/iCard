require "test_helper"

feature "Games have crud actions" do
  scenario "index should show games" do
    # When I visit the games index view
    sign_in
    visit games_path
    # Existing games should be listed
    page.must_have_content "Tigers VS. Lions"
  end

  scenario "create games" do
    # Given a new game form
    sign_in
    visit new_game_path
    # When I submit a valid form
    select('Tigers', from: 'game_team_ids')
    select('Bears', from: 'game_team_ids')
    fill_in "Game location", with: "Narnia"
    click_on "Create Game"
    # A game should be created
    page.must_have_content "Game was successfully created."
    page.must_have_content "Bears @ Tigers"
    page.must_have_content "Location: Narnia"
  end
end

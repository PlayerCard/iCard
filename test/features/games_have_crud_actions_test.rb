require "test_helper"

feature "Games have crud actions" do
  scenario "index should show games" do
    # When I visit the games index view
    sign_in
    visit games_path
    # Existing games should be listed
    page.must_have_content "Tigers VS. Lions"
  end
end

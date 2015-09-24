require "test_helper"

feature "Create A Profile" do
  scenario "submit form data to create new profile" do
    # Given a user is signed in
    sign_in(:player_1)

    # Given a completed new profile form
    visit new_profile_path
    # fill_in "Title", with: "Code Rails"
    # fill_in "Body", with: "This is how I learned to make web apps."
    # When I submit the form
    click_on "Create profile"
    # Then a new profile should be created and displayed
    # page.text.must_include "profile was successfully created"
    # page.text.must_include "how I learned to make web apps"
    # page.has_css? "#author"
    # page.text.must_include users(:user).email
  end
end

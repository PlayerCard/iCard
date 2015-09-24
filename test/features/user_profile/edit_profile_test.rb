require "test_helper"

feature "Edit A Profile" do
  scenario "submit updates to an existing profile" do
    sign_in(:player_1)
    visit profile_path(profiles(:player_1_profile))
    click_on "Edit"
    # fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update profile"
    # page.text.must_include "profile was successfully updated"
    # page.text.must_include "Web Developer"
  end
end

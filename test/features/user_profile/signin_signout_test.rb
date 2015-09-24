require "test_helper"

feature "User Sign In & Out" do
  scenario "sign in and out a valid user" do
    sign_in(:player_1)
    page.text.must_include "Signed in successfully"
    click_on "Sign out"
    page.text.must_include "Signed out successfully"
  end

  scenario "invalid sign in" do
    visit new_user_session_path
    fill_in "Email", with: "user@invalid"
    fill_in "Password", with: "password"
    click_on "Log in"
    page.text.must_include "Invalid email or password"
    fill_in "Email", with: users(:player_1).email
    fill_in "Password", with: "invalid"
    click_on "Log in"
    page.text.must_include "Invalid email or password"
  end
end

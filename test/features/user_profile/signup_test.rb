require "test_helper"

feature "User Sign Up" do
  scenario "valid signup information with user activation" do
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: "new_user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.text.must_include "Signed in as: new_user@example.com"
  end

  scenario "invalid signup information fails" do
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: "user@invalid"
    fill_in "Password", with: "foo"
    fill_in "Password confirmation", with: "bar"
    click_button "Sign up"
    page.text.must_include "prohibited this user from being saved"
  end
end

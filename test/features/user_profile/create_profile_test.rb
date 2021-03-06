require "test_helper"

feature "Create A Profile" do
  scenario "submit form data to create new profile" do
    # Given a new user (without a profile)
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'newguy@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button "Sign up"
    # Given a completed new profile form
    fill_in "Name", with: "New Guy"
    fill_in "Address 1", with: "line one"
    fill_in "Address 2", with: "line two"
    fill_in "City", with: "Bellingham"
    fill_in "State", with: "WA"
    fill_in "Zip", with: 98_225
    click_button "Create Profile"
    page.must_have_content "Profile was successfully created"
    page.must_have_content "New Guy"
  end

  scenario "wont create invalid profile" do
    # Given an new profile form
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'newguy@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button "Sign up"
    # When I submit an invalid form
    fill_in "Name", with: ""
    click_button "Create Profile"
    # The profile is not created
    page.must_have_content "prohibited this profile from being saved:"
    page.must_have_content "Name can't be blank"
  end
end

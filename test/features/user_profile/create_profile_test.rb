require "test_helper"

feature "Create A Profile" do
  scenario "submit form data to create new article" do
    # Given a user is signed in
    sign_in

    # Given a completed new article form
    visit new_article_path
    fill_in "Title", with: "Code Rails"
    fill_in "Body", with: "This is how I learned to make web apps."
    # When I submit the form
    click_on "Create Article"
    # Then a new article should be created and displayed
    page.text.must_include "Article was successfully created"
    page.text.must_include "how I learned to make web apps"
    page.has_css? "#author"
    page.text.must_include users(:user).email
  end
end

require "test_helper"

feature "Edit A Profile" do
  scenario "submit updates to an existing article" do
    sign_in(:player_1)
    visit article_path(articles(:profile_1))
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Article"
    page.text.must_include "Article was successfully updated"
    page.text.must_include "Web Developer"
  end
end

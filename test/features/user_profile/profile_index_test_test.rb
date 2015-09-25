require "test_helper"

feature "Profile index" do
  scenario "index lists profiles" do
    visit profiles_path
    page.must_have_content "Matt Yang"
    page.must_have_content "member: Tigers"
    page.must_have_content "team manager: Tigers"
  end
end

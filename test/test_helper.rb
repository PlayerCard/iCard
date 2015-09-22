ENV["RAILS_ENV"] = "test"
Rails.env = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def sign_in(role = :player)
    # Sign in authenticated user
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Name", with: users(role).name
    fill_in "Password", with: "password"
    click_on "Log in"
  end
end

system 'rubocop'

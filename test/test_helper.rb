ENV["RAILS_ENV"] = "test"
Rails.env = "test"
require 'simplecov'
SimpleCov.start
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"
# Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def sign_in(user = :player)
    # Sign in authenticated user
    visit new_user_session_path
    fill_in "Email", with: users(user).email
    fill_in "Password", with: "password"
    click_on "Log in"
  end
end

system 'rubocop'

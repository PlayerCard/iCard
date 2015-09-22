require "test_helper"

class CardTest < ActiveSupport::TestCase
  def card
    @card ||= Card.new
  end
end

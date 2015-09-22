require "test_helper"

class CardTest < ActiveSupport::TestCase
  def card
    @card ||= Card.new
  end

  def test_valid
    assert card.valid?
  end
end

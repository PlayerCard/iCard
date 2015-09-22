require "test_helper"

class GameTest < ActiveSupport::TestCase
  def game
    @game ||= Game.new
  end

  def test_valid
    assert game.valid?
  end
end

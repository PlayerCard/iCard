require "test_helper"

class GamePlayerTest < ActiveSupport::TestCase
  def game_player
    @game_player ||= GamePlayer.new
  end

  def test_valid
    assert game_player.valid?
  end
end

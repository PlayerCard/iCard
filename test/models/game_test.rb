require "test_helper"

class GameTest < ActiveSupport::TestCase
  def game
    @game ||= Game.new
  end
end

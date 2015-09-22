require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def team
    @team ||= Team.new
  end

  def test_valid
    assert team.valid?
  end
end

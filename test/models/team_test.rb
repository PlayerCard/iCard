require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def team
    @team ||= Team.new
  end
end

require "test_helper"

class RosterTest < ActiveSupport::TestCase
  def roster
    @roster ||= Roster.new
  end

  def test_valid
    assert roster.valid?
  end
end

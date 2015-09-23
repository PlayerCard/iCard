require "test_helper"

class RosterTest < ActiveSupport::TestCase
  def roster
    @roster ||= Roster.new
  end
end

class Team < ActiveRecord::Base
  has_many :users, through: :roster
  has_many :rosters

  def managers
    rosters.where(is_manager: true).map{ |roster| roster.user }
  end

  def line_up
    rosters.where(in_line_up: true).map{ |roster| roster.user }
  end
end

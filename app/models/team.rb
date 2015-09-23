class Team < ActiveRecord::Base
  has_many :users, through: :team_memberships
  has_many :team_memberships

  def managers
    team_memberships.where(is_manager: true).map{ |team_membership| team_membership.user }
  end

  def line_up
    team_memberships.where(in_line_up: true).map{ |team_membership| team_membership.user }
  end
end

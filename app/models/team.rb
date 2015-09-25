class Team < ActiveRecord::Base
  has_many :users, through: :team_memberships
  has_many :team_memberships
  has_many :game_players
  has_and_belongs_to_many :games

  def managers
    team_memberships.where(is_manager: true).map(&:user)
  end

  def line_up
    team_memberships.where(in_line_up: true).map(&:user)
  end
end

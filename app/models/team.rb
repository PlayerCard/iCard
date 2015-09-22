class Team < ActiveRecord::Base
  has_many :players, through: :player_team
  has_many :player_teams

  def managers
    player_teams.where(manager: :true).map{ |player_teams| player_teams.player }
  end

  def roster
    players 
  end

  def line_up
    player_teams.where(in_line_up: :true).map
  end
end

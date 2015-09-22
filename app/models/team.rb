class Team < ActiveRecord::Base
  has_many :players, through: :team_player
  has_many :team_players

  def managers
    team_players.where(manager: :true).map{ |team_players| team_players.player }
  end

  def roster
    players 
  end

  def line_up
    team_players.where(in_line_up: :true).map
  end
end

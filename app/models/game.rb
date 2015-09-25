class Game < ActiveRecord::Base
  has_many :cards
  has_many :game_players
  has_and_belongs_to_many :teams
  belongs_to :referee, class_name: 'User'

  def pull_line_up(team)
    team.line_up.each do |player|
      game_player.create(game: @game, player: player, team: team)
    end
  end

  def home_player_ids

  end

  def home_player_ids=(player_ids)
    player_ids.each do |player_id|
      game_players.create(user_id: player_id, team_id: teams.first.id)
    end
  end

  def away_player_ids

  end

  def away_player_ids=(player_ids)
    player_ids.each do |player_id|
      game_players.create(user_id: player_id, team_id: teams.last.id)
    end
  end

end

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
end

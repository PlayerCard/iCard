class GamesTeams < ActiveRecord::Migration
  def change
    create_table :games_teams, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :team, index: true
    end
  end
end

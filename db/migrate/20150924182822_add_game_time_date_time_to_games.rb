class AddGameTimeDateTimeToGames < ActiveRecord::Migration
  def change
    remove_column :games, :game_time, :date
    add_column :games, :game_time, :datetime
  end
end

class RemoveColumnsFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :home_team, :integer
    remove_column :games, :away_team, :integer
  end
end

class ChangeRefereeToRefereeIdOnGames < ActiveRecord::Migration
  def change
    remove_column :games, :referee, :integer
    add_column :games, :referee_id, :integer, index: true
  end
end

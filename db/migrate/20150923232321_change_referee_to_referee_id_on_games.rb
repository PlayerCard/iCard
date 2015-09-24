class ChangeRefereeToRefereeIdOnGames < ActiveRecord::Migration
  def change
    rename_column :games, :referee, :referee_id
    change_column :games, :referee_id, :integer, index: true
  end
end

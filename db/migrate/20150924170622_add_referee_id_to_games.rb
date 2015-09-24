class AddRefereeIdToGames < ActiveRecord::Migration
  def change
    remove_column :games, :referee, :integer
    add_reference :games, :referee, index: true
  end
end

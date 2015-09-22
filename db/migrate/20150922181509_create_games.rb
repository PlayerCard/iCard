class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer  :home_team, null: false
      t.integer  :away_team, null: false
      t.date     :game_time
      t.string   :game_location
      t.integer  :referee, index: true, null: false

      t.timestamps null: false
    end
  end
end

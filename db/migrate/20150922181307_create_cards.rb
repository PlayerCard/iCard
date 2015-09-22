class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string   :color, null: false, default: "Yellow"
      t.string   :comments
      t.integer  :player_id, index: true, null: false
      t.integer  :game_id, index: true, null: false

      t.timestamps null: false
    end
  end
end

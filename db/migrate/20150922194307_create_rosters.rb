class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :user, index: true
      t.references :team, index: true
      t.boolean :in_line_up
      t.boolean :is_manager
      t.timestamps null: false
    end
  end
end

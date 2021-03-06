class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :role, null: false, default: "player"
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :profiles, :role
  end
end

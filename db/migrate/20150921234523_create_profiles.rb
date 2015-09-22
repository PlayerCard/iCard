class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :picture_url
      t.string :role
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :profiles, :role
  end
end

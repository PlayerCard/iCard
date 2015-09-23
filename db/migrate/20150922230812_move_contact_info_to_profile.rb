class MoveContactInfoToProfile < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :address_1, :string
    remove_column :users, :address_2, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :zip, :integer

    add_column :profiles, :name, :string
    add_column :profiles, :address_1, :string
    add_column :profiles, :address_2, :string
    add_column :profiles, :city, :string
    add_column :profiles, :state, :string
    add_column :profiles, :zip, :integer
  end
end

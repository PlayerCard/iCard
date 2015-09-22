class AddContactToUser < ActiveRecord::Migration
  def change
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
  end
end

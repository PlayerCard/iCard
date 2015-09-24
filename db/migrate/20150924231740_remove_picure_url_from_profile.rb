class RemovePicureUrlFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :picture_url, :string
  end
end

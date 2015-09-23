class DropRosters < ActiveRecord::Migration
  def up
    drop_table :rosters 
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

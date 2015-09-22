class CreateTeamPlayer < ActiveRecord::Migration
  def change
    create_table :team_players do |t|
      t.references :player_id, index: true
      t.references :team_id, index: true
      t.boolean :manager
      t.boolean :in_line_up
    end
  end
end

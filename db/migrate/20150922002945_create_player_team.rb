class CreateTeamPlayer < ActiveRecord::Migration
  def change
    create_table :player_teams do |t|
      t.references :player_id, index: true
      t.references :team_id, index: true
      t.boolean :manager
      t.boolean :in_line_up
    end
  end
end

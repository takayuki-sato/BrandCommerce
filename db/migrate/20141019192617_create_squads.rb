class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.integer :player_id
      t.integer :team_id

      t.timestamps
    end
    add_index :squads, :team_id
    add_index :squads, :player_id
    add_index :squads, [:team_id, :player_id], unique: true
  end
end

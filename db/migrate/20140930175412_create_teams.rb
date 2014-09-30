class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :type
      t.integer :player_id

      t.timestamps
    end
  end
end

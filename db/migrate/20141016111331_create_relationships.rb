class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :player_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :player_id
    add_index :relationships, [:user_id, :player_id], unique: true
  end
end

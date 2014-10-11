class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.string :url
      t.integer :player_id

      t.timestamps
    end
    add_index :items, [:player_id, :created_at]
  end
end

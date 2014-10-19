class AddDetailsToItems < ActiveRecord::Migration
  def change
    add_column :items, :team_id, :integer
    add_index :items, :team_id
  end
end

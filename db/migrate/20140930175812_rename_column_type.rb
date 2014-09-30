class RenameColumnType < ActiveRecord::Migration
  def self.up
    rename_column :teams, :type, :organization
  end

  def self.down
    rename_column :teams, :organization, :type
  end
end

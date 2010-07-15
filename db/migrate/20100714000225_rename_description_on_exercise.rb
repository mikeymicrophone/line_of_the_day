class RenameDescriptionOnExercise < ActiveRecord::Migration
  def self.up
    rename_column :exercises, :description, :instruction
    rename_column :exercises, :name, :moniker
  end

  def self.down
    rename_column :exercises, :instruction, :description
    rename_column :exercises, :moniker, :name
  end
end

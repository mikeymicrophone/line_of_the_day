class RenameDescriptionOnExercise < ActiveRecord::Migration
  def self.up
    rename_column :exercises, :description, :instruction
  end

  def self.down
    rename_column :exercises, :instruction, :description
  end
end

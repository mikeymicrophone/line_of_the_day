class CreateScenes < ActiveRecord::Migration
  def self.up
    create_table :scenes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :scenes
  end
end

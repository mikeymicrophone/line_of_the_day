class VideosHaveNames < ActiveRecord::Migration
  def self.up
    add_column :videos, :name, :string
  end

  def self.down
    remove_column :videos, :name
  end
end

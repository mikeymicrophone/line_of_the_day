class PrivateStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :private, :integer
  end

  def self.down
    remove_column :stories, :private
  end
end

class AddAvatars < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar, :string
    add_column :groups, :avatar, :string
  end

  def self.down
    remove_column :users, :avatar
    remove_column :groups, :avatar
  end
end

class AdminUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :integer
  end

  def self.down
    remove_column :users, :admin
  end
end

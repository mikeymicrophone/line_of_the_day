class WhoWhereWhat < ActiveRecord::Migration
  def self.up
    add_column :approaches, :user_id, :integer
    add_column :results, :user_id, :integer
    add_column :scenes, :user_id, :integer
  end

  def self.down
    remove_column :approaches, :user_id
    remove_column :results, :user_id
    remove_column :scenes, :user_id
  end
end

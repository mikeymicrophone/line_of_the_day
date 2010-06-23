class GoalAccomplishment < ActiveRecord::Migration
  def self.up
    add_column :goal_ownerships, :complete, :boolean
    add_column :goal_ownerships, :progress, :integer
  end

  def self.down
    remove_column :goal_ownerships, :complete
    remove_column :goal_ownerships, :progress
  end
end

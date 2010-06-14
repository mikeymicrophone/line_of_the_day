class AddGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.string :objective_type
      t.integer :objective_id
      t.integer :user_id
      t.integer :repetitions
      t.integer :days
      t.timestamps
    end
    
    create_table :goal_ownerships do |t|
      t.integer :user_id
      t.integer :goal_id
      t.timestamps
    end
  end

  def self.down
    drop_table :goals
    drop_table :goal_ownerships
  end
end

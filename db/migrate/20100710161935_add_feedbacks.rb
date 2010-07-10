class AddFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.text :thoughts
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end

class AddTips < ActiveRecord::Migration
  def self.up
    create_table :tips do |t|
      t.text :advice
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tips
  end
end

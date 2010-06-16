class AddLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name
      t.integer :private
      t.integer :highlight
      t.integer :position
      t.integer :user_id
      t.timestamps
    end
    
    create_table :list_items do |t|
      t.string :item_type
      t.integer :item_id
      t.integer :private
      t.integer :highlight
      t.integer :user_id
      t.integer :list_id
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :lists
    drop_table :list_items
  end
end

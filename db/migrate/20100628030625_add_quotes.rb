class AddQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.text :text
      t.string :page_number
      t.string :source_type
      t.integer :source_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end

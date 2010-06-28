class AddBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end

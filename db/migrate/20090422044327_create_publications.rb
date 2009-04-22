class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.text :text
      t.integer :line_id
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end

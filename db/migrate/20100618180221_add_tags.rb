class AddTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :target_type
      t.integer :target_id
      t.string :subject_type
      t.integer :subject_id
      t.integer :user_id
      t.integer :value
      t.timestamps
    end
    
    create_table :concepts do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tags
    drop_table :concepts
  end
end

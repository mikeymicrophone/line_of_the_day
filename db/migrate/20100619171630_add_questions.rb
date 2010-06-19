class AddQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text :name
      t.integer :user_id
      t.timestamps
    end
    
    create_table :stories do |t|
      t.string :name
      t.text :telling
      t.integer :user_id
      t.integer :scene_id
      t.datetime :occurred_at
      t.timestamps
    end
    
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end

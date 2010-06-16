class AddBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :name
      t.string :url
      t.string :feed_url
      t.integer :author_id
      t.integer :user_id
      t.timestamps
    end
    
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.text :content
      t.integer :blog_id
      t.datetime :posted_at
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
    drop_table :posts
  end
end

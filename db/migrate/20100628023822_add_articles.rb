class AddArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.text :url
      t.string :title
      t.string :source
      t.integer :user_id
      t.integer :author_id
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end

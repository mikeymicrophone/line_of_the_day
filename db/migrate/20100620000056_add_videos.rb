class AddVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.text :embed
      t.integer :user_id
      t.timestamps
    end
    
    create_table :artists do |t|
      t.string :name
      t.string :alias
      t.timestamps
    end
    
    create_table :websites do |t|
      t.string :url
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
    drop_table :artists
    drop_table :websites
  end
end

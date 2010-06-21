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
      t.string :email
      t.integer :identity_id
      t.integer :company_id
      t.integer :user_id
      t.timestamps
    end
    
    create_table :websites do |t|
      t.string :url
      t.string :name
      t.integer :company_id
      t.integer :user_id
      t.timestamps
    end
    
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.timestamps
    end
    
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :url
      t.text :description
      t.integer :user_id
      t.integer :company_id
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
    drop_table :artists
    drop_table :websites
  end
end

class AddLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :position_id
      t.integer :scene_id
      t.integer :neighborhood_id
      t.integer :user_id
      t.timestamps
    end
    
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :city_id
      t.integer :user_id
      t.timestamps
    end
    
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.integer :state_id
      t.integer :user_id
      t.timestamps
    end
    
    create_table :states do |t|
      t.string :name
      t.integer :country_id
      t.integer :user_id
      t.timestamps
    end
    
    create_table :countries do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
    
    create_table :positions do |t|
      t.column :latitude, :decimal, :precision => 15, :scale => 10
      t.column :longitude, :decimal, :precision => 15, :scale => 10
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
    drop_table :neighborhoods
    drop_table :cities
    drop_table :states
    drop_table :countries
    drop_table :positions
  end
end

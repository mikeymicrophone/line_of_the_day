class AddRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.string :target_type
      t.integer :target_id
      t.integer :opinion
      t.string :context_type
      t.integer :context_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end

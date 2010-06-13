class AddAffirmations < ActiveRecord::Migration
  def self.up
    create_table :affirmations do |t|
      t.text :phrase
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :affirmations
  end
end

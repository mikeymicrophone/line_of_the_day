class AddGuidances < ActiveRecord::Migration
  def self.up
    create_table :guidances do |t|
      t.integer :coach_id
      t.integer :student_id
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :guidances
  end
end

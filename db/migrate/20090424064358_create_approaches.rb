class CreateApproaches < ActiveRecord::Migration
  def self.up
    create_table :approaches do |t|
      t.text :context
      t.integer :line_id
      t.integer :scene_id
      t.integer :hotness
      t.integer :result_id

      t.timestamps
    end
  end

  def self.down
    drop_table :approaches
  end
end

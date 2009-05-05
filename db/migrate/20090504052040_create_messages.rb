class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :reply_id
      t.integer :recipient_id
      t.integer :user_id
      t.datetime :read_at

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end

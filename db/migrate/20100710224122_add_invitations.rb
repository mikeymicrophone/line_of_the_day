class AddInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.string :email
      t.text :message
      t.boolean :used
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end

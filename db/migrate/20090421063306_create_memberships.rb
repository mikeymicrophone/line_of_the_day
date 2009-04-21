class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end

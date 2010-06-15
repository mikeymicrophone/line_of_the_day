class MoreObjectsCommendable < ActiveRecord::Migration
  def self.up
    add_column :comments, :target_type, :string
    rename_column :comments, :line_id, :target_id
    
    Comment.update_all('target_type = "Line"')
  end

  def self.down
    remove_column :comments, :target_type
    rename_column :comments, :target_id, :line_id
  end
end

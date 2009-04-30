class LinePhrasing < ActiveRecord::Migration
  def self.up
    rename_column :lines, :text, :phrasing
  end

  def self.down
    rename_column :lines, :phrasing, :text
  end
end

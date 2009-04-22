class RepostingOrPublicizingLines < ActiveRecord::Migration
  def self.up
    add_column :lines, :repost, :boolean
    add_column :lines, :public, :boolean
  end

  def self.down
    remove_column :lines, :repost
    remove_column :lines, :public
  end
end

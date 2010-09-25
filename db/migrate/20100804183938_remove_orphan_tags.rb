class RemoveOrphanTags < ActiveRecord::Migration
  def self.up
    Tag.find_each(:batch_size => 10) do |t|
      if t.target == nil
        t.destroy
      end
    end
    
    Comment.find_each(:batch_size => 10) do |c|
      if c.target == nil
        c.destroy
      end
    end
    
    Publication.find_each(:batch_size => 10) do |p|
      if p.line == nil
        p.destroy
      end
    end
    
    Rating.find_each(:batch_size => 10) do |r|
      if r.target == nil
        r.destroy
      end
    end
    
    Approach.find_each(:batch_size => 10) do |a|
      if a.line == nil
        a.update_attributes :line_id => nil
      end
    end
  end

  def self.down
  end
end

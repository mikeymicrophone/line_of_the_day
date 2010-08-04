class RemoveOrphanTags < ActiveRecord::Migration
  def self.up
    Tag.all.each do |t|
      if t.target == nil
        t.destroy
      end
    end
    
    Comment.all.each do |c|
      if c.target == nil
        c.destroy
      end
    end
    
    Publication.all.each do |p|
      if p.line == nil
        p.destroy
      end
    end
    
    Rating.all.each do |r|
      if r.target == nil
        r.destroy
      end
    end
    
    Approach.all.each do |a|
      if a.line == nil
        a.update_attributes :line_id => nil
      end
    end
  end

  def self.down
  end
end

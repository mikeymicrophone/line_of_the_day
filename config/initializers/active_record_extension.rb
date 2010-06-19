class ActiveRecord::Base
  def id_of record
    if record.is_a? Integer
      record
    elsif record.is_a? String
      record.to_i
    elsif record.kind_of? ActiveRecord::Base
      record.id
    else
      raise ArgumentError
    end
  end
  
  def self.id_of record
    if record.is_a? Integer
      record
    elsif record.is_a? String
      record.to_i
    elsif record.kind_of? ActiveRecord::Base
      record.id
    else
      raise ArgumentError
    end    
  end
  
  def dom_id prefix = ''
    ActionView::Base.new.dom_id self, prefix
  end
  
  named_scope :recent, :order => 'created_at desc', :limit => 20
  
  extend Random
  named_scope :randomized, :order => db_random
end
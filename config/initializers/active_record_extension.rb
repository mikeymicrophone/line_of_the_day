class ActiveRecord::Base
  def self.sorted order
    case order
    when 'rating'
      rated
    when 'recent'
      recent
    else
      randomized
    end
  end

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
  
  named_scope :recent, :order => 'created_at desc'
  
  def self.alphabetizable_attribute
    "name"
  end
  
  named_scope :alphabetized, :order => "#{alphabetizable_attribute} asc"
  
  # extend RandomData
  # named_scope :randomized, :order => db_random
end
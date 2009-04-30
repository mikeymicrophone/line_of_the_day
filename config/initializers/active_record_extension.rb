class ActiveRecord::Base
  def id_of record
    if record.is_a? Integer
      record
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
end
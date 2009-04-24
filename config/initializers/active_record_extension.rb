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
  
  named_scope :recent, :order => 'created_at desc', :limit => 20
end
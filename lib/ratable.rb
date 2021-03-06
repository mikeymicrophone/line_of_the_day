module Ratable
  def self.included base
    base.has_many :ratings, :as => :target, :dependent => :destroy
    base.named_scope :rated, :joins => :ratings, :group => 'target_id', :select => "#{base.table_name}.*, avg(ratings.opinion) as 'average_rating'", :order => 'average_rating desc'
  end
  
  def average_rating
    (ratings.average(:opinion) || 0) / 10.0
  end
  
  def printed_average_rating
    sprintf("%0.02f", average_rating) unless ratings.count == 0
  end
  
  def rating_count
    "#{ratings.count} rating" + (ratings.count == 1 ? '' : 's')
  end
  
  attr_accessor :my_rating
end
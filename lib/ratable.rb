module Ratable
  def self.included base
    base.has_many :ratings, :as => :target
  end
  
  def average_rating
    (ratings.average(:opinion) || 0) / 10.0
  end
  
  def printed_average_rating
    sprintf("%0.02f", average_rating) unless ratings.count == 0
  end
  
  def rating_count
    "#{ratings.count} ratings"
  end
end
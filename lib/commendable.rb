module Commendable
  def self.included base
    base.has_many :comments, :as => :target
  end
  
  def recent_comment
    comments.last.andand.text
  end
  
  def comment_count
    comments.count
  end
end
module Commendable
  def self.included base
    base.has_many :comments, :as => :target, :dependent => :destroy
  end
  
  def recent_comment
    comments.randomized.all(:limit => 5).map(&:text).join("\n------------------------------------------------\n")
  end
  
  def comment_count
    "#{comments.count} comment" + (comments.count == 1 ? '' : 's')
  end
end
module Taggable
  def self.included base
    base.has_many :tags, :as => :target, :dependent => :destroy
    base.has_many :applied_tags, :as => :subject, :class_name => 'Tag', :dependent => :destroy
  end
  
  def recent_tags
    tags.find(:all, :order => 'created_at desc').map { |t| t.subject.name }.to_sentence
  end
  
  def tag_count
    "#{tags.count} tag" + (tags.count == 1 ? '' : 's')
  end
end
module Taggable
  def self.included base
    base.has_many :tags, :as => :target
    base.has_many :applied_tags, :as => :subject, :class_name => 'Tag'
  end
  
  def recent_tags
    tags.find(:all, :limit => 3, :order => 'created_at desc').map { |t| t.subject.name }.to_sentence
  end
  
  def tag_count
    "#{tags.count} tags"
  end
end
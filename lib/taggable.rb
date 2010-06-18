module Taggable
  def self.included base
    base.has_many :tags, :as => :target
    # base.has_many :tagged_subjects, :through => :tags, :source => :subject
    base.has_many :applied_tags, :as => :subject, :class_name => 'Tag'
  end
end
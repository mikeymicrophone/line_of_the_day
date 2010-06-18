class Publication < ActiveRecord::Base
  include Taggable
  belongs_to :user
  belongs_to :line
  belongs_to :group
  accepts_nested_attributes_for :line
  named_scope :to_group, lambda { |g| 
    {:conditions => {:group_id => id_of(g)}}
  }
end

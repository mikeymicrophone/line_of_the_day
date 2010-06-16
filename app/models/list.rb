class List < ActiveRecord::Base
  include Ratable
  has_many :list_items, :order => :position
  belongs_to :user
  named_scope :ordered, {:order => :position}
  acts_as_list :scope => :user
end
class List < ActiveRecord::Base
  include Ratable
  has_many :list_items, :order => :position
  belongs_to :user
  named_scope :ordered, {:order => :position}
  named_scope :public_to, lambda { |u| {:conditions => ['private is null or user_id = ?', u.andand.id]} }
  acts_as_list :scope => :user
end
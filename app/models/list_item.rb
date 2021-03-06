class ListItem < ActiveRecord::Base
  include Ratable
  include Taggable
  belongs_to :list
  belongs_to :user
  belongs_to :item, :polymorphic => true
  named_scope :public_to, lambda { |u| {:conditions => ['private is null or user_id = ?', u.andand.id]} }
  acts_as_list :scope => :list
  validates_uniqueness_of :item_id, :scope => [:item_type, :list_id]
  
  extend RandomData
  named_scope :randomized, :order => db_random
end
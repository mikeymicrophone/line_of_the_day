class ListItem < ActiveRecord::Base
  include Ratable
  belongs_to :list
  belongs_to :user
  belongs_to :item, :polymorphic => true
  acts_as_list :scope => :list
end
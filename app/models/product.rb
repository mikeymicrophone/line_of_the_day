class Product < ActiveRecord::Base
  include Taggable
  include Ratable
  extend Random
  has_many :comments, :as => :target
  belongs_to :user
  belongs_to :company
  named_scope :randomized, :order => db_random
end
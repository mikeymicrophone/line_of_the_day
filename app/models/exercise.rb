class Exercise < ActiveRecord::Base
  include Taggable
  include Ratable
  belongs_to :user
  has_many :comments, :as => :target
  
  extend Random
  named_scope :randomized, :order => db_random
end
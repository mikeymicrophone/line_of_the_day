class Story < ActiveRecord::Base
  include Ratable
  include Taggable
  belongs_to :user
  belongs_to :scene
  has_many :comments, :as => :target
  
  extend Random
  named_scope :randomized, :order => db_random
end
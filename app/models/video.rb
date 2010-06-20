class Video < ActiveRecord::Base
  include Ratable
  include Taggable
  belongs_to :user
  
  extend Random
  named_scope :randomized, :order => db_random
end
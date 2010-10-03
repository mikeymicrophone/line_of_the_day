class City < ActiveRecord::Base
  include Commendable, Ratable, Taggable
  extend Random
  named_scope :randomized, :order => db_random
    
  has_many :neighborhoods
  belongs_to :state
  belongs_to :user
end
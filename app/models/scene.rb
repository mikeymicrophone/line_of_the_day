class Scene < ActiveRecord::Base
  include Taggable, Ratable, Commendable
  extend Random
  named_scope :randomized, :order => db_random
  has_many :approaches
  has_many :stories
  has_many :locations
  has_many :neighborhoods, :through => :locations
  belongs_to :user
end

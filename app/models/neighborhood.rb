class Neighborhood < ActiveRecord::Base
  include Commendable, Taggable, Ratable
  extend RandomData
  named_scope :randomized, :order => db_random
  has_many :scenes, :through => :locations
  has_many :locations
  belongs_to :city
  belongs_to :user
end
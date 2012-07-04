class State < ActiveRecord::Base
  include Commendable, Ratable, Taggable
  extend RandomData
  named_scope :randomized, :order => db_random
  has_many :cities
  has_many :neighborhoods, :through => :cities
  belongs_to :country
  belongs_to :user
end
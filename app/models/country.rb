class Country < ActiveRecord::Base
  include Commendable, Ratable, Taggable
  extend RandomData
  named_scope :randomized, :order => db_random
  has_many :states
  has_many :cities, :through => :states
  belongs_to :user
end
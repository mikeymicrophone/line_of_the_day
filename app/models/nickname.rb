class Nickname < ActiveRecord::Base
  include Taggable, Commendable, Ratable
  belongs_to :user
  
  extend RandomData
  named_scope :randomized, :order => db_random
end
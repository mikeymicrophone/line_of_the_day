class Concept < ActiveRecord::Base
  include Taggable
  include Commendable
  include Ratable
  extend RandomData
  named_scope :randomized, :order => db_random
  belongs_to :user
end
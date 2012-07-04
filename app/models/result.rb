class Result < ActiveRecord::Base
  include Taggable
  extend RandomData
  named_scope :randomized, :order => db_random
  has_many :approaches
  belongs_to :user
end

class Result < ActiveRecord::Base
  include Taggable
  extend Random
  named_scope :randomized, :order => db_random
  has_many :approaches
  belongs_to :user
end

class City < ActiveRecord::Base
  include Commendable, Ratable, Taggable
  has_many :neighborhoods
  belongs_to :state
  belongs_to :user
end
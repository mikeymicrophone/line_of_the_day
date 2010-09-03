class City < ActiveRecord::Base
  has_many :neighborhoods
  belongs_to :state
  belongs_to :user
end
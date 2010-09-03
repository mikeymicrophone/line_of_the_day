class Neighborhood < ActiveRecord::Base
  has_many :scenes
  belongs_to :city
  belongs_to :user
end
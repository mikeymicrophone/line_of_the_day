class Neighborhood < ActiveRecord::Base
  has_many :scenes, :through => :locations
  has_many :locations
  belongs_to :city
  belongs_to :user
end
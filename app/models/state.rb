class State < ActiveRecord::Base
  has_many :cities
  belongs_to :country
  belongs_to :user
end
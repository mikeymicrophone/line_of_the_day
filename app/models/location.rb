class Location < ActiveRecord::Base
  belongs_to :position
  belongs_to :scene
  belongs_to :user
end
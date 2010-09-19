class Location < ActiveRecord::Base
  belongs_to :position
  belongs_to :scene
  belongs_to :neighborhood
  belongs_to :user
  
  def name
    scene.andand.name
  end
end
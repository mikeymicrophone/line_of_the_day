class Video < ActiveRecord::Base
  include Ratable, Taggable, Commendable
  belongs_to :user
  
  extend RandomData
  named_scope :randomized, :order => db_random
  
  def list_display
    "Video: #{name}"
  end
end
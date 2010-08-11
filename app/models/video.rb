class Video < ActiveRecord::Base
  include Ratable
  include Taggable
  has_many :comments, :as => :target
  belongs_to :user
  
  extend Random
  named_scope :randomized, :order => db_random
  
  def list_display
    "Video: #{name}"
  end
end
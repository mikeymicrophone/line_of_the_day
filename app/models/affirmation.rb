class Affirmation < ActiveRecord::Base
  include Taggable
  belongs_to :user
  has_many :goals, :as => :objective
  
  extend Random
  named_scope :randomized, :order => db_random
  
  def list_display
    "Affirmation: #{phrase}"
  end
  
  def name
    phrase
  end
end
class Affirmation < ActiveRecord::Base
  include Taggable
  belongs_to :user
  has_many :goals, :as => :objective
  
  default_scope :order => 'created_at desc'
  
  def list_display
    "Affirmation: #{phrase}"
  end
  
  def name
    phrase
  end
end
class Affirmation < ActiveRecord::Base
  belongs_to :user
  has_many :goals, :as => :objective
  
  default_scope :order => 'created_at desc'
  
  def list_display
    "Affirmation: #{phrase}"
  end
end
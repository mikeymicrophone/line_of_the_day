class Affirmation < ActiveRecord::Base
  belongs_to :user
  has_many :goals, :as => :objective
  
  def list_display
    "Affirmation: #{phrase}"
  end
end
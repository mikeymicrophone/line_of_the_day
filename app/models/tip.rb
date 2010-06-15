class Tip < ActiveRecord::Base
  belongs_to :user
  has_many :goals, :as => :objective
  has_many :comments, :as => :target
  has_many :ratings, :as => :target
  
  def phrasing
    advice
  end
  
  def average_rating
    (ratings.average(:opinion) || 0) / 10.0
  end
end
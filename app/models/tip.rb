class Tip < ActiveRecord::Base
  include Ratable
  include Taggable  
  belongs_to :user
  has_many :goals, :as => :objective
  has_many :comments, :as => :target
  
  extend Random
  named_scope :randomized, :order => db_random

  def phrasing
    advice
  end
  
  def list_display
    "Tip: #{advice}"
  end
  
  def name
    advice
  end
end
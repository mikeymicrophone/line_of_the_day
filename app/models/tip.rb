class Tip < ActiveRecord::Base
  include Ratable
  include Taggable  
  belongs_to :user
  has_many :goals, :as => :objective
  has_many :comments, :as => :target
  
  default_scope :order => 'created_at desc'

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
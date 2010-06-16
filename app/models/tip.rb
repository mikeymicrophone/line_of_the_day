class Tip < ActiveRecord::Base
  include Ratable
  belongs_to :user
  has_many :goals, :as => :objective
  has_many :comments, :as => :target

  def phrasing
    advice
  end
end
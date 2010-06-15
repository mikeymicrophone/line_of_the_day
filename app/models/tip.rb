class Tip < ActiveRecord::Base
  belongs_to :user
  has_many :goals, :as => :objective
  has_many :comments, :as => :target
end
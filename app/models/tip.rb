class Tip < ActiveRecord::Base
  belongs_to :user
  has_many :goals, :as => :objective
end
class Exercise < ActiveRecord::Base
  include Taggable
  include Ratable
  belongs_to :user
  has_many :comments, :as => :target
end
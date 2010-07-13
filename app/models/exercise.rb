class Exercise < ActiveRecord::Base
  include Taggable
  include Ratable
  include Commendable
  belongs_to :user
  
  extend Random
  named_scope :randomized, :order => db_random
  
  def list_display
    "Exercise: #{name}"
  end
end
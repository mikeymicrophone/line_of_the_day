class Exercise < ActiveRecord::Base
  include Taggable
  include Ratable
  include Commendable
  belongs_to :user
  
  extend RandomData
  named_scope :randomized, :order => db_random
  
  def list_display
    "Exercise: #{moniker}"
  end
  
  def name
    moniker
  end
end
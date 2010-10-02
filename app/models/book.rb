class Book < ActiveRecord::Base
  include Taggable
  include Ratable
  include Commendable
  belongs_to :user
  
  extend Random
  named_scope :randomized, :order => db_random
  
  def name
    title
  end
end
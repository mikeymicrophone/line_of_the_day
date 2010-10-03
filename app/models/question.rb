class Question < ActiveRecord::Base
  include Taggable
  include Ratable
  include Commendable
  belongs_to :user
  extend Random
  named_scope :randomized, :order => db_random
  
  validates_uniqueness_of :name
  
  def list_display
    "Question: #{name}"
  end
end
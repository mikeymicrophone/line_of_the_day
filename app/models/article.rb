class Article < ActiveRecord::Base
  include Ratable
  include Taggable
  include Commendable
  belongs_to :user
  
  extend RandomData
  named_scope :randomized, :order => db_random
  
  def name
    "#{source}: #{title}"
  end
end
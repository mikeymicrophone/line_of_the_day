class Article < ActiveRecord::Base
  include Ratable
  include Taggable
  include Commendable
  belongs_to :user
  
  def name
    "#{source}: #{title}"
  end
end
class Book < ActiveRecord::Base
  include Taggable
  include Ratable
  belongs_to :user
  
  def name
    title
  end
end
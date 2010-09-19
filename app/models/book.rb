class Book < ActiveRecord::Base
  include Taggable
  include Ratable
  include Commendable
  belongs_to :user
  
  def name
    title
  end
end
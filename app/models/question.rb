class Question < ActiveRecord::Base
  include Taggable
  include Ratable
  belongs_to :user
  has_many :comments, :as => :target
  
  validates_uniqueness_of :name
  
  def list_display
    "Question: #{name}"
  end
end
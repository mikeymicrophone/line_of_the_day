class Website < ActiveRecord::Base
  include Taggable
  include Ratable
  extend RandomData
  belongs_to :company
  has_many :comments, :as => :target
  belongs_to :user
  named_scope :randomized, :order => db_random
  
  validates_uniqueness_of :url
  
  def list_display
    "Website: #{name}"
  end
end
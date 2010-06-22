class Company < ActiveRecord::Base
  include Ratable
  include Taggable
  extend Random
  has_many :artists
  has_many :products
  has_many :websites
  belongs_to :user
  
  has_many :comments, :as => :target
  
  named_scope :randomized, :order => db_random
  
  def list_display
    "Company: #{name}"
  end
end
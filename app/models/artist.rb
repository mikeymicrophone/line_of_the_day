class Artist < ActiveRecord::Base
  include Taggable
  include Ratable
  belongs_to :user
  belongs_to :company
  
  has_many :comments, :as => :target
  
  extend Random
  named_scope :randomized, :order => db_random
  
  def preferred_name
    self.alias.present? ? self.alias : name
  end
end
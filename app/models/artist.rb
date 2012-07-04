class Artist < ActiveRecord::Base
  include Taggable
  include Ratable
  belongs_to :user
  belongs_to :company
  
  has_many :comments, :as => :target
  
  extend RandomData
  named_scope :randomized, :order => db_random
  
  def preferred_name
    self.alias.present? ? self.alias : name
  end
  
  def list_display
    "Artist: #{preferred_name}"
  end
end
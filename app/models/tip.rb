class Tip < ActiveRecord::Base
  include Ratable
  include Taggable
  include Commendable
  belongs_to :user
  has_many :goals, :as => :objective
  validates_presence_of :advice
  validates_uniqueness_of :advice
  
  named_scope :scoped, lambda { |params|
    if params.keys.include?('user_id')
      {:joins => 'users'}
    else
      {}
    end
    }
    
  extend Random
  named_scope :randomized, :order => db_random

  def self.random
    first :order => db_random
  end

  def phrasing
    advice
  end
  
  def list_display
    "Tip: #{advice}"
  end
  
  def name
    advice
  end
end
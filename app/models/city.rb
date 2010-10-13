class City < ActiveRecord::Base
  include Commendable, Ratable, Taggable
  extend Random
  named_scope :randomized, :order => db_random
  
  named_scope :scoped, lambda { |params| 
    if params.keys.include?('state_id')
      {:conditions => {'state_id' => params['state_id']}}
    elsif params.keys.include?('country_id')
      {}
    else
      {}
    end
  }
    
  has_many :neighborhoods
  belongs_to :state
  belongs_to :user
end
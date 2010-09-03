class Scene < ActiveRecord::Base
  include Taggable
  has_many :approaches
  has_many :stories
  has_many :locations
  has_many :neighborhoods, :through => :locations
  belongs_to :user
end

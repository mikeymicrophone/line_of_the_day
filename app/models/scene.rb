class Scene < ActiveRecord::Base
  include Taggable
  has_many :approaches
  has_many :stories
  belongs_to :user
end

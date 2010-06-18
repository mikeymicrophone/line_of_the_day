class Scene < ActiveRecord::Base
  include Taggable
  has_many :approaches
end

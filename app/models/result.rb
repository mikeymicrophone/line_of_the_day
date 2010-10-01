class Result < ActiveRecord::Base
  include Taggable
  has_many :approaches
  belongs_to :user
end

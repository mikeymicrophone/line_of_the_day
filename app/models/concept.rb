class Concept < ActiveRecord::Base
  include Taggable
  belongs_to :user
end
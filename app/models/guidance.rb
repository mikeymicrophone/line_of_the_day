class Guidance < ActiveRecord::Base
  include Taggable
  belongs_to :coach, :class_name => 'User'
  belongs_to :student, :class_name => 'User'
end

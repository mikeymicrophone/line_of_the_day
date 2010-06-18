class Approach < ActiveRecord::Base
  include Taggable
  belongs_to :result
  belongs_to :line
  belongs_to :user
  belongs_to :scene
end

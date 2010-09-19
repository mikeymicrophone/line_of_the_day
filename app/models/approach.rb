class Approach < ActiveRecord::Base
  include Taggable, Ratable, Commendable
  belongs_to :result
  belongs_to :line
  belongs_to :user
  belongs_to :scene
end

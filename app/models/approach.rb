class Approach < ActiveRecord::Base
  belongs_to :result
  belongs_to :line
  belongs_to :user
  belongs_to :scene
end

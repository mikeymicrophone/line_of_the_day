class Newsletter < ActiveRecord::Base
  has_many :editions
  belongs_to :user
end
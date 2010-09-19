class Country < ActiveRecord::Base
  has_many :states
  belongs_to :user
end
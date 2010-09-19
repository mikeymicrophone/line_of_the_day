class Nickname < ActiveRecord::Base
  include Taggable, Commendable, Ratable
  belongs_to :user
end
class Nickname < ActiveRecord::Base
  include Taggable
  belongs_to :user
end
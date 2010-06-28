class Article < ActiveRecord::Base
  include Ratable
  include Taggable
  belongs_to :user
end
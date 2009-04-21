class Comment < ActiveRecord::Base
  belongs_to :line
  belongs_to :user
end

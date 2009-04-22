class Publication < ActiveRecord::Base
  belongs_to :user
  belongs_to :line
  belongs_to :group
end

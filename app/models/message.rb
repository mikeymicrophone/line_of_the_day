class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'User'
  belongs_to :reply, :class_name => 'Message'
  has_many :replies, :class_name => 'Message', :foreign_key => :reply_id
end

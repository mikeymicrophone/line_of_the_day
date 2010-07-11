class Invitation < ActiveRecord::Base
  belongs_to :user
  
  after_create :deliver
  
  def deliver
    address = self.email
    mail_body = complete_body
    m = Mail.new do
      to address
      subject 'You have been invited to try something new...'
      body mail_body
      from 'host@lineoftheday.com'
    end
    
    m.deliver!
  end
  
  def complete_body
    if message.present?
      message + "\n\n"
    end + "http://lineoftheday.com/invitations/#{id}\n\nLine of the Day is a content-rich web & iPhone app that helps you practice your conversation skills and charisma.  Everyone can make themselves more attractive, and should!  Fill your life with interesting conversations, by mastering the balance between comfort and curiosity.\n\nLine of the Day gives you the topics & material to get started in a flash, the exercises to build your skills and confidence, and the goal-setting and badge-getting to keep your momentum growing (because sometimes accountability makes it easier to progress).  You could even earn some money by coaching others.\n\nhttp://lineoftheday.com/invitations/#{id}"
  end
end
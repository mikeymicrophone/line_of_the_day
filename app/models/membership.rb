class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  
  state_machine :initial => :unapproved do
    event :join do
      transition :unapproved => :ambiguous
    end
    
    event :approve do
      transition :ambiguous => :approved
    end
    
    event :deny do
      transition :ambiguous => :out
    end
    
    event :leave do
      transition :approved => :out
    end
  end
  
end

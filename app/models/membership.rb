class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  named_scope :pending, :conditions => {:state => 'ambiguous'}

  def shared_thoughts
    group.lines.map(&:comments).flatten.select { |c| c.user_id == user_id}
  end
  
  def published_lines
    group.lines.select { |l| l.user_id == user_id }
  end
  
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

class GoalOwnership < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  
  def due_date
    created_at + goal.days.days
  end
  
  def current?
    due_date > Time.now
  end
  
  def current_for usr
    all(:conditions => ['user_id = ?', usr.id]).select &:current?
  end
end
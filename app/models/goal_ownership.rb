class GoalOwnership < ActiveRecord::Base
  include Taggable
  belongs_to :goal
  belongs_to :user
  
  def due_date
    created_at + goal.days.days # note: days.days is not a typo
  end
  
  def remaining_days
    ((due_date - Time.now) / 1.day).to_i
  end
  
  def remaining_days_text
    "#{remaining_days} day#{'s' unless remaining_days == 1} left"
  end
  
  def current?
    due_date > Time.now
  end
  
  def current_for usr
    all(:conditions => ['user_id = ?', usr.id]).select &:current?
  end
  
  def describe
    goal.full_description
  end
  
  alias :derived_description :describe
  
  def total_repetitions
    if goal.objective_type == 'Affirmation'
      goal.repetitions.to_i * goal.days.to_i
    else
      goal.repetitions
    end
  end
  
  alias :repetitions :total_repetitions
  
  def completion_status
    if complete?
      'completed'
    else
      if progress?
        "#{progress * 100 / total_repetitions}% complete"
      else
        'no progress/progress unknown'
      end
    end
  end
end
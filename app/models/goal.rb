class Goal < ActiveRecord::Base
  include Taggable
  belongs_to :user
  belongs_to :objective, :polymorphic => true
  has_many :goal_ownerships
  
  def describe
    case objective_type
    when 'Line'
      if objective_id.present?
        "use the line '#{objective.phrasing}'"
      else
        "write"
      end
    when 'Affirmation'
      if objective_id.present?
        "repeat the phrase '#{objective.phrase}'"
      else
        "repeat affirmative phrases"
      end
    when 'Tip'
      if objective_id.present?
        "follow the tip '#{objective.advice}'"
      else
        "write tips in the amount of"
      end
    when 'Scene'
      if objective_id.present?
        "approach someone at #{objective.name}"
      else
        "approach people at"
      end
    when 'Approach'
      "approach someone new"
    end
  end
  
  def full_description
    case objective_type
    when 'Line'
      if objective_id.present?
        "use the line '#{objective.phrasing}' #{repetitions} times in #{days} days"
      else
        "write #{repetitions} lines in #{days} days"
      end
    when 'Affirmation'
      if objective_id.present?
        "repeat the phrase '#{objective.phrase}' #{repetitions} times a day for #{days} days"
      else
        "repeat affirmative phrases #{repetitions} times a day for #{days} days"
      end
    when 'Tip'
      if objective_id.present?
        "follow the tip '#{objective.advice}' #{repetitions} times in #{days} days"
      else
        "write #{repetitions} tips in #{days} days"
      end
    when 'Scene'
      if objective_id.present?
        "approach someone at #{objective.name} #{repetitions} times in #{days} days"
      else
        "approach people at #{repetitions} different places in #{days} days"
      end
    when 'Approach'
      "approach #{repetitions} people (to whom you have not been introduced)"
    end
  end
  
  def list_display
    "Goal: #{full_description}"
  end
  
  def name
    full_description
  end
  
  def self.one_a_day
    find_or_create_by_objective_type_and_repetitions_and_days 'Approach', 30, 30
  end
end
class Goal < ActiveRecord::Base
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
end
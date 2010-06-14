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
        "use lines in the amount of"
      end
    when 'Affirmation'
      if objective_id.present?
        "repeat the phrase '#{objective.phrase}'"
      else
        "repeat distinct phrases in the amount of"
      end
    when 'Tip'
      if objective_id.present?
        "follow the tip '#{objective.advice}'"
      else
        "write tips in the amount of"
      end
    when 'Scene'
      if objective_id.present?
        "do approaches at #{objective.name}"
      else
        "do approaches at different locations in the amount of"
      end
    end
  end
end
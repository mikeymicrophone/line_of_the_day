class Group < ActiveRecord::Base
  belongs_to :user
  
  def self.rules_select
    [['They join and they\'re in', 1], ['They apply and I decide', 2], ['I add them unless they opt out', 3]]
  end
end

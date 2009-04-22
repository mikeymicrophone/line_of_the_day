class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :publications
  has_many :lines, :through => :publications
  
  def self.rules_select
    [['They join and they\'re in', 1], ['They apply and I decide', 2], ['I add them unless they opt out', 3], ['I can add them or they can add themselves', 4]]
  end
end

class Group < ActiveRecord::Base
  include Taggable
  belongs_to :user
  has_many :memberships
  has_many :publications
  has_many :lines, :through => :publications
  named_scope :open_for_application, :conditions => "rules != 3"
  
  def initiate membership
    case rules
    when 1
      membership.join && membership.approve
    when 2
      membership.join
    when 3
      membership.join && membership.approve
    when 4
      membership.join && membership.approve
    end
  end
    
  def self.rules_select
    [['They join and they\'re in', 1], ['They apply and I decide', 2], ['I add them unless they opt out', 3], ['I can add them or they can add themselves', 4]]
  end
end

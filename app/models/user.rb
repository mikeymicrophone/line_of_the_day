class User < ActiveRecord::Base
  acts_as_authentic
  has_many :lines
  has_many :groups
  has_many :memberships
  has_many :joined_groups, :through => :memberships, :source => :group
  has_many :comments
  has_many :publications
  has_many :cliques, :through => :memberships, :source => :group
  has_many :guidances, :foreign_key => :coach_id
  has_many :guidings, :foreign_key => :student_id, :class_name => 'Guidance'
  has_many :students, :through => :guidances
  has_many :coaches, :through => :guidings
  has_many :affirmations
  has_many :tips
  has_many :goals
  has_many :goal_ownerships
  has_many :blogs
  has_many :lists
  has_many :list_items
  has_many :nicknames
  has_many :ratings
  
  def is_a_member_of group
    group_id = id_of(group)
    !memberships.select { |m| m.group_id == group_id }.empty?
  end
  
  def is_coached_by coach
    guidings.find_by_coach_id(coach.id)
  end
  
  def visible_lines
    (joined_groups.map(&:lines).flatten + lines + Line.public).uniq
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end

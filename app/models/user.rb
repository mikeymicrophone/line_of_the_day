class User < ActiveRecord::Base
  acts_as_authentic
  has_many :lines
  has_many :groups
  has_many :memberships
  has_many :comments
  has_many :publications
  has_many :cliques, :through => :memberships, :source => :group
  
  def is_a_member_of group
    group_id = id_of(group)
    !memberships.select { |m| m.group_id == group_id }.empty?
  end
end

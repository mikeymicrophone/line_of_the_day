class List < ActiveRecord::Base
  include Ratable
  include Taggable
  has_many :list_items, :order => :position
  belongs_to :user
  named_scope :ordered, {:order => :position}
  named_scope :public_to, lambda { |u| {:conditions => ['private is null or user_id = ?', u.andand.id]} }
  acts_as_list :scope => :user
  
  def recent_update usr
    list_items.public_to(usr).last.created_at
  end
  
  def self.not_empty
    all.select { |l| l.list_items.count > 0 }
  end
  
  def list_display
    "List: #{name}"
  end
end
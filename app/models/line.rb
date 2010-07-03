class Line < ActiveRecord::Base
  include Ratable
  include Taggable
  extend Random
  belongs_to :user
  validates_presence_of :phrasing
  has_many :comments, :as => :target
  has_many :publications
  has_many :groups, :through => :publications
  has_many :approaches
  has_many :goals, :as => :objective
  named_scope :public, :conditions => {:public => true}, :order => 'created_at desc'
  named_scope :public_to, lambda { |artist| {:conditions => ['lines.public = ? or lines.user_id = ?', true, artist.id], :order => 'created_at desc' } }
  named_scope :novel_to, lambda { |artist| {:conditions => ['lines.user_id is not ?', artist.id], :order => 'created_at desc' } }
  
  def comment_count
    comments.count
  end
  
  def recent_comment
    comments.last.text
  end
  
  def is_visible_to? usr
    if public?
      true
    elsif user == usr
      true
    elsif (groups & usr.joined_groups).present?
      true
    else
      false
    end
  end
  
  def list_display
    "Line: #{phrasing}"
  end
  
  def name
    phrasing
  end
  
  def self.random
    first :order => db_random
  end
end

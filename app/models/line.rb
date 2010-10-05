class Line < ActiveRecord::Base
  include Ratable
  include Taggable
  include Commendable
  extend Random
  belongs_to :user
  validates_presence_of :phrasing
  has_many :publications, :dependent => :destroy
  has_many :groups, :through => :publications
  has_many :approaches, :dependent => :nullify
  has_many :goals, :as => :objective
  named_scope :public, :conditions => {:public => true}, :order => 'created_at desc'
  named_scope :public_to, lambda { |artist| {:conditions => ['lines.public = ? or lines.user_id = ?', true, artist.id], :order => 'created_at desc' } }
  named_scope :novel_to, lambda { |artist| {:conditions => ['lines.user_id is not ?', artist.id], :order => 'created_at desc' } }
  
  validates_uniqueness_of :phrasing
  
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
  
  def publicize
    self.public = 1
  end
  
  before_create :publicize
  
  def self.random
    first :order => db_random
  end
end

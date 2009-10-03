class Line < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :phrasing
  has_many :comments
  has_many :publications
  has_many :groups, :through => :publications
  has_many :approaches
  named_scope :public, :conditions => {:public => true}, :order => 'created_at desc'
  named_scope :novel_to, lambda { |artist|
    {:conditions => ['lines.user_id is not ?', artist.id]}
  }
end

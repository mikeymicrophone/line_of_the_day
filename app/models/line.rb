class Line < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :text
  has_many :comments
  has_many :publications
  has_many :groups, :through => :publications
  has_many :approaches
  named_scope :public, :conditions => {:public => true}
  named_scope :novel_to, lambda { |artist|
    {:conditions => ['lines.user_id is not ?', artist.id]}
  }
  alias_attribute :magic, :text
end

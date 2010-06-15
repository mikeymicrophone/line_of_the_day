class Comment < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :target
  named_scope :main, :conditions => {:target_id => nil}, :order => 'created_at desc', :limit => 88
  validates_presence_of :text
end

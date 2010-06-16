class Post < ActiveRecord::Base
  belongs_to :blog
  default_scope :order => 'posted_at desc'
end
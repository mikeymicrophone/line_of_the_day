class Post < ActiveRecord::Base
  include Ratable
  belongs_to :blog
  default_scope :order => 'posted_at desc'
  
  def list_display
    "Post: #{blog.name}: #{name}"
  end
end
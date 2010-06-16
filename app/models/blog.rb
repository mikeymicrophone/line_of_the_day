class Blog < ActiveRecord::Base
  include Ratable
  has_many :posts
  belongs_to :user
  belongs_to :author
  
  def fetch_posts
    feed = Feedzirra::Feed.fetch_and_parse feed_url
    feed.entries.each do |post|
      posts.find_or_create_by_name :name => post.title, :content => post.content, :posted_at => post.published, :url => post.url
    end
  end
  
  def list_display
    "Blog: #{name}"
  end
end
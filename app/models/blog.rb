class Blog < ActiveRecord::Base
  include Ratable
  include Taggable
  has_many :posts
  belongs_to :user
  belongs_to :author
  
  validates_uniqueness_of :url, :feed_url, :allow_nil => true
  
  def fetch_posts
    if feed_url.present?
      feed = Feedzirra::Feed.fetch_and_parse feed_url
      feed.andand.entries.andand.each do |post|
        posts.find_or_create_by_name :name => post.title, :content => post.content, :posted_at => post.published, :url => post.url
      end
    end
  end
  
  after_create :fetch_posts
  
  def list_display
    "Blog: #{name}"
  end
  
  def recent_update
    posts.map(&:posted_at).sort.last
  end
end
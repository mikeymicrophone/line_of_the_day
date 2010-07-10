class Story < ActiveRecord::Base
  include Ratable
  include Taggable
  belongs_to :user
  belongs_to :scene
  has_many :comments, :as => :target
  named_scope :public_to, lambda { |artist| artist ? {:conditions => ['stories.private is null or stories.user_id = ?', artist.id]} : {:conditions => ['stories.private is null']} }
  
  extend Random
  named_scope :randomized, :order => db_random
end
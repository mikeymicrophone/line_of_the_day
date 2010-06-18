class Rating < ActiveRecord::Base
  include Taggable
  belongs_to :target, :polymorphic => true
  belongs_to :context, :polymorphic => true
  belongs_to :user
end
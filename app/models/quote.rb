class Quote < ActiveRecord::Base
  include Ratable
  include Taggable
  belongs_to :user
  belongs_to :source, :polymorphic => true
end
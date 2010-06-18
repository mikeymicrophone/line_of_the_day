class Tag < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :subject, :polymorphic => true
  belongs_to :user
end
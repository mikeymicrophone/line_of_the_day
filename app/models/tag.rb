class Tag < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :subject, :polymorphic => true
  belongs_to :user
  
  validates_uniqueness_of :target_id, :scope => [:target_type, :subject_id, :subject_type]
end
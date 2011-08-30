class StackResource < ActiveRecord::Base
  attr_accessible :stack_id, :resource_id, :deployment_id, :quantity, :updated_at, :created_at
  belongs_to :stack
  belongs_to :resource
  belongs_to :deployment
  validates_uniqueness_of :deployment_id, :scope => [:resource_id, :stack_id]
  validates_numericality_of :quantity, :allow_nil => true

end

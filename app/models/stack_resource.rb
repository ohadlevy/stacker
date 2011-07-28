class StackResource < ActiveRecord::Base
  attr_accessible :stack_id, :resource_id
  belongs_to :stack
  belongs_to :resource
end

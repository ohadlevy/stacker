class Stack < ActiveRecord::Base
  attr_accessible :name, :resource_ids
  has_many :stack_resources, :dependent => :destroy
  has_many :resources, :through => :stack_resources

  def to_param
    name
  end

  def ready?
    false
  end
end

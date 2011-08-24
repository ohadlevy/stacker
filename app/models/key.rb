class Key < ActiveRecord::Base
  belongs_to :resource
  has_many :stack_keys, :dependent => :destroy
  has_many :stacks, :through => :stack_keys
  validates_uniqueness_of :name, :scope => :resource_id
end

class Stack < ActiveRecord::Base
  attr_accessible :name, :resource_ids
  has_many :stack_resources, :dependent => :destroy
  has_many :resources, :through => :stack_resources, :uniq => true
  has_many :deployments
  has_many :stack_keys, :dependent => :destroy
  has_many :keys, :through => :stack_keys
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    name
  end

  def to_s
    name
  end

end

class Stack < ActiveRecord::Base
  attr_accessible :name, :resource_ids, :key_ids
  has_many :resources, :through => :stack_resources, :uniq => true
  has_many :deployments, :dependent => :destroy
  has_many :stack_keys, :dependent => :destroy
  has_many :keys, :through => :stack_keys, :dependent => :destroy
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    name
  end

  def to_s
    name
  end

end

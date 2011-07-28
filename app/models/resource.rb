class Resource < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :stack_resources, :dependent => :destroy
  has_many :stacks, :through => :stack_resources

  def self.subclasses
    %w[ Host ]
  end

  def to_param; name; end

  def to_s
    "#{name} (#{type})"
  end
end

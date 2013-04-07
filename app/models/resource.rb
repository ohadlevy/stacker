class Resource < ActiveRecord::Base
  self.table_name = :stacked_resources
  attr_accessible :name, :type, :external_resource_id
  has_many :stack_resources, :dependent => :destroy
  has_many :stacks, :through => :stack_resources, :uniq => true
  has_many :deployments, :through => :stack_resources, :uniq => true
  has_many :instances
  has_many :keys, :dependent => :destroy
  validates_presence_of :name, :external_resource_id
  validates_uniqueness_of :name
  validates_uniqueness_of :external_resource_id, :scope => :type

  def self.subclasses
    %w[ ForemanHostgroup ]
  end

  def to_param; name; end

  def to_s
    "#{name} (#{type.to_s.titleize})"
  end

  def self.class_for t
    logger.debug "trying to auto set resource sub class #{t}"
    subclasses.each do |klass|
     return eval(klass) if klass == t
    end
    nil
  end

  # abstracted methods
  def self.list; nil; end
  def create_instance; nil; end
  def destroy_instance; nil; end

end

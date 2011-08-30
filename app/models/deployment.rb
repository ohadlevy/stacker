class Deployment < ActiveRecord::Base
  attr_accessible :stack_id, :name, :stack_resources_attributes, :values_attributes
  belongs_to :stack
  has_many :stack_resources, :dependent => :destroy
  has_many :resources, :through => :stack_resources, :uniq => true
  has_many :instances
  validates_uniqueness_of :name
  validates_presence_of :name
  validates_associated :stack
  accepts_nested_attributes_for :stack_resources

  after_save :initialize_resources, :create_resources_instances

  def to_param
    name
  end

  def to_s
    name
  end

  def instance_attributes
    { :deployment => to_s,:deployment_id => id }
  end

  def values
    stack.keys.group(:resource_id).map do |key|
      key.find_by_deployment(id)
    end.flatten.compact
  end

  def values_attributes=(values)
    values.values.each do |value|
      logger.debug("about to set #{value}")
      Foreman::LookupValue.create value.update({:match => "deployment_id=#{id}"})
    end
  end

  private
  # ensure that stack resources are assigned to our deployment
  # this can run on every update, however it does not handle when the stack deletes resources.
  #
  # not very sql friendly code
  def initialize_resources
    stack.stack_resources.deployment_templates.each do |mix|
      StackResource.find_or_create_by_stack_id_and_resource_id_and_deployment_id(stack_id, mix.resource_id, id)
    end
  end

  # creates instances of each resource when the resource cound is increasing
  # downsizing is not supported
  # again, not that sql friendly
  def create_resources_instances
    stack_resources.each do |sr|
      next if sr.quantity.blank?
      # create missing instances
      count = sr.quantity - instances.where(:resource_id => sr.resource_id).count
      raise ActiveRecord::Rollback, "Decreasing instances is not supported at the moment" if count < 0
      count.times do
        Instance.create(:resource_id => sr.resource_id,
                        :deployment_id => id,
                        :uuid => sr.resource.create_instance(self).name)
      end
    end
  end

end

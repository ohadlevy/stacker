class Instance < ActiveRecord::Base
  attr_accessible :resource_id, :uuid, :deployment_id
  validates_presence_of :uuid, :resource_id, :deployment_id
  validates_uniqueness_of :uuid
  belongs_to :deployment
  belongs_to :resource

  after_destroy :remove_resource_instance

  def to_param
    uuid
  end

  private

  def remove_resource_instance
    resource.delay.destroy_instance(uuid)
  end
end

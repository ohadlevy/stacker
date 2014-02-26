class ForemanHostgroup < Resource

  after_save :update_keys

  def self.model_name
    superclass.model_name
  end

  # List of resources templates we can provide
  def self.list
    Hostgroup.scoped
  end

  def name
    read_attribute(:name) || write_attribute(:name, external_id.name)
  end

  def create_instance deployment, attributes = {}
    attrs = {
      :name            => host_name(deployment.to_s),
      :hostgroup_id    => external_resource_id.to_i,
      #TODO: simply parameters handling
      :host_parameters => parameters(deployment),
      :build           => true,
    }
    logger.info "Creating new resource instance #{attrs[:name]} in the #{deployment} deployment"
    # TODO: move to async
    host = Host.new(attrs.merge(attributes))
    if host.save
      host
    else
      raise "Failed to install host - #{host.errors.full_messages}"
    end
  end

  def destroy_instance(uuid)
    Host.delete(uuid)
  end

  private

  # Key Value pairs that would be added to an instance
  # these are plain foreman parameters
  def parameters deployment
    deployment.instance_attributes.map do |k, v|
      HostParameter.new(:name => k.to_s, :value => v.to_s, :nested => true)
    end
  end

  def host_name deployment
    "#{name}-#{deployment}-#{rand(99)}".parameterize
  end

  def external_id
    Hostgroup.find(external_resource_id)
  end

  def update_keys
    external_id.puppetclasses.map(&:lookup_keys).flatten.each do |key|
      Key.find_or_create_by_external_id_and_resource_id_and_key(key.id, id, key.key)
    end
    #TODO: handle deletion of keys
  end

end

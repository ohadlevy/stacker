require 'foreman'

class ForemanHostgroup < Resource
  def class;
    Resource;
  end

  # Using foreman hostgroup for now, abstractions later
  def self.list
    @allowed_list ||= Foreman::Hostgroup.all.sort{|h,g| h.label <=> g.label}
  end

  def name
    read_attribute(:name) || write_attribute(:name, external_id.name)
  end

  def create_instance deployment, attributes = {}
    attrs = {
        :name         => host_name(deployment.to_s),
        :hostgroup_id => external_resource_id,
        :host_parameters_attributes => parameters(deployment),
        :build        => true,
        :powerup      => true,
    }
    logger.info "Creating new resource instance #{attrs[:name]} in the #{deployment} deployment"
    host = Foreman::Host.create(attrs.merge(attributes))
    return host if host
    raise "Failed to install host - #{host.errors}"
  end

  def destroy_instance(uuid)
    Foreman::Host.find(uuid).destroy
  rescue ActiveResource::ResourceNotFound
    true
  end

  private

  def parameters deployment
    {
      :resource => name
    }.merge(deployment.instance_attributes).map do |k,v|
      instance_attribute(k,v)
    end
  end

  def instance_attribute key,value
    {:name => key, :value => value, :nested => ""}
  end

  def host_name deployment
    "#{name}-#{deployment}-#{rand(99)}".parameterize
  end

  def external_id
    Foreman::Hostgroup.find(external_resource_id)
  end

end

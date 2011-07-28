require 'foreman'

class Host < Resource
  def class;
    Resource;
  end

  # Using foreman hostgroup for now, abstractions later
  def self.allowed_list
    Foreman::Hostgroup.all.map(&:name)
  end

  def create_instance attributes = { }
    attributes ||= {
        :name               => host_name,
        :architecture_id    => 1,
        :puppetproxy_id     => 7,
        :subnet_id          => 1,
        :domain_id          => 6,
        :mac                => host_mac,
        :medium_id          => 2,
        :hostgroup_id       => Foreman::Hostgroup.find(name),
        :ptable_id          => 4,
        :environment_id     => 1,
        :ip                 => host_ip,
        :operatingsystem_id => 15,
    }
    Foreman::Host.create(attributes)
  end

  def host_name
    "#{name}-#{random(99)}"
  end

  def host_mac
    raise "Not implemented"
  end

  def host_ip
    Foreman::Subnet.find(1).un
  end


end

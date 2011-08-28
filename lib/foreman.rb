require 'json_with_root'

module Foreman
  autoload :Hostgroup, "foreman/hostgroup.rb"
  autoload :Host, "foreman/host.rb"
  autoload :HostParametersAttribute, "foreman/host_parameters_attribute.rb"
  autoload :Puppetclass, "foreman/puppetclass.rb"
  autoload :LookupKey, "foreman/lookup_key.rb"
  autoload :LookupValue, "foreman/lookup_value.rb"

  class ForemanResource < ActiveResource::Base
    include ActiveModel::Validations
    extend ActiveModel::Callbacks
    extend ActiveModel::Naming

    self.site                 = APP_CONFIG[:foreman][:url]
    self.format               = :json_with_root
    self.user                 = APP_CONFIG[:foreman][:user]
    self.password             = APP_CONFIG[:foreman][:pass]
    self.timeout              = 15
    self.include_root_in_json = true

    # removes the trailing ".json" from the ID
    # as this conflicts with non numerical IDS that have "." as part of thier ID
    def self.element_path(id, prefix_options = { }, query_options = nil)
      path = super(id,prefix_options, {:format => "json"})
      path =~ /#{id}.json/ ? path.gsub("#{id}.json",id.to_s) : path
    end

    def <=> other
      name <=> other.name
    end

    define_model_callbacks :save

  end
end

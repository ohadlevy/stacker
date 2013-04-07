require 'foreman/api/json_with_root'

module Foreman::API
  autoload :Hostgroup, "foreman/api/hostgroup.rb"
  autoload :Host, "foreman/api/host.rb"
  autoload :Fact, "foreman/api/fact.rb"
  autoload :HostParametersAttribute, "foreman/api/host_parameters_attribute.rb"
  autoload :Puppetclass, "foreman/api/puppetclass.rb"
  autoload :LookupKey, "foreman/api/lookup_key.rb"
  autoload :LookupValue, "foreman/api/lookup_value.rb"

  class Resource < ActiveResource::Base
    include ActiveModel::Validations
    extend ActiveModel::Callbacks
    extend ActiveModel::Naming

    self.site                 =  "http://0.0.0.0:3000" #APP_CONFIG[:foreman][:url]
    self.format               = :json_with_root
    self.user                 = "admin" #APP_CONFIG[:foreman][:user]
    self.password             = "secret" #APP_CONFIG[:foreman][:pass]
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

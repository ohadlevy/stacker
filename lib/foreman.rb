require 'json_with_root'

module Foreman
  autoload :Hostgroup, "foreman/hostgroup.rb"
  autoload :Host, "foreman/host.rb"
  autoload :HostParametersAttribute, "foreman/host_parameters_attribute.rb"

  class ForemanResource < ActiveResource::Base

    self.site                 = APP_CONFIG[:foreman][:url]
    self.format               = :json_with_root
    self.user                 = APP_CONFIG[:foreman][:user]
    self.password             = APP_CONFIG[:foreman][:pass]
    self.timeout              = 15
    self.include_root_in_json = true

    def headers
      { :accept => :json, :content_type=>"application/json" }
    end

    def self.element_path(id, prefix_options = { }, query_options = nil)
      super.gsub(".json", "")
    end

    def <=> other
      name <=> other.name
    end

  end
end

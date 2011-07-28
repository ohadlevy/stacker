require 'json_with_root'

module Foreman
  autoload :Hostgroup, "foreman/hostgroup.rb"
  autoload :Host, "foreman/host.rb"
  autoload :Domain, "foreman/domain.rb"

  class ForemanResource < ActiveResource::Base

    self.site                 = "https://foreman.sat.lab.tlv.redhat.com"
    self.format               = :json_with_root
    self.user                 = "admin"
    self.password             = "changeme"
    self.timeout              = 5
    self.include_root_in_json = true

    def headers
      { :accept => :json, :content_type=>"application/json" }
    end

    def self.element_path(id, prefix_options = { }, query_options = nil)
      super.gsub(".json", "")
    end

    def created
      DateTime.parse @attributes['created'] if @attributes['created_at']
    end

    def updated
      DateTime.parse @attributes['updated'] if @attributes['updated_at']
    end

  end
end

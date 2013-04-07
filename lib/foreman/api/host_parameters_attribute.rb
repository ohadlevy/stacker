module Foreman::API

  class HostParametersAttribute < Resource
    self.format               = :json
    self.include_root_in_json = false
  end
end

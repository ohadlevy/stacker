module Foreman

  class HostParametersAttribute < ForemanResource
    self.format               = :json
    self.include_root_in_json = false
  end
end

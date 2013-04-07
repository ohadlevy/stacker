module Foreman::API
  class Fact < Resource
    self.prefix = "/hosts/:uuid/"
  end

end

module Foreman
  class Fact < ForemanResource
    self.prefix = "/hosts/:uuid/"
  end

end

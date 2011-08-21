module Foreman

  class Host < ForemanResource
    def to_param
      name
    end

  end
end

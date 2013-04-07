module Foreman::API

  class Host < Resource
    def to_param
      name
    end

  end
end

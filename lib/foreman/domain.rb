module Foreman

  class Domain < ForemanResource
    def to_param
      @param ||= name.dup
    end
  end

end

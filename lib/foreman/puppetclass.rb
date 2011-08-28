module Foreman
  class Puppetclass < ForemanResource
    def keys
      lookup_keys.collect{|x| x.attributes["lookup_key"]}
    rescue
      []
    end
  end

end

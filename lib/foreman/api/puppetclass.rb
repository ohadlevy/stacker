module Foreman::API
  class Puppetclass < Resource
    def keys
      lookup_keys.collect{|x| x.attributes["lookup_key"]}
    rescue
      []
    end
  end

end

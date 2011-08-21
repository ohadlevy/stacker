require 'uri'
module Foreman

  class Hostgroup < ForemanResource

    def self.find_by_name name
      all(:params => { :search => URI.encode("name = #{name}") }).each do |hg|
        return hg if hg.name == name
      end
    end
  end

end

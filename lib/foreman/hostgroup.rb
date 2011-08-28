require 'uri'
module Foreman

  class Hostgroup < ForemanResource

    def puppetclasses
      classes.map{|pc| pc.attributes["puppetclass"]}
    end

    def keys
      puppetclasses.collect(&:keys).flatten
    end

    def self.find_by_name name
      all(:params => { :search => URI.encode("name = #{name}") }).each do |hg|
        return hg if hg.name == name
      end
    end
  end

end

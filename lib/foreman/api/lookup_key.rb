module Foreman::API
  class LookupKey < Resource
    def to_param
      key
    end

    def name
      key
    end

    def to_s; key; end

    def find_value_by_deployment id
      #TODO: move this to a rest call
      values.select{|x| x.match == "deployment_id=#{id}"}[0]
    rescue ActiveResource::ResourceNotFound
      nil
    end

    private

    def values
      @values ||= LookupValue.all(:params => {:lookup_key_id => key})
    end

  end

end

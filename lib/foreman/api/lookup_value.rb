module Foreman::API
  class LookupValue < Resource
    attr_reader :name
    self.prefix = "/lookup_keys/:lookup_key_id/"

    schema do
      string 'value', 'match'
      integer 'lookup_key_id'
    end

    def initialize attributes = {}
      @name = attributes.delete(:name)
      super(attributes)
      @attributes[:lookup_key_id] ||= prefix_options[:lookup_key_id]
    end

    def key
      @lookup_key ||= LookupKey.find(lookup_key_id)
    end

    def name
      @name ||= key.to_s
    end

  end

end

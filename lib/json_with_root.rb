require 'active_support/json'

module ActiveResource
  module Formats
    module JsonWithRootFormat
      extend self

      def extension
        "json"
      end

      def mime_type
        "application/json"
      end

      def encode(hash, options = nil)
        ActiveSupport::JSON.encode(hash, options)
      end

      def decode(json)
        result = ActiveSupport::JSON.decode(json)
        return result.values.first if result.is_a?(Hash)
        result.map(&:values).flatten rescue result
      end
    end
  end
end
require 'active_support/json'
require 'active_resource/exceptions'

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
        if result.is_a?(Array)
          result.map! { |e| from_json_data(e) }
        else
          from_json_data(result)
        end
      end

      private
      def from_json_data(data)
        if data.is_a?(Hash) && data.keys.size == 1
          data.values.first
        else
          data
        end
      end
    end
  end

  module Validations
    def load_remote_errors(remote_errors, save_cache = false )
      case self.class.format
      when ActiveResource::Formats[:JsonWithRoot]
        errors.from_json(remote_errors.response.body, save_cache)
      else
        super(remote_errors,save_cache)
      end
    end
  end
end

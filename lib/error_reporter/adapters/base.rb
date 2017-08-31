module ErrorReporter
  module Adapters
    class Base
      attr_accessor :request, :context_hash

      def self.configured?
        raise NotImplementedError.new("You must override the #configured? method to be a ErrorReporterClient")
      end

      def report(exception)
        raise NotImplementedError.new("You must override the #report method to be a ErrorReporterClient")
      end

      protected

      def filtered_params
        return nil if request.blank?
        filter_params(request.params,
                      request.env["action_dispatch.parameter_filter"])
      end

      private

      def filter_params(params_hash, filter_keys)
        filter_keys = filter_keys.map(&:to_s)
        # Recursive filtering of (nested) hashes
        params_hash.inject({}) do |result, (k, v)|
          result[k] = case v
                      when Hash
                        filter_params(v, filter_keys)
                      else
                        filter_keys.include?(k) ? "[FILTERED]" : v
                      end
          result
        end
      end
    end
  end
end

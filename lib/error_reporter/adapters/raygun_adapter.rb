module ErrorReporter
  module Adapters
    # note: Sidekiq reporting works by requiring 'raygun/sidekiq'
    #       in config/initializers/raygun.rb
    # TODO:: pull this into gem with initializer callbacks
    #       so we can require this without an initializer
    class RaygunAdapter < Base
      class << self
        def configured?
          # creating a client raises if it doesn't have an API key
          ::Raygun::Client.new rescue false
        end
      end

      def report(exception)
        opts = request.try(:env) || {}
        opts[:custom_data] = context_hash if context_hash.present?
        # Raygun.track_exception(exception, opts={})
        #
        #   Request info is extracted from the 2nd arg, expecting
        #   that it be a superset of ::Rack Environment hash.
        #   If a `:custom_data` key is present, that is extracted
        #   and reported as custom context
        ::Raygun.track_exception(exception, opts)
      end
    end
  end
end

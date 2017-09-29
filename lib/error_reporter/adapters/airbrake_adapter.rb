module ErrorReporter
  module Adapters
    class AirbrakeAdapter < Base
      class << self
        def configured?
          !!(defined? ::Raven)
        end
      end

      def report(exception)
        opts               = request.try(:env) || {}
        opts[:custom_data] = context_hash if context_hash.present?

        Airbrake.notify('App crashed!')
      end
    end
  end
end

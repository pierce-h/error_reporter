module ErrorReporter
  module Adapters
    class NullAdapter < Base
      def self.configured?
        true
      end

      def initialize
        puts "[ErrorReporter] No configured error reporting client is available".colorize(:light_red)
      end

      def report(exception)
        puts "[ErrorReporter] Not Configured, error not reported:".colorize(:light_red)
        puts "Exception: [#{exception.class}] #{exception.message}"
      end
    end
  end
end

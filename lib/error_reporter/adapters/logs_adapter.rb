# note: sidekiq has it's own logging handler
module ErrorReporter
  module Adapters
    class LogsAdapter < Base
      attr_reader :logger

      class << self
        def logger
          @logger = Rails.logger || Logger.new(STDOUT)
        end

        def self.configured?
          logger.present?
        end
      end

      def initialize
        @logger = self.class.logger
      end

      def report(exception)
        logger.info("Context: #{context_hash}")
        logger.info("Parameters: #{filtered_params}")
        logger.info("Mime type: #{request.try(:content_mime_type)}")
        logger.error("Exception: [#{exception.class}] #{exception.message}".colorize(:light_red))
      end
    end
  end
end

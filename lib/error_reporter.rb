require_relative "error_reporter/version"

module ErrorReporter
  SERVICES = {
    raygun: Adapters::RaygunAdapter,
    sentry: Adapters::SentryAdapter,
    sentry: Adapters::AirbrakeAdapter,
    logs: Adapters::LogsAdapter
  }.freeze

  @service = SERVICES.values.detect(&:configured?)

  @service ||= NullReporter

  @adapter = @service.new

  @logger = Rails.logger if defined?(Rails)
  @logger ||= Logger.new(STDOUT)

  class << self
    attr_accessor :adapter, :logger, :adapter

    def report(exception, opts = {})
      logger.debug("[ErrorReporter] Reporting error via #{adapter.class.name}")
      adapter.request = opts[:request]
      adapter.context_hash = opts[:context]

      adapter.report(exception)
    end
  end
end

# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "error_reporter/version"

Gem::Specification.new do |spec|
  spec.name          = "error_reporter"
  spec.version       = ErrorReporter::VERSION
  spec.authors       = ["Pierce"]
  spec.email         = ["pierceh.dev@gmail.com"]

  spec.summary       = "An adapter for error reporting services."
  spec.description   = "An adapter for error reporting services."
  spec.homepage      = "https://github.com/pierce-h/error_reporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "airbrake",     "~> 7.0"
  spec.add_runtime_dependency "raygun4ruby",  "~> 2.4"
  spec.add_runtime_dependency "sentry-raven", "~> 2.6"
  spec.add_runtime_dependency "colorize",     "~> 0.8.1"

  # Don't add more development dependencies here.
  # They go in groups within the Gemfile.
  spec.add_development_dependency "bundler",  "~> 1.15"
end

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
  spec.required_ruby_version = ">= 2.6"
end

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# runtime dependencies in timebomb-sdk.gemspec
gemspec

# dependencies not needed during CI
group :optional do
  gem "byebug",                     ">= 0",     platforms: [:ruby_20, :ruby_21, :ruby_22, :ruby_23]
  gem "pry",                        ">= 0",     platforms: :ruby
  gem "gem-release",                "~> 2.0.0.dev"
end

group :development, :test do
  gem "rake",                       "~> 10.0"
  gem "rspec",                      "~> 3.6.0"
  gem "yard",                       "~> 0.9.9"
end

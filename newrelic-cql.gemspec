# -*- encoding: utf-8 -*-
require File.expand_path('../lib/newrelic-cql/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = ["Kyle VanderBeek"]
  gem.email       = ["kyle@change.org"]
  gem.description = %q{Unofficial New Relic instrumentation for cql-rb}
  gem.summary     = %q{Unofficial New Relic instrumentation for cql-rb}
  gem.homepage    = "http://github.com/change/newrelic-cql"
  gem.license     = "MIT"

  gem.files         = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  gem.name          = "newrelic-cql"
  gem.require_paths = ["lib"]
  gem.version       = NewrelicCql::VERSION

  gem.add_dependency 'newrelic_rpm', '>= 3.5.0'
end

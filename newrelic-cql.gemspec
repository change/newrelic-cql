# -*- encoding: utf-8 -*-
require File.expand_path('../lib/newrelic-cql/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = ["Kyle VanderBeek, Mark Dimas"]
  gem.email       = ["mark@change.org"]
  gem.description = %q{Unofficial New Relic instrumentation for DataStax Cassandra ruby-driver}
  gem.summary     = %q{Unofficial New Relic instrumentation for DataStax Cassandra ruby-driver}
  gem.homepage    = "http://github.com/change/newrelic-cql"
  gem.license     = "MIT"

  gem.files         = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  gem.name          = "cassandra-driver"
  gem.require_paths = ["lib"]
  gem.version       = NewrelicCql::VERSION

  gem.add_dependency 'newrelic_rpm', '~> 3.11', '>= 3.11.0.283'
end

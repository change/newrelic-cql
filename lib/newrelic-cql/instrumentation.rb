# encoding: utf-8
require 'new_relic/agent/method_tracer'

DependencyDetection.defer do
  @name = :cql

  executes do
    ::NewRelic::Agent.logger.info 'Installing Cassandra Cql instrumentation'
  end

  depends_on do
    defined?(Cql)
  end

  executes do
    [Cql::Client::AsynchronousClient, Cql::Client::SynchronousClient].each do |klass|
      klass.class_eval do
        include ::NewRelic::Agent::MethodTracer
        add_method_tracer :prepare, 'Database/Cql/prepare'
        add_method_tracer :execute, 'Database/Cql/execute'
        add_method_tracer :batch, 'Database/Cql/batch'
      end
    end
  end
end

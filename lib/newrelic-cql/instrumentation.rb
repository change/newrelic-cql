# encoding: utf-8
require 'new_relic/agent'

DependencyDetection.defer do
  named :cql

  depends_on do
    defined?(::Cql)
  end

  executes do
    ::NewRelic::Agent.logger.info 'Installing Cassandra Cql instrumentation'
  end

  executes do
    require 'new_relic/agent/datastores'

    [::Cql::Client::AsynchronousClient, ::Cql::Client::SynchronousClient].each do |klass|
      NewRelic::Agent::Datastores.trace klass, :prepare, 'Cql'
      NewRelic::Agent::Datastores.trace klass, :execute, 'Cql'
      NewRelic::Agent::Datastores.trace klass, :batch, 'Cql'
    end
  end
end

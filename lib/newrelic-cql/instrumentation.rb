# encoding: utf-8
require 'new_relic/agent'

DependencyDetection.defer do
  named :cassandra

  depends_on do
    defined?(::Cassandra::Session)
  end

  executes do
    ::NewRelic::Agent.logger.info 'Installing Cassandra ruby-driver instrumentation'
  end

  executes do
    require 'new_relic/agent/datastores'

    [::Cassandra::Session].each do |klass|
      NewRelic::Agent::Datastores.trace klass, :prepare, 'Cql'
      NewRelic::Agent::Datastores.trace klass, :batch, 'Cql'
      NewRelic::Agent::Datastores.trace klass, :execute, 'Cql'
      NewRelic::Agent::Datastores.trace klass, :execute_async, 'Cql'
    end
  end
end

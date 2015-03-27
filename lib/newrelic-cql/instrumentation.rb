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
    require 'new_relic/agent/datastores/metric_helper'

    ::Cql::Client::AsynchronousClient.class_eval do
      alias_method :execute_without_newrelic, :execute
      def execute(cql, *args)
        metric = NewRelic::Agent::Datastores::MetricHelper.metrics_for('Cql', 'execute')
        start = Time.now
        result = execute_without_newrelic(cql, *args)
        NewRelic::Agent::Datastores.notice_sql(cql, metric, Time.now - start)
        result
      end
    end

    [::Cql::Client::SynchronousClient, ::Cql::Client::AsynchronousClient].each do |klass|
      NewRelic::Agent::Datastores.trace klass, :prepare, 'Cql'
      NewRelic::Agent::Datastores.trace klass, :execute, 'Cql'
      NewRelic::Agent::Datastores.trace klass, :batch, 'Cql'
    end
  end
end

require 'benchmark/ips'
require 'pry'

ImplementationError = Class.new(StandardError)

def benchmark
  ->(object_builder) {
    Benchmark.ips(ENV.fetch('RUNS', 1).to_i) do |x|
      hash = {
        :foo  => 1,
        :bar  => 2,
        :baz  => 3,
        :qux  => 4,
      }

      hash2 = {
        :foo  => "foo",
        :bar  => "bar",
        :baz  => "baz",
        :qux  => "qux",
      }

      x.report(object_builder.call(hash).class.name) {
        o = object_builder.call(hash)
        o.foo == hash[:foo] || raise(ImplementationError, "#foo")
        o.bar == hash[:bar] || raise(ImplementationError, "#bar")
        o.baz == hash[:baz] || raise(ImplementationError, "#baz")
        o.qux == hash[:qux] || raise(ImplementationError, "#qux")
        o.to_h == hash || raise(ImplementationError, "#to_h")

        o.foo = hash2[:foo]
        o.foo == hash2[:foo] || raise(ImplementationError, "#foo=")
        o.bar = hash2[:bar]
        o.bar == hash2[:bar] || raise(ImplementationError, "#bar=")
        o.baz = hash2[:baz]
        o.baz == hash2[:baz] || raise(ImplementationError, "#baz=")
        o.qux = hash2[:qux]
        o.qux == hash2[:qux] || raise(ImplementationError, "#qux=")
        o.to_h == hash2 || raise(ImplementationError, "#to_h")
      }
    end
  }
end

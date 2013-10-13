require_relative 'benchmark'

class ClassHashArgsFetch
  attr_accessor :foo, :bar, :baz, :qux

  def initialize(args)
    self.foo  = args.fetch(:foo)
    self.bar  = args.fetch(:bar)
    self.baz  = args.fetch(:baz)
    self.qux  = args.fetch(:qux)
  end

  def to_h
    {
      :foo => foo,
      :bar => bar,
      :baz => baz,
      :qux => qux
    }
  end
end

benchmark.call(
  ClassHashArgsFetch.method(:new)
)

require_relative 'benchmark'

class ClassHashArgs
  attr_accessor :foo, :bar, :baz, :qux

  def initialize(args)
    self.foo  = args[:foo]
    self.bar  = args[:bar]
    self.baz  = args[:baz]
    self.qux  = args[:qux]
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
  ClassHashArgs.method(:new)
)

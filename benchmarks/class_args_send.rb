require_relative 'benchmark'

class ClassArgsSend
  attr_accessor :foo, :bar, :baz, :qux

  def initialize(args)
    @args = args
    args.each { |k, v| self.send("#{k}=", v) }
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
  ClassArgsSend.method(:new)
)

begin
  require 'attr_extras'
  class AttrExtrasClass
    attr_initialize [:foo, :bar, :baz, :qux]
    attr_accessor :foo, :bar, :baz, :qux

    def to_h
      {
        :foo => foo,
        :bar => bar,
        :baz => baz,
        :qux => qux
      }
    end
  end

  require_relative 'benchmark'
  benchmark.call(
    AttrExtrasClass.method(:new)
  )
rescue LoadError
  puts "attr_extras gem not installed, cannot run benchmark"
end

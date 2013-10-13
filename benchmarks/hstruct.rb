require_relative '../lib/hstruct'
PlainHStruct = HStruct.new(:foo, :bar, :baz, :qux)

require_relative 'benchmark'
benchmark.call(
  PlainHStruct.method(:new)
)

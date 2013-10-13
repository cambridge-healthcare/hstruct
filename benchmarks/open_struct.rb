require_relative 'benchmark'

require 'ostruct'

benchmark.call(
  OpenStruct.method(:new)
)

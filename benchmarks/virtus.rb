begin
  require 'virtus'
  class VirtusStruct
    include Virtus

    attribute :foo
    attribute :bar
    attribute :baz
    attribute :qux

    alias_method :to_h, :attributes
  end

  require_relative 'benchmark'
  benchmark.call(
    VirtusStruct.method(:new)
  )
rescue LoadError
  puts "virtus gem not installed, cannot run benchmark"
end

begin
  require 'hashie'
  class HashieStruct < Hashie::Dash
    property :foo
    property :bar
    property :baz
    property :qux

    def to_h
      to_hash(:symbolize_keys => true)
    end
  end

  require_relative 'benchmark'
  benchmark.call(
    HashieStruct.method(:new)
  )
rescue LoadError
  puts "hashie gem not installed, cannot run benchmark"
end

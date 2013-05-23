require 'benchmark/ips'
require 'pry'

# OpenStruct
require 'ostruct'

# Struct
PlainStruct = Struct.new(:foo, :bar, :baz, :qux)

# HStruct
require_relative '../lib/hstruct'
PlainHStruct = HStruct.new(:foo, :bar, :baz, :qux)

# Class
class SimpleClass
  attr_reader :foo, :bar, :baz, :qux

  def initialize(foo, bar, baz, qux)
    @foo = foo
    @bar = bar
    @baz = baz
    @qux = qux
  end
end

class CleverClass
  attr_reader :foo, :bar, :baz, :qux

  def initialize(args)
    args.each { |k, v| instance_variable_set("@#{k}", v) }
  end
end

class HashArgsClass
  attr_reader :foo, :bar, :baz, :qux

  def initialize(args)
    @foo  = args[:foo]
    @bar  = args[:bar]
    @baz  = args[:baz]
    @qux  = args[:qux]
  end
end

hash = {
  :foo  => 1,
  :bar  => 2,
  :baz  => 3,
  :qux  => 4,
}

# All benchmarks were run on:
# * ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-darwin12.3.0]
# * Intel i7 2.2Ghz (MBP 8,2)

runs = ENV.fetch('RUNS', 5).to_i

Benchmark.ips(runs) do |x|
  # 14k/s
  x.report('OpenStruct') do
    OpenStruct.new(hash)
  end

  # 80k/s
  x.report('Class Clever') do
    CleverClass.new(hash)
  end

  # 185k/s
  x.report('HStruct') do
    PlainHStruct.new(hash)
  end

  # 380k/s
  x.report('Hash') do
    hash = {
      :foo  => 1,
      :bar  => 2,
      :baz  => 3,
      :qux  => 4,
    }
  end

  # 385k/s
  x.report('Class Hash Args') do
    HashArgsClass.new(hash)
  end

  # 470k/s
  x.report('Class Plain') do
    SimpleClass.new(1, 2, 3, 4)
  end

  # 620k/s
  x.report('Struct') do
    PlainStruct.new(1, 2, 3, 4)
  end
end

### This is how some of the more popular gems compare to the above:
#
# Virtus         => 12k/s (no coercions) & 17k/s (coercions)
# Hashr          => 20k/s
# FastOpenStruct => 30k/s
# Hashie::Dash   => 35k/s
# Hashie MI & MA => 100k/s


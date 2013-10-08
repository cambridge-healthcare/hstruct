require 'benchmark/ips'
require 'pry'

# All benchmarks were run on:
# * ruby ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
# * Intel i7 2.2Ghz (MBP 8,2)
#
#              Struct     56540 i/100ms
#               Class     50819 i/100ms
#                Hash     49196 i/100ms
#            HashArgs     48080 i/100ms
#       HashArgsFetch     44130 i/100ms
#             HStruct     22923 i/100ms
# InstanceVariableSet     17797 i/100ms
#          AttrExtras     16225 i/100ms
#          OpenStruct      3033 i/100ms

messages = ["\n"]

Benchmark.ips(ENV.fetch('RUNS', 1).to_i) do |x|
  hash = {
    :foo  => 1,
    :bar  => 2,
    :baz  => 3,
    :qux  => 4,
  }

  PlainStruct = Struct.new(:foo, :bar, :baz, :qux)
  x.report('Struct') do
    PlainStruct.new(1, 2, 3, 4)
  end

  class SimpleClass
    attr_reader :foo, :bar, :baz, :qux

    def initialize(foo, bar, baz, qux)
      @foo = foo
      @bar = bar
      @baz = baz
      @qux = qux
    end
  end
  x.report('Class') do
    SimpleClass.new(1, 2, 3, 4)
  end

  x.report('Hash') do
    hash = {
      :foo  => 1,
      :bar  => 2,
      :baz  => 3,
      :qux  => 4,
    }
  end

  class HashArgs
    attr_reader :foo, :bar, :baz, :qux

    def initialize(args)
      @foo  = args[:foo]
      @bar  = args[:bar]
      @baz  = args[:baz]
      @qux  = args[:qux]
    end
  end
  x.report('HashArgs') do
    HashArgs.new(hash)
  end

  class HashArgsFetch
    attr_reader :foo, :bar, :baz, :qux

    def initialize(args)
      @foo  = args.fetch(:foo)
      @bar  = args.fetch(:bar)
      @baz  = args.fetch(:baz)
      @qux  = args.fetch(:qux)
    end
  end
  x.report('HashArgsFetch') do
    HashArgsFetch.new(hash)
  end

  require_relative '../lib/hstruct'
  PlainHStruct = HStruct.new(:foo, :bar, :baz, :qux)
  x.report('HStruct') do
    PlainHStruct.new(hash)
  end

  class InstanceVariableSet
    attr_reader :foo, :bar, :baz, :qux

    def initialize(args)
      args.each { |k, v| instance_variable_set("@#{k}", v) }
    end
  end
  x.report('InstanceVariableSet') do
    InstanceVariableSet.new(hash)
  end

  begin
    require 'attr_extras'

    class AttrExtrasClass
      attr_initialize [:foo, :bar, :baz, :qux]
    end
    x.report('AttrExtras') do
      AttrExtrasClass.new(hash)
    end
  rescue LoadError
    messages << "Installing attr_extras gem will include it in the benchmarks"
  end

  require 'ostruct'
  x.report('OpenStruct') do
    OpenStruct.new(hash)
  end
end

puts messages

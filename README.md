[![travis](https://secure.travis-ci.org/cambridge-healthcare/hstruct.png)](https://travis-ci.org/cambridge-healthcare/hstruct)
[![Code Climate](https://codeclimate.com/github/cambridge-healthcare/hstruct.png)](https://codeclimate.com/github/cambridge-healthcare/hstruct)
# HStruct

Ruby Structs with the convenience of instantiating from a Hash.

It benchmarks about 3x slower than the plain object variant, but it's
3.5x faster than OpenStruct, 5x faster than Hashie and 120x faster than
Virtus. Most importantly, it needs significanlty less setup code than
all other gems. Here's the plain object version:

```ruby
class ClassWithArgsHash
  attr_accessor :foo, :bar, :baz, :qux

  def initialize(args)
    @foo  = args[:foo]
    @bar  = args[:bar]
    @baz  = args[:baz]
    @qux  = args[:qux]
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
```

And this is the **hstruct** equivalent:

```ruby
MyHStruct = HStruct.new(:foo, :bar, :baz, :qux)
```

The only gem faster than **hstruct** is
[attr_extras](https://github.com/barsoom/attr_extras). Even though
attr_extras is 30% quicker, it requires more setup code:

```ruby
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
```

## Usage

This is a super simple and straightforward gem. Here's a usage example
with a default value:

```ruby
HeartRate = HStruct.new(:patient_id, :bpm, :timestamp) do
  def initialize(args)
    super(args)
    self[:timestamp] ||= Time.now.utc.to_i
  end
end

[1] pry(main)> heart_rate = HeartRate.new(:patient_id => 1, :bpm => 88)
=> #<struct HeartRate patient_id=1, bpm=88, timestamp=1368786389>
[2] pry(main)> heart_rate.class
=> HeartRate
[3] pry(main)> heart_rate.patient_id
=> 1
[4] pry(main)> heart_rate.bpm
=> 88
[5] pry(main)> heart_rate.timestamp
=> 1368786389
[6] pry(main)> heart_rate.to_h
=> {:patient_id=>1, :bpm=>88, :timestamp=>1368786389}
```

## Benchmarks

There is a complete suite of benchmarks against the normal plain object
approach and the more popular gems. Run specific benchmarks eg `ruby
hstruct.rb`, or run them all: `ruby all.rb`

Benchmarks running on **Intel i7 2.2Ghz (MBP 8,2)** and **ruby 2.0.0p247
(2013-06-27 revision 41674) [x86_64-darwin12.4.0]**:

```
      ClassHashArgs   238075.1 (±9.4%) i/s -     237690 in   1.006158s
 ClassHashArgsFetch   223183.1 (±8.7%) i/s -     235035 in   1.060172s
    AttrExtrasClass   117151.4 (±3.1%) i/s -     124553 in   1.064184s
      ClassArgsSend   105091.4 (±4.2%) i/s -     107544 in   1.025204s
       PlainHStruct    83266.2 (±2.2%) i/s -      86724 in   1.042059s
        HashMissing    71163.5 (±3.7%) i/s -      76536 in   1.077050s
         OpenStruct    24342.6 (±6.1%) i/s -      24310 in   1.003123s
       HashieStruct    15659.2 (±3.7%) i/s -      16698 in   1.067853s
       VirtusStruct     6853.9 (±2.5%) i/s -       7359 in   1.074312s
```

## Installation

Add this line to your application's Gemfile:

    gem 'hstruct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hstruct

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

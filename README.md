Struct with the convenience of instantiating from a Hash.

When you care about speed, this is the Ruby structure that you've been
looking for. HStructs are faster than any other gem out there, but still
only half as fast as when compared to a Class with hash arguments.
To make up for it, you will end up writing less code and you will get
a `to_hash` method by default (no, you don't have to be running Ruby 2.0).

```ruby
class ClassWithArgsHash
  attr_reader :foo, :bar, :baz, :qux, :quux

  def initialize(args)
    @foo  = args[:foo]
    @bar  = args[:bar]
    @baz  = args[:baz]
    @qux  = args[:qux]
    @quux = args[:quux]
  end
end

```

And this is the HStruct equivalent:

```ruby
MyHStruct = HStruct.new(:foo, :bar, :baz, :qux, :quux)
```

If you're thinking about setting the class instance variables
dynamically, the performance penalty might surprise you (run the
benchmarks to see what I mean).

## Installation

Add this line to your application's Gemfile:

    gem 'hstruct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hstruct

## Usage

This is a surprisingly simple gem, just a few lines of code. Usage is
equally simple and straightforward. Here's an HStruct example with a
default value:

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
[6] pry(main)> heart_rate.to_hash
=> {:patient_id=>1, :bpm=>88, :timestamp=>1368786389}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

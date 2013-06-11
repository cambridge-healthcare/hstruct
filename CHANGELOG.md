### v0.6.0

* Support for hashes with string keys. We came across this problem when
  persisting a hash with symbol keys and were getting back string keys.
  Thanks @bestie!

* removed `to_hash`

### v0.5.0

* `to_h` deprecates `to_hash` method, should serve as a reminder about Ruby
  2.0. Thanks @bestie!

### v0.4.0

* leaving empty values out when converting to a hash was too intrusive.
  If you need that, do it in your own implementation, it's trivial

### v0.3.0

* it can be instantiated with no arguments

### v0.2.0

* when converting back to a hash, leave empty values out

### v0.1.0

Initial release

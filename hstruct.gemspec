# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hstruct"
  spec.version       = "0.1.0"
  spec.authors       = ["Gerhard Lazu"]
  spec.email         = ["gerhard@lazu.co.uk"]
  spec.description   = %q{Ruby Struct with the convenience of instantiating from a hash.}
  spec.summary       = %q{When you care about speed, this is the Ruby structure that you've been looking for.}
  spec.homepage      = "https://github.com/cambridge-healthcare/hstruct"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "benchmark-ips"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end

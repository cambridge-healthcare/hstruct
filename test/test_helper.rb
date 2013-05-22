require 'minitest/autorun'

Dir.glob('./test/**/*_spec.rb', &method(:require)) if __FILE__ == $0

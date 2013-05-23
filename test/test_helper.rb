require 'minitest/autorun'
require "minitest/reporters"
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

Dir.glob('./test/**/*_test.rb', &method(:require)) if __FILE__ == $0

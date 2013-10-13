require_relative 'benchmark'

class HashMissing < Hash
  def method_missing(method, *value)
    if value.any?
      self[method[0..-2].to_sym] = value.first
    else
      self[method] || super
    end
  end
end

benchmark.call(
  HashMissing.method(:[])
)

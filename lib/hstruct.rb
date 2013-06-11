class HStruct < Struct
  def initialize(args = {})
    raise ArgumentError unless args.is_a?(Enumerable)

    unless args.keys.first.is_a?(Symbol)
      args = args.each_with_object({}) do |(k,v), result|
        result[k.to_sym] = v
      end
    end

    super(*members.map { |m| args[m] })
  end

  def to_h
    Hash[each_pair.to_a]
  end
  alias_method :to_hash, :to_h
end

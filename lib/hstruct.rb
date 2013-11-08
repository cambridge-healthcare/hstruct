class HStruct < Struct
  def initialize(args = {})
    ensure_enumerable(args)

    args = args.each_with_object({}) do |(k,v), result|
      result[k.to_sym] = v
    end

    super(*members.map { |m| args[m] })
  end

  def update(args={})
    ensure_enumerable(args)

    args.each do |(k,v)|
      self[k.to_sym] = v
    end
    self
  end

  def ensure_enumerable(args)
    raise ArgumentError unless args.is_a?(Enumerable)
  end

  def to_h
    Hash[each_pair.to_a]
  end
end

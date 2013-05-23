class HStruct < Struct
  def initialize(args = nil)
    super(*members.map { |m| args[m] }) if args
  end

  def to_h
    Hash[each_pair.to_a]
  end
  alias_method :to_hash, :to_h
end

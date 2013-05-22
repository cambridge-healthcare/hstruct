class HStruct < Struct
  def initialize(args = nil)
    super(*members.map { |m| args[m] }) if args
  end

  def to_hash
    Hash[each_pair.to_a]
  end
end

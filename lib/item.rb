class Item
  attr_reader :name, :price

  def initialize(hash_info)
    @name = hash_info[:name]
    @price = hash_info[:price].delete('$').to_f
  end
end

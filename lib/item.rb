class Item
  attr_reader :name, :price
  def initialize(name_price)
    @name = name_price[:name]
    @price = name_price[:price].gsub("$", "").to_f
  end
end

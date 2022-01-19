class Item
  attr_reader :name, :price, :stock
  def initialize(item_info)
    @item_info = item_info
    @name = item_info[:name]
    @price = item_info[:price].delete("$").to_f
    @stock = 0
  end
end

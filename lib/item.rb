class Item
  attr_reader :name, :price, :item_stock
  def initialize(item_info)
    @item_info = item_info
    @name = item_info[:name]
    @price = item_info[:price].delete("$").to_f
    @item_stock = 0
  end
end

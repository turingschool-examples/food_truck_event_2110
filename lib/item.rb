class Item
  attr_reader :name, :price

  def initialize(item_attr)
    @name = item_attr[:name]
    @price = item_attr[:price]
  end
end

class Item
  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = item_price(attributes[:price])
  end

  def item_price(price)
    price.slice!(0)
    price.to_f.round(2)
  end
end

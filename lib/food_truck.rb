class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    item.stock
  end

  def stock(new_stock, amount)
    @inventory[new_stock] = amount
  end
end

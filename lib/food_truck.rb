class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @quantity = Hash.new(0)
  end

  def check_stock(item)
    @quantity[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
    @quantity[item] += quantity
  end

  def potential_revenue
    @inventory.sum {|key, value| (key.price * value)}
  end
end

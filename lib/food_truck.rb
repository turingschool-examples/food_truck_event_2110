class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.sum do|item, quantity|
      item.price * quantity
    end
  end

  def in_stock
    @inventory.map {|item, quantity| item if quantity > 0}
  end

  def sell(item, quantity)
    if quantity >= @inventory[item]
      @inventory[item] = 0
    else
      @inventory[item] -= quantity
    end
  end
end

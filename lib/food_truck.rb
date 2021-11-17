class FoodTruck
  attr_reader :name, :inventory, :check_stock
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory.values_at(item).join.to_i
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.sum do |item|
      item[0].price * item[1]
    end
  end
end

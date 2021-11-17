require './lib/item'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name      = name
    @inventory = Hash.new(0)
  end

  def stock(key, value)
    @inventory[key] += value
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    pot_revenue = 0
    @inventory.each do |item|
      pot_revenue += (item[0].price * item[1])
    end
    pot_revenue
  end

end

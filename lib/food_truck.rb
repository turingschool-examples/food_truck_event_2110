require './lib/item'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      return @inventory[item]
    else
      return 0
    end
  end

  def stock(item, qty)
    if @inventory.include?(item)
      @inventory[item] += qty
    else
      @inventory.store(item, qty)
    end
  end

  def potential_revenue
  totals = []
    @inventory.each do |key, value|
      totals << (value * key.price.delete_prefix("$").to_f)
    end
    totals.sum 
  end

end

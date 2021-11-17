class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory.values_at(item).join.to_i
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue

  end

end

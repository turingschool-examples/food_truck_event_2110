class FoodTruck

  attr_reader :name
  attr_accessor :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new{}
  end

  def check_stock(item)
    !@inventory.has_key?(item) ? 0 : @inventory[item]
  end

  def stock(item, qty)
    !@inventory.has_key?(item) ? @inventory[item] = qty : @inventory[item] += qty
  end

  def potential_revenue
    potential_revenue = 0
    @inventory.each_pair do |item, qty|
      potential_revenue += (item.price * qty)
    end
    potential_revenue
  end
end

class FoodTruck

  attr_reader :name, :inventory

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



end

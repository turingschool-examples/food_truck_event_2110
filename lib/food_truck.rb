class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(select_item)
    @inventory[select_item]
  end
  
  def stock(new_item, quantity)
    @inventory[new_item] += quantity
  end

  def potential_revenue
    @inventory.sum { |item, quantity| item.price * quantity }
  end
end
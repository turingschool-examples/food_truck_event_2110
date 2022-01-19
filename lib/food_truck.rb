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
    potential_cash = 0
    @inventory.each do |item, quantity|
      potential_cash += (item.price * quantity)
    end
    potential_cash
  end
end

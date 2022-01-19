class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    if @inventory.key?(item)
      @inventory[item] = (@inventory[item] + quantity)
    else
      @inventory[item] = quantity
    end
  end

  def potential_revenue
    potential_revenue = 0.0
    @inventory.each do |all_items|
      stock = all_items[1]
      price = all_items[0].price.delete("$")
      potential_revenue += (stock*price.to_f)
    end
    return potential_revenue
  end
end

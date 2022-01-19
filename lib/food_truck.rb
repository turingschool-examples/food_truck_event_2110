class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name      = name
    @inventory = Hash.new { |hash, key| hash[key] = 0 }
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    sum = 0
    @inventory.keys.map do |item|
      sum += (check_stock(item) * item.price)
    end
    return sum
  end

end

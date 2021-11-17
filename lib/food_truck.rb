class FoodTruck
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, count)
    @inventory[item] += count
  end

  def potential_revenue
    @inventory.sum do |item, count|
      item.price * count
    end
  end
end

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
    costs = @inventory.map do |k,v|
      k.price.slice!('$')
      k.price.to_f * v
    end
    costs.sum
  end
end

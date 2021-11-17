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
    total = 0
    @inventory.each do |k, v|
      total += (k.price[1..-1].to_f * v.to_i)
    end
    total
  end

end
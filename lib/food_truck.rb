class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name      = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory.values.sum
  end

  def stock(item, quantity)
    if @inventory.keys.include?(item)
      @inventory[item] += quantity
    else !@inventory.keys.include?(item)
      @inventory[item] = quantity
    end
  end

  def potential_revenue
    revenue_counter = 0
    @inventory.each_pair do |item, quantity|
      x = (item.price).delete("$").to_f
      revenue_counter += (x * quantity)
    end
    revenue_counter
  end
end
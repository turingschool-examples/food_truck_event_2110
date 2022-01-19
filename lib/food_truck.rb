class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.key?(item) == false
      0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    @inventory.reduce(0) do |sum, item|
      sum + (@inventory[item[0]] * item[0].price)
    end
  end
end

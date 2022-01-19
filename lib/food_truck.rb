class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def potential_revenue
    item_revenue = @inventory.map do |key, value|
      key.price * value
    end.sum
  end
end

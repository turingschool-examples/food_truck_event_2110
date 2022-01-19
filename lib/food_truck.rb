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
end

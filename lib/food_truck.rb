class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.keys.include?(item) == false
      return 0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    if @inventory.keys.include?(item) == false
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end
end 

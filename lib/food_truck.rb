class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    end

    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] ||= 0
    @inventory[item] += quantity
  end
end

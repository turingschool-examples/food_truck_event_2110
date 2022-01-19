class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @amount = Hash.new(0)
  end

  def check_stock(item)
    @amount[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
    @amount[item] += amount
  end

end

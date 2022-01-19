class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
    @stock = 0
  end

  def check_stock(_item)
    @stock
  end
end

class FoodTruck
  attr_reader :name, :inventory, :check_stock

  def initialize(name)
    @name = name
    @inventory = {}
    @check_stock = 0
  end

  def check_stock(stock)
    @check_stock
  end

end

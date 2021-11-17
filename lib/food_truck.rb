class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item_name)
    if @inventory.keys.include? item_name
      @inventory.values.sum
    else
      0
    end
  end
end

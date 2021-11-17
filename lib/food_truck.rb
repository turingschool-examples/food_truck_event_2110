class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item_obj, quantity)
    if @inventory[item_obj] == nil
      @inventory[item_obj] = quantity
    else
      @inventory[item_obj] += quantity
    end
   end

  def check_stock(item_obj)
    if @inventory.key?(item_obj)
      @inventory[item_obj]
    else
      @inventory[item_obj] = 0
    end
  end
end

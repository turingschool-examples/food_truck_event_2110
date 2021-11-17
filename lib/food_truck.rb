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

end

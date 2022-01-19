class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    # require "pry"; binding.pry
    if self.inventory[item].nil? then 0 else self.inventory[item] end
    end
end

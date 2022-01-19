class FoodTruck
  attr_reader :name, :inventory
def initialize(name)
  @name = name
  @inventory = {}
  end

  def check_stock(item)
    if inventory.include?(item) == false
      0
    elsif inventory.include?(item) == true
      inventory.each do |item, quantity|
        return quantity
      end
    end
  end

  def stock(item, quantity)
    inventory[item] = quantity
  end
end

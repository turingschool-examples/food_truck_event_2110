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
      inventory.each do |inventory_item, quantity|
        return quantity
      end
    end
  end

  def stock(item, quantity)
    if inventory.has_key?(item) == false
      inventory[item] = quantity
    elsif inventory.empty? == false
      inventory.each do |inventory_item, stock_quantity|
      inventory[item] = stock_quantity += quantity
      end
    end
  end

  def potential_revenue
    inventory.sum do |item, quantity|
      item.price.delete('$,').to_f * quantity
    end
  end
end

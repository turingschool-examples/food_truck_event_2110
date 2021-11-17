require './item'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if inventory.keys.include?(item)
      return inventory[item]
    else
      return 0
    end
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.map{|item, item_count| item.price.delete_prefix('$').to_f * item_count}.sum
  end

  def inventory_list
    inventory.keys.map{|item| item.name}.sort
  end
end

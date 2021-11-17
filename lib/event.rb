class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.append(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def total_items
    @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
  end

  def item_quant(item)
    @food_trucks.map do |truck|
      truck.inventory[item]
    end.sum
  end

  def item_details(item)
    hash = Hash.new(0)
    hash[:quantity] = item_quant(item)
    hash[:food_trucks] = food_trucks_that_sell(item)
    hash
  end

  def total_inventory
    inventory_hash = Hash.new
    total_items.each do |item|
      inventory_hash[item] = item_details(item)
    end
    inventory_hash
  end

  def overstocked_items
    total_items.select do |item|
      total_inventory[item][:quantity] > 50 && total_inventory[item][:food_trucks].count > 1
    end
  end

end

class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
        food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
        food_truck.inventory.include?(item)
    end
  end

  def sum_quantities(item)
    @food_trucks.map do |food_truck|
        food_truck.inventory[item]
    end.compact.sum
  end

  def total_inventory
    inventory_hash = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        inventory_hash[item] = {quantity: sum_quantities(item), food_trucks: food_trucks_that_sell(item)}
      end
    end
    inventory_hash
  end

  def overstocked_items
    items_array = []
    total_inventory.each do |item, item_quantity|
      items_array << item if item_quantity[:food_trucks].size > 1 && item_quantity[:quantity] > 50
    end
    items_array
  end
end

class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.keys.include?(item)
    end
  end

  def total_quantity_of_inventory(item)
    @food_trucks.map do |truck|
      truck.inventory[item]
    end.sum
  end

  def total_inventory
    # require "pry"; binding.pry
  end

  def sorted_item_list
    truck_array = @food_trucks.map do |truck|
      truck.inventory.keys.flatten
    end
    truck_array.uniq

  end
end
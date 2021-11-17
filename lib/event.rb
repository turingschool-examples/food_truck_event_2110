class Event
  attr_reader :name, :food_trucks

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
    @food_trucks.select do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  # UNFINISED
  def total_inventory
    items = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |food_item, quantity|
        items[food_item] = {}
        items[food_item][:truck] = []
        items[food_item][:truck] << food_truck
        items[food_item][:quantity] = quantity
        # require "pry"; binding.pry
      end
    end
    items
  end

  def sorted_item_list
    @food_trucks.map do |food_truck|
      food_truck.inventory.map do |food_item|
        food_item[0].name
      end
    end.flatten.uniq.sort
  end

  # UNFINISHED
  def overstocked_items
    @food_trucks.each do |food_truck|
      food_truck.inventory.select do |food_item, _quantity|
        food_item.name

        # require "pry"; binding.pry
      end
    end
  end
end

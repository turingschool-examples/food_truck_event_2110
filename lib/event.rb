require './lib/food_truck'

class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all { |food_truck| food_truck.inventory.include?(item) }
  end

  def sorted_item_list
    items = @food_trucks.flat_map { |food_truck| food_truck.inventory.keys }
    items.uniq!
    items = items.map { |item| item.name }
    items.sort
  end

end

require './food_truck'

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
    @food_trucks.map{|food_truck| food_truck.name}.sort
  end

  def food_trucks_that_sell(item)
    @food_trucks.select{|food_truck| food_truck.check_stock(item) > 0}
  end

  def sorted_items_list
    @food_trucks.flat_map{|food_truck| food_truck.inventory_list}.uniq.sort
  end
end

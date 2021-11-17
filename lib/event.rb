class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks << food_truck
  end

  def food_truck_names
    truck_names = []
    food_trucks.each do |food_truck|
      truck_names << food_truck.name
    end
    truck_names
  end

  def food_trucks_that_sell(item)
    selling_food_trucks = []
    food_trucks.each do |food_truck|
      if food_truck.inventory.include?(item) == true
        selling_food_trucks << food_truck
      end
    end
    selling_food_trucks
  end
end

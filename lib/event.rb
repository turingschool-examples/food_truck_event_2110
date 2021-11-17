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
end

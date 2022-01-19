class Event
  attr_reader :name, :food_trucks, :food_truck_names
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    # binding.pry
    names = []
    @food_trucks.map do |food_truck|
      names << food_truck.name
    end
    names
  end
end

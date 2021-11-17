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
    food_truck_name_array = []
    @food_trucks.each do |truck|
      food_truck_name_array << truck.name
    end
    food_truck_name_array
  end

end

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck_object)
    @food_trucks << food_truck_object
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item_object)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include? item_object
    end
  end

end

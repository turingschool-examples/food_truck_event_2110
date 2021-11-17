class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck_obj)
    @food_trucks << food_truck_obj
  end

  # Return all truck names as an array
  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  # Select trucks who's inventory has an existing
  # key of our given obj

  # Does not account for an empty quantity of said key
  def food_trucks_that_sell(item_obj)
    food_trucks_arr = @food_trucks.select do |truck|
      truck.inventory.key?(item_obj)
    end
  end


end

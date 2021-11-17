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

  def food_trucks_that_sell(item)
    trucks_that_sell_it = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        trucks_that_sell_it << truck
      end
    end
    trucks_that_sell_it
  end

end

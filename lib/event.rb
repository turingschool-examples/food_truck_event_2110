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
    names = @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
  #   trucks = @food_trucks.select do |truck|
  #     truck.inventory.select do |food|
  #       food.name == item.name
  #   end
  # end
    trucks = []
    @food_trucks.each do |truck|
      truck.inventory.each do |food|
        if food[0].name == item.name
          trucks << truck
        end
      end
    end
    # require 'pry'; binding.pry
  end


end

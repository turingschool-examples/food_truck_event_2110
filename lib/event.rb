class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []

  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
    #require 'pry';binding.pry
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    trucks_by_item = []
    @food_trucks.each do |truck|
      if truck.inventory.key?(item)
        trucks_by_item << truck
      end
    end
    return trucks_by_item
  end



end

class Event
  attr_reader :name, :food_trucks
  attr_accessor

  def initialize(name)
    @name = name
    @food_trucks = []
  end


  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    collector = []
    @food_trucks.each do |truck|
      collector << truck.name
    end
    return collector
  end

  def food_trucks_that_sell(item)
    collector = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        collector << truck
      end
    end
    return collector
  end
  
end

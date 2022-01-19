class Event

 attr_reader :name, :food_trucks

 def initialize(name)
  @name = name
  @food_trucks = []
 end

 def add_food_truck(truck)
   @food_trucks << truck
 end

 def food_truck_names
  @food_trucks.map { |truck| truck.name}
 end

 def food_trucks_that_sell(item)
   trucks_that_sell = []
  @food_trucks.each do |truck|
    truck.inventory.select do |object|
    trucks_that_sell << truck if object.name == item.name
    end
    end
  return trucks_that_sell
  end
end

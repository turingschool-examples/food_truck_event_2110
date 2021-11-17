class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    trucks_with_inventory = []
    @food_trucks.each do |truck|
      truck.inventory.each do |thing|
        if thing[0].name == item.name
          trucks_with_inventory.push(truck)
        end
      end
    end
    trucks_with_inventory
  end
end

class Event
  attr_reader :name, 
              :food_trucks

  def initialize(name)
    @name        = name 
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.map do |truck| 
      truck.inventory.map do |item1, quantity| 
        if item == item1 
          truck
        end
      end
    end.flatten.compact
  end

  def total_inventory 
    
  end
end
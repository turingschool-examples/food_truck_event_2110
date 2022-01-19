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
    names = @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def total_inventory
    item_keys = @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
    inv = {}
    item_keys.map do |item|
      inv[item] = {
                    quantity: food_trucks_that_sell(item).sum {|truck| truck.inventory[item]},
                    food_trucks: food_trucks_that_sell(item)
                  }
    end
    inv
  end
end

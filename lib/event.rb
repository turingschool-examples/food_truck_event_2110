class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map {|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    hash = {}
    @food_trucks.map do |truck|
      truck.inventory.keys.flat_map do |item|
        hash[item] = {food_trucks: food_trucks_that_sell(item),
          quantity: food_trucks_that_sell(item).sum {|truck| truck.check_stock(item)}}
      end
    end
    # require "pry"; binding.pry
    hash
  end

  def overstocked_items
    total_inventory.keys.select do |key|
      food_trucks_that_sell(key).length > 1 &&
      food_trucks_that_sell(key).sum {|truck| truck.check_stock(key)} > 50
      # require "pry"; binding.pry
    end
  end

  def sorted_item_list
    item_names = total_inventory.keys.map {|key| key.name}
    # require "pry"; binding.pry
    item_names.sort
  end

end

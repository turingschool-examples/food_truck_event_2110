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
    @food_trucks.map do |food_truck|
      # require "pry"; binding.pry
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
        # require "pry"; binding.pry
       food_truck if food_truck.inventory.include?(item)
    end
  end


  def total_inventory
    result_hash = {}
    # require "pry"; binding.pry
      @food_trucks.map do |food_truck|
        food_truck.inventory.map do |item, amount|
          # require "pry"; binding.pry
          result_hash[item] = {quantity: total_sum(item), food_trucks: food_trucks_that_sell(item)}

      end
    end
    result_hash

  end

  def total_sum(item)
    total = @food_trucks.map do |food_truck|
      food_truck.inventory[item]
      # require "pry"; binding.pry
    end
    total.compact.sum
  end

  def overstocked_items
    @food_trucks.map do |food_truck|
      # require "pry"; binding.pry
      food_truck.inventory.map do |item, value|
        # require "pry"; binding.pry
        # Might need total inventory
      end
    end
  end
end

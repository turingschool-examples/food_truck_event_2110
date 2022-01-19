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
    total_inventory.select do |item, value|
      # require "pry"; binding.pry
      return [item] if value[:food_trucks].length > 1 && total_sum(item) > 50
      # require "pry"; binding.pry
    end

  end

  def sorted_item_list
    # total_inventory.map do |item|
    total_inventory.map do |key, value|
      # require "pry"; binding.pry
      key.name
    end.sort

  end
end

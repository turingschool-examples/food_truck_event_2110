class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks << food_truck
  end

  def food_truck_names
    food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def item_sum_at_event(item)
    array_to_sum = []
    food_trucks.each do |food_truck|
      if food_truck.inventory.include?(item)
        food_truck.inventory.each do |stock_item, quantity|
          if item == stock_item then  array_to_sum << quantity
          end
        end
      end
    end
    array_to_sum.sum
  end

  def total_inventory
    hash = {}
    food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, inventory|
        sub_hash = {}
        if hash.has_key?(item) == false
        sub_hash[:quantity] = item_sum_at_event(item)
        sub_hash[:food_trucks] = food_trucks_that_sell(item)
        hash[item] = sub_hash
        end
      end
    end
    hash
  end
end

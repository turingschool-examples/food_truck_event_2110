require 'pry'

class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
    @total_inventory = Hash.new(0)
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
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

  def sorted_item_list
    names = []
    food_trucks.each do |truck|
      truck.inventory.each do |item|
        names << item.first.name
      end
    end
    names.uniq.sort
  end

  def total_inventory
    food_items = []
    food_trucks.each do |truck|
      truck.inventory.each do |item|
        food_items << item.first
      end
    end
    # gather the trucks with that item
    food_items.uniq.each_with_object({}) do |food_item, hash|
      hash[:food_trucks] = food_trucks_that_sell(food_item)
      @total_inventory[(food_item)] = hash
    end

    food_items.each do |food_item|
      food_trucks_that_sell(food_item).each_with_object(Hash.new(0)) do |truck, hash|
        hash[:quantity] += truck.check_stock(food_item)
        binding.pry
        @total_inventory[(food_item)]

        # find all trucks which sell the food.
        # add up the quantity of food stock across all trucks.


      end
    end
  end
end

require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory  #come back later
    inventory_hash = Hash.new(0)
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        values = Hash.new(0)
        values[:quanity] += item[1]
        values[food_trucks] = []
        if truck.inventory.any?(item)
          values[food_trucks] << truck
        end
        inventory_hash[item] = values
      end
    end
    inventory_hash
  end





end

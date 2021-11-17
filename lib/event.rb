require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    all_inventory = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item|
        all_inventory << item
      end
    end
    alphabetically = []
    all_inventory.sort_by do |item|
      alphabetically << item[0].name
    end
    alphabetically.uniq
  end
end

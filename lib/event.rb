require 'pry'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_name
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.map do |truck|
      if truck.inventory.include?(item)
        truck
      end
    end
  end

  def total_iventory

  end

  def overstocked_items
    a = 0
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item|
        binding.pry
      end
    end
  end
end

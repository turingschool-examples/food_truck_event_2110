require 'pry'
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
    @food_trucks.map {|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    trucks_with = []
    @food_trucks.each do |food_truck|
      if food_truck.inventory.key?(item)
        trucks_with << food_truck
      end
    end
    trucks_with
  end

  def total_inventory
    event_inventory = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        if !event_inventory.key?(item)
          event_inventory[item] = {quantity: 0, food_trucks: []}
          event_inventory[item][:quantity] += amount
          event_inventory[item][:food_trucks] << food_truck
        elsif
          event_inventory.key?(item)
          event_inventory[item][:quantity] += amount
          event_inventory[item][:food_trucks] << food_truck
        end
      end
    end
    event_inventory
    #binding.pry
  end

  def overstocked_items
    overstocked = []
    total_inventory.each do |item, count_trucks|
      if count_trucks[:quantity] > 50 && count_trucks[:food_trucks].count > 1
          overstocked << item
      end
    end
    overstocked
  end
end

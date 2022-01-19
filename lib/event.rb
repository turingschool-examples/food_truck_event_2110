require './lib/item'
require './lib/food_truck'
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

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select {|truck| truck.inventory.include? item }
  end

  def total_inventory
    available=Hash.new
    @food_trucks.each do |truck|
      truck.inventory.each do |item,quantity|
        total_amount_available = food_trucks_that_sell(item).sum do |truck_with|
          truck_with.inventory[item]
        end
        available[item] = {trucks: food_trucks_that_sell(item), amount: total_amount_available}
      end
    end
    available
  end
end

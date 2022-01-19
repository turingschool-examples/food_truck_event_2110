require './lib/item'
require './lib/food_truck'
require 'pry'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end




  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end
end

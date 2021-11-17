require './lib/food_truck'

class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all { |food_truck| food_truck.inventory.include?(item) }
  end

  def items
    items = @food_trucks.flat_map { |food_truck| food_truck.inventory.keys }.uniq
  end

  def sorted_item_list
    names = self.items.map { |item| item.name }
    names.sort
  end

  def total_inventory
    hash = {}
    self.items.each do |item|
      hash[item] = {
        quantity: @food_trucks.sum { |food_truck| food_truck.inventory[item] },
        food_trucks: self.food_trucks_that_sell(item)
      }
    end
    hash
  end

end
